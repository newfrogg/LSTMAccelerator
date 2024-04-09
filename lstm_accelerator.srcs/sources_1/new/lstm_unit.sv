`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/05/2024 03:52:50 PM
// Design Name: 
// Module Name: lstm_unit
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module lstm_unit #( parameter W_BITWIDTH = 8,
                    parameter IN_BITWIDTH = W_BITWIDTH,
                    parameter OUT_BITWIDTH = 32,
                    parameter PREV_SUM_BITWIDTH = OUT_BITWIDTH)(
                    input                                   clk,
                    input                                   rstn,
                    input                                   en,
                    input                                   is_last_input,
                    input                                   is_last_data_gate,
                    input                                   is_continued,
                    input                                   is_load_bias,
                    input                                   is_load_cell,
                    input  [1:0]                            type_gate,
                    input  [W_BITWIDTH-1:0]                 weights_0,
                    input  [W_BITWIDTH-1:0]                 weights_1, 
                    input  [W_BITWIDTH-1:0]                 weights_2,  
                    input  [IN_BITWIDTH-1:0]                data_in_0,
                    input  [IN_BITWIDTH-1:0]                data_in_1,
                    input  [IN_BITWIDTH-1:0]                data_in_2,
                    input  [PREV_SUM_BITWIDTH-1:0]          pre_sum,
                    output logic                            is_waiting,
                    output logic                            done,
                    output logic [OUT_BITWIDTH-1:0]         out [0:3],
                    output logic [2:0]                      o_lstm_state
    );
    
    localparam
        QUANTIZE_SIZE       = 8,
        BUFFER_SIZE         = 32,
        
        STATE_IDLE          = 3'b000,
        STATE_RECEIVE_DATA  = 3'b001,
        STATE_IRB           = 3'b010,
        STATE_GATE          = 3'b011,
        STATE_CELL          = 3'b100,
        STATE_HIDDEN        = 3'b101,
        STATE_WAIT          = 3'b110,
        STATE_FINISH        = 3'b111,
        
        INPUT_GATE          = 2'b00,
        FORGET_GATE         = 2'b01,
        CELL_UPDATE         = 2'b10,
        OUTPUT_GATE         = 2'b11,
        
        LATENCY             = 1;
        
    
    logic   [2:0]   state;
    logic           receive_data_done;
//    logic           run_done;
    logic           irb_done;
    logic           gate_done;
    logic           cell_done;
    logic           hidden_done;
    logic           wait_done;
    logic           finish_done;
    
    logic           remain_waiting_time;
    
    logic   [BUFFER_SIZE-1:0]       accu_input_bf;
    logic   [BUFFER_SIZE-1:0]       accu_forget_bf;
    logic   [BUFFER_SIZE-1:0]       accu_cell_bf;
    logic   [BUFFER_SIZE-1:0]       accu_output_bf;
    logic   [BUFFER_SIZE-1:0]       accu_bf;
    
    logic   [QUANTIZE_SIZE-1:0]     cell_update;
    logic   [QUANTIZE_SIZE-1:0]     input_gate;
    logic   [QUANTIZE_SIZE-1:0]     forget_gate;
    logic   [QUANTIZE_SIZE-1:0]     output_gate;
    logic   [QUANTIZE_SIZE-1:0]     prev_cell_bf;
    
    logic   [OUT_BITWIDTH-1:0]      cell_state;  
    
    logic   [QUANTIZE_SIZE-1:0]     sigmoid_bf;
    logic   [QUANTIZE_SIZE-1:0]     cell_update_bf;
     
    logic  [1:0]                            gate;
    logic  [1:0]                            count_gate;
    
    logic                                   mac_en;
    logic  [W_BITWIDTH-1:0]                 weights_bf_0;
    logic  [W_BITWIDTH-1:0]                 weights_bf_1; 
    logic  [W_BITWIDTH-1:0]                 weights_bf_2;  
    logic  [IN_BITWIDTH-1:0]                data_in_bf_0;
    logic  [IN_BITWIDTH-1:0]                data_in_bf_1;
    logic  [IN_BITWIDTH-1:0]                data_in_bf_2;
    logic  [OUT_BITWIDTH-1:0]               pre_sum_bf;
    logic                                   mac_done;
    logic  [OUT_BITWIDTH-1:0]               mac_result;
    
    assign o_lstm_state = state;
    
    MAC #(.W_BITWIDTH(W_BITWIDTH), .OUT_BITWIDTH(OUT_BITWIDTH)) u_mac (
        .clk(clk),
        .rstn(rstn),
        .en(mac_en),
        .weights_0(weights_bf_0),
        .weights_1(weights_bf_1),
        .weights_2(weights_bf_2),
        .data_in_0(data_in_bf_0),
        .data_in_1(data_in_bf_1),
        .data_in_2(data_in_bf_2),
        .pre_sum(pre_sum_bf),
        .done(mac_done),
        .out(mac_result)
    );
    
    tanh #(.IN_BITWIDTH(IN_BITWIDTH), .OUT_BITWIDTH(OUT_BITWIDTH)) u_tanh (
        .data_in(accu_cell_bf),
        .data_out(cell_update_bf)
    );
    
    sigmoid #(.IN_BITWIDTH(IN_BITWIDTH), .OUT_BITWIDTH(OUT_BITWIDTH)) u_sigmoid (
        .data_in(accu_bf),
        .data_out(sigmoid_bf)
    );
    
    always @(posedge clk or negedge rstn) begin
        if (!rstn) begin
            state       <= 3'b000;
            
            receive_data_done   <= 1'b0;
            irb_done            <= 1'b0;
            gate_done           <= 1'b0;
            cell_done           <= 1'b0;
            hidden_done         <= 1'b0;
            wait_done           <= 1'b0;
            finish_done         <= 1'b0;
            count_gate          <= 2'b00;
            
            remain_waiting_time    <= LATENCY;
            
            weights_bf_0           <= {W_BITWIDTH{1'b0}};
            weights_bf_1           <= {W_BITWIDTH{1'b0}};
            weights_bf_2           <= {W_BITWIDTH{1'b0}};
            data_in_bf_0           <= {IN_BITWIDTH{1'b0}};
            data_in_bf_1           <= {IN_BITWIDTH{1'b0}};
            data_in_bf_2           <= {IN_BITWIDTH{1'b0}};
            pre_sum_bf             <= {PREV_SUM_BITWIDTH{1'b0}};
            accu_bf                <= {BUFFER_SIZE{1'b0}};
            
            done                   <= 1'b0;
        end
        else begin
            case(state) 
                STATE_IDLE: begin
                    receive_data_done   <= 1'b0;
                    irb_done            <= 1'b0;
                    gate_done           <= 1'b0;
                    cell_done           <= 1'b0;
                    hidden_done         <= 1'b0;
                    wait_done           <= 1'b0;
                    finish_done         <= 1'b0;
                    done                <= 1'b0;
                    
                    accu_input_bf       <= 0;
                    accu_forget_bf      <= 0;
                    accu_cell_bf        <= 0;
                    accu_output_bf      <= 0;
                    accu_bf             <= {BUFFER_SIZE{1'b0}};
                    
                    remain_waiting_time <= LATENCY;
                    
                    if (en && !done) begin
                        weights_bf_0    <= weights_0;
                        weights_bf_1    <= weights_1;
                        weights_bf_2    <= weights_2;
                        data_in_bf_0    <= data_in_0;
                        data_in_bf_1    <= data_in_1;
                        data_in_bf_2    <= data_in_2;
                        prev_cell_bf    <= {QUANTIZE_SIZE{1'b0}};
                        
                        case(is_load_bias)
                            0: pre_sum_bf       <= accu_bf[PREV_SUM_BITWIDTH-1:0];
                            1: pre_sum_bf       <= pre_sum;
                        endcase
                        gate            <= type_gate;
                        state           <= STATE_IRB;
                        is_waiting      <= 1'b0;
                        count_gate      <= 2'b00;
                    end
                end
                
                STATE_IRB: begin
                    if (irb_done) begin
                        if (is_last_data_gate && is_last_input) begin
                            state           <= STATE_GATE;
                            is_waiting      <= 1'b0;
                            
                            case(gate)
                                INPUT_GATE:     accu_input_bf   <= mac_result;
                                FORGET_GATE:    accu_forget_bf  <= mac_result;
                                CELL_UPDATE:    accu_cell_bf    <= mac_result;
                                OUTPUT_GATE:    accu_output_bf  <= mac_result;
                            endcase
                        end
                        else begin
                            state           <= STATE_WAIT;
                            is_waiting      <= 1'b1;
                            irb_done        <= 1'b0;
                            accu_bf         <= mac_result;
                        end               
                    end
                    else begin
                        mac_en          <= 1'b1;       
                        if (mac_done) begin
                            irb_done    <= 1'b1;
                            mac_en      <= 1'b0;
                        end
                        else ;
                    end
                end
               
                STATE_WAIT: begin
                    is_waiting          <= 1'b0;
                    if (remain_waiting_time == 0) begin
                        if (is_continued == 1) begin
                            state           <= STATE_IRB;
                            weights_bf_0    <= weights_0;
                            weights_bf_1    <= weights_1;
                            weights_bf_2    <= weights_2;
                            data_in_bf_0    <= data_in_0;
                            data_in_bf_1    <= data_in_1;
                            data_in_bf_2    <= data_in_2;
                            case(is_load_bias)
                                0: pre_sum_bf       <= accu_bf[PREV_SUM_BITWIDTH-1:0];
                                1: pre_sum_bf       <= pre_sum;
                            endcase
                            
                            case(is_load_cell)
                                1: prev_cell_bf <= pre_sum[QUANTIZE_SIZE-1:0];
                                0: prev_cell_bf <= {QUANTIZE_SIZE{1'b0}}; 
                            endcase
                            
                            remain_waiting_time     <= LATENCY;
                        end
                        else begin
                            state      <= STATE_WAIT;
                            if (gate != type_gate) begin
                                case(gate)
                                    INPUT_GATE:     accu_input_bf   <= accu_bf;
                                    FORGET_GATE:    accu_forget_bf  <= accu_bf;
                                    CELL_UPDATE:    accu_cell_bf    <= accu_bf;
                                    OUTPUT_GATE:    accu_output_bf  <= accu_bf;
                                endcase
                                
                                case(type_gate)
                                    INPUT_GATE:     accu_bf <= accu_input_bf;
                                    FORGET_GATE:    accu_bf <= accu_forget_bf;
                                    CELL_UPDATE:    accu_bf <= accu_cell_bf;
                                    OUTPUT_GATE:    accu_bf <= accu_output_bf;
                                endcase
                                
                                gate    <= type_gate;
                            end
                            else gate   <= type_gate;
                        end
                    end
                    else remain_waiting_time <= remain_waiting_time - 1;
                end
                
                STATE_GATE: begin
                    if (gate_done) begin
                        state           <= STATE_CELL;
                        weights_bf_0    <= forget_gate;
                        weights_bf_1    <= input_gate;
                        weights_bf_2    <= {W_BITWIDTH{1'b0}};
                        data_in_bf_0    <= prev_cell_bf;
                        data_in_bf_1    <= cell_update;
                        data_in_bf_2    <= {IN_BITWIDTH{1'b0}};
                        pre_sum_bf      <= {PREV_SUM_BITWIDTH{1'b0}};
                    end
                    else begin
                        if (count_gate == 2'b11) begin
                            gate_done       <= 1'b1;
                            cell_update     <= cell_update_bf;
                        end
                        else count_gate  <= count_gate + 1;
                        
                        case(gate)
                            INPUT_GATE: begin
                                input_gate  <= sigmoid_bf;
                                accu_bf     <= accu_forget_bf;
                                gate        <= FORGET_GATE;
                            end
                            FORGET_GATE: begin
                                forget_gate <= sigmoid_bf;
                                accu_bf     <= accu_output_bf;
                                gate        <= OUTPUT_GATE;
                            end
                            OUTPUT_GATE: begin
                                output_gate <= sigmoid_bf;
                                accu_bf     <= accu_input_bf;
                                gate        <= INPUT_GATE;
                            end
                        endcase
                    end
                end
                
                STATE_CELL: begin
                    if (cell_done) begin
                        state           <= STATE_FINISH;
                        cell_done       <= 1'b0;
                        done            <= 1'b1;
                        cell_state      <= mac_result;               
                    end
                    else begin
                        mac_en          <= 1'b1;       
                        if (mac_done) begin
                            cell_done   <= 1'b1;
                            mac_en      <= 1'b0;
                        end
                        else ;
                    end
                    
                end
                
                STATE_HIDDEN: begin
                
                end
                
                STATE_FINISH: begin
                    if (finish_done) begin
                        state           <= STATE_IDLE;
                        finish_done     <= 1'b0;
                        done            <= 1'b1;
                    end
                    else begin
                        out[0]          <= accu_input_bf;
                        out[1]          <= accu_forget_bf;
                        out[2]          <= accu_cell_bf;
                        out[3]          <= accu_output_bf;
                        finish_done     <= 1'b1;
                    end
                end
            endcase
        end
    end
    
endmodule

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/05/2024 03:54:04 PM
// Design Name: 
// Module Name: controller
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


module controller(
    input               clk,
    input               rstn,
    input               r_valid,
//    input [1:0]         type_read,
    input [31:0]        data_in,
    output logic        t_valid,
    output logic [31:0] out_data,
    output logic [2:0]  o_state,
    output logic        o_lstm_unit_done,
    output logic [2:0]  o_lstm_state,
    output logic        o_lstm_is_continued,
    output logic        o_lstm_is_waiting,
    output logic [7:0]  weights [0:2],
    output logic [7:0]  inputs  [0:2],
    output logic [18:0] bias,
    output logic        o_is_load_bias,
    output logic [3:0]  o_index,
    output logic [1:0]  o_mac_state,
    output logic        o_is_last_input,
    output logic [31:0] o_lstm_accu_bf
);

    localparam
        W_BITWIDTH              = 8,
        IN_BITWIDTH             = 8,
        OUT_BITWIDTH            = 20,
        SIZE_BUFFER             = 10,
        
        STATE_IDLE              = 3'd0,
        STATE_RDATA             = 3'd1,
        STATE_RUN               = 3'd2,
        STATE_WBACK             = 3'd3,
        STATE_FINISH            = 3'd4,
        
        
        WREAD                   = 2'd0,
        IREAD                   = 2'd1,
        BREAD                   = 2'd2,
        LOAD                    = 2'd3,
        
        LDATA                   = 1'd0,
        WDATA                   = 1'd1;
    
    
    
    logic [1:0]                             r_state;
    logic                                   w_state;
    logic [2:0]                             state;
    
    logic [1:0]                             counter;
    
    logic                                   data_receive_done;
    logic                                   data_load_done;
    logic                                   run_done;
    logic                                   finish_done;
    
    logic                                   is_continued;
    logic                                   is_last_input;
    logic                                   is_load_bias;
    logic                                   lstm_is_waiting;
    // Signals for lstm unit
    
    logic   [W_BITWIDTH*3-1:0]              weight_bf   [0:SIZE_BUFFER-1];
    logic   [W_BITWIDTH*3-1:0]              input_bf    [0:SIZE_BUFFER-1];
    logic   [31:0]                          bias_bf;
    
    logic   [3:0]                           current_buffer_index;
    logic   [3:0]                           current_weight_index;
    logic   [3:0]                           current_input_index;
    logic                                   current_bias_index;  
    
//    logic   [1:0]                           type_read;
    
    logic                                   lstm_unit_en;
    logic  [W_BITWIDTH-1:0]                 weights_0;
    logic  [W_BITWIDTH-1:0]                 weights_1; 
    logic  [W_BITWIDTH-1:0]                 weights_2;  
    logic  [IN_BITWIDTH-1:0]                data_in_0;
    logic  [IN_BITWIDTH-1:0]                data_in_1;
    logic  [IN_BITWIDTH-1:0]                data_in_2;
    logic  [OUT_BITWIDTH-2:0]               pre_sum;
    logic                                   lstm_unit_done;
    logic  [31:0]                           lstm_unit_result [0:3];
    
//    logic  [31:0]                           accu_bf;
    
    assign o_state = state;
    assign weights[0] = weights_0;
    assign weights[1] = weights_1;
    assign weights[2] = weights_2;
    assign inputs[0]  = data_in_0;
    assign inputs[1]  = data_in_1;
    assign inputs[2]  = data_in_2;
    assign bias       = pre_sum;
    assign o_is_load_bias = is_load_bias;
    assign o_index    = current_buffer_index;
    assign o_mac_state = u_lstm_unit.u_mac.state;
    assign o_is_last_input = is_last_input;
    assign o_lstm_accu_bf = u_lstm_unit.accu_bf;
    
    lstm_unit #(.W_BITWIDTH(W_BITWIDTH), .OUT_BITWIDTH(OUT_BITWIDTH)) u_lstm_unit (
        .clk(clk),
        .rstn(rstn),
        .en(lstm_unit_en),
        .last_input(is_last_input),
        .is_continued(is_continued),
        .is_load_bias(is_load_bias),
        .type_gate(0),
        .weights_0(weights_0),
        .weights_1(weights_1),
        .weights_2(weights_2),
        .data_in_0(data_in_0),
        .data_in_1(data_in_1),
        .data_in_2(data_in_2),
        .pre_sum(pre_sum),
        .is_waiting(lstm_is_waiting),
        .done(lstm_unit_done),
        .out(lstm_unit_result),
        .o_lstm_state(o_lstm_state)
    );
    
    assign o_lstm_is_continued = is_continued;
    assign o_lstm_is_waiting = lstm_is_waiting;
    assign o_lstm_unit_done = lstm_unit_done;
    // implement FSM for controller
    always @(posedge clk or negedge rstn) begin
        if (!rstn) begin
            state               <= STATE_IDLE;
            
            data_receive_done   <= 1'b0;
            run_done            <= 1'b0;
            finish_done         <= 1'b0;
            counter             <= 2'b0;
            
            weights_0           <= {W_BITWIDTH{1'b0}};
            weights_1           <= {W_BITWIDTH{1'b0}};
            weights_2           <= {W_BITWIDTH{1'b0}};
            data_in_0           <= {IN_BITWIDTH{1'b0}};
            data_in_1           <= {IN_BITWIDTH{1'b0}};
            data_in_2           <= {IN_BITWIDTH{1'b0}};
            pre_sum             <= {(OUT_BITWIDTH-1){1'b0}};
        end
        else begin
            case(state)
                STATE_IDLE: begin
                    weights_0           <= {W_BITWIDTH{1'b0}};
                    weights_1           <= {W_BITWIDTH{1'b0}};
                    weights_2           <= {W_BITWIDTH{1'b0}};
                    data_in_0           <= {IN_BITWIDTH{1'b0}};
                    data_in_1           <= {IN_BITWIDTH{1'b0}};
                    data_in_2           <= {IN_BITWIDTH{1'b0}};
                    pre_sum             <= {(OUT_BITWIDTH-1){1'b0}};
            
                    data_receive_done   <= 1'b0;
                    data_load_done      <= 1'b0;
                    run_done            <= 1'b0;
                    finish_done         <= 1'b0;
                    counter             <= 2'b0;
                    t_valid             <= 1'b0;
                    is_load_bias        <= 1'b0;
                    is_last_input       <= 1'b0;
                    
                    current_weight_index    <= 4'b0;
                    current_input_index     <= 4'b0;
                    current_buffer_index    <= 4'b0;
                    current_bias_index      <= 1'b0;
                    
                    if (r_valid) begin
                        
                        state       <= STATE_RDATA;
                        r_state     <= WREAD;
                        w_state     <= LDATA;
                    end
                end
                
                STATE_RDATA: begin
                    if (data_receive_done && data_load_done) begin
                        data_load_done          <= 1'b0;
                        current_buffer_index    <= 4'b0;
//                        counter                 <= 2'b0;
                        r_state                 <= LOAD;
                        state                   <= STATE_RUN;
                    end
                    else if (!data_receive_done) begin
                                                
                        case(r_state)
                            WREAD: begin
                                weight_bf[current_buffer_index] <= data_in[W_BITWIDTH*3-1:0];
                                if (current_buffer_index == SIZE_BUFFER-1) begin
                                    current_buffer_index    <= 0;
                                    r_state                 <= IREAD;
                                end 
                                else current_buffer_index   <= current_buffer_index + 1;
                            end
                            IREAD: begin
                                input_bf[current_buffer_index]  <= data_in[IN_BITWIDTH*3-1:0];
                                if (current_buffer_index == SIZE_BUFFER-1) begin
                                    current_buffer_index    <= 0;
                                    r_state                 <= BREAD;
                                end 
                                else current_buffer_index   <= current_buffer_index + 1;
                            end
                            BREAD: begin
                                bias_bf                     <= data_in;
                                is_load_bias                <= 1'b1;
                                if (current_buffer_index == SIZE_BUFFER-1) begin
                                    current_buffer_index    <= 0;
                                    r_state                 <= LOAD;
                                end 
                                else current_buffer_index   <= current_buffer_index + 1;
                                
                                data_receive_done           <= 1'b1;
                            end
                            
                        endcase
                    end
                    else begin
                        
                        current_weight_index    <= current_weight_index + 1;
                        current_input_index     <= current_input_index + 1;
                        current_bias_index      <= current_bias_index + 1;
                        
                        weights_0               <= weight_bf[current_weight_index][W_BITWIDTH-1:0];
                        weights_1               <= weight_bf[current_weight_index][W_BITWIDTH*2-1:W_BITWIDTH];
                        weights_2               <= weight_bf[current_weight_index][W_BITWIDTH*3-1:W_BITWIDTH*2];
                        
                        data_in_0               <= input_bf[current_input_index][IN_BITWIDTH-1:0];
                        data_in_1               <= input_bf[current_input_index][IN_BITWIDTH*2-1:IN_BITWIDTH];
                        data_in_2               <= input_bf[current_input_index][IN_BITWIDTH*3-1:IN_BITWIDTH*2];
                        
                        if (is_load_bias) begin
                            pre_sum         <= bias_bf[OUT_BITWIDTH-2:0];             
                        end 
                        else pre_sum        <= 0;
                        
                        data_load_done      <= 1'b1;
                        if (current_weight_index == SIZE_BUFFER-1)  is_last_input <= 1'b1;
                        else is_last_input  <= 1'b0;
                        
                    end
                end
                
                STATE_RUN: begin
                     if (run_done) begin
                        is_continued    <= 1'b0;
                        run_done        <= 1'b0;
                        case(is_last_input)
                            0: begin
                                state           <= STATE_RDATA;
                                is_load_bias    <= 1'b0;  
//                                is_continued    <= 1'b0;
                            end
                            1: begin
                                state           <= STATE_FINISH;
                                lstm_unit_en    <= 1'b0;
                            end
                        endcase
                     end
                     else begin
                        lstm_unit_en    <= 1'b1;
                        
                        if (lstm_unit_done || lstm_is_waiting) begin
                            run_done        <= 1'b1;
                            is_continued    <= 1'b0;
                        end
                        else is_continued   <= 1'b1;
                     end
                end  
                
//                STATE_WBACK: begin
                    
//                end
                
                STATE_FINISH: begin
                    if (finish_done) begin
                        state           <= STATE_IDLE;
                        finish_done     <= 1'b0;
                        t_valid         <= 1'b1;
                    end
                    else begin
                        out_data     <= lstm_unit_result[0];
//                        out_data[1]     <= lstm_unit_result[1];
//                        out_data[2]     <= lstm_unit_result[2];
//                        out_data[3]     <= lstm_unit_result[3];
                        finish_done     <= 1'b1;
                    end
                end
            endcase
        end
    end
    
    
endmodule

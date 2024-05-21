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

// down scale the accum from 32 bit to 16 bit (3 integer bits) 
// fromraw gate input before apply activation
// activation (SaturationAdd for cell and rescale)
// down-scale output to 8 bit saturating, and store back to memory.
// RoundingDivideByPOT output 

module lstm_unit #( parameter W_BITWIDTH = 8,
                    parameter OUT_BITWIDTH = 32)(
                    input                                   clk,
                    input                                   rstn,
                    input                                   en,
                    input                                   is_last_input,
                    input                                   is_last_data_gate,
                    input                                   is_last_timestep,
                    input                                   is_last_sample,
                    input                                   is_continued,
                    input                                   is_load_bias,
                    input  [1:0]                            type_gate,
                    input                                   current_unit,
                    input  [1:0]                            current_layer,
                    input  [W_BITWIDTH*3-1:0]               weight,
                    input  [W_BITWIDTH*3-1:0]               data_in,
                    input  [OUT_BITWIDTH-1:0]               pre_sum,
                    output logic                            is_waiting,
                    output logic                            finish_step,
                    output logic                            done,
                    output logic [7:0]                      out [0:1]
    );
    
    localparam
        QUANTIZE_SIZE       = 16,
        BUFFER_SIZE         = 32,
        
        NO_UNITS            = 2,
        OUT_SIZE            = 16,
        LSTM                = 1,
        FC                  = 2,
        
        STATE_IDLE          = 3'b000,
        STATE_IRB           = 3'b001,
        STATE_Q             = 3'b010,
        STATE_GATE          = 3'b011,
        STATE_CELL          = 3'b100,
        STATE_HIDDEN        = 3'b101,
        STATE_WAIT          = 3'b110,
        STATE_FINISH        = 3'b111,
        
        MULT_S0             = 0,
        MULT_S1             = 1,
        MULT_S2             = 2,
        MULT_S3             = 3,
        MULT_S4             = 4,
        
        INPUT_GATE          = 2'b00,
        FORGET_GATE         = 2'b01,
        CELL_UPDATE         = 2'b10,
        OUTPUT_GATE         = 2'b11,
        
        MULT_LATENCY        = 3,
        LATENCY             = 1;
        
        
    
    logic   [2:0]   state;
    logic           irb_done;
    logic           gate_done;
    logic           cell_done;
    logic           hidden_done;
    logic           finish_done;
    logic   [2:0]   remain_waiting_time;
    logic           internal_current_unit;
    logic           update_cell_state_bf;
    logic   [2:0]   current_mult_shift;
    
    // add signal for quantization -----------------------------------------
    logic   [BUFFER_SIZE-1:0]       accu_input_bf   [0:OUT_SIZE/8 - 1];
    logic   [BUFFER_SIZE-1:0]       accu_forget_bf  [0:OUT_SIZE/8 - 1];
    logic   [BUFFER_SIZE-1:0]       accu_cell_bf    [0:OUT_SIZE/8 - 1];
    logic   [BUFFER_SIZE-1:0]       accu_output_bf  [0:OUT_SIZE/8 - 1];
    logic   [BUFFER_SIZE-1:0]       accu_bf         [0:OUT_SIZE/8 - 1];
//    logic   [BUFFER_SIZE-1:0]       accu_fc_bf;
    
    logic   [QUANTIZE_SIZE-1:0]     cell_update     [0:OUT_SIZE/8 - 1];
    logic   [QUANTIZE_SIZE-1:0]     input_gate      [0:OUT_SIZE/8 - 1];
    logic   [QUANTIZE_SIZE-1:0]     forget_gate     [0:OUT_SIZE/8 - 1];
    logic   [QUANTIZE_SIZE-1:0]     output_gate     [0:OUT_SIZE/8 - 1];
    
    logic   [QUANTIZE_SIZE-1:0]     inv_cell_update_bf;
    
    logic                           inv_cell_update;
    logic                           inv_cell_state;   
    logic                           inv_tanh_cell_bf;
    
    logic   [BUFFER_SIZE-1:0]       cell_mult_bf;
    logic   [BUFFER_SIZE-1:0]       cell_state_bf   ;
    logic   [BUFFER_SIZE-1:0]       hidden_state_bf ;
    
    logic   [QUANTIZE_SIZE-1:0]     cell_state      [0:OUT_SIZE/8 - 1];
    logic   [QUANTIZE_SIZE-1:0]     inv_cell_state_bf;
      
    logic                           ht_flag;
    logic                           fc_flag;
    
    logic   [BUFFER_SIZE-1:0]       q_di_lstm_state ;
    logic   [QUANTIZE_SIZE-1:0]     q_do_lstm_state ;
    logic   [1:0]                   type_state      ;
    
    logic   [BUFFER_SIZE-1:0]       f_prev_cell_bf;
    logic   [BUFFER_SIZE-1:0]       i_cell_update_bf;
        
    logic   [QUANTIZE_SIZE-1:0]      di_current_unit_tanh_bf;
    logic   [QUANTIZE_SIZE-1:0]      di_current_unit_sigmoid_bf;
    logic   [QUANTIZE_SIZE-1:0]      do_current_unit_tanh_bf;
    logic   [QUANTIZE_SIZE-1:0]      do_current_unit_sigmoid_bf;
    
     
    logic  [1:0]                            gate;
    logic  [1:0]                            count_gate;
    logic  [1:0]                            count_cell;
    
    logic  [QUANTIZE_SIZE-1:0]              tanh_cell_bf;
    
    logic                                   mac_en;
    logic                                   mac_is_signed;
    logic  [W_BITWIDTH-1:0]                 weights_bf_0;
    logic  [W_BITWIDTH-1:0]                 weights_bf_1; 
    logic  [W_BITWIDTH-1:0]                 weights_bf_2;  
    logic  [W_BITWIDTH-1:0]                 data_in_bf_0;
    logic  [W_BITWIDTH-1:0]                 data_in_bf_1;
    logic  [W_BITWIDTH-1:0]                 data_in_bf_2;
    logic  [OUT_BITWIDTH-1:0]               pre_sum_bf;
    logic                                   mac_done;
    logic  [OUT_BITWIDTH-1:0]               mac_result;
    
//    logic  [OUT_BITWIDTH-1:0]               fc_bf;
    
    logic   tanh_en;
    logic   sigmoid_en;
    logic   q_lstm_en;
//    logic   q_fc_en;
    
    logic   tanh_done;
    logic   sigmoid_done;
    logic   q_lstm_done;
    logic   q_fc_done;
    
    MAC u_mac (
        .clk(clk),
        .rstn(rstn),
        .en(mac_en),
        .is_signed(mac_is_signed),
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
        
    tanh_appr u_tanh (
        .clk(clk),
        .rstn(rstn),
        .en(tanh_en),
        .data_in(di_current_unit_tanh_bf),
        .done(tanh_done),
        .data_out(do_current_unit_tanh_bf)
    );
    
    sigmoid_appro u_sigmoid (
        .clk(clk),
        .rstn(rstn),
        .en(sigmoid_en),
        .data_in(di_current_unit_sigmoid_bf),
        .done(sigmoid_done),
        .data_out(do_current_unit_sigmoid_bf)
    );
    
    quantization_lstm q1 (
        .clk(clk),
        .rstn(rstn),
        .en(q_lstm_en),
        .type_state(type_state), 
        .data_in(q_di_lstm_state),
        .done(q_lstm_done), 
        .data_out(q_do_lstm_state)
    ); 

//    quantization_fc q2(
//        .clk(clk),
//        .rstn(rstn),
//        .en(q_fc_en), 
//        .data_in(q_di_fc),
//        .done(q_fc_done),
//        .data_out(q_do_fc)
//    );
    
    always @(posedge clk or negedge rstn) begin
        if (!rstn) begin
            state       <= 3'b000;
            
            irb_done            <= 1'b0;
            gate_done           <= 1'b0;
            cell_done           <= 1'b0;
            hidden_done         <= 1'b0;
            finish_done         <= 1'b0;
            count_gate          <= 2'b00;
            
            remain_waiting_time    <= LATENCY;
            
            weights_bf_0           <= {W_BITWIDTH{1'b0}};
            weights_bf_1           <= {W_BITWIDTH{1'b0}};
            weights_bf_2           <= {W_BITWIDTH{1'b0}};
            data_in_bf_0           <= {W_BITWIDTH{1'b0}};
            data_in_bf_1           <= {W_BITWIDTH{1'b0}};
            data_in_bf_2           <= {W_BITWIDTH{1'b0}};
            pre_sum_bf             <= {OUT_BITWIDTH{1'b0}};
            inv_cell_update_bf  <= {QUANTIZE_SIZE{1'b0}};
            inv_cell_update     <= 1'b0;
            inv_cell_state_bf   <= {QUANTIZE_SIZE{1'b0}};
            inv_cell_state      <= 1'b0;

            
            tanh_en             <= 1'b0;
            sigmoid_en          <= 1'b0;
            q_lstm_en           <= 1'b0;
            fc_flag             <= 1'b0;
            finish_step         <= 1'b0;
            tanh_en             <= 1'b0;
            sigmoid_en          <= 1'b0;
            q_lstm_en           <= 1'b0;
            fc_flag             <= 1'b0;
            accu_bf[0]          <= {32{1'b0}};
            accu_bf[1]          <= {32{1'b0}};
            accu_input_bf[0]    <= {32{1'b0}};
            accu_input_bf[1]    <= {32{1'b0}};
            accu_forget_bf[0]   <= {32{1'b0}};
            accu_forget_bf[1]   <= {32{1'b0}};
            accu_cell_bf[0]     <= {32{1'b0}};
            accu_cell_bf[1]     <= {32{1'b0}};
            accu_output_bf[0]   <= {32{1'b0}};
            accu_output_bf[1]   <= {32{1'b0}};
            gate                <= 2'b00;
            is_waiting          <= 1'b0;
            mac_is_signed       <= 1'b0;
            count_gate          <= 2'b00;
            current_mult_shift  <= MULT_S0;
            type_state          <= 2'b00;
            out[0]              <= {8{1'b0}};
            out[1]              <= {8{1'b0}};
            q_di_lstm_state     <= {BUFFER_SIZE{1'b0}};
            mac_en              <= 1'b0;
            cell_state_bf       <= {BUFFER_SIZE{1'b0}};
            f_prev_cell_bf      <= {BUFFER_SIZE{1'b0}};
            i_cell_update_bf    <= {BUFFER_SIZE{1'b0}};
            inv_cell_update_bf  <= {BUFFER_SIZE{1'b0}};
            inv_cell_update     <= 1'b0;
            inv_cell_state_bf   <= {QUANTIZE_SIZE{1'b0}};
            inv_cell_state      <= 1'b0;
            cell_update[0]      <= {QUANTIZE_SIZE{1'b0}};
            cell_update[1]      <= {QUANTIZE_SIZE{1'b0}};
            input_gate[0]       <= {QUANTIZE_SIZE{1'b0}};
            input_gate[1]       <= {QUANTIZE_SIZE{1'b0}};
            forget_gate[0]      <= {QUANTIZE_SIZE{1'b0}};
            forget_gate[1]      <= {QUANTIZE_SIZE{1'b0}};
            output_gate[0]      <= {QUANTIZE_SIZE{1'b0}};
            output_gate[1]      <= {QUANTIZE_SIZE{1'b0}};
            hidden_state_bf     <= {BUFFER_SIZE{1'b0}};
            tanh_cell_bf        <= {BUFFER_SIZE{1'b0}};
            inv_tanh_cell_bf    <= {QUANTIZE_SIZE{1'b0}};
            
            
            ht_flag             <= 1'b0;
            count_cell          <= 2'b00;
            
            di_current_unit_tanh_bf     <= {QUANTIZE_SIZE{1'b0}};
            di_current_unit_sigmoid_bf  <= {QUANTIZE_SIZE{1'b0}};
            update_cell_state_bf        <= 1'b0;   
            
            cell_state[0]   <= {QUANTIZE_SIZE{1'b0}};
            cell_state[1]   <= {QUANTIZE_SIZE{1'b0}};
            
            internal_current_unit  <= 0;
            done                   <= 1'b0;
        end
        else begin
            case(state) 
                STATE_IDLE: begin
                    irb_done            <= 1'b0;
                    gate_done           <= 1'b0;
                    cell_done           <= 1'b0;
                    hidden_done         <= 1'b0;
                    finish_done         <= 1'b0;
                    finish_step         <= 1'b0;
                    done                <= 1'b0;
                    
                    accu_input_bf[current_unit]       <= 0;
                    accu_forget_bf[current_unit]      <= 0;
                    accu_cell_bf[current_unit]        <= 0;
                    accu_output_bf[current_unit]      <= 0;
                    accu_bf[current_unit]             <= {BUFFER_SIZE{1'b0}};
                    
//                    cell_state[current_unit]          <= {OUT_BITWIDTH{1'b0}};
                    
                    remain_waiting_time <= LATENCY;
                    
                    if (en && !done) begin
                        weights_bf_0    <= weight[W_BITWIDTH-1:0];
                        weights_bf_1    <= weight[W_BITWIDTH*2-1:W_BITWIDTH];
                        weights_bf_2    <= weight[W_BITWIDTH*3-1:W_BITWIDTH*2];
                        data_in_bf_0    <= data_in[W_BITWIDTH-1:0];
                        data_in_bf_1    <= data_in[W_BITWIDTH*2-1:W_BITWIDTH];
                        data_in_bf_2    <= data_in[W_BITWIDTH*3-1:W_BITWIDTH*2];
                        
                        cell_state[0]   <= {QUANTIZE_SIZE{1'b0}};
                        cell_state[1]   <= {QUANTIZE_SIZE{1'b0}};
//                        prev_cell_state[1]                  <= {QUANTIZE_SIZE{1'b0}};
                        case(is_load_bias)
                            0: pre_sum_bf     <= accu_bf[current_unit];
                            1: pre_sum_bf     <= pre_sum;
                        endcase
                        gate            <= type_gate;
                        state           <= STATE_IRB;
                        is_waiting      <= 1'b0;
                        mac_is_signed   <= 1'b1;
                        count_gate      <= 2'b00;
                        count_cell      <= 2'b00;
                        
                    end
                end
                
                STATE_IRB: begin
                    if (irb_done) begin
                        if (is_last_data_gate && is_last_input) begin
                            if (current_layer == LSTM) begin
                                state                   <= STATE_Q;
                                is_waiting              <= 1'b0;
                                irb_done                <= 1'b0;
                                current_mult_shift      <= 3'b000;
                                tanh_en                 <= 1'b0;
                                sigmoid_en              <= 1'b0;
                                q_lstm_en               <= 1'b0;
                                internal_current_unit   <= 0;
                                type_state              <= 0;
                                
                                case(gate)
                                    INPUT_GATE:     accu_input_bf[current_unit]   <= mac_result;
                                    FORGET_GATE:    accu_forget_bf[current_unit]  <= mac_result;
                                    CELL_UPDATE:    accu_cell_bf[current_unit]    <= mac_result;
                                    OUTPUT_GATE:    accu_output_bf[current_unit]  <= mac_result;
                                endcase
                            end
                            else if (current_layer == FC) begin
                                if (is_last_sample) begin
                                    state           <= STATE_FINISH;
                                    done            <= 1'b1;
                                end
                                else begin  
                                    state           <= STATE_IDLE;
                                    is_waiting      <= 1'b1;
                                end
//                                fc_bf               <= mac_result; 
                                out[current_unit]   <= q_do_lstm_state[7:0];
                                irb_done            <= 1'b0;     
                            end
                            else ;
                            remain_waiting_time     <= LATENCY;
                        end
                        else begin
                            state                   <= STATE_WAIT;
                            is_waiting              <= 1'b1;
                            irb_done                <= 1'b0;
                            accu_bf[current_unit]   <= mac_result;
                        end               
                    end
                    else begin      
                        if (mac_done) begin
                            if (current_layer == FC && is_last_data_gate && is_last_input) begin
                                q_lstm_en           <= 1'b1;
                                type_state          <= 2'b10;
                                fc_flag             <= 1'b1;
                                q_di_lstm_state     <= mac_result;
                                mac_en              <= 1'b0;
                            end
                            else begin
                                irb_done    <= 1'b1;
                                mac_en      <= 1'b0;
                            end 
                        end
                        else begin
                            if (fc_flag) begin
                                q_lstm_en     <= 1'b1;
                                if (q_lstm_done) begin
                                    q_lstm_en   <= 1'b0;
                                    irb_done    <= 1'b1;
                                    fc_flag     <= 1'b0;
                                end
                                else ;
                            end
                            else mac_en          <= 1'b1;
                        end   
                    end
                end
               
                STATE_WAIT: begin
                    is_waiting          <= 1'b0;                  
                    if (remain_waiting_time == 0) begin
                        finish_step     <= 1'b0;
                        if (is_continued == 1) begin
                            state           <= STATE_IRB;
                            weights_bf_0    <= weight[W_BITWIDTH-1:0];
                            weights_bf_1    <= weight[W_BITWIDTH*2-1:W_BITWIDTH];
                            weights_bf_2    <= weight[W_BITWIDTH*3-1:W_BITWIDTH*2];
                            data_in_bf_0    <= data_in[W_BITWIDTH-1:0];
                            data_in_bf_1    <= data_in[W_BITWIDTH*2-1:W_BITWIDTH];
                            data_in_bf_2    <= data_in[W_BITWIDTH*3-1:W_BITWIDTH*2];
                            
                            case(is_load_bias)
                                0: pre_sum_bf       <= accu_bf[current_unit];
                                1: pre_sum_bf       <= pre_sum;
                            endcase

                            if (finish_step == 1'b1) begin
                                finish_step         <= 1'b0;
                            end
                            else ;
                            
                            remain_waiting_time     <= LATENCY;
                        end
                        else begin
                            state      <= STATE_WAIT;
                            if (gate != type_gate) begin                                
                                case(type_gate)
                                    INPUT_GATE:     accu_bf[current_unit] <= accu_input_bf[current_unit];
                                    FORGET_GATE:    accu_bf[current_unit] <= accu_forget_bf[current_unit];
                                    CELL_UPDATE:    accu_bf[current_unit] <= accu_cell_bf[current_unit];
                                    OUTPUT_GATE:    accu_bf[current_unit] <= accu_output_bf[current_unit];
                                endcase
                                
                                gate    <= type_gate;
                            end
                            else gate   <= type_gate;
                        end
                    end
                    else begin 
                        remain_waiting_time <= remain_waiting_time - 1;
                        case(gate)
                            INPUT_GATE:     accu_input_bf[current_unit]   <= accu_bf[current_unit];
                            FORGET_GATE:    accu_forget_bf[current_unit]  <= accu_bf[current_unit];
                            CELL_UPDATE:    accu_cell_bf[current_unit]    <= accu_bf[current_unit];
                            OUTPUT_GATE:    accu_output_bf[current_unit]  <= accu_bf[current_unit];
                        endcase
                   end
                end
                
                STATE_Q: begin
                    case(count_gate) 
                        2'b00: begin
                            
                            if (q_lstm_done) begin
                                accu_input_bf[internal_current_unit]    <=  { {16{1'b0}}, q_do_lstm_state};
                                q_lstm_en                               <= 1'b0;
//                                count_gate                              <= count_gate + 1;
                                if (remain_waiting_time == 0) count_gate    <= count_gate + 1;
                                else remain_waiting_time = remain_waiting_time - 1;
                            end
                            else begin 
                                q_lstm_en           <= 1'b1;
                                remain_waiting_time <= LATENCY;
                                q_di_lstm_state     <= accu_input_bf[internal_current_unit];
                            end
                        end
                        
                        2'b01: begin
                            
                            if (q_lstm_done) begin
                                accu_forget_bf[internal_current_unit]   <=  { {16{1'b0}}, q_do_lstm_state};
                                q_lstm_en                               <= 1'b0;
//                                count_gate                              <= count_gate + 1;
                                if (remain_waiting_time == 0) count_gate    <= count_gate + 1;
                                else remain_waiting_time = remain_waiting_time - 1;
                            end
                            else begin
                                q_lstm_en           <= 1'b1;
                                remain_waiting_time <= LATENCY;
                                q_di_lstm_state     <= accu_forget_bf[internal_current_unit];
                            end
                        end
                        
                        2'b10: begin
                             
                            if (q_lstm_done) begin
                                accu_cell_bf[internal_current_unit]     <=  { {16{1'b0}}, q_do_lstm_state};
                                q_lstm_en                               <= 1'b0;
//                                count_gate                              <= count_gate + 1;
                                if (remain_waiting_time == 0) count_gate    <= count_gate + 1;
                                else remain_waiting_time = remain_waiting_time - 1;
                            end
                            else begin
                                q_lstm_en           <= 1'b1;
                                remain_waiting_time <= LATENCY;
                                q_di_lstm_state     <= accu_cell_bf[internal_current_unit];
                            end
                        end
                        
                        2'b11: begin
                              
                            if (q_lstm_done) begin
                                accu_output_bf[internal_current_unit]   <=  { {16{1'b0}}, q_do_lstm_state};
                                q_lstm_en                               <= 1'b0;
//                                count_gate                              <= 0;
                                if (remain_waiting_time == 0) begin
                                    count_gate    <= 0;
                                    state         <= STATE_GATE;
                                end
                                else remain_waiting_time = remain_waiting_time - 1;
                            end
                            else begin
                                q_lstm_en           <= 1'b1;
                                remain_waiting_time <= LATENCY;
                                q_di_lstm_state     <= accu_output_bf[internal_current_unit];
                            end
                        end
                    endcase
                end
                
                STATE_GATE: begin
                    if (gate_done) begin
                        gate_done       <= 1'b0;
                        gate            <= type_gate;
                        state           <= STATE_CELL;
                        
                        update_cell_state_bf    <= 1'b0;
                        remain_waiting_time     <= MULT_LATENCY;
                        current_mult_shift      <= 3'b000;
                        cell_state_bf           <= 32'h0;
                        mac_is_signed           <= 1'b0;
                        f_prev_cell_bf          <= 0;
                        i_cell_update_bf        <= 0;            
                        
//                        if (input_gate[internal_current_unit][31]) begin
//                            inv_input_gate_bf   <= ~input_gate[internal_current_unit] + 1;
//                            inv_input_gate      <= 1'b1;
//                        end
//                        else begin 
//                            inv_input_gate     <= 1'b0;
//                            inv_input_gate_bf  <= input_gate[internal_current_unit];
//                        end
                        
//                        if (forget_gate[internal_current_unit][31]) begin
//                            inv_forget_gate_bf  <= ~forget_gate[internal_current_unit] + 1;
//                            inv_forget_gate     <= 1'b1;
//                        end
//                        else begin
//                            inv_forget_gate    <= 1'b0;
//                            inv_forget_gate_bf <= forget_gate[internal_current_unit];
//                        end
                        
                        if (cell_update[internal_current_unit][15]) begin
                            inv_cell_update_bf  <= ~cell_update[internal_current_unit] + 1;
                            inv_cell_update     <= 1'b1;
                        end
                        else begin 
                            inv_cell_update    <= 1'b0;
                            inv_cell_update_bf <= cell_update[internal_current_unit];
                        end
                        
                        if (cell_state[internal_current_unit][15]) begin
                            inv_cell_state_bf   <= ~cell_state[internal_current_unit] + 1;
                            inv_cell_state      <= 1'b1;
                        end
                        else begin
                            inv_cell_state     <= 1'b0;
                            inv_cell_state_bf  <= cell_state[internal_current_unit];
                        end
//                        cell_update[internal_current_unit]  <= do_current_unit_tanh_bf;
                        /////////////////////////////////////////////////////////
                    end
                    else begin
                        if (count_gate == 2'b11) begin
                            if (tanh_done) begin
                                if (remain_waiting_time == 0) begin
                                    count_gate          <= 2'b00;
                                    gate_done           <= 1'b1;
                                    remain_waiting_time <= LATENCY;
                                end
                                else remain_waiting_time <= remain_waiting_time - 1;
                                tanh_en         <= 1'b0;
                                cell_update[internal_current_unit]  <= do_current_unit_tanh_bf;
                            end
                            else tanh_en    <= 1'b1;
                            di_current_unit_tanh_bf             <= accu_cell_bf[internal_current_unit][15:0];
                        end
                        else begin
                            case(gate)
                                INPUT_GATE: begin
                                    sigmoid_en      <= 1'b1;
                                    if (sigmoid_done) begin
                                        sigmoid_en                          <= 1'b0;
                                        input_gate[internal_current_unit]  <= do_current_unit_sigmoid_bf; 
                                        
                                        if (remain_waiting_time == 0) begin
//                                            output_gate[internal_current_unit]  <= do_current_unit_sigmoid_bf; 
                                            gate                                <= FORGET_GATE;
                                            count_gate                          <= count_gate + 1;
                                            remain_waiting_time                 <= LATENCY;
                                        end
                                        else remain_waiting_time <= remain_waiting_time - 1;
                                    end
                                    else ;
                                    di_current_unit_sigmoid_bf          <= accu_input_bf[internal_current_unit];
                                end
                                FORGET_GATE: begin
                                    sigmoid_en      <= 1'b1;
                                    if (sigmoid_done) begin
                                        if (remain_waiting_time == 0) begin
                                            gate                                <= OUTPUT_GATE;
                                            count_gate                          <= count_gate + 1;
                                            remain_waiting_time                 <= LATENCY;
                                        end
                                        else remain_waiting_time <= remain_waiting_time - 1;
                                        
                                        forget_gate[internal_current_unit]  <= do_current_unit_sigmoid_bf;
                                        sigmoid_en                          <= 1'b0;
                                    end
                                    di_current_unit_sigmoid_bf          <= accu_forget_bf[internal_current_unit];   
                                end
                                OUTPUT_GATE: begin
                                    sigmoid_en      <= 1'b1;
                                    if (sigmoid_done) begin
                                        if (remain_waiting_time == 0) begin
                                            gate                                <= INPUT_GATE;
                                            count_gate                          <= count_gate + 1;
                                            remain_waiting_time                 <= LATENCY;
                                        end
                                        else remain_waiting_time <= remain_waiting_time - 1;
                                        output_gate[internal_current_unit]  <= do_current_unit_sigmoid_bf;
                                        sigmoid_en                          <= 1'b0;
                                    end
                                    di_current_unit_sigmoid_bf          <= accu_output_bf[internal_current_unit];
                                end
                            endcase
                        end
                    end
                end
                
                STATE_CELL: begin
                    if (cell_done) begin
                        if (q_lstm_done && tanh_done) begin
                            state           <= STATE_HIDDEN;
                            cell_done       <= 1'b0;
                            q_lstm_en       <= 1'b0;
                            tanh_en         <= 1'b0;
                            cell_state[internal_current_unit]   <= q_do_lstm_state;
                            
//                            tanh_cell_bf            <= do_current_unit_tanh_bf;
                            current_mult_shift      <= 0;
                            update_cell_state_bf    <= 1'b0;
                            
                            type_state              <= 1;  
                            remain_waiting_time     <= MULT_LATENCY;  
                            hidden_state_bf         <= 32'h00000000;
                                                        
                            if (do_current_unit_tanh_bf[15]) begin
                                tanh_cell_bf       <= ~do_current_unit_tanh_bf + 1;
                                inv_tanh_cell_bf   <= 1'b1; 
                            end
                            else begin
                                tanh_cell_bf       <= do_current_unit_tanh_bf;
                                inv_tanh_cell_bf   <= 1'b0; 
                            end
    //                        accu_cell_bf[internal_current_unit]     <= mac_result;
                        end
                        else begin
                            q_lstm_en   <= 1'b1;
                            tanh_en     <= 1'b1;
                        end
                        di_current_unit_tanh_bf     <= cell_state_bf;
                        q_di_lstm_state             <= cell_state_bf;                                       
                    end
                    else begin
                        
                        case(count_cell)
                            2'b00: begin
//                                  f_prev_cell_bf    <= forget_gate[internal_current_unit] * cell_state[internal_current_unit];
//                                  count_cell        <= count_cell + 1;
//                                f_prev_cell_bf      <= forget_gate[internal_current_unit];
                                if (remain_waiting_time == 0) begin
                                    mac_en                  <= 1'b1;
                                    if (mac_done) begin
                                        mac_en              <= 1'b0;
                                        if (!update_cell_state_bf) update_cell_state_bf <= 1'b1;
                                        else begin
                                            if (current_mult_shift == MULT_S2) current_mult_shift <= 0;
                                            else current_mult_shift  <= current_mult_shift + 1;
    
                                            case(current_mult_shift)
                                                MULT_S0: f_prev_cell_bf <= f_prev_cell_bf + mac_result[15:0];
                                                MULT_S1: f_prev_cell_bf <= f_prev_cell_bf + (mac_result[15:0] <<< 8);
                                                MULT_S2: begin 
                                                    f_prev_cell_bf   <= f_prev_cell_bf + (mac_result[15:0] <<< 16);
                                                    count_cell      <= count_cell + 1;
                                                end
                                            endcase 
                                            remain_waiting_time     <= MULT_LATENCY;
                                            update_cell_state_bf    <= 1'b0;
                                         end   
                                    end
                                end
                                else begin
                                    remain_waiting_time <= remain_waiting_time - 1;
                                    case(current_mult_shift)
                                        MULT_S0: begin
                                            weights_bf_0    <= forget_gate[internal_current_unit][7:0];
                                            weights_bf_1    <= {W_BITWIDTH{1'b0}};
                                            weights_bf_2    <= {W_BITWIDTH{1'b0}};
                                            data_in_bf_0    <= inv_cell_state_bf[7:0];
                                            data_in_bf_1    <= {W_BITWIDTH{1'b0}};
                                            data_in_bf_2    <= {W_BITWIDTH{1'b0}};
                                            pre_sum_bf      <= {OUT_BITWIDTH{1'b0}};
                                        end
                                        MULT_S1: begin
                                            weights_bf_0    <= forget_gate[internal_current_unit][15:8];
                                            weights_bf_1    <= forget_gate[internal_current_unit][7:0];
                                            weights_bf_2    <= {W_BITWIDTH{1'b0}};
                                            data_in_bf_0    <= inv_cell_state_bf[7:0];
                                            data_in_bf_1    <= inv_cell_state_bf[15:8];
                                            data_in_bf_2    <= {W_BITWIDTH{1'b0}};
                                            pre_sum_bf      <= {OUT_BITWIDTH{1'b0}};
                                        end
                                        MULT_S2: begin
                                            weights_bf_0    <= forget_gate[internal_current_unit][15:8];
                                            weights_bf_1    <= {W_BITWIDTH{1'b0}};
                                            weights_bf_2    <= {W_BITWIDTH{1'b0}};
                                            data_in_bf_0    <= inv_cell_state_bf[15:8];
                                            data_in_bf_1    <= {W_BITWIDTH{1'b0}};
                                            data_in_bf_2    <= {W_BITWIDTH{1'b0}};
                                            pre_sum_bf      <= {OUT_BITWIDTH{1'b0}};
                                        end
                                    endcase
                                end 
                            end
                            
                            2'b01: begin
//                                i_cell_update_bf  <= input_gate[internal_current_unit] * cell_update[internal_current_unit];
//                                count_cell        <= count_cell + 1;
//                                i_cell_update_bf    <= input_gate[internal_current_unit];
                                if (remain_waiting_time == 0) begin
                                    mac_en                  <= 1'b1;
                                    if (mac_done) begin
                                        mac_en              <= 1'b0;
                                        if (!update_cell_state_bf) update_cell_state_bf <= 1'b1;
                                        else begin
                                            current_mult_shift  <= current_mult_shift + 1;
                                            update_cell_state_bf <= 1'b0;
                                            case(current_mult_shift)
                                                MULT_S0: i_cell_update_bf  <= i_cell_update_bf + mac_result[15:0];
                                                MULT_S1: i_cell_update_bf  <= i_cell_update_bf + (mac_result[15:0] <<< 8);
                                                MULT_S2: begin
                                                    i_cell_update_bf   <= i_cell_update_bf + (mac_result[15:0] <<< 16);
//                                                    cell_done       <= 1'b1;
//                                                    count_cell      <= 2'b00; 
                                                    count_cell          <= count_cell + 1;
                                                    if ( !inv_cell_state ) begin
                                                        f_prev_cell_bf  <= f_prev_cell_bf;    
                                                    end
                                                    else f_prev_cell_bf <= ~f_prev_cell_bf + 1;
                                                end
                                            endcase   
                                            remain_waiting_time     <= MULT_LATENCY;
//                                            update_cell_state_bf    <= 1'b0; 
                                        end
                                    end
                                end
                                else begin
                                    remain_waiting_time <= remain_waiting_time - 1;
                                    case(current_mult_shift)
                                        MULT_S0: begin
                                            weights_bf_0    <= input_gate[internal_current_unit][7:0];
                                            weights_bf_1    <= {W_BITWIDTH{1'b0}};
                                            weights_bf_2    <= {W_BITWIDTH{1'b0}};
                                            data_in_bf_0    <= inv_cell_update_bf[7:0];
                                            data_in_bf_1    <= {W_BITWIDTH{1'b0}};
                                            data_in_bf_2    <= {W_BITWIDTH{1'b0}};
                                            pre_sum_bf      <= {OUT_BITWIDTH{1'b0}};
                                        end
                                        MULT_S1: begin
                                            weights_bf_0    <= input_gate[internal_current_unit][15:8];
                                            weights_bf_1    <= input_gate[internal_current_unit][7:0];
                                            weights_bf_2    <= {W_BITWIDTH{1'b0}};
                                            data_in_bf_0    <= inv_cell_update_bf[7:0];
                                            data_in_bf_1    <= inv_cell_update_bf[15:8];
                                            data_in_bf_2    <= {W_BITWIDTH{1'b0}};
                                            pre_sum_bf      <= {OUT_BITWIDTH{1'b0}};
                                        end
                                        MULT_S2: begin
                                            weights_bf_0    <= input_gate[internal_current_unit][15:8];
                                            weights_bf_1    <= {W_BITWIDTH{1'b0}};
                                            weights_bf_2    <= {W_BITWIDTH{1'b0}};
                                            data_in_bf_0    <= inv_cell_update_bf[15:8];
                                            data_in_bf_1    <= {W_BITWIDTH{1'b0}};
                                            data_in_bf_2    <= {W_BITWIDTH{1'b0}};
                                            pre_sum_bf      <= {OUT_BITWIDTH{1'b0}};
                                        end
                                    endcase
                                end 
                            end
                            
                            2'b10: begin
//                                cell_state_bf   <= f_prev_cell_bf + i_cell_update_bf;
//                                count_cell      <= count_cell + 1;
                                cell_done       <= 1'b1;
                                count_cell      <= 2'b00;
                                if ( !inv_cell_update ) begin
                                    cell_state_bf   <= i_cell_update_bf + f_prev_cell_bf;
                                    f_prev_cell_bf  <= f_prev_cell_bf;    
                                end
                                else begin
                                    cell_state_bf   <= f_prev_cell_bf + ~i_cell_update_bf + 1;
                                    i_cell_update_bf  <= ~i_cell_update_bf + 1;
                                end
//                                if ( (inv_forget_gate && inv_cell_state) || (!inv_forget_gate && !inv_cell_state) ) begin
//                                    i_cell_update_bf  <= i_cell_update_bf;    
//                                end
//                                else i_cell_update_bf <= ~i_cell_update_bf + 1;
                                 
                            end  
                        endcase
                    end
                    
                end
                
                STATE_HIDDEN: begin
                    if (hidden_done) begin 
                        if (q_lstm_done && q_lstm_en) begin
                            if (internal_current_unit == 1) begin
                                if (is_last_timestep) cell_state[current_unit]    <= {QUANTIZE_SIZE{1'b0}};
                                else ;
                                is_waiting      <= 1'b1;
                                finish_step     <= 1'b1;
//                                state   <= STATE_IDLE;
                                ht_flag <= 1'b1;
                                remain_waiting_time <= 2'b11;
                            end
                            else begin
                                state                   <= STATE_Q;
                                type_state              <= 2'b00;
                                internal_current_unit   <= internal_current_unit + 1;
                                remain_waiting_time     <= LATENCY;
                                hidden_done             <= 1'b0;       
                            end
//                            hidden_done                             <= 1'b0;
//                            hidden_state[internal_current_unit]     <= q_do_lstm_state;
                            out[internal_current_unit]              <= q_do_lstm_state;
                            q_lstm_en   <= 1'b0;
                            type_state  <= 2'b01;
                        end
                        else begin
                            q_lstm_en   <= 1'b1;
                            type_state  <= 1'b0;
                            if ( !inv_tanh_cell_bf ) begin
                                q_di_lstm_state <= hidden_state_bf;
                            end
                            else q_di_lstm_state <= ~hidden_state_bf + 1;
                        end
                        
                        if (ht_flag) begin
                            is_waiting      <= 1'b0;
                            if (remain_waiting_time == 0) begin 
                                hidden_done     <= 1'b0;
                                state           <= STATE_IDLE;
                                ht_flag         <= 1'b0;
                            end                         
                            else remain_waiting_time <= remain_waiting_time -1;
                        end
                        else ;
                                               
                    end
                    else begin
                        if (remain_waiting_time == 0) begin
                            mac_en                  <= 1'b1;
                            if (mac_done) begin
                                mac_en              <= 1'b0;
                                if (!update_cell_state_bf) update_cell_state_bf <= 1'b1;
                                else begin
                                    current_mult_shift  <= current_mult_shift + 1;
                                    update_cell_state_bf <= 1'b0;
                                    case(current_mult_shift)
                                        MULT_S0: hidden_state_bf  <= hidden_state_bf + mac_result[15:0];
                                        MULT_S1: hidden_state_bf  <= hidden_state_bf + (mac_result[15:0] <<< 8);
                                        MULT_S2: begin
                                            hidden_state_bf   <= hidden_state_bf + (mac_result[15:0] <<< 16);
                                            hidden_done       <= 1'b1;
                                            ht_flag           <= 1'b0;  
                                            count_cell        <= 2'b00;
//                                            waiting_time_before_to_idle <= 2'b11; 
                                        end
                                    endcase   
                                    remain_waiting_time     <= MULT_LATENCY;
//                                            update_cell_state_bf    <= 1'b0; 
                                end
                            end
                        end
                        else begin
                            remain_waiting_time <= remain_waiting_time - 1;
                            case(current_mult_shift)
                                MULT_S0: begin
                                    weights_bf_0    <= output_gate[internal_current_unit][7:0];
                                    weights_bf_1    <= {W_BITWIDTH{1'b0}};
                                    weights_bf_2    <= {W_BITWIDTH{1'b0}};
                                    data_in_bf_0    <= tanh_cell_bf[7:0];
                                    data_in_bf_1    <= {OUT_BITWIDTH{1'b0}};
                                    data_in_bf_2    <= {OUT_BITWIDTH{1'b0}};
                                    pre_sum_bf      <= {OUT_BITWIDTH{1'b0}};
                                end
                                MULT_S1: begin
                                    weights_bf_0    <= output_gate[internal_current_unit][15:8];
                                    weights_bf_1    <= output_gate[internal_current_unit][7:0];
                                    weights_bf_2    <= {W_BITWIDTH{1'b0}};
                                    data_in_bf_0    <= tanh_cell_bf[7:0];
                                    data_in_bf_1    <= tanh_cell_bf[15:8];
                                    data_in_bf_2    <= {OUT_BITWIDTH{1'b0}};
                                    pre_sum_bf      <= {OUT_BITWIDTH{1'b0}};
                                end
                                MULT_S2: begin
                                    weights_bf_0    <= output_gate[internal_current_unit][15:8];
                                    weights_bf_1    <= {W_BITWIDTH{1'b0}};
                                    weights_bf_2    <= {W_BITWIDTH{1'b0}};
                                    data_in_bf_0    <= tanh_cell_bf[15:8];
                                    data_in_bf_1    <= {W_BITWIDTH{1'b0}};
                                    data_in_bf_2    <= {W_BITWIDTH{1'b0}};
                                    pre_sum_bf      <= {OUT_BITWIDTH{1'b0}};
                                end
                            endcase
                        end  
//                        hidden_state_bf     <= output_gate[internal_current_unit] * tanh_cell_bf;
//                        hidden_done         <= 1'b1;
//                        ht_flag             <= 1'b0;  
//                        count_cell          <= 2'b00;
                    end
                end
                
                                
                STATE_FINISH: begin
                    if (finish_done) begin
                        state           <= STATE_IDLE;
                        finish_done     <= 1'b0;
                        done            <= 1'b1;
                    end
                    else begin
//                        out             <= hidden_state[current_unit];
                        finish_done     <= 1'b1;
                    end
                end
            endcase
        end
    end

endmodule

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
    input               is_last_data_gate,
    input [31:0]        data_in,
    output logic        r_data,
    output logic        w_valid,
    output logic        t_valid,
    output logic [31:0] out_data,
    output logic [2:0]  o_state,
    output logic [2:0]  o_lstm_state,
    output logic        o_lstm_finish_step,
    output logic        o_lstm_is_continued,
    output logic        o_lstm_is_waiting,
    output logic [7:0]  weights [0:2],
    output logic [7:0]  inputs  [0:2],
    output logic [31:0] bias,
    output logic        o_is_load_bias,
    output logic [7:0]  o_index,
    output logic [1:0]  o_mac_state,
    output logic        o_is_last_input,
    output logic [31:0] o_lstm_accu_bf,
    output logic [31:0] o_mac_result,
    output logic [1:0]  o_type_gate,
    output logic [1:0]  o_gate,
    output logic [7:0]  o_value_gate [0:3],
    output logic        o_is_load_cell,
    output logic [2:0]  o_r_state,
    output logic [7:0]  o_prev_cell_bf,
    output logic [31:0] o_cell_state,
    output logic [7:0]  o_tanh_cell_state,
    output logic [31:0] o_ht,
    output logic [4:0]  o_current_timestep,
    output logic [7:0]  o_lstm_unit_result [0:3],
    output logic [6:0]  o_current_no_units,
    output logic [6:0]  o_remaining_no_units,
    output logic        o_read_bias
);

    localparam
        MAX_NO_UNITS            = 3,
        NO_UNITS_LSTM           = 3,
        NO_UNITS_FC             = 3,
        NO_FEATURES             = 2,
        NO_TIMESTEPS            = 1,
        NO_SAMPLES              = 1,
        
        LSTM                    = 1,
        FC                      = 2,
        
        W_BITWIDTH              = 8,
        IN_BITWIDTH             = 8,
        OUT_BITWIDTH            = 32,
        B_BITWIDTH              = 32,
        SIZE_BUFFER             = 10,
        N_WEIGHTS               = 4,
        N_BIASES                = 4,
        N_INPUTS                = 1,
        N_GATES                 = 4,
        
        STATE_IDLE              = 3'd0,
        STATE_CONFIG            = 3'd1,
        STATE_RDATA             = 3'd2,
        STATE_RUN               = 3'd3,
        STATE_WBACK             = 3'd4,
        STATE_FINISH            = 3'd5,
        STATE_WAIT              = 3'd6,
        
        
        WREAD                   = 3'd0,
        IREAD                   = 3'd1,
        BREAD                   = 3'd2,
        CREAD                   = 3'd3,
        LOAD                    = 3'd4,
        
        IGATE                   = 2'd0,
        FGATE                   = 2'd1,
        CGATE                   = 2'd2,
        OGATE                   = 2'd3,
        
        LDATA                   = 1'd0,
        WDATA                   = 1'd1;
    
    
    logic [4:0]                             current_timestep;
    logic [4:0]                             current_sample;
    
    logic [2:0]                             r_state;
    logic                                   w_state;
    logic [2:0]                             state;
    logic [1:0]                             type_gate;
    
    logic [1:0]                             counter;
    
    logic                                   data_receive_done;
    logic                                   data_load_done;
    logic                                   config_done;
    logic                                   run_done;
    logic                                   wb_done;
    logic                                   finish_done;
    
    logic                                   is_continued;
    logic                                   is_last_input;
    logic                                   is_last_timestep;
    logic                                   is_last_sample;
    logic                                   is_load_bias;
    logic                                   is_load_cell;
    logic                                   lstm_is_waiting [0:MAX_NO_UNITS-1];
    logic                                   read_bias;
    // Signals for lstm unit
    
    logic   [W_BITWIDTH*3-1:0]              weight_bf   [0:N_GATES*MAX_NO_UNITS-1];
    logic   [IN_BITWIDTH*3-1:0]             input_bf    ;
    logic   [B_BITWIDTH-1:0]                bias_bf     [0:N_GATES*MAX_NO_UNITS-1];

//    logic   [W_BITWIDTH*3-1:0]              weight_bf   [0:N_WEIGHTS-1];
//    logic   [W_BITWIDTH*3-1:0]              input_bf    ;
//    logic   [B_BITWIDTH-1:0]                bias_bf     [0:N_BIASES-1];
    
    logic   [7:0]                           current_buffer_index;
    logic   [7:0]                           current_weight_index;
    logic   [7:0]                           current_input_index;
    logic   [7:0]                           current_bias_index;  
    
    logic   [7:0]                           max_buffer_index;
    logic   [6:0]                           current_no_units;
    logic   [6:0]                           remaining_no_units;
    logic   [1:0]                           current_layer;
//    logic   [1:0]                           type_read;
    
    logic                                   lstm_unit_en;
    logic  [W_BITWIDTH*3-1:0]               weight      [0:MAX_NO_UNITS-1]; 
    logic  [IN_BITWIDTH*3-1:0]              data_input;
    logic  [OUT_BITWIDTH-1:0]               pre_sum     [0:MAX_NO_UNITS-1];
    logic                                   lstm_finish_step [0:MAX_NO_UNITS-1];
    logic                                   lstm_unit_done  [0:MAX_NO_UNITS-1];
    logic  [7:0]                            lstm_unit_result [0:MAX_NO_UNITS-1];
    
//    logic  [31:0]                           accu_bf;
    
    assign o_state = state;
    assign weights[0] = genblk1[MAX_NO_UNITS-1].u_lstm_unit.u_mac.weights_0;
    assign weights[1] = genblk1[MAX_NO_UNITS-1].u_lstm_unit.u_mac.weights_1;
    assign weights[2] = genblk1[MAX_NO_UNITS-1].u_lstm_unit.u_mac.weights_2;
    assign inputs[0]  = genblk1[MAX_NO_UNITS-1].u_lstm_unit.u_mac.data_in_0;
    assign inputs[1]  = genblk1[MAX_NO_UNITS-1].u_lstm_unit.u_mac.data_in_1;
    assign inputs[2]  = genblk1[MAX_NO_UNITS-1].u_lstm_unit.u_mac.data_in_2;
    assign bias       = genblk1[MAX_NO_UNITS-1].u_lstm_unit.u_mac.pre_sum;
    assign o_is_load_bias = is_load_bias;
    assign o_index    = current_buffer_index;
    assign o_mac_state = genblk1[MAX_NO_UNITS-1].u_lstm_unit.u_mac.state;
    assign o_is_last_input = is_last_input;
    assign o_lstm_accu_bf = genblk1[MAX_NO_UNITS-1].u_lstm_unit.accu_bf;
    assign o_mac_result = genblk1[MAX_NO_UNITS-1].u_lstm_unit.mac_result;    
    assign o_type_gate  = genblk1[MAX_NO_UNITS-1].u_lstm_unit.type_gate;
    assign o_gate = genblk1[MAX_NO_UNITS-1].u_lstm_unit.gate;
    assign o_value_gate[0] = genblk1[MAX_NO_UNITS-1].u_lstm_unit.input_gate;
    assign o_value_gate[1] = genblk1[MAX_NO_UNITS-1].u_lstm_unit.forget_gate;
    assign o_value_gate[2] = genblk1[MAX_NO_UNITS-1].u_lstm_unit.cell_update;
    assign o_value_gate[3] = genblk1[MAX_NO_UNITS-1].u_lstm_unit.output_gate;
    assign o_is_load_cell = is_load_cell;
    assign o_r_state = r_state;
    assign o_prev_cell_bf = genblk1[MAX_NO_UNITS-1].u_lstm_unit.prev_cell_bf;
//    assign o_cell_state = genblk1[NO_UNITS-1].u_lstm_unit.cell_state;
//    assign o_tanh_cell_state = genblk1[NO_UNITS-1].u_lstm_unit.tanh_cell_state_bf;
    assign o_ht = genblk1[MAX_NO_UNITS-1].u_lstm_unit.hidden_state;
    assign o_lstm_state = genblk1[MAX_NO_UNITS-1].u_lstm_unit.state;
    assign o_lstm_finish_step = genblk1[MAX_NO_UNITS-1].u_lstm_unit.finish_step;
    assign o_current_timestep = current_timestep;
    assign o_lstm_unit_result[0] = lstm_unit_result[0];
    assign o_lstm_unit_result[1] = lstm_unit_result[1];
    assign o_lstm_unit_result[2] = lstm_unit_result[2];
//    assign o_lstm_unit_result[3] = lstm_unit_result[3];
    assign o_current_no_units = current_no_units;
    assign o_remaining_no_units = remaining_no_units;
    assign o_read_bias = read_bias;
    genvar i;
    
    generate
        for (i = 0; i < MAX_NO_UNITS; i = i+1) begin
            lstm_unit #(.W_BITWIDTH(W_BITWIDTH), .OUT_BITWIDTH(OUT_BITWIDTH)) u_lstm_unit (
                .clk(clk),
                .rstn(rstn),
                .en(lstm_unit_en),
                .is_last_input(is_last_input),
                .is_last_data_gate(is_last_data_gate),
                .is_last_timestep(is_last_timestep),
                .is_last_sample(is_last_sample),
                .is_continued(is_continued),
                .is_load_bias(is_load_bias),
                .is_load_cell(is_load_cell),
                .type_gate(type_gate),
                .weight(weight[i]),
                .data_in(data_input),
                .pre_sum(pre_sum[i]),
                .is_waiting(lstm_is_waiting[i]),
                .finish_step(lstm_finish_step[i]),
                .done(lstm_unit_done[i]),
                .out(lstm_unit_result[i])
            );
        end
    endgenerate
        
    assign o_lstm_is_continued = is_continued;
    assign o_lstm_is_waiting = lstm_is_waiting[MAX_NO_UNITS-1];
//    assign o_lstm_unit_done = lstm_unit_done[[NO_UNITS-1]];

    // implement FSM for controller
    always @(posedge clk or negedge rstn) begin
        if (!rstn) begin
            state               <= STATE_CONFIG;
            
            data_receive_done   <= 1'b0;
            run_done            <= 1'b0;
            config_done         <= 1'b0;
            wb_done             <= 1'b0;
            finish_done         <= 1'b0;
            counter             <= 2'b0;
            current_timestep    <= 0;
            current_layer       <= LSTM;
            current_no_units    <= 0;
            remaining_no_units  <= NO_UNITS_LSTM;
            current_sample      <= 0;
        end
        else begin
            case(state)
                STATE_CONFIG: begin
                    if (config_done) begin
                        state       <= STATE_IDLE;
                        read_bias   <= 1'b0;
                        config_done <= 1'b0;
                    end
                    else begin
                        if (current_layer == LSTM) begin
                            if (remaining_no_units >= MAX_NO_UNITS) begin
                                current_no_units    <= MAX_NO_UNITS;
                                remaining_no_units  <= remaining_no_units - MAX_NO_UNITS;
                            end
                            else begin
                                current_no_units    <= remaining_no_units;
                                remaining_no_units  <= 0;
                            end
                        end
                        else if (current_layer == FC) begin
                            
                        end
                        config_done     <= 1'b1;
                    end
                end
                
                STATE_IDLE: begin
//                    weight              <= {(W_BITWIDTH*3){1'b0}};
//                    data_input          <= {(IN_BITWIDTH*3){1'b0}};
//                    pre_sum             <= {OUT_BITWIDTH{1'b0}};
                    
                    is_last_timestep    <= 1'b0;
                    is_last_sample      <= 1'b0;
                    data_receive_done   <= 1'b0;
                    data_load_done      <= 1'b0;
                    wb_done             <= 1'b0;
                    run_done            <= 1'b0;
                    finish_done         <= 1'b0;
                    counter             <= 2'b0;
                    t_valid             <= 1'b0;
                    is_load_bias        <= 1'b0;
                    is_load_cell        <= 1'b0;
                    is_last_input       <= 1'b0;
//                    read_bias           <= 1'b0;
                    
                    current_weight_index    <= 8'b0;
                    current_input_index     <= 8'b0;
                    current_buffer_index    <= 8'b0;
                    current_bias_index      <= 8'b0;
//                    current_sample          <= 0;
                    
                    current_timestep        <= 0;
                    
                    if (r_valid) begin
                        type_gate   <= IGATE;
                        state       <= STATE_RDATA;
                        r_state     <= WREAD;
                        w_state     <= LDATA;
                    end
                end
             
                STATE_RDATA: begin
                    if (data_receive_done && data_load_done) begin
                        data_load_done          <= 1'b0;
                        current_buffer_index    <= 8'b0;
                        r_state                 <= LOAD;
                        state                   <= STATE_RUN;
                    end
                    else if (!data_receive_done) begin       
                        case(r_state)
                            WREAD: begin
                                weight_bf[current_buffer_index] <= data_in[W_BITWIDTH*3-1:0];
                                if (current_buffer_index == N_GATES*current_no_units-1) begin // max_buffer = N_GATES*NO_UNITS-1
                                    current_buffer_index    <= 0;
                                    r_state                 <= IREAD;
                                end 
                                else current_buffer_index   <= current_buffer_index + 1;
                            end
                            IREAD: begin
                                input_bf                    <= data_in[IN_BITWIDTH*3-1:0];
                                if (current_buffer_index == N_INPUTS-1) begin
                                    current_buffer_index    <= 0;
                                    if (read_bias) begin
                                        case(is_last_data_gate) 
                                            0: begin 
                                                r_state             <= LOAD;
                                                data_receive_done   <= 1'b1;
                                                r_data              <= 1'b0;
                                            end
                                            1: r_state      <= CREAD;
                                        endcase
                                    end
                                    else r_state <= BREAD;
                                end 
                                else current_buffer_index   <= current_buffer_index + 1;
                            end
                            BREAD: begin
                                bias_bf[current_buffer_index]   <= data_in;
                                is_load_bias                <= 1'b1;
                                if (current_buffer_index == N_GATES*current_no_units-1) begin
                                    current_buffer_index    <= 0;
                                    r_state                 <= LOAD;
                                    data_receive_done       <= 1'b1;
                                    r_data                  <= 1'b0;
                                    read_bias               <= 1'b1;
                                end 
                                else current_buffer_index   <= current_buffer_index + 1;       
                            end
                            CREAD: begin
                                bias_bf[(N_GATES-1)*current_no_units + current_buffer_index] <= {{24{1'b0}},data_in[IN_BITWIDTH-1:0]};
                                if (current_buffer_index == current_no_units-1) begin
                                    current_buffer_index    <= 0;
                                    is_load_cell                <= 1'b1;
                                    data_receive_done           <= 1'b1;
                                    r_data                      <= 1'b0;
                                    r_state                     <= LOAD;
                                end
                                else current_buffer_index   <= current_buffer_index + 1;
                            end
                        endcase
                    end
                    else begin
                        
                        current_weight_index    <= current_weight_index + 1;
                        current_bias_index      <= current_bias_index + 1;
                        current_buffer_index    <= current_buffer_index + 1;
                        
                        weight[current_buffer_index]    <= weight_bf[current_weight_index][W_BITWIDTH*3-1:0];
                        data_input                      <= input_bf[IN_BITWIDTH*3-1:0];
                        pre_sum[current_buffer_index]   <= bias_bf[current_bias_index][OUT_BITWIDTH-1:0];
                        
                        if (current_buffer_index == current_no_units-1) begin
                            current_buffer_index    <= 0;                            
                            data_load_done      <= 1'b1;
                            if (current_weight_index == N_GATES*current_no_units-1)  is_last_input <= 1'b1;
                            else is_last_input  <= 1'b0;
                        end
                    end
                end
                
                STATE_RUN: begin
                     if (run_done) begin
                        is_continued    <= 1'b0;
                        run_done        <= 1'b0;
                        if (is_last_input && is_last_data_gate) begin
                            state           <= STATE_WBACK;
                            lstm_unit_en    <= 1'b0;
//                            w_valid         <= 1'b1;
                        end
                        else begin
                            case(is_last_input) 
                                0: begin
                                    state           <= STATE_RDATA;
                                    r_state         <= LOAD;
                                    type_gate       <= type_gate+1;
                                end
                                1: begin
                                    state           <= STATE_WAIT;
                                    r_data          <= 1'b1;
                                end
                            endcase
                        end                        
                     end
                     else begin
                        lstm_unit_en    <= 1'b1;
                        
                        if (lstm_finish_step[current_no_units-1] || lstm_unit_done[current_no_units-1] || lstm_is_waiting[current_no_units-1]) begin
                            run_done        <= 1'b1;
                            is_continued    <= 1'b0;
                        end
                        else is_continued   <= 1'b1;
                     end
                end  
                
                STATE_WAIT: begin
                    is_last_timestep    <= 1'b0;
                    data_receive_done   <= 1'b0;
                    data_load_done      <= 1'b0;
                    wb_done             <= 1'b0;
                    run_done            <= 1'b0;
                    finish_done         <= 1'b0;
                    counter             <= 2'b0;
                    t_valid             <= 1'b0;
                    is_load_bias        <= 1'b0;
                    is_load_cell        <= 1'b0;
                    is_last_input       <= 1'b0;
//                    read_bias           <= 1'b0;
                    
                    current_weight_index    <= 8'b0;
                    current_input_index     <= 8'b0;
                    current_buffer_index    <= 8'b0;
                    current_bias_index      <= 8'b0;
                                        
                    if (r_valid) begin
                        type_gate   <= IGATE;
                        state       <= STATE_RDATA;
                        r_state     <= WREAD;
                        w_state     <= LDATA;
                    end
                end
                
                STATE_WBACK: begin
                    if (wb_done) begin
                        w_valid <= 0;
                        wb_done <= 0;
                        if (current_timestep == NO_TIMESTEPS-1) begin
                            if (remaining_no_units == 0) begin
                                if (current_sample == NO_SAMPLES - 1) begin
                                    current_sample  <= 0;
                                    state   <= STATE_FINISH;
                                end
                                else begin
//                                    state               <= STATE_RDATA;
                                    state               <= STATE_CONFIG;
                                    current_sample      <= current_sample + 1;
                                    remaining_no_units  <= NO_UNITS_LSTM;
                                    current_no_units    <= 0;
//                                    r_state             <= WREAD;
//                                    w_state             <= LDATA;
//                                    type_gate           <= IGATE;
        
//                                    is_last_timestep    <= 1'b0;
//                                    data_receive_done   <= 1'b0;
//                                    data_load_done      <= 1'b0;
//                                    wb_done             <= 1'b0;
//                                    run_done            <= 1'b0;
//                                    finish_done         <= 1'b0;
                                    
//                                    t_valid             <= 1'b0;
//                                    is_load_bias        <= 1'b0;
//                                    is_load_cell        <= 1'b0;
//                                    is_last_input       <= 1'b0;
//                                    read_bias           <= 1'b0;
                                    
//                                    current_weight_index    <= 8'b0;
//                                    current_input_index     <= 8'b0;
//                                    current_buffer_index    <= 8'b0;
//                                    current_bias_index      <= 8'b0;
                                    
                                    current_timestep        <= 0;
                                    
                                    if (current_sample == NO_SAMPLES - 2) is_last_sample    <= 1;
                                    else  is_last_sample <= 1;
                                end
                            end
                            else begin
                                state           <= STATE_CONFIG;
                            end
                            
                        end
                        else begin
                            current_timestep    <= current_timestep + 1;
                            state               <= STATE_RDATA;
                            r_state             <= WREAD;
                            w_state             <= LDATA;
                            type_gate           <= IGATE;

                            is_last_timestep    <= 1'b0;
                            data_receive_done   <= 1'b0;
                            data_load_done      <= 1'b0;
                            wb_done             <= 1'b0;
                            run_done            <= 1'b0;
                            finish_done         <= 1'b0;
//                            counter             <= 2'b0;
                            t_valid             <= 1'b0;
                            is_load_bias        <= 1'b0;
                            is_load_cell        <= 1'b0;
                            is_last_input       <= 1'b0;
                            read_bias           <= 1'b0;
                            
                            current_weight_index    <= 8'b0;
                            current_input_index     <= 8'b0;
                            current_buffer_index    <= 8'b0;
                            current_bias_index      <= 8'b0;
                                                       
                            if (current_timestep == NO_TIMESTEPS - 2) is_last_timestep <= 1'b1;
                            else    is_last_timestep <= 1'b0;
                        end   
                    end
                    else begin
                        if (current_buffer_index > current_no_units - 1) begin
                            current_buffer_index    <= 0;
                            w_valid <= 0;
                            wb_done <= 1;
                            out_data    <= {32{1'b0}};
                        end
                        else begin
                            w_valid         <= 1'b1;
                            current_buffer_index <= current_buffer_index + 3;
                            if (current_buffer_index == current_no_units - 1) begin
                                out_data    <= {{24{1'b0}}, lstm_unit_result[current_buffer_index]};
                            end
                            else if (current_buffer_index == current_no_units - 2) begin
                                out_data    <= {{16{1'b0}}, lstm_unit_result[current_buffer_index+1], lstm_unit_result[current_buffer_index]};
                            end
                            else if (current_buffer_index <= current_no_units - 3) begin
                                out_data    <= {{8{1'b0}}, lstm_unit_result[current_buffer_index+2], lstm_unit_result[current_buffer_index+1], lstm_unit_result[current_buffer_index]};
                            end
                        end
                    end
                end
                
                STATE_FINISH: begin
                    if (finish_done) begin
                        state           <= STATE_IDLE;
                        finish_done     <= 1'b0;
                        t_valid         <= 1'b1;
                    end
                    else begin
                        finish_done     <= 1'b1;
                    end
                end
            endcase
        end
    end
    
    
endmodule
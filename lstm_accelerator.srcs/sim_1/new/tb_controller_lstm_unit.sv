`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/06/2024 07:51:46 PM
// Design Name: 
// Module Name: tb_controller_lstm_unit
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
class GenerateInput;
    randc   bit[31:0]   input_bf;
    constraint c_input  { input_bf  <= 32'h00_ff_ff_ff; }
endclass

class GenerateWeight;
    randc   bit[31:0]   weight_bf;
    constraint c_weight { weight_bf <= 32'h00_ff_ff_ff; }
endclass

class GenerateBias;
    randc   bit[31:0]   bias_bf;
    constraint c_bias_bf { bias_bf <= 32'hff_ff_ff_ff; }
endclass

class GenerateCell;
    randc   bit[31:0]   cell_bf;
    constraint c_cell_bf { cell_bf <= 32'h00_00_00_ff; }
endclass

module tb_controller_lstm_unit();

    localparam      NO_UNITS = 32;
    localparam      NO_FEATURES = 9;
    localparam      NO_TIMESTEPS = 28;
    
    logic               clk;
    logic               rstn;
    logic               r_valid;
    logic               is_last_data_gate;
    logic [31:0]        data_in;
    logic               r_data;
    logic               w_valid;
    logic               t_valid;
    logic [31:0]        out_data [0:3];
    logic [2:0]         o_state;
    logic [2:0]         o_lstm_state;
    logic [1:0]         o_mac_state;
    logic [2:0]         o_r_state;
    logic               o_lstm_unit_done;
    logic               o_lstm_is_continued;
    logic               o_lstm_is_waiting;
    logic [1:0]         o_type_gate;
    logic [1:0]         o_gate;
    logic [7:0]         o_value_gate [0:3];
    logic [31:0]        o_cell_state;
    logic [7:0]         weights [0:2];
    logic [7:0]         inputs [0:2];
    logic [31:0]        bias;
    logic               o_is_load_bias;
    logic               o_is_load_cell;
    logic               o_is_last_input;
    logic [7:0]         o_index;
    logic [31:0]        o_lstm_accu_bf;
    logic [31:0]        o_mac_result;
    logic [7:0]         o_prev_cell_bf;
    logic [7:0]         o_tanh_cell_state;
    logic [31:0]        o_ht;
    
    logic [31:0]        expected_input_gate [0:NO_UNITS-1];
    logic [31:0]        expected_forget_gate [0:NO_UNITS-1];
    logic [31:0]        expected_cell_gate [0:NO_UNITS-1];
    logic [31:0]        expected_output_gate [0:NO_UNITS-1];
    
    logic [31:0]        weight_array [0:4*NO_UNITS-1];
    logic [31:0]        input_array;
    logic [31:0]        bias_array [0:4*NO_UNITS-1];
    logic [31:0]        cell_array [0:NO_UNITS-1];

    logic [31:0]        h_t [0:NO_TIMESTEPS-1][0:(NO_UNITS-1)/3 + 1];         

    
    logic [7:0]     current_unit;
    logic           wrong_flag;
    
    controller uut (
        .clk(clk),
        .rstn(rstn),
        .r_valid(r_valid),
        .is_last_data_gate(is_last_data_gate),
        .data_in(data_in),
        .r_data(r_data),
        .w_valid(w_valid),
        .t_valid(t_valid),
        .out_data(out_data),
        .o_state(o_state),
//        .o_lstm_unit_done(o_lstm_unit_done),
        .o_lstm_state(o_lstm_state),
        .o_lstm_is_continued(o_lstm_is_continued),
//        .o_lstm_is_waiting(o_lstm_is_waiting),
        .weights(weights),
        .inputs(inputs),
        .bias(bias),
        .o_is_load_bias(o_is_load_bias),
        .o_index(o_index),
        .o_mac_state(o_mac_state),
        .o_is_last_input(o_is_last_input),
        .o_lstm_accu_bf(o_lstm_accu_bf),
        .o_mac_result(o_mac_result),
        .o_type_gate(o_type_gate),
        .o_gate(o_gate),
        .o_value_gate(o_value_gate),
        .o_is_load_cell(o_is_load_cell),
        .o_r_state(o_r_state),
        .o_prev_cell_bf(o_prev_cell_bf),
        .o_cell_state(o_cell_state),
        .o_tanh_cell_state(o_tanh_cell_state),
        .o_ht(o_ht)
    );
    
    always #5 begin 
        clk = ~clk;
         
    end
    integer index;
    integer iter;
    
    GenerateInput   input_pkt;
    GenerateWeight  weight_pkt;
    GenerateBias    bias_pkt;
    GenerateCell    cell_pkt;
    
    initial begin
        wrong_flag   = 0;
        current_unit = 0;
        index = 0;
        iter = 0;
        for (current_unit = 0; current_unit < NO_UNITS; current_unit = current_unit + 1) begin
            expected_input_gate[current_unit] = 0;
            expected_forget_gate[current_unit] = 0;
            expected_cell_gate[current_unit] = 0;
            expected_output_gate[current_unit] = 0;
        end

        input_pkt       = new ();
        weight_pkt      = new ();
        bias_pkt        = new ();
        cell_pkt        = new ();
        
        clk  = 1'b0;
        rstn = 1'b0;
        r_valid = 1'b0;
        data_in = 32'd0;
        
        repeat(10)
            @(negedge clk);
        rstn = 1'b1;
        
        repeat(10)
            @(negedge clk);
    
        r_valid = 1'b1;
        //////1st///////
        $display("///////////////////////////////////////////////////////////");
        $display("//////////////////// Test No[%0d] Start /////////////////////", index);
        $display("///////////////////////////////////////////////////////////\n");
        
//        NO_FEATURES = 28;
        
        repeat(NO_FEATURES) begin
            index = 0;
            repeat(4*NO_UNITS) begin
                weight_pkt.randomize();
                @(negedge clk);
                data_in = weight_pkt.weight_bf;
                weight_array[index] = weight_pkt.weight_bf;
                index = index + 1;
            end
            
            index = 0;
            repeat(1) begin
                input_pkt.randomize();
                @(negedge clk);
                data_in = input_pkt.input_bf;
                input_array = input_pkt.input_bf;
    //            index = index + 1;
            end
            
            if (iter==0) begin
                index = 0;
                repeat(4*NO_UNITS) begin
                    bias_pkt.randomize();
                    @(negedge clk);
                    data_in = bias_pkt.bias_bf;
                    bias_array[index]  =  bias_pkt.bias_bf;
                    index = index + 1;
                end
                for (current_unit = 0; current_unit < NO_UNITS; current_unit = current_unit + 1) begin
                    expected_input_gate[current_unit] = bias_array[current_unit];
                    expected_forget_gate[current_unit] = bias_array[current_unit + NO_UNITS];
                    expected_cell_gate[current_unit] = bias_array[current_unit + NO_UNITS*2];
                    expected_output_gate[current_unit] = bias_array[current_unit + NO_UNITS*3];
                end
            end
            else ;
            
            if (is_last_data_gate) begin
                index = 0;
                repeat(2) begin
                    cell_pkt.randomize();
                    @(negedge clk);
                    data_in = cell_pkt.cell_bf;
                    cell_array[index] = cell_pkt.cell_bf;
                    index = index + 1;
                end
            end
            else;
            for (current_unit = 0; current_unit < NO_UNITS; current_unit = current_unit + 1) begin
                expected_input_gate[current_unit] = expected_input_gate[current_unit] + weight_array[current_unit][7:0]*input_array[7:0] + weight_array[current_unit][15:8]*input_array[15:8] + weight_array[current_unit][23:16]*input_array[23:16];
                expected_forget_gate[current_unit] = expected_forget_gate[current_unit] + weight_array[current_unit + NO_UNITS][7:0]*input_array[7:0] + weight_array[current_unit + NO_UNITS][15:8]*input_array[15:8] + weight_array[current_unit + NO_UNITS][23:16]*input_array[23:16];
                expected_cell_gate[current_unit] = expected_cell_gate[current_unit] + weight_array[current_unit + NO_UNITS*2][7:0]*input_array[7:0] + weight_array[current_unit + NO_UNITS*2][15:8]*input_array[15:8] + weight_array[current_unit + NO_UNITS*2][23:16]*input_array[23:16];
                expected_output_gate[current_unit] = expected_output_gate[current_unit] + weight_array[current_unit + NO_UNITS*3][7:0]*input_array[7:0] + weight_array[current_unit + NO_UNITS*3][15:8]*input_array[15:8] + weight_array[current_unit + NO_UNITS*3][23:16]*input_array[23:16];
            end
                       
            repeat(1) begin
                @(negedge clk);
                r_valid = 1'b0;
                data_in = 32'd0;
            end
            if (iter < NO_FEATURES-1) begin
                iter = iter + 1;
                is_last_data_gate = 1'b0;
                wait(r_data);
                @(negedge clk);
                r_valid = 1'b1;
            end
            else ; 
            
            if (iter == NO_FEATURES-1) is_last_data_gate = 1'b1;
            else ;
            
        end  
        
        index = 0;
        wait(w_valid);
        @(negedge clk);
        while (w_valid) begin
            for (current_unit = 0; current_unit < NO_UNITS; current_unit = current_unit + 1) begin
                @(negedge clk);
                if (out_data[0] === expected_input_gate[current_unit] && out_data[1] === expected_forget_gate[current_unit] && out_data[2] === expected_cell_gate[current_unit] && out_data[3] === expected_output_gate[current_unit]) begin
                    $display("[Unit no.%0d CORRECT] Expected Result = [%0h, %0h, %0h, %0h], Real result = [%0h, %0h, %0h, %0h]", current_unit, expected_input_gate[current_unit], expected_forget_gate[current_unit], expected_cell_gate[current_unit], expected_output_gate[current_unit], out_data[0], out_data[1], out_data[2], out_data[3]);
               end
                else begin
                    $display("[Unit no.%0d WRONG] Expected Result = [%0h, %0h, %0h, %0h], Real result = [%0h, %0h, %0h, %0h]", current_unit, expected_input_gate[current_unit], expected_forget_gate[current_unit], expected_cell_gate[current_unit], expected_output_gate[current_unit], out_data[0], out_data[1], out_data[2], out_data[3]);
                    wrong_flag = 1;
                end
            end
        end
        
        wait(t_valid);
        if (!wrong_flag) begin
            $display("\n#####################################################");
            $display("-----------------------------------------------------");
            $display("\n!!!!!!!!!!!!!!!!   TESTCASE PASS   !!!!!!!!!!!!!!!!!!\n");
            $display("-----------------------------------------------------");
            $display("#####################################################");
        end
        else begin
            $display("\n#####################################################");
            $display("-----------------------------------------------------");
            $display("\n!!!!!!!!!!!!!!!!   TESTCASE FAIL   !!!!!!!!!!!!!!!!!!\n");
            $display("-----------------------------------------------------");
            $display("#####################################################");
        end
            $display("\n---------------------- END ------------------------");    
        
        /*    
        repeat(10) begin
            pkt.randomize();
            if (index != 0) begin 
                pkt.pre_sum_bf = 32'h0;
            end
            else ;
            
            expected_value = accumulation + (pkt.weight_bf[7:0] * pkt.input_bf[7:0]) + (pkt.weight_bf[15:8] * pkt.input_bf[15:8]) + (pkt.weight_bf[23:16] * pkt.input_bf[23:16]) + pkt.pre_sum_bf[18:0];
            
            clk  = 1'b0;
            rstn = 1'b0;
            r_valid = 1'b0;
            data_in = 32'd0;
            
            repeat(10)
                @(negedge clk);
            rstn = 1'b1;
            
            //////1st///////
            $display("///////////////////////////////////////////////////////////");
            $display("//////////////////// Test No[%0d] Start /////////////////////", index);
            $display("///////////////////////////////////////////////////////////\n");
    
            repeat(10)
                @(negedge clk);
    
            r_valid = 1'b1;
            
            @(negedge clk) begin
                data_in = pkt.weight_bf;
            end
            
            @(negedge clk) begin
                data_in = pkt.input_bf;
            end
            
            @(negedge clk) begin
                data_in = pkt.pre_sum_bf;
            end
                
            @(negedge clk);
            r_valid = 1'b0;
            data_in = 32'd0;
            $display("Weight[2, 1, 0] = [%0h, %0h, %0h]", uut.weights_2, uut.weights_1, uut.weights_0);
            $display("input[2, 1, 0] = [%0h, %0h, %0h], pre_sum = %0h \n", uut.data_in_2, uut.data_in_1, uut.data_in_0, uut.pre_sum);
            wait(t_valid);
            
            if (out_data === expected_value) begin
                $display("///////////////////////////////////////////////////////////\n");
                $display("Expected Result = %0h, Real result = %0h", expected_value, out_data);
                $display("-------------Test No[%0d]: Result is correct!------------", index);
                $display("///////////////////////////////////////////////////////////\n");
            end
            else begin
                $display("///////////////////////////////////////////////////////////");
                $display("Expected Result = %0h, Real result = %0h", expected_value, out_data);
                $display("--------------- Test No[%0d]: Result is wrong! ----------------", index);
                $display("///////////////////////////////////////////////////////////\n");
            end
        end
        */
    end
    
endmodule

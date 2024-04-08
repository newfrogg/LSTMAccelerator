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
    constraint c_bias_bf { bias_bf <= 32'h00_07_ff_ff; }
endclass

module tb_controller_lstm_unit();
    logic               clk;
    logic               rstn;
    logic               r_valid;
    logic [31:0]        data_in;
    logic               t_valid;
    logic [31:0]        out_data;
    logic [1:0]         o_state;
    logic               o_lstm_unit_done;
    logic [2:0]         o_lstm_state;
    logic               o_lstm_is_continued;
    logic               o_lstm_is_waiting;
    logic [7:0]         weights [0:2];
    logic [7:0]         inputs [0:2];
    logic [18:0]        bias;
    logic               o_is_load_bias;
    logic [3:0]         o_index;
    
    logic [31:0]        expected_value;
    logic [31:0]        accumulation;
    
    logic [31:0]    weight_array [0:9];
    logic [31:0]    input_array  [0:9];
    logic [31:0]    bias_array;

    
    controller uut (
        .clk(clk),
        .rstn(rstn),
        .r_valid(r_valid),
        .data_in(data_in),
        .t_valid(t_valid),
        .out_data(out_data),
        .o_state(o_state),
        .o_lstm_unit_done(o_lstm_unit_done),
        .o_lstm_state(o_lstm_state),
        .o_lstm_is_continued(o_lstm_is_continued),
        .o_lstm_is_waiting(o_lstm_is_waiting),
        .weights(weights),
        .inputs(inputs),
        .bias(bias),
        .o_is_load_bias(o_is_load_bias),
        .o_index(o_index)
    );
    
    always #5 begin 
        clk = ~clk;
         
    end
    integer index;
    GenerateInput   input_pkt;
    GenerateWeight  weight_pkt;
    GenerateBias    bias_pkt;
    
    initial begin
//        weight_bf   = 32'h00_ab_12_34;
//        input_bf    = 32'h00_cd_ae_0a;
//        pre_sum_bf  = 32'h00_05_ab_cd;
        index = 0;
        expected_value    = 0;
        input_pkt       = new ();
        weight_pkt      = new ();
        bias_pkt        = new ();
        
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
        
        repeat(10) begin
            weight_pkt.randomize();
            @(negedge clk);
            data_in = weight_pkt.weight_bf;
            weight_array[index] = weight_pkt.weight_bf;
            index = index + 1;
        end
        
        index = 0;
        repeat(10) begin
            input_pkt.randomize();
            @(negedge clk);
            data_in = input_pkt.input_bf;
            input_array[index] = input_pkt.input_bf;
            index = index + 1;
        end
        
        index = 0;
        repeat(1) begin
            bias_pkt.randomize();
            @(negedge clk);
            data_in = bias_pkt.bias_bf;
            bias_array[index] =  bias_pkt.bias_bf;
        end
        
        for (index = 0; index < 10; index = index + 1) begin
            expected_value = expected_value + weight_array[index][7:0]*input_array[index][7:0] + weight_array[index][15:8]*input_array[index][15:8] + weight_array[index][23:16]*input_array[index][23:16];
        end
        
        expected_value = expected_value + bias_array[0];
        
        repeat(1) begin
            @(negedge clk);
            r_valid = 1'b0;
            data_in = 32'd0;
        end
        
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

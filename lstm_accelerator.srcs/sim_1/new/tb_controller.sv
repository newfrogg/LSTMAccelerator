`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/05/2024 05:02:23 PM
// Design Name: 
// Module Name: tb_controller
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

    randc   bit[31:0]   weight_bf;
    randc   bit[31:0]   input_bf;
    randc   bit[31:0]   pre_sum_bf;
    
    constraint c_weight { weight_bf <= 32'h00_ff_ff_ff; }
    constraint c_input  { input_bf  <= 32'h00_ff_ff_ff; }
    constraint c_pre_sum { pre_sum_bf <= 32'h00_07_ff_ff; }
    
endclass

module tb_controller();
    logic               clk;
    logic               rstn;
    logic               r_valid;
    logic [31:0]        data_in;
    logic               t_valid;
    logic [31:0]        out_data;
    
    logic [31:0]        weight_bf;
    logic [31:0]        input_bf;
    logic [31:0]        pre_sum_bf;
//    logic [31:0]        out_bf;
    logic [1:0]         o_state;
    logic [2:0]         o_index;
    logic [9:0]         o_sum_arr_bf    [0:7];
    logic [31:0]        expected_value;
    
    controller uut (
        .clk(clk),
        .rstn(rstn),
        .r_valid(r_valid),
        .data_in(data_in),
        .t_valid(t_valid),
        .out_data(out_data),
        .o_state(o_state),
        .o_index(o_index),
        .o_sum_arr_bf(o_sum_arr_bf)
    );
    
    always #5 begin 
        clk = ~clk;
         
    end
    integer index;
    GenerateInput pkt;
    initial begin
//        weight_bf   = 32'h00_ab_12_34;
//        input_bf    = 32'h00_cd_ae_0a;
//        pre_sum_bf  = 32'h00_05_ab_cd;
        index = 0;
        pkt = new ();
        
        repeat(10) begin
            pkt.randomize();
            
            expected_value = (pkt.weight_bf[7:0] * pkt.input_bf[7:0]) + (pkt.weight_bf[15:8] * pkt.input_bf[15:8]) + (pkt.weight_bf[23:16] * pkt.input_bf[23:16]) + pkt.pre_sum_bf[18:0];
            
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
                $display("///////////////////////////////////////////////////////////");
                $display("///////////////// Test No[%0d]: Result is correct! ////////", index);
                $display("///////////////////////////////////////////////////////////\n");
            end
            else begin
                $display("///////////////////////////////////////////////////////////");
                $display("////////////////// Test No[%0d]: Result is wrong! /////////", index);
                $display("///////////////////////////////////////////////////////////\n");
            end
            index = index + 1;
        end
    end
    
endmodule

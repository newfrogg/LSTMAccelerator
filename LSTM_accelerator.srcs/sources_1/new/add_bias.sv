`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/14/2024 05:21:39 PM
// Design Name: 
// Module Name: add_bias
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


module add_bias #(parameter NUMBER_OF_FEATURES = 28,
                  parameter NUMBER_OF_UNITS = 64) (
                  input logic   clk,
                  input logic   rst_n,
                  input logic   enable_bias,
                  input logic   [31:0] output_input_1,
                  input logic   [31:0] output_forget_1,
                  input logic   [31:0] output_cell_update_1,
                  input logic   [31:0] output_output_1,
                  input logic   [31:0] input_bias,
                  input logic   [31:0] forget_bias,
                  input logic   [31:0] cell_bias,
                  input logic   [31:0] output_bias,
                  output logic  finish_bias,
                  output logic  [31:0] output_input_2,
                  output logic  [31:0] output_forget_2,
                  output logic  [31:0] output_cell_update_2,
                  output logic  [31:0] output_output_2
    );
    
//    reg [31:0] input_buffer;
//    reg [31:0] forget_buffer;
//    reg [31:0] cell_buffer;
//    reg [31:0] output_buffer;
    
    always @(posedge clk or negedge rst_n or posedge enable_bias) begin
        if ((!rst_n) || (!enable_bias)) begin
            output_input_2          <=  0;
            output_forget_2         <=  0;
            output_cell_update_2    <=  0;
            output_output_2         <=  0;
            finish_bias             <=  1'b1;
        end
        else begin
            finish_bias             <= 1'b0;
            output_input_2          <= input_bias + output_input_1;
            output_forget_2         <= forget_bias + output_forget_1;
            output_cell_update_2    <= cell_bias + output_cell_update_1;
            output_output_2         <= output_bias + output_output_1;
            finish_bias             <= #1 1'b1;
        end
    end
    
//    assign output_input_2     = input_buffer;
//    assign output_forget_2    = forget_buffer;
//    assign output_cell_2      = cell_buffer;
//    assign output_output_2     = output_buffer;
    
endmodule

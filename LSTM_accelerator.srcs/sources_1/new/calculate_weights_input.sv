`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/14/2024 05:10:11 PM
// Design Name: 
// Module Name: calculate_weights_input
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


module calculate_weights_input #(parameter NUMBER_OF_FEATURES = 2,
                                 parameter NUMBER_OF_UNITS = 2) (
                                 input logic   clk,
                                 input logic   rst_n,
                                 input logic   enable_input,
                                 input logic   [7:0] vector_x          [0:NUMBER_OF_FEATURES-1],
                                 input logic   [7:0] input_weights     [0:NUMBER_OF_FEATURES-1],
                                 input logic   [7:0] forget_weights    [0:NUMBER_OF_FEATURES-1],
                                 input logic   [7:0] cell_weights      [0:NUMBER_OF_FEATURES-1],
                                 input logic   [7:0] output_weights    [0:NUMBER_OF_FEATURES-1],
                                 input logic   [31:0] input_bias,
                                 input logic   [31:0] forget_bias,
                                 input logic   [31:0] cell_bias,
                                 input logic   [31:0] output_bias,
                                 output logic  finish_input,
                                 output logic  [31:0] output_input_1,
                                 output logic  [31:0] output_forget_1,
                                 output logic  [31:0] output_cell_update_1,
                                 output logic  [31:0] output_output_1  
    );
    
    logic [31:0] input_buffer;
    logic [31:0] forget_buffer;
    logic [31:0] cell_buffer;
    logic [31:0] output_buffer;
    integer i;
    
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n || !enable_input) begin
            input_buffer    <= 0;
            forget_buffer   <= 0;
            cell_buffer     <= 0;
            output_buffer   <= 0;
            output_input_1  <= 0;
            output_forget_1 <= 0;
            output_cell_update_1    <= 0;
            output_output_1 <= 0;
            finish_input    <= 1'b1;
        end
        else begin
//            finish_input    <= 1'b1;
            output_input_1  <= input_buffer + input_bias;
            output_forget_1 <= forget_buffer + forget_bias;
            output_cell_update_1   <= cell_buffer + cell_bias;
            output_output_1 <= output_buffer + output_bias; 
        end
    end
    
    always @(posedge enable_input) begin
//            #1;
            finish_input        = 1'b0;
            for (i = 0; i < NUMBER_OF_FEATURES; i = i+1) begin
                input_buffer    = input_buffer + input_weights[i]*vector_x[i];
                forget_buffer   = forget_buffer + forget_weights[i]*vector_x[i];
                cell_buffer     = cell_buffer + cell_weights[i]*vector_x[i];
                output_buffer   = output_buffer + output_weights[i]*vector_x[i]; 
            end
            finish_input        = 1'b1;
    end

endmodule

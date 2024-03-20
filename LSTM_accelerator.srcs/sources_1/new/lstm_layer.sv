`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/20/2024 03:41:34 PM
// Design Name: 
// Module Name: lstm_layer
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


module lstm_layer #(parameter NUMBER_OF_UNITS = 2,
                    parameter NUMBER_OF_FEATURES = 2)(
                    input   logic   clk,
                    input   logic   rst_n,
                    input   logic   enable,
                    input   logic   [7:0] vector_x          [0:NUMBER_OF_FEATURES-1],
                    input   logic   [7:0] input_weights     [0:NUMBER_OF_UNITS-1][0:NUMBER_OF_FEATURES-1],
                    input   logic   [7:0] forget_weights    [0:NUMBER_OF_UNITS-1][0:NUMBER_OF_FEATURES-1]

    );
endmodule

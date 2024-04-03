`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/16/2024 04:34:37 PM
// Design Name: 
// Module Name: calculate_output
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


module calculate_output #(parameter NUMBER_OF_FEATURES = 28,
                          parameter NUMBER_OF_UNITS = 64,
                          parameter INDEX = 0) (
                          input logic           clk,
                          input logic           rst_n,
                          input logic           enable_output,
                          input logic   [7:0]   tanh_output_cell,
                          input logic   [7:0]   output_output_3,
                          output logic  [7:0]   hidden_state,
                          output logic  [7:0]   prev_ht,
                          output logic          finish_output
    );
    
    logic [15:0] buffer_output;
    
    always @(posedge clk or negedge rst_n) begin
        if ( (!rst_n) || !(enable_output) ) begin
            buffer_output   <= 0;
            finish_output   <= 1'b1;
        end
        else begin
//            hidden_state    <= buffer_output[7:0];
//            prev_ht         <= buffer_output[7:0];
        end
    end
    
    always @(posedge enable_output) begin
//            #1;
            finish_output   = 1'b0;
            buffer_output   = output_output_3*tanh_output_cell;
            hidden_state    = buffer_output[7:0];
            prev_ht         = buffer_output[7:0];
//            hidden_state    = buffer_output[7:0];
//            prev_ht         = buffer_output[7:0];
            finish_output   = 1'b1;
//            finish          = 1'b1;
    end
endmodule

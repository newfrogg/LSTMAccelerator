`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/16/2024 03:54:50 PM
// Design Name: 
// Module Name: calculate_gate
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


module calculate_gate #(parameter NUMBER_OF_FEATURES = 28,
                        parameter NUMBER_OF_UNITS = 64) (
                        input   clk,
                        input   rst_n,
                        input   enable_gate,
                        input   [7:0] output_input_3,
                        input   [7:0] output_forget_3,
                        input   [7:0] prev_cell,    
                        input   [7:0] output_cell_update_3,
                        output  reg         finish_gate,
                        output  reg [15:0]  forget_cell,
                        output  reg [15:0]  input_update 
    );
    
    always @(posedge clk or negedge rst_n or posedge enable_gate) begin
        if ( (!rst_n) || (!enable_gate)) begin
            forget_cell     <= 0;
            input_update    <= 0;
        end
        else if (enable_gate) begin
            input_update    <= output_input_3*output_cell_update_3;
            forget_cell     <= output_forget_3*prev_cell;
            finish_gate     <= 1'b1;
        end
        else begin
            finish_gate     <= 1'b0;
        end
    end
     
endmodule

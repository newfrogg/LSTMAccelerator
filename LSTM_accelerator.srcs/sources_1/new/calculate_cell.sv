`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/16/2024 04:28:40 PM
// Design Name: 
// Module Name: calculate_cell
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


module calculate_cell #(parameter NUMBER_OF_FEATURES = 28,
                        parameter NUMBER_OF_UNITS = 64)(
                        input logic         clk,
                        input logic         rst_n,
                        input logic         enable_cell,
                        input logic [7:0]   step,
                        input logic [7:0]   output_input_3,
                        input logic [7:0]   output_forget_3,
                        input logic [7:0]   output_cell_update_3,
                        input logic [7:0]   prev_cell,
                        output logic        finish_cell,
                        output logic [7:0]  output_cell,
                        output logic [7:0]  tanh_output_cell
    );
    
    logic [15:0]  buffer_forget_cell;
    logic [15:0]  buffer_input_cell_update;
    logic [16:0]  buffer_cell;
    tanh_16b   #(.INPUT_WIDTH(16), .OUTPUT_WIDTH(8)) g (.data_in(buffer_cell[16:1]), .data_out(tanh_output_cell) );
    
    always @(posedge clk or negedge rst_n) begin
        if ( (!rst_n) || !(enable_cell) ) begin
            buffer_forget_cell          <= 0;
            buffer_input_cell_update    <= 0;
//            buffer_cell                 <= 0;
            finish_cell                 <= 1'b1;
        end
        else begin
            buffer_cell         <= buffer_forget_cell + buffer_input_cell_update;
        end
    end
    
    always @(posedge enable_cell) begin
//            #1;
            finish_cell                 = 1'b0;
            if (step == 0) begin
                buffer_forget_cell = 0;
            end 
            else begin
                buffer_forget_cell      = output_forget_3*prev_cell;
            end
            buffer_input_cell_update    = output_input_3*output_cell_update_3;
            buffer_cell                 = buffer_forget_cell + buffer_input_cell_update;
            finish_cell                 = 1'b1;
    end
    
    assign output_cell = buffer_cell[15:8];
    
endmodule

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/31/2024 01:47:12 PM
// Design Name: 
// Module Name: fully_connected
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


module fully_connected #(parameter NUMBER_OUTPUTS   = 10,
                         parameter NUMBER_INPUTS    = 10) (
                         input  logic           clk,
                         input  logic           rst_n,
                         input  logic           enable_fully,
                         input  logic   [7:0]   vector_x    [0:NUMBER_INPUTS-1],
                         input  logic   [7:0]   matrix_weights  [0:NUMBER_OUTPUTS-1][0:NUMBER_INPUTS-1],
                         input  logic   [31:0]  bias        [0:NUMBER_OUTPUTS-1],
                         output logic   [7:0]   labels      [0:NUMBER_OUTPUTS-1],
                         output logic           finish_fully
    );
    
    integer i;
    integer j;
    logic   [31:0]  label_buffers [0:NUMBER_OUTPUTS-1];   
    
    always @(posedge clk or negedge rst_n) begin
        if (!enable_fully || !rst_n) begin
//            i               <=  1'b0;
//            j               <=  1'b0;
            finish_fully    <=  1'b1;
        end
        else begin
            for (i = 0; i < NUMBER_OUTPUTS; i = i + 1) begin
                labels[i]   <= label_buffers[i];
            end
        end
    end
    
    always @(posedge enable_fully) begin
        finish_fully        = 1'b0;
        for (i = 0; i < NUMBER_OUTPUTS; i = i + 1) begin
            label_buffers[i]    = 1'b0;
        end
        
        for (i = 0; i < NUMBER_OUTPUTS; i = i + 1) begin
            for (j = 0; j < NUMBER_INPUTS; j = j + 1) begin
                label_buffers[i] = label_buffers[i] + vector_x[j]*matrix_weights[i][j];
            end
            label_buffers[i]        = label_buffers[i] + bias[i];
        end
        
        finish_fully        = 1'b1;
    end
    
endmodule

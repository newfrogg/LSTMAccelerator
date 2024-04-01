`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/31/2024 02:22:55 PM
// Design Name: 
// Module Name: tb_fully_connected
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


module tb_fully_connected();
    parameter   NUMBER_INPUTS   = 10;
    parameter   NUMBER_OUTPUTS  = 10;
    
    logic       clk;
    logic       enable_fully;
    logic       rst_n;
    logic   [7:0]   vector_x    [0:NUMBER_INPUTS-1];
    logic   [7:0]   matrix_weights  [0:NUMBER_OUTPUTS-1][0:NUMBER_INPUTS-1];
    logic   [31:0]  bias        [0:NUMBER_OUTPUTS-1];
    logic   [7:0]   label_buffers      [0:NUMBER_OUTPUTS-1];
    logic           finish_fully;
    
    fully_connected #(.NUMBER_INPUTS(NUMBER_INPUTS), .NUMBER_OUTPUTS(NUMBER_OUTPUTS)) uut (
        .clk(clk),
        .rst_n(rst_n),
        .enable_fully(enable_fully),
        .vector_x(vector_x),
        .matrix_weights(matrix_weights),
        .bias(bias),
        .labels(label_buffers),
        .finish_fully(finish_fully)
    );
    
    integer i;
    integer j;
    logic   [7:0]   value_weight;
    logic   [31:0]  value_bias;
    logic   [7:0]   value;
    
    initial begin
        enable_fully  = 1'b0;
        rst_n   = 1'b1;
        clk     = 1'b0;
        value_weight    = 8'h0;
        value_bias      = 32'habcd0123;
        value           = 8'h1;
        
        for (i = 0; i < NUMBER_OUTPUTS; i = i + 1) begin
            bias[i]     = value_bias;
            vector_x[i] = value;
            value_bias  = value_bias + 8'h10;
            value       = value + 8'h3;
            
            for (j = 0; j < NUMBER_INPUTS; j = j + 1) begin
                matrix_weights[i][j] = value_weight;
                value_weight = value_weight + 8'h1;
            end
        end
        
        #4;
        rst_n   = 1'b0;
        i = 0;
        #29; 
        rst_n   = 1'b1;
        enable_fully = 1'b1;
        $display("Vector input = [%0h, %0h, %0h, %0h, %0h, %0h, %0h, %0h, %0h, %0h]", vector_x[0], vector_x[1], vector_x[2], vector_x[3], vector_x[4], vector_x[5], vector_x[6], vector_x[7], vector_x[8], vector_x[9]);
        $display("Vector bias = [%0h, %0h, %0h, %0h, %0h, %0h, %0h, %0h, %0h, %0h]", bias[0], bias[1], bias[2], bias[3], bias[4], bias[5], bias[6], bias[7], bias[8], bias[9]);
        $display("Vector Weight 0 = [%0h, %0h, %0h, %0h, %0h, %0h, %0h, %0h, %0h, %0h]", matrix_weights[0][0], matrix_weights[0][1], matrix_weights[0][2], matrix_weights[0][3], matrix_weights[0][4], matrix_weights[0][5], matrix_weights[0][6], matrix_weights[0][7], matrix_weights[0][8], matrix_weights[0][9]);
    end
    
    always #5 begin 
        clk = ~clk; 
    end
    
    always @(posedge uut.finish_fully) begin
            enable_fully = 1'b0;
            $display("At time = %t, enable = 0", $time);
    end
    
    always @(clk) begin
        $display("At time = %t, output = [%0h, %0h, %0h, %0h, %0h, %0h, %0h, %0h, %0h, %0h]", $time, uut.label_buffers[0], uut.label_buffers[1], uut.label_buffers[2], uut.label_buffers[3], uut.label_buffers[4], uut.label_buffers[5], uut.label_buffers[6], uut.label_buffers[7], uut.label_buffers[8], uut.label_buffers[9]);
    end
    
endmodule

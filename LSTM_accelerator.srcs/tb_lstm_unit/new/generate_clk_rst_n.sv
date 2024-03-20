`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/17/2024 10:35:44 AM
// Design Name: 
// Module Name: generate_clk_rst_n
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


module generate_clk_rst_n();
    reg clk;
    reg rst_n;
    
    initial begin
        clk     = 1'b0;
        rst_n   = 1'b0;
        #5;
        clk     = 1'b1;
        rst_n   = 1'b1;
    end
    
    always #5 clk = ~clk;
endmodule

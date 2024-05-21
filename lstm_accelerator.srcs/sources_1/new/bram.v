`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/20/2024 06:38:19 PM
// Design Name: 
// Module Name: bram
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


module bram(
        input           clk,
        input           en,
        input           we,
        input [5:0]     addr,
        input [31:0]    din,
        output logic [31:0]   dout
    );
    
    reg [31:0] bram [0:63];
    
    initial begin
        $readmemb("/home/vanloi/Documents/Loi_study/DATN/vivado_LSTM/lstm_param/rams_init_file.data", bram);
    end
    
    always @(posedge clk)
 begin
      if (we)
 bram[addr] <= din;
      
      if (en) dout <= bram[addr];
    end
endmodule

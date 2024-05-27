`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/21/2024 11:12:33 PM
// Design Name: 
// Module Name: mul_32x32
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


module mul_32x32(
        input       clk,
        input       rstn,
        input       en,
        input [31:0]    din_a,
        input [31:0]    din_b,
        output logic          done,
        output logic [63:0]   dout
    );
    
    logic [4:0] count;
    logic signed [63:0] temp;
    logic signed [63:0] din_a_bf;
    assign dout = temp;
    always @(posedge clk or negedge rstn) begin
        if (!rstn) begin
            count       <= {5{1'b0}};
            temp        <= {64{1'b0}};
            din_a_bf    <= {64{1'b0}};
            done        <= 0;
        end
        else begin
            if (!en) begin
                count   <= {5{1'b0}};
                done    <= 0;
                if (din_a[31]) din_a_bf <= {{32{1'b1}}, din_a};
                else din_a_bf <= {{32{1'b0}}, din_a};
            end
            else begin
                if (count == 5'b11111) done <= 1'b1;
                else count   <= count + 1;
                
                if (din_b[count]) temp <= temp + (din_a_bf << count);
                else temp <= temp;
            end       
        end
    end
    
endmodule

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/04/2024 09:21:58 AM
// Design Name: 
// Module Name: quantization_lstm
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


module quantization_lstm(
        input   [31:0]  data_in,
        input   type_state,
        output  [7:0]   data_out
    );
    
    localparam
        O_STATE         = 0,
        C_STATE         = 1,
        O_Q_STEP        = 32'h0020143B,
        O_Q_RSHIFT      = 28,
        O_Q_ZERO        = 16'h0001,
        C_Q_STEP        = 1,
        C_Q_RSHIFT      = 11,
        C_Q_ZERO        = 0;
        
    logic [63:0]    out_temp;
    
    assign data_out = out_temp[7:0];    
    always @(*) begin
        if (type_state == O_STATE) begin
            out_temp = (data_in + O_Q_ZERO) * O_Q_STEP;
            out_temp = out_temp >>> O_Q_RSHIFT;
        end
        else begin
            out_temp = data_in;
            out_temp = out_temp >> 11;
        end
    end
endmodule

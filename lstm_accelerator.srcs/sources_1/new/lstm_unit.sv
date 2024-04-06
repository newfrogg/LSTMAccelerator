`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/05/2024 03:52:50 PM
// Design Name: 
// Module Name: lstm_unit
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


module lstm_unit #( parameter W_BITWIDTH = 8,
                    parameter IN_BITWIDTH = W_BITWIDTH,
                    parameter OUT_BITWIDTH = 20,
                    parameter PREV_SUM_BITWIDTH = OUT_BITWIDTH - 2)(
                    input                                   clk,
                    input                                   rstn,
                    input                                   en,
                    input  [W_BITWIDTH-1:0]                 weights_0,
                    input  [W_BITWIDTH-1:0]                 weights_1, 
                    input  [W_BITWIDTH-1:0]                 weights_2,  
                    input  [IN_BITWIDTH-1:0]                data_in_0,
                    input  [IN_BITWIDTH-1:0]                data_in_1,
                    input  [IN_BITWIDTH-1:0]                data_in_2,
                    input  [PREV_SUM_BITWIDTH-1:0]          pre_sum,
                    output logic                            done,
                    output [31:0]                           out
    );
    
    localparam
        BUFFER_SIZE         = 32,
        
        STATE_IDLE          = 3'b000,
        STATE_RECEIVE_DATA  = 3'b001,
        STATE_RUN           = 3'b010,
        STATE_WAIT          = 3'b011,
        STATE_FINISH        = 3'b100;
        
    logic   [BUFFER_SIZE-1:0]       accu_input_bf;
    logic   [BUFFER_SIZE-1:0]       accu_forget_bf;
    logic   [BUFFER_SIZE-1:0]       accu_cell_bf;
           
    
    
endmodule

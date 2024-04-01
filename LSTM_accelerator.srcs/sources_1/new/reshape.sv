`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/01/2024 10:48:53 AM
// Design Name: 
// Module Name: reshape
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


module reshape #(parameter SIZE_ROW = 2,
                 parameter SIZE_COL = 2)(
                 input logic    [7:0]   matrix_x [0:SIZE_ROW-1][0:SIZE_COL-1],
                 output logic   [7:0]   vector_x [0:SIZE_ROW*SIZE_COL-1]
    );
    
    genvar  i;
    genvar  j;  
//    genvar  k;
    logic   [7:0] buffer_x [0:SIZE_ROW*SIZE_COL-1];
    
    generate 
//        assign k = 0;
        for (i = 0; i < SIZE_ROW; i = i + 1) begin
            for (j = 0; j < SIZE_COL; j = j + 1) begin
                assign vector_x[i*SIZE_ROW+j] = matrix_x[i][j];
//                assign k = k + 1;
            end
        end
    endgenerate
    
//    assign vector_x[0] = matrix_x[0][0];
    
    
endmodule

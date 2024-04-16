`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/16/2024 09:33:05 AM
// Design Name: 
// Module Name: sigmoid_appro
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


module sigmoid_appro #( parameter OUT_BITWIDTH = 8,
                        parameter IN_BITWIDTH = 32) (
                        input   logic   [31:0]  data_in,    //  32 bits input
                        output  logic   [7:0]   data_out    // 8 bits output
    );
    
            // IEEE
        localparam 
//            COEF0   = 32'h00_28_00_00,  // 0.15625
//            COEF1   = 32'h00_60_00_00,  // 0.375
//            COEF2   = 32'h00_80_00_00,  // 0.5
//            COEF3   = 32'h00_A0_00_00,  // 0.625
//            COEF4   = 32'h00_D8_00_00,  // 0.84375
            COEF0   = 32'h3e200000,
            COEF1   = 32'h3ec00000,
            COEF2   = 32'h3f000000,
            COEF3   = 32'h3f200000,
            COEF4   = 32'h3f580000,
            
            // IEEE
//            RANGE1  = 32'h85_00_00_00,      // -5
//            RANGE2  = 32'h82_60_00_00,      // -2.375
//            RANGE3  = 32'h81_00_00_00,      // -1
//            RANGE4  = 32'h01_00_00_00,      // 1
//            RANGE5  = 32'h02_60_00_00,      // 2.375
//            RANGE6  = 32'h05_00_00_00;      // 5
            RANGE1  = 32'hc0a00000,
            RANGE2  = 32'hc0180000,
            RANGE3  = 32'hbf800000,
            RANGE4  = 32'h3f800000,
            RANGE5  = 32'h40180000,
            RANGE6  = 32'h40a00000;
        
        logic   [31:0]  temp;
            
        always @(*) begin
            if (data_in >= RANGE1) begin    // <= -5
                data_out    <= 0;
            end
            else if (data_in >= RANGE2 && data_in < RANGE1) begin   // (-5, -2.375]
                temp = data_in >>> 5;
                data_out = temp[31:24] + COEF0[31:24];
            end
            else if (data_in >= RANGE3 && data_in < RANGE2) begin // (-2.375, -1]
                temp = data_in >>> 3;
                data_out = temp[31:24] + COEF1[31:24];
            end
            else if (data_in >= 32'h80_00_00_00 && data_in < RANGE3) begin // (-1, 0]
                temp = data_in >>> 2;
                data_out = temp[31:24] + COEF2[31:24];
            end
            else if (data_in >= 32'h00_00_00_00 && data_in < RANGE4) begin // (0, 1]
                temp = data_in >>> 2;
                data_out = temp[31:24] + COEF2[31:24];
            end
            else if (data_in >= RANGE4 && data_in < RANGE5) begin
                temp = data_in >>> 3;
                data_out = temp[31:24] + COEF3[31:24];
            end
            else if (data_in >= RANGE5 && data_in < RANGE6) begin
                temp = data_in >>> 5;
                data_out = temp[31:24] + COEF4[31:24];
            end
            else if (data_in >= RANGE6 && data_in <= 32'h7f_ff_ff_ff) begin
                data_out = 1;
            end
        end 
        
endmodule

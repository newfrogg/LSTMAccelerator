`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/15/2024 11:06:46 PM
// Design Name: 
// Module Name: tanh_appr
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


module tanh_appr (  
                    input                   clk,
                    input                   rstn,
                    input                   en,
                    input   logic   [15:0]  data_in,    
                    output  logic           done,
                    output  logic   [15:0]  data_out    
        );
                    
            // (1, 3, 12)
        localparam 
            
            COEF0   = 16'h9000, // -1
            COEF1   = 16'h8E80, // -0.90625
            COEF2   = 16'h87B0, // -0.48046875
            COEF3   = 16'h80D0, // -0.05078125
            COEF4   = 16'h00D0, // 0.05078125
            COEF5   = 16'h07B0, // 0.48046875
            COEF6   = 16'h0E80, // 0.90625
            COEF7   = 16'h1000, // 1

            RANGE1  = 16'hB000,     // -3
            RANGE2  = 16'h9E8F,     // -1.91
            RANGE3  = 16'h8DC3,     // -0.86
            RANGE4  = 16'h8333,     // -0.2
            RANGE5  = 16'h0333,     // 0.2
            RANGE6  = 16'h0DC3,     // 0.86
            RANGE7  = 16'h1E8F,     // 1.91
            RANGE8  = 16'h3000;     // 3
            
     logic signed [15:0]    temp;
     logic [1:0]            count;
     
     assign data_out = temp;
     
     always @ (posedge clk or negedge rstn) begin
        if (!rstn) begin
            temp    <= 16'h0;
            count   <= 0;
            done    <= 0;
        end
        else begin
            if (!en) begin
                count       <= 0;
                done        <= 0;
                temp        <= 0;
            end
            else begin
                count <= count + 1;
                if (data_in > RANGE1 && data_in <= 16'hFFFF) begin
                    if (count == 0) temp <= COEF0;
                    else if (count == 2'b10) done <= 1'b1;
                    else ;
                end
                else if (data_in > RANGE2 && data_in <= RANGE1) begin       
                    if (count == 0) begin
                        temp        <= data_in >>> 5;
//                        temp[31:27] <= 5'b11111;
                    end
                    else if (count == 2'b10) begin
                        temp    <= temp + COEF1;
                        done    <= 1;
                    end
                    else ;
                end
                else if (data_in > RANGE3 && data_in <= RANGE2) begin
                    if (count == 0) begin
                        temp        <= data_in >>> 2;
//                        temp[31:30] <= 2'b11;
                    end
                    else if (count == 2'b10) begin
                        temp    <= temp + COEF2;
                        done        <= 1;
                    end
                    else ;
                end
                else if (data_in > RANGE4 && data_in <= RANGE3) begin
                    if (count == 0) begin
                        temp        <= (data_in >>> 2);
//                        temp[31:30] <= 2'b11;   
                    end
                    if (count == 2'b01) temp <= data_in - temp;
                    else if (count == 2'b10)begin
                        temp    <= temp + COEF3;
                        done        <= 1;
                    end
                    else ;
                end
                else if (data_in >= 16'h8000 && data_in <= RANGE4) begin
                    if (count == 0) temp <= data_in;
                    else if (count == 2'b10) begin
                        done        <= 1;
                    end
                    else ;
                end
                else if (data_in >= 16'h0000 && data_in < RANGE5) begin
                    if (count == 0) temp <= data_in;
                    else if (count == 2'b10) begin
                        done        <= 1;
                    end
                    else ;
                end
                else if (data_in >= RANGE5 && data_in < RANGE6) begin
                    if (count == 0) temp <= (data_in >>> 2);
                    else if (count == 2'b01) temp <= data_in - temp;
                    else if (count == 2'b10) begin
                        temp    <= temp + COEF4;
                        done    <= 1;
                    end
                    else ;
                end
                else if (data_in >= RANGE6 && data_in < RANGE7) begin
                    if (count == 0) temp <= data_in >>> 2;
                    else if (count == 2'b10) begin
                        temp    <= temp + COEF5;
                        done    <= 1;
                    end
                    else ;
                end
                else if (data_in >= RANGE7 && data_in < RANGE8) begin
                    if (count == 0) temp <= data_in >>> 5;
                    else if (count == 2'b10) begin
                        temp    <= temp + COEF6;
                        done    <= 1;
                    end
                    else ;
                end
                else if (data_in >= RANGE8 && data_in <= 16'h7fff) begin
                    if (count == 0) temp    <= COEF7;
                    else if (count == 2'b10) done <= 1;
                    else ;
                end
            end
        end
     end

endmodule

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


module sigmoid_appro (
                    input                   clk,
                    input                   rstn,
                    input                   en,
                    input   logic   [15:0]  data_in,    
                    output  logic           done,
                    output  logic   [15:0]  data_out  
    );
    
            // IEEE
        localparam 

            COEF1   = 16'h0280,     // 0.15625
            COEF2   = 16'h0600,     // 0.375
            COEF3   = 16'h0800,     // 0.5
            COEF4   = 16'h0A00,     // 0.625
            COEF5   = 16'h0D80,     // 0.84375
            COEF6   = 16'h1000,     // 1
            
            RANGE1  = 16'hD000,             // -5
            RANGE2  = 16'hA600,             // -2.375
            RANGE3  = 16'h9000,             // -1
            RANGE4  = 16'h1000,             // 1
            RANGE5  = 16'h2600,             // 2.375
            RANGE6  = 16'h5000;             // 5
        
        logic signed [15:0] temp;
        logic [1:0]         count;
        assign data_out = temp;
        
        always @ (posedge clk or negedge rstn) begin
            if (!rstn) begin
                temp    <= 32'h0;
                count       <= 0;
                done        <= 0;
            end
            else begin
                if (!en) begin
                    count       <= 0;
                    done        <= 0;
                end
                else begin
                    count <= count + 1'b1;
                    if (data_in > RANGE1 && data_in <= 16'hffff) begin
                        if (count == 0) begin 
                            temp  <= 0;
                        end 
                        else if (count == 2'b10) begin
                            done <= 1'b1;
                        end
                        else ;
                    end 
                    if (data_in > RANGE2 && data_in <= RANGE1) begin
                        if (count == 0) temp <= data_in >>> 5;
                        else if (count == 2'b01) temp <= temp + COEF1; 
                        else if (count == 2'b10) begin
//                            temp    <= {{1'b0}, temp[15:1]};
                            temp    <= temp;
                            done    <= 1'b1;
                        end
                        else ;
                    end
                    else if (data_in > RANGE3 && data_in <= RANGE2) begin                    
                        if (count == 0) temp <= data_in >>> 3;
                        else if (count == 2'b01) temp <= temp + COEF2; 
                        else if (count == 2'b10) begin
                            temp    <= temp;
                            done    <= 1'b1;
                        end
                        else ;
                    end
                    else if (data_in >= 16'h8000 && data_in <= RANGE3) begin
                        if (count == 0) temp <= data_in >>> 2;
                        else if (count == 2'b01) temp    <= temp + COEF3;
                        else if (count == 2'b10) begin
//                            temp = {{8'h00}, temp[23:0]};
                            temp    <= temp;
                            done    <= 1'b1;
                        end
                        else ;
                    end
                    else if (data_in >= 16'h0000 && data_in < RANGE4) begin
                        if (count == 0) temp <= data_in >>> 2;
                        else if (count == 2'b01) temp    <= temp + COEF3;
                        else if (count == 2'b10) begin
//                            temp    <= {{8'h00}, temp[23:0]};
                            temp    <= temp;
                            done    <= 1'b1;
                        end
                        else ;
                    end
                    else if (data_in >= RANGE4 && data_in < RANGE5) begin
                        if (count == 0) temp <= data_in >>> 3;
                        else if (count == 2'b01) temp    <= temp + COEF4;
                        else if (count == 2'b10) begin
//                            temp    <= {{8'h00}, temp[23:0]};
                            temp    <= temp;                    
                            done    <= 1'b1;
                        end
                        else ;
                    end
                    else if (data_in >= RANGE5 && data_in < RANGE6) begin
                        if (count == 0) temp <= data_in >>> 5;
                        else if (count == 2'b01) temp    <= temp + COEF5;
                        else if (count == 2'b10) begin
//                            temp    <= {{8'h00}, temp[23:0]};
                            temp    <= temp;                    
                            done    <= 1'b1;
                        end
                        else ;
                    end
                    else if (data_in >= RANGE6 && data_in <= 16'h7fff) begin
                        if (count == 0) begin
                            temp    <= COEF6;
//                            done    <= 1'b1;
                        end
                        else if (count == 2'b10) begin
                            done    <= 1'b1;
                        end
                        else ;
                    end
                end
            end
         end

endmodule

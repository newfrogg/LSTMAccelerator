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

// multiply by quantized multiplier
// rounding ht from int16 (raw) to int16 (quantized) then to int8 (clamp)
module quantization_lstm(
        input           clk,
        input           rstn,
        input           en,
        input   [1:0]   type_state,
        input   [31:0]  data_in,
        output  logic   done,
        output  logic [15:0]   data_out
    );
    
    localparam        
        // exponent_ht = 8
        STATE_IDLE              = 2'h0,
        STATE_SAT_ROUND_MUL     = 2'h1,
        STATE_ROUNDING          = 2'h2,
        STATE_MUL_QUANTIZED     = 2'h3,
        LSTM_ACCUM              = 2'h0,
        LSTM_HT                 = 2'h1,
        FC                      = 2'h2,
        ACCUM_MULTIPLIER        = 32'h0a72_4109,
        ACCUM_SHIFT             = 8'h07,
        FC_ACCUM_MULTIPLIER     = 32'h0a72_4109,
        FC_ACCUM_SHIFT          = 8'h07;
        
    logic [31:0]    out_temp;
    logic [2:0]     count;
    
    logic [1:0]     state;
    
    logic [31:0]    mask;
    logic [31:0]    remainder;
    logic [31:0]    threshold;
    logic [31:0]    data_in_bf;
    logic [63:0]    ab_64;
    logic [31:0]    multiplier;
    logic [7:0]     shift;
    
    assign data_out = out_temp[15:0];
    
    always @(posedge clk or negedge rstn) begin
        if (!rstn) begin
            out_temp    <= 0;
            done        <= 0;
            count       <= 0;
            state       <= STATE_IDLE;
//            mask        <= {32{1'b0}};
//            ab_64       <= {64{1'b0}};
//            remainder   <= {32{1'b0}};
//            threshold   <= {32{1'b0}};
//            multiplier  <= {32{1'b0}};
//            data_in_bf  <= {32{1'b0}};
//            shift       <= {8{1'b0}};
            
        end
        else begin
        
            case(state)
                STATE_IDLE: begin
                    out_temp    <= 0;
                    done        <= 0;
                    count       <= 0;
                    
                    if (en && !done) begin
                        case (type_state)
                            LSTM_ACCUM: begin
                                state       <= STATE_SAT_ROUND_MUL;
                                multiplier  <= ACCUM_MULTIPLIER;
                                shift       <= ACCUM_SHIFT;
                            end
                            
                            LSTM_HT: begin
                                state   <= STATE_ROUNDING;
                                mask    <= 32'h0000_00ff;
                            end
                            
                            FC: begin
                                state       <= STATE_SAT_ROUND_MUL;
                                multiplier  <= FC_ACCUM_MULTIPLIER;
                                shift       <= FC_ACCUM_SHIFT;
                            end
                        endcase
                        data_in_bf  <= data_in;                           
                    end
                end
                
                STATE_SAT_ROUND_MUL: begin
                    if (count == 2) begin
                        state   <= STATE_MUL_QUANTIZED;
//                        mask    <= { {32{1'b0}}, {ACCUM_SHIFT{1'b1}} };
                        if (type_state == LSTM_ACCUM) mask <= { {(32 - ACCUM_SHIFT){1'b0}}, {ACCUM_SHIFT{1'b1}} };
                        else mask <= { { (32 - FC_ACCUM_SHIFT){1'b0}}, {FC_ACCUM_SHIFT{1'b1}} };
                        count   <= 0;
                    end
                    else count <= count + 1;
                    
                    if (count == 0) begin
                        ab_64   <= data_in_bf * multiplier;
                    end
                    else if (count == 1) begin
                        if ((data_in_bf[31] && multiplier[31]) || (!data_in_bf[31] && !multiplier[31])) begin
                            ab_64   <= ab_64 + 32'h4000_0000;
                        end
                        else begin
                            ab_64   <= ab_64 + 32'hC000_0001;
                        end
                    end
                    else if (count == 2) begin
                        if (data_in_bf == 32'h7FFF_FFFF && data_in_bf == multiplier) begin
                            data_in_bf  <= 32'h7FFF_FFFF;
                        end
                        else begin
                            data_in_bf  <= ab_64[63:32];
                        end
                    end
                    else ;
                end
                
                STATE_MUL_QUANTIZED: begin
                    if (count == 3) begin
                        state   <= STATE_IDLE;
                    end
                    else count  <= count + 1;
                    
                    if (count == 0) begin
                        remainder   <= data_in_bf & mask;
                        if (data_in_bf[31]) begin
//                            threshold   <= 16'b0000_0000_1000_0000; // -128
                            threshold   <= mask >> 1 + 1;
                        end
                        else begin
//                            threshold   <= 16'b0000_0000_0111_1111; // 127
                            threshold   <= mask >> 1;
                        end
                    end
                    else if (count == 1) begin
                        if (remainder > threshold) begin
//                            out_temp    <= {{8{1'b0}}, data_in_bf[15:8]};
//                            out_temp    <= { {shift{1'b0}}, {data_in_bf[31:shift]} };
                            out_temp    <= data_in_bf >> shift + 1;                         
                        end
                        else begin
//                            out_temp    <= {{8{1'b0}}, data_in_bf[15:8]} + 1;
                            out_temp    <= data_in_bf >> shift;
                        end
                    end
                    else if (count == 2) begin
                        if (out_temp >= 32'h0 && out_temp <= 32'h0000ffff) begin
                            out_temp    <= out_temp;
                        end
                        else begin
                            if ( (data_in_bf[31] && multiplier[31]) || (!data_in_bf[31] && !multiplier[31]) ) out_temp <= { {16{1'b0}},16'h7fff};
                            else out_temp <= { {16{1'b0}}, 16'h8000};
                        end
                        done    <= 1'b1;
                    end
                    else ;
                end
                
                STATE_ROUNDING: begin
                    if (count == 3) begin
                        state   <= STATE_IDLE;
                    end
                    else count   <= count + 1;
                    
                    
                    if (count == 0) begin
                        // data_in_bf = 16 bit, mask = ff
                        remainder   <= data_in_bf & mask;
                        if (data_in_bf[15]) begin
                            threshold   <= {{16{1'b0}}, 16'b0000_0000_1000_0000} ; // -128
                        end
                        else begin
                            threshold   <= {{16{1'b0}}, 16'b0000_0000_0111_1111}; // 127
                        end
                    end
                    else if (count == 1) begin
                        if (remainder > threshold) begin
                            out_temp    <= { {16{1'b0}}, data_in_bf[15:0] + 1} ;
                        end
                        else begin
                            out_temp    <= { {16{1'b0}}, data_in_bf[15:0] };
                        end
                    end
                    else if (count == 2) begin
                        if ( out_temp >= 0 && out_temp <= 32'h0000_00ff) out_temp <= out_temp;
                        else begin
                            if ( (data_in_bf[15] && multiplier[15]) || (!data_in_bf[15] && !multiplier[15]) ) out_temp <= 32'h0000_007f;
                            else out_temp <= 32'h0000_0080;
                        end
                        done    <= 1'b1;
                    end
                    else ;
                end
                
            endcase
        
        end
    end
    
endmodule

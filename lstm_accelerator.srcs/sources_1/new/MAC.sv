`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/05/2024 10:17:40 AM
// Design Name: 
// Module Name: MAC
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


module MAC (
                input                       clk,
                input                       rstn,
                input                       en,
                input                       is_signed,
                input  [7:0]                weights_0,
                input  [7:0]                weights_1, 
                input  [7:0]                weights_2,  
                input  [7:0]                data_in_0,
                input  [7:0]                data_in_1,
                input  [7:0]                data_in_2,
                input  [31:0]               pre_sum,
                output logic                done,
                output logic signed [31:0]  out
    );
    
    localparam 
        STATE_IDLE = 2'b00, 
        STATE_MULT = 2'b01, 
        STATE_ACCM = 2'b10,
        
        LATENCY    = 1;
        
    logic [1:0]                               state;
    logic [4:0]                               index;
    logic                                     flag_accu;
    logic                                     time_remaining;
    
    logic signed [31:0]           out_temp;

    logic signed [31:0]             weights_bf_0;
    logic signed [31:0]             weights_bf_1;
    logic signed [31:0]             weights_bf_2;
    logic signed [31:0]            data_in_bf_0;
    logic signed [31:0]            data_in_bf_1;
    logic signed [31:0]            data_in_bf_2;
    logic signed [31:0]      prev_sum_bf;
       
    logic signed  [31:0]           accu_bf;
    assign out = out_temp;
  
    always @ (posedge clk or negedge rstn) begin
        if(!rstn) begin
            state <= STATE_IDLE;
            
            weights_bf_0 <= {8{1'b0}};
            weights_bf_1 <= {8{1'b0}};
            weights_bf_2 <= {8{1'b0}};
            data_in_bf_0 <= {8{1'b0}};
            data_in_bf_1 <= {8{1'b0}};
            data_in_bf_2 <= {8{1'b0}};
            prev_sum_bf  <= {32{1'b0}};
            
            index       <= 5'b00000;
            done        <= 1'b0;
            out_temp    <= {32{1'b0}};
            flag_accu   <= 1'b0;
            accu_bf     <= {32{1'b0}};
            
            time_remaining <= LATENCY;
        end
        else begin
        case(state)
            STATE_IDLE: begin
                // TO DO
                // Done flag reset!
                done    <= 1'b0;
                index   <= 5'b00000;
                
                if(en && !done) begin
                    state <= STATE_MULT;
                    if (is_signed) begin
                        if (data_in_0[7]) begin
                            weights_bf_0 <= {{24{1'b1}}, (~weights_0 + 8'h01)};
                            data_in_bf_0 <= {{24{1'b1}}, (~data_in_0 + 8'h01)};
                        end
                        else begin
                            weights_bf_0 <= {{24{1'b0}}, weights_0};
                            data_in_bf_0 <= {{24{1'b0}}, data_in_0};
                        end
                        
                        if (data_in_1[7]) begin
                            weights_bf_1 <= {{24{1'b1}}, (~weights_1 + 8'h01)};
                            data_in_bf_1 <= {{24{1'b1}}, (~data_in_1 + 8'h01)};
                        end
                        else begin
                            weights_bf_1 <= {{24{1'b0}}, weights_1};
                            data_in_bf_1 <= {{24{1'b0}}, data_in_1};
                        end
                        
                        if (data_in_2[7]) begin
                            weights_bf_2 <= {{24{1'b1}}, (~weights_2 + 8'h01)};
                            data_in_bf_2 <= {{24{1'b1}}, (~data_in_2 + 8'h01)};
                        end
                        else begin
                            weights_bf_2 <= {{24{1'b0}}, weights_2};
                            data_in_bf_2 <= {{24{1'b0}}, data_in_2};
                        end
                    end
                    else begin
                        weights_bf_0 <= {{24{1'b0}}, weights_0};
                        data_in_bf_0 <= {{24{1'b0}}, data_in_0};
                        weights_bf_1 <= {{24{1'b0}}, weights_1};
                        data_in_bf_1 <= {{24{1'b0}}, data_in_1};
                        weights_bf_2 <= {{24{1'b0}}, weights_2};
                        data_in_bf_2 <= {{24{1'b0}}, data_in_2};
                    end
                    
                    
                    prev_sum_bf  <= pre_sum;
                    flag_accu    <= 1'b0;
                    accu_bf      <= {32{1'b0}};
                    
                    time_remaining <= LATENCY;
                end
                else begin
                // If not, just waiting for condition.
                end
            end
            STATE_MULT: begin
                    if (flag_accu == 1'b1) begin
                        state   <= STATE_ACCM;
                        done    <= 1'b1;
                        index   <= 5'b00000;
                    end
                    else begin
                        index   <= index + 1'b1;
                        if (index == 5'b00111) begin
                            flag_accu   <= 1'b1;
                        end
                        else ;
                        case({data_in_bf_2[index], data_in_bf_1[index], data_in_bf_0[index]})
                            3'b001: begin
//                                sum_arr_bf[index]   <= weights_bf_0 <<< index;
                                if (is_signed) accu_bf    <= accu_bf + (weights_bf_0 << index);
                                else  accu_bf             <= accu_bf + (weights_bf_0 << index);                            
                            end
                            
                            3'b010: begin
//                                sum_arr_bf[index]   <= weights_bf_1 <<< index;
                                if (is_signed)  accu_bf     <= accu_bf + (weights_bf_1 << index);
                                else            accu_bf     <= accu_bf + (weights_bf_1 << index);
                                
                            end
                            
                            3'b011: begin
//                                sum_arr_bf[index]   <= (weights_bf_1 + weights_bf_0) <<< index;
                                if (is_signed) accu_bf      <= accu_bf + ((weights_bf_1 + weights_bf_0) << index);
                                else accu_bf                <= accu_bf + ((weights_bf_1 + weights_bf_0) << index);
                            end
                            
                            3'b100: begin
//                                sum_arr_bf[index]   <= weights_bf_2 <<< index;
                                if (is_signed) accu_bf      <= accu_bf + (weights_bf_2 << index);
                                else accu_bf                <= accu_bf + (weights_bf_2 << index);
                            end
                            
                            3'b101: begin
//                                sum_arr_bf[index]   <= (weights_bf_2 + weights_bf_0) <<< index;
                                if (is_signed) accu_bf      <= accu_bf + ((weights_bf_2 + weights_bf_0) << index); 
                                else  accu_bf               <= accu_bf + ((weights_bf_2 + weights_bf_0) << index);                               
                            end
                            
                            3'b110: begin
//                                sum_arr_bf[index]   <= (weights_bf_2 + weights_bf_1) <<< index;
                                if (is_signed) accu_bf      <= accu_bf + ((weights_bf_2 + weights_bf_1) << index);
                                else  accu_bf               <= accu_bf + ((weights_bf_2 + weights_bf_1) << index);
                            end
                            
                            3'b111: begin
//                                sum_arr_bf[index]   <= (weights_bf_0 + weights_bf_1 + weights_bf_2) <<< index;
                                if (is_signed) accu_bf      <= accu_bf + ((weights_bf_2+ weights_bf_1 + weights_bf_0) << index);
                                else accu_bf                <= accu_bf + ((weights_bf_2+ weights_bf_1 + weights_bf_0) << index);
                            end
                                
                            default: begin
                                accu_bf     <= accu_bf;
                            end
                         endcase
                     end
                end
                STATE_ACCM: begin
                // TO DO
                // Do add and make output 'done' flag high.( done = 1)      
                    if (time_remaining == 1'b0) state <= STATE_IDLE;
                    else begin 
                        time_remaining <= time_remaining - 1'b1;
                        out_temp    <= accu_bf + prev_sum_bf;
                    end
                end
                default:;
           endcase
       end
    end
endmodule

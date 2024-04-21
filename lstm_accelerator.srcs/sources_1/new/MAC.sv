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


module MAC #(   parameter W_BITWIDTH = 8,
                parameter IN_BITWIDTH = W_BITWIDTH,
                parameter OUT_BITWIDTH = 32,
                parameter PREV_SUM_BITWIDTH = OUT_BITWIDTH) (
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
                output logic [OUT_BITWIDTH-1:0]         out
    );
    
    localparam 
        STATE_IDLE = 2'b00, 
        STATE_MULT = 2'b01, 
        STATE_ACCM = 2'b10,
        
        LATENCY    = 1;
        
    logic [1:0]                               state;
    logic [2:0]                               index;
    logic                                     flag_accu;
    logic [1:0]                               time_remaining;
    
    logic signed [OUT_BITWIDTH-1:0]           out_temp;

    logic  [W_BITWIDTH-1:0]             weights_bf_0;
    logic  [W_BITWIDTH-1:0]             weights_bf_1;
    logic  [W_BITWIDTH-1:0]             weights_bf_2;
    logic  [IN_BITWIDTH-1:0]            data_in_bf_0;
    logic  [IN_BITWIDTH-1:0]            data_in_bf_1;
    logic  [IN_BITWIDTH-1:0]            data_in_bf_2;
    logic  [PREV_SUM_BITWIDTH-1:0]      prev_sum_bf;
    
    logic  [OUT_BITWIDTH-1:0]            sum_arr_bf    [0:IN_BITWIDTH-1];
    logic  [OUT_BITWIDTH-1:0]            accu_bf       [0:6];
    
    assign out = out_temp;
    always @(*) begin
        accu_bf[0] <= sum_arr_bf[0] + sum_arr_bf[1];
        accu_bf[1] <= sum_arr_bf[2] + sum_arr_bf[3];
        accu_bf[2] <= sum_arr_bf[4] + sum_arr_bf[5];
        accu_bf[3] <= sum_arr_bf[6] + sum_arr_bf[7];
        accu_bf[4] <= accu_bf[0] + accu_bf[1];
        accu_bf[5] <= accu_bf[2] + accu_bf[3];
        accu_bf[6] <= accu_bf[4] + accu_bf[5];
    end
    
    always @ (posedge clk or negedge rstn) begin
        if(!rstn) begin
            state <= STATE_IDLE;
            
            weights_bf_0 <= {W_BITWIDTH{1'b0}};
            weights_bf_1 <= {W_BITWIDTH{1'b0}};
            weights_bf_2 <= {W_BITWIDTH{1'b0}};
            data_in_bf_0 <= {IN_BITWIDTH{1'b0}};
            data_in_bf_1 <= {IN_BITWIDTH{1'b0}};
            data_in_bf_2 <= {IN_BITWIDTH{1'b0}};
            prev_sum_bf <= {PREV_SUM_BITWIDTH{1'b0}};

            done <= 1'b0;
            out_temp <={OUT_BITWIDTH{1'b0}};
        end
        else begin
        case(state)
                STATE_IDLE: begin
                // TO DO
                // Done flag reset!
                done    <= 1'b0;
                index   <= 3'b0;
//                t_delay <= 3'b0;
                
                    if(en && !done) begin
                        state <= STATE_MULT;
                        weights_bf_0 <= weights_0;
                        weights_bf_1 <= weights_1;
                        weights_bf_2 <= weights_2;
                        data_in_bf_0 <= data_in_0;
                        data_in_bf_1 <= data_in_1;
                        data_in_bf_2 <= data_in_2;
                        prev_sum_bf  <= pre_sum;
                        flag_accu    <= 0;
                        
                        time_remaining <= LATENCY;
                    end
                    else begin
                    // If not, just waiting for condition.
                    end
                end
                STATE_MULT: begin
                    if (flag_accu == 1) begin
                        state   <= STATE_ACCM;
                        done    <= 1;
                        index   <= 0;
                    end
                    else begin
                        index   <= index + 1;
                        if (index == 3'b111) begin
                            flag_accu   <= 1'b1;
                        end
                        else ;
                        case({data_in_bf_2[index], data_in_bf_1[index], data_in_bf_0[index]})
                            3'b001: begin
                                sum_arr_bf[index]   <= weights_bf_0 <<< index;
                            end
                            
                            3'b010: begin
                                sum_arr_bf[index]   <= weights_bf_1 <<< index;
                            end
                            
                            3'b011: begin
                                sum_arr_bf[index]   <= (weights_bf_1 + weights_bf_0) <<< index;
                            end
                            
                            3'b100: begin
                                sum_arr_bf[index]   <= weights_bf_2 <<< index;
                            end
                            
                            3'b101: begin
                                sum_arr_bf[index]   <= (weights_bf_2 + weights_bf_0) <<< index;
                            end
                            
                            3'b110: begin
                                sum_arr_bf[index]   <= (weights_bf_2 + weights_bf_1) <<< index;
                            end
                            
                            3'b111: begin
                                sum_arr_bf[index]   <= (weights_bf_0 + weights_bf_1 + weights_bf_2) <<< index;
                            end
                                
                            default: begin
                                sum_arr_bf[index]   <= 0;
                            end
                         endcase
                     end
                end
                STATE_ACCM: begin
                // TO DO
                // Do add and make output 'done' flag high.( done = 1)      
//                    out_temp <= accu_bf[6] + prev_sum_bf;
//                    done <= 1;
                    if (time_remaining == 0) state <= STATE_IDLE;
                    else begin 
                        time_remaining <= time_remaining - 1;;
                        out_temp <= accu_bf[6] + prev_sum_bf;
                    end
                end
                default:;
           endcase
       end
    end
endmodule

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/05/2024 03:54:04 PM
// Design Name: 
// Module Name: controller
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


module controller(
    input               clk,
    input               rstn,
    input               r_valid,
    input               load_bias,
    input [31:0]        data_in,
    output logic        t_valid,
    output logic [31:0] out_data,
    output logic [1:0]  o_state,
    output logic [2:0]  o_index,
    output logic [9:0]  o_sum_arr_bf    [0:7]
);
    localparam
    W_BITWIDTH              = 8,
    IN_BITWIDTH             = 8,
    OUT_BITWIDTH            = 20,
    
    STATE_IDLE              = 2'd0,
    STATE_DATA_RECEIVE      = 2'd1,
    STATE_RUN               = 2'd2,
    STATE_FINISH            = 2'd3;
    
    logic [1:0]                             state;
    logic [1:0]                             counter;
    
    logic                                   data_receive_done;
    logic                                   run_done;
    logic                                   finish_done;
    // Signals for MAC Operation
//    logic [2:0]                             mac_state;
//    logic [1:0]                             real_mac_state;
    logic                                   mac_en;
    logic  [W_BITWIDTH-1:0]                 weights_0;
    logic  [W_BITWIDTH-1:0]                 weights_1; 
    logic  [W_BITWIDTH-1:0]                 weights_2;  
    logic  [IN_BITWIDTH-1:0]                data_in_0;
    logic  [IN_BITWIDTH-1:0]                data_in_1;
    logic  [IN_BITWIDTH-1:0]                data_in_2;
    logic  [OUT_BITWIDTH-2:0]               pre_sum;
    logic                                   mac_done;
    logic  [20:0]                           mac_result;
    
    logic  [OUT_BITWIDTH-2:0]               accumulation;
    assign o_state = state;
    
    MAC #(.W_BITWIDTH(W_BITWIDTH), .OUT_BITWIDTH(OUT_BITWIDTH)) u_mac (
        .clk(clk),
        .rstn(rstn),
        .en(mac_en),
        .weights_0(weights_0),
        .weights_1(weights_1),
        .weights_2(weights_2),
        .data_in_0(data_in_0),
        .data_in_1(data_in_1),
        .data_in_2(data_in_2),
        .pre_sum(pre_sum),
        .done(mac_done),
        .out(mac_result),
        .o_index(o_index),
        .o_sum_arr_bf(o_sum_arr_bf)
    );
    
    // implement FSM for controller
    always @(posedge clk or negedge rstn) begin
        if (!rstn) begin
            state               <= STATE_IDLE;
            
            data_receive_done   <= 1'b0;
            run_done            <= 1'b0;
            finish_done         <= 1'b0;
            counter             <= 2'b0;
            
            weights_0           <= {W_BITWIDTH{1'b0}};
            weights_1           <= {W_BITWIDTH{1'b0}};
            weights_2           <= {W_BITWIDTH{1'b0}};
            data_in_0           <= {IN_BITWIDTH{1'b0}};
            data_in_1           <= {IN_BITWIDTH{1'b0}};
            data_in_2           <= {IN_BITWIDTH{1'b0}};
            pre_sum             <= {(OUT_BITWIDTH-1){1'b0}};
        end
        else begin
            case(state)
                STATE_IDLE: begin
                    data_receive_done   <= 1'b0;
                    run_done            <= 1'b0;
                    finish_done         <= 1'b0;
                    counter             <= 2'b0;
                    t_valid             <= 1'b0;
                    
                    
                    if (r_valid) begin
                        state   <= STATE_DATA_RECEIVE;
                    end
                end
                
                STATE_DATA_RECEIVE: begin
                    if (data_receive_done) begin
                        data_receive_done   <= 1'b0;
                        counter             <= 2'b0;
                        state               <= STATE_RUN;
                    end
                    else begin
                        if (r_valid) begin
                            counter     <= counter + 1;
                            if (counter == 2'b00) begin
                                weights_0   <= data_in[7:0];
                                weights_1   <= data_in[15:8];
                                weights_2   <= data_in[23:16];
                            end
                            else if (counter == 2'b01) begin
                                data_in_0   <= data_in[7:0];
                                data_in_1   <= data_in[15:8];
                                data_in_2   <= data_in[23:16];
                            end
                            else if (counter == 2'b10) begin
                                if (load_bias) begin
                                    pre_sum     <= data_in[OUT_BITWIDTH-2:0];
                                end
                                else begin
                                    pre_sum     <= accumulation;
                                end
                            end
                            else ;
                            
                            if (counter == 2'b10) begin
                                data_receive_done   <= 1'b1;
                            end
                        end
                        else ;
                    end
                end
                
                STATE_RUN: begin
                     if (run_done) begin
                        state   <= STATE_FINISH;
                        mac_en  <= 1'b0;
                     end
                     else begin
                        mac_en  <= 1'b1;
                        if (mac_done) begin
                            run_done    <= 1'b1;
                        end
                     end
                end  
                
                STATE_FINISH: begin
                    if (finish_done) begin
                        state           <= STATE_IDLE;
                        finish_done     <= 1'b0;
                        t_valid         <= 1'b1;
                    end
                    else begin
                        out_data        <= mac_result[OUT_BITWIDTH:0];
                        accumulation    <= mac_result[OUT_BITWIDTH-1:0];
                        finish_done     <= 1'b1;
                    end
                end
            endcase
        end
    end
    
    
endmodule

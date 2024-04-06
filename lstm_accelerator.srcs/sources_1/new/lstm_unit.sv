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
                    input                                   last_input,
                    input  [W_BITWIDTH-1:0]                 weights_0,
                    input  [W_BITWIDTH-1:0]                 weights_1, 
                    input  [W_BITWIDTH-1:0]                 weights_2,  
                    input  [IN_BITWIDTH-1:0]                data_in_0,
                    input  [IN_BITWIDTH-1:0]                data_in_1,
                    input  [IN_BITWIDTH-1:0]                data_in_2,
                    input  [PREV_SUM_BITWIDTH-1:0]          pre_sum,
                    output logic                            done,
                    output logic [31:0]                     out
    );
    
    localparam
        BUFFER_SIZE         = 32,
        
        STATE_IDLE          = 3'b000,
        STATE_RECEIVE_DATA  = 3'b001,
        STATE_RUN           = 3'b010,
        STATE_WAIT          = 3'b011,
        STATE_FINISH        = 3'b100,
        
        WAITING_TIME        = 2'b11;
        
    
    logic   [2:0]   state;
    logic           receive_data_done;
    logic           run_done;
    logic           wait_done;
    logic           finish_done;
    
    logic   [1:0]   remain_waiting_time;
    
    logic   [BUFFER_SIZE-1:0]       accu_input_bf;
    logic   [BUFFER_SIZE-1:0]       accu_forget_bf;
    logic   [BUFFER_SIZE-1:0]       accu_cell_bf;
    
    logic                           input_flag;
    logic                           forget_flag;
    logic                           cell_flag;
    
    logic                                   mac_en;
    logic  [W_BITWIDTH-1:0]                 weights_bf_0;
    logic  [W_BITWIDTH-1:0]                 weights_bf_1; 
    logic  [W_BITWIDTH-1:0]                 weights_bf_2;  
    logic  [IN_BITWIDTH-1:0]                data_in_bf_0;
    logic  [IN_BITWIDTH-1:0]                data_in_bf_1;
    logic  [IN_BITWIDTH-1:0]                data_in_bf_2;
    logic  [OUT_BITWIDTH-2:0]               pre_sum_bf;
    logic                                   mac_done;
    logic  [20:0]                           mac_result;
    
    
    MAC #(.W_BITWIDTH(W_BITWIDTH), .OUT_BITWIDTH(OUT_BITWIDTH)) u_mac (
        .clk(clk),
        .rstn(rstn),
        .en(mac_en),
        .weights_0(weights_bf_0),
        .weights_1(weights_bf_1),
        .weights_2(weights_bf_2),
        .data_in_0(data_in_bf_0),
        .data_in_1(data_in_bf_1),
        .data_in_2(data_in_bf_2),
        .pre_sum(pre_sum_bf),
        .done(mac_done),
        .out(mac_result)
    );
    
    
    always @(posedge clk or negedge rstn) begin
        if (!rstn) begin
            state       <= 3'b000;
            
            receive_data_done   <= 1'b0;
            run_done            <= 1'b0;
            wait_done           <= 1'b0;
            finish_done         <= 1'b0;
            
            remain_waiting_time    <= WAITING_TIME;
            
            weights_bf_0           <= {W_BITWIDTH{1'b0}};
            weights_bf_1           <= {W_BITWIDTH{1'b0}};
            weights_bf_2           <= {W_BITWIDTH{1'b0}};
            data_in_bf_0           <= {IN_BITWIDTH{1'b0}};
            data_in_bf_1           <= {IN_BITWIDTH{1'b0}};
            data_in_bf_2           <= {IN_BITWIDTH{1'b0}};
            pre_sum_bf             <= {(OUT_BITWIDTH-1){1'b0}};
            
            done                   <= 1'b0;
        end
        else begin
            case(state) 
                STATE_IDLE: begin
                    receive_data_done   <= 1'b0;
                    run_done            <= 1'b0;
                    wait_done           <= 1'b0;
                    finish_done         <= 1'b0;
                    done                <= 1'b0;
                    
                    remain_waiting_time <= WAITING_TIME;
                    
                    if (en && !done) begin
                        weights_bf_0    <= weights_0;
                        weights_bf_1    <= weights_1;
                        weights_bf_2    <= weights_2;
                        data_in_bf_0    <= data_in_0;
                        data_in_bf_1    <= data_in_1;
                        data_in_bf_2    <= data_in_2;
                        pre_sum_bf      <= pre_sum;
                        
                        state           <= STATE_RUN;
                    end
                end
                
                STATE_RUN: begin
                    if (run_done) begin
                        accu_input_bf   <= accu_input_bf + mac_result;
                        accu_forget_bf  <= accu_forget_bf + mac_result;
                        accu_cell_bf    <= accu_cell_bf + mac_result;
                        
                        state   <= STATE_WAIT;
                        mac_en  <= 1'b0;
                    end
                    else begin
                        mac_en  <= 1'b1;
                        if (mac_done) begin
                            run_done    <= 1'b1;
                        end
                    end
                end
               
                STATE_WAIT: begin
                    if (mac_done && last_input) begin
                        state   <= STATE_FINISH;
                    end
                    else begin
                        remain_waiting_time = remain_waiting_time - 1;
                        if (remain_waiting_time == 0) begin
                            state           <= STATE_RUN;
                        end
                    end
                end
                
                STATE_FINISH: begin
                    if (finish_done) begin
                        state           <= STATE_IDLE;
                        finish_done     <= 1'b0;
                        done            <= 1'b1;
                    end
                    else begin
                        out             <= accu_input_bf;
                        finish_done     <= 1'b1;
                    end
                end
            endcase
        end
    end
    
endmodule

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/14/2024 02:24:48 PM
// Design Name: 
// Module Name: LSTM_Unit
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


module LSTM_Unit #(parameter NUMBER_OF_FEATURES = 2,
                   parameter NUMBER_OF_UNITS = 2,
                   parameter INDEX = 0)(
                   input integer step,
                   input logic   clk,
                   input logic   rst_n,
                   input logic   enable,
                   input logic   last_timestep,
                   input logic   [7:0] vector_x          [0:NUMBER_OF_FEATURES-1],
                   input logic   [7:0] input_weights     [0:NUMBER_OF_FEATURES-1],
                   input logic   [7:0] forget_weights    [0:NUMBER_OF_FEATURES-1],
                   input logic   [7:0] cell_weights      [0:NUMBER_OF_FEATURES-1],
                   input logic   [7:0] output_weights    [0:NUMBER_OF_FEATURES-1],
                   input logic   [7:0] r_input_weights   [0:NUMBER_OF_UNITS-1],
                   input logic   [7:0] r_forget_weights  [0:NUMBER_OF_UNITS-1],
                   input logic   [7:0] r_cell_weights    [0:NUMBER_OF_UNITS-1],
                   input logic   [7:0] r_output_weights  [0:NUMBER_OF_UNITS-1],
//                   input logic   [7:0]   vector_h_prev   [0:NUMBER_OF_UNITS-1],
//                   input logic   [7:0]   prev_cell,
                   input logic   [31:0]  input_bias,
                   input logic   [31:0]  forget_bias,
                   input logic   [31:0]  cell_bias,
                   input logic   [31:0]  output_bias,
                   output logic [7:0] h_t,
                   output logic finish
    );
    
    integer i;
    
    logic init_n;
    logic enable_input;
    logic finish_input;
    logic enable_recurrent;
    logic finish_recurrent;
    logic enable_cell;
    logic finish_cell;
    logic enable_output;
    logic finish_output;
    
    //-------- weights*input reg---------//
    logic [31:0] output_input_1;
    logic [31:0] output_forget_1;
    logic [31:0] output_cell_update_1;
    logic [31:0] output_output_1;
    
    
    //-------- recurrent*hidden reg---------//
    logic [7:0] output_input_3;
    logic [7:0] output_forget_3;
    logic [7:0] output_cell_update_3;
    logic [7:0] output_output_3;
    
    //--------- cell reg -------------//
    logic [7:0]  prev_cell;
    logic [7:0]  output_cell;
    logic [7:0]  tanh_output_cell;
    
    //--------- output reg------------//
    logic [7:0]  hidden_state;
    logic [7:0]  prev_ht    [0:NUMBER_OF_UNITS-1];
    
    always @(posedge clk) begin
        if (enable == 0 || rst_n == 0) begin
            enable_input        <= 1'b0;
            enable_recurrent    <= 1'b0;
            enable_cell         <= 1'b0;
            enable_output       <= 1'b0;
            init_n              <= 1'b0;
            finish              <= 1'b1;
//            prev_cell           <= 8'b0;
//            for (i = 0; i < NUMBER_OF_UNITS; i = i+1) begin
//                prev_ht[i]      <= 8'b0;
//            end 
        end
        else begin
            if ( init_n == 0 ) begin
                enable_input        <= 1'b1;
                init_n              <= 1'b1;
                finish              <= 1'b0;
            end
            else if ( enable_input == 1'b1 && finish_input == 1'b1 ) begin
                enable_input        <= 1'b0;
                enable_recurrent    <= 1'b1;
//                init_n              <= 1'b1;
            end
            else if ( enable_recurrent == 1'b1 && finish_recurrent == 1'b1 ) begin
                enable_recurrent    <= 1'b0;
                enable_cell         <= 1'b1;
            end
            else if ( enable_cell == 1'b1 && finish_cell == 1'b1 ) begin
                enable_cell         <= 1'b0;
                enable_output       <= 1'b1;
                prev_cell           <= output_cell;
            end
            else if (last_timestep == 0 && enable_output == 1 && finish_output == 1) begin
                enable_output       <= 1'b0;
                enable_input        <= 1'b1;
            end
            else begin
                enable_output   <= 1'b0;
                init_n          <= 1'b1;
                finish          <= 1'b1;
            end
        end 
    end
    // calculate weights*input 
    calculate_weights_input #(.NUMBER_OF_FEATURES(2), .NUMBER_OF_UNITS(2)) wi(
        .clk(clk),
        .rst_n(rst_n),
        .enable_input(enable_input),
        .vector_x(vector_x),
        .input_weights(input_weights),
        .forget_weights(forget_weights),
        .cell_weights(cell_weights),
        .output_weights(output_weights),
        .input_bias(input_bias),
        .forget_bias(forget_bias),
        .cell_bias(cell_bias),
        .output_bias(output_bias),
        .finish_input(finish_input),
        .output_input_1(output_input_1),
        .output_forget_1(output_forget_1),
        .output_cell_update_1(output_cell_update_1),
        .output_output_1(output_output_1)
    );
    
    calculate_recurrent #(.NUMBER_OF_FEATURES(2), .NUMBER_OF_UNITS(2)) r(
        .step(step),
        .clk(clk),
        .rst_n(rst_n),
        .enable_recurrent(enable_recurrent),
        .vector_h_prev(prev_ht),
        .r_input_weights(r_input_weights),
        .r_forget_weights(r_forget_weights),
        .r_cell_weights(r_cell_weights),
        .r_output_weights(r_output_weights),
        .output_input_1(output_input_1),
        .output_forget_1(output_forget_1),
        .output_cell_update_1(output_cell_update_1),
        .output_output_1(output_output_1),
        .finish_recurrent(finish_recurrent),
        .output_input_3(output_input_3),
        .output_forget_3(output_forget_3),
        .output_cell_update_3(output_cell_update_3),
        .output_output_3(output_output_3)
    );
    
    calculate_cell #(.NUMBER_OF_FEATURES(2), .NUMBER_OF_UNITS(2)) c(
        .step(step),
        .clk(clk),
        .rst_n(rst_n),
        .enable_cell(enable_cell),
        .output_input_3(output_input_3),
        .output_forget_3(output_forget_3),
        .output_cell_update_3(output_cell_update_3),
        .prev_cell(prev_cell),
        .finish_cell(finish_cell),
        .output_cell(output_cell),
        .tanh_output_cell(tanh_output_cell)
    );
    
    calculate_output #(.NUMBER_OF_FEATURES(2), .NUMBER_OF_UNITS(2), .INDEX(INDEX)) o(
        .clk(clk),
        .rst_n(rst_n),
        .enable_output(enable_output),
        .tanh_output_cell(tanh_output_cell),
        .output_output_3(output_output_3),
        .hidden_state(hidden_state),
        .prev_ht(prev_ht[INDEX]),
        .finish_output(finish_output)
    );

    assign h_t = hidden_state;
endmodule

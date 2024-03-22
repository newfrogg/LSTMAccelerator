`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/20/2024 03:41:34 PM
// Design Name: 
// Module Name: lstm_layer
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


module lstm_layer #(parameter NUMBER_OF_UNITS = 2,
                    parameter NUMBER_OF_FEATURES = 2)(
                    input   logic   clk,
                    input   logic   rst_n,
                    input   logic   enable,
                    input   logic   last_timestep,
                    input   logic   [7:0]   vector_x            [0:NUMBER_OF_FEATURES-1],
                    input   logic   [7:0]   input_weights       [0:NUMBER_OF_UNITS-1][0:NUMBER_OF_FEATURES-1],
                    input   logic   [7:0]   forget_weights      [0:NUMBER_OF_UNITS-1][0:NUMBER_OF_FEATURES-1],
                    input   logic   [7:0]   cell_weights        [0:NUMBER_OF_UNITS-1][0:NUMBER_OF_FEATURES-1],
                    input   logic   [7:0]   output_weights      [0:NUMBER_OF_UNITS-1][0:NUMBER_OF_FEATURES-1],
                    input   logic   [7:0]   r_input_weights     [0:NUMBER_OF_UNITS-1][0:NUMBER_OF_UNITS-1],
                    input   logic   [7:0]   r_forget_weights    [0:NUMBER_OF_UNITS-1][0:NUMBER_OF_UNITS-1],
                    input   logic   [7:0]   r_cell_weights      [0:NUMBER_OF_UNITS-1][0:NUMBER_OF_UNITS-1],
                    input   logic   [7:0]   r_output_weights    [0:NUMBER_OF_UNITS-1][0:NUMBER_OF_UNITS-1],
                    input   logic   [7:0]   vector_h_prev       [0:NUMBER_OF_UNITS-1][0:NUMBER_OF_UNITS-1],
                    input   logic   [7:0]   prev_cell           [0:NUMBER_OF_UNITS-1],
                    input   logic   [31:0]  input_bias          [0:NUMBER_OF_UNITS-1],
                    input   logic   [31:0]  forget_bias         [0:NUMBER_OF_UNITS-1],
                    input   logic   [31:0]  cell_bias           [0:NUMBER_OF_UNITS-1],  
                    input   logic   [31:0]  output_bias         [0:NUMBER_OF_UNITS-1],
                    output  logic   [7:0]   h_t                 [0:NUMBER_OF_UNITS-1],
                    output  logic   finish
    );
    
    logic   finish_unit [0:NUMBER_OF_UNITS-1];
    logic   local_enable;
    
    integer i;
    
    LSTM_Unit #(.NUMBER_OF_FEATURES(2), .NUMBER_OF_UNITS(2)) u1(
        .clk(clk),
        .rst_n(rst_n),
        .enable(local_enable),
        .last_timestep(last_timestep),
        .vector_x(vector_x),
        .input_weights(input_weights[0]),
        .forget_weights(forget_weights[0]),
        .cell_weights(cell_weights[0]),
        .output_weights(output_weights[0]),
        .r_input_weights(r_input_weights[0]),
        .r_forget_weights(r_forget_weights[0]),
        .r_cell_weights(r_cell_weights[0]),
        .r_output_weights(r_output_weights[0]),
        .vector_h_prev(vector_h_prev[0]),
        .prev_cell(prev_cell[0]),
        .input_bias(input_bias[0]),
        .forget_bias(forget_bias[0]),
        .cell_bias(cell_bias[0]),
        .output_bias(output_bias[0]),
        .h_t(h_t[0]),
        .finish(finish_unit[0])
    );
    
    LSTM_Unit #(.NUMBER_OF_FEATURES(2), .NUMBER_OF_UNITS(2)) u2(
        .clk(clk),
        .rst_n(rst_n),
        .enable(local_enable),
        .last_timestep(last_timestep),
        .vector_x(vector_x),
        .input_weights(input_weights[1]),
        .forget_weights(forget_weights[1]),
        .cell_weights(cell_weights[1]),
        .output_weights(output_weights[1]),
        .r_input_weights(r_input_weights[1]),
        .r_forget_weights(r_forget_weights[1]),
        .r_cell_weights(r_cell_weights[1]),
        .r_output_weights(r_output_weights[1]),
        .vector_h_prev(vector_h_prev[1]),
        .prev_cell(prev_cell[1]),
        .input_bias(input_bias[1]),
        .forget_bias(forget_bias[1]),
        .cell_bias(cell_bias[1]),
        .output_bias(output_bias[1]),
        .h_t(h_t[1]),
        .finish(finish_unit[1])
    );
    
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n || !enable) begin
            local_enable    <= 1'b0;
        end
        else begin
            local_enable    <= 1'b1;
//            finish          <= 1'b0;
        end
    end
    
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            finish          <= 1'b1;
//            finish_unit[0]  <= 1'b1;
//            finish_unit[1]  <= 1'b1;
        end
        else begin
            if (finish_unit[0] == 1'b1 && finish_unit[1] == 1'b1) begin
                finish  <= 1'b1;
            end
            else begin
                finish  <= 1'b0;
            end
        end
    end
    
endmodule

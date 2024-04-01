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
                    parameter NUMBER_OF_FEATURES = 2,
                    parameter NUMBER_OF_TIMESTEPS = 2)(
                    input   logic   clk,
                    input   logic   rst_n,
                    input   logic   enable,
                    input   logic   [7:0]   matrix_x            [0:NUMBER_OF_TIMESTEPS-1][0:NUMBER_OF_FEATURES-1],
                    input   logic   [7:0]   input_weights       [0:NUMBER_OF_UNITS-1][0:NUMBER_OF_FEATURES-1],
                    input   logic   [7:0]   forget_weights      [0:NUMBER_OF_UNITS-1][0:NUMBER_OF_FEATURES-1],
                    input   logic   [7:0]   cell_weights        [0:NUMBER_OF_UNITS-1][0:NUMBER_OF_FEATURES-1],
                    input   logic   [7:0]   output_weights      [0:NUMBER_OF_UNITS-1][0:NUMBER_OF_FEATURES-1],
                    input   logic   [7:0]   r_input_weights     [0:NUMBER_OF_UNITS-1][0:NUMBER_OF_UNITS-1],
                    input   logic   [7:0]   r_forget_weights    [0:NUMBER_OF_UNITS-1][0:NUMBER_OF_UNITS-1],
                    input   logic   [7:0]   r_cell_weights      [0:NUMBER_OF_UNITS-1][0:NUMBER_OF_UNITS-1],
                    input   logic   [7:0]   r_output_weights    [0:NUMBER_OF_UNITS-1][0:NUMBER_OF_UNITS-1],
                    input   logic   [31:0]  input_bias          [0:NUMBER_OF_UNITS-1],
                    input   logic   [31:0]  forget_bias         [0:NUMBER_OF_UNITS-1],
                    input   logic   [31:0]  cell_bias           [0:NUMBER_OF_UNITS-1],  
                    input   logic   [31:0]  output_bias         [0:NUMBER_OF_UNITS-1],
                    output  logic   [7:0]   matrix_ht           [0:NUMBER_OF_TIMESTEPS-1][0:NUMBER_OF_UNITS-1],
                    output  logic   finish
    );
    
    logic   finish_unit [0:NUMBER_OF_UNITS-1];
    logic   local_enable;
    logic   last_timestep;
    logic   [7:0]   step;
    
    integer i;
//    integer index;
    logic   [7:0] vector_x          [0:NUMBER_OF_FEATURES-1];
    logic   [7:0] vector_ht         [0:NUMBER_OF_UNITS-1];
    logic   [7:0] vector_ht_prev    [0:NUMBER_OF_UNITS-1];
//    logic   [7:0] vector_cell       [0:NUMBER_OF_UNITS-1];
    logic   [7:0] buffer_vector_ht_prev [0:NUMBER_OF_UNITS-1];
    
    LSTM_Unit #(.NUMBER_OF_FEATURES(2), .NUMBER_OF_UNITS(2), .INDEX(0)) u1(
        .clk(clk),
        .rst_n(rst_n),
        .enable(local_enable),
        .last_timestep(last_timestep),
        .step(step),
        .vector_x(vector_x),
        .input_weights(input_weights[0]),
        .forget_weights(forget_weights[0]),
        .cell_weights(cell_weights[0]),
        .output_weights(output_weights[0]),
        .r_input_weights(r_input_weights[0]),
        .r_forget_weights(r_forget_weights[0]),
        .r_cell_weights(r_cell_weights[0]),
        .r_output_weights(r_output_weights[0]),
        .vector_ht_prev(vector_ht_prev),
        .input_bias(input_bias[0]),
        .forget_bias(forget_bias[0]),
        .cell_bias(cell_bias[0]),
        .output_bias(output_bias[0]),
        .h_t(vector_ht[0]),
        .finish(finish_unit[0])
    );
    
    LSTM_Unit #(.NUMBER_OF_FEATURES(2), .NUMBER_OF_UNITS(2), .INDEX(1)) u2(
        .step(step),
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
        .vector_ht_prev(vector_ht_prev),
        .input_bias(input_bias[1]),
        .forget_bias(forget_bias[1]),
        .cell_bias(cell_bias[1]),
        .output_bias(output_bias[1]),
        .h_t(vector_ht[1]),
        .finish(finish_unit[1])
    );
    
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n || !enable) begin
            local_enable    <= 1'b0;
            step            <= 1'b0;
            for (i = 0; i < NUMBER_OF_UNITS; i = i+1) begin
                vector_ht_prev[i]   <= 0;
            end
        end
        else begin
            local_enable    <= 1'b1;
            
            if (step == 0) begin
                vector_x        <= matrix_x[0];
                last_timestep   <= 0;
            end
        end
    end
    
    always @(posedge u1.finish_output) begin
//        if ( step == 0) begin
//             vector_x            <= matrix_x[step+1];
//             matrix_ht[0]        <= vector_ht;
//             vector_ht_prev      <= vector_ht;
//             step                <= step + 1;     
//        end
//        else begin
         matrix_ht[step]     <= vector_ht;
         vector_ht_prev      <= vector_ht;
         if (step != NUMBER_OF_TIMESTEPS-1) begin
            vector_x        <=  matrix_x[step+1];
            step            <=  step+1;
        end
        else begin
            step            <= 0;
            last_timestep   <= 1'b1;
        end
//        end
    end
    
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            finish          <= 1'b1;
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
    
    assign buffer_vector_ht_prev = vector_ht;
    
endmodule

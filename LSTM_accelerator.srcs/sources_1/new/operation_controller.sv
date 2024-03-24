`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/22/2024 05:50:45 PM
// Design Name: 
// Module Name: operation_controller
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


module operation_controller #(  parameter NUMBER_OF_FEATURES = 2,
                                parameter NUMBER_OF_UNITS = 2,
                                parameter NUMBER_OF_TIMESTEPS = 2 )(
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
//                                input   logic   [7:0]   vector_h_prev       [0:NUMBER_OF_UNITS-1][0:NUMBER_OF_UNITS-1],
//                                input   logic   [7:0]   prev_cell           [0:NUMBER_OF_UNITS-1],
                                input   logic   [31:0]  input_bias          [0:NUMBER_OF_UNITS-1],
                                input   logic   [31:0]  forget_bias         [0:NUMBER_OF_UNITS-1],
                                input   logic   [31:0]  cell_bias           [0:NUMBER_OF_UNITS-1],
                                input   logic   [31:0]  output_bias         [0:NUMBER_OF_UNITS-1],
//                                output  logic   [7:0]   h_t                 [0:NUMBER_OF_UNITS-1],
                                output  logic   finish
    );
    
    integer i;
    
    logic [7:0] vector_x [0:NUMBER_OF_FEATURES-1];
    logic       last_timestep;
    logic [7:0] h_t [0:NUMBER_OF_UNITS-1];
    
    lstm_layer #(.NUMBER_OF_FEATURES(2), .NUMBER_OF_UNITS(2)) layer1 (
        .step(i),
        .clk(clk),
        .rst_n(rst_n),
        .enable(enable),
        .last_timestep(last_timestep),
        .vector_x(vector_x),
        .input_weights(input_weights),
        .forget_weights(forget_weights),
        .cell_weights(cell_weights),
        .output_weights(output_weights),
        .r_input_weights(r_input_weights),
        .r_forget_weights(r_forget_weights),
        .r_cell_weights(r_cell_weights),
        .r_output_weights(r_output_weights),
        .input_bias(input_bias),
        .forget_bias(forget_bias),
        .cell_bias(cell_bias),
        .output_bias(output_bias),
        .h_t(h_t),
        .finish(finish)
    );
    
    always @(posedge clk or negedge rst_n) begin
        if ( (!rst_n) || (!enable) ) begin
            last_timestep   <= 1'b0;
            i               <= 0;
        end
        else begin
            if (i == 0) begin
                vector_x    <= matrix_x[0];
                i           <= i+1;
            end
            else begin
                @(posedge layer1.u1.finish_output) begin
                    vector_x    <=  matrix_x[i];
                    if (i != NUMBER_OF_TIMESTEPS-1) begin
                        i           <=  i+1;
                    end
                    else begin
                        i               <= 0;
                        last_timestep   <= 1'b1;
                    end
                end
            end
        end
    end
    
    
    //  
endmodule

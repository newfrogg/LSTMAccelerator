`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/14/2024 05:22:19 PM
// Design Name: 
// Module Name: calculate_recurrent
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


module calculate_recurrent #(parameter NUMBER_OF_FEATURES = 2,
                             parameter NUMBER_OF_UNITS = 2) (
                             input logic    clk,
                             input logic    rst_n,
                             input logic    enable_recurrent,
                             input logic    [7:0] step,
                             input logic    [7:0] vector_ht_prev      [0:NUMBER_OF_UNITS-1],
                             input logic    [7:0] r_input_weights     [0:NUMBER_OF_UNITS-1],
                             input logic    [7:0] r_forget_weights    [0:NUMBER_OF_UNITS-1],
                             input logic    [7:0] r_cell_weights      [0:NUMBER_OF_UNITS-1],
                             input logic    [7:0] r_output_weights    [0:NUMBER_OF_UNITS-1],
                             input logic    [31:0]  output_input_1,
                             input logic    [31:0]  output_forget_1,
                             input logic    [31:0]  output_cell_update_1,
                             input logic    [31:0]  output_output_1,
                             output logic finish_recurrent,
                             output logic [7:0] output_input_3,
                             output logic [7:0] output_forget_3,
                             output logic [7:0] output_cell_update_3,
                             output logic [7:0] output_output_3 

    );
    
    logic [31:0] input_buffer;
    logic [31:0] forget_buffer;
    logic [31:0] cell_buffer;
    logic [31:0] output_buffer;
    
    logic [31:0] output_output3_buffer;
    logic [31:0] output_input3_buffer;
    logic [31:0] output_forget3_buffer;
    logic [31:0] output_cell3_buffer;
    
    integer i;
    
    sigmoid #(.INPUT_WIDTH(32), .OUTPUT_WIDTH(8)) in (.data_in(output_input3_buffer), .data_out(output_input_3) );
    sigmoid #(.INPUT_WIDTH(32), .OUTPUT_WIDTH(8)) f (.data_in(output_forget3_buffer), .data_out(output_forget_3) );
    sigmoid #(.INPUT_WIDTH(32), .OUTPUT_WIDTH(8)) o (.data_in(output_output3_buffer), .data_out(output_output_3) );
    tanh    #(.INPUT_WIDTH(32), .OUTPUT_WIDTH(8)) g (.data_in(output_cell3_buffer), .data_out(output_cell_update_3) );
    
    always @(posedge clk or negedge rst_n) begin
        if ((!rst_n) || (!enable_recurrent)) begin
            input_buffer        <=  0;
            forget_buffer       <=  0;
            cell_buffer         <=  0;
            output_buffer       <=  0;
            finish_recurrent    <=  1'b1;
        end
        else begin
            input_buffer        <= input_buffer + output_input_1;
            forget_buffer       <= forget_buffer + output_forget_1;
            cell_buffer         <= cell_buffer + output_cell_update_1;
            output_buffer       <= output_buffer + output_output_1;
        end
    end
    
    always @(posedge enable_recurrent) begin
//            #1;
            finish_recurrent    = 1'b0;
            if (step == 0) begin
                input_buffer    = 0;
                forget_buffer   = 0;
                cell_buffer     = 0;
                output_buffer   = 0;
            end
            else begin 
                for (i = 0; i < NUMBER_OF_UNITS; i = i+1) begin
                    input_buffer    = input_buffer     + r_input_weights[i]*vector_ht_prev[i];
                    forget_buffer   = forget_buffer    + r_forget_weights[i]*vector_ht_prev[i];
                    cell_buffer     = cell_buffer      + r_cell_weights[i]*vector_ht_prev[i];
                    output_buffer   = output_buffer    + r_output_weights[i]*vector_ht_prev[i]; 
                end
            end
            output_output3_buffer   = output_buffer + output_output_1;  //sigmoid
            output_input3_buffer    = input_buffer + output_input_1;    // sigmoid
            output_forget3_buffer   = forget_buffer + output_forget_1;  // sigmoid
            output_cell3_buffer     = cell_buffer + output_cell_update_1;   // tanh
            
            finish_recurrent    = 1'b1;
    end
    
endmodule

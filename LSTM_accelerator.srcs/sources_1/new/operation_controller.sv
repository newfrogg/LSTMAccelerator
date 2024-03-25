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
                                input   logic   [31:0]  input_bias          [0:NUMBER_OF_UNITS-1],
                                input   logic   [31:0]  forget_bias         [0:NUMBER_OF_UNITS-1],
                                input   logic   [31:0]  cell_bias           [0:NUMBER_OF_UNITS-1],
                                input   logic   [31:0]  output_bias         [0:NUMBER_OF_UNITS-1],
                                output  logic   finish,
                                output  shortint unsigned index
    );
    
    shortint unsigned step;
    
    assign index = step;
    
//    logic [7:0] vector_x [0:NUMBER_OF_FEATURES-1];
//    logic       last_timestep;
    logic [7:0] matrix_ht [0:NUMBER_OF_TIMESTEPS-1][0:NUMBER_OF_UNITS-1];
    logic finish_layer;
    
    lstm_layer #(.NUMBER_OF_FEATURES(2), .NUMBER_OF_UNITS(2)) layer1 (
        .clk(clk),
        .rst_n(rst_n),
        .enable(enable),
        .matrix_x(matrix_x),
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
        .matrix_ht(matrix_ht),
        .finish(finish)
    );
    
    /*
    always @(posedge clk or negedge rst_n) begin
        if ( (!rst_n) || (!enable) ) begin
            last_timestep   <= 1'b0;
            step            <= 0;
        end
        else begin
            if (step == 0) begin
                vector_x    <= matrix_x[0];
//                step        <= step+1;
                @(posedge layer1.u1.finish_output) begin
                    vector_x    <= matrix_x[step+1];
                    step        <= step + 1;
                end
            end
            else begin
                @(posedge layer1.u1.finish_output) begin
                    if (step != NUMBER_OF_TIMESTEPS-1) begin
                        vector_x        <=  matrix_x[step+1];
                        step            <=  step+1;
                    end
                    else begin
                        step            <= 0;
                        last_timestep   <= 1'b1;
                    end
                end
            end
        end
    end
    */
//    always @(posedge clk or negedge rst_n) begin
//        if (!rst_n || !enable) begin
//            local_enable    <= 1'b0;
//            for (i = 0; i < NUMBER_OF_UNITS; i = i+1) begin
//                vector_ht_prev[i]   <= 0;
//            end
//        end
//        else begin
//            local_enable    <= 1'b1;
////            finish          <= 1'b0;
//        end
//    end
    
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            finish_layer          <= 1'b1;
        end
        else begin
            if (finish) begin
                finish_layer  <= 1'b1;
            end
            else begin
                finish_layer  <= 1'b0;
            end
        end
    end
    
    
    //  
endmodule

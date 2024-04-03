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


<<<<<<< HEAD
module operation_controller #(  parameter NUMBER_OF_FEATURES = 28,
                                parameter NUMBER_OF_UNITS = 64,
                                parameter NUMBER_OF_TIMESTEPS = 28,
                                parameter NUMBER_OF_LABELS = 10 )(
=======
module operation_controller #(  parameter NUMBER_OF_FEATURES = 2,
                                parameter NUMBER_OF_UNITS = 2,
                                parameter NUMBER_OF_TIMESTEPS = 2,
                                parameter NUMBER_OF_LABELS = 2)(
>>>>>>> lstm_real_data
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
                                input   logic   [7:0]   matrix_weights      [0:NUMBER_OF_LABELS-1][0:NUMBER_OF_TIMESTEPS*NUMBER_OF_UNITS-1],
                                input   logic   [31:0]  bias                [0:NUMBER_OF_LABELS-1],
                                output  logic   [7:0]   labels              [0:NUMBER_OF_LABELS-1],
                                output  logic   finish,
                                output  logic   [2:0]   o_state,
                                output  logic   finish_layer
    );
    
    localparam  STATE_IDLE      = 3'd0,
                STATE_LAYER1    = 3'd1,
                STATE_LAYER2    = 3'd2,
//                STATE_LAYER3    = 4'd3,
//                STATE_LAYER4    = 4'd4,
//                STATE_LAYER5    = 4'd5,
//                STATE_LAYER6    = 4'd6,
//                STATE_LAYER7    = 4'd7,
//                STATE_LAYER8    = 4'd8,
                STATE_FC        = 3'd3,
                STATE_OUTPUT    = 3'd4,
                DELAY_LAYER     = 2'd3;
    
    logic [1:0] time_delay;
    logic [2:0] state;         
    logic [7:0] matrix_ht1 [0:NUMBER_OF_TIMESTEPS-1][0:NUMBER_OF_UNITS-1];
    logic [7:0] matrix_ht2 [0:NUMBER_OF_TIMESTEPS-1][0:NUMBER_OF_UNITS-1];
    logic [7:0] vector_x [0:NUMBER_OF_TIMESTEPS*NUMBER_OF_UNITS-1];
    
    logic enable_layer1;
    logic enable_layer2;
    logic enable_fc;
    logic enable_output;
    
    logic finish_layer1;
    logic finish_layer2;
    logic finish_fc;
    logic finish_output;
    
    assign o_state = state;
    assign finish_layer = finish_layer2;
    
<<<<<<< HEAD
=======
    
>>>>>>> lstm_real_data
    lstm_layer #(.NUMBER_OF_FEATURES(NUMBER_OF_FEATURES), .NUMBER_OF_UNITS(NUMBER_OF_UNITS), .NUMBER_OF_TIMESTEPS(NUMBER_OF_TIMESTEPS)) layer1 (
        .clk(clk),
        .rst_n(rst_n),
        .enable(enable_layer1),
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
        .matrix_ht(matrix_ht1),
        .finish(finish_layer1)
    );
    
<<<<<<< HEAD
    reshape #(.SIZE_ROW(NUMBER_OF_TIMESTEPS), .SIZE_COL(NUMBER_OF_UNITS)) rs ( 
        .matrix_x(matrix_ht),
=======
    lstm_layer #(.NUMBER_OF_FEATURES(NUMBER_OF_FEATURES), .NUMBER_OF_UNITS(NUMBER_OF_UNITS), .NUMBER_OF_TIMESTEPS(NUMBER_OF_TIMESTEPS)) layer2 (
        .clk(clk),
        .rst_n(rst_n),
        .enable(enable_layer2),
        .matrix_x(matrix_ht1),
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
        .matrix_ht(matrix_ht2),
        .finish(finish_layer2)
    );
    
    
    reshape #(.SIZE_ROW(NUMBER_OF_TIMESTEPS), .SIZE_COL(NUMBER_OF_UNITS)) rs ( 
        .matrix_x(matrix_ht2),
>>>>>>> lstm_real_data
        .vector_x(vector_x)
    );
    
    fully_connected #(.NUMBER_OUTPUTS(NUMBER_OF_LABELS), .NUMBER_INPUTS(NUMBER_OF_TIMESTEPS*NUMBER_OF_UNITS)) fc1 (
        .clk(clk),
        .rst_n(rst_n),
        .enable_fully(enable_fc),
        .vector_x(vector_x),
        .matrix_weights(matrix_weights),
        .bias(bias),
        .labels(labels),
        .finish_fully(finish_fc)
    );
    
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n || !enable) begin
            state           <= STATE_IDLE;
            time_delay      <= 2'b0;
            finish          <= 1'b0;
            enable_layer1   <= 1'b0;
            enable_layer2   <= 1'b0;
            enable_fc       <= 1'b0;
            enable_output   <= 1'b0;
        end
        else begin
            case(state)
                STATE_IDLE: begin
                    enable_layer1   <= 1'b1;
                    time_delay      <= 2'b0;
                    finish          <= 1'b0;
                    state           <= STATE_LAYER1;                    
                end
                
                STATE_LAYER1: begin
                    if (finish_layer1 && time_delay == DELAY_LAYER) begin
                        enable_layer1   <= 1'b0;
                        enable_layer2   <= 1'b1;
                        time_delay      <= 2'b0;
                        state           <= STATE_LAYER2;
                    end
                    else begin
                        enable_layer1   <= 1'b1;
                        time_delay      <= time_delay + 1;
                    end
                end
                
                STATE_LAYER2: begin
                    if (finish_layer2 && time_delay == DELAY_LAYER) begin
                        enable_layer2   <= 1'b0;
                        enable_fc       <= 1'b1;
                        time_delay      <= 2'b0;
                        state           <= STATE_FC;
                    end
                    else begin
                        enable_layer2   <= 1'b1;
                        time_delay      <= time_delay + 1;
                    end
                end
/*                
                STATE_LAYER3: begin
//                    #1;
                    if (finish_layer1) begin
//                        enable_layer1   <= 1'b0;
//                        enable_fc       <= 1'b1;
                        state           <= STATE_LAYER4;
                    end
                    else begin
                        enable_layer1   <= 1'b1;
                    end
                end
                
                STATE_LAYER4: begin
                    if (finish_layer1) begin
                        enable_layer1   <= 1'b0;
                        enable_layer2   <= 1'b1;
                        state           <= STATE_LAYER5;
                    end
                    else begin
                        enable_layer1   <= 1'b1;
                    end
                end
                
                STATE_LAYER5: begin
                    if (finish_layer2) begin
//                        enable_layer1   <= 1'b0;
//                        enable_fc       <= 1'b1;
                        state           <= STATE_LAYER6;
                    end
                    else begin
                        enable_layer2   <= 1'b1;
                    end
                end
                
                STATE_LAYER6: begin
                    if (finish_layer2) begin
//                        enable_layer1   <= 1'b0;
//                        enable_fc       <= 1'b1;
                        state           <= STATE_LAYER7;
                    end
                    else begin
                        enable_layer2   <= 1'b1;
                    end
                end
                
                STATE_LAYER7: begin
//                    #1;
                    if (finish_layer2) begin
//                        enable_layer1   <= 1'b0;
//                        enable_fc       <= 1'b1;
                        state           <= STATE_LAYER8;
                    end
                    else begin
                        enable_layer2   <= 1'b1;
                    end
                end
                
                STATE_LAYER8: begin
                    if (finish_layer2) begin
                        enable_layer2   <= 1'b0;
                        enable_fc       <= 1'b1;
                        state           <= STATE_FC;
                    end
                    else begin
                        enable_layer2   <= 1'b1;
                    end
                end
*/                
                STATE_FC: begin
                    if (finish_fc) begin
                        enable_fc       <= 1'b0;
                        enable_output   <= 1'b1;
                        state           <= STATE_OUTPUT;
                    end
                    else begin
                        enable_fc       <= 1'b1;
                    end
                end
                
                STATE_OUTPUT: begin
                    state       <= STATE_IDLE;
                    finish      <= 1'b1;
                end
                
                default: begin
                    state       <= STATE_IDLE;
                end
            endcase
        end
    end

endmodule

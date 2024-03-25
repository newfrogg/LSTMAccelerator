`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/23/2024 03:46:39 PM
// Design Name: 
// Module Name: tb_operation_controller
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


module tb_operation_controller();
    
    parameter NUMBER_OF_FEATURES = 2;
    parameter NUMBER_OF_UNITS = 2;
    parameter NUMBER_OF_TIMESTEPS = 2;
    
    logic     clk;
    logic     rst_n;
    logic     enable;
    logic     last_timestep;
    logic     [7:0] matrix_x          [0:NUMBER_OF_TIMESTEPS-1][0:NUMBER_OF_FEATURES-1];
    logic     [7:0] input_weights     [0:NUMBER_OF_UNITS-1][0:NUMBER_OF_FEATURES-1];
    logic     [7:0] forget_weights    [0:NUMBER_OF_UNITS-1][0:NUMBER_OF_FEATURES-1];
    logic     [7:0] cell_weights      [0:NUMBER_OF_UNITS-1][0:NUMBER_OF_FEATURES-1];
    logic     [7:0] output_weights    [0:NUMBER_OF_UNITS-1][0:NUMBER_OF_FEATURES-1];
    logic     [7:0] r_input_weights   [0:NUMBER_OF_UNITS-1][0:NUMBER_OF_UNITS-1];
    logic     [7:0] r_forget_weights  [0:NUMBER_OF_UNITS-1][0:NUMBER_OF_UNITS-1];
    logic     [7:0] r_cell_weights    [0:NUMBER_OF_UNITS-1][0:NUMBER_OF_UNITS-1];
    logic     [7:0] r_output_weights  [0:NUMBER_OF_UNITS-1][0:NUMBER_OF_UNITS-1];
//    logic     [7:0]   vector_h_prev   [0:NUMBER_OF_UNITS-1][0:NUMBER_OF_UNITS-1];
//    logic     [7:0]   prev_cell       [0:NUMBER_OF_UNITS-1];
    logic     [31:0]  input_bias      [0:NUMBER_OF_UNITS-1];
    logic     [31:0]  forget_bias     [0:NUMBER_OF_UNITS-1];
    logic     [31:0]  cell_bias       [0:NUMBER_OF_UNITS-1];
    logic     [31:0]  output_bias     [0:NUMBER_OF_UNITS-1];
//    logic     [7:0]   vector_ht       [0:NUMBER_OF_UNITS-1];
    logic     finish;
    integer   index;
    
    operation_controller #(.NUMBER_OF_FEATURES(2), .NUMBER_OF_UNITS(2), .NUMBER_OF_TIMESTEPS(2)) uut (
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
//        .vector_h_prev(vector_h_prev),
//        .prev_cell(prev_cell),
        .input_bias(input_bias),
        .forget_bias(forget_bias),
        .cell_bias(cell_bias),
        .output_bias(output_bias),
//        .h_t(h_t),
        .finish(finish),
        .index(index)
    );
    
    integer i;
    integer j;
    logic [7:0] value [0:NUMBER_OF_UNITS-1];
    initial begin
//        vector_ht = uut.vector_ht;
        enable  = 1'b0;
        rst_n   = 1'b1;
        clk     = 1'b0;
        last_timestep = 1'b0;
        
        value[0]            = 8'h4;
        value[1]            = 8'ha0;
        
//        prev_cell[0]        = 8'ha;
//        prev_cell[1]        = 8'ha0;
        
        input_bias[0]       = 32'hb;
        forget_bias[0]      = 32'hc;
        cell_bias[0]        = 32'hd;
        output_bias[0]      = 32'he;
        
        input_bias[1]       = 32'h789abcde;
        forget_bias[1]      = 32'h89abcde0;
        cell_bias[1]        = 32'h9abcde01;
        output_bias[1]      = 32'habcde012;
        
        matrix_x[0][0]         = 8'h4;
        matrix_x[0][1]         = 8'h8;
        
        matrix_x[1][0]         = 8'h4;
        matrix_x[1][1]         = 8'h8;
        
        for (i = 0; i < NUMBER_OF_UNITS; i = i + 1) begin
            for (j = 0; j < NUMBER_OF_FEATURES; j = j + 1) begin
                input_weights[i][j]     = value[i];
                forget_weights[i][j]    = value[i];
                cell_weights[i][j]      = value[i];
                cell_weights[i][j]      = value[i];
                output_weights[i][j]    = value[i];
                r_input_weights[i][j]   = value[i];
                r_forget_weights[i][j]  = value[i];
                r_cell_weights[i][j]    = value[i];
                r_output_weights[i][j]  = value[i];
//                vector_h_prev[i][j]     = value[i];
                value[i]                = value[i] + 8'h4;
            end
        end

        #4;
        $display("Time = %t, finish = %0b", $time, uut.finish);
        rst_n   = 1'b0;
        i = 0;
        #29; 
        rst_n   = 1'b1;
        enable = 1'b1;
        $display("Time = %t, finish = %0b", $time, uut.finish);
    end
    
    always #5 begin 
        clk = ~clk;
//        $display("buffer_output1, 2 = {%0h, %0h}, prev_ht = {%0h, %0h}, vector prev ht = {%0h, %0h}", uut.layer1.u1.o.buffer_output, uut.layer1.u2.o.buffer_output, uut.layer1.u1.o.prev_ht, uut.layer1.u2.o.prev_ht, uut.layer1.vector_ht_prev[0], uut.layer1.vector_ht_prev[1]);
//        $display("vector_ht = {%0h, %0h}", uut.layer1.vector_ht[0], uut.layer1.vector_ht[0]);
//        $display("hidden_state_in_unit = {%0h, %0h}", uut.layer1.u1.hidden_state, uut.layer1.u2.hidden_state);
//        $display("prev_cell1,2 = {%0h, %0h}", uut.layer1.u1.prev_cell, uut.layer1.u2.prev_cell);
          $display("\nAt time = %t, vector_ht = [%0h, %0h]", $time, uut.layer1.buffer_vector_ht_prev[0], uut.layer1.buffer_vector_ht_prev[1]);
          $display("At time = %t, matrix_ht = [ [%0h, %0h], [%0h, %0h] ]", $time, uut.matrix_ht[0][0], uut.matrix_ht[0][1], uut.matrix_ht[1][0], uut.matrix_ht[1][1]);
//          $display("At time = %t, vector_ht_prev = [%0h, %0h]", $time, uut.layer1.vector_ht_prev[0], uut.layer1.vector_ht_prev[1]);
          $display("At time = %t, vector_ht = [%0h, %0h]", $time, uut.layer1.u1.h_t, uut.layer1.u2.h_t);
          $display("At time = %t, vector_cell = [%0h, %0h]\n", $time, uut.layer1.u1.prev_cell, uut.layer1.u2.prev_cell);
//          $display("At time = %t, vector_ht = [%0h, %0h]", $time, uut.layer1.u1.h_t, uut.layer1.u2.h_t);
    end
    
    always @(posedge uut.finish) begin
        enable = 1'b0;
        $display("\nTime = %t, finish = %0h", $time, uut.finish);
        $display("Time = %t, finish_layer = %0h\n", $time, uut.finish_layer);
    end
    
    always @(posedge clk) begin
        #2;
        $display("----------------------------------");
        $display("\nAt time = %t, Local enable = %0b", $time, uut.layer1.local_enable);
        $display("At time = %t, vector_x = {%0h, %0h}, step = %0h", $time, uut.layer1.vector_x[0], uut.layer1.vector_x[1], uut.layer1.step);
        //$display("\nAt time = %0t, enable_input = %0b, finish_input = %0b, enable_recurrent = %0b, finish_recurrent = %0b", $time, uut.wi.enable_input, uut.wi.finish_input, uut.r.enable_recurrent, uut.r.finish_recurrent);
        $display("At time = %0t, init_n1 = %0b", $time, uut.layer1.u1.init_n);
        $display("At time = %0t, enable_input = %0b, finish_input = %0b, enable_recurrent = %0b, finish_recurrent = %0b", $time, uut.layer1.u1.wi.enable_input, uut.layer1.u1.wi.finish_input, uut.layer1.u1.r.enable_recurrent, uut.layer1.u1.r.finish_recurrent);
        $display("At time = %0t, enable_cell = %0b, finish_cell = %0b, enable_output = %0b, finish_output = %0b", $time, uut.layer1.u1.c.enable_cell, uut.layer1.u1.c.finish_cell, uut.layer1.u1.o.enable_output, uut.layer1.u1.o.finish_output);

        $display("\nAt time = %0t, u1_output_input_1 = %0h, u1_output_forget_1 = %0h, u1_output_cell_update_1 = %0h, u1_output_output_1 = %0h", $time, uut.layer1.u1.wi.output_input_1, uut.layer1.u1.wi.output_forget_1, uut.layer1.u1.wi.output_cell_update_1, uut.layer1.u1.wi.output_output_1);
        
        $display("\nAt time = %0t, u1_before_add_output_input_3 = %0h, u1_before_add_output_forget_3 = %0h, u1_before_add_output_cell_update_3 = %0h, u1_before_add_output_output_3 = %0h", $time, uut.layer1.u1.r.input_buffer, uut.layer1.u1.r.forget_buffer, uut.layer1.u1.r.cell_buffer, uut.layer1.u1.r.output_buffer);
        $display("At time = %0t, u1_after_add_output_input3 = %0h, u1_after_add_output_forget3 = %0h, u1_after_add_output_cell3 = %0h, u1_after_add_output_output3 = %0h", $time, uut.layer1.u1.r.output_input3_buffer, uut.layer1.u1.r.output_forget3_buffer, uut.layer1.u1.r.output_cell3_buffer, uut.layer1.u1.r.output_output3_buffer);
        $display("At time = %0t, u1_output_input3_sigmoid = %0h, u1_output_forget3_sigmoid = %0h, u1_output_cell_update3_tanh = %0h, u1_output_output3_sigmoid = %0h", $time, uut.layer1.u1.r.output_input_3, uut.layer1.u1.r.output_forget_3, uut.layer1.u1.r.output_cell_update_3, uut.layer1.u1.r.output_output_3);
        
        $display("\nAt time = %0t, u1_output_cell = %0h, u1_tanh_output_cell = %0h", $time, uut.layer1.u1.c.buffer_cell, uut.layer1.u1.c.tanh_output_cell);
        
        $display("\nAt time = %0t, u1_hidden_state = %0h, u1_prev_ht = %0h", $time, uut.layer1.u1.o.hidden_state, uut.layer1.u1.o.prev_ht);
        
        $display("\n$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$");
        $display("At time = %0t, init_n2 = %0b", $time, uut.layer1.u2.init_n);
        $display("At time = %0t, enable_input = %0b, finish_input = %0b, enable_recurrent = %0b, finish_recurrent = %0b", $time, uut.layer1.u2.wi.enable_input, uut.layer1.u2.wi.finish_input, uut.layer1.u2.r.enable_recurrent, uut.layer1.u2.r.finish_recurrent);
        $display("At time = %0t, enable_cell = %0b, finish_cell = %0b, enable_output = %0b, finish_output = %0b", $time, uut.layer1.u2.c.enable_cell, uut.layer1.u2.c.finish_cell, uut.layer1.u2.o.enable_output, uut.layer1.u2.o.finish_output);

        $display("\nAt time = %0t, u2_output_input_1 = %0h, u2_output_forget_1 = %0h, u2_output_cell_update_1 = %0h, u2_output_output_1 = %0h", $time, uut.layer1.u2.wi.output_input_1, uut.layer1.u2.wi.output_forget_1, uut.layer1.u2.wi.output_cell_update_1, uut.layer1.u2.wi.output_output_1);
        
//        $display("\nAt time = %0t, u2_before_output_input_3 = %0h, u2_before_output_forget_3 = %0h, u2_before_output_cell_update_3 = %0h, u2_before_output_output_3 = %0h", $time, uut.layer1.u2.r.input_buffer, uut.layer1.u2.r.forget_buffer, uut.layer1.u2.r.cell_buffer, uut.layer1.u2.r.output_buffer);
//        $display("At time = %0t, u2_output_input3 = %0h, u2_output_forget3 = %0h, u2_output_cell3 = %0h, u2_output_output3 = %0h", $time, uut.layer1.u2.output_input_3, uut.layer1.u2.output_forget_3, uut.layer1.u2.output_cell_update_3, uut.layer1.u2.output_output_3);
        $display("At time = %0t, u2_before_add_output_input_3 = %0h, u2_before_add_output_forget_3 = %0h, u2_before_add_output_cell_update_3 = %0h, u2_before_add_output_output_3 = %0h", $time, uut.layer1.u2.r.input_buffer, uut.layer1.u2.r.forget_buffer, uut.layer1.u2.r.cell_buffer, uut.layer1.u2.r.output_buffer);
        $display("At time = %0t, u2_after_add_output_input3 = %0h, u2_after_add_output_forget3 = %0h, u2_after_add_output_cell3 = %0h, u2_after_add_output_output3 = %0h", $time, uut.layer1.u2.r.output_input3_buffer, uut.layer1.u2.r.output_forget3_buffer, uut.layer1.u2.r.output_cell3_buffer, uut.layer1.u2.r.output_output3_buffer);
        $display("At time = %0t, u2_output_input3_sigmoid = %0h, u2_output_forget3_sigmoid = %0h, u2_output_cell_update3_tanh = %0h, u2_output_output3_sigmoid = %0h", $time, uut.layer1.u2.r.output_input_3, uut.layer1.u2.r.output_forget_3, uut.layer1.u2.r.output_cell_update_3, uut.layer1.u2.r.output_output_3);
        
        $display("\nAt time = %0t, u2_output_cell = %0h, u2_tanh_output_cell = %0h", $time, uut.layer1.u2.c.buffer_cell, uut.layer1.u2.c.tanh_output_cell);
        $display("\nAt time = %0t, u2_hidden_state = %0h, u2_prev_ht = %0h", $time, uut.layer1.u2.o.hidden_state, uut.layer1.u2.o.prev_ht);
    end
    
    /*
    always @(posedge uut.layer1.u1.wi.finish_input or posedge uut.layer1.u1.r.finish_recurrent or posedge uut.layer1.u1.c.finish_cell or posedge uut.layer1.u1.o.finish_output) begin
        $display("111111111111111##################");
        $display("At time = %0t, enable_input = %0b, finish_input = %0b, enable_recurrent = %0b, finish_recurrent = %0b", $time, uut.layer1.u1.wi.enable_input, uut.layer1.u1.wi.finish_input, uut.layer1.u1.r.enable_recurrent, uut.layer1.u1.r.finish_recurrent);
        $display("At time = %0t, enable_cell = %0b, finish_cell = %0b, enable_output = %0b, finish_output = %0b", $time, uut.layer1.u1.c.enable_cell, uut.layer1.u1.c.finish_cell, uut.layer1.u1.o.enable_output, uut.layer1.u1.o.finish_output);

        if (uut.layer1.u1.wi.finish_input && uut.layer1.u1.wi.enable_input) begin
        $display("\nAt time = %0t, u1_output_input_1 = %0h, u1_output_forget_1 = %0h, u1_output_cell_update_1 = %0h, u1_output_output_1 = %0h", $time, uut.layer1.u1.wi.output_input_1, uut.layer1.u1.wi.output_forget_1, uut.layer1.u1.wi.output_cell_update_1, uut.layer1.u1.wi.output_output_1);
        end        
        if (uut.layer1.u1.r.finish_recurrent && uut.layer1.u1.r.enable_recurrent) begin
        $display("\nAt time = %0t, u1_before_output_input_3 = %0h, u1_before_output_forget_3 = %0h, u1_before_output_cell_update_3 = %0h, u1_before_output_output_3 = %0h", $time, uut.layer1.u1.r.input_buffer, uut.layer1.u1.r.forget_buffer, uut.layer1.u1.r.cell_buffer, uut.layer1.u1.r.output_buffer);
        $display("At time = %0t, u1_output_input3 = %0h, u1_output_forget3 = %0h, u1_output_cell3 = %0h, u1_output_output3 = %0h", $time, uut.layer1.u1.r.output_input3_buffer, uut.layer1.u1.r.output_forget3_buffer, uut.layer1.u1.r.output_cell3_buffer, uut.layer1.u1.r.output_output3_buffer);
        end

        if (uut.layer1.u1.c.finish_cell && uut.layer1.u1.c.enable_cell) begin
        $display("\nAt time = %0t, u1_output_cell = %0h, u1_tanh_output_cell = %0h", $time, uut.layer1.u1.c.buffer_cell, uut.layer1.u1.c.tanh_output_cell);
        end
        
        if (uut.layer1.u1.o.finish_output && uut.layer1.u1.o.enable_output) begin
        $display("\nAt time = %0t, u1_hidden_state = %0h, u1_prev_ht = %0h", $time, uut.layer1.u1.o.hidden_state, uut.layer1.u1.o.prev_ht);
        end
    end
    
    always @(posedge uut.layer1.u2.wi.finish_input or posedge uut.layer1.u2.r.finish_recurrent or posedge uut.layer1.u2.c.finish_cell or posedge uut.layer1.u2.o.finish_output) begin
        $display("22222222222222##################");
        $display("At time = %0t, enable_input = %0b, finish_input = %0b, enable_recurrent = %0b, finish_recurrent = %0b", $time, uut.layer1.u2.wi.enable_input, uut.layer1.u2.wi.finish_input, uut.layer1.u2.r.enable_recurrent, uut.layer1.u2.r.finish_recurrent);
        $display("At time = %0t, enable_cell = %0b, finish_cell = %0b, enable_output = %0b, finish_output = %0b", $time, uut.layer1.u2.c.enable_cell, uut.layer1.u2.c.finish_cell, uut.layer1.u2.o.enable_output, uut.layer1.u2.o.finish_output);

        if (uut.layer1.u2.wi.finish_input && uut.layer1.u2.wi.enable_input) begin
        $display("\nAt time = %0t, u2_output_input_1 = %0h, u2_output_forget_1 = %0h, u2_output_cell_update_1 = %0h, u2_output_output_1 = %0h", $time, uut.layer1.u2.wi.output_input_1, uut.layer1.u2.wi.output_forget_1, uut.layer1.u2.wi.output_cell_update_1, uut.layer1.u2.wi.output_output_1);
        end        
        if (uut.layer1.u2.r.finish_recurrent && uut.layer1.u2.r.enable_recurrent) begin
        $display("\nAt time = %0t, u2_before_output_input_3 = %0h, u2_before_output_forget_3 = %0h, u2_before_output_cell_update_3 = %0h, u2_before_output_output_3 = %0h", $time, uut.layer1.u2.r.input_buffer, uut.layer1.u2.r.forget_buffer, uut.layer1.u2.r.cell_buffer, uut.layer1.u2.r.output_buffer);
        $display("At time = %0t, u2_output_input3 = %0h, u2_output_forget3 = %0h, u2_output_cell3 = %0h, u2_output_output3 = %0h", $time, uut.layer1.u2.r.output_input3_buffer, uut.layer1.u2.r.output_forget3_buffer, uut.layer1.u2.r.output_cell3_buffer, uut.layer1.u2.r.output_output3_buffer);
        end

        if (uut.layer1.u2.c.finish_cell && uut.layer1.u2.c.enable_cell) begin
        $display("\nAt time = %0t, u2_output_cell = %0h, u2_tanh_output_cell = %0h", $time, uut.layer1.u2.c.buffer_cell, uut.layer1.u2.c.tanh_output_cell);
        end
        
        if (uut.layer1.u2.o.finish_output && uut.layer1.u2.o.enable_output) begin
        $display("\nAt time = %0t, u2_hidden_state = %0h, u2_prev_ht = %0h", $time, uut.layer1.u2.o.hidden_state, uut.layer1.u2.o.prev_ht);
        end
    end
    */
endmodule

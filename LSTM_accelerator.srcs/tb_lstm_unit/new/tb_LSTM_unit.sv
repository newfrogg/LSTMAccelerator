`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/17/2024 10:09:45 AM
// Design Name: 
// Module Name: tb_LSTM_unit
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


module tb_LSTM_unit ();
    
    parameter NUMBER_OF_FEATURES = 2;
    parameter NUMBER_OF_UNITS = 2;
    
    logic     clk;
    logic     rst_n;
    logic     enable;
    logic     last_timestep;
    logic     [7:0] vector_x          [0:NUMBER_OF_FEATURES-1];
    logic     [7:0] input_weights     [0:NUMBER_OF_FEATURES-1];
    logic     [7:0] forget_weights    [0:NUMBER_OF_FEATURES-1];
    logic     [7:0] cell_weights      [0:NUMBER_OF_FEATURES-1];
    logic     [7:0] output_weights    [0:NUMBER_OF_FEATURES-1];
    logic     [7:0] r_input_weights   [0:NUMBER_OF_UNITS-1];
    logic     [7:0] r_forget_weights  [0:NUMBER_OF_UNITS-1];
    logic     [7:0] r_cell_weights    [0:NUMBER_OF_UNITS-1];
    logic     [7:0] r_output_weights  [0:NUMBER_OF_UNITS-1];
    logic     [7:0]   vector_h_prev   [0:NUMBER_OF_UNITS-1];
    logic     [7:0]   prev_cell;
    logic     [31:0]  input_bias;
    logic     [31:0]  forget_bias;
    logic     [31:0]  cell_bias;
    logic     [31:0]  output_bias;
    logic     [7:0] h_t;
    logic     finish;
    
    LSTM_Unit #( .NUMBER_OF_FEATURES(NUMBER_OF_FEATURES), .NUMBER_OF_UNITS(NUMBER_OF_UNITS)) uut (
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
        .vector_h_prev(vector_h_prev),
        .prev_cell(prev_cell),
        .input_bias(input_bias),
        .forget_bias(forget_bias),
        .cell_bias(cell_bias),
        .output_bias(output_bias),
        .h_t(h_t),
        .finish(finish)
    );
    
    integer i;
    logic [7:0] value;
    initial begin
        last_timestep = 1'b1;
        enable  = 1'b0;
        rst_n   = 1'b1;
        clk     = 1'b0;
        value   = 8'h4;
        prev_cell       = 8'ha;
        input_bias      = 8'hb;
        forget_bias     = 8'hc;
        cell_bias       = 8'hd;
        output_bias     = 8'he;
        for (i=0; i<NUMBER_OF_FEATURES; i = i+1) begin
            vector_x[i]         = value;
            input_weights[i]    = value;
            forget_weights[i]   = value;
            cell_weights[i]     = value;
            cell_weights[i]     = value;
            output_weights[i]   = value;
            r_input_weights[i]  = value;
            r_forget_weights[i] = value;
            r_cell_weights[i]   = value;
            r_output_weights[i] = value;
            vector_h_prev[i]    = value;
            value = value + 8'h4;
        end
        
        #4;
        $display("Time = %t, finish = %0b", $time, uut.finish);
        rst_n   = 1'b0;
        i = 0;
        #29; 
        rst_n   = 1'b1;
        enable = 1'b1;
        $display("Time = %t, finish = %0b", $time, uut.finish);
//        #30 enable = 1'b0;
    end
    
    always #5 begin 
        clk = ~clk;
        
    end
    
    always @(posedge uut.finish) begin
//        if (uut.finish == 1'b1) begin
//          @(posedge uut.clk) ;
          
//          @(posedge uut.clk) begin
            enable = 1'b0;
            $display("Time = %t", $time);
//          end     
//        end
    end
    
    always @(clk) begin
        #2;
        $display("----------------------------------");
        //$display("\nAt time = %0t, enable_input = %0b, finish_input = %0b, enable_recurrent = %0b, finish_recurrent = %0b", $time, uut.wi.enable_input, uut.wi.finish_input, uut.r.enable_recurrent, uut.r.finish_recurrent);
        $display("At time = %0t, init_n = %0b", $time, uut.init_n);
        $display("At time = %0t, enable_input = %0b, finish_input = %0b, enable_recurrent = %0b, finish_recurrent = %0b", $time, uut.wi.enable_input, uut.wi.finish_input, uut.r.enable_recurrent, uut.r.finish_recurrent);
        $display("At time = %0t, enable_cell = %0b, finish_cell = %0b, enable_output = %0b, finish_output = %0b", $time, uut.c.enable_cell, uut.c.finish_cell, uut.o.enable_output, uut.o.finish_output);

        $display("\nAt time = %0t, output_input_1 = %0h, output_forget_1 = %0h, output_cell_update_1 = %0h, output_output_1 = %0h", $time, uut.wi.output_input_1, uut.wi.output_forget_1, uut.wi.output_cell_update_1, uut.wi.output_output_1);
        //$display("At time = %0t, enable_input = %0b, finish_input = %0b, enable_recurrent = %0b, finish_recurrent = %0b", $time, uut.wi.enable_input, uut.wi.finish_input, uut.r.enable_recurrent, uut.r.finish_recurrent);
        $display("\nAt time = %0t, before_output_input_3 = %0h, before_output_forget_3 = %0h, before_output_cell_update_3 = %0h, before_output_output_3 = %0h, sigmoid = %0h, tanh = %0h", $time, uut.r.input_buffer, uut.r.forget_buffer, uut.r.cell_buffer, uut.r.output_output3_buffer, uut.r.output_input_3, uut.r.output_cell_update_3);
        //$display("At time = %0t, enable_input = %0b, finish_input = %0b, enable_recurrent = %0b, finish_recurrent = %0b", $time, uut.wi.enable_input, uut.wi.finish_input, uut.r.enable_recurrent, uut.r.finish_recurrent);
        
        $display("\nAt time = %0t, output_cell = %0h, tanh_output_cell = %0h", $time, uut.c.buffer_cell, uut.c.tanh_output_cell);
        //$display("At time = %0t, enable_input = %0b, finish_input = %0b, enable_recurrent = %0b, finish_recurrent = %0b", $time, uut.wi.enable_input, uut.wi.finish_input, uut.r.enable_recurrent, uut.r.finish_recurrent);
        $display("\nAt time = %0t, hidden_state = %0h, prev_ht = %0h", $time, uut.o.hidden_state, uut.o.prev_ht);

    end
    always @(posedge uut.wi.finish_input or posedge uut.r.finish_recurrent or posedge uut.c.finish_cell or posedge uut.o.finish_output) begin
        $display("####################################");
        $display("\nAt time = %0t, enable_input = %0b, finish_input = %0b, enable_recurrent = %0b, finish_recurrent = %0b", $time, uut.wi.enable_input, uut.wi.finish_input, uut.r.enable_recurrent, uut.r.finish_recurrent);
        $display("At time = %0t, enable_cell = %0b, finish_cell = %0b, enable_output = %0b, finish_output = %0b \n", $time, uut.c.enable_cell, uut.c.finish_cell, uut.o.enable_output, uut.o.finish_output);

        if (uut.wi.finish_input && uut.wi.enable_input) begin
//            #1;
            $display("\nAt time = %0t, output_input_1 = %0h, output_forget_1 = %0h, output_cell_update_1 = %0h, output_output_1 = %0h", $time, uut.wi.output_input_1, uut.wi.output_forget_1, uut.wi.output_cell_update_1, uut.wi.output_output_1);
//            $display("At time = %0t, enable_input = %0b, finish_input = %0b, enable_recurrent = %0b, finish_recurrent = %0b", $time, uut.wi.enable_input, uut.wi.finish_input, uut.r.enable_recurrent, uut.r.finish_recurrent);
        end        
        if (uut.r.finish_recurrent && uut.r.enable_recurrent) begin
        $display("\nAt time = %0t, before_output_input_3 = %0h, before_output_forget_3 = %0h, before_output_cell_update_3 = %0h, before_output_output_3 = %0h, sigmoid = %0h, tanh = %0h", $time, uut.r.input_buffer, uut.r.forget_buffer, uut.r.cell_buffer, uut.r.output_output3_buffer, uut.r.output_input_3, uut.r.output_cell_update_3);
//            $display("At time = %0t, enable_input = %0b, finish_input = %0b, enable_recurrent = %0b, finish_recurrent = %0b", $time, uut.wi.enable_input, uut.wi.finish_input, uut.r.enable_recurrent, uut.r.finish_recurrent);
        end

        if (uut.c.finish_cell && uut.c.enable_cell) begin
            $display("\nAt time = %0t, output_cell = %0h, tanh_output_cell = %0h", $time, uut.c.buffer_cell, uut.c.tanh_output_cell);
        end
        
        if (uut.o.finish_output && uut.o.enable_output) begin
            $display("\nAt time = %0t, hidden_state = %0h, prev_ht = %0h", $time, uut.o.buffer_output, uut.o.prev_ht);
        end
    end

endmodule

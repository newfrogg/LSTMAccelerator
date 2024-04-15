`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/06/2024 07:51:46 PM
// Design Name: 
// Module Name: tb_controller_lstm_unit
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
class GenerateInput;
    randc   bit[31:0]   input_bf;
    constraint c_input  { input_bf  <= 32'h00_ff_ff_ff; }
endclass

class GenerateWeight;
    randc   bit[31:0]   weight_bf;
    constraint c_weight { weight_bf <= 32'h00_ff_ff_ff; }
endclass

class GenerateBias;
    randc   bit[31:0]   bias_bf;
    constraint c_bias_bf { bias_bf <= 32'hff_ff_ff_ff; }
endclass

class GenerateCell;
    randc   bit[31:0]   cell_bf;
    constraint c_cell_bf { cell_bf <= 32'h00_00_00_ff; }
endclass

module tb_controller_lstm_unit();

    localparam      NO_UNITS = 2;
    localparam      NO_FEATURES = 3;
    localparam      NO_TIMESTEPS = 2;
    localparam      NO_SAMPLES = 2;
    
    logic               clk;
    logic               rstn;
    logic               r_valid;
    logic               is_last_data_gate;
    logic [31:0]        data_in;
    logic               r_data;
    logic               w_valid;
    logic               t_valid;
    logic [31:0]        out_data;
    logic [7:0]         o_lstm_unit_result [0:3];
    logic [7:0]         o_index;
    logic [1:0]         o_current_timestep;
    logic [2:0]         o_state;
    logic [2:0]         o_lstm_state;
    logic [1:0]         o_mac_state;
    logic [2:0]         o_r_state;
//    logic               o_lstm_unit_done;
    logic               o_lstm_finish_step;
    logic               o_lstm_is_continued;
    logic               o_lstm_is_waiting;
    logic [1:0]         o_type_gate;
    logic [1:0]         o_gate;
    logic [7:0]         o_value_gate [0:3];
    logic [31:0]        o_cell_state;
    logic [7:0]         weights [0:2];
    logic [7:0]         inputs [0:2];
    logic [31:0]        bias;
    logic               o_is_load_bias;
    logic               o_is_load_cell;
    logic               o_is_last_input;
    logic [31:0]        o_lstm_accu_bf;
    logic [31:0]        o_mac_result;
    logic [7:0]         o_prev_cell_bf;
    logic [7:0]         o_tanh_cell_state;
    logic [31:0]        o_ht;
    
    logic [31:0]        expected_input_gate [0:NO_UNITS-1];
    logic [31:0]        expected_forget_gate [0:NO_UNITS-1];
    logic [31:0]        expected_cell_gate [0:NO_UNITS-1];
    logic [31:0]        expected_output_gate [0:NO_UNITS-1];
    logic [31:0]        input_gate;
    logic [31:0]        forget_gate;
    logic [31:0]        cell_gate;
    logic [31:0]        output_gate;
    
    logic [31:0]        input_matrix [0:NO_SAMPLES-1][0:NO_TIMESTEPS-1][0:NO_FEATURES-1];
    
    logic [31:0]        in_weight_matrix [0:NO_UNITS-1][0:NO_FEATURES-1];
    logic [31:0]        for_weight_matrix [0:NO_UNITS-1][0:NO_FEATURES-1];
    logic [31:0]        cell_weight_matrix [0:NO_UNITS-1][0:NO_FEATURES-1];
    logic [31:0]        out_weight_matrix [0:NO_UNITS-1][0:NO_FEATURES-1];
    
    logic [31:0]        r_in_weight_matrix [0:NO_UNITS-1][0:(NO_UNITS-1)/3];
    logic [31:0]        r_for_weight_matrix [0:NO_UNITS-1][0:(NO_UNITS-1)/3];
    logic [31:0]        r_cell_weight_matrix [0:NO_UNITS-1][0:(NO_UNITS-1)/3];
    logic [31:0]        r_out_weight_matrix [0:NO_UNITS-1][0:(NO_UNITS-1)/3];
    
    logic [31:0]        bias_matrix [0:NO_UNITS-1][0:3];
    
    logic [31:0]        ht_matrix [0:NO_SAMPLES-1][0:NO_TIMESTEPS-1][0:(NO_UNITS-1)/3];
    
    logic [31:0]        cell_state;        

    
    integer         current_unit;
    integer         current_timestep;
    integer         current_sample;
    logic [7:0]     current_ht;
    logic           wrong_flag;
    
    controller uut (
        .clk(clk),
        .rstn(rstn),
        .r_valid(r_valid),
        .is_last_data_gate(is_last_data_gate),
        .data_in(data_in),
        .r_data(r_data),
        .w_valid(w_valid),
        .t_valid(t_valid),
        .out_data(out_data),
        .o_state(o_state),
        .o_lstm_state(o_lstm_state),
        .o_lstm_finish_step(o_lstm_finish_step),
        .o_lstm_is_continued(o_lstm_is_continued),
        .o_lstm_is_waiting(o_lstm_is_waiting),
        .weights(weights),
        .inputs(inputs),
        .bias(bias),
        .o_is_load_bias(o_is_load_bias),
        .o_index(o_index),
        .o_mac_state(o_mac_state),
        .o_is_last_input(o_is_last_input),
        .o_lstm_accu_bf(o_lstm_accu_bf),
        .o_mac_result(o_mac_result),
        .o_type_gate(o_type_gate),
        .o_gate(o_gate),
        .o_value_gate(o_value_gate),
        .o_is_load_cell(o_is_load_cell),
        .o_r_state(o_r_state),
        .o_prev_cell_bf(o_prev_cell_bf),
        .o_cell_state(o_cell_state),
        .o_tanh_cell_state(o_tanh_cell_state),
        .o_ht(o_ht),
        .o_current_timestep(o_current_timestep),
        .o_lstm_unit_result(o_lstm_unit_result)
    );
    
    always #5 begin 
        clk = ~clk;
         
    end
    integer index;
    integer iter;
    
    GenerateInput   input_pkt;
    GenerateWeight  weight_pkt;
    GenerateBias    bias_pkt;
    GenerateCell    cell_pkt;
    
    initial begin
        wrong_flag   = 0;
        current_unit = 0;
        current_timestep = 0;
        is_last_data_gate = 0;
        current_ht   = 0;
        index = 0;
        iter = 0;
        for (current_unit = 0; current_unit < NO_UNITS; current_unit = current_unit + 1) begin
            expected_input_gate[current_unit] = 0;
            expected_forget_gate[current_unit] = 0;
            expected_cell_gate[current_unit] = 0;
            expected_output_gate[current_unit] = 0;
        end

        input_pkt       = new ();
        weight_pkt      = new ();
        bias_pkt        = new ();
        cell_pkt        = new ();
        
        // generate input matrix [timesteps, features]
        current_timestep = 0;
        current_sample = 0;
        repeat(NO_SAMPLES) begin
            repeat(NO_TIMESTEPS) begin
                index = 0;
                repeat(NO_FEATURES) begin
                    input_pkt.randomize();
                    input_matrix[current_sample][current_timestep][index] = input_pkt.input_bf;
                    index = index + 1;
                end
                current_timestep = current_timestep + 1;
            end
            current_sample = current_sample + 1;
            current_timestep = 0;
        end
        // generate input weight matrix [units, features]
        current_unit = 0;
        repeat(NO_UNITS) begin
            // generate input weight
            index = 0;
            repeat(NO_FEATURES) begin
                weight_pkt.randomize();
                in_weight_matrix[current_unit][index] = weight_pkt.weight_bf;
                
                weight_pkt.randomize();
                for_weight_matrix[current_unit][index] = weight_pkt.weight_bf;
                
                weight_pkt.randomize();
                cell_weight_matrix[current_unit][index] = weight_pkt.weight_bf;
                
                weight_pkt.randomize();
                out_weight_matrix[current_unit][index] = weight_pkt.weight_bf;
                
                index = index + 1;
            end
            current_unit = current_unit + 1;
        end
        
        // generate recurrent weight matrix [units, (units-1)/3]
        current_unit = 0;
        repeat(NO_UNITS) begin
            index = 0;
            repeat((NO_UNITS-1)/3 + 1) begin
                weight_pkt.randomize();
                r_in_weight_matrix[current_unit][index] = weight_pkt.weight_bf;
                
                weight_pkt.randomize();
                r_for_weight_matrix[current_unit][index] = weight_pkt.weight_bf;
                
                weight_pkt.randomize();
                r_cell_weight_matrix[current_unit][index] = weight_pkt.weight_bf;
                
                weight_pkt.randomize();
                r_out_weight_matrix[current_unit][index] = weight_pkt.weight_bf;
                
                index = index + 1;
            end
            current_unit = current_unit + 1;
        end
        
        // generate bias matrix [units, 4]
        current_unit = 0;
        repeat(NO_UNITS) begin
            bias_pkt.randomize();
            bias_matrix[current_unit][0] = bias_pkt.bias_bf;
            
            bias_pkt.randomize();
            bias_matrix[current_unit][1] = bias_pkt.bias_bf;
            
            bias_pkt.randomize();
            bias_matrix[current_unit][2] = bias_pkt.bias_bf;
            
            bias_pkt.randomize();
            bias_matrix[current_unit][3] = bias_pkt.bias_bf;
            
            current_unit = current_unit + 1;
        end
        
        clk  = 1'b0;
        rstn = 1'b0;
        r_valid = 1'b0;
        data_in = 32'd0;
        
        repeat(10)
            @(negedge clk);
        rstn = 1'b1;
        
        repeat(10)
            @(negedge clk);
    
        r_valid = 1'b1;
        current_timestep = 0;
        current_unit = 0;
        //////1st///////
        $display("///////////////////////////////////////////////////////////");
        $display("//////////////////// Test No[%0d] Start /////////////////////", index);
        $display("///////////////////////////////////////////////////////////\n");
        
//        NO_FEATURES = 28;
        current_sample = 0;
        repeat(NO_SAMPLES) begin
            repeat(NO_TIMESTEPS) begin
        /////////////////////////////////////////////////////////////////////////
        
            index = 0;
            repeat(NO_FEATURES) begin
                r_valid = 1;
            /*          load input weight               */
                // load input input weight
                current_unit = 0;
                repeat(NO_UNITS) begin
                    @(negedge clk);
                    data_in = in_weight_matrix[current_unit][index];
                    current_unit = current_unit + 1;
                end
                
                //load input forget weight
                current_unit = 0;
                repeat(NO_UNITS) begin
                    @(negedge clk);
                    data_in = for_weight_matrix[current_unit][index];
                    current_unit = current_unit + 1;
                end
                
                //load input cell weight
                current_unit = 0;
                repeat(NO_UNITS) begin
                    @(negedge clk);
                    data_in = cell_weight_matrix[current_unit][index];
                    current_unit = current_unit + 1;
                end
                
                //load input output weight
                current_unit = 0;
                repeat(NO_UNITS) begin
                    @(negedge clk);
                    data_in = out_weight_matrix[current_unit][index];
                    current_unit = current_unit + 1;
                end
                
            /*          load input               */
            
                @(negedge clk);
                data_in = input_matrix[current_sample][current_timestep][index];
                
            /*          load bias               */    
                current_unit = 0;
                if (index == 0) begin
                    // load input bias
                    current_unit = 0;
                    repeat(NO_UNITS) begin
                        @(negedge clk);
                        data_in = bias_matrix[current_unit][0];
                        current_unit = current_unit + 1;
                    end
                    // load forget bias
                    current_unit = 0;
                    repeat(NO_UNITS) begin
                        @(negedge clk);
                        data_in = bias_matrix[current_unit][1];
                        current_unit = current_unit + 1;
                    end
                    // load cell bias
                    current_unit = 0;
                    repeat(NO_UNITS) begin
                        @(negedge clk);
                        data_in = bias_matrix[current_unit][2];
                        current_unit = current_unit + 1;
                    end
                    // load output bias
                    current_unit = 0;
                    repeat(NO_UNITS) begin
                        @(negedge clk);
                        data_in = bias_matrix[current_unit][3];
                        current_unit = current_unit + 1;
                    end
                end
                else if (index == NO_FEATURES - 1 && current_timestep == 0) begin
                    current_unit = 0;
                    repeat(NO_UNITS) begin
                        @(negedge clk);
                        if (current_timestep != 0) data_in = cell_state[current_unit];
                        else data_in = 0;
                        current_unit = current_unit + 1;
                    end
                end
                else ;
                
                repeat(1) begin
                    @(negedge clk);
                    r_valid = 1'b0;
                    data_in = 32'd0;
                end
                
                if (index < NO_FEATURES-1) begin
                    index = index + 1;
                    is_last_data_gate = 1'b0;
                    wait(r_data);
                    @(negedge clk);
                    r_valid = 1'b1;
                end
                else if (index == NO_FEATURES-1 && current_timestep !=0) begin
                    wait(r_data);
                    @(negedge clk);
                    r_valid = 1'b1;
                end 
                
                if (index == NO_FEATURES-1 && current_timestep == 0) begin
                    is_last_data_gate = 1'b1;
                end 
                else is_last_data_gate = 1'b0;
    
            end 
                        
//            current_ht = 0;

            
            if (current_timestep != 0) begin
            ///////////////////////////////////////////////////////////////////////////////////////////////////////
                index = 0;
                repeat((NO_UNITS-1)/3 + 1) begin
                    r_valid = 1;
                /*          load r weight               */
                    // load r input weight
                    current_unit = 0;
                    repeat(NO_UNITS) begin
                        @(negedge clk);
                        data_in = r_in_weight_matrix[current_unit][index];
                        current_unit = current_unit + 1;
                    end
                    
                    //load r forget weight
                    current_unit = 0;
                    repeat(NO_UNITS) begin
                        @(negedge clk);
                        data_in = r_for_weight_matrix[current_unit][index];
                        current_unit = current_unit + 1;
                    end
                    
                    //load r cell weight
                    current_unit = 0;
                    repeat(NO_UNITS) begin
                        @(negedge clk);
                        data_in = r_cell_weight_matrix[current_unit][index];
                        current_unit = current_unit + 1;
                    end
                    
                    //load r output weight
                    current_unit = 0;
                    repeat(NO_UNITS) begin
                        @(negedge clk);
                        data_in = r_out_weight_matrix[current_unit][index];
                        current_unit = current_unit + 1;
                    end
                    
                /*          load input               */
                
                    @(negedge clk);
                    data_in = ht_matrix[current_sample][current_timestep-1][index];
                    
                    repeat(1) begin
                    @(negedge clk);
                    r_valid = 1'b0;
                    data_in = 32'd0;
                    end
                    
                    if (index < (NO_UNITS-1)/3) begin
                        index = index + 1;
                        is_last_data_gate = 1'b0;
                        wait(r_data);
                        @(negedge clk);
                        r_valid = 1'b1;
                    end
                    else ;
                    
                    if (index == (NO_UNITS-1)/3) begin
                        is_last_data_gate = 1'b1;
                    end 
                    else is_last_data_gate = 1'b0;    
                    
                end
                
                wait(w_valid);
                while (w_valid) begin
                    for (current_ht = 0; current_ht < (NO_UNITS-1)/3 + 1; current_ht = current_ht + 1) begin
                        @(negedge clk);
                        ht_matrix[current_sample][current_timestep][current_ht] = out_data;
                    end
                    @(negedge clk);
                end
                
                for (current_ht = 0; current_ht < (NO_UNITS-1)/3 + 1; current_ht = current_ht + 1) begin
                    $display("SAMPLE = %0d, Real result ht[%0d][%0d]= [%0h]", current_sample, current_timestep, current_ht, ht_matrix[current_sample][current_timestep][current_ht]);
                end
               
            ///////////////////////////////////////////////////////////////////////////////////////////////////////
            end
            else begin
                wait(w_valid);
                while (w_valid) begin
                    for (current_ht = 0; current_ht < (NO_UNITS-1)/3 + 1; current_ht = current_ht + 1) begin
                        @(negedge clk);
                        ht_matrix[current_sample][current_timestep][current_ht] = out_data;
                    end
                    @(negedge clk);
                end
                
                for (current_ht = 0; current_ht < (NO_UNITS-1)/3 + 1; current_ht = current_ht + 1) begin
                    $display("SAMPLE = %0d, Real result ht[%0d][%0d]= [%0h]", current_sample, current_timestep, current_ht, ht_matrix[current_sample][current_timestep][current_ht]);
                end
            end
            
            current_timestep = current_timestep + 1;
            is_last_data_gate = 1'b0;
            
                    /////////////////////////////////////////////////////////////////////////
            end    
            
            current_sample = current_sample + 1;
            current_timestep = 0;
        end
         
           
        wait(t_valid);
        if (!wrong_flag) begin
            $display("\n#####################################################");
            $display("-----------------------------------------------------");
            $display("\n!!!!!!!!!!!!!!!!   TESTCASE PASS   !!!!!!!!!!!!!!!!!!\n");
            $display("-----------------------------------------------------");
            $display("#####################################################");
        end
        else begin
            $display("\n#####################################################");
            $display("-----------------------------------------------------");
            $display("\n!!!!!!!!!!!!!!!!   TESTCASE FAIL   !!!!!!!!!!!!!!!!!!\n");
            $display("-----------------------------------------------------");
            $display("#####################################################");
        end
            
            $display("\n---------------------- END ------------------------");
    
        end 
/*
        ////////////////////////////

        if (!wrong_flag) begin
            $display("\n#####################################################");
            $display("-----------------------------------------------------");
            $display("\n!!!!!!!!!!!!!!!!   TESTCASE PASS   !!!!!!!!!!!!!!!!!!\n");
            $display("-----------------------------------------------------");
            $display("#####################################################");
        end
        else begin
            $display("\n#####################################################");
            $display("-----------------------------------------------------");
            $display("\n!!!!!!!!!!!!!!!!   TESTCASE FAIL   !!!!!!!!!!!!!!!!!!\n");
            $display("-----------------------------------------------------");
            $display("#####################################################");
        end
            $display("\n---------------------- END ------------------------");    
        
    */
endmodule

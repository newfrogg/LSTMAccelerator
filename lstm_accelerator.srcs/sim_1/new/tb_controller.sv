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
//class GenerateInput;
//    randc   bit[31:0]   input_bf;
//    constraint c_input  { input_bf  <= 32'h00_ff_ff_ff; }
//endclass

//class GenerateWeight;
//    randc   bit[31:0]   weight_bf;
//    constraint c_weight { weight_bf <= 32'h00_ff_ff_ff; }
//endclass

//class GenerateBias;
//    randc   bit[31:0]   bias_bf;
//    constraint c_bias_bf { bias_bf <= 32'hff_ff_ff_ff; }
//endclass

//class GenerateCell;
//    randc   bit[31:0]   cell_bf;
//    constraint c_cell_bf { cell_bf <= 32'h00_00_00_ff; }
//endclass

module tb_controller();
    
    localparam      MAX_NO_UNITS = 32;
    localparam      NO_UNITS_LSTM = 32;
    localparam      NO_UNITS_FC = 10;
    localparam      NO_FEATURES = 10;
    localparam      NO_TIMESTEPS = 28;
    localparam      NO_SAMPLES = 1;
    localparam      NO_CLASSES = 10;
    
    logic               clk;
    logic               rstn;
    logic               r_valid;
    logic               is_last_data_gate;
    logic [31:0]        data_in;
    logic               r_data;
    logic               w_valid;
    logic               t_valid;
    logic [31:0]        out_data;
    logic [7:0]         o_lstm_unit_result [0:3][0:1];
    logic [7:0]         o_index;
    logic [1:0]         o_current_unit;
    logic [1:0]         o_current_layer;
    logic [4:0]         o_current_timestep;
    logic [6:0]         current_no_units;
    logic [6:0]         o_current_no_units;
    logic [6:0]         o_remaining_no_units;
    logic [6:0]         remaining_no_units;
    logic [4:0]         o_current_sample;
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
    logic [1:0]         o_count_gate;
    logic [7:0]         o_value_gate [0:3][0:1];
    logic [31:0]        o_cell_state [0:1];
    logic [7:0]         weights [0:2];
    logic [7:0]         inputs [0:2];
    logic [31:0]        bias;
    logic               o_read_bias;
    logic               o_is_load_bias;
    logic               o_is_load_cell;
    logic               o_is_last_input;
    logic [31:0]        o_lstm_accu_bf[0:1];
    logic [31:0]        o_mac_result;
    logic [7:0]         o_prev_cell_bf [0:1];
    logic [7:0]         o_tanh_cell_state [0:1];
    logic [7:0]         o_ht [0:1];
    
    
//    logic [31:0]        expected_input_gate [0:NO_UNITS-1];
//    logic [31:0]        expected_forget_gate [0:NO_UNITS-1];
//    logic [31:0]        expected_cell_gate [0:NO_UNITS-1];
//    logic [31:0]        expected_output_gate [0:NO_UNITS-1];
    logic [31:0]        input_gate;
    logic [31:0]        forget_gate;
    logic [31:0]        cell_gate;
    logic [31:0]        output_gate;
    
    logic [31:0]        input_matrix [0:NO_SAMPLES-1][0:NO_TIMESTEPS-1][0:NO_FEATURES-1];
    
    logic [31:0]        in_weight_matrix [0:NO_UNITS_LSTM-1][0:NO_FEATURES-1];
    logic [31:0]        for_weight_matrix [0:NO_UNITS_LSTM-1][0:NO_FEATURES-1];
    logic [31:0]        cell_weight_matrix [0:NO_UNITS_LSTM-1][0:NO_FEATURES-1];
    logic [31:0]        out_weight_matrix [0:NO_UNITS_LSTM-1][0:NO_FEATURES-1];
    
    logic [31:0]        r_in_weight_matrix [0:NO_UNITS_LSTM-1][0:(NO_UNITS_LSTM-1)/3];
    logic [31:0]        r_for_weight_matrix [0:NO_UNITS_LSTM-1][0:(NO_UNITS_LSTM-1)/3];
    logic [31:0]        r_cell_weight_matrix [0:NO_UNITS_LSTM-1][0:(NO_UNITS_LSTM-1)/3];
    logic [31:0]        r_out_weight_matrix [0:NO_UNITS_LSTM-1][0:(NO_UNITS_LSTM-1)/3];
    
    logic [31:0]        bias_matrix [0:NO_UNITS_LSTM-1][0:3];
    
    logic [7:0]         ht_matrix [0:NO_SAMPLES-1][0:NO_TIMESTEPS-1][0:(NO_UNITS_LSTM-1)];
    logic [7:0]         ht_flatten [0:NO_SAMPLES-1][0:NO_TIMESTEPS*NO_UNITS_LSTM - 1];
    
    logic [31:0]        fc_weight [0:NO_CLASSES-1][0:(NO_TIMESTEPS*NO_UNITS_LSTM - 1)/3];
    logic [31:0]        fc_bias [0:NO_CLASSES-1];
    logic [7:0]         fc_result [0:NO_SAMPLES-1][0:NO_CLASSES-1];
    
    logic [31:0]        cell_state;        

    integer         current_class;
    integer         current_unit;
    integer         current_unit_bf;
    integer         current_timestep;
    integer         current_sample;
    integer         current_feature;
    logic [7:0]     current_ht;
    logic [7:0]     last_ht_unit;
    logic [7:0]     last_fc_unit;
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
        .o_lstm_unit_result(o_lstm_unit_result),
        .o_current_no_units(o_current_no_units),
        .o_remaining_no_units(o_remaining_no_units),
        .o_read_bias(o_read_bias),
        .o_current_layer(o_current_layer),
        .o_current_sample(o_current_sample),
        .o_count_gate(o_count_gate),
        .o_current_unit(o_current_unit)
    );
    
    always #20 begin 
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
        current_no_units = 0;
        last_ht_unit = 0;
        remaining_no_units = NO_UNITS_LSTM;
        is_last_data_gate = 0;
        current_ht   = 0;
        index = 0;
        iter = 0;

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
        repeat(NO_UNITS_LSTM) begin
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
        repeat(NO_UNITS_LSTM) begin
            index = 0;
            repeat((NO_UNITS_LSTM-1)/3 + 1) begin
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
        repeat(NO_UNITS_LSTM) begin
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
        
        // generate weight and bias for fc
        current_class = 0;
        repeat(NO_CLASSES) begin
//            NO_TIMESTEPS*(NO_UNITS_LSTM-1)/3 - 1
            index = 0;
            repeat( (NO_TIMESTEPS*NO_UNITS_LSTM-1)/3 + 1 ) begin
                weight_pkt.randomize();
                fc_weight[current_class][index] = weight_pkt.weight_bf;
                index = index + 1;
            end
            
            bias_pkt.randomize();
            fc_bias[current_class] = bias_pkt.bias_bf;
            
            current_class = current_class + 1;
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
    
//        r_valid = 1'b1;
        current_timestep = 0;
        current_unit = 0;
        current_unit_bf = 0;
        //////1st///////
        $display("///////////////////////////////////////////////////////////");
        $display("//////////////////// Test No[%0d] Start /////////////////////", index);
        $display("///////////////////////////////////////////////////////////\n");
        
        current_sample = 0;
        repeat(NO_SAMPLES) begin                                // begin
            // ------------------- Load input for LSTM --------------------------- //
            current_timestep = 0;
//            current_ht  = 0;
            repeat(3) begin                                     // 1 tab
                @(negedge clk);
            end                                                 // 1 tab
            repeat(NO_TIMESTEPS) begin                          // 1 tab
                current_feature = 0;
                current_unit = 0;
                repeat(NO_FEATURES) begin                       // 2 tab
                    current_unit_bf = 0;
                    remaining_no_units = NO_UNITS_LSTM;
                    while(remaining_no_units != 0) begin        // 3 tab
//                        repeat(3) begin
//                            @(negedge clk);
//                        end
                        r_valid = 0;
                        if (remaining_no_units  > MAX_NO_UNITS) begin                       // 4 tab
                            current_no_units    = MAX_NO_UNITS;
                            remaining_no_units  = remaining_no_units - MAX_NO_UNITS;
                            is_last_data_gate = 0;
                        end                                                                 // 4 tab
                        else begin                                                          // 4 tab
                            current_no_units    = remaining_no_units;
                            remaining_no_units  = 0;
                            if (current_feature == NO_FEATURES - 1 && current_timestep == 0) is_last_data_gate = 1;
                            else is_last_data_gate = 0;
                        end                                                                 // 4 tab
                        r_valid = 1;
                    /*          load input weight               */
                        // load input input weight
                        current_unit = current_unit_bf;
                        repeat(current_no_units) begin                                      // 4 tab
                            @(negedge clk);
                            data_in = in_weight_matrix[current_unit][current_feature];
                            current_unit = current_unit + 1;
                        end                                                                 // 4 tab
                        
                        //load input forget weight
                        current_unit = current_unit_bf;
                        repeat(current_no_units) begin                                      // 4 tab
                            @(negedge clk);
                            data_in = for_weight_matrix[current_unit][current_feature];
                            current_unit = current_unit + 1;
                        end                                                                 // 4 tab
                        
                        //load input cell weight
                        current_unit = current_unit_bf;
                        repeat(current_no_units) begin                                      // 4 tab
                            @(negedge clk);
                            data_in = cell_weight_matrix[current_unit][current_feature];
                            current_unit = current_unit + 1;
                        end                                                                 // 4 tab
                        
                        //load input output weight
                        current_unit = current_unit_bf;
                        repeat(current_no_units) begin                                      // 4 tab
                            @(negedge clk);
                            data_in = out_weight_matrix[current_unit][current_feature];
                            current_unit = current_unit + 1;
                        end                                                                 // 4 tab
                        
                    /*          load input               */
                    
                        @(negedge clk);
                        data_in = input_matrix[current_sample][current_timestep][current_feature];
                        
                    /*          load bias               */    
                        current_unit = current_unit_bf;
                        if (current_feature == 0) begin                                     // 4 tab
                            // load input bias
                            current_unit = current_unit_bf;
                            repeat(current_no_units) begin                                  // 5 tab
                                @(negedge clk);
                                data_in = bias_matrix[current_unit][0];
                                current_unit = current_unit + 1;
                            end                                                             // 5 tab
                            // load forget bias
                            current_unit = current_unit_bf;
                            repeat(current_no_units) begin                                  // 5 tab
                                @(negedge clk);
                                data_in = bias_matrix[current_unit][1];
                                current_unit = current_unit + 1;
                            end                                                             // 5 tab
                            // load cell bias
                            current_unit = current_unit_bf;
                            repeat(current_no_units) begin                                  // 5 tab
                                @(negedge clk);
                                data_in = bias_matrix[current_unit][2];
                                current_unit = current_unit + 1;
                            end                                                             // 5 tab
                            // load output bias
                            current_unit = current_unit_bf;
                            repeat(current_no_units) begin                                  // 5 tab
                                @(negedge clk);
                                data_in = bias_matrix[current_unit][3];
                                current_unit = current_unit + 1;
                            end                                                             // 5 tab
                        end    
//                        current_unit = current_unit + current_no_units;
                        
                        repeat(1) begin                                                     // 5 tab
                            @(negedge clk);
                            r_valid = 1'b0;
                            data_in = 32'd0;
                        end                                                                 // 5 tab
                        
                        if (current_feature != NO_FEATURES - 1 || remaining_no_units != 0 || current_timestep != 0) begin    // 5 tab
                            is_last_data_gate = 1'b0;
                            wait(r_data);
                            @(negedge clk);
                            r_valid = 1'b1;
                        end                                                                         // 5 tab        
                        
                        current_unit_bf = current_unit_bf + current_no_units;
                    end                                                                     // 3 tab
                    current_feature = current_feature + 1;
                end                                                                         // 2 tab
                
                // ------------------- Load hidden for LSTM --------------------------- //
                if (current_timestep != 0) begin                                            // 2 tab
                    // load hidden
                    current_ht = 0;
                    repeat((NO_UNITS_LSTM-1)/3 + 1) begin                                   // 3 tab
                        current_unit_bf = 0;
                        remaining_no_units = NO_UNITS_LSTM;
                        while(remaining_no_units != 0) begin                                // 4 tab
                            r_valid = 0;
                            if (remaining_no_units  > MAX_NO_UNITS) begin                       // 5 tab
                                current_no_units    = MAX_NO_UNITS;
                                remaining_no_units  = remaining_no_units - MAX_NO_UNITS;
                                is_last_data_gate = 0;
                            end                                                                 // 5 tab
                            else begin                                                          // 5 tab
                                current_no_units    = remaining_no_units;
                                remaining_no_units  = 0;
                                if (current_ht == (NO_UNITS_LSTM-1)/3) is_last_data_gate = 1;
                                else is_last_data_gate = 0; 
                            end                                                                 // 5 tab
                            r_valid = 1;
                            
                            // load r in weight
                            current_unit = current_unit_bf;
                            repeat(current_no_units) begin                                  // 5 tab
                                @(negedge clk);
                                data_in = r_in_weight_matrix[current_unit][current_ht];
                                current_unit = current_unit + 1;
                            end                                                             // 5 tab
                            
                            // load r forget weight
                            current_unit = current_unit_bf;
                            repeat(current_no_units) begin                                  // 5 tab
                                @(negedge clk);
                                data_in = r_for_weight_matrix[current_unit][current_ht];
                                current_unit = current_unit + 1;
                            end                                                             // 5 tab
                            
                            // load r cell weight
                            current_unit = current_unit_bf;
                            repeat(current_no_units) begin                                  // 5 tab
                                @(negedge clk);
                                data_in = r_cell_weight_matrix[current_unit][current_ht];
                                current_unit = current_unit + 1;
                            end                                                             // 5 tab
                            
                            // load r output weight
                            current_unit = current_unit_bf;
                            repeat(current_no_units) begin                                  // 5 tab
                                @(negedge clk);
                                data_in = r_out_weight_matrix[current_unit][current_ht];
                                current_unit = current_unit + 1;
                            end                                                             // 5 tab
                            
                            @(negedge clk);
                            if (current_ht == (NO_UNITS_LSTM-1)/3) begin                // 5 tab
                                if (NO_UNITS_LSTM % 3 == 0) data_in = {{8{1'b0}}, ht_matrix[current_sample][current_timestep-1][current_ht*3+2], ht_matrix[current_sample][current_timestep-1][current_ht*3 + 1], ht_matrix[current_sample][current_timestep-1][current_ht*3]};
                                else if (NO_UNITS_LSTM % 3 == 1) data_in = {{16{1'b0}}, ht_matrix[current_sample][current_timestep-1][current_ht*3+1], ht_matrix[current_sample][current_timestep-1][current_ht*3]};
                                else data_in = {{24{1'b0}}, ht_matrix[current_sample][current_timestep-1][current_ht*3]};
                            end                                                             // 5 tab
                            else data_in = {{8{1'b0}}, ht_matrix[current_sample][current_timestep-1][current_ht*3+2], ht_matrix[current_sample][current_timestep-1][current_ht*3 + 1], ht_matrix[current_sample][current_timestep-1][current_ht*3]};
                            
                            repeat(1) begin                                                     // 5 tab
                                @(negedge clk);
                                r_valid = 1'b0;
                                data_in = 32'd0;
                            end                                                                 // 5 tab
                            
                            if (current_ht != (NO_UNITS_LSTM-1)/3 || remaining_no_units != 0) begin         // 5 tab
                                wait(r_data);
                                @(negedge clk);
                                r_valid = 1'b1;                                                            // 5 tab
                            end
                                             
                            current_unit_bf = current_unit_bf + current_no_units;
                        end                                                                 // 4 tab
                        current_ht = current_ht + 1;
                    end                                                                     // 3 tab        
                end                                                                         // 2 tab
                else begin                                                                  // 2 tab
                    ;
                end                                                                         // 2 tab
                
                wait(w_valid);                                                                          
                while (w_valid) begin                                                       // 2 tab                            
                    for (current_ht = 0; current_ht < (NO_UNITS_LSTM-1)/4 + 1; current_ht = current_ht + 1) begin    // 3 tab
                        @(negedge clk);
                        ht_matrix[current_sample][current_timestep][current_ht*4]= out_data[7:0];
                        ht_matrix[current_sample][current_timestep][current_ht*4+1]= out_data[15:8];
                        ht_matrix[current_sample][current_timestep][current_ht*4+2]= out_data[23:16];
                        ht_matrix[current_sample][current_timestep][current_ht*4+3]= out_data[31:24];
//                        $display("SAMPLE = %0d, Timestep = %0d, Real result ht[%0d]= [%0h]", current_sample, current_timestep, {});
                    end                                                                                                 // 3 tab
                    @(negedge clk);
                end                                                                         // 2 tab
                current_timestep = current_timestep + 1;
            end                                                                             // 1 tab
            

            // ------------------- Load params for FC ------------------------------// 
//            ht_matrix [0:NO_SAMPLES-1][0:NO_TIMESTEPS-1][0:(NO_UNITS_LSTM-1)];
            last_fc_unit = 0;
            r_valid = 0; 
            remaining_no_units  = NO_UNITS_FC;
            index = 0;

            for (current_timestep = 0; current_timestep < NO_TIMESTEPS; current_timestep = current_timestep + 1) begin
                for (current_ht = 0; current_ht < NO_UNITS_LSTM; current_ht = current_ht + 1) begin
                    ht_flatten[current_sample][index] = ht_matrix[current_sample][current_timestep][current_ht];
                    index = index + 1;
                end
            end
            
            wait(r_data);
            @(negedge clk);
            current_ht = 0;
            index = 0;
            last_ht_unit = 0;
            is_last_data_gate = 0;
            repeat( (NO_TIMESTEPS*NO_UNITS_LSTM - 1)/3 + 1 ) begin                      // 1 tab
                remaining_no_units  = NO_UNITS_FC;
                last_ht_unit        = 0;
                while (remaining_no_units != 0) begin                                   // 2 tab
                    r_valid = 0; 
                    if (remaining_no_units  > MAX_NO_UNITS) begin                       // 3 tab
                        current_no_units    = MAX_NO_UNITS;
                        remaining_no_units  = remaining_no_units - MAX_NO_UNITS;
                    end                                                                 // 3 tab                
                    else begin                                                          // 3 tab
                        current_no_units    = remaining_no_units;
                        remaining_no_units  = 0;
                        if ( index == ((NO_TIMESTEPS*NO_UNITS_LSTM - 1)/3) ) is_last_data_gate = 1;
                        else is_last_data_gate = 0;
                    end                                                                 // 3 tab
                    r_valid = 1;
                    
                    current_class = 0;
                    repeat(current_no_units) begin                                      // 3 tab
                        @(negedge clk);
                        data_in = fc_weight[last_ht_unit+current_class][index];
                        current_class = current_class + 1;
                    end                                                                 // 3 tab
                    
                    repeat(1) begin                                                     // 3 tab
                        @(negedge clk);
                        if (index*3 == NO_TIMESTEPS*NO_UNITS_LSTM - 1) data_in = {{24{1'b0}}, ht_flatten[current_sample][index*3]};
                        else if (index*3 == NO_TIMESTEPS*NO_UNITS_LSTM - 2) data_in = {{16{1'b0}}, ht_flatten[current_sample][index*3+1], ht_flatten[current_sample][index*3]};
                        else data_in = {{8{1'b0}}, ht_flatten[current_sample][index*3+2], ht_flatten[current_sample][index*3+1], ht_flatten[current_sample][index*3]};                                                               
                    end                                                                 // 3 tab 
                    
                    if (index == 0) begin                                          // 3 tab
                        current_class = 0;
                        repeat(current_no_units) begin                                  // 4 tab
                            @(negedge clk);
                            data_in = fc_bias[last_ht_unit+current_class];
                            current_class = current_class + 1;
                        end                                                             // 4 tab
                    end                                                                 // 3 tab
                    
                    if (remaining_no_units == 0) index = index + 1;
                    else ;
                    
                    repeat(1) begin
                        @(negedge clk);
                        r_valid = 1'b0;
                        data_in = 32'd0;
                    end
                    
                    if (index < (NO_TIMESTEPS*NO_UNITS_LSTM - 1)/3 + 1 || remaining_no_units != 0 ) begin
                        is_last_data_gate = 1'b0;
                        wait(r_data);
                        @(negedge clk);
//                        r_valid = 1'b1;
                    end
                    else ;                                         
                end                                                                     // 2 tab
                last_ht_unit = last_ht_unit + current_no_units;
            end                                                                         // 1 tab
            wait(w_valid);                                                                          
            while (w_valid) begin                                                       // 1 tab                            
                for (index = 0; index < (NO_UNITS_FC-1)/4 + 1; index = index + 1) begin    // 2 tab
                    @(negedge clk);
                    if (index == (NO_UNITS_FC-1)/4) begin                                   // 3 tab
                        if (NO_UNITS_FC%4 == 0) begin                                       // 4 tab
                            fc_result[current_sample][index*4]      = out_data[7:0];
                            fc_result[current_sample][index*4+1]    = out_data[15:8];
                            fc_result[current_sample][index*4+2]    = out_data[23:16];
                            fc_result[current_sample][index*4+3]    = out_data[31:24];
                        end                                                                 // 4 tab
                        else if (NO_UNITS_FC%4 == 1) begin                                  // 4 tab
                            fc_result[current_sample][index*4]      = out_data[7:0];
                        end                                                                 // 4 tab
                        else if (NO_UNITS_FC%4 == 2) begin                                  // 4 tab
                            fc_result[current_sample][index*4]      = out_data[7:0];
                            fc_result[current_sample][index*4+1]    = out_data[15:8];
                        end                                                                 // 4 tab
                        else begin                                                          // 4 tab
                            fc_result[current_sample][index*4]      = out_data[7:0];
                            fc_result[current_sample][index*4+1]    = out_data[15:8];
                            fc_result[current_sample][index*4+2]    = out_data[23:16];
                        end                                                                 // 4 tab
                    end
                    else begin                                                              // 3 tab
                        fc_result[current_sample][index*4]      = out_data[7:0];
                        fc_result[current_sample][index*4+1]    = out_data[15:8];
                        fc_result[current_sample][index*4+2]    = out_data[23:16];
                        fc_result[current_sample][index*4+3]    = out_data[31:24];
                    end                                                                     // 3 tab
//                        $display("SAMPLE = %0d, Timestep = %0d, Real result ht[%0d]= [%0h]", current_sample, current_timestep, {});
                end                                                                                                 // 3 tab
                @(negedge clk);
            end                                                                         // 2 tab
            current_sample = current_sample + 1;
        end                 // end
           
        wait(t_valid);
        is_last_data_gate = 0;
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
endmodule

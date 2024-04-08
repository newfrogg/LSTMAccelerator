// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.1 (lin64) Build 3865809 Sun May  7 15:04:56 MDT 2023
// Date        : Mon Apr  8 14:22:12 2024
// Host        : vanloi-laptop running 64-bit Ubuntu 22.04.4 LTS
// Command     : write_verilog -mode funcsim -nolib -force -file
//               /home/vanloi/Documents/Loi_study/DATN/vivado_LSTM/lstm_accelerator/lstm_accelerator.sim/sim_1/synth/func/xsim/tb_controller_lstm_unit_func_synth.v
// Design      : controller
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z020clg400-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module MAC
   (rstn,
    \FSM_sequential_state_reg[0] ,
    \out_temp_reg[19]_0 ,
    clk_IBUF_BUFG,
    rstn_IBUF,
    \FSM_onehot_state_reg[2]_0 ,
    state,
    run_done_reg,
    Q,
    \weights_bf_2_reg[7]_0 ,
    \weights_bf_1_reg[7]_0 ,
    \weights_bf_0_reg[7]_0 ,
    \data_in_bf_2_reg[7]_0 ,
    \data_in_bf_1_reg[7]_0 ,
    \data_in_bf_0_reg[7]_0 );
  output rstn;
  output \FSM_sequential_state_reg[0] ;
  output [19:0]\out_temp_reg[19]_0 ;
  input clk_IBUF_BUFG;
  input rstn_IBUF;
  input \FSM_onehot_state_reg[2]_0 ;
  input [1:0]state;
  input run_done_reg;
  input [18:0]Q;
  input [7:0]\weights_bf_2_reg[7]_0 ;
  input [7:0]\weights_bf_1_reg[7]_0 ;
  input [7:0]\weights_bf_0_reg[7]_0 ;
  input [7:0]\data_in_bf_2_reg[7]_0 ;
  input [7:0]\data_in_bf_1_reg[7]_0 ;
  input [7:0]\data_in_bf_0_reg[7]_0 ;

  wire \FSM_onehot_state[0]_i_1_n_0 ;
  wire \FSM_onehot_state[1]_i_1_n_0 ;
  wire \FSM_onehot_state[2]_i_1_n_0 ;
  wire \FSM_onehot_state_reg[2]_0 ;
  wire \FSM_onehot_state_reg_n_0_[0] ;
  wire \FSM_sequential_state_reg[0] ;
  wire [18:0]Q;
  wire \_inferred__1/i__carry__0_n_0 ;
  wire \_inferred__1/i__carry__0_n_1 ;
  wire \_inferred__1/i__carry__0_n_2 ;
  wire \_inferred__1/i__carry__0_n_3 ;
  wire \_inferred__1/i__carry_n_0 ;
  wire \_inferred__1/i__carry_n_1 ;
  wire \_inferred__1/i__carry_n_2 ;
  wire \_inferred__1/i__carry_n_3 ;
  wire \_inferred__4/i__carry__0_n_0 ;
  wire \_inferred__4/i__carry__0_n_1 ;
  wire \_inferred__4/i__carry__0_n_2 ;
  wire \_inferred__4/i__carry__0_n_3 ;
  wire \_inferred__4/i__carry__0_n_4 ;
  wire \_inferred__4/i__carry__0_n_5 ;
  wire \_inferred__4/i__carry__0_n_6 ;
  wire \_inferred__4/i__carry__0_n_7 ;
  wire \_inferred__4/i__carry__1_n_7 ;
  wire \_inferred__4/i__carry_n_0 ;
  wire \_inferred__4/i__carry_n_1 ;
  wire \_inferred__4/i__carry_n_2 ;
  wire \_inferred__4/i__carry_n_3 ;
  wire \_inferred__4/i__carry_n_4 ;
  wire \_inferred__4/i__carry_n_5 ;
  wire \_inferred__4/i__carry_n_6 ;
  wire \_inferred__4/i__carry_n_7 ;
  wire \_inferred__6/i__carry__0_n_0 ;
  wire \_inferred__6/i__carry__0_n_1 ;
  wire \_inferred__6/i__carry__0_n_2 ;
  wire \_inferred__6/i__carry__0_n_3 ;
  wire \_inferred__6/i__carry__0_n_4 ;
  wire \_inferred__6/i__carry__0_n_5 ;
  wire \_inferred__6/i__carry__0_n_6 ;
  wire \_inferred__6/i__carry__0_n_7 ;
  wire \_inferred__6/i__carry_n_0 ;
  wire \_inferred__6/i__carry_n_1 ;
  wire \_inferred__6/i__carry_n_2 ;
  wire \_inferred__6/i__carry_n_3 ;
  wire \_inferred__6/i__carry_n_4 ;
  wire \_inferred__6/i__carry_n_5 ;
  wire \_inferred__6/i__carry_n_6 ;
  wire \_inferred__6/i__carry_n_7 ;
  wire \_inferred__8/i__carry__0_n_0 ;
  wire \_inferred__8/i__carry__0_n_1 ;
  wire \_inferred__8/i__carry__0_n_2 ;
  wire \_inferred__8/i__carry__0_n_3 ;
  wire \_inferred__8/i__carry__0_n_4 ;
  wire \_inferred__8/i__carry__0_n_5 ;
  wire \_inferred__8/i__carry__0_n_6 ;
  wire \_inferred__8/i__carry__0_n_7 ;
  wire \_inferred__8/i__carry__1_n_3 ;
  wire \_inferred__8/i__carry__1_n_6 ;
  wire \_inferred__8/i__carry__1_n_7 ;
  wire \_inferred__8/i__carry_n_0 ;
  wire \_inferred__8/i__carry_n_1 ;
  wire \_inferred__8/i__carry_n_2 ;
  wire \_inferred__8/i__carry_n_3 ;
  wire \_inferred__8/i__carry_n_4 ;
  wire \_inferred__8/i__carry_n_5 ;
  wire \_inferred__8/i__carry_n_6 ;
  wire \_inferred__8/i__carry_n_7 ;
  wire \accu_bf[6]__0_carry__0_i_1_n_0 ;
  wire \accu_bf[6]__0_carry__0_i_2_n_0 ;
  wire \accu_bf[6]__0_carry__0_i_3_n_0 ;
  wire \accu_bf[6]__0_carry__0_i_4_n_0 ;
  wire \accu_bf[6]__0_carry__0_i_5_n_0 ;
  wire \accu_bf[6]__0_carry__0_i_6_n_0 ;
  wire \accu_bf[6]__0_carry__0_i_7_n_0 ;
  wire \accu_bf[6]__0_carry__0_i_8_n_0 ;
  wire \accu_bf[6]__0_carry__0_n_0 ;
  wire \accu_bf[6]__0_carry__0_n_1 ;
  wire \accu_bf[6]__0_carry__0_n_2 ;
  wire \accu_bf[6]__0_carry__0_n_3 ;
  wire \accu_bf[6]__0_carry__0_n_4 ;
  wire \accu_bf[6]__0_carry__0_n_5 ;
  wire \accu_bf[6]__0_carry__0_n_6 ;
  wire \accu_bf[6]__0_carry__0_n_7 ;
  wire \accu_bf[6]__0_carry__1_i_1_n_0 ;
  wire \accu_bf[6]__0_carry__1_i_2_n_0 ;
  wire \accu_bf[6]__0_carry__1_i_3_n_0 ;
  wire \accu_bf[6]__0_carry__1_n_3 ;
  wire \accu_bf[6]__0_carry__1_n_6 ;
  wire \accu_bf[6]__0_carry__1_n_7 ;
  wire \accu_bf[6]__0_carry_i_1_n_0 ;
  wire \accu_bf[6]__0_carry_i_2_n_0 ;
  wire \accu_bf[6]__0_carry_i_3_n_0 ;
  wire \accu_bf[6]__0_carry_i_4_n_0 ;
  wire \accu_bf[6]__0_carry_i_5_n_0 ;
  wire \accu_bf[6]__0_carry_i_6_n_0 ;
  wire \accu_bf[6]__0_carry_i_7_n_0 ;
  wire \accu_bf[6]__0_carry_n_0 ;
  wire \accu_bf[6]__0_carry_n_1 ;
  wire \accu_bf[6]__0_carry_n_2 ;
  wire \accu_bf[6]__0_carry_n_3 ;
  wire \accu_bf[6]__0_carry_n_4 ;
  wire \accu_bf[6]__0_carry_n_5 ;
  wire \accu_bf[6]__0_carry_n_6 ;
  wire \accu_bf[6]__0_carry_n_7 ;
  wire \accu_bf[6]__28_carry__0_i_1_n_0 ;
  wire \accu_bf[6]__28_carry__0_i_2_n_0 ;
  wire \accu_bf[6]__28_carry__0_i_3_n_0 ;
  wire \accu_bf[6]__28_carry__0_i_4_n_0 ;
  wire \accu_bf[6]__28_carry__0_i_5_n_0 ;
  wire \accu_bf[6]__28_carry__0_i_6_n_0 ;
  wire \accu_bf[6]__28_carry__0_i_7_n_0 ;
  wire \accu_bf[6]__28_carry__0_i_8_n_0 ;
  wire \accu_bf[6]__28_carry__0_n_0 ;
  wire \accu_bf[6]__28_carry__0_n_1 ;
  wire \accu_bf[6]__28_carry__0_n_2 ;
  wire \accu_bf[6]__28_carry__0_n_3 ;
  wire \accu_bf[6]__28_carry__0_n_4 ;
  wire \accu_bf[6]__28_carry__0_n_5 ;
  wire \accu_bf[6]__28_carry__0_n_6 ;
  wire \accu_bf[6]__28_carry__0_n_7 ;
  wire \accu_bf[6]__28_carry__1_i_1_n_0 ;
  wire \accu_bf[6]__28_carry__1_i_2_n_0 ;
  wire \accu_bf[6]__28_carry__1_i_3_n_0 ;
  wire \accu_bf[6]__28_carry__1_n_3 ;
  wire \accu_bf[6]__28_carry__1_n_6 ;
  wire \accu_bf[6]__28_carry__1_n_7 ;
  wire \accu_bf[6]__28_carry_i_1_n_0 ;
  wire \accu_bf[6]__28_carry_i_2_n_0 ;
  wire \accu_bf[6]__28_carry_i_3_n_0 ;
  wire \accu_bf[6]__28_carry_i_4_n_0 ;
  wire \accu_bf[6]__28_carry_i_5_n_0 ;
  wire \accu_bf[6]__28_carry_i_6_n_0 ;
  wire \accu_bf[6]__28_carry_i_7_n_0 ;
  wire \accu_bf[6]__28_carry_n_0 ;
  wire \accu_bf[6]__28_carry_n_1 ;
  wire \accu_bf[6]__28_carry_n_2 ;
  wire \accu_bf[6]__28_carry_n_3 ;
  wire \accu_bf[6]__28_carry_n_4 ;
  wire \accu_bf[6]__28_carry_n_5 ;
  wire \accu_bf[6]__28_carry_n_6 ;
  wire \accu_bf[6]__28_carry_n_7 ;
  wire \accu_bf[6]__58_carry__0_i_10_n_0 ;
  wire \accu_bf[6]__58_carry__0_i_11_n_0 ;
  wire \accu_bf[6]__58_carry__0_i_12_n_0 ;
  wire \accu_bf[6]__58_carry__0_i_1_n_0 ;
  wire \accu_bf[6]__58_carry__0_i_2_n_0 ;
  wire \accu_bf[6]__58_carry__0_i_3_n_0 ;
  wire \accu_bf[6]__58_carry__0_i_4_n_0 ;
  wire \accu_bf[6]__58_carry__0_i_5_n_0 ;
  wire \accu_bf[6]__58_carry__0_i_6_n_0 ;
  wire \accu_bf[6]__58_carry__0_i_7_n_0 ;
  wire \accu_bf[6]__58_carry__0_i_8_n_0 ;
  wire \accu_bf[6]__58_carry__0_i_9_n_0 ;
  wire \accu_bf[6]__58_carry__0_n_0 ;
  wire \accu_bf[6]__58_carry__0_n_1 ;
  wire \accu_bf[6]__58_carry__0_n_2 ;
  wire \accu_bf[6]__58_carry__0_n_3 ;
  wire \accu_bf[6]__58_carry__0_n_4 ;
  wire \accu_bf[6]__58_carry__0_n_5 ;
  wire \accu_bf[6]__58_carry__0_n_6 ;
  wire \accu_bf[6]__58_carry__0_n_7 ;
  wire \accu_bf[6]__58_carry__1_i_1_n_0 ;
  wire \accu_bf[6]__58_carry__1_i_2_n_0 ;
  wire \accu_bf[6]__58_carry__1_i_3_n_0 ;
  wire \accu_bf[6]__58_carry__1_i_4_n_0 ;
  wire \accu_bf[6]__58_carry__1_i_5_n_0 ;
  wire \accu_bf[6]__58_carry__1_i_6_n_0 ;
  wire \accu_bf[6]__58_carry__1_n_3 ;
  wire \accu_bf[6]__58_carry__1_n_6 ;
  wire \accu_bf[6]__58_carry__1_n_7 ;
  wire \accu_bf[6]__58_carry_i_1_n_0 ;
  wire \accu_bf[6]__58_carry_i_2_n_0 ;
  wire \accu_bf[6]__58_carry_i_3_n_0 ;
  wire \accu_bf[6]__58_carry_i_4_n_0 ;
  wire \accu_bf[6]__58_carry_i_5_n_0 ;
  wire \accu_bf[6]__58_carry_i_6_n_0 ;
  wire \accu_bf[6]__58_carry_i_7_n_0 ;
  wire \accu_bf[6]__58_carry_i_8_n_0 ;
  wire \accu_bf[6]__58_carry_i_9_n_0 ;
  wire \accu_bf[6]__58_carry_n_0 ;
  wire \accu_bf[6]__58_carry_n_1 ;
  wire \accu_bf[6]__58_carry_n_2 ;
  wire \accu_bf[6]__58_carry_n_3 ;
  wire \accu_bf[6]__58_carry_n_4 ;
  wire \accu_bf[6]__58_carry_n_5 ;
  wire \accu_bf[6]__58_carry_n_6 ;
  wire \accu_bf[6]__58_carry_n_7 ;
  wire clk_IBUF_BUFG;
  wire [2:2]data0;
  wire [2:1]data1;
  wire [2:1]data2;
  wire [2:1]data3;
  wire [2:1]data4;
  wire [2:1]data5;
  wire [2:1]data6;
  wire [7:0]data_in_bf_0;
  wire [7:0]\data_in_bf_0_reg[7]_0 ;
  wire [7:0]data_in_bf_1;
  wire [7:0]\data_in_bf_1_reg[7]_0 ;
  wire [7:0]data_in_bf_2;
  wire [7:0]\data_in_bf_2_reg[7]_0 ;
  wire done_i_1_n_0;
  wire flag_accu;
  wire flag_accu_i_1_n_0;
  wire flag_accu_i_2_n_0;
  wire flag_accu_reg_n_0;
  wire i__carry__0_i_1__0_n_0;
  wire i__carry__0_i_1__1_n_0;
  wire i__carry__0_i_1__2_n_0;
  wire i__carry__0_i_1_n_0;
  wire i__carry__0_i_2__0_n_0;
  wire i__carry__0_i_2__1_n_0;
  wire i__carry__0_i_2__2_n_0;
  wire i__carry__0_i_2_n_0;
  wire i__carry__0_i_3__0_n_0;
  wire i__carry__0_i_3__1_n_0;
  wire i__carry__0_i_3__2_n_0;
  wire i__carry__0_i_3_n_0;
  wire i__carry__0_i_4__0_n_0;
  wire i__carry__0_i_4__1_n_0;
  wire i__carry__0_i_4__2_n_0;
  wire i__carry__0_i_4_n_0;
  wire i__carry__0_i_5__0_n_0;
  wire i__carry__0_i_5__1_n_0;
  wire i__carry__0_i_5_n_0;
  wire i__carry__1_i_1_n_3;
  wire i__carry__1_i_2_n_0;
  wire i__carry_i_1__0_n_0;
  wire i__carry_i_1__1_n_0;
  wire i__carry_i_1__2_n_0;
  wire i__carry_i_1_n_0;
  wire i__carry_i_2__0_n_0;
  wire i__carry_i_2__1_n_0;
  wire i__carry_i_2__2_n_0;
  wire i__carry_i_2_n_0;
  wire i__carry_i_3__0_n_0;
  wire i__carry_i_3__1_n_0;
  wire i__carry_i_3__2_n_0;
  wire i__carry_i_3_n_0;
  wire i__carry_i_4__0_n_0;
  wire i__carry_i_4__1_n_0;
  wire i__carry_i_4__2_n_0;
  wire i__carry_i_4_n_0;
  wire \index[0]_i_1_n_0 ;
  wire \index[1]_i_1_n_0 ;
  wire \index[2]_i_1_n_0 ;
  wire \index[2]_i_2_n_0 ;
  wire \index_reg_n_0_[0] ;
  wire \index_reg_n_0_[1] ;
  wire \index_reg_n_0_[2] ;
  wire mac_done;
  wire out0_carry__0_i_1_n_0;
  wire out0_carry__0_i_2_n_0;
  wire out0_carry__0_i_3_n_0;
  wire out0_carry__0_i_4_n_0;
  wire out0_carry__0_n_0;
  wire out0_carry__0_n_1;
  wire out0_carry__0_n_2;
  wire out0_carry__0_n_3;
  wire out0_carry__0_n_4;
  wire out0_carry__0_n_5;
  wire out0_carry__0_n_6;
  wire out0_carry__0_n_7;
  wire out0_carry__1_i_1_n_0;
  wire out0_carry__1_i_2_n_0;
  wire out0_carry__1_i_3_n_0;
  wire out0_carry__1_i_4_n_0;
  wire out0_carry__1_i_5_n_0;
  wire out0_carry__1_n_0;
  wire out0_carry__1_n_1;
  wire out0_carry__1_n_2;
  wire out0_carry__1_n_3;
  wire out0_carry__1_n_4;
  wire out0_carry__1_n_5;
  wire out0_carry__1_n_6;
  wire out0_carry__1_n_7;
  wire out0_carry__2_i_1_n_0;
  wire out0_carry__2_i_2_n_0;
  wire out0_carry__2_i_3_n_0;
  wire out0_carry__2_i_4_n_0;
  wire out0_carry__2_n_0;
  wire out0_carry__2_n_1;
  wire out0_carry__2_n_2;
  wire out0_carry__2_n_3;
  wire out0_carry__2_n_4;
  wire out0_carry__2_n_5;
  wire out0_carry__2_n_6;
  wire out0_carry__2_n_7;
  wire out0_carry__3_i_1_n_0;
  wire out0_carry__3_i_2_n_0;
  wire out0_carry__3_i_3_n_0;
  wire out0_carry__3_n_1;
  wire out0_carry__3_n_2;
  wire out0_carry__3_n_3;
  wire out0_carry__3_n_4;
  wire out0_carry__3_n_5;
  wire out0_carry__3_n_6;
  wire out0_carry__3_n_7;
  wire out0_carry_i_1_n_0;
  wire out0_carry_i_2_n_0;
  wire out0_carry_i_3_n_0;
  wire out0_carry_i_4_n_0;
  wire out0_carry_n_0;
  wire out0_carry_n_1;
  wire out0_carry_n_2;
  wire out0_carry_n_3;
  wire out0_carry_n_4;
  wire out0_carry_n_5;
  wire out0_carry_n_6;
  wire out0_carry_n_7;
  wire out_temp;
  wire [19:0]\out_temp_reg[19]_0 ;
  wire [7:0]p_0_in;
  wire [8:8]p_0_in__0;
  wire [18:0]prev_sum_bf;
  wire rstn;
  wire rstn_IBUF;
  wire run_done_reg;
  wire [2:0]sel0;
  wire [1:0]state;
  wire [9:0]sum_arr_bf;
  wire \sum_arr_bf[0][9]_i_1_n_0 ;
  wire \sum_arr_bf[1][9]_i_1_n_0 ;
  wire \sum_arr_bf[2][9]_i_1_n_0 ;
  wire \sum_arr_bf[3][9]_i_1_n_0 ;
  wire \sum_arr_bf[4][9]_i_1_n_0 ;
  wire \sum_arr_bf[5][9]_i_1_n_0 ;
  wire \sum_arr_bf[6][9]_i_1_n_0 ;
  wire \sum_arr_bf[7][0]_i_4_n_0 ;
  wire \sum_arr_bf[7][0]_i_5_n_0 ;
  wire \sum_arr_bf[7][0]_i_6_n_0 ;
  wire \sum_arr_bf[7][0]_i_7_n_0 ;
  wire \sum_arr_bf[7][1]_i_5_n_0 ;
  wire \sum_arr_bf[7][2]_i_11_n_0 ;
  wire \sum_arr_bf[7][2]_i_12_n_0 ;
  wire \sum_arr_bf[7][2]_i_13_n_0 ;
  wire \sum_arr_bf[7][2]_i_14_n_0 ;
  wire \sum_arr_bf[7][3]_i_10_n_0 ;
  wire \sum_arr_bf[7][3]_i_11_n_0 ;
  wire \sum_arr_bf[7][3]_i_12_n_0 ;
  wire \sum_arr_bf[7][3]_i_13_n_0 ;
  wire \sum_arr_bf[7][3]_i_14_n_0 ;
  wire \sum_arr_bf[7][3]_i_4_n_0 ;
  wire \sum_arr_bf[7][3]_i_5_n_0 ;
  wire \sum_arr_bf[7][3]_i_6_n_0 ;
  wire \sum_arr_bf[7][3]_i_7_n_0 ;
  wire \sum_arr_bf[7][3]_i_8_n_0 ;
  wire \sum_arr_bf[7][3]_i_9_n_0 ;
  wire \sum_arr_bf[7][4]_i_10_n_0 ;
  wire \sum_arr_bf[7][4]_i_11_n_0 ;
  wire \sum_arr_bf[7][4]_i_12_n_0 ;
  wire \sum_arr_bf[7][4]_i_13_n_0 ;
  wire \sum_arr_bf[7][4]_i_14_n_0 ;
  wire \sum_arr_bf[7][4]_i_4_n_0 ;
  wire \sum_arr_bf[7][4]_i_5_n_0 ;
  wire \sum_arr_bf[7][4]_i_6_n_0 ;
  wire \sum_arr_bf[7][4]_i_7_n_0 ;
  wire \sum_arr_bf[7][4]_i_8_n_0 ;
  wire \sum_arr_bf[7][4]_i_9_n_0 ;
  wire \sum_arr_bf[7][5]_i_10_n_0 ;
  wire \sum_arr_bf[7][5]_i_11_n_0 ;
  wire \sum_arr_bf[7][5]_i_12_n_0 ;
  wire \sum_arr_bf[7][5]_i_13_n_0 ;
  wire \sum_arr_bf[7][5]_i_14_n_0 ;
  wire \sum_arr_bf[7][5]_i_4_n_0 ;
  wire \sum_arr_bf[7][5]_i_5_n_0 ;
  wire \sum_arr_bf[7][5]_i_6_n_0 ;
  wire \sum_arr_bf[7][5]_i_7_n_0 ;
  wire \sum_arr_bf[7][5]_i_8_n_0 ;
  wire \sum_arr_bf[7][5]_i_9_n_0 ;
  wire \sum_arr_bf[7][6]_i_10_n_0 ;
  wire \sum_arr_bf[7][6]_i_11_n_0 ;
  wire \sum_arr_bf[7][6]_i_12_n_0 ;
  wire \sum_arr_bf[7][6]_i_13_n_0 ;
  wire \sum_arr_bf[7][6]_i_14_n_0 ;
  wire \sum_arr_bf[7][6]_i_4_n_0 ;
  wire \sum_arr_bf[7][6]_i_5_n_0 ;
  wire \sum_arr_bf[7][6]_i_6_n_0 ;
  wire \sum_arr_bf[7][6]_i_7_n_0 ;
  wire \sum_arr_bf[7][6]_i_8_n_0 ;
  wire \sum_arr_bf[7][6]_i_9_n_0 ;
  wire \sum_arr_bf[7][7]_i_10_n_0 ;
  wire \sum_arr_bf[7][7]_i_11_n_0 ;
  wire \sum_arr_bf[7][7]_i_12_n_0 ;
  wire \sum_arr_bf[7][7]_i_13_n_0 ;
  wire \sum_arr_bf[7][7]_i_14_n_0 ;
  wire \sum_arr_bf[7][7]_i_4_n_0 ;
  wire \sum_arr_bf[7][7]_i_5_n_0 ;
  wire \sum_arr_bf[7][7]_i_6_n_0 ;
  wire \sum_arr_bf[7][7]_i_7_n_0 ;
  wire \sum_arr_bf[7][7]_i_8_n_0 ;
  wire \sum_arr_bf[7][7]_i_9_n_0 ;
  wire \sum_arr_bf[7][8]_i_10_n_0 ;
  wire \sum_arr_bf[7][8]_i_11_n_0 ;
  wire \sum_arr_bf[7][8]_i_12_n_0 ;
  wire \sum_arr_bf[7][8]_i_13_n_0 ;
  wire \sum_arr_bf[7][8]_i_14_n_0 ;
  wire \sum_arr_bf[7][8]_i_4_n_0 ;
  wire \sum_arr_bf[7][8]_i_5_n_0 ;
  wire \sum_arr_bf[7][8]_i_6_n_0 ;
  wire \sum_arr_bf[7][8]_i_7_n_0 ;
  wire \sum_arr_bf[7][8]_i_8_n_0 ;
  wire \sum_arr_bf[7][8]_i_9_n_0 ;
  wire \sum_arr_bf[7][9]_i_10_n_0 ;
  wire \sum_arr_bf[7][9]_i_11_n_0 ;
  wire \sum_arr_bf[7][9]_i_12_n_0 ;
  wire \sum_arr_bf[7][9]_i_13_n_0 ;
  wire \sum_arr_bf[7][9]_i_14_n_0 ;
  wire \sum_arr_bf[7][9]_i_15_n_0 ;
  wire \sum_arr_bf[7][9]_i_16_n_0 ;
  wire \sum_arr_bf[7][9]_i_17_n_0 ;
  wire \sum_arr_bf[7][9]_i_18_n_0 ;
  wire \sum_arr_bf[7][9]_i_19_n_0 ;
  wire \sum_arr_bf[7][9]_i_1_n_0 ;
  wire \sum_arr_bf[7][9]_i_20_n_0 ;
  wire \sum_arr_bf[7][9]_i_21_n_0 ;
  wire \sum_arr_bf[7][9]_i_22_n_0 ;
  wire \sum_arr_bf[7][9]_i_23_n_0 ;
  wire \sum_arr_bf[7][9]_i_24_n_0 ;
  wire \sum_arr_bf[7][9]_i_25_n_0 ;
  wire \sum_arr_bf[7][9]_i_6_n_0 ;
  wire \sum_arr_bf[7][9]_i_7_n_0 ;
  wire \sum_arr_bf[7][9]_i_8_n_0 ;
  wire \sum_arr_bf[7][9]_i_9_n_0 ;
  wire [9:0]\sum_arr_bf_reg[0] ;
  wire [9:0]\sum_arr_bf_reg[1] ;
  wire [9:0]\sum_arr_bf_reg[2] ;
  wire [9:0]\sum_arr_bf_reg[3] ;
  wire [9:0]\sum_arr_bf_reg[4] ;
  wire [9:0]\sum_arr_bf_reg[5] ;
  wire [9:0]\sum_arr_bf_reg[6] ;
  wire [9:0]\sum_arr_bf_reg[7] ;
  wire \sum_arr_bf_reg[7][0]_i_2_n_0 ;
  wire \sum_arr_bf_reg[7][0]_i_3_n_0 ;
  wire \sum_arr_bf_reg[7][1]_i_2_n_0 ;
  wire \sum_arr_bf_reg[7][1]_i_3_n_0 ;
  wire \sum_arr_bf_reg[7][1]_i_4_n_0 ;
  wire \sum_arr_bf_reg[7][2]_i_2_n_0 ;
  wire \sum_arr_bf_reg[7][2]_i_3_n_0 ;
  wire \sum_arr_bf_reg[7][2]_i_7_n_0 ;
  wire \sum_arr_bf_reg[7][2]_i_8_n_0 ;
  wire \sum_arr_bf_reg[7][3]_i_2_n_0 ;
  wire \sum_arr_bf_reg[7][3]_i_3_n_0 ;
  wire \sum_arr_bf_reg[7][4]_i_2_n_0 ;
  wire \sum_arr_bf_reg[7][4]_i_3_n_0 ;
  wire \sum_arr_bf_reg[7][5]_i_2_n_0 ;
  wire \sum_arr_bf_reg[7][5]_i_3_n_0 ;
  wire \sum_arr_bf_reg[7][6]_i_2_n_0 ;
  wire \sum_arr_bf_reg[7][6]_i_3_n_0 ;
  wire \sum_arr_bf_reg[7][7]_i_2_n_0 ;
  wire \sum_arr_bf_reg[7][7]_i_3_n_0 ;
  wire \sum_arr_bf_reg[7][8]_i_2_n_0 ;
  wire \sum_arr_bf_reg[7][8]_i_3_n_0 ;
  wire \sum_arr_bf_reg[7][9]_i_4_n_0 ;
  wire \sum_arr_bf_reg[7][9]_i_5_n_0 ;
  wire [7:0]weights_bf_0;
  wire weights_bf_0_0;
  wire [7:0]\weights_bf_0_reg[7]_0 ;
  wire [7:0]weights_bf_1;
  wire [7:0]\weights_bf_1_reg[7]_0 ;
  wire [7:0]weights_bf_2;
  wire [7:0]\weights_bf_2_reg[7]_0 ;
  wire [3:0]\NLW__inferred__1/i__carry__1_CO_UNCONNECTED ;
  wire [3:1]\NLW__inferred__1/i__carry__1_O_UNCONNECTED ;
  wire [3:0]\NLW__inferred__4/i__carry__1_CO_UNCONNECTED ;
  wire [3:1]\NLW__inferred__4/i__carry__1_O_UNCONNECTED ;
  wire [3:1]\NLW__inferred__8/i__carry__1_CO_UNCONNECTED ;
  wire [3:2]\NLW__inferred__8/i__carry__1_O_UNCONNECTED ;
  wire [3:1]\NLW_accu_bf[6]__0_carry__1_CO_UNCONNECTED ;
  wire [3:2]\NLW_accu_bf[6]__0_carry__1_O_UNCONNECTED ;
  wire [3:1]\NLW_accu_bf[6]__28_carry__1_CO_UNCONNECTED ;
  wire [3:2]\NLW_accu_bf[6]__28_carry__1_O_UNCONNECTED ;
  wire [3:1]\NLW_accu_bf[6]__58_carry__1_CO_UNCONNECTED ;
  wire [3:2]\NLW_accu_bf[6]__58_carry__1_O_UNCONNECTED ;
  wire [3:1]NLW_i__carry__1_i_1_CO_UNCONNECTED;
  wire [3:0]NLW_i__carry__1_i_1_O_UNCONNECTED;
  wire [3:3]NLW_out0_carry__3_CO_UNCONNECTED;

  LUT6 #(
    .INIT(64'hAAAAEAEEEAEEEAEE)) 
    \FSM_onehot_state[0]_i_1 
       (.I0(out_temp),
        .I1(\FSM_onehot_state_reg_n_0_[0] ),
        .I2(mac_done),
        .I3(\FSM_onehot_state_reg[2]_0 ),
        .I4(flag_accu),
        .I5(flag_accu_reg_n_0),
        .O(\FSM_onehot_state[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hCCCC8C88DDDD8C88)) 
    \FSM_onehot_state[1]_i_1 
       (.I0(out_temp),
        .I1(\FSM_onehot_state_reg_n_0_[0] ),
        .I2(mac_done),
        .I3(\FSM_onehot_state_reg[2]_0 ),
        .I4(flag_accu),
        .I5(flag_accu_reg_n_0),
        .O(\FSM_onehot_state[1]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFF0000AEAA0000)) 
    \FSM_onehot_state[2]_i_1 
       (.I0(out_temp),
        .I1(\FSM_onehot_state_reg_n_0_[0] ),
        .I2(mac_done),
        .I3(\FSM_onehot_state_reg[2]_0 ),
        .I4(flag_accu),
        .I5(flag_accu_reg_n_0),
        .O(\FSM_onehot_state[2]_i_1_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \FSM_onehot_state[2]_i_2 
       (.I0(rstn_IBUF),
        .O(rstn));
  (* FSM_ENCODED_STATES = "STATE_IDLE:001,STATE_MULT:010,STATE_ACCM:100," *) 
  FDPE #(
    .INIT(1'b1)) 
    \FSM_onehot_state_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\FSM_onehot_state[0]_i_1_n_0 ),
        .PRE(rstn),
        .Q(\FSM_onehot_state_reg_n_0_[0] ));
  (* FSM_ENCODED_STATES = "STATE_IDLE:001,STATE_MULT:010,STATE_ACCM:100," *) 
  FDCE #(
    .INIT(1'b0)) 
    \FSM_onehot_state_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(rstn),
        .D(\FSM_onehot_state[1]_i_1_n_0 ),
        .Q(flag_accu));
  (* FSM_ENCODED_STATES = "STATE_IDLE:001,STATE_MULT:010,STATE_ACCM:100," *) 
  FDCE #(
    .INIT(1'b0)) 
    \FSM_onehot_state_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(rstn),
        .D(\FSM_onehot_state[2]_i_1_n_0 ),
        .Q(out_temp));
  CARRY4 \_inferred__1/i__carry 
       (.CI(1'b0),
        .CO({\_inferred__1/i__carry_n_0 ,\_inferred__1/i__carry_n_1 ,\_inferred__1/i__carry_n_2 ,\_inferred__1/i__carry_n_3 }),
        .CYINIT(1'b0),
        .DI(weights_bf_1[3:0]),
        .O(p_0_in[3:0]),
        .S({i__carry_i_1_n_0,i__carry_i_2_n_0,i__carry_i_3_n_0,i__carry_i_4_n_0}));
  CARRY4 \_inferred__1/i__carry__0 
       (.CI(\_inferred__1/i__carry_n_0 ),
        .CO({\_inferred__1/i__carry__0_n_0 ,\_inferred__1/i__carry__0_n_1 ,\_inferred__1/i__carry__0_n_2 ,\_inferred__1/i__carry__0_n_3 }),
        .CYINIT(1'b0),
        .DI({i__carry__0_i_1_n_0,weights_bf_1[6:4]}),
        .O(p_0_in[7:4]),
        .S({i__carry__0_i_2__0_n_0,i__carry__0_i_3_n_0,i__carry__0_i_4_n_0,i__carry__0_i_5_n_0}));
  CARRY4 \_inferred__1/i__carry__1 
       (.CI(\_inferred__1/i__carry__0_n_0 ),
        .CO(\NLW__inferred__1/i__carry__1_CO_UNCONNECTED [3:0]),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\NLW__inferred__1/i__carry__1_O_UNCONNECTED [3:1],p_0_in__0}),
        .S({1'b0,1'b0,1'b0,1'b1}));
  CARRY4 \_inferred__4/i__carry 
       (.CI(1'b0),
        .CO({\_inferred__4/i__carry_n_0 ,\_inferred__4/i__carry_n_1 ,\_inferred__4/i__carry_n_2 ,\_inferred__4/i__carry_n_3 }),
        .CYINIT(1'b0),
        .DI(weights_bf_0[3:0]),
        .O({\_inferred__4/i__carry_n_4 ,\_inferred__4/i__carry_n_5 ,\_inferred__4/i__carry_n_6 ,\_inferred__4/i__carry_n_7 }),
        .S({i__carry_i_1__0_n_0,i__carry_i_2__0_n_0,i__carry_i_3__0_n_0,i__carry_i_4__0_n_0}));
  CARRY4 \_inferred__4/i__carry__0 
       (.CI(\_inferred__4/i__carry_n_0 ),
        .CO({\_inferred__4/i__carry__0_n_0 ,\_inferred__4/i__carry__0_n_1 ,\_inferred__4/i__carry__0_n_2 ,\_inferred__4/i__carry__0_n_3 }),
        .CYINIT(1'b0),
        .DI({i__carry__0_i_1__1_n_0,weights_bf_0[6:4]}),
        .O({\_inferred__4/i__carry__0_n_4 ,\_inferred__4/i__carry__0_n_5 ,\_inferred__4/i__carry__0_n_6 ,\_inferred__4/i__carry__0_n_7 }),
        .S({i__carry__0_i_2__2_n_0,i__carry__0_i_3__0_n_0,i__carry__0_i_4__0_n_0,i__carry__0_i_5__0_n_0}));
  CARRY4 \_inferred__4/i__carry__1 
       (.CI(\_inferred__4/i__carry__0_n_0 ),
        .CO(\NLW__inferred__4/i__carry__1_CO_UNCONNECTED [3:0]),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\NLW__inferred__4/i__carry__1_O_UNCONNECTED [3:1],\_inferred__4/i__carry__1_n_7 }),
        .S({1'b0,1'b0,1'b0,1'b1}));
  CARRY4 \_inferred__6/i__carry 
       (.CI(1'b0),
        .CO({\_inferred__6/i__carry_n_0 ,\_inferred__6/i__carry_n_1 ,\_inferred__6/i__carry_n_2 ,\_inferred__6/i__carry_n_3 }),
        .CYINIT(1'b0),
        .DI(weights_bf_0[3:0]),
        .O({\_inferred__6/i__carry_n_4 ,\_inferred__6/i__carry_n_5 ,\_inferred__6/i__carry_n_6 ,\_inferred__6/i__carry_n_7 }),
        .S({i__carry_i_1__1_n_0,i__carry_i_2__1_n_0,i__carry_i_3__1_n_0,i__carry_i_4__1_n_0}));
  CARRY4 \_inferred__6/i__carry__0 
       (.CI(\_inferred__6/i__carry_n_0 ),
        .CO({\_inferred__6/i__carry__0_n_0 ,\_inferred__6/i__carry__0_n_1 ,\_inferred__6/i__carry__0_n_2 ,\_inferred__6/i__carry__0_n_3 }),
        .CYINIT(1'b0),
        .DI({i__carry__0_i_1__0_n_0,weights_bf_0[6:4]}),
        .O({\_inferred__6/i__carry__0_n_4 ,\_inferred__6/i__carry__0_n_5 ,\_inferred__6/i__carry__0_n_6 ,\_inferred__6/i__carry__0_n_7 }),
        .S({i__carry__0_i_2__1_n_0,i__carry__0_i_3__1_n_0,i__carry__0_i_4__1_n_0,i__carry__0_i_5__1_n_0}));
  CARRY4 \_inferred__8/i__carry 
       (.CI(1'b0),
        .CO({\_inferred__8/i__carry_n_0 ,\_inferred__8/i__carry_n_1 ,\_inferred__8/i__carry_n_2 ,\_inferred__8/i__carry_n_3 }),
        .CYINIT(1'b0),
        .DI({\_inferred__6/i__carry_n_4 ,\_inferred__6/i__carry_n_5 ,\_inferred__6/i__carry_n_6 ,\_inferred__6/i__carry_n_7 }),
        .O({\_inferred__8/i__carry_n_4 ,\_inferred__8/i__carry_n_5 ,\_inferred__8/i__carry_n_6 ,\_inferred__8/i__carry_n_7 }),
        .S({i__carry_i_1__2_n_0,i__carry_i_2__2_n_0,i__carry_i_3__2_n_0,i__carry_i_4__2_n_0}));
  CARRY4 \_inferred__8/i__carry__0 
       (.CI(\_inferred__8/i__carry_n_0 ),
        .CO({\_inferred__8/i__carry__0_n_0 ,\_inferred__8/i__carry__0_n_1 ,\_inferred__8/i__carry__0_n_2 ,\_inferred__8/i__carry__0_n_3 }),
        .CYINIT(1'b0),
        .DI({weights_bf_2[7],\_inferred__6/i__carry__0_n_5 ,\_inferred__6/i__carry__0_n_6 ,\_inferred__6/i__carry__0_n_7 }),
        .O({\_inferred__8/i__carry__0_n_4 ,\_inferred__8/i__carry__0_n_5 ,\_inferred__8/i__carry__0_n_6 ,\_inferred__8/i__carry__0_n_7 }),
        .S({i__carry__0_i_1__2_n_0,i__carry__0_i_2_n_0,i__carry__0_i_3__2_n_0,i__carry__0_i_4__2_n_0}));
  CARRY4 \_inferred__8/i__carry__1 
       (.CI(\_inferred__8/i__carry__0_n_0 ),
        .CO({\NLW__inferred__8/i__carry__1_CO_UNCONNECTED [3:1],\_inferred__8/i__carry__1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,i__carry__1_i_1_n_3}),
        .O({\NLW__inferred__8/i__carry__1_O_UNCONNECTED [3:2],\_inferred__8/i__carry__1_n_6 ,\_inferred__8/i__carry__1_n_7 }),
        .S({1'b0,1'b0,1'b1,i__carry__1_i_2_n_0}));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \accu_bf[6]__0_carry 
       (.CI(1'b0),
        .CO({\accu_bf[6]__0_carry_n_0 ,\accu_bf[6]__0_carry_n_1 ,\accu_bf[6]__0_carry_n_2 ,\accu_bf[6]__0_carry_n_3 }),
        .CYINIT(1'b0),
        .DI({\accu_bf[6]__0_carry_i_1_n_0 ,\accu_bf[6]__0_carry_i_2_n_0 ,\accu_bf[6]__0_carry_i_3_n_0 ,1'b0}),
        .O({\accu_bf[6]__0_carry_n_4 ,\accu_bf[6]__0_carry_n_5 ,\accu_bf[6]__0_carry_n_6 ,\accu_bf[6]__0_carry_n_7 }),
        .S({\accu_bf[6]__0_carry_i_4_n_0 ,\accu_bf[6]__0_carry_i_5_n_0 ,\accu_bf[6]__0_carry_i_6_n_0 ,\accu_bf[6]__0_carry_i_7_n_0 }));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \accu_bf[6]__0_carry__0 
       (.CI(\accu_bf[6]__0_carry_n_0 ),
        .CO({\accu_bf[6]__0_carry__0_n_0 ,\accu_bf[6]__0_carry__0_n_1 ,\accu_bf[6]__0_carry__0_n_2 ,\accu_bf[6]__0_carry__0_n_3 }),
        .CYINIT(1'b0),
        .DI({\accu_bf[6]__0_carry__0_i_1_n_0 ,\accu_bf[6]__0_carry__0_i_2_n_0 ,\accu_bf[6]__0_carry__0_i_3_n_0 ,\accu_bf[6]__0_carry__0_i_4_n_0 }),
        .O({\accu_bf[6]__0_carry__0_n_4 ,\accu_bf[6]__0_carry__0_n_5 ,\accu_bf[6]__0_carry__0_n_6 ,\accu_bf[6]__0_carry__0_n_7 }),
        .S({\accu_bf[6]__0_carry__0_i_5_n_0 ,\accu_bf[6]__0_carry__0_i_6_n_0 ,\accu_bf[6]__0_carry__0_i_7_n_0 ,\accu_bf[6]__0_carry__0_i_8_n_0 }));
  (* HLUTNM = "lutpair6" *) 
  LUT3 #(
    .INIT(8'hE8)) 
    \accu_bf[6]__0_carry__0_i_1 
       (.I0(\sum_arr_bf_reg[2] [6]),
        .I1(\sum_arr_bf_reg[4] [6]),
        .I2(\sum_arr_bf_reg[0] [6]),
        .O(\accu_bf[6]__0_carry__0_i_1_n_0 ));
  (* HLUTNM = "lutpair5" *) 
  LUT3 #(
    .INIT(8'hE8)) 
    \accu_bf[6]__0_carry__0_i_2 
       (.I0(\sum_arr_bf_reg[2] [5]),
        .I1(\sum_arr_bf_reg[4] [5]),
        .I2(\sum_arr_bf_reg[0] [5]),
        .O(\accu_bf[6]__0_carry__0_i_2_n_0 ));
  (* HLUTNM = "lutpair4" *) 
  LUT3 #(
    .INIT(8'hE8)) 
    \accu_bf[6]__0_carry__0_i_3 
       (.I0(\sum_arr_bf_reg[2] [4]),
        .I1(\sum_arr_bf_reg[4] [4]),
        .I2(\sum_arr_bf_reg[0] [4]),
        .O(\accu_bf[6]__0_carry__0_i_3_n_0 ));
  (* HLUTNM = "lutpair3" *) 
  LUT3 #(
    .INIT(8'hE8)) 
    \accu_bf[6]__0_carry__0_i_4 
       (.I0(\sum_arr_bf_reg[2] [3]),
        .I1(\sum_arr_bf_reg[4] [3]),
        .I2(\sum_arr_bf_reg[0] [3]),
        .O(\accu_bf[6]__0_carry__0_i_4_n_0 ));
  (* HLUTNM = "lutpair7" *) 
  LUT4 #(
    .INIT(16'h6996)) 
    \accu_bf[6]__0_carry__0_i_5 
       (.I0(\sum_arr_bf_reg[2] [7]),
        .I1(\sum_arr_bf_reg[4] [7]),
        .I2(\sum_arr_bf_reg[0] [7]),
        .I3(\accu_bf[6]__0_carry__0_i_1_n_0 ),
        .O(\accu_bf[6]__0_carry__0_i_5_n_0 ));
  (* HLUTNM = "lutpair6" *) 
  LUT4 #(
    .INIT(16'h6996)) 
    \accu_bf[6]__0_carry__0_i_6 
       (.I0(\sum_arr_bf_reg[2] [6]),
        .I1(\sum_arr_bf_reg[4] [6]),
        .I2(\sum_arr_bf_reg[0] [6]),
        .I3(\accu_bf[6]__0_carry__0_i_2_n_0 ),
        .O(\accu_bf[6]__0_carry__0_i_6_n_0 ));
  (* HLUTNM = "lutpair5" *) 
  LUT4 #(
    .INIT(16'h6996)) 
    \accu_bf[6]__0_carry__0_i_7 
       (.I0(\sum_arr_bf_reg[2] [5]),
        .I1(\sum_arr_bf_reg[4] [5]),
        .I2(\sum_arr_bf_reg[0] [5]),
        .I3(\accu_bf[6]__0_carry__0_i_3_n_0 ),
        .O(\accu_bf[6]__0_carry__0_i_7_n_0 ));
  (* HLUTNM = "lutpair4" *) 
  LUT4 #(
    .INIT(16'h6996)) 
    \accu_bf[6]__0_carry__0_i_8 
       (.I0(\sum_arr_bf_reg[2] [4]),
        .I1(\sum_arr_bf_reg[4] [4]),
        .I2(\sum_arr_bf_reg[0] [4]),
        .I3(\accu_bf[6]__0_carry__0_i_4_n_0 ),
        .O(\accu_bf[6]__0_carry__0_i_8_n_0 ));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \accu_bf[6]__0_carry__1 
       (.CI(\accu_bf[6]__0_carry__0_n_0 ),
        .CO({\NLW_accu_bf[6]__0_carry__1_CO_UNCONNECTED [3:1],\accu_bf[6]__0_carry__1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,\accu_bf[6]__0_carry__1_i_1_n_0 }),
        .O({\NLW_accu_bf[6]__0_carry__1_O_UNCONNECTED [3:2],\accu_bf[6]__0_carry__1_n_6 ,\accu_bf[6]__0_carry__1_n_7 }),
        .S({1'b0,1'b0,\accu_bf[6]__0_carry__1_i_2_n_0 ,\accu_bf[6]__0_carry__1_i_3_n_0 }));
  (* HLUTNM = "lutpair7" *) 
  LUT3 #(
    .INIT(8'hE8)) 
    \accu_bf[6]__0_carry__1_i_1 
       (.I0(\sum_arr_bf_reg[2] [7]),
        .I1(\sum_arr_bf_reg[4] [7]),
        .I2(\sum_arr_bf_reg[0] [7]),
        .O(\accu_bf[6]__0_carry__1_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h17E8E817E81717E8)) 
    \accu_bf[6]__0_carry__1_i_2 
       (.I0(\sum_arr_bf_reg[0] [8]),
        .I1(\sum_arr_bf_reg[4] [8]),
        .I2(\sum_arr_bf_reg[2] [8]),
        .I3(\sum_arr_bf_reg[4] [9]),
        .I4(\sum_arr_bf_reg[2] [9]),
        .I5(\sum_arr_bf_reg[0] [9]),
        .O(\accu_bf[6]__0_carry__1_i_2_n_0 ));
  LUT4 #(
    .INIT(16'h6996)) 
    \accu_bf[6]__0_carry__1_i_3 
       (.I0(\accu_bf[6]__0_carry__1_i_1_n_0 ),
        .I1(\sum_arr_bf_reg[4] [8]),
        .I2(\sum_arr_bf_reg[2] [8]),
        .I3(\sum_arr_bf_reg[0] [8]),
        .O(\accu_bf[6]__0_carry__1_i_3_n_0 ));
  (* HLUTNM = "lutpair2" *) 
  LUT3 #(
    .INIT(8'hE8)) 
    \accu_bf[6]__0_carry_i_1 
       (.I0(\sum_arr_bf_reg[2] [2]),
        .I1(\sum_arr_bf_reg[4] [2]),
        .I2(\sum_arr_bf_reg[0] [2]),
        .O(\accu_bf[6]__0_carry_i_1_n_0 ));
  (* HLUTNM = "lutpair1" *) 
  LUT3 #(
    .INIT(8'hE8)) 
    \accu_bf[6]__0_carry_i_2 
       (.I0(\sum_arr_bf_reg[2] [1]),
        .I1(\sum_arr_bf_reg[4] [1]),
        .I2(\sum_arr_bf_reg[0] [1]),
        .O(\accu_bf[6]__0_carry_i_2_n_0 ));
  (* HLUTNM = "lutpair0" *) 
  LUT3 #(
    .INIT(8'hE8)) 
    \accu_bf[6]__0_carry_i_3 
       (.I0(\sum_arr_bf_reg[2] [0]),
        .I1(\sum_arr_bf_reg[4] [0]),
        .I2(\sum_arr_bf_reg[0] [0]),
        .O(\accu_bf[6]__0_carry_i_3_n_0 ));
  (* HLUTNM = "lutpair3" *) 
  LUT4 #(
    .INIT(16'h6996)) 
    \accu_bf[6]__0_carry_i_4 
       (.I0(\sum_arr_bf_reg[2] [3]),
        .I1(\sum_arr_bf_reg[4] [3]),
        .I2(\sum_arr_bf_reg[0] [3]),
        .I3(\accu_bf[6]__0_carry_i_1_n_0 ),
        .O(\accu_bf[6]__0_carry_i_4_n_0 ));
  (* HLUTNM = "lutpair2" *) 
  LUT4 #(
    .INIT(16'h6996)) 
    \accu_bf[6]__0_carry_i_5 
       (.I0(\sum_arr_bf_reg[2] [2]),
        .I1(\sum_arr_bf_reg[4] [2]),
        .I2(\sum_arr_bf_reg[0] [2]),
        .I3(\accu_bf[6]__0_carry_i_2_n_0 ),
        .O(\accu_bf[6]__0_carry_i_5_n_0 ));
  (* HLUTNM = "lutpair1" *) 
  LUT4 #(
    .INIT(16'h6996)) 
    \accu_bf[6]__0_carry_i_6 
       (.I0(\sum_arr_bf_reg[2] [1]),
        .I1(\sum_arr_bf_reg[4] [1]),
        .I2(\sum_arr_bf_reg[0] [1]),
        .I3(\accu_bf[6]__0_carry_i_3_n_0 ),
        .O(\accu_bf[6]__0_carry_i_6_n_0 ));
  (* HLUTNM = "lutpair0" *) 
  LUT3 #(
    .INIT(8'h96)) 
    \accu_bf[6]__0_carry_i_7 
       (.I0(\sum_arr_bf_reg[2] [0]),
        .I1(\sum_arr_bf_reg[4] [0]),
        .I2(\sum_arr_bf_reg[0] [0]),
        .O(\accu_bf[6]__0_carry_i_7_n_0 ));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \accu_bf[6]__28_carry 
       (.CI(1'b0),
        .CO({\accu_bf[6]__28_carry_n_0 ,\accu_bf[6]__28_carry_n_1 ,\accu_bf[6]__28_carry_n_2 ,\accu_bf[6]__28_carry_n_3 }),
        .CYINIT(1'b0),
        .DI({\accu_bf[6]__28_carry_i_1_n_0 ,\accu_bf[6]__28_carry_i_2_n_0 ,\accu_bf[6]__28_carry_i_3_n_0 ,1'b0}),
        .O({\accu_bf[6]__28_carry_n_4 ,\accu_bf[6]__28_carry_n_5 ,\accu_bf[6]__28_carry_n_6 ,\accu_bf[6]__28_carry_n_7 }),
        .S({\accu_bf[6]__28_carry_i_4_n_0 ,\accu_bf[6]__28_carry_i_5_n_0 ,\accu_bf[6]__28_carry_i_6_n_0 ,\accu_bf[6]__28_carry_i_7_n_0 }));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \accu_bf[6]__28_carry__0 
       (.CI(\accu_bf[6]__28_carry_n_0 ),
        .CO({\accu_bf[6]__28_carry__0_n_0 ,\accu_bf[6]__28_carry__0_n_1 ,\accu_bf[6]__28_carry__0_n_2 ,\accu_bf[6]__28_carry__0_n_3 }),
        .CYINIT(1'b0),
        .DI({\accu_bf[6]__28_carry__0_i_1_n_0 ,\accu_bf[6]__28_carry__0_i_2_n_0 ,\accu_bf[6]__28_carry__0_i_3_n_0 ,\accu_bf[6]__28_carry__0_i_4_n_0 }),
        .O({\accu_bf[6]__28_carry__0_n_4 ,\accu_bf[6]__28_carry__0_n_5 ,\accu_bf[6]__28_carry__0_n_6 ,\accu_bf[6]__28_carry__0_n_7 }),
        .S({\accu_bf[6]__28_carry__0_i_5_n_0 ,\accu_bf[6]__28_carry__0_i_6_n_0 ,\accu_bf[6]__28_carry__0_i_7_n_0 ,\accu_bf[6]__28_carry__0_i_8_n_0 }));
  (* HLUTNM = "lutpair14" *) 
  LUT3 #(
    .INIT(8'hE8)) 
    \accu_bf[6]__28_carry__0_i_1 
       (.I0(\sum_arr_bf_reg[6] [6]),
        .I1(\sum_arr_bf_reg[3] [6]),
        .I2(\sum_arr_bf_reg[1] [6]),
        .O(\accu_bf[6]__28_carry__0_i_1_n_0 ));
  (* HLUTNM = "lutpair13" *) 
  LUT3 #(
    .INIT(8'hE8)) 
    \accu_bf[6]__28_carry__0_i_2 
       (.I0(\sum_arr_bf_reg[6] [5]),
        .I1(\sum_arr_bf_reg[3] [5]),
        .I2(\sum_arr_bf_reg[1] [5]),
        .O(\accu_bf[6]__28_carry__0_i_2_n_0 ));
  (* HLUTNM = "lutpair12" *) 
  LUT3 #(
    .INIT(8'hE8)) 
    \accu_bf[6]__28_carry__0_i_3 
       (.I0(\sum_arr_bf_reg[6] [4]),
        .I1(\sum_arr_bf_reg[3] [4]),
        .I2(\sum_arr_bf_reg[1] [4]),
        .O(\accu_bf[6]__28_carry__0_i_3_n_0 ));
  (* HLUTNM = "lutpair11" *) 
  LUT3 #(
    .INIT(8'hE8)) 
    \accu_bf[6]__28_carry__0_i_4 
       (.I0(\sum_arr_bf_reg[6] [3]),
        .I1(\sum_arr_bf_reg[3] [3]),
        .I2(\sum_arr_bf_reg[1] [3]),
        .O(\accu_bf[6]__28_carry__0_i_4_n_0 ));
  (* HLUTNM = "lutpair15" *) 
  LUT4 #(
    .INIT(16'h6996)) 
    \accu_bf[6]__28_carry__0_i_5 
       (.I0(\sum_arr_bf_reg[6] [7]),
        .I1(\sum_arr_bf_reg[3] [7]),
        .I2(\sum_arr_bf_reg[1] [7]),
        .I3(\accu_bf[6]__28_carry__0_i_1_n_0 ),
        .O(\accu_bf[6]__28_carry__0_i_5_n_0 ));
  (* HLUTNM = "lutpair14" *) 
  LUT4 #(
    .INIT(16'h6996)) 
    \accu_bf[6]__28_carry__0_i_6 
       (.I0(\sum_arr_bf_reg[6] [6]),
        .I1(\sum_arr_bf_reg[3] [6]),
        .I2(\sum_arr_bf_reg[1] [6]),
        .I3(\accu_bf[6]__28_carry__0_i_2_n_0 ),
        .O(\accu_bf[6]__28_carry__0_i_6_n_0 ));
  (* HLUTNM = "lutpair13" *) 
  LUT4 #(
    .INIT(16'h6996)) 
    \accu_bf[6]__28_carry__0_i_7 
       (.I0(\sum_arr_bf_reg[6] [5]),
        .I1(\sum_arr_bf_reg[3] [5]),
        .I2(\sum_arr_bf_reg[1] [5]),
        .I3(\accu_bf[6]__28_carry__0_i_3_n_0 ),
        .O(\accu_bf[6]__28_carry__0_i_7_n_0 ));
  (* HLUTNM = "lutpair12" *) 
  LUT4 #(
    .INIT(16'h6996)) 
    \accu_bf[6]__28_carry__0_i_8 
       (.I0(\sum_arr_bf_reg[6] [4]),
        .I1(\sum_arr_bf_reg[3] [4]),
        .I2(\sum_arr_bf_reg[1] [4]),
        .I3(\accu_bf[6]__28_carry__0_i_4_n_0 ),
        .O(\accu_bf[6]__28_carry__0_i_8_n_0 ));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \accu_bf[6]__28_carry__1 
       (.CI(\accu_bf[6]__28_carry__0_n_0 ),
        .CO({\NLW_accu_bf[6]__28_carry__1_CO_UNCONNECTED [3:1],\accu_bf[6]__28_carry__1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,\accu_bf[6]__28_carry__1_i_1_n_0 }),
        .O({\NLW_accu_bf[6]__28_carry__1_O_UNCONNECTED [3:2],\accu_bf[6]__28_carry__1_n_6 ,\accu_bf[6]__28_carry__1_n_7 }),
        .S({1'b0,1'b0,\accu_bf[6]__28_carry__1_i_2_n_0 ,\accu_bf[6]__28_carry__1_i_3_n_0 }));
  (* HLUTNM = "lutpair15" *) 
  LUT3 #(
    .INIT(8'hE8)) 
    \accu_bf[6]__28_carry__1_i_1 
       (.I0(\sum_arr_bf_reg[6] [7]),
        .I1(\sum_arr_bf_reg[3] [7]),
        .I2(\sum_arr_bf_reg[1] [7]),
        .O(\accu_bf[6]__28_carry__1_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h17E8E817E81717E8)) 
    \accu_bf[6]__28_carry__1_i_2 
       (.I0(\sum_arr_bf_reg[1] [8]),
        .I1(\sum_arr_bf_reg[3] [8]),
        .I2(\sum_arr_bf_reg[6] [8]),
        .I3(\sum_arr_bf_reg[3] [9]),
        .I4(\sum_arr_bf_reg[6] [9]),
        .I5(\sum_arr_bf_reg[1] [9]),
        .O(\accu_bf[6]__28_carry__1_i_2_n_0 ));
  LUT4 #(
    .INIT(16'h6996)) 
    \accu_bf[6]__28_carry__1_i_3 
       (.I0(\accu_bf[6]__28_carry__1_i_1_n_0 ),
        .I1(\sum_arr_bf_reg[3] [8]),
        .I2(\sum_arr_bf_reg[6] [8]),
        .I3(\sum_arr_bf_reg[1] [8]),
        .O(\accu_bf[6]__28_carry__1_i_3_n_0 ));
  (* HLUTNM = "lutpair10" *) 
  LUT3 #(
    .INIT(8'hE8)) 
    \accu_bf[6]__28_carry_i_1 
       (.I0(\sum_arr_bf_reg[6] [2]),
        .I1(\sum_arr_bf_reg[3] [2]),
        .I2(\sum_arr_bf_reg[1] [2]),
        .O(\accu_bf[6]__28_carry_i_1_n_0 ));
  (* HLUTNM = "lutpair9" *) 
  LUT3 #(
    .INIT(8'hE8)) 
    \accu_bf[6]__28_carry_i_2 
       (.I0(\sum_arr_bf_reg[6] [1]),
        .I1(\sum_arr_bf_reg[3] [1]),
        .I2(\sum_arr_bf_reg[1] [1]),
        .O(\accu_bf[6]__28_carry_i_2_n_0 ));
  (* HLUTNM = "lutpair8" *) 
  LUT3 #(
    .INIT(8'hE8)) 
    \accu_bf[6]__28_carry_i_3 
       (.I0(\sum_arr_bf_reg[6] [0]),
        .I1(\sum_arr_bf_reg[3] [0]),
        .I2(\sum_arr_bf_reg[1] [0]),
        .O(\accu_bf[6]__28_carry_i_3_n_0 ));
  (* HLUTNM = "lutpair11" *) 
  LUT4 #(
    .INIT(16'h6996)) 
    \accu_bf[6]__28_carry_i_4 
       (.I0(\sum_arr_bf_reg[6] [3]),
        .I1(\sum_arr_bf_reg[3] [3]),
        .I2(\sum_arr_bf_reg[1] [3]),
        .I3(\accu_bf[6]__28_carry_i_1_n_0 ),
        .O(\accu_bf[6]__28_carry_i_4_n_0 ));
  (* HLUTNM = "lutpair10" *) 
  LUT4 #(
    .INIT(16'h6996)) 
    \accu_bf[6]__28_carry_i_5 
       (.I0(\sum_arr_bf_reg[6] [2]),
        .I1(\sum_arr_bf_reg[3] [2]),
        .I2(\sum_arr_bf_reg[1] [2]),
        .I3(\accu_bf[6]__28_carry_i_2_n_0 ),
        .O(\accu_bf[6]__28_carry_i_5_n_0 ));
  (* HLUTNM = "lutpair9" *) 
  LUT4 #(
    .INIT(16'h6996)) 
    \accu_bf[6]__28_carry_i_6 
       (.I0(\sum_arr_bf_reg[6] [1]),
        .I1(\sum_arr_bf_reg[3] [1]),
        .I2(\sum_arr_bf_reg[1] [1]),
        .I3(\accu_bf[6]__28_carry_i_3_n_0 ),
        .O(\accu_bf[6]__28_carry_i_6_n_0 ));
  (* HLUTNM = "lutpair8" *) 
  LUT3 #(
    .INIT(8'h96)) 
    \accu_bf[6]__28_carry_i_7 
       (.I0(\sum_arr_bf_reg[6] [0]),
        .I1(\sum_arr_bf_reg[3] [0]),
        .I2(\sum_arr_bf_reg[1] [0]),
        .O(\accu_bf[6]__28_carry_i_7_n_0 ));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \accu_bf[6]__58_carry 
       (.CI(1'b0),
        .CO({\accu_bf[6]__58_carry_n_0 ,\accu_bf[6]__58_carry_n_1 ,\accu_bf[6]__58_carry_n_2 ,\accu_bf[6]__58_carry_n_3 }),
        .CYINIT(1'b0),
        .DI({\accu_bf[6]__58_carry_i_1_n_0 ,\accu_bf[6]__58_carry_i_2_n_0 ,\accu_bf[6]__58_carry_i_3_n_0 ,\sum_arr_bf_reg[5] [0]}),
        .O({\accu_bf[6]__58_carry_n_4 ,\accu_bf[6]__58_carry_n_5 ,\accu_bf[6]__58_carry_n_6 ,\accu_bf[6]__58_carry_n_7 }),
        .S({\accu_bf[6]__58_carry_i_4_n_0 ,\accu_bf[6]__58_carry_i_5_n_0 ,\accu_bf[6]__58_carry_i_6_n_0 ,\accu_bf[6]__58_carry_i_7_n_0 }));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \accu_bf[6]__58_carry__0 
       (.CI(\accu_bf[6]__58_carry_n_0 ),
        .CO({\accu_bf[6]__58_carry__0_n_0 ,\accu_bf[6]__58_carry__0_n_1 ,\accu_bf[6]__58_carry__0_n_2 ,\accu_bf[6]__58_carry__0_n_3 }),
        .CYINIT(1'b0),
        .DI({\accu_bf[6]__58_carry__0_i_1_n_0 ,\accu_bf[6]__58_carry__0_i_2_n_0 ,\accu_bf[6]__58_carry__0_i_3_n_0 ,\accu_bf[6]__58_carry__0_i_4_n_0 }),
        .O({\accu_bf[6]__58_carry__0_n_4 ,\accu_bf[6]__58_carry__0_n_5 ,\accu_bf[6]__58_carry__0_n_6 ,\accu_bf[6]__58_carry__0_n_7 }),
        .S({\accu_bf[6]__58_carry__0_i_5_n_0 ,\accu_bf[6]__58_carry__0_i_6_n_0 ,\accu_bf[6]__58_carry__0_i_7_n_0 ,\accu_bf[6]__58_carry__0_i_8_n_0 }));
  LUT5 #(
    .INIT(32'hEEE8E888)) 
    \accu_bf[6]__58_carry__0_i_1 
       (.I0(\sum_arr_bf_reg[5] [6]),
        .I1(\accu_bf[6]__58_carry__0_i_9_n_0 ),
        .I2(\sum_arr_bf_reg[7] [5]),
        .I3(\accu_bf[6]__0_carry__0_n_6 ),
        .I4(\accu_bf[6]__28_carry__0_n_6 ),
        .O(\accu_bf[6]__58_carry__0_i_1_n_0 ));
  LUT3 #(
    .INIT(8'h96)) 
    \accu_bf[6]__58_carry__0_i_10 
       (.I0(\sum_arr_bf_reg[7] [5]),
        .I1(\accu_bf[6]__28_carry__0_n_6 ),
        .I2(\accu_bf[6]__0_carry__0_n_6 ),
        .O(\accu_bf[6]__58_carry__0_i_10_n_0 ));
  LUT3 #(
    .INIT(8'h96)) 
    \accu_bf[6]__58_carry__0_i_11 
       (.I0(\sum_arr_bf_reg[7] [4]),
        .I1(\accu_bf[6]__28_carry__0_n_7 ),
        .I2(\accu_bf[6]__0_carry__0_n_7 ),
        .O(\accu_bf[6]__58_carry__0_i_11_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT3 #(
    .INIT(8'h96)) 
    \accu_bf[6]__58_carry__0_i_12 
       (.I0(\sum_arr_bf_reg[7] [7]),
        .I1(\accu_bf[6]__28_carry__0_n_4 ),
        .I2(\accu_bf[6]__0_carry__0_n_4 ),
        .O(\accu_bf[6]__58_carry__0_i_12_n_0 ));
  LUT5 #(
    .INIT(32'hEEE8E888)) 
    \accu_bf[6]__58_carry__0_i_2 
       (.I0(\sum_arr_bf_reg[5] [5]),
        .I1(\accu_bf[6]__58_carry__0_i_10_n_0 ),
        .I2(\sum_arr_bf_reg[7] [4]),
        .I3(\accu_bf[6]__0_carry__0_n_7 ),
        .I4(\accu_bf[6]__28_carry__0_n_7 ),
        .O(\accu_bf[6]__58_carry__0_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hEEE8E888)) 
    \accu_bf[6]__58_carry__0_i_3 
       (.I0(\sum_arr_bf_reg[5] [4]),
        .I1(\accu_bf[6]__58_carry__0_i_11_n_0 ),
        .I2(\sum_arr_bf_reg[7] [3]),
        .I3(\accu_bf[6]__0_carry_n_4 ),
        .I4(\accu_bf[6]__28_carry_n_4 ),
        .O(\accu_bf[6]__58_carry__0_i_3_n_0 ));
  LUT5 #(
    .INIT(32'hEEE8E888)) 
    \accu_bf[6]__58_carry__0_i_4 
       (.I0(\sum_arr_bf_reg[5] [3]),
        .I1(\accu_bf[6]__58_carry_i_9_n_0 ),
        .I2(\sum_arr_bf_reg[7] [2]),
        .I3(\accu_bf[6]__0_carry_n_5 ),
        .I4(\accu_bf[6]__28_carry_n_5 ),
        .O(\accu_bf[6]__58_carry__0_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h6969699669969696)) 
    \accu_bf[6]__58_carry__0_i_5 
       (.I0(\accu_bf[6]__58_carry__0_i_1_n_0 ),
        .I1(\accu_bf[6]__58_carry__0_i_12_n_0 ),
        .I2(\sum_arr_bf_reg[5] [7]),
        .I3(\accu_bf[6]__28_carry__0_n_5 ),
        .I4(\accu_bf[6]__0_carry__0_n_5 ),
        .I5(\sum_arr_bf_reg[7] [6]),
        .O(\accu_bf[6]__58_carry__0_i_5_n_0 ));
  LUT6 #(
    .INIT(64'h6969699669969696)) 
    \accu_bf[6]__58_carry__0_i_6 
       (.I0(\accu_bf[6]__58_carry__0_i_2_n_0 ),
        .I1(\accu_bf[6]__58_carry__0_i_9_n_0 ),
        .I2(\sum_arr_bf_reg[5] [6]),
        .I3(\accu_bf[6]__28_carry__0_n_6 ),
        .I4(\accu_bf[6]__0_carry__0_n_6 ),
        .I5(\sum_arr_bf_reg[7] [5]),
        .O(\accu_bf[6]__58_carry__0_i_6_n_0 ));
  LUT6 #(
    .INIT(64'h6969699669969696)) 
    \accu_bf[6]__58_carry__0_i_7 
       (.I0(\accu_bf[6]__58_carry__0_i_3_n_0 ),
        .I1(\accu_bf[6]__58_carry__0_i_10_n_0 ),
        .I2(\sum_arr_bf_reg[5] [5]),
        .I3(\accu_bf[6]__28_carry__0_n_7 ),
        .I4(\accu_bf[6]__0_carry__0_n_7 ),
        .I5(\sum_arr_bf_reg[7] [4]),
        .O(\accu_bf[6]__58_carry__0_i_7_n_0 ));
  LUT6 #(
    .INIT(64'h6969699669969696)) 
    \accu_bf[6]__58_carry__0_i_8 
       (.I0(\accu_bf[6]__58_carry__0_i_4_n_0 ),
        .I1(\accu_bf[6]__58_carry__0_i_11_n_0 ),
        .I2(\sum_arr_bf_reg[5] [4]),
        .I3(\accu_bf[6]__28_carry_n_4 ),
        .I4(\accu_bf[6]__0_carry_n_4 ),
        .I5(\sum_arr_bf_reg[7] [3]),
        .O(\accu_bf[6]__58_carry__0_i_8_n_0 ));
  LUT3 #(
    .INIT(8'h96)) 
    \accu_bf[6]__58_carry__0_i_9 
       (.I0(\sum_arr_bf_reg[7] [6]),
        .I1(\accu_bf[6]__28_carry__0_n_5 ),
        .I2(\accu_bf[6]__0_carry__0_n_5 ),
        .O(\accu_bf[6]__58_carry__0_i_9_n_0 ));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \accu_bf[6]__58_carry__1 
       (.CI(\accu_bf[6]__58_carry__0_n_0 ),
        .CO({\NLW_accu_bf[6]__58_carry__1_CO_UNCONNECTED [3:1],\accu_bf[6]__58_carry__1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,\accu_bf[6]__58_carry__1_i_1_n_0 }),
        .O({\NLW_accu_bf[6]__58_carry__1_O_UNCONNECTED [3:2],\accu_bf[6]__58_carry__1_n_6 ,\accu_bf[6]__58_carry__1_n_7 }),
        .S({1'b0,1'b0,\accu_bf[6]__58_carry__1_i_2_n_0 ,\accu_bf[6]__58_carry__1_i_3_n_0 }));
  LUT5 #(
    .INIT(32'hEEE8E888)) 
    \accu_bf[6]__58_carry__1_i_1 
       (.I0(\sum_arr_bf_reg[5] [7]),
        .I1(\accu_bf[6]__58_carry__0_i_12_n_0 ),
        .I2(\sum_arr_bf_reg[7] [6]),
        .I3(\accu_bf[6]__0_carry__0_n_5 ),
        .I4(\accu_bf[6]__28_carry__0_n_5 ),
        .O(\accu_bf[6]__58_carry__1_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hE187871E871E1E78)) 
    \accu_bf[6]__58_carry__1_i_2 
       (.I0(\accu_bf[6]__58_carry__1_i_4_n_0 ),
        .I1(\sum_arr_bf_reg[5] [8]),
        .I2(\accu_bf[6]__58_carry__1_i_5_n_0 ),
        .I3(\accu_bf[6]__28_carry__1_n_7 ),
        .I4(\accu_bf[6]__0_carry__1_n_7 ),
        .I5(\sum_arr_bf_reg[7] [8]),
        .O(\accu_bf[6]__58_carry__1_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h6969699669969696)) 
    \accu_bf[6]__58_carry__1_i_3 
       (.I0(\accu_bf[6]__58_carry__1_i_1_n_0 ),
        .I1(\accu_bf[6]__58_carry__1_i_6_n_0 ),
        .I2(\sum_arr_bf_reg[5] [8]),
        .I3(\accu_bf[6]__28_carry__0_n_4 ),
        .I4(\accu_bf[6]__0_carry__0_n_4 ),
        .I5(\sum_arr_bf_reg[7] [7]),
        .O(\accu_bf[6]__58_carry__1_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT3 #(
    .INIT(8'hE8)) 
    \accu_bf[6]__58_carry__1_i_4 
       (.I0(\accu_bf[6]__28_carry__0_n_4 ),
        .I1(\accu_bf[6]__0_carry__0_n_4 ),
        .I2(\sum_arr_bf_reg[7] [7]),
        .O(\accu_bf[6]__58_carry__1_i_4_n_0 ));
  LUT4 #(
    .INIT(16'h6996)) 
    \accu_bf[6]__58_carry__1_i_5 
       (.I0(\accu_bf[6]__0_carry__1_n_6 ),
        .I1(\accu_bf[6]__28_carry__1_n_6 ),
        .I2(\sum_arr_bf_reg[7] [9]),
        .I3(\sum_arr_bf_reg[5] [9]),
        .O(\accu_bf[6]__58_carry__1_i_5_n_0 ));
  LUT3 #(
    .INIT(8'h96)) 
    \accu_bf[6]__58_carry__1_i_6 
       (.I0(\sum_arr_bf_reg[7] [8]),
        .I1(\accu_bf[6]__28_carry__1_n_7 ),
        .I2(\accu_bf[6]__0_carry__1_n_7 ),
        .O(\accu_bf[6]__58_carry__1_i_6_n_0 ));
  LUT5 #(
    .INIT(32'hEEE8E888)) 
    \accu_bf[6]__58_carry_i_1 
       (.I0(\sum_arr_bf_reg[5] [2]),
        .I1(\accu_bf[6]__58_carry_i_8_n_0 ),
        .I2(\sum_arr_bf_reg[7] [1]),
        .I3(\accu_bf[6]__0_carry_n_6 ),
        .I4(\accu_bf[6]__28_carry_n_6 ),
        .O(\accu_bf[6]__58_carry_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hE81717E8)) 
    \accu_bf[6]__58_carry_i_2 
       (.I0(\sum_arr_bf_reg[7] [1]),
        .I1(\accu_bf[6]__0_carry_n_6 ),
        .I2(\accu_bf[6]__28_carry_n_6 ),
        .I3(\sum_arr_bf_reg[5] [2]),
        .I4(\accu_bf[6]__58_carry_i_8_n_0 ),
        .O(\accu_bf[6]__58_carry_i_2_n_0 ));
  LUT4 #(
    .INIT(16'h6996)) 
    \accu_bf[6]__58_carry_i_3 
       (.I0(\accu_bf[6]__0_carry_n_6 ),
        .I1(\accu_bf[6]__28_carry_n_6 ),
        .I2(\sum_arr_bf_reg[7] [1]),
        .I3(\sum_arr_bf_reg[5] [1]),
        .O(\accu_bf[6]__58_carry_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h6969699669969696)) 
    \accu_bf[6]__58_carry_i_4 
       (.I0(\accu_bf[6]__58_carry_i_1_n_0 ),
        .I1(\accu_bf[6]__58_carry_i_9_n_0 ),
        .I2(\sum_arr_bf_reg[5] [3]),
        .I3(\accu_bf[6]__28_carry_n_5 ),
        .I4(\accu_bf[6]__0_carry_n_5 ),
        .I5(\sum_arr_bf_reg[7] [2]),
        .O(\accu_bf[6]__58_carry_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h6999999699969666)) 
    \accu_bf[6]__58_carry_i_5 
       (.I0(\accu_bf[6]__58_carry_i_8_n_0 ),
        .I1(\sum_arr_bf_reg[5] [2]),
        .I2(\sum_arr_bf_reg[7] [1]),
        .I3(\accu_bf[6]__28_carry_n_6 ),
        .I4(\accu_bf[6]__0_carry_n_6 ),
        .I5(\sum_arr_bf_reg[5] [1]),
        .O(\accu_bf[6]__58_carry_i_5_n_0 ));
  LUT4 #(
    .INIT(16'h566A)) 
    \accu_bf[6]__58_carry_i_6 
       (.I0(\accu_bf[6]__58_carry_i_3_n_0 ),
        .I1(\sum_arr_bf_reg[7] [0]),
        .I2(\accu_bf[6]__0_carry_n_7 ),
        .I3(\accu_bf[6]__28_carry_n_7 ),
        .O(\accu_bf[6]__58_carry_i_6_n_0 ));
  LUT4 #(
    .INIT(16'h6996)) 
    \accu_bf[6]__58_carry_i_7 
       (.I0(\accu_bf[6]__0_carry_n_7 ),
        .I1(\accu_bf[6]__28_carry_n_7 ),
        .I2(\sum_arr_bf_reg[7] [0]),
        .I3(\sum_arr_bf_reg[5] [0]),
        .O(\accu_bf[6]__58_carry_i_7_n_0 ));
  LUT3 #(
    .INIT(8'h96)) 
    \accu_bf[6]__58_carry_i_8 
       (.I0(\sum_arr_bf_reg[7] [2]),
        .I1(\accu_bf[6]__28_carry_n_5 ),
        .I2(\accu_bf[6]__0_carry_n_5 ),
        .O(\accu_bf[6]__58_carry_i_8_n_0 ));
  LUT3 #(
    .INIT(8'h96)) 
    \accu_bf[6]__58_carry_i_9 
       (.I0(\sum_arr_bf_reg[7] [3]),
        .I1(\accu_bf[6]__28_carry_n_4 ),
        .I2(\accu_bf[6]__0_carry_n_4 ),
        .O(\accu_bf[6]__58_carry_i_9_n_0 ));
  FDCE #(
    .INIT(1'b0)) 
    \data_in_bf_0_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(weights_bf_0_0),
        .CLR(rstn),
        .D(\data_in_bf_0_reg[7]_0 [0]),
        .Q(data_in_bf_0[0]));
  FDCE #(
    .INIT(1'b0)) 
    \data_in_bf_0_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(weights_bf_0_0),
        .CLR(rstn),
        .D(\data_in_bf_0_reg[7]_0 [1]),
        .Q(data_in_bf_0[1]));
  FDCE #(
    .INIT(1'b0)) 
    \data_in_bf_0_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(weights_bf_0_0),
        .CLR(rstn),
        .D(\data_in_bf_0_reg[7]_0 [2]),
        .Q(data_in_bf_0[2]));
  FDCE #(
    .INIT(1'b0)) 
    \data_in_bf_0_reg[3] 
       (.C(clk_IBUF_BUFG),
        .CE(weights_bf_0_0),
        .CLR(rstn),
        .D(\data_in_bf_0_reg[7]_0 [3]),
        .Q(data_in_bf_0[3]));
  FDCE #(
    .INIT(1'b0)) 
    \data_in_bf_0_reg[4] 
       (.C(clk_IBUF_BUFG),
        .CE(weights_bf_0_0),
        .CLR(rstn),
        .D(\data_in_bf_0_reg[7]_0 [4]),
        .Q(data_in_bf_0[4]));
  FDCE #(
    .INIT(1'b0)) 
    \data_in_bf_0_reg[5] 
       (.C(clk_IBUF_BUFG),
        .CE(weights_bf_0_0),
        .CLR(rstn),
        .D(\data_in_bf_0_reg[7]_0 [5]),
        .Q(data_in_bf_0[5]));
  FDCE #(
    .INIT(1'b0)) 
    \data_in_bf_0_reg[6] 
       (.C(clk_IBUF_BUFG),
        .CE(weights_bf_0_0),
        .CLR(rstn),
        .D(\data_in_bf_0_reg[7]_0 [6]),
        .Q(data_in_bf_0[6]));
  FDCE #(
    .INIT(1'b0)) 
    \data_in_bf_0_reg[7] 
       (.C(clk_IBUF_BUFG),
        .CE(weights_bf_0_0),
        .CLR(rstn),
        .D(\data_in_bf_0_reg[7]_0 [7]),
        .Q(data_in_bf_0[7]));
  FDCE #(
    .INIT(1'b0)) 
    \data_in_bf_1_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(weights_bf_0_0),
        .CLR(rstn),
        .D(\data_in_bf_1_reg[7]_0 [0]),
        .Q(data_in_bf_1[0]));
  FDCE #(
    .INIT(1'b0)) 
    \data_in_bf_1_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(weights_bf_0_0),
        .CLR(rstn),
        .D(\data_in_bf_1_reg[7]_0 [1]),
        .Q(data_in_bf_1[1]));
  FDCE #(
    .INIT(1'b0)) 
    \data_in_bf_1_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(weights_bf_0_0),
        .CLR(rstn),
        .D(\data_in_bf_1_reg[7]_0 [2]),
        .Q(data_in_bf_1[2]));
  FDCE #(
    .INIT(1'b0)) 
    \data_in_bf_1_reg[3] 
       (.C(clk_IBUF_BUFG),
        .CE(weights_bf_0_0),
        .CLR(rstn),
        .D(\data_in_bf_1_reg[7]_0 [3]),
        .Q(data_in_bf_1[3]));
  FDCE #(
    .INIT(1'b0)) 
    \data_in_bf_1_reg[4] 
       (.C(clk_IBUF_BUFG),
        .CE(weights_bf_0_0),
        .CLR(rstn),
        .D(\data_in_bf_1_reg[7]_0 [4]),
        .Q(data_in_bf_1[4]));
  FDCE #(
    .INIT(1'b0)) 
    \data_in_bf_1_reg[5] 
       (.C(clk_IBUF_BUFG),
        .CE(weights_bf_0_0),
        .CLR(rstn),
        .D(\data_in_bf_1_reg[7]_0 [5]),
        .Q(data_in_bf_1[5]));
  FDCE #(
    .INIT(1'b0)) 
    \data_in_bf_1_reg[6] 
       (.C(clk_IBUF_BUFG),
        .CE(weights_bf_0_0),
        .CLR(rstn),
        .D(\data_in_bf_1_reg[7]_0 [6]),
        .Q(data_in_bf_1[6]));
  FDCE #(
    .INIT(1'b0)) 
    \data_in_bf_1_reg[7] 
       (.C(clk_IBUF_BUFG),
        .CE(weights_bf_0_0),
        .CLR(rstn),
        .D(\data_in_bf_1_reg[7]_0 [7]),
        .Q(data_in_bf_1[7]));
  FDCE #(
    .INIT(1'b0)) 
    \data_in_bf_2_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(weights_bf_0_0),
        .CLR(rstn),
        .D(\data_in_bf_2_reg[7]_0 [0]),
        .Q(data_in_bf_2[0]));
  FDCE #(
    .INIT(1'b0)) 
    \data_in_bf_2_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(weights_bf_0_0),
        .CLR(rstn),
        .D(\data_in_bf_2_reg[7]_0 [1]),
        .Q(data_in_bf_2[1]));
  FDCE #(
    .INIT(1'b0)) 
    \data_in_bf_2_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(weights_bf_0_0),
        .CLR(rstn),
        .D(\data_in_bf_2_reg[7]_0 [2]),
        .Q(data_in_bf_2[2]));
  FDCE #(
    .INIT(1'b0)) 
    \data_in_bf_2_reg[3] 
       (.C(clk_IBUF_BUFG),
        .CE(weights_bf_0_0),
        .CLR(rstn),
        .D(\data_in_bf_2_reg[7]_0 [3]),
        .Q(data_in_bf_2[3]));
  FDCE #(
    .INIT(1'b0)) 
    \data_in_bf_2_reg[4] 
       (.C(clk_IBUF_BUFG),
        .CE(weights_bf_0_0),
        .CLR(rstn),
        .D(\data_in_bf_2_reg[7]_0 [4]),
        .Q(data_in_bf_2[4]));
  FDCE #(
    .INIT(1'b0)) 
    \data_in_bf_2_reg[5] 
       (.C(clk_IBUF_BUFG),
        .CE(weights_bf_0_0),
        .CLR(rstn),
        .D(\data_in_bf_2_reg[7]_0 [5]),
        .Q(data_in_bf_2[5]));
  FDCE #(
    .INIT(1'b0)) 
    \data_in_bf_2_reg[6] 
       (.C(clk_IBUF_BUFG),
        .CE(weights_bf_0_0),
        .CLR(rstn),
        .D(\data_in_bf_2_reg[7]_0 [6]),
        .Q(data_in_bf_2[6]));
  FDCE #(
    .INIT(1'b0)) 
    \data_in_bf_2_reg[7] 
       (.C(clk_IBUF_BUFG),
        .CE(weights_bf_0_0),
        .CLR(rstn),
        .D(\data_in_bf_2_reg[7]_0 [7]),
        .Q(data_in_bf_2[7]));
  LUT3 #(
    .INIT(8'hDC)) 
    done_i_1
       (.I0(\FSM_onehot_state_reg_n_0_[0] ),
        .I1(out_temp),
        .I2(mac_done),
        .O(done_i_1_n_0));
  FDCE #(
    .INIT(1'b0)) 
    done_reg
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(rstn),
        .D(done_i_1_n_0),
        .Q(mac_done));
  LUT5 #(
    .INIT(32'hBBBF8880)) 
    flag_accu_i_1
       (.I0(flag_accu),
        .I1(rstn_IBUF),
        .I2(flag_accu_i_2_n_0),
        .I3(weights_bf_0_0),
        .I4(flag_accu_reg_n_0),
        .O(flag_accu_i_1_n_0));
  LUT5 #(
    .INIT(32'h20000000)) 
    flag_accu_i_2
       (.I0(flag_accu),
        .I1(flag_accu_reg_n_0),
        .I2(\index_reg_n_0_[1] ),
        .I3(\index_reg_n_0_[2] ),
        .I4(\index_reg_n_0_[0] ),
        .O(flag_accu_i_2_n_0));
  FDRE #(
    .INIT(1'b0)) 
    flag_accu_reg
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(flag_accu_i_1_n_0),
        .Q(flag_accu_reg_n_0),
        .R(1'b0));
  LUT1 #(
    .INIT(2'h1)) 
    i__carry__0_i_1
       (.I0(weights_bf_1[7]),
        .O(i__carry__0_i_1_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    i__carry__0_i_1__0
       (.I0(weights_bf_0[7]),
        .O(i__carry__0_i_1__0_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    i__carry__0_i_1__1
       (.I0(weights_bf_0[7]),
        .O(i__carry__0_i_1__1_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    i__carry__0_i_1__2
       (.I0(weights_bf_2[7]),
        .I1(\_inferred__6/i__carry__0_n_4 ),
        .O(i__carry__0_i_1__2_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    i__carry__0_i_2
       (.I0(\_inferred__6/i__carry__0_n_5 ),
        .I1(weights_bf_2[6]),
        .O(i__carry__0_i_2_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    i__carry__0_i_2__0
       (.I0(weights_bf_1[7]),
        .I1(weights_bf_2[7]),
        .O(i__carry__0_i_2__0_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    i__carry__0_i_2__1
       (.I0(weights_bf_0[7]),
        .I1(weights_bf_1[7]),
        .O(i__carry__0_i_2__1_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    i__carry__0_i_2__2
       (.I0(weights_bf_0[7]),
        .I1(weights_bf_2[7]),
        .O(i__carry__0_i_2__2_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    i__carry__0_i_3
       (.I0(weights_bf_1[6]),
        .I1(weights_bf_2[6]),
        .O(i__carry__0_i_3_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    i__carry__0_i_3__0
       (.I0(weights_bf_0[6]),
        .I1(weights_bf_2[6]),
        .O(i__carry__0_i_3__0_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    i__carry__0_i_3__1
       (.I0(weights_bf_0[6]),
        .I1(weights_bf_1[6]),
        .O(i__carry__0_i_3__1_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    i__carry__0_i_3__2
       (.I0(\_inferred__6/i__carry__0_n_6 ),
        .I1(weights_bf_2[5]),
        .O(i__carry__0_i_3__2_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    i__carry__0_i_4
       (.I0(weights_bf_1[5]),
        .I1(weights_bf_2[5]),
        .O(i__carry__0_i_4_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    i__carry__0_i_4__0
       (.I0(weights_bf_0[5]),
        .I1(weights_bf_2[5]),
        .O(i__carry__0_i_4__0_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    i__carry__0_i_4__1
       (.I0(weights_bf_0[5]),
        .I1(weights_bf_1[5]),
        .O(i__carry__0_i_4__1_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    i__carry__0_i_4__2
       (.I0(\_inferred__6/i__carry__0_n_7 ),
        .I1(weights_bf_2[4]),
        .O(i__carry__0_i_4__2_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    i__carry__0_i_5
       (.I0(weights_bf_1[4]),
        .I1(weights_bf_2[4]),
        .O(i__carry__0_i_5_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    i__carry__0_i_5__0
       (.I0(weights_bf_0[4]),
        .I1(weights_bf_2[4]),
        .O(i__carry__0_i_5__0_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    i__carry__0_i_5__1
       (.I0(weights_bf_0[4]),
        .I1(weights_bf_1[4]),
        .O(i__carry__0_i_5__1_n_0));
  CARRY4 i__carry__1_i_1
       (.CI(\_inferred__6/i__carry__0_n_0 ),
        .CO({NLW_i__carry__1_i_1_CO_UNCONNECTED[3:1],i__carry__1_i_1_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(NLW_i__carry__1_i_1_O_UNCONNECTED[3:0]),
        .S({1'b0,1'b0,1'b0,1'b1}));
  LUT2 #(
    .INIT(4'h9)) 
    i__carry__1_i_2
       (.I0(weights_bf_2[7]),
        .I1(i__carry__1_i_1_n_3),
        .O(i__carry__1_i_2_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    i__carry_i_1
       (.I0(weights_bf_1[3]),
        .I1(weights_bf_2[3]),
        .O(i__carry_i_1_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    i__carry_i_1__0
       (.I0(weights_bf_0[3]),
        .I1(weights_bf_2[3]),
        .O(i__carry_i_1__0_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    i__carry_i_1__1
       (.I0(weights_bf_0[3]),
        .I1(weights_bf_1[3]),
        .O(i__carry_i_1__1_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    i__carry_i_1__2
       (.I0(\_inferred__6/i__carry_n_4 ),
        .I1(weights_bf_2[3]),
        .O(i__carry_i_1__2_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    i__carry_i_2
       (.I0(weights_bf_1[2]),
        .I1(weights_bf_2[2]),
        .O(i__carry_i_2_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    i__carry_i_2__0
       (.I0(weights_bf_0[2]),
        .I1(weights_bf_2[2]),
        .O(i__carry_i_2__0_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    i__carry_i_2__1
       (.I0(weights_bf_0[2]),
        .I1(weights_bf_1[2]),
        .O(i__carry_i_2__1_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    i__carry_i_2__2
       (.I0(\_inferred__6/i__carry_n_5 ),
        .I1(weights_bf_2[2]),
        .O(i__carry_i_2__2_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    i__carry_i_3
       (.I0(weights_bf_1[1]),
        .I1(weights_bf_2[1]),
        .O(i__carry_i_3_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    i__carry_i_3__0
       (.I0(weights_bf_0[1]),
        .I1(weights_bf_2[1]),
        .O(i__carry_i_3__0_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    i__carry_i_3__1
       (.I0(weights_bf_0[1]),
        .I1(weights_bf_1[1]),
        .O(i__carry_i_3__1_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    i__carry_i_3__2
       (.I0(\_inferred__6/i__carry_n_6 ),
        .I1(weights_bf_2[1]),
        .O(i__carry_i_3__2_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    i__carry_i_4
       (.I0(weights_bf_1[0]),
        .I1(weights_bf_2[0]),
        .O(i__carry_i_4_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    i__carry_i_4__0
       (.I0(weights_bf_0[0]),
        .I1(weights_bf_2[0]),
        .O(i__carry_i_4__0_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    i__carry_i_4__1
       (.I0(weights_bf_0[0]),
        .I1(weights_bf_1[0]),
        .O(i__carry_i_4__1_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    i__carry_i_4__2
       (.I0(\_inferred__6/i__carry_n_7 ),
        .I1(weights_bf_2[0]),
        .O(i__carry_i_4__2_n_0));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT5 #(
    .INIT(32'h55F78808)) 
    \index[0]_i_1 
       (.I0(rstn_IBUF),
        .I1(flag_accu),
        .I2(flag_accu_reg_n_0),
        .I3(\FSM_onehot_state_reg_n_0_[0] ),
        .I4(\index_reg_n_0_[0] ),
        .O(\index[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h7373FF7F80800080)) 
    \index[1]_i_1 
       (.I0(\index_reg_n_0_[0] ),
        .I1(rstn_IBUF),
        .I2(flag_accu),
        .I3(flag_accu_reg_n_0),
        .I4(\FSM_onehot_state_reg_n_0_[0] ),
        .I5(\index_reg_n_0_[1] ),
        .O(\index[1]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h2AFF8000)) 
    \index[2]_i_1 
       (.I0(flag_accu),
        .I1(\index_reg_n_0_[1] ),
        .I2(\index_reg_n_0_[0] ),
        .I3(\index[2]_i_2_n_0 ),
        .I4(\index_reg_n_0_[2] ),
        .O(\index[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT4 #(
    .INIT(16'hAA08)) 
    \index[2]_i_2 
       (.I0(rstn_IBUF),
        .I1(flag_accu),
        .I2(flag_accu_reg_n_0),
        .I3(\FSM_onehot_state_reg_n_0_[0] ),
        .O(\index[2]_i_2_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \index_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\index[0]_i_1_n_0 ),
        .Q(\index_reg_n_0_[0] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \index_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\index[1]_i_1_n_0 ),
        .Q(\index_reg_n_0_[1] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \index_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\index[2]_i_1_n_0 ),
        .Q(\index_reg_n_0_[2] ),
        .R(1'b0));
  CARRY4 out0_carry
       (.CI(1'b0),
        .CO({out0_carry_n_0,out0_carry_n_1,out0_carry_n_2,out0_carry_n_3}),
        .CYINIT(1'b0),
        .DI({\accu_bf[6]__58_carry_n_4 ,\accu_bf[6]__58_carry_n_5 ,\accu_bf[6]__58_carry_n_6 ,\accu_bf[6]__58_carry_n_7 }),
        .O({out0_carry_n_4,out0_carry_n_5,out0_carry_n_6,out0_carry_n_7}),
        .S({out0_carry_i_1_n_0,out0_carry_i_2_n_0,out0_carry_i_3_n_0,out0_carry_i_4_n_0}));
  CARRY4 out0_carry__0
       (.CI(out0_carry_n_0),
        .CO({out0_carry__0_n_0,out0_carry__0_n_1,out0_carry__0_n_2,out0_carry__0_n_3}),
        .CYINIT(1'b0),
        .DI({\accu_bf[6]__58_carry__0_n_4 ,\accu_bf[6]__58_carry__0_n_5 ,\accu_bf[6]__58_carry__0_n_6 ,\accu_bf[6]__58_carry__0_n_7 }),
        .O({out0_carry__0_n_4,out0_carry__0_n_5,out0_carry__0_n_6,out0_carry__0_n_7}),
        .S({out0_carry__0_i_1_n_0,out0_carry__0_i_2_n_0,out0_carry__0_i_3_n_0,out0_carry__0_i_4_n_0}));
  LUT2 #(
    .INIT(4'h6)) 
    out0_carry__0_i_1
       (.I0(\accu_bf[6]__58_carry__0_n_4 ),
        .I1(prev_sum_bf[7]),
        .O(out0_carry__0_i_1_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    out0_carry__0_i_2
       (.I0(\accu_bf[6]__58_carry__0_n_5 ),
        .I1(prev_sum_bf[6]),
        .O(out0_carry__0_i_2_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    out0_carry__0_i_3
       (.I0(\accu_bf[6]__58_carry__0_n_6 ),
        .I1(prev_sum_bf[5]),
        .O(out0_carry__0_i_3_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    out0_carry__0_i_4
       (.I0(\accu_bf[6]__58_carry__0_n_7 ),
        .I1(prev_sum_bf[4]),
        .O(out0_carry__0_i_4_n_0));
  CARRY4 out0_carry__1
       (.CI(out0_carry__0_n_0),
        .CO({out0_carry__1_n_0,out0_carry__1_n_1,out0_carry__1_n_2,out0_carry__1_n_3}),
        .CYINIT(1'b0),
        .DI({prev_sum_bf[10:9],out0_carry__1_i_1_n_0,\accu_bf[6]__58_carry__1_n_7 }),
        .O({out0_carry__1_n_4,out0_carry__1_n_5,out0_carry__1_n_6,out0_carry__1_n_7}),
        .S({out0_carry__1_i_2_n_0,out0_carry__1_i_3_n_0,out0_carry__1_i_4_n_0,out0_carry__1_i_5_n_0}));
  LUT1 #(
    .INIT(2'h1)) 
    out0_carry__1_i_1
       (.I0(prev_sum_bf[9]),
        .O(out0_carry__1_i_1_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    out0_carry__1_i_2
       (.I0(prev_sum_bf[10]),
        .I1(prev_sum_bf[11]),
        .O(out0_carry__1_i_2_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    out0_carry__1_i_3
       (.I0(prev_sum_bf[9]),
        .I1(prev_sum_bf[10]),
        .O(out0_carry__1_i_3_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    out0_carry__1_i_4
       (.I0(prev_sum_bf[9]),
        .I1(\accu_bf[6]__58_carry__1_n_6 ),
        .O(out0_carry__1_i_4_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    out0_carry__1_i_5
       (.I0(\accu_bf[6]__58_carry__1_n_7 ),
        .I1(prev_sum_bf[8]),
        .O(out0_carry__1_i_5_n_0));
  CARRY4 out0_carry__2
       (.CI(out0_carry__1_n_0),
        .CO({out0_carry__2_n_0,out0_carry__2_n_1,out0_carry__2_n_2,out0_carry__2_n_3}),
        .CYINIT(1'b0),
        .DI(prev_sum_bf[14:11]),
        .O({out0_carry__2_n_4,out0_carry__2_n_5,out0_carry__2_n_6,out0_carry__2_n_7}),
        .S({out0_carry__2_i_1_n_0,out0_carry__2_i_2_n_0,out0_carry__2_i_3_n_0,out0_carry__2_i_4_n_0}));
  LUT2 #(
    .INIT(4'h9)) 
    out0_carry__2_i_1
       (.I0(prev_sum_bf[14]),
        .I1(prev_sum_bf[15]),
        .O(out0_carry__2_i_1_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    out0_carry__2_i_2
       (.I0(prev_sum_bf[13]),
        .I1(prev_sum_bf[14]),
        .O(out0_carry__2_i_2_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    out0_carry__2_i_3
       (.I0(prev_sum_bf[12]),
        .I1(prev_sum_bf[13]),
        .O(out0_carry__2_i_3_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    out0_carry__2_i_4
       (.I0(prev_sum_bf[11]),
        .I1(prev_sum_bf[12]),
        .O(out0_carry__2_i_4_n_0));
  CARRY4 out0_carry__3
       (.CI(out0_carry__2_n_0),
        .CO({NLW_out0_carry__3_CO_UNCONNECTED[3],out0_carry__3_n_1,out0_carry__3_n_2,out0_carry__3_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,prev_sum_bf[17:15]}),
        .O({out0_carry__3_n_4,out0_carry__3_n_5,out0_carry__3_n_6,out0_carry__3_n_7}),
        .S({1'b1,out0_carry__3_i_1_n_0,out0_carry__3_i_2_n_0,out0_carry__3_i_3_n_0}));
  LUT2 #(
    .INIT(4'h9)) 
    out0_carry__3_i_1
       (.I0(prev_sum_bf[17]),
        .I1(prev_sum_bf[18]),
        .O(out0_carry__3_i_1_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    out0_carry__3_i_2
       (.I0(prev_sum_bf[16]),
        .I1(prev_sum_bf[17]),
        .O(out0_carry__3_i_2_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    out0_carry__3_i_3
       (.I0(prev_sum_bf[15]),
        .I1(prev_sum_bf[16]),
        .O(out0_carry__3_i_3_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    out0_carry_i_1
       (.I0(\accu_bf[6]__58_carry_n_4 ),
        .I1(prev_sum_bf[3]),
        .O(out0_carry_i_1_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    out0_carry_i_2
       (.I0(\accu_bf[6]__58_carry_n_5 ),
        .I1(prev_sum_bf[2]),
        .O(out0_carry_i_2_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    out0_carry_i_3
       (.I0(\accu_bf[6]__58_carry_n_6 ),
        .I1(prev_sum_bf[1]),
        .O(out0_carry_i_3_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    out0_carry_i_4
       (.I0(\accu_bf[6]__58_carry_n_7 ),
        .I1(prev_sum_bf[0]),
        .O(out0_carry_i_4_n_0));
  FDCE #(
    .INIT(1'b0)) 
    \out_temp_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(out_temp),
        .CLR(rstn),
        .D(out0_carry_n_7),
        .Q(\out_temp_reg[19]_0 [0]));
  FDCE #(
    .INIT(1'b0)) 
    \out_temp_reg[10] 
       (.C(clk_IBUF_BUFG),
        .CE(out_temp),
        .CLR(rstn),
        .D(out0_carry__1_n_5),
        .Q(\out_temp_reg[19]_0 [10]));
  FDCE #(
    .INIT(1'b0)) 
    \out_temp_reg[11] 
       (.C(clk_IBUF_BUFG),
        .CE(out_temp),
        .CLR(rstn),
        .D(out0_carry__1_n_4),
        .Q(\out_temp_reg[19]_0 [11]));
  FDCE #(
    .INIT(1'b0)) 
    \out_temp_reg[12] 
       (.C(clk_IBUF_BUFG),
        .CE(out_temp),
        .CLR(rstn),
        .D(out0_carry__2_n_7),
        .Q(\out_temp_reg[19]_0 [12]));
  FDCE #(
    .INIT(1'b0)) 
    \out_temp_reg[13] 
       (.C(clk_IBUF_BUFG),
        .CE(out_temp),
        .CLR(rstn),
        .D(out0_carry__2_n_6),
        .Q(\out_temp_reg[19]_0 [13]));
  FDCE #(
    .INIT(1'b0)) 
    \out_temp_reg[14] 
       (.C(clk_IBUF_BUFG),
        .CE(out_temp),
        .CLR(rstn),
        .D(out0_carry__2_n_5),
        .Q(\out_temp_reg[19]_0 [14]));
  FDCE #(
    .INIT(1'b0)) 
    \out_temp_reg[15] 
       (.C(clk_IBUF_BUFG),
        .CE(out_temp),
        .CLR(rstn),
        .D(out0_carry__2_n_4),
        .Q(\out_temp_reg[19]_0 [15]));
  FDCE #(
    .INIT(1'b0)) 
    \out_temp_reg[16] 
       (.C(clk_IBUF_BUFG),
        .CE(out_temp),
        .CLR(rstn),
        .D(out0_carry__3_n_7),
        .Q(\out_temp_reg[19]_0 [16]));
  FDCE #(
    .INIT(1'b0)) 
    \out_temp_reg[17] 
       (.C(clk_IBUF_BUFG),
        .CE(out_temp),
        .CLR(rstn),
        .D(out0_carry__3_n_6),
        .Q(\out_temp_reg[19]_0 [17]));
  FDCE #(
    .INIT(1'b0)) 
    \out_temp_reg[18] 
       (.C(clk_IBUF_BUFG),
        .CE(out_temp),
        .CLR(rstn),
        .D(out0_carry__3_n_5),
        .Q(\out_temp_reg[19]_0 [18]));
  FDCE #(
    .INIT(1'b0)) 
    \out_temp_reg[19] 
       (.C(clk_IBUF_BUFG),
        .CE(out_temp),
        .CLR(rstn),
        .D(out0_carry__3_n_4),
        .Q(\out_temp_reg[19]_0 [19]));
  FDCE #(
    .INIT(1'b0)) 
    \out_temp_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(out_temp),
        .CLR(rstn),
        .D(out0_carry_n_6),
        .Q(\out_temp_reg[19]_0 [1]));
  FDCE #(
    .INIT(1'b0)) 
    \out_temp_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(out_temp),
        .CLR(rstn),
        .D(out0_carry_n_5),
        .Q(\out_temp_reg[19]_0 [2]));
  FDCE #(
    .INIT(1'b0)) 
    \out_temp_reg[3] 
       (.C(clk_IBUF_BUFG),
        .CE(out_temp),
        .CLR(rstn),
        .D(out0_carry_n_4),
        .Q(\out_temp_reg[19]_0 [3]));
  FDCE #(
    .INIT(1'b0)) 
    \out_temp_reg[4] 
       (.C(clk_IBUF_BUFG),
        .CE(out_temp),
        .CLR(rstn),
        .D(out0_carry__0_n_7),
        .Q(\out_temp_reg[19]_0 [4]));
  FDCE #(
    .INIT(1'b0)) 
    \out_temp_reg[5] 
       (.C(clk_IBUF_BUFG),
        .CE(out_temp),
        .CLR(rstn),
        .D(out0_carry__0_n_6),
        .Q(\out_temp_reg[19]_0 [5]));
  FDCE #(
    .INIT(1'b0)) 
    \out_temp_reg[6] 
       (.C(clk_IBUF_BUFG),
        .CE(out_temp),
        .CLR(rstn),
        .D(out0_carry__0_n_5),
        .Q(\out_temp_reg[19]_0 [6]));
  FDCE #(
    .INIT(1'b0)) 
    \out_temp_reg[7] 
       (.C(clk_IBUF_BUFG),
        .CE(out_temp),
        .CLR(rstn),
        .D(out0_carry__0_n_4),
        .Q(\out_temp_reg[19]_0 [7]));
  FDCE #(
    .INIT(1'b0)) 
    \out_temp_reg[8] 
       (.C(clk_IBUF_BUFG),
        .CE(out_temp),
        .CLR(rstn),
        .D(out0_carry__1_n_7),
        .Q(\out_temp_reg[19]_0 [8]));
  FDCE #(
    .INIT(1'b0)) 
    \out_temp_reg[9] 
       (.C(clk_IBUF_BUFG),
        .CE(out_temp),
        .CLR(rstn),
        .D(out0_carry__1_n_6),
        .Q(\out_temp_reg[19]_0 [9]));
  LUT3 #(
    .INIT(8'h20)) 
    \prev_sum_bf[18]_i_1 
       (.I0(\FSM_onehot_state_reg_n_0_[0] ),
        .I1(mac_done),
        .I2(\FSM_onehot_state_reg[2]_0 ),
        .O(weights_bf_0_0));
  FDCE #(
    .INIT(1'b0)) 
    \prev_sum_bf_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(weights_bf_0_0),
        .CLR(rstn),
        .D(Q[0]),
        .Q(prev_sum_bf[0]));
  FDCE #(
    .INIT(1'b0)) 
    \prev_sum_bf_reg[10] 
       (.C(clk_IBUF_BUFG),
        .CE(weights_bf_0_0),
        .CLR(rstn),
        .D(Q[10]),
        .Q(prev_sum_bf[10]));
  FDCE #(
    .INIT(1'b0)) 
    \prev_sum_bf_reg[11] 
       (.C(clk_IBUF_BUFG),
        .CE(weights_bf_0_0),
        .CLR(rstn),
        .D(Q[11]),
        .Q(prev_sum_bf[11]));
  FDCE #(
    .INIT(1'b0)) 
    \prev_sum_bf_reg[12] 
       (.C(clk_IBUF_BUFG),
        .CE(weights_bf_0_0),
        .CLR(rstn),
        .D(Q[12]),
        .Q(prev_sum_bf[12]));
  FDCE #(
    .INIT(1'b0)) 
    \prev_sum_bf_reg[13] 
       (.C(clk_IBUF_BUFG),
        .CE(weights_bf_0_0),
        .CLR(rstn),
        .D(Q[13]),
        .Q(prev_sum_bf[13]));
  FDCE #(
    .INIT(1'b0)) 
    \prev_sum_bf_reg[14] 
       (.C(clk_IBUF_BUFG),
        .CE(weights_bf_0_0),
        .CLR(rstn),
        .D(Q[14]),
        .Q(prev_sum_bf[14]));
  FDCE #(
    .INIT(1'b0)) 
    \prev_sum_bf_reg[15] 
       (.C(clk_IBUF_BUFG),
        .CE(weights_bf_0_0),
        .CLR(rstn),
        .D(Q[15]),
        .Q(prev_sum_bf[15]));
  FDCE #(
    .INIT(1'b0)) 
    \prev_sum_bf_reg[16] 
       (.C(clk_IBUF_BUFG),
        .CE(weights_bf_0_0),
        .CLR(rstn),
        .D(Q[16]),
        .Q(prev_sum_bf[16]));
  FDCE #(
    .INIT(1'b0)) 
    \prev_sum_bf_reg[17] 
       (.C(clk_IBUF_BUFG),
        .CE(weights_bf_0_0),
        .CLR(rstn),
        .D(Q[17]),
        .Q(prev_sum_bf[17]));
  FDCE #(
    .INIT(1'b0)) 
    \prev_sum_bf_reg[18] 
       (.C(clk_IBUF_BUFG),
        .CE(weights_bf_0_0),
        .CLR(rstn),
        .D(Q[18]),
        .Q(prev_sum_bf[18]));
  FDCE #(
    .INIT(1'b0)) 
    \prev_sum_bf_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(weights_bf_0_0),
        .CLR(rstn),
        .D(Q[1]),
        .Q(prev_sum_bf[1]));
  FDCE #(
    .INIT(1'b0)) 
    \prev_sum_bf_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(weights_bf_0_0),
        .CLR(rstn),
        .D(Q[2]),
        .Q(prev_sum_bf[2]));
  FDCE #(
    .INIT(1'b0)) 
    \prev_sum_bf_reg[3] 
       (.C(clk_IBUF_BUFG),
        .CE(weights_bf_0_0),
        .CLR(rstn),
        .D(Q[3]),
        .Q(prev_sum_bf[3]));
  FDCE #(
    .INIT(1'b0)) 
    \prev_sum_bf_reg[4] 
       (.C(clk_IBUF_BUFG),
        .CE(weights_bf_0_0),
        .CLR(rstn),
        .D(Q[4]),
        .Q(prev_sum_bf[4]));
  FDCE #(
    .INIT(1'b0)) 
    \prev_sum_bf_reg[5] 
       (.C(clk_IBUF_BUFG),
        .CE(weights_bf_0_0),
        .CLR(rstn),
        .D(Q[5]),
        .Q(prev_sum_bf[5]));
  FDCE #(
    .INIT(1'b0)) 
    \prev_sum_bf_reg[6] 
       (.C(clk_IBUF_BUFG),
        .CE(weights_bf_0_0),
        .CLR(rstn),
        .D(Q[6]),
        .Q(prev_sum_bf[6]));
  FDCE #(
    .INIT(1'b0)) 
    \prev_sum_bf_reg[7] 
       (.C(clk_IBUF_BUFG),
        .CE(weights_bf_0_0),
        .CLR(rstn),
        .D(Q[7]),
        .Q(prev_sum_bf[7]));
  FDCE #(
    .INIT(1'b0)) 
    \prev_sum_bf_reg[8] 
       (.C(clk_IBUF_BUFG),
        .CE(weights_bf_0_0),
        .CLR(rstn),
        .D(Q[8]),
        .Q(prev_sum_bf[8]));
  FDCE #(
    .INIT(1'b0)) 
    \prev_sum_bf_reg[9] 
       (.C(clk_IBUF_BUFG),
        .CE(weights_bf_0_0),
        .CLR(rstn),
        .D(Q[9]),
        .Q(prev_sum_bf[9]));
  LUT4 #(
    .INIT(16'hF4A0)) 
    run_done_i_1
       (.I0(state[0]),
        .I1(mac_done),
        .I2(run_done_reg),
        .I3(state[1]),
        .O(\FSM_sequential_state_reg[0] ));
  LUT6 #(
    .INIT(64'h0000000200000000)) 
    \sum_arr_bf[0][9]_i_1 
       (.I0(rstn_IBUF),
        .I1(\index_reg_n_0_[1] ),
        .I2(\index_reg_n_0_[0] ),
        .I3(\index_reg_n_0_[2] ),
        .I4(flag_accu_reg_n_0),
        .I5(flag_accu),
        .O(\sum_arr_bf[0][9]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000020000000000)) 
    \sum_arr_bf[1][9]_i_1 
       (.I0(rstn_IBUF),
        .I1(\index_reg_n_0_[1] ),
        .I2(\index_reg_n_0_[2] ),
        .I3(\index_reg_n_0_[0] ),
        .I4(flag_accu_reg_n_0),
        .I5(flag_accu),
        .O(\sum_arr_bf[1][9]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000020000000000)) 
    \sum_arr_bf[2][9]_i_1 
       (.I0(rstn_IBUF),
        .I1(\index_reg_n_0_[0] ),
        .I2(\index_reg_n_0_[2] ),
        .I3(\index_reg_n_0_[1] ),
        .I4(flag_accu_reg_n_0),
        .I5(flag_accu),
        .O(\sum_arr_bf[2][9]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000008000000000)) 
    \sum_arr_bf[3][9]_i_1 
       (.I0(rstn_IBUF),
        .I1(\index_reg_n_0_[1] ),
        .I2(\index_reg_n_0_[0] ),
        .I3(\index_reg_n_0_[2] ),
        .I4(flag_accu_reg_n_0),
        .I5(flag_accu),
        .O(\sum_arr_bf[3][9]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000020000000000)) 
    \sum_arr_bf[4][9]_i_1 
       (.I0(rstn_IBUF),
        .I1(\index_reg_n_0_[1] ),
        .I2(\index_reg_n_0_[0] ),
        .I3(\index_reg_n_0_[2] ),
        .I4(flag_accu_reg_n_0),
        .I5(flag_accu),
        .O(\sum_arr_bf[4][9]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000008000000000)) 
    \sum_arr_bf[5][9]_i_1 
       (.I0(rstn_IBUF),
        .I1(\index_reg_n_0_[2] ),
        .I2(\index_reg_n_0_[0] ),
        .I3(\index_reg_n_0_[1] ),
        .I4(flag_accu_reg_n_0),
        .I5(flag_accu),
        .O(\sum_arr_bf[5][9]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000008000000000)) 
    \sum_arr_bf[6][9]_i_1 
       (.I0(rstn_IBUF),
        .I1(\index_reg_n_0_[1] ),
        .I2(\index_reg_n_0_[2] ),
        .I3(\index_reg_n_0_[0] ),
        .I4(flag_accu_reg_n_0),
        .I5(flag_accu),
        .O(\sum_arr_bf[6][9]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h00000200)) 
    \sum_arr_bf[7][0]_i_4 
       (.I0(sel0[0]),
        .I1(\index_reg_n_0_[0] ),
        .I2(\index_reg_n_0_[2] ),
        .I3(weights_bf_2[0]),
        .I4(\index_reg_n_0_[1] ),
        .O(\sum_arr_bf[7][0]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000000B08)) 
    \sum_arr_bf[7][0]_i_5 
       (.I0(p_0_in[0]),
        .I1(sel0[0]),
        .I2(\index_reg_n_0_[1] ),
        .I3(weights_bf_1[0]),
        .I4(\index_reg_n_0_[2] ),
        .I5(\index_reg_n_0_[0] ),
        .O(\sum_arr_bf[7][0]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000000B08)) 
    \sum_arr_bf[7][0]_i_6 
       (.I0(\_inferred__4/i__carry_n_7 ),
        .I1(sel0[0]),
        .I2(\index_reg_n_0_[1] ),
        .I3(weights_bf_0[0]),
        .I4(\index_reg_n_0_[2] ),
        .I5(\index_reg_n_0_[0] ),
        .O(\sum_arr_bf[7][0]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000000B08)) 
    \sum_arr_bf[7][0]_i_7 
       (.I0(\_inferred__8/i__carry_n_7 ),
        .I1(sel0[0]),
        .I2(\index_reg_n_0_[1] ),
        .I3(\_inferred__6/i__carry_n_7 ),
        .I4(\index_reg_n_0_[2] ),
        .I5(\index_reg_n_0_[0] ),
        .O(\sum_arr_bf[7][0]_i_7_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \sum_arr_bf[7][1]_i_1 
       (.I0(\sum_arr_bf_reg[7][1]_i_2_n_0 ),
        .I1(\sum_arr_bf_reg[7][1]_i_3_n_0 ),
        .I2(sel0[2]),
        .I3(\sum_arr_bf_reg[7][1]_i_4_n_0 ),
        .I4(sel0[1]),
        .I5(\sum_arr_bf[7][1]_i_5_n_0 ),
        .O(sum_arr_bf[1]));
  LUT5 #(
    .INIT(32'h00000B08)) 
    \sum_arr_bf[7][1]_i_10 
       (.I0(weights_bf_1[0]),
        .I1(\index_reg_n_0_[0] ),
        .I2(\index_reg_n_0_[2] ),
        .I3(weights_bf_1[1]),
        .I4(\index_reg_n_0_[1] ),
        .O(data1[1]));
  LUT5 #(
    .INIT(32'h00000B08)) 
    \sum_arr_bf[7][1]_i_11 
       (.I0(p_0_in[0]),
        .I1(\index_reg_n_0_[0] ),
        .I2(\index_reg_n_0_[2] ),
        .I3(p_0_in[1]),
        .I4(\index_reg_n_0_[1] ),
        .O(data2[1]));
  LUT6 #(
    .INIT(64'h0022002000000020)) 
    \sum_arr_bf[7][1]_i_5 
       (.I0(sel0[0]),
        .I1(\index_reg_n_0_[1] ),
        .I2(weights_bf_2[1]),
        .I3(\index_reg_n_0_[2] ),
        .I4(\index_reg_n_0_[0] ),
        .I5(weights_bf_2[0]),
        .O(\sum_arr_bf[7][1]_i_5_n_0 ));
  LUT5 #(
    .INIT(32'h00000B08)) 
    \sum_arr_bf[7][1]_i_6 
       (.I0(\_inferred__6/i__carry_n_7 ),
        .I1(\index_reg_n_0_[0] ),
        .I2(\index_reg_n_0_[2] ),
        .I3(\_inferred__6/i__carry_n_6 ),
        .I4(\index_reg_n_0_[1] ),
        .O(data5[1]));
  LUT5 #(
    .INIT(32'h00000B08)) 
    \sum_arr_bf[7][1]_i_7 
       (.I0(\_inferred__8/i__carry_n_7 ),
        .I1(\index_reg_n_0_[0] ),
        .I2(\index_reg_n_0_[2] ),
        .I3(\_inferred__8/i__carry_n_6 ),
        .I4(\index_reg_n_0_[1] ),
        .O(data6[1]));
  LUT5 #(
    .INIT(32'h00000B08)) 
    \sum_arr_bf[7][1]_i_8 
       (.I0(weights_bf_0[0]),
        .I1(\index_reg_n_0_[0] ),
        .I2(\index_reg_n_0_[2] ),
        .I3(weights_bf_0[1]),
        .I4(\index_reg_n_0_[1] ),
        .O(data3[1]));
  LUT5 #(
    .INIT(32'h00000B08)) 
    \sum_arr_bf[7][1]_i_9 
       (.I0(\_inferred__4/i__carry_n_7 ),
        .I1(\index_reg_n_0_[0] ),
        .I2(\index_reg_n_0_[2] ),
        .I3(\_inferred__4/i__carry_n_6 ),
        .I4(\index_reg_n_0_[1] ),
        .O(data4[1]));
  LUT6 #(
    .INIT(64'hB8BBB888B888B888)) 
    \sum_arr_bf[7][2]_i_1 
       (.I0(\sum_arr_bf_reg[7][2]_i_2_n_0 ),
        .I1(sel0[2]),
        .I2(\sum_arr_bf_reg[7][2]_i_3_n_0 ),
        .I3(sel0[1]),
        .I4(sel0[0]),
        .I5(data0),
        .O(sum_arr_bf[2]));
  LUT6 #(
    .INIT(64'h0000000030BB3088)) 
    \sum_arr_bf[7][2]_i_10 
       (.I0(p_0_in[1]),
        .I1(\index_reg_n_0_[0] ),
        .I2(p_0_in[0]),
        .I3(\index_reg_n_0_[1] ),
        .I4(p_0_in[2]),
        .I5(\index_reg_n_0_[2] ),
        .O(data2[2]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \sum_arr_bf[7][2]_i_11 
       (.I0(data_in_bf_1[3]),
        .I1(data_in_bf_1[2]),
        .I2(\index_reg_n_0_[1] ),
        .I3(data_in_bf_1[1]),
        .I4(\index_reg_n_0_[0] ),
        .I5(data_in_bf_1[0]),
        .O(\sum_arr_bf[7][2]_i_11_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \sum_arr_bf[7][2]_i_12 
       (.I0(data_in_bf_1[7]),
        .I1(data_in_bf_1[6]),
        .I2(\index_reg_n_0_[1] ),
        .I3(data_in_bf_1[5]),
        .I4(\index_reg_n_0_[0] ),
        .I5(data_in_bf_1[4]),
        .O(\sum_arr_bf[7][2]_i_12_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \sum_arr_bf[7][2]_i_13 
       (.I0(data_in_bf_2[3]),
        .I1(data_in_bf_2[2]),
        .I2(\index_reg_n_0_[1] ),
        .I3(data_in_bf_2[1]),
        .I4(\index_reg_n_0_[0] ),
        .I5(data_in_bf_2[0]),
        .O(\sum_arr_bf[7][2]_i_13_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \sum_arr_bf[7][2]_i_14 
       (.I0(data_in_bf_2[7]),
        .I1(data_in_bf_2[6]),
        .I2(\index_reg_n_0_[1] ),
        .I3(data_in_bf_2[5]),
        .I4(\index_reg_n_0_[0] ),
        .I5(data_in_bf_2[4]),
        .O(\sum_arr_bf[7][2]_i_14_n_0 ));
  LUT6 #(
    .INIT(64'h0000000030BB3088)) 
    \sum_arr_bf[7][2]_i_15 
       (.I0(weights_bf_0[1]),
        .I1(\index_reg_n_0_[0] ),
        .I2(weights_bf_0[0]),
        .I3(\index_reg_n_0_[1] ),
        .I4(weights_bf_0[2]),
        .I5(\index_reg_n_0_[2] ),
        .O(data3[2]));
  LUT6 #(
    .INIT(64'h0000000030BB3088)) 
    \sum_arr_bf[7][2]_i_16 
       (.I0(\_inferred__4/i__carry_n_6 ),
        .I1(\index_reg_n_0_[0] ),
        .I2(\_inferred__4/i__carry_n_7 ),
        .I3(\index_reg_n_0_[1] ),
        .I4(\_inferred__4/i__carry_n_5 ),
        .I5(\index_reg_n_0_[2] ),
        .O(data4[2]));
  LUT6 #(
    .INIT(64'h0000000030BB3088)) 
    \sum_arr_bf[7][2]_i_17 
       (.I0(\_inferred__6/i__carry_n_6 ),
        .I1(\index_reg_n_0_[0] ),
        .I2(\_inferred__6/i__carry_n_7 ),
        .I3(\index_reg_n_0_[1] ),
        .I4(\_inferred__6/i__carry_n_5 ),
        .I5(\index_reg_n_0_[2] ),
        .O(data5[2]));
  LUT6 #(
    .INIT(64'h0000000030BB3088)) 
    \sum_arr_bf[7][2]_i_18 
       (.I0(\_inferred__8/i__carry_n_6 ),
        .I1(\index_reg_n_0_[0] ),
        .I2(\_inferred__8/i__carry_n_7 ),
        .I3(\index_reg_n_0_[1] ),
        .I4(\_inferred__8/i__carry_n_5 ),
        .I5(\index_reg_n_0_[2] ),
        .O(data6[2]));
  LUT6 #(
    .INIT(64'h0000000030BB3088)) 
    \sum_arr_bf[7][2]_i_6 
       (.I0(weights_bf_2[1]),
        .I1(\index_reg_n_0_[0] ),
        .I2(weights_bf_2[0]),
        .I3(\index_reg_n_0_[1] ),
        .I4(weights_bf_2[2]),
        .I5(\index_reg_n_0_[2] ),
        .O(data0));
  LUT6 #(
    .INIT(64'h0000000030BB3088)) 
    \sum_arr_bf[7][2]_i_9 
       (.I0(weights_bf_1[1]),
        .I1(\index_reg_n_0_[0] ),
        .I2(weights_bf_1[0]),
        .I3(\index_reg_n_0_[1] ),
        .I4(weights_bf_1[2]),
        .I5(\index_reg_n_0_[2] ),
        .O(data1[2]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT4 #(
    .INIT(16'h00B8)) 
    \sum_arr_bf[7][3]_i_10 
       (.I0(weights_bf_1[0]),
        .I1(\index_reg_n_0_[1] ),
        .I2(weights_bf_1[2]),
        .I3(\index_reg_n_0_[2] ),
        .O(\sum_arr_bf[7][3]_i_10_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT4 #(
    .INIT(16'h00B8)) 
    \sum_arr_bf[7][3]_i_11 
       (.I0(\_inferred__4/i__carry_n_7 ),
        .I1(\index_reg_n_0_[1] ),
        .I2(\_inferred__4/i__carry_n_5 ),
        .I3(\index_reg_n_0_[2] ),
        .O(\sum_arr_bf[7][3]_i_11_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT4 #(
    .INIT(16'h00B8)) 
    \sum_arr_bf[7][3]_i_12 
       (.I0(weights_bf_0[0]),
        .I1(\index_reg_n_0_[1] ),
        .I2(weights_bf_0[2]),
        .I3(\index_reg_n_0_[2] ),
        .O(\sum_arr_bf[7][3]_i_12_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT4 #(
    .INIT(16'h00B8)) 
    \sum_arr_bf[7][3]_i_13 
       (.I0(\_inferred__8/i__carry_n_7 ),
        .I1(\index_reg_n_0_[1] ),
        .I2(\_inferred__8/i__carry_n_5 ),
        .I3(\index_reg_n_0_[2] ),
        .O(\sum_arr_bf[7][3]_i_13_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT4 #(
    .INIT(16'h00B8)) 
    \sum_arr_bf[7][3]_i_14 
       (.I0(\_inferred__6/i__carry_n_7 ),
        .I1(\index_reg_n_0_[1] ),
        .I2(\_inferred__6/i__carry_n_5 ),
        .I3(\index_reg_n_0_[2] ),
        .O(\sum_arr_bf[7][3]_i_14_n_0 ));
  LUT4 #(
    .INIT(16'hA808)) 
    \sum_arr_bf[7][3]_i_4 
       (.I0(sel0[0]),
        .I1(\sum_arr_bf[7][4]_i_8_n_0 ),
        .I2(\index_reg_n_0_[0] ),
        .I3(\sum_arr_bf[7][3]_i_8_n_0 ),
        .O(\sum_arr_bf[7][3]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \sum_arr_bf[7][3]_i_5 
       (.I0(\sum_arr_bf[7][3]_i_9_n_0 ),
        .I1(\sum_arr_bf[7][4]_i_9_n_0 ),
        .I2(sel0[0]),
        .I3(\sum_arr_bf[7][3]_i_10_n_0 ),
        .I4(\index_reg_n_0_[0] ),
        .I5(\sum_arr_bf[7][4]_i_10_n_0 ),
        .O(\sum_arr_bf[7][3]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \sum_arr_bf[7][3]_i_6 
       (.I0(\sum_arr_bf[7][3]_i_11_n_0 ),
        .I1(\sum_arr_bf[7][4]_i_11_n_0 ),
        .I2(sel0[0]),
        .I3(\sum_arr_bf[7][3]_i_12_n_0 ),
        .I4(\index_reg_n_0_[0] ),
        .I5(\sum_arr_bf[7][4]_i_12_n_0 ),
        .O(\sum_arr_bf[7][3]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \sum_arr_bf[7][3]_i_7 
       (.I0(\sum_arr_bf[7][3]_i_13_n_0 ),
        .I1(\sum_arr_bf[7][4]_i_13_n_0 ),
        .I2(sel0[0]),
        .I3(\sum_arr_bf[7][3]_i_14_n_0 ),
        .I4(\index_reg_n_0_[0] ),
        .I5(\sum_arr_bf[7][4]_i_14_n_0 ),
        .O(\sum_arr_bf[7][3]_i_7_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT4 #(
    .INIT(16'h00B8)) 
    \sum_arr_bf[7][3]_i_8 
       (.I0(weights_bf_2[0]),
        .I1(\index_reg_n_0_[1] ),
        .I2(weights_bf_2[2]),
        .I3(\index_reg_n_0_[2] ),
        .O(\sum_arr_bf[7][3]_i_8_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT4 #(
    .INIT(16'h00B8)) 
    \sum_arr_bf[7][3]_i_9 
       (.I0(p_0_in[0]),
        .I1(\index_reg_n_0_[1] ),
        .I2(p_0_in[2]),
        .I3(\index_reg_n_0_[2] ),
        .O(\sum_arr_bf[7][3]_i_9_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT4 #(
    .INIT(16'h00B8)) 
    \sum_arr_bf[7][4]_i_10 
       (.I0(weights_bf_1[1]),
        .I1(\index_reg_n_0_[1] ),
        .I2(weights_bf_1[3]),
        .I3(\index_reg_n_0_[2] ),
        .O(\sum_arr_bf[7][4]_i_10_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT4 #(
    .INIT(16'h00B8)) 
    \sum_arr_bf[7][4]_i_11 
       (.I0(\_inferred__4/i__carry_n_6 ),
        .I1(\index_reg_n_0_[1] ),
        .I2(\_inferred__4/i__carry_n_4 ),
        .I3(\index_reg_n_0_[2] ),
        .O(\sum_arr_bf[7][4]_i_11_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT4 #(
    .INIT(16'h00B8)) 
    \sum_arr_bf[7][4]_i_12 
       (.I0(weights_bf_0[1]),
        .I1(\index_reg_n_0_[1] ),
        .I2(weights_bf_0[3]),
        .I3(\index_reg_n_0_[2] ),
        .O(\sum_arr_bf[7][4]_i_12_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT4 #(
    .INIT(16'h00B8)) 
    \sum_arr_bf[7][4]_i_13 
       (.I0(\_inferred__8/i__carry_n_6 ),
        .I1(\index_reg_n_0_[1] ),
        .I2(\_inferred__8/i__carry_n_4 ),
        .I3(\index_reg_n_0_[2] ),
        .O(\sum_arr_bf[7][4]_i_13_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT4 #(
    .INIT(16'h00B8)) 
    \sum_arr_bf[7][4]_i_14 
       (.I0(\_inferred__6/i__carry_n_6 ),
        .I1(\index_reg_n_0_[1] ),
        .I2(\_inferred__6/i__carry_n_4 ),
        .I3(\index_reg_n_0_[2] ),
        .O(\sum_arr_bf[7][4]_i_14_n_0 ));
  LUT4 #(
    .INIT(16'hA808)) 
    \sum_arr_bf[7][4]_i_4 
       (.I0(sel0[0]),
        .I1(\sum_arr_bf[7][5]_i_8_n_0 ),
        .I2(\index_reg_n_0_[0] ),
        .I3(\sum_arr_bf[7][4]_i_8_n_0 ),
        .O(\sum_arr_bf[7][4]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \sum_arr_bf[7][4]_i_5 
       (.I0(\sum_arr_bf[7][4]_i_9_n_0 ),
        .I1(\sum_arr_bf[7][5]_i_9_n_0 ),
        .I2(sel0[0]),
        .I3(\sum_arr_bf[7][4]_i_10_n_0 ),
        .I4(\index_reg_n_0_[0] ),
        .I5(\sum_arr_bf[7][5]_i_10_n_0 ),
        .O(\sum_arr_bf[7][4]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \sum_arr_bf[7][4]_i_6 
       (.I0(\sum_arr_bf[7][4]_i_11_n_0 ),
        .I1(\sum_arr_bf[7][5]_i_11_n_0 ),
        .I2(sel0[0]),
        .I3(\sum_arr_bf[7][4]_i_12_n_0 ),
        .I4(\index_reg_n_0_[0] ),
        .I5(\sum_arr_bf[7][5]_i_12_n_0 ),
        .O(\sum_arr_bf[7][4]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \sum_arr_bf[7][4]_i_7 
       (.I0(\sum_arr_bf[7][4]_i_13_n_0 ),
        .I1(\sum_arr_bf[7][5]_i_13_n_0 ),
        .I2(sel0[0]),
        .I3(\sum_arr_bf[7][4]_i_14_n_0 ),
        .I4(\index_reg_n_0_[0] ),
        .I5(\sum_arr_bf[7][5]_i_14_n_0 ),
        .O(\sum_arr_bf[7][4]_i_7_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT4 #(
    .INIT(16'h00B8)) 
    \sum_arr_bf[7][4]_i_8 
       (.I0(weights_bf_2[1]),
        .I1(\index_reg_n_0_[1] ),
        .I2(weights_bf_2[3]),
        .I3(\index_reg_n_0_[2] ),
        .O(\sum_arr_bf[7][4]_i_8_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT4 #(
    .INIT(16'h00B8)) 
    \sum_arr_bf[7][4]_i_9 
       (.I0(p_0_in[1]),
        .I1(\index_reg_n_0_[1] ),
        .I2(p_0_in[3]),
        .I3(\index_reg_n_0_[2] ),
        .O(\sum_arr_bf[7][4]_i_9_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \sum_arr_bf[7][5]_i_10 
       (.I0(weights_bf_1[2]),
        .I1(\index_reg_n_0_[1] ),
        .I2(weights_bf_1[0]),
        .I3(\index_reg_n_0_[2] ),
        .I4(weights_bf_1[4]),
        .O(\sum_arr_bf[7][5]_i_10_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \sum_arr_bf[7][5]_i_11 
       (.I0(\_inferred__4/i__carry_n_5 ),
        .I1(\index_reg_n_0_[1] ),
        .I2(\_inferred__4/i__carry_n_7 ),
        .I3(\index_reg_n_0_[2] ),
        .I4(\_inferred__4/i__carry__0_n_7 ),
        .O(\sum_arr_bf[7][5]_i_11_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \sum_arr_bf[7][5]_i_12 
       (.I0(weights_bf_0[2]),
        .I1(\index_reg_n_0_[1] ),
        .I2(weights_bf_0[0]),
        .I3(\index_reg_n_0_[2] ),
        .I4(weights_bf_0[4]),
        .O(\sum_arr_bf[7][5]_i_12_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \sum_arr_bf[7][5]_i_13 
       (.I0(\_inferred__8/i__carry_n_5 ),
        .I1(\index_reg_n_0_[1] ),
        .I2(\_inferred__8/i__carry_n_7 ),
        .I3(\index_reg_n_0_[2] ),
        .I4(\_inferred__8/i__carry__0_n_7 ),
        .O(\sum_arr_bf[7][5]_i_13_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \sum_arr_bf[7][5]_i_14 
       (.I0(\_inferred__6/i__carry_n_5 ),
        .I1(\index_reg_n_0_[1] ),
        .I2(\_inferred__6/i__carry_n_7 ),
        .I3(\index_reg_n_0_[2] ),
        .I4(\_inferred__6/i__carry__0_n_7 ),
        .O(\sum_arr_bf[7][5]_i_14_n_0 ));
  LUT4 #(
    .INIT(16'hA808)) 
    \sum_arr_bf[7][5]_i_4 
       (.I0(sel0[0]),
        .I1(\sum_arr_bf[7][6]_i_8_n_0 ),
        .I2(\index_reg_n_0_[0] ),
        .I3(\sum_arr_bf[7][5]_i_8_n_0 ),
        .O(\sum_arr_bf[7][5]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \sum_arr_bf[7][5]_i_5 
       (.I0(\sum_arr_bf[7][5]_i_9_n_0 ),
        .I1(\sum_arr_bf[7][6]_i_9_n_0 ),
        .I2(sel0[0]),
        .I3(\sum_arr_bf[7][5]_i_10_n_0 ),
        .I4(\index_reg_n_0_[0] ),
        .I5(\sum_arr_bf[7][6]_i_10_n_0 ),
        .O(\sum_arr_bf[7][5]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \sum_arr_bf[7][5]_i_6 
       (.I0(\sum_arr_bf[7][5]_i_11_n_0 ),
        .I1(\sum_arr_bf[7][6]_i_11_n_0 ),
        .I2(sel0[0]),
        .I3(\sum_arr_bf[7][5]_i_12_n_0 ),
        .I4(\index_reg_n_0_[0] ),
        .I5(\sum_arr_bf[7][6]_i_12_n_0 ),
        .O(\sum_arr_bf[7][5]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \sum_arr_bf[7][5]_i_7 
       (.I0(\sum_arr_bf[7][5]_i_13_n_0 ),
        .I1(\sum_arr_bf[7][6]_i_13_n_0 ),
        .I2(sel0[0]),
        .I3(\sum_arr_bf[7][5]_i_14_n_0 ),
        .I4(\index_reg_n_0_[0] ),
        .I5(\sum_arr_bf[7][6]_i_14_n_0 ),
        .O(\sum_arr_bf[7][5]_i_7_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \sum_arr_bf[7][5]_i_8 
       (.I0(weights_bf_2[2]),
        .I1(\index_reg_n_0_[1] ),
        .I2(weights_bf_2[0]),
        .I3(\index_reg_n_0_[2] ),
        .I4(weights_bf_2[4]),
        .O(\sum_arr_bf[7][5]_i_8_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \sum_arr_bf[7][5]_i_9 
       (.I0(p_0_in[2]),
        .I1(\index_reg_n_0_[1] ),
        .I2(p_0_in[0]),
        .I3(\index_reg_n_0_[2] ),
        .I4(p_0_in[4]),
        .O(\sum_arr_bf[7][5]_i_9_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \sum_arr_bf[7][6]_i_10 
       (.I0(weights_bf_1[3]),
        .I1(\index_reg_n_0_[1] ),
        .I2(weights_bf_1[1]),
        .I3(\index_reg_n_0_[2] ),
        .I4(weights_bf_1[5]),
        .O(\sum_arr_bf[7][6]_i_10_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \sum_arr_bf[7][6]_i_11 
       (.I0(\_inferred__4/i__carry_n_4 ),
        .I1(\index_reg_n_0_[1] ),
        .I2(\_inferred__4/i__carry_n_6 ),
        .I3(\index_reg_n_0_[2] ),
        .I4(\_inferred__4/i__carry__0_n_6 ),
        .O(\sum_arr_bf[7][6]_i_11_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \sum_arr_bf[7][6]_i_12 
       (.I0(weights_bf_0[3]),
        .I1(\index_reg_n_0_[1] ),
        .I2(weights_bf_0[1]),
        .I3(\index_reg_n_0_[2] ),
        .I4(weights_bf_0[5]),
        .O(\sum_arr_bf[7][6]_i_12_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \sum_arr_bf[7][6]_i_13 
       (.I0(\_inferred__8/i__carry_n_4 ),
        .I1(\index_reg_n_0_[1] ),
        .I2(\_inferred__8/i__carry_n_6 ),
        .I3(\index_reg_n_0_[2] ),
        .I4(\_inferred__8/i__carry__0_n_6 ),
        .O(\sum_arr_bf[7][6]_i_13_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \sum_arr_bf[7][6]_i_14 
       (.I0(\_inferred__6/i__carry_n_4 ),
        .I1(\index_reg_n_0_[1] ),
        .I2(\_inferred__6/i__carry_n_6 ),
        .I3(\index_reg_n_0_[2] ),
        .I4(\_inferred__6/i__carry__0_n_6 ),
        .O(\sum_arr_bf[7][6]_i_14_n_0 ));
  LUT4 #(
    .INIT(16'hA808)) 
    \sum_arr_bf[7][6]_i_4 
       (.I0(sel0[0]),
        .I1(\sum_arr_bf[7][7]_i_8_n_0 ),
        .I2(\index_reg_n_0_[0] ),
        .I3(\sum_arr_bf[7][6]_i_8_n_0 ),
        .O(\sum_arr_bf[7][6]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \sum_arr_bf[7][6]_i_5 
       (.I0(\sum_arr_bf[7][6]_i_9_n_0 ),
        .I1(\sum_arr_bf[7][7]_i_9_n_0 ),
        .I2(sel0[0]),
        .I3(\sum_arr_bf[7][6]_i_10_n_0 ),
        .I4(\index_reg_n_0_[0] ),
        .I5(\sum_arr_bf[7][7]_i_10_n_0 ),
        .O(\sum_arr_bf[7][6]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \sum_arr_bf[7][6]_i_6 
       (.I0(\sum_arr_bf[7][6]_i_11_n_0 ),
        .I1(\sum_arr_bf[7][7]_i_11_n_0 ),
        .I2(sel0[0]),
        .I3(\sum_arr_bf[7][6]_i_12_n_0 ),
        .I4(\index_reg_n_0_[0] ),
        .I5(\sum_arr_bf[7][7]_i_12_n_0 ),
        .O(\sum_arr_bf[7][6]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \sum_arr_bf[7][6]_i_7 
       (.I0(\sum_arr_bf[7][6]_i_13_n_0 ),
        .I1(\sum_arr_bf[7][7]_i_13_n_0 ),
        .I2(sel0[0]),
        .I3(\sum_arr_bf[7][6]_i_14_n_0 ),
        .I4(\index_reg_n_0_[0] ),
        .I5(\sum_arr_bf[7][7]_i_14_n_0 ),
        .O(\sum_arr_bf[7][6]_i_7_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \sum_arr_bf[7][6]_i_8 
       (.I0(weights_bf_2[3]),
        .I1(\index_reg_n_0_[1] ),
        .I2(weights_bf_2[1]),
        .I3(\index_reg_n_0_[2] ),
        .I4(weights_bf_2[5]),
        .O(\sum_arr_bf[7][6]_i_8_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \sum_arr_bf[7][6]_i_9 
       (.I0(p_0_in[3]),
        .I1(\index_reg_n_0_[1] ),
        .I2(p_0_in[1]),
        .I3(\index_reg_n_0_[2] ),
        .I4(p_0_in[5]),
        .O(\sum_arr_bf[7][6]_i_9_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \sum_arr_bf[7][7]_i_10 
       (.I0(weights_bf_1[0]),
        .I1(weights_bf_1[4]),
        .I2(\index_reg_n_0_[1] ),
        .I3(weights_bf_1[2]),
        .I4(\index_reg_n_0_[2] ),
        .I5(weights_bf_1[6]),
        .O(\sum_arr_bf[7][7]_i_10_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \sum_arr_bf[7][7]_i_11 
       (.I0(\_inferred__4/i__carry_n_7 ),
        .I1(\_inferred__4/i__carry__0_n_7 ),
        .I2(\index_reg_n_0_[1] ),
        .I3(\_inferred__4/i__carry_n_5 ),
        .I4(\index_reg_n_0_[2] ),
        .I5(\_inferred__4/i__carry__0_n_5 ),
        .O(\sum_arr_bf[7][7]_i_11_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \sum_arr_bf[7][7]_i_12 
       (.I0(weights_bf_0[0]),
        .I1(weights_bf_0[4]),
        .I2(\index_reg_n_0_[1] ),
        .I3(weights_bf_0[2]),
        .I4(\index_reg_n_0_[2] ),
        .I5(weights_bf_0[6]),
        .O(\sum_arr_bf[7][7]_i_12_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \sum_arr_bf[7][7]_i_13 
       (.I0(\_inferred__8/i__carry_n_7 ),
        .I1(\_inferred__8/i__carry__0_n_7 ),
        .I2(\index_reg_n_0_[1] ),
        .I3(\_inferred__8/i__carry_n_5 ),
        .I4(\index_reg_n_0_[2] ),
        .I5(\_inferred__8/i__carry__0_n_5 ),
        .O(\sum_arr_bf[7][7]_i_13_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \sum_arr_bf[7][7]_i_14 
       (.I0(\_inferred__6/i__carry_n_7 ),
        .I1(\_inferred__6/i__carry__0_n_7 ),
        .I2(\index_reg_n_0_[1] ),
        .I3(\_inferred__6/i__carry_n_5 ),
        .I4(\index_reg_n_0_[2] ),
        .I5(\_inferred__6/i__carry__0_n_5 ),
        .O(\sum_arr_bf[7][7]_i_14_n_0 ));
  LUT4 #(
    .INIT(16'hA808)) 
    \sum_arr_bf[7][7]_i_4 
       (.I0(sel0[0]),
        .I1(\sum_arr_bf[7][8]_i_8_n_0 ),
        .I2(\index_reg_n_0_[0] ),
        .I3(\sum_arr_bf[7][7]_i_8_n_0 ),
        .O(\sum_arr_bf[7][7]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \sum_arr_bf[7][7]_i_5 
       (.I0(\sum_arr_bf[7][7]_i_9_n_0 ),
        .I1(\sum_arr_bf[7][8]_i_9_n_0 ),
        .I2(sel0[0]),
        .I3(\sum_arr_bf[7][7]_i_10_n_0 ),
        .I4(\index_reg_n_0_[0] ),
        .I5(\sum_arr_bf[7][8]_i_10_n_0 ),
        .O(\sum_arr_bf[7][7]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \sum_arr_bf[7][7]_i_6 
       (.I0(\sum_arr_bf[7][7]_i_11_n_0 ),
        .I1(\sum_arr_bf[7][8]_i_11_n_0 ),
        .I2(sel0[0]),
        .I3(\sum_arr_bf[7][7]_i_12_n_0 ),
        .I4(\index_reg_n_0_[0] ),
        .I5(\sum_arr_bf[7][8]_i_12_n_0 ),
        .O(\sum_arr_bf[7][7]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \sum_arr_bf[7][7]_i_7 
       (.I0(\sum_arr_bf[7][7]_i_13_n_0 ),
        .I1(\sum_arr_bf[7][8]_i_13_n_0 ),
        .I2(sel0[0]),
        .I3(\sum_arr_bf[7][7]_i_14_n_0 ),
        .I4(\index_reg_n_0_[0] ),
        .I5(\sum_arr_bf[7][8]_i_14_n_0 ),
        .O(\sum_arr_bf[7][7]_i_7_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \sum_arr_bf[7][7]_i_8 
       (.I0(weights_bf_2[0]),
        .I1(weights_bf_2[4]),
        .I2(\index_reg_n_0_[1] ),
        .I3(weights_bf_2[2]),
        .I4(\index_reg_n_0_[2] ),
        .I5(weights_bf_2[6]),
        .O(\sum_arr_bf[7][7]_i_8_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \sum_arr_bf[7][7]_i_9 
       (.I0(p_0_in[0]),
        .I1(p_0_in[4]),
        .I2(\index_reg_n_0_[1] ),
        .I3(p_0_in[2]),
        .I4(\index_reg_n_0_[2] ),
        .I5(p_0_in[6]),
        .O(\sum_arr_bf[7][7]_i_9_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \sum_arr_bf[7][8]_i_10 
       (.I0(weights_bf_1[1]),
        .I1(weights_bf_1[5]),
        .I2(\index_reg_n_0_[1] ),
        .I3(weights_bf_1[3]),
        .I4(\index_reg_n_0_[2] ),
        .I5(weights_bf_1[7]),
        .O(\sum_arr_bf[7][8]_i_10_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \sum_arr_bf[7][8]_i_11 
       (.I0(\_inferred__4/i__carry_n_6 ),
        .I1(\_inferred__4/i__carry__0_n_6 ),
        .I2(\index_reg_n_0_[1] ),
        .I3(\_inferred__4/i__carry_n_4 ),
        .I4(\index_reg_n_0_[2] ),
        .I5(\_inferred__4/i__carry__0_n_4 ),
        .O(\sum_arr_bf[7][8]_i_11_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \sum_arr_bf[7][8]_i_12 
       (.I0(weights_bf_0[1]),
        .I1(weights_bf_0[5]),
        .I2(\index_reg_n_0_[1] ),
        .I3(weights_bf_0[3]),
        .I4(\index_reg_n_0_[2] ),
        .I5(weights_bf_0[7]),
        .O(\sum_arr_bf[7][8]_i_12_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \sum_arr_bf[7][8]_i_13 
       (.I0(\_inferred__8/i__carry_n_6 ),
        .I1(\_inferred__8/i__carry__0_n_6 ),
        .I2(\index_reg_n_0_[1] ),
        .I3(\_inferred__8/i__carry_n_4 ),
        .I4(\index_reg_n_0_[2] ),
        .I5(\_inferred__8/i__carry__0_n_4 ),
        .O(\sum_arr_bf[7][8]_i_13_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \sum_arr_bf[7][8]_i_14 
       (.I0(\_inferred__6/i__carry_n_6 ),
        .I1(\_inferred__6/i__carry__0_n_6 ),
        .I2(\index_reg_n_0_[1] ),
        .I3(\_inferred__6/i__carry_n_4 ),
        .I4(\index_reg_n_0_[2] ),
        .I5(\_inferred__6/i__carry__0_n_4 ),
        .O(\sum_arr_bf[7][8]_i_14_n_0 ));
  LUT4 #(
    .INIT(16'hA808)) 
    \sum_arr_bf[7][8]_i_4 
       (.I0(sel0[0]),
        .I1(\sum_arr_bf[7][9]_i_13_n_0 ),
        .I2(\index_reg_n_0_[0] ),
        .I3(\sum_arr_bf[7][8]_i_8_n_0 ),
        .O(\sum_arr_bf[7][8]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \sum_arr_bf[7][8]_i_5 
       (.I0(\sum_arr_bf[7][8]_i_9_n_0 ),
        .I1(\sum_arr_bf[7][9]_i_14_n_0 ),
        .I2(sel0[0]),
        .I3(\sum_arr_bf[7][8]_i_10_n_0 ),
        .I4(\index_reg_n_0_[0] ),
        .I5(\sum_arr_bf[7][9]_i_16_n_0 ),
        .O(\sum_arr_bf[7][8]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \sum_arr_bf[7][8]_i_6 
       (.I0(\sum_arr_bf[7][8]_i_11_n_0 ),
        .I1(\sum_arr_bf[7][9]_i_18_n_0 ),
        .I2(sel0[0]),
        .I3(\sum_arr_bf[7][8]_i_12_n_0 ),
        .I4(\index_reg_n_0_[0] ),
        .I5(\sum_arr_bf[7][9]_i_20_n_0 ),
        .O(\sum_arr_bf[7][8]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \sum_arr_bf[7][8]_i_7 
       (.I0(\sum_arr_bf[7][8]_i_13_n_0 ),
        .I1(\sum_arr_bf[7][9]_i_22_n_0 ),
        .I2(sel0[0]),
        .I3(\sum_arr_bf[7][8]_i_14_n_0 ),
        .I4(\index_reg_n_0_[0] ),
        .I5(\sum_arr_bf[7][9]_i_24_n_0 ),
        .O(\sum_arr_bf[7][8]_i_7_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \sum_arr_bf[7][8]_i_8 
       (.I0(weights_bf_2[1]),
        .I1(weights_bf_2[5]),
        .I2(\index_reg_n_0_[1] ),
        .I3(weights_bf_2[3]),
        .I4(\index_reg_n_0_[2] ),
        .I5(weights_bf_2[7]),
        .O(\sum_arr_bf[7][8]_i_8_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \sum_arr_bf[7][8]_i_9 
       (.I0(p_0_in[1]),
        .I1(p_0_in[5]),
        .I2(\index_reg_n_0_[1] ),
        .I3(p_0_in[3]),
        .I4(\index_reg_n_0_[2] ),
        .I5(p_0_in[7]),
        .O(\sum_arr_bf[7][8]_i_9_n_0 ));
  LUT6 #(
    .INIT(64'h0000800000000000)) 
    \sum_arr_bf[7][9]_i_1 
       (.I0(rstn_IBUF),
        .I1(\index_reg_n_0_[2] ),
        .I2(\index_reg_n_0_[0] ),
        .I3(\index_reg_n_0_[1] ),
        .I4(flag_accu_reg_n_0),
        .I5(flag_accu),
        .O(\sum_arr_bf[7][9]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \sum_arr_bf[7][9]_i_10 
       (.I0(\sum_arr_bf[7][9]_i_18_n_0 ),
        .I1(\sum_arr_bf[7][9]_i_19_n_0 ),
        .I2(sel0[0]),
        .I3(\sum_arr_bf[7][9]_i_20_n_0 ),
        .I4(\index_reg_n_0_[0] ),
        .I5(\sum_arr_bf[7][9]_i_21_n_0 ),
        .O(\sum_arr_bf[7][9]_i_10_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \sum_arr_bf[7][9]_i_11 
       (.I0(\sum_arr_bf[7][9]_i_22_n_0 ),
        .I1(\sum_arr_bf[7][9]_i_23_n_0 ),
        .I2(sel0[0]),
        .I3(\sum_arr_bf[7][9]_i_24_n_0 ),
        .I4(\index_reg_n_0_[0] ),
        .I5(\sum_arr_bf[7][9]_i_25_n_0 ),
        .O(\sum_arr_bf[7][9]_i_11_n_0 ));
  LUT5 #(
    .INIT(32'hB8FFB800)) 
    \sum_arr_bf[7][9]_i_12 
       (.I0(weights_bf_2[3]),
        .I1(\index_reg_n_0_[1] ),
        .I2(weights_bf_2[5]),
        .I3(\index_reg_n_0_[2] ),
        .I4(weights_bf_2[7]),
        .O(\sum_arr_bf[7][9]_i_12_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \sum_arr_bf[7][9]_i_13 
       (.I0(weights_bf_2[2]),
        .I1(weights_bf_2[6]),
        .I2(\index_reg_n_0_[1] ),
        .I3(weights_bf_2[4]),
        .I4(\index_reg_n_0_[2] ),
        .I5(weights_bf_2[7]),
        .O(\sum_arr_bf[7][9]_i_13_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \sum_arr_bf[7][9]_i_14 
       (.I0(p_0_in[2]),
        .I1(p_0_in[6]),
        .I2(\index_reg_n_0_[1] ),
        .I3(p_0_in[4]),
        .I4(\index_reg_n_0_[2] ),
        .I5(p_0_in__0),
        .O(\sum_arr_bf[7][9]_i_14_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \sum_arr_bf[7][9]_i_15 
       (.I0(p_0_in[3]),
        .I1(p_0_in[7]),
        .I2(\index_reg_n_0_[1] ),
        .I3(p_0_in[5]),
        .I4(\index_reg_n_0_[2] ),
        .I5(p_0_in__0),
        .O(\sum_arr_bf[7][9]_i_15_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \sum_arr_bf[7][9]_i_16 
       (.I0(weights_bf_1[2]),
        .I1(weights_bf_1[6]),
        .I2(\index_reg_n_0_[1] ),
        .I3(weights_bf_1[4]),
        .I4(\index_reg_n_0_[2] ),
        .I5(weights_bf_1[7]),
        .O(\sum_arr_bf[7][9]_i_16_n_0 ));
  LUT5 #(
    .INIT(32'hB8FFB800)) 
    \sum_arr_bf[7][9]_i_17 
       (.I0(weights_bf_1[3]),
        .I1(\index_reg_n_0_[1] ),
        .I2(weights_bf_1[5]),
        .I3(\index_reg_n_0_[2] ),
        .I4(weights_bf_1[7]),
        .O(\sum_arr_bf[7][9]_i_17_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \sum_arr_bf[7][9]_i_18 
       (.I0(\_inferred__4/i__carry_n_5 ),
        .I1(\_inferred__4/i__carry__0_n_5 ),
        .I2(\index_reg_n_0_[1] ),
        .I3(\_inferred__4/i__carry__0_n_7 ),
        .I4(\index_reg_n_0_[2] ),
        .I5(\_inferred__4/i__carry__1_n_7 ),
        .O(\sum_arr_bf[7][9]_i_18_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \sum_arr_bf[7][9]_i_19 
       (.I0(\_inferred__4/i__carry_n_4 ),
        .I1(\_inferred__4/i__carry__0_n_4 ),
        .I2(\index_reg_n_0_[1] ),
        .I3(\_inferred__4/i__carry__0_n_6 ),
        .I4(\index_reg_n_0_[2] ),
        .I5(\_inferred__4/i__carry__1_n_7 ),
        .O(\sum_arr_bf[7][9]_i_19_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \sum_arr_bf[7][9]_i_20 
       (.I0(weights_bf_0[2]),
        .I1(weights_bf_0[6]),
        .I2(\index_reg_n_0_[1] ),
        .I3(weights_bf_0[4]),
        .I4(\index_reg_n_0_[2] ),
        .I5(weights_bf_0[7]),
        .O(\sum_arr_bf[7][9]_i_20_n_0 ));
  LUT5 #(
    .INIT(32'hB8FFB800)) 
    \sum_arr_bf[7][9]_i_21 
       (.I0(weights_bf_0[3]),
        .I1(\index_reg_n_0_[1] ),
        .I2(weights_bf_0[5]),
        .I3(\index_reg_n_0_[2] ),
        .I4(weights_bf_0[7]),
        .O(\sum_arr_bf[7][9]_i_21_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \sum_arr_bf[7][9]_i_22 
       (.I0(\_inferred__8/i__carry_n_5 ),
        .I1(\_inferred__8/i__carry__0_n_5 ),
        .I2(\index_reg_n_0_[1] ),
        .I3(\_inferred__8/i__carry__0_n_7 ),
        .I4(\index_reg_n_0_[2] ),
        .I5(\_inferred__8/i__carry__1_n_7 ),
        .O(\sum_arr_bf[7][9]_i_22_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \sum_arr_bf[7][9]_i_23 
       (.I0(\_inferred__8/i__carry_n_4 ),
        .I1(\_inferred__8/i__carry__0_n_4 ),
        .I2(\index_reg_n_0_[1] ),
        .I3(\_inferred__8/i__carry__0_n_6 ),
        .I4(\index_reg_n_0_[2] ),
        .I5(\_inferred__8/i__carry__1_n_6 ),
        .O(\sum_arr_bf[7][9]_i_23_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0C0C0AFA0CFCF)) 
    \sum_arr_bf[7][9]_i_24 
       (.I0(\_inferred__6/i__carry_n_5 ),
        .I1(\_inferred__6/i__carry__0_n_5 ),
        .I2(\index_reg_n_0_[1] ),
        .I3(\_inferred__6/i__carry__0_n_7 ),
        .I4(\index_reg_n_0_[2] ),
        .I5(i__carry__1_i_1_n_3),
        .O(\sum_arr_bf[7][9]_i_24_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0C0C0AFA0CFCF)) 
    \sum_arr_bf[7][9]_i_25 
       (.I0(\_inferred__6/i__carry_n_4 ),
        .I1(\_inferred__6/i__carry__0_n_4 ),
        .I2(\index_reg_n_0_[1] ),
        .I3(\_inferred__6/i__carry__0_n_6 ),
        .I4(\index_reg_n_0_[2] ),
        .I5(i__carry__1_i_1_n_3),
        .O(\sum_arr_bf[7][9]_i_25_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \sum_arr_bf[7][9]_i_6 
       (.I0(data_in_bf_0[3]),
        .I1(data_in_bf_0[2]),
        .I2(\index_reg_n_0_[1] ),
        .I3(data_in_bf_0[1]),
        .I4(\index_reg_n_0_[0] ),
        .I5(data_in_bf_0[0]),
        .O(\sum_arr_bf[7][9]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \sum_arr_bf[7][9]_i_7 
       (.I0(data_in_bf_0[7]),
        .I1(data_in_bf_0[6]),
        .I2(\index_reg_n_0_[1] ),
        .I3(data_in_bf_0[5]),
        .I4(\index_reg_n_0_[0] ),
        .I5(data_in_bf_0[4]),
        .O(\sum_arr_bf[7][9]_i_7_n_0 ));
  LUT4 #(
    .INIT(16'hA808)) 
    \sum_arr_bf[7][9]_i_8 
       (.I0(sel0[0]),
        .I1(\sum_arr_bf[7][9]_i_12_n_0 ),
        .I2(\index_reg_n_0_[0] ),
        .I3(\sum_arr_bf[7][9]_i_13_n_0 ),
        .O(\sum_arr_bf[7][9]_i_8_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \sum_arr_bf[7][9]_i_9 
       (.I0(\sum_arr_bf[7][9]_i_14_n_0 ),
        .I1(\sum_arr_bf[7][9]_i_15_n_0 ),
        .I2(sel0[0]),
        .I3(\sum_arr_bf[7][9]_i_16_n_0 ),
        .I4(\index_reg_n_0_[0] ),
        .I5(\sum_arr_bf[7][9]_i_17_n_0 ),
        .O(\sum_arr_bf[7][9]_i_9_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \sum_arr_bf_reg[0][0] 
       (.C(clk_IBUF_BUFG),
        .CE(\sum_arr_bf[0][9]_i_1_n_0 ),
        .D(sum_arr_bf[0]),
        .Q(\sum_arr_bf_reg[0] [0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sum_arr_bf_reg[0][1] 
       (.C(clk_IBUF_BUFG),
        .CE(\sum_arr_bf[0][9]_i_1_n_0 ),
        .D(sum_arr_bf[1]),
        .Q(\sum_arr_bf_reg[0] [1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sum_arr_bf_reg[0][2] 
       (.C(clk_IBUF_BUFG),
        .CE(\sum_arr_bf[0][9]_i_1_n_0 ),
        .D(sum_arr_bf[2]),
        .Q(\sum_arr_bf_reg[0] [2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sum_arr_bf_reg[0][3] 
       (.C(clk_IBUF_BUFG),
        .CE(\sum_arr_bf[0][9]_i_1_n_0 ),
        .D(sum_arr_bf[3]),
        .Q(\sum_arr_bf_reg[0] [3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sum_arr_bf_reg[0][4] 
       (.C(clk_IBUF_BUFG),
        .CE(\sum_arr_bf[0][9]_i_1_n_0 ),
        .D(sum_arr_bf[4]),
        .Q(\sum_arr_bf_reg[0] [4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sum_arr_bf_reg[0][5] 
       (.C(clk_IBUF_BUFG),
        .CE(\sum_arr_bf[0][9]_i_1_n_0 ),
        .D(sum_arr_bf[5]),
        .Q(\sum_arr_bf_reg[0] [5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sum_arr_bf_reg[0][6] 
       (.C(clk_IBUF_BUFG),
        .CE(\sum_arr_bf[0][9]_i_1_n_0 ),
        .D(sum_arr_bf[6]),
        .Q(\sum_arr_bf_reg[0] [6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sum_arr_bf_reg[0][7] 
       (.C(clk_IBUF_BUFG),
        .CE(\sum_arr_bf[0][9]_i_1_n_0 ),
        .D(sum_arr_bf[7]),
        .Q(\sum_arr_bf_reg[0] [7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sum_arr_bf_reg[0][8] 
       (.C(clk_IBUF_BUFG),
        .CE(\sum_arr_bf[0][9]_i_1_n_0 ),
        .D(sum_arr_bf[8]),
        .Q(\sum_arr_bf_reg[0] [8]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sum_arr_bf_reg[0][9] 
       (.C(clk_IBUF_BUFG),
        .CE(\sum_arr_bf[0][9]_i_1_n_0 ),
        .D(sum_arr_bf[9]),
        .Q(\sum_arr_bf_reg[0] [9]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sum_arr_bf_reg[1][0] 
       (.C(clk_IBUF_BUFG),
        .CE(\sum_arr_bf[1][9]_i_1_n_0 ),
        .D(sum_arr_bf[0]),
        .Q(\sum_arr_bf_reg[1] [0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sum_arr_bf_reg[1][1] 
       (.C(clk_IBUF_BUFG),
        .CE(\sum_arr_bf[1][9]_i_1_n_0 ),
        .D(sum_arr_bf[1]),
        .Q(\sum_arr_bf_reg[1] [1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sum_arr_bf_reg[1][2] 
       (.C(clk_IBUF_BUFG),
        .CE(\sum_arr_bf[1][9]_i_1_n_0 ),
        .D(sum_arr_bf[2]),
        .Q(\sum_arr_bf_reg[1] [2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sum_arr_bf_reg[1][3] 
       (.C(clk_IBUF_BUFG),
        .CE(\sum_arr_bf[1][9]_i_1_n_0 ),
        .D(sum_arr_bf[3]),
        .Q(\sum_arr_bf_reg[1] [3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sum_arr_bf_reg[1][4] 
       (.C(clk_IBUF_BUFG),
        .CE(\sum_arr_bf[1][9]_i_1_n_0 ),
        .D(sum_arr_bf[4]),
        .Q(\sum_arr_bf_reg[1] [4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sum_arr_bf_reg[1][5] 
       (.C(clk_IBUF_BUFG),
        .CE(\sum_arr_bf[1][9]_i_1_n_0 ),
        .D(sum_arr_bf[5]),
        .Q(\sum_arr_bf_reg[1] [5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sum_arr_bf_reg[1][6] 
       (.C(clk_IBUF_BUFG),
        .CE(\sum_arr_bf[1][9]_i_1_n_0 ),
        .D(sum_arr_bf[6]),
        .Q(\sum_arr_bf_reg[1] [6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sum_arr_bf_reg[1][7] 
       (.C(clk_IBUF_BUFG),
        .CE(\sum_arr_bf[1][9]_i_1_n_0 ),
        .D(sum_arr_bf[7]),
        .Q(\sum_arr_bf_reg[1] [7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sum_arr_bf_reg[1][8] 
       (.C(clk_IBUF_BUFG),
        .CE(\sum_arr_bf[1][9]_i_1_n_0 ),
        .D(sum_arr_bf[8]),
        .Q(\sum_arr_bf_reg[1] [8]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sum_arr_bf_reg[1][9] 
       (.C(clk_IBUF_BUFG),
        .CE(\sum_arr_bf[1][9]_i_1_n_0 ),
        .D(sum_arr_bf[9]),
        .Q(\sum_arr_bf_reg[1] [9]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sum_arr_bf_reg[2][0] 
       (.C(clk_IBUF_BUFG),
        .CE(\sum_arr_bf[2][9]_i_1_n_0 ),
        .D(sum_arr_bf[0]),
        .Q(\sum_arr_bf_reg[2] [0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sum_arr_bf_reg[2][1] 
       (.C(clk_IBUF_BUFG),
        .CE(\sum_arr_bf[2][9]_i_1_n_0 ),
        .D(sum_arr_bf[1]),
        .Q(\sum_arr_bf_reg[2] [1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sum_arr_bf_reg[2][2] 
       (.C(clk_IBUF_BUFG),
        .CE(\sum_arr_bf[2][9]_i_1_n_0 ),
        .D(sum_arr_bf[2]),
        .Q(\sum_arr_bf_reg[2] [2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sum_arr_bf_reg[2][3] 
       (.C(clk_IBUF_BUFG),
        .CE(\sum_arr_bf[2][9]_i_1_n_0 ),
        .D(sum_arr_bf[3]),
        .Q(\sum_arr_bf_reg[2] [3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sum_arr_bf_reg[2][4] 
       (.C(clk_IBUF_BUFG),
        .CE(\sum_arr_bf[2][9]_i_1_n_0 ),
        .D(sum_arr_bf[4]),
        .Q(\sum_arr_bf_reg[2] [4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sum_arr_bf_reg[2][5] 
       (.C(clk_IBUF_BUFG),
        .CE(\sum_arr_bf[2][9]_i_1_n_0 ),
        .D(sum_arr_bf[5]),
        .Q(\sum_arr_bf_reg[2] [5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sum_arr_bf_reg[2][6] 
       (.C(clk_IBUF_BUFG),
        .CE(\sum_arr_bf[2][9]_i_1_n_0 ),
        .D(sum_arr_bf[6]),
        .Q(\sum_arr_bf_reg[2] [6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sum_arr_bf_reg[2][7] 
       (.C(clk_IBUF_BUFG),
        .CE(\sum_arr_bf[2][9]_i_1_n_0 ),
        .D(sum_arr_bf[7]),
        .Q(\sum_arr_bf_reg[2] [7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sum_arr_bf_reg[2][8] 
       (.C(clk_IBUF_BUFG),
        .CE(\sum_arr_bf[2][9]_i_1_n_0 ),
        .D(sum_arr_bf[8]),
        .Q(\sum_arr_bf_reg[2] [8]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sum_arr_bf_reg[2][9] 
       (.C(clk_IBUF_BUFG),
        .CE(\sum_arr_bf[2][9]_i_1_n_0 ),
        .D(sum_arr_bf[9]),
        .Q(\sum_arr_bf_reg[2] [9]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sum_arr_bf_reg[3][0] 
       (.C(clk_IBUF_BUFG),
        .CE(\sum_arr_bf[3][9]_i_1_n_0 ),
        .D(sum_arr_bf[0]),
        .Q(\sum_arr_bf_reg[3] [0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sum_arr_bf_reg[3][1] 
       (.C(clk_IBUF_BUFG),
        .CE(\sum_arr_bf[3][9]_i_1_n_0 ),
        .D(sum_arr_bf[1]),
        .Q(\sum_arr_bf_reg[3] [1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sum_arr_bf_reg[3][2] 
       (.C(clk_IBUF_BUFG),
        .CE(\sum_arr_bf[3][9]_i_1_n_0 ),
        .D(sum_arr_bf[2]),
        .Q(\sum_arr_bf_reg[3] [2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sum_arr_bf_reg[3][3] 
       (.C(clk_IBUF_BUFG),
        .CE(\sum_arr_bf[3][9]_i_1_n_0 ),
        .D(sum_arr_bf[3]),
        .Q(\sum_arr_bf_reg[3] [3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sum_arr_bf_reg[3][4] 
       (.C(clk_IBUF_BUFG),
        .CE(\sum_arr_bf[3][9]_i_1_n_0 ),
        .D(sum_arr_bf[4]),
        .Q(\sum_arr_bf_reg[3] [4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sum_arr_bf_reg[3][5] 
       (.C(clk_IBUF_BUFG),
        .CE(\sum_arr_bf[3][9]_i_1_n_0 ),
        .D(sum_arr_bf[5]),
        .Q(\sum_arr_bf_reg[3] [5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sum_arr_bf_reg[3][6] 
       (.C(clk_IBUF_BUFG),
        .CE(\sum_arr_bf[3][9]_i_1_n_0 ),
        .D(sum_arr_bf[6]),
        .Q(\sum_arr_bf_reg[3] [6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sum_arr_bf_reg[3][7] 
       (.C(clk_IBUF_BUFG),
        .CE(\sum_arr_bf[3][9]_i_1_n_0 ),
        .D(sum_arr_bf[7]),
        .Q(\sum_arr_bf_reg[3] [7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sum_arr_bf_reg[3][8] 
       (.C(clk_IBUF_BUFG),
        .CE(\sum_arr_bf[3][9]_i_1_n_0 ),
        .D(sum_arr_bf[8]),
        .Q(\sum_arr_bf_reg[3] [8]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sum_arr_bf_reg[3][9] 
       (.C(clk_IBUF_BUFG),
        .CE(\sum_arr_bf[3][9]_i_1_n_0 ),
        .D(sum_arr_bf[9]),
        .Q(\sum_arr_bf_reg[3] [9]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sum_arr_bf_reg[4][0] 
       (.C(clk_IBUF_BUFG),
        .CE(\sum_arr_bf[4][9]_i_1_n_0 ),
        .D(sum_arr_bf[0]),
        .Q(\sum_arr_bf_reg[4] [0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sum_arr_bf_reg[4][1] 
       (.C(clk_IBUF_BUFG),
        .CE(\sum_arr_bf[4][9]_i_1_n_0 ),
        .D(sum_arr_bf[1]),
        .Q(\sum_arr_bf_reg[4] [1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sum_arr_bf_reg[4][2] 
       (.C(clk_IBUF_BUFG),
        .CE(\sum_arr_bf[4][9]_i_1_n_0 ),
        .D(sum_arr_bf[2]),
        .Q(\sum_arr_bf_reg[4] [2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sum_arr_bf_reg[4][3] 
       (.C(clk_IBUF_BUFG),
        .CE(\sum_arr_bf[4][9]_i_1_n_0 ),
        .D(sum_arr_bf[3]),
        .Q(\sum_arr_bf_reg[4] [3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sum_arr_bf_reg[4][4] 
       (.C(clk_IBUF_BUFG),
        .CE(\sum_arr_bf[4][9]_i_1_n_0 ),
        .D(sum_arr_bf[4]),
        .Q(\sum_arr_bf_reg[4] [4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sum_arr_bf_reg[4][5] 
       (.C(clk_IBUF_BUFG),
        .CE(\sum_arr_bf[4][9]_i_1_n_0 ),
        .D(sum_arr_bf[5]),
        .Q(\sum_arr_bf_reg[4] [5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sum_arr_bf_reg[4][6] 
       (.C(clk_IBUF_BUFG),
        .CE(\sum_arr_bf[4][9]_i_1_n_0 ),
        .D(sum_arr_bf[6]),
        .Q(\sum_arr_bf_reg[4] [6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sum_arr_bf_reg[4][7] 
       (.C(clk_IBUF_BUFG),
        .CE(\sum_arr_bf[4][9]_i_1_n_0 ),
        .D(sum_arr_bf[7]),
        .Q(\sum_arr_bf_reg[4] [7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sum_arr_bf_reg[4][8] 
       (.C(clk_IBUF_BUFG),
        .CE(\sum_arr_bf[4][9]_i_1_n_0 ),
        .D(sum_arr_bf[8]),
        .Q(\sum_arr_bf_reg[4] [8]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sum_arr_bf_reg[4][9] 
       (.C(clk_IBUF_BUFG),
        .CE(\sum_arr_bf[4][9]_i_1_n_0 ),
        .D(sum_arr_bf[9]),
        .Q(\sum_arr_bf_reg[4] [9]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sum_arr_bf_reg[5][0] 
       (.C(clk_IBUF_BUFG),
        .CE(\sum_arr_bf[5][9]_i_1_n_0 ),
        .D(sum_arr_bf[0]),
        .Q(\sum_arr_bf_reg[5] [0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sum_arr_bf_reg[5][1] 
       (.C(clk_IBUF_BUFG),
        .CE(\sum_arr_bf[5][9]_i_1_n_0 ),
        .D(sum_arr_bf[1]),
        .Q(\sum_arr_bf_reg[5] [1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sum_arr_bf_reg[5][2] 
       (.C(clk_IBUF_BUFG),
        .CE(\sum_arr_bf[5][9]_i_1_n_0 ),
        .D(sum_arr_bf[2]),
        .Q(\sum_arr_bf_reg[5] [2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sum_arr_bf_reg[5][3] 
       (.C(clk_IBUF_BUFG),
        .CE(\sum_arr_bf[5][9]_i_1_n_0 ),
        .D(sum_arr_bf[3]),
        .Q(\sum_arr_bf_reg[5] [3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sum_arr_bf_reg[5][4] 
       (.C(clk_IBUF_BUFG),
        .CE(\sum_arr_bf[5][9]_i_1_n_0 ),
        .D(sum_arr_bf[4]),
        .Q(\sum_arr_bf_reg[5] [4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sum_arr_bf_reg[5][5] 
       (.C(clk_IBUF_BUFG),
        .CE(\sum_arr_bf[5][9]_i_1_n_0 ),
        .D(sum_arr_bf[5]),
        .Q(\sum_arr_bf_reg[5] [5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sum_arr_bf_reg[5][6] 
       (.C(clk_IBUF_BUFG),
        .CE(\sum_arr_bf[5][9]_i_1_n_0 ),
        .D(sum_arr_bf[6]),
        .Q(\sum_arr_bf_reg[5] [6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sum_arr_bf_reg[5][7] 
       (.C(clk_IBUF_BUFG),
        .CE(\sum_arr_bf[5][9]_i_1_n_0 ),
        .D(sum_arr_bf[7]),
        .Q(\sum_arr_bf_reg[5] [7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sum_arr_bf_reg[5][8] 
       (.C(clk_IBUF_BUFG),
        .CE(\sum_arr_bf[5][9]_i_1_n_0 ),
        .D(sum_arr_bf[8]),
        .Q(\sum_arr_bf_reg[5] [8]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sum_arr_bf_reg[5][9] 
       (.C(clk_IBUF_BUFG),
        .CE(\sum_arr_bf[5][9]_i_1_n_0 ),
        .D(sum_arr_bf[9]),
        .Q(\sum_arr_bf_reg[5] [9]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sum_arr_bf_reg[6][0] 
       (.C(clk_IBUF_BUFG),
        .CE(\sum_arr_bf[6][9]_i_1_n_0 ),
        .D(sum_arr_bf[0]),
        .Q(\sum_arr_bf_reg[6] [0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sum_arr_bf_reg[6][1] 
       (.C(clk_IBUF_BUFG),
        .CE(\sum_arr_bf[6][9]_i_1_n_0 ),
        .D(sum_arr_bf[1]),
        .Q(\sum_arr_bf_reg[6] [1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sum_arr_bf_reg[6][2] 
       (.C(clk_IBUF_BUFG),
        .CE(\sum_arr_bf[6][9]_i_1_n_0 ),
        .D(sum_arr_bf[2]),
        .Q(\sum_arr_bf_reg[6] [2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sum_arr_bf_reg[6][3] 
       (.C(clk_IBUF_BUFG),
        .CE(\sum_arr_bf[6][9]_i_1_n_0 ),
        .D(sum_arr_bf[3]),
        .Q(\sum_arr_bf_reg[6] [3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sum_arr_bf_reg[6][4] 
       (.C(clk_IBUF_BUFG),
        .CE(\sum_arr_bf[6][9]_i_1_n_0 ),
        .D(sum_arr_bf[4]),
        .Q(\sum_arr_bf_reg[6] [4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sum_arr_bf_reg[6][5] 
       (.C(clk_IBUF_BUFG),
        .CE(\sum_arr_bf[6][9]_i_1_n_0 ),
        .D(sum_arr_bf[5]),
        .Q(\sum_arr_bf_reg[6] [5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sum_arr_bf_reg[6][6] 
       (.C(clk_IBUF_BUFG),
        .CE(\sum_arr_bf[6][9]_i_1_n_0 ),
        .D(sum_arr_bf[6]),
        .Q(\sum_arr_bf_reg[6] [6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sum_arr_bf_reg[6][7] 
       (.C(clk_IBUF_BUFG),
        .CE(\sum_arr_bf[6][9]_i_1_n_0 ),
        .D(sum_arr_bf[7]),
        .Q(\sum_arr_bf_reg[6] [7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sum_arr_bf_reg[6][8] 
       (.C(clk_IBUF_BUFG),
        .CE(\sum_arr_bf[6][9]_i_1_n_0 ),
        .D(sum_arr_bf[8]),
        .Q(\sum_arr_bf_reg[6] [8]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sum_arr_bf_reg[6][9] 
       (.C(clk_IBUF_BUFG),
        .CE(\sum_arr_bf[6][9]_i_1_n_0 ),
        .D(sum_arr_bf[9]),
        .Q(\sum_arr_bf_reg[6] [9]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sum_arr_bf_reg[7][0] 
       (.C(clk_IBUF_BUFG),
        .CE(\sum_arr_bf[7][9]_i_1_n_0 ),
        .D(sum_arr_bf[0]),
        .Q(\sum_arr_bf_reg[7] [0]),
        .R(1'b0));
  MUXF8 \sum_arr_bf_reg[7][0]_i_1 
       (.I0(\sum_arr_bf_reg[7][0]_i_2_n_0 ),
        .I1(\sum_arr_bf_reg[7][0]_i_3_n_0 ),
        .O(sum_arr_bf[0]),
        .S(sel0[2]));
  MUXF7 \sum_arr_bf_reg[7][0]_i_2 
       (.I0(\sum_arr_bf[7][0]_i_4_n_0 ),
        .I1(\sum_arr_bf[7][0]_i_5_n_0 ),
        .O(\sum_arr_bf_reg[7][0]_i_2_n_0 ),
        .S(sel0[1]));
  MUXF7 \sum_arr_bf_reg[7][0]_i_3 
       (.I0(\sum_arr_bf[7][0]_i_6_n_0 ),
        .I1(\sum_arr_bf[7][0]_i_7_n_0 ),
        .O(\sum_arr_bf_reg[7][0]_i_3_n_0 ),
        .S(sel0[1]));
  FDRE #(
    .INIT(1'b0)) 
    \sum_arr_bf_reg[7][1] 
       (.C(clk_IBUF_BUFG),
        .CE(\sum_arr_bf[7][9]_i_1_n_0 ),
        .D(sum_arr_bf[1]),
        .Q(\sum_arr_bf_reg[7] [1]),
        .R(1'b0));
  MUXF7 \sum_arr_bf_reg[7][1]_i_2 
       (.I0(data5[1]),
        .I1(data6[1]),
        .O(\sum_arr_bf_reg[7][1]_i_2_n_0 ),
        .S(sel0[0]));
  MUXF7 \sum_arr_bf_reg[7][1]_i_3 
       (.I0(data3[1]),
        .I1(data4[1]),
        .O(\sum_arr_bf_reg[7][1]_i_3_n_0 ),
        .S(sel0[0]));
  MUXF7 \sum_arr_bf_reg[7][1]_i_4 
       (.I0(data1[1]),
        .I1(data2[1]),
        .O(\sum_arr_bf_reg[7][1]_i_4_n_0 ),
        .S(sel0[0]));
  FDRE #(
    .INIT(1'b0)) 
    \sum_arr_bf_reg[7][2] 
       (.C(clk_IBUF_BUFG),
        .CE(\sum_arr_bf[7][9]_i_1_n_0 ),
        .D(sum_arr_bf[2]),
        .Q(\sum_arr_bf_reg[7] [2]),
        .R(1'b0));
  MUXF8 \sum_arr_bf_reg[7][2]_i_2 
       (.I0(\sum_arr_bf_reg[7][2]_i_7_n_0 ),
        .I1(\sum_arr_bf_reg[7][2]_i_8_n_0 ),
        .O(\sum_arr_bf_reg[7][2]_i_2_n_0 ),
        .S(sel0[1]));
  MUXF7 \sum_arr_bf_reg[7][2]_i_3 
       (.I0(data1[2]),
        .I1(data2[2]),
        .O(\sum_arr_bf_reg[7][2]_i_3_n_0 ),
        .S(sel0[0]));
  MUXF7 \sum_arr_bf_reg[7][2]_i_4 
       (.I0(\sum_arr_bf[7][2]_i_11_n_0 ),
        .I1(\sum_arr_bf[7][2]_i_12_n_0 ),
        .O(sel0[1]),
        .S(\index_reg_n_0_[2] ));
  MUXF7 \sum_arr_bf_reg[7][2]_i_5 
       (.I0(\sum_arr_bf[7][2]_i_13_n_0 ),
        .I1(\sum_arr_bf[7][2]_i_14_n_0 ),
        .O(sel0[0]),
        .S(\index_reg_n_0_[2] ));
  MUXF7 \sum_arr_bf_reg[7][2]_i_7 
       (.I0(data3[2]),
        .I1(data4[2]),
        .O(\sum_arr_bf_reg[7][2]_i_7_n_0 ),
        .S(sel0[0]));
  MUXF7 \sum_arr_bf_reg[7][2]_i_8 
       (.I0(data5[2]),
        .I1(data6[2]),
        .O(\sum_arr_bf_reg[7][2]_i_8_n_0 ),
        .S(sel0[0]));
  FDRE #(
    .INIT(1'b0)) 
    \sum_arr_bf_reg[7][3] 
       (.C(clk_IBUF_BUFG),
        .CE(\sum_arr_bf[7][9]_i_1_n_0 ),
        .D(sum_arr_bf[3]),
        .Q(\sum_arr_bf_reg[7] [3]),
        .R(1'b0));
  MUXF8 \sum_arr_bf_reg[7][3]_i_1 
       (.I0(\sum_arr_bf_reg[7][3]_i_2_n_0 ),
        .I1(\sum_arr_bf_reg[7][3]_i_3_n_0 ),
        .O(sum_arr_bf[3]),
        .S(sel0[2]));
  MUXF7 \sum_arr_bf_reg[7][3]_i_2 
       (.I0(\sum_arr_bf[7][3]_i_4_n_0 ),
        .I1(\sum_arr_bf[7][3]_i_5_n_0 ),
        .O(\sum_arr_bf_reg[7][3]_i_2_n_0 ),
        .S(sel0[1]));
  MUXF7 \sum_arr_bf_reg[7][3]_i_3 
       (.I0(\sum_arr_bf[7][3]_i_6_n_0 ),
        .I1(\sum_arr_bf[7][3]_i_7_n_0 ),
        .O(\sum_arr_bf_reg[7][3]_i_3_n_0 ),
        .S(sel0[1]));
  FDRE #(
    .INIT(1'b0)) 
    \sum_arr_bf_reg[7][4] 
       (.C(clk_IBUF_BUFG),
        .CE(\sum_arr_bf[7][9]_i_1_n_0 ),
        .D(sum_arr_bf[4]),
        .Q(\sum_arr_bf_reg[7] [4]),
        .R(1'b0));
  MUXF8 \sum_arr_bf_reg[7][4]_i_1 
       (.I0(\sum_arr_bf_reg[7][4]_i_2_n_0 ),
        .I1(\sum_arr_bf_reg[7][4]_i_3_n_0 ),
        .O(sum_arr_bf[4]),
        .S(sel0[2]));
  MUXF7 \sum_arr_bf_reg[7][4]_i_2 
       (.I0(\sum_arr_bf[7][4]_i_4_n_0 ),
        .I1(\sum_arr_bf[7][4]_i_5_n_0 ),
        .O(\sum_arr_bf_reg[7][4]_i_2_n_0 ),
        .S(sel0[1]));
  MUXF7 \sum_arr_bf_reg[7][4]_i_3 
       (.I0(\sum_arr_bf[7][4]_i_6_n_0 ),
        .I1(\sum_arr_bf[7][4]_i_7_n_0 ),
        .O(\sum_arr_bf_reg[7][4]_i_3_n_0 ),
        .S(sel0[1]));
  FDRE #(
    .INIT(1'b0)) 
    \sum_arr_bf_reg[7][5] 
       (.C(clk_IBUF_BUFG),
        .CE(\sum_arr_bf[7][9]_i_1_n_0 ),
        .D(sum_arr_bf[5]),
        .Q(\sum_arr_bf_reg[7] [5]),
        .R(1'b0));
  MUXF8 \sum_arr_bf_reg[7][5]_i_1 
       (.I0(\sum_arr_bf_reg[7][5]_i_2_n_0 ),
        .I1(\sum_arr_bf_reg[7][5]_i_3_n_0 ),
        .O(sum_arr_bf[5]),
        .S(sel0[2]));
  MUXF7 \sum_arr_bf_reg[7][5]_i_2 
       (.I0(\sum_arr_bf[7][5]_i_4_n_0 ),
        .I1(\sum_arr_bf[7][5]_i_5_n_0 ),
        .O(\sum_arr_bf_reg[7][5]_i_2_n_0 ),
        .S(sel0[1]));
  MUXF7 \sum_arr_bf_reg[7][5]_i_3 
       (.I0(\sum_arr_bf[7][5]_i_6_n_0 ),
        .I1(\sum_arr_bf[7][5]_i_7_n_0 ),
        .O(\sum_arr_bf_reg[7][5]_i_3_n_0 ),
        .S(sel0[1]));
  FDRE #(
    .INIT(1'b0)) 
    \sum_arr_bf_reg[7][6] 
       (.C(clk_IBUF_BUFG),
        .CE(\sum_arr_bf[7][9]_i_1_n_0 ),
        .D(sum_arr_bf[6]),
        .Q(\sum_arr_bf_reg[7] [6]),
        .R(1'b0));
  MUXF8 \sum_arr_bf_reg[7][6]_i_1 
       (.I0(\sum_arr_bf_reg[7][6]_i_2_n_0 ),
        .I1(\sum_arr_bf_reg[7][6]_i_3_n_0 ),
        .O(sum_arr_bf[6]),
        .S(sel0[2]));
  MUXF7 \sum_arr_bf_reg[7][6]_i_2 
       (.I0(\sum_arr_bf[7][6]_i_4_n_0 ),
        .I1(\sum_arr_bf[7][6]_i_5_n_0 ),
        .O(\sum_arr_bf_reg[7][6]_i_2_n_0 ),
        .S(sel0[1]));
  MUXF7 \sum_arr_bf_reg[7][6]_i_3 
       (.I0(\sum_arr_bf[7][6]_i_6_n_0 ),
        .I1(\sum_arr_bf[7][6]_i_7_n_0 ),
        .O(\sum_arr_bf_reg[7][6]_i_3_n_0 ),
        .S(sel0[1]));
  FDRE #(
    .INIT(1'b0)) 
    \sum_arr_bf_reg[7][7] 
       (.C(clk_IBUF_BUFG),
        .CE(\sum_arr_bf[7][9]_i_1_n_0 ),
        .D(sum_arr_bf[7]),
        .Q(\sum_arr_bf_reg[7] [7]),
        .R(1'b0));
  MUXF8 \sum_arr_bf_reg[7][7]_i_1 
       (.I0(\sum_arr_bf_reg[7][7]_i_2_n_0 ),
        .I1(\sum_arr_bf_reg[7][7]_i_3_n_0 ),
        .O(sum_arr_bf[7]),
        .S(sel0[2]));
  MUXF7 \sum_arr_bf_reg[7][7]_i_2 
       (.I0(\sum_arr_bf[7][7]_i_4_n_0 ),
        .I1(\sum_arr_bf[7][7]_i_5_n_0 ),
        .O(\sum_arr_bf_reg[7][7]_i_2_n_0 ),
        .S(sel0[1]));
  MUXF7 \sum_arr_bf_reg[7][7]_i_3 
       (.I0(\sum_arr_bf[7][7]_i_6_n_0 ),
        .I1(\sum_arr_bf[7][7]_i_7_n_0 ),
        .O(\sum_arr_bf_reg[7][7]_i_3_n_0 ),
        .S(sel0[1]));
  FDRE #(
    .INIT(1'b0)) 
    \sum_arr_bf_reg[7][8] 
       (.C(clk_IBUF_BUFG),
        .CE(\sum_arr_bf[7][9]_i_1_n_0 ),
        .D(sum_arr_bf[8]),
        .Q(\sum_arr_bf_reg[7] [8]),
        .R(1'b0));
  MUXF8 \sum_arr_bf_reg[7][8]_i_1 
       (.I0(\sum_arr_bf_reg[7][8]_i_2_n_0 ),
        .I1(\sum_arr_bf_reg[7][8]_i_3_n_0 ),
        .O(sum_arr_bf[8]),
        .S(sel0[2]));
  MUXF7 \sum_arr_bf_reg[7][8]_i_2 
       (.I0(\sum_arr_bf[7][8]_i_4_n_0 ),
        .I1(\sum_arr_bf[7][8]_i_5_n_0 ),
        .O(\sum_arr_bf_reg[7][8]_i_2_n_0 ),
        .S(sel0[1]));
  MUXF7 \sum_arr_bf_reg[7][8]_i_3 
       (.I0(\sum_arr_bf[7][8]_i_6_n_0 ),
        .I1(\sum_arr_bf[7][8]_i_7_n_0 ),
        .O(\sum_arr_bf_reg[7][8]_i_3_n_0 ),
        .S(sel0[1]));
  FDRE #(
    .INIT(1'b0)) 
    \sum_arr_bf_reg[7][9] 
       (.C(clk_IBUF_BUFG),
        .CE(\sum_arr_bf[7][9]_i_1_n_0 ),
        .D(sum_arr_bf[9]),
        .Q(\sum_arr_bf_reg[7] [9]),
        .R(1'b0));
  MUXF8 \sum_arr_bf_reg[7][9]_i_2 
       (.I0(\sum_arr_bf_reg[7][9]_i_4_n_0 ),
        .I1(\sum_arr_bf_reg[7][9]_i_5_n_0 ),
        .O(sum_arr_bf[9]),
        .S(sel0[2]));
  MUXF7 \sum_arr_bf_reg[7][9]_i_3 
       (.I0(\sum_arr_bf[7][9]_i_6_n_0 ),
        .I1(\sum_arr_bf[7][9]_i_7_n_0 ),
        .O(sel0[2]),
        .S(\index_reg_n_0_[2] ));
  MUXF7 \sum_arr_bf_reg[7][9]_i_4 
       (.I0(\sum_arr_bf[7][9]_i_8_n_0 ),
        .I1(\sum_arr_bf[7][9]_i_9_n_0 ),
        .O(\sum_arr_bf_reg[7][9]_i_4_n_0 ),
        .S(sel0[1]));
  MUXF7 \sum_arr_bf_reg[7][9]_i_5 
       (.I0(\sum_arr_bf[7][9]_i_10_n_0 ),
        .I1(\sum_arr_bf[7][9]_i_11_n_0 ),
        .O(\sum_arr_bf_reg[7][9]_i_5_n_0 ),
        .S(sel0[1]));
  FDCE #(
    .INIT(1'b0)) 
    \weights_bf_0_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(weights_bf_0_0),
        .CLR(rstn),
        .D(\weights_bf_0_reg[7]_0 [0]),
        .Q(weights_bf_0[0]));
  FDCE #(
    .INIT(1'b0)) 
    \weights_bf_0_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(weights_bf_0_0),
        .CLR(rstn),
        .D(\weights_bf_0_reg[7]_0 [1]),
        .Q(weights_bf_0[1]));
  FDCE #(
    .INIT(1'b0)) 
    \weights_bf_0_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(weights_bf_0_0),
        .CLR(rstn),
        .D(\weights_bf_0_reg[7]_0 [2]),
        .Q(weights_bf_0[2]));
  FDCE #(
    .INIT(1'b0)) 
    \weights_bf_0_reg[3] 
       (.C(clk_IBUF_BUFG),
        .CE(weights_bf_0_0),
        .CLR(rstn),
        .D(\weights_bf_0_reg[7]_0 [3]),
        .Q(weights_bf_0[3]));
  FDCE #(
    .INIT(1'b0)) 
    \weights_bf_0_reg[4] 
       (.C(clk_IBUF_BUFG),
        .CE(weights_bf_0_0),
        .CLR(rstn),
        .D(\weights_bf_0_reg[7]_0 [4]),
        .Q(weights_bf_0[4]));
  FDCE #(
    .INIT(1'b0)) 
    \weights_bf_0_reg[5] 
       (.C(clk_IBUF_BUFG),
        .CE(weights_bf_0_0),
        .CLR(rstn),
        .D(\weights_bf_0_reg[7]_0 [5]),
        .Q(weights_bf_0[5]));
  FDCE #(
    .INIT(1'b0)) 
    \weights_bf_0_reg[6] 
       (.C(clk_IBUF_BUFG),
        .CE(weights_bf_0_0),
        .CLR(rstn),
        .D(\weights_bf_0_reg[7]_0 [6]),
        .Q(weights_bf_0[6]));
  FDCE #(
    .INIT(1'b0)) 
    \weights_bf_0_reg[7] 
       (.C(clk_IBUF_BUFG),
        .CE(weights_bf_0_0),
        .CLR(rstn),
        .D(\weights_bf_0_reg[7]_0 [7]),
        .Q(weights_bf_0[7]));
  FDCE #(
    .INIT(1'b0)) 
    \weights_bf_1_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(weights_bf_0_0),
        .CLR(rstn),
        .D(\weights_bf_1_reg[7]_0 [0]),
        .Q(weights_bf_1[0]));
  FDCE #(
    .INIT(1'b0)) 
    \weights_bf_1_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(weights_bf_0_0),
        .CLR(rstn),
        .D(\weights_bf_1_reg[7]_0 [1]),
        .Q(weights_bf_1[1]));
  FDCE #(
    .INIT(1'b0)) 
    \weights_bf_1_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(weights_bf_0_0),
        .CLR(rstn),
        .D(\weights_bf_1_reg[7]_0 [2]),
        .Q(weights_bf_1[2]));
  FDCE #(
    .INIT(1'b0)) 
    \weights_bf_1_reg[3] 
       (.C(clk_IBUF_BUFG),
        .CE(weights_bf_0_0),
        .CLR(rstn),
        .D(\weights_bf_1_reg[7]_0 [3]),
        .Q(weights_bf_1[3]));
  FDCE #(
    .INIT(1'b0)) 
    \weights_bf_1_reg[4] 
       (.C(clk_IBUF_BUFG),
        .CE(weights_bf_0_0),
        .CLR(rstn),
        .D(\weights_bf_1_reg[7]_0 [4]),
        .Q(weights_bf_1[4]));
  FDCE #(
    .INIT(1'b0)) 
    \weights_bf_1_reg[5] 
       (.C(clk_IBUF_BUFG),
        .CE(weights_bf_0_0),
        .CLR(rstn),
        .D(\weights_bf_1_reg[7]_0 [5]),
        .Q(weights_bf_1[5]));
  FDCE #(
    .INIT(1'b0)) 
    \weights_bf_1_reg[6] 
       (.C(clk_IBUF_BUFG),
        .CE(weights_bf_0_0),
        .CLR(rstn),
        .D(\weights_bf_1_reg[7]_0 [6]),
        .Q(weights_bf_1[6]));
  FDCE #(
    .INIT(1'b0)) 
    \weights_bf_1_reg[7] 
       (.C(clk_IBUF_BUFG),
        .CE(weights_bf_0_0),
        .CLR(rstn),
        .D(\weights_bf_1_reg[7]_0 [7]),
        .Q(weights_bf_1[7]));
  FDCE #(
    .INIT(1'b0)) 
    \weights_bf_2_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(weights_bf_0_0),
        .CLR(rstn),
        .D(\weights_bf_2_reg[7]_0 [0]),
        .Q(weights_bf_2[0]));
  FDCE #(
    .INIT(1'b0)) 
    \weights_bf_2_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(weights_bf_0_0),
        .CLR(rstn),
        .D(\weights_bf_2_reg[7]_0 [1]),
        .Q(weights_bf_2[1]));
  FDCE #(
    .INIT(1'b0)) 
    \weights_bf_2_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(weights_bf_0_0),
        .CLR(rstn),
        .D(\weights_bf_2_reg[7]_0 [2]),
        .Q(weights_bf_2[2]));
  FDCE #(
    .INIT(1'b0)) 
    \weights_bf_2_reg[3] 
       (.C(clk_IBUF_BUFG),
        .CE(weights_bf_0_0),
        .CLR(rstn),
        .D(\weights_bf_2_reg[7]_0 [3]),
        .Q(weights_bf_2[3]));
  FDCE #(
    .INIT(1'b0)) 
    \weights_bf_2_reg[4] 
       (.C(clk_IBUF_BUFG),
        .CE(weights_bf_0_0),
        .CLR(rstn),
        .D(\weights_bf_2_reg[7]_0 [4]),
        .Q(weights_bf_2[4]));
  FDCE #(
    .INIT(1'b0)) 
    \weights_bf_2_reg[5] 
       (.C(clk_IBUF_BUFG),
        .CE(weights_bf_0_0),
        .CLR(rstn),
        .D(\weights_bf_2_reg[7]_0 [5]),
        .Q(weights_bf_2[5]));
  FDCE #(
    .INIT(1'b0)) 
    \weights_bf_2_reg[6] 
       (.C(clk_IBUF_BUFG),
        .CE(weights_bf_0_0),
        .CLR(rstn),
        .D(\weights_bf_2_reg[7]_0 [6]),
        .Q(weights_bf_2[6]));
  FDCE #(
    .INIT(1'b0)) 
    \weights_bf_2_reg[7] 
       (.C(clk_IBUF_BUFG),
        .CE(weights_bf_0_0),
        .CLR(rstn),
        .D(\weights_bf_2_reg[7]_0 [7]),
        .Q(weights_bf_2[7]));
endmodule

(* IN_BITWIDTH = "8" *) (* OUT_BITWIDTH = "20" *) (* STATE_DATA_RECEIVE = "2'b01" *) 
(* STATE_FINISH = "2'b11" *) (* STATE_IDLE = "2'b00" *) (* STATE_RUN = "2'b10" *) 
(* W_BITWIDTH = "8" *) 
(* NotValidForBitStream *)
module controller
   (clk,
    rstn,
    r_valid,
    data_in,
    t_valid,
    out_data);
  input clk;
  input rstn;
  input r_valid;
  input [31:0]data_in;
  output t_valid;
  output [31:0]out_data;

  wire \FSM_sequential_state[0]_i_1_n_0 ;
  wire \FSM_sequential_state[1]_i_1_n_0 ;
  wire clk;
  wire clk_IBUF;
  wire clk_IBUF_BUFG;
  wire \counter[0]_i_1_n_0 ;
  wire \counter[1]_i_1_n_0 ;
  wire \counter_reg_n_0_[0] ;
  wire \counter_reg_n_0_[1] ;
  wire [31:0]data_in;
  wire data_in_0;
  wire [7:0]data_in_0__0;
  wire [7:0]data_in_1;
  wire [7:0]data_in_2;
  wire [23:0]data_in_IBUF;
  wire data_receive_done_i_1_n_0;
  wire data_receive_done_reg_n_0;
  wire finish_done_i_1_n_0;
  wire finish_done_reg_n_0;
  wire mac_en_i_1_n_0;
  wire mac_en_reg_n_0;
  wire [19:0]out;
  wire [31:0]out_data;
  wire \out_data[19]_i_1_n_0 ;
  wire [19:0]out_data_OBUF;
  wire pre_sum;
  wire [18:0]pre_sum__0;
  wire r_valid;
  wire r_valid_IBUF;
  wire rstn;
  wire rstn_IBUF;
  wire run_done_reg_n_0;
  wire [1:0]state;
  wire t_valid;
  wire t_valid0_out;
  wire t_valid_OBUF;
  wire u_mac_n_0;
  wire u_mac_n_1;
  wire weights_0;
  wire [7:0]weights_0__0;
  wire [7:0]weights_1;
  wire \weights_2_reg_n_0_[0] ;
  wire \weights_2_reg_n_0_[1] ;
  wire \weights_2_reg_n_0_[2] ;
  wire \weights_2_reg_n_0_[3] ;
  wire \weights_2_reg_n_0_[4] ;
  wire \weights_2_reg_n_0_[5] ;
  wire \weights_2_reg_n_0_[6] ;
  wire \weights_2_reg_n_0_[7] ;

  LUT6 #(
    .INIT(64'h0F55FFCC0F5500CC)) 
    \FSM_sequential_state[0]_i_1 
       (.I0(data_receive_done_reg_n_0),
        .I1(r_valid_IBUF),
        .I2(finish_done_reg_n_0),
        .I3(state[1]),
        .I4(state[0]),
        .I5(run_done_reg_n_0),
        .O(\FSM_sequential_state[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT4 #(
    .INIT(16'h3AF0)) 
    \FSM_sequential_state[1]_i_1 
       (.I0(data_receive_done_reg_n_0),
        .I1(finish_done_reg_n_0),
        .I2(state[1]),
        .I3(state[0]),
        .O(\FSM_sequential_state[1]_i_1_n_0 ));
  (* FSM_ENCODED_STATES = "STATE_DATA_RECEIVE:01,STATE_RUN:10,STATE_IDLE:00,STATE_FINISH:11" *) 
  FDCE #(
    .INIT(1'b0)) 
    \FSM_sequential_state_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(u_mac_n_0),
        .D(\FSM_sequential_state[0]_i_1_n_0 ),
        .Q(state[0]));
  (* FSM_ENCODED_STATES = "STATE_DATA_RECEIVE:01,STATE_RUN:10,STATE_IDLE:00,STATE_FINISH:11" *) 
  FDCE #(
    .INIT(1'b0)) 
    \FSM_sequential_state_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(u_mac_n_0),
        .D(\FSM_sequential_state[1]_i_1_n_0 ),
        .Q(state[1]));
  BUFG clk_IBUF_BUFG_inst
       (.I(clk_IBUF),
        .O(clk_IBUF_BUFG));
  IBUF clk_IBUF_inst
       (.I(clk),
        .O(clk_IBUF));
  LUT5 #(
    .INIT(32'hABAA0400)) 
    \counter[0]_i_1 
       (.I0(state[1]),
        .I1(r_valid_IBUF),
        .I2(data_receive_done_reg_n_0),
        .I3(state[0]),
        .I4(\counter_reg_n_0_[0] ),
        .O(\counter[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hCCDFCCCC00200000)) 
    \counter[1]_i_1 
       (.I0(\counter_reg_n_0_[0] ),
        .I1(state[1]),
        .I2(r_valid_IBUF),
        .I3(data_receive_done_reg_n_0),
        .I4(state[0]),
        .I5(\counter_reg_n_0_[1] ),
        .O(\counter[1]_i_1_n_0 ));
  FDCE #(
    .INIT(1'b0)) 
    \counter_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(u_mac_n_0),
        .D(\counter[0]_i_1_n_0 ),
        .Q(\counter_reg_n_0_[0] ));
  FDCE #(
    .INIT(1'b0)) 
    \counter_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(u_mac_n_0),
        .D(\counter[1]_i_1_n_0 ),
        .Q(\counter_reg_n_0_[1] ));
  FDCE #(
    .INIT(1'b0)) 
    \data_in_0_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(data_in_0),
        .CLR(u_mac_n_0),
        .D(data_in_IBUF[0]),
        .Q(data_in_0__0[0]));
  FDCE #(
    .INIT(1'b0)) 
    \data_in_0_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(data_in_0),
        .CLR(u_mac_n_0),
        .D(data_in_IBUF[1]),
        .Q(data_in_0__0[1]));
  FDCE #(
    .INIT(1'b0)) 
    \data_in_0_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(data_in_0),
        .CLR(u_mac_n_0),
        .D(data_in_IBUF[2]),
        .Q(data_in_0__0[2]));
  FDCE #(
    .INIT(1'b0)) 
    \data_in_0_reg[3] 
       (.C(clk_IBUF_BUFG),
        .CE(data_in_0),
        .CLR(u_mac_n_0),
        .D(data_in_IBUF[3]),
        .Q(data_in_0__0[3]));
  FDCE #(
    .INIT(1'b0)) 
    \data_in_0_reg[4] 
       (.C(clk_IBUF_BUFG),
        .CE(data_in_0),
        .CLR(u_mac_n_0),
        .D(data_in_IBUF[4]),
        .Q(data_in_0__0[4]));
  FDCE #(
    .INIT(1'b0)) 
    \data_in_0_reg[5] 
       (.C(clk_IBUF_BUFG),
        .CE(data_in_0),
        .CLR(u_mac_n_0),
        .D(data_in_IBUF[5]),
        .Q(data_in_0__0[5]));
  FDCE #(
    .INIT(1'b0)) 
    \data_in_0_reg[6] 
       (.C(clk_IBUF_BUFG),
        .CE(data_in_0),
        .CLR(u_mac_n_0),
        .D(data_in_IBUF[6]),
        .Q(data_in_0__0[6]));
  FDCE #(
    .INIT(1'b0)) 
    \data_in_0_reg[7] 
       (.C(clk_IBUF_BUFG),
        .CE(data_in_0),
        .CLR(u_mac_n_0),
        .D(data_in_IBUF[7]),
        .Q(data_in_0__0[7]));
  FDCE #(
    .INIT(1'b0)) 
    \data_in_1_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(data_in_0),
        .CLR(u_mac_n_0),
        .D(data_in_IBUF[8]),
        .Q(data_in_1[0]));
  FDCE #(
    .INIT(1'b0)) 
    \data_in_1_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(data_in_0),
        .CLR(u_mac_n_0),
        .D(data_in_IBUF[9]),
        .Q(data_in_1[1]));
  FDCE #(
    .INIT(1'b0)) 
    \data_in_1_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(data_in_0),
        .CLR(u_mac_n_0),
        .D(data_in_IBUF[10]),
        .Q(data_in_1[2]));
  FDCE #(
    .INIT(1'b0)) 
    \data_in_1_reg[3] 
       (.C(clk_IBUF_BUFG),
        .CE(data_in_0),
        .CLR(u_mac_n_0),
        .D(data_in_IBUF[11]),
        .Q(data_in_1[3]));
  FDCE #(
    .INIT(1'b0)) 
    \data_in_1_reg[4] 
       (.C(clk_IBUF_BUFG),
        .CE(data_in_0),
        .CLR(u_mac_n_0),
        .D(data_in_IBUF[12]),
        .Q(data_in_1[4]));
  FDCE #(
    .INIT(1'b0)) 
    \data_in_1_reg[5] 
       (.C(clk_IBUF_BUFG),
        .CE(data_in_0),
        .CLR(u_mac_n_0),
        .D(data_in_IBUF[13]),
        .Q(data_in_1[5]));
  FDCE #(
    .INIT(1'b0)) 
    \data_in_1_reg[6] 
       (.C(clk_IBUF_BUFG),
        .CE(data_in_0),
        .CLR(u_mac_n_0),
        .D(data_in_IBUF[14]),
        .Q(data_in_1[6]));
  FDCE #(
    .INIT(1'b0)) 
    \data_in_1_reg[7] 
       (.C(clk_IBUF_BUFG),
        .CE(data_in_0),
        .CLR(u_mac_n_0),
        .D(data_in_IBUF[15]),
        .Q(data_in_1[7]));
  LUT6 #(
    .INIT(64'h0000000000400000)) 
    \data_in_2[7]_i_1 
       (.I0(state[1]),
        .I1(state[0]),
        .I2(\counter_reg_n_0_[0] ),
        .I3(\counter_reg_n_0_[1] ),
        .I4(r_valid_IBUF),
        .I5(data_receive_done_reg_n_0),
        .O(data_in_0));
  FDCE #(
    .INIT(1'b0)) 
    \data_in_2_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(data_in_0),
        .CLR(u_mac_n_0),
        .D(data_in_IBUF[16]),
        .Q(data_in_2[0]));
  FDCE #(
    .INIT(1'b0)) 
    \data_in_2_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(data_in_0),
        .CLR(u_mac_n_0),
        .D(data_in_IBUF[17]),
        .Q(data_in_2[1]));
  FDCE #(
    .INIT(1'b0)) 
    \data_in_2_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(data_in_0),
        .CLR(u_mac_n_0),
        .D(data_in_IBUF[18]),
        .Q(data_in_2[2]));
  FDCE #(
    .INIT(1'b0)) 
    \data_in_2_reg[3] 
       (.C(clk_IBUF_BUFG),
        .CE(data_in_0),
        .CLR(u_mac_n_0),
        .D(data_in_IBUF[19]),
        .Q(data_in_2[3]));
  FDCE #(
    .INIT(1'b0)) 
    \data_in_2_reg[4] 
       (.C(clk_IBUF_BUFG),
        .CE(data_in_0),
        .CLR(u_mac_n_0),
        .D(data_in_IBUF[20]),
        .Q(data_in_2[4]));
  FDCE #(
    .INIT(1'b0)) 
    \data_in_2_reg[5] 
       (.C(clk_IBUF_BUFG),
        .CE(data_in_0),
        .CLR(u_mac_n_0),
        .D(data_in_IBUF[21]),
        .Q(data_in_2[5]));
  FDCE #(
    .INIT(1'b0)) 
    \data_in_2_reg[6] 
       (.C(clk_IBUF_BUFG),
        .CE(data_in_0),
        .CLR(u_mac_n_0),
        .D(data_in_IBUF[22]),
        .Q(data_in_2[6]));
  FDCE #(
    .INIT(1'b0)) 
    \data_in_2_reg[7] 
       (.C(clk_IBUF_BUFG),
        .CE(data_in_0),
        .CLR(u_mac_n_0),
        .D(data_in_IBUF[23]),
        .Q(data_in_2[7]));
  IBUF \data_in_IBUF[0]_inst 
       (.I(data_in[0]),
        .O(data_in_IBUF[0]));
  IBUF \data_in_IBUF[10]_inst 
       (.I(data_in[10]),
        .O(data_in_IBUF[10]));
  IBUF \data_in_IBUF[11]_inst 
       (.I(data_in[11]),
        .O(data_in_IBUF[11]));
  IBUF \data_in_IBUF[12]_inst 
       (.I(data_in[12]),
        .O(data_in_IBUF[12]));
  IBUF \data_in_IBUF[13]_inst 
       (.I(data_in[13]),
        .O(data_in_IBUF[13]));
  IBUF \data_in_IBUF[14]_inst 
       (.I(data_in[14]),
        .O(data_in_IBUF[14]));
  IBUF \data_in_IBUF[15]_inst 
       (.I(data_in[15]),
        .O(data_in_IBUF[15]));
  IBUF \data_in_IBUF[16]_inst 
       (.I(data_in[16]),
        .O(data_in_IBUF[16]));
  IBUF \data_in_IBUF[17]_inst 
       (.I(data_in[17]),
        .O(data_in_IBUF[17]));
  IBUF \data_in_IBUF[18]_inst 
       (.I(data_in[18]),
        .O(data_in_IBUF[18]));
  IBUF \data_in_IBUF[19]_inst 
       (.I(data_in[19]),
        .O(data_in_IBUF[19]));
  IBUF \data_in_IBUF[1]_inst 
       (.I(data_in[1]),
        .O(data_in_IBUF[1]));
  IBUF \data_in_IBUF[20]_inst 
       (.I(data_in[20]),
        .O(data_in_IBUF[20]));
  IBUF \data_in_IBUF[21]_inst 
       (.I(data_in[21]),
        .O(data_in_IBUF[21]));
  IBUF \data_in_IBUF[22]_inst 
       (.I(data_in[22]),
        .O(data_in_IBUF[22]));
  IBUF \data_in_IBUF[23]_inst 
       (.I(data_in[23]),
        .O(data_in_IBUF[23]));
  IBUF \data_in_IBUF[2]_inst 
       (.I(data_in[2]),
        .O(data_in_IBUF[2]));
  IBUF \data_in_IBUF[3]_inst 
       (.I(data_in[3]),
        .O(data_in_IBUF[3]));
  IBUF \data_in_IBUF[4]_inst 
       (.I(data_in[4]),
        .O(data_in_IBUF[4]));
  IBUF \data_in_IBUF[5]_inst 
       (.I(data_in[5]),
        .O(data_in_IBUF[5]));
  IBUF \data_in_IBUF[6]_inst 
       (.I(data_in[6]),
        .O(data_in_IBUF[6]));
  IBUF \data_in_IBUF[7]_inst 
       (.I(data_in[7]),
        .O(data_in_IBUF[7]));
  IBUF \data_in_IBUF[8]_inst 
       (.I(data_in[8]),
        .O(data_in_IBUF[8]));
  IBUF \data_in_IBUF[9]_inst 
       (.I(data_in[9]),
        .O(data_in_IBUF[9]));
  LUT6 #(
    .INIT(64'hAAAA0400AAAA0000)) 
    data_receive_done_i_1
       (.I0(state[1]),
        .I1(\counter_reg_n_0_[1] ),
        .I2(\counter_reg_n_0_[0] ),
        .I3(r_valid_IBUF),
        .I4(data_receive_done_reg_n_0),
        .I5(state[0]),
        .O(data_receive_done_i_1_n_0));
  FDCE #(
    .INIT(1'b0)) 
    data_receive_done_reg
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(u_mac_n_0),
        .D(data_receive_done_i_1_n_0),
        .Q(data_receive_done_reg_n_0));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT3 #(
    .INIT(8'h68)) 
    finish_done_i_1
       (.I0(state[0]),
        .I1(state[1]),
        .I2(finish_done_reg_n_0),
        .O(finish_done_i_1_n_0));
  FDCE #(
    .INIT(1'b0)) 
    finish_done_reg
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(u_mac_n_0),
        .D(finish_done_i_1_n_0),
        .Q(finish_done_reg_n_0));
  LUT5 #(
    .INIT(32'hF7FF0400)) 
    mac_en_i_1
       (.I0(run_done_reg_n_0),
        .I1(rstn_IBUF),
        .I2(state[0]),
        .I3(state[1]),
        .I4(mac_en_reg_n_0),
        .O(mac_en_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    mac_en_reg
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(mac_en_i_1_n_0),
        .Q(mac_en_reg_n_0),
        .R(1'b0));
  LUT4 #(
    .INIT(16'h0800)) 
    \out_data[19]_i_1 
       (.I0(rstn_IBUF),
        .I1(state[0]),
        .I2(finish_done_reg_n_0),
        .I3(state[1]),
        .O(\out_data[19]_i_1_n_0 ));
  OBUF \out_data_OBUF[0]_inst 
       (.I(out_data_OBUF[0]),
        .O(out_data[0]));
  OBUF \out_data_OBUF[10]_inst 
       (.I(out_data_OBUF[10]),
        .O(out_data[10]));
  OBUF \out_data_OBUF[11]_inst 
       (.I(out_data_OBUF[11]),
        .O(out_data[11]));
  OBUF \out_data_OBUF[12]_inst 
       (.I(out_data_OBUF[12]),
        .O(out_data[12]));
  OBUF \out_data_OBUF[13]_inst 
       (.I(out_data_OBUF[13]),
        .O(out_data[13]));
  OBUF \out_data_OBUF[14]_inst 
       (.I(out_data_OBUF[14]),
        .O(out_data[14]));
  OBUF \out_data_OBUF[15]_inst 
       (.I(out_data_OBUF[15]),
        .O(out_data[15]));
  OBUF \out_data_OBUF[16]_inst 
       (.I(out_data_OBUF[16]),
        .O(out_data[16]));
  OBUF \out_data_OBUF[17]_inst 
       (.I(out_data_OBUF[17]),
        .O(out_data[17]));
  OBUF \out_data_OBUF[18]_inst 
       (.I(out_data_OBUF[18]),
        .O(out_data[18]));
  OBUF \out_data_OBUF[19]_inst 
       (.I(out_data_OBUF[19]),
        .O(out_data[19]));
  OBUF \out_data_OBUF[1]_inst 
       (.I(out_data_OBUF[1]),
        .O(out_data[1]));
  OBUF \out_data_OBUF[20]_inst 
       (.I(1'b0),
        .O(out_data[20]));
  OBUF \out_data_OBUF[21]_inst 
       (.I(1'b0),
        .O(out_data[21]));
  OBUF \out_data_OBUF[22]_inst 
       (.I(1'b0),
        .O(out_data[22]));
  OBUF \out_data_OBUF[23]_inst 
       (.I(1'b0),
        .O(out_data[23]));
  OBUF \out_data_OBUF[24]_inst 
       (.I(1'b0),
        .O(out_data[24]));
  OBUF \out_data_OBUF[25]_inst 
       (.I(1'b0),
        .O(out_data[25]));
  OBUF \out_data_OBUF[26]_inst 
       (.I(1'b0),
        .O(out_data[26]));
  OBUF \out_data_OBUF[27]_inst 
       (.I(1'b0),
        .O(out_data[27]));
  OBUF \out_data_OBUF[28]_inst 
       (.I(1'b0),
        .O(out_data[28]));
  OBUF \out_data_OBUF[29]_inst 
       (.I(1'b0),
        .O(out_data[29]));
  OBUF \out_data_OBUF[2]_inst 
       (.I(out_data_OBUF[2]),
        .O(out_data[2]));
  OBUF \out_data_OBUF[30]_inst 
       (.I(1'b0),
        .O(out_data[30]));
  OBUF \out_data_OBUF[31]_inst 
       (.I(1'b0),
        .O(out_data[31]));
  OBUF \out_data_OBUF[3]_inst 
       (.I(out_data_OBUF[3]),
        .O(out_data[3]));
  OBUF \out_data_OBUF[4]_inst 
       (.I(out_data_OBUF[4]),
        .O(out_data[4]));
  OBUF \out_data_OBUF[5]_inst 
       (.I(out_data_OBUF[5]),
        .O(out_data[5]));
  OBUF \out_data_OBUF[6]_inst 
       (.I(out_data_OBUF[6]),
        .O(out_data[6]));
  OBUF \out_data_OBUF[7]_inst 
       (.I(out_data_OBUF[7]),
        .O(out_data[7]));
  OBUF \out_data_OBUF[8]_inst 
       (.I(out_data_OBUF[8]),
        .O(out_data[8]));
  OBUF \out_data_OBUF[9]_inst 
       (.I(out_data_OBUF[9]),
        .O(out_data[9]));
  FDRE #(
    .INIT(1'b0)) 
    \out_data_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(\out_data[19]_i_1_n_0 ),
        .D(out[0]),
        .Q(out_data_OBUF[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \out_data_reg[10] 
       (.C(clk_IBUF_BUFG),
        .CE(\out_data[19]_i_1_n_0 ),
        .D(out[10]),
        .Q(out_data_OBUF[10]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \out_data_reg[11] 
       (.C(clk_IBUF_BUFG),
        .CE(\out_data[19]_i_1_n_0 ),
        .D(out[11]),
        .Q(out_data_OBUF[11]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \out_data_reg[12] 
       (.C(clk_IBUF_BUFG),
        .CE(\out_data[19]_i_1_n_0 ),
        .D(out[12]),
        .Q(out_data_OBUF[12]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \out_data_reg[13] 
       (.C(clk_IBUF_BUFG),
        .CE(\out_data[19]_i_1_n_0 ),
        .D(out[13]),
        .Q(out_data_OBUF[13]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \out_data_reg[14] 
       (.C(clk_IBUF_BUFG),
        .CE(\out_data[19]_i_1_n_0 ),
        .D(out[14]),
        .Q(out_data_OBUF[14]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \out_data_reg[15] 
       (.C(clk_IBUF_BUFG),
        .CE(\out_data[19]_i_1_n_0 ),
        .D(out[15]),
        .Q(out_data_OBUF[15]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \out_data_reg[16] 
       (.C(clk_IBUF_BUFG),
        .CE(\out_data[19]_i_1_n_0 ),
        .D(out[16]),
        .Q(out_data_OBUF[16]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \out_data_reg[17] 
       (.C(clk_IBUF_BUFG),
        .CE(\out_data[19]_i_1_n_0 ),
        .D(out[17]),
        .Q(out_data_OBUF[17]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \out_data_reg[18] 
       (.C(clk_IBUF_BUFG),
        .CE(\out_data[19]_i_1_n_0 ),
        .D(out[18]),
        .Q(out_data_OBUF[18]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \out_data_reg[19] 
       (.C(clk_IBUF_BUFG),
        .CE(\out_data[19]_i_1_n_0 ),
        .D(out[19]),
        .Q(out_data_OBUF[19]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \out_data_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(\out_data[19]_i_1_n_0 ),
        .D(out[1]),
        .Q(out_data_OBUF[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \out_data_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(\out_data[19]_i_1_n_0 ),
        .D(out[2]),
        .Q(out_data_OBUF[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \out_data_reg[3] 
       (.C(clk_IBUF_BUFG),
        .CE(\out_data[19]_i_1_n_0 ),
        .D(out[3]),
        .Q(out_data_OBUF[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \out_data_reg[4] 
       (.C(clk_IBUF_BUFG),
        .CE(\out_data[19]_i_1_n_0 ),
        .D(out[4]),
        .Q(out_data_OBUF[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \out_data_reg[5] 
       (.C(clk_IBUF_BUFG),
        .CE(\out_data[19]_i_1_n_0 ),
        .D(out[5]),
        .Q(out_data_OBUF[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \out_data_reg[6] 
       (.C(clk_IBUF_BUFG),
        .CE(\out_data[19]_i_1_n_0 ),
        .D(out[6]),
        .Q(out_data_OBUF[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \out_data_reg[7] 
       (.C(clk_IBUF_BUFG),
        .CE(\out_data[19]_i_1_n_0 ),
        .D(out[7]),
        .Q(out_data_OBUF[7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \out_data_reg[8] 
       (.C(clk_IBUF_BUFG),
        .CE(\out_data[19]_i_1_n_0 ),
        .D(out[8]),
        .Q(out_data_OBUF[8]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \out_data_reg[9] 
       (.C(clk_IBUF_BUFG),
        .CE(\out_data[19]_i_1_n_0 ),
        .D(out[9]),
        .Q(out_data_OBUF[9]),
        .R(1'b0));
  LUT6 #(
    .INIT(64'h0000000000400000)) 
    \pre_sum[18]_i_1 
       (.I0(state[1]),
        .I1(state[0]),
        .I2(\counter_reg_n_0_[1] ),
        .I3(\counter_reg_n_0_[0] ),
        .I4(r_valid_IBUF),
        .I5(data_receive_done_reg_n_0),
        .O(pre_sum));
  FDCE #(
    .INIT(1'b0)) 
    \pre_sum_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(pre_sum),
        .CLR(u_mac_n_0),
        .D(data_in_IBUF[0]),
        .Q(pre_sum__0[0]));
  FDCE #(
    .INIT(1'b0)) 
    \pre_sum_reg[10] 
       (.C(clk_IBUF_BUFG),
        .CE(pre_sum),
        .CLR(u_mac_n_0),
        .D(data_in_IBUF[10]),
        .Q(pre_sum__0[10]));
  FDCE #(
    .INIT(1'b0)) 
    \pre_sum_reg[11] 
       (.C(clk_IBUF_BUFG),
        .CE(pre_sum),
        .CLR(u_mac_n_0),
        .D(data_in_IBUF[11]),
        .Q(pre_sum__0[11]));
  FDCE #(
    .INIT(1'b0)) 
    \pre_sum_reg[12] 
       (.C(clk_IBUF_BUFG),
        .CE(pre_sum),
        .CLR(u_mac_n_0),
        .D(data_in_IBUF[12]),
        .Q(pre_sum__0[12]));
  FDCE #(
    .INIT(1'b0)) 
    \pre_sum_reg[13] 
       (.C(clk_IBUF_BUFG),
        .CE(pre_sum),
        .CLR(u_mac_n_0),
        .D(data_in_IBUF[13]),
        .Q(pre_sum__0[13]));
  FDCE #(
    .INIT(1'b0)) 
    \pre_sum_reg[14] 
       (.C(clk_IBUF_BUFG),
        .CE(pre_sum),
        .CLR(u_mac_n_0),
        .D(data_in_IBUF[14]),
        .Q(pre_sum__0[14]));
  FDCE #(
    .INIT(1'b0)) 
    \pre_sum_reg[15] 
       (.C(clk_IBUF_BUFG),
        .CE(pre_sum),
        .CLR(u_mac_n_0),
        .D(data_in_IBUF[15]),
        .Q(pre_sum__0[15]));
  FDCE #(
    .INIT(1'b0)) 
    \pre_sum_reg[16] 
       (.C(clk_IBUF_BUFG),
        .CE(pre_sum),
        .CLR(u_mac_n_0),
        .D(data_in_IBUF[16]),
        .Q(pre_sum__0[16]));
  FDCE #(
    .INIT(1'b0)) 
    \pre_sum_reg[17] 
       (.C(clk_IBUF_BUFG),
        .CE(pre_sum),
        .CLR(u_mac_n_0),
        .D(data_in_IBUF[17]),
        .Q(pre_sum__0[17]));
  FDCE #(
    .INIT(1'b0)) 
    \pre_sum_reg[18] 
       (.C(clk_IBUF_BUFG),
        .CE(pre_sum),
        .CLR(u_mac_n_0),
        .D(data_in_IBUF[18]),
        .Q(pre_sum__0[18]));
  FDCE #(
    .INIT(1'b0)) 
    \pre_sum_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(pre_sum),
        .CLR(u_mac_n_0),
        .D(data_in_IBUF[1]),
        .Q(pre_sum__0[1]));
  FDCE #(
    .INIT(1'b0)) 
    \pre_sum_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(pre_sum),
        .CLR(u_mac_n_0),
        .D(data_in_IBUF[2]),
        .Q(pre_sum__0[2]));
  FDCE #(
    .INIT(1'b0)) 
    \pre_sum_reg[3] 
       (.C(clk_IBUF_BUFG),
        .CE(pre_sum),
        .CLR(u_mac_n_0),
        .D(data_in_IBUF[3]),
        .Q(pre_sum__0[3]));
  FDCE #(
    .INIT(1'b0)) 
    \pre_sum_reg[4] 
       (.C(clk_IBUF_BUFG),
        .CE(pre_sum),
        .CLR(u_mac_n_0),
        .D(data_in_IBUF[4]),
        .Q(pre_sum__0[4]));
  FDCE #(
    .INIT(1'b0)) 
    \pre_sum_reg[5] 
       (.C(clk_IBUF_BUFG),
        .CE(pre_sum),
        .CLR(u_mac_n_0),
        .D(data_in_IBUF[5]),
        .Q(pre_sum__0[5]));
  FDCE #(
    .INIT(1'b0)) 
    \pre_sum_reg[6] 
       (.C(clk_IBUF_BUFG),
        .CE(pre_sum),
        .CLR(u_mac_n_0),
        .D(data_in_IBUF[6]),
        .Q(pre_sum__0[6]));
  FDCE #(
    .INIT(1'b0)) 
    \pre_sum_reg[7] 
       (.C(clk_IBUF_BUFG),
        .CE(pre_sum),
        .CLR(u_mac_n_0),
        .D(data_in_IBUF[7]),
        .Q(pre_sum__0[7]));
  FDCE #(
    .INIT(1'b0)) 
    \pre_sum_reg[8] 
       (.C(clk_IBUF_BUFG),
        .CE(pre_sum),
        .CLR(u_mac_n_0),
        .D(data_in_IBUF[8]),
        .Q(pre_sum__0[8]));
  FDCE #(
    .INIT(1'b0)) 
    \pre_sum_reg[9] 
       (.C(clk_IBUF_BUFG),
        .CE(pre_sum),
        .CLR(u_mac_n_0),
        .D(data_in_IBUF[9]),
        .Q(pre_sum__0[9]));
  IBUF r_valid_IBUF_inst
       (.I(r_valid),
        .O(r_valid_IBUF));
  IBUF rstn_IBUF_inst
       (.I(rstn),
        .O(rstn_IBUF));
  FDCE #(
    .INIT(1'b0)) 
    run_done_reg
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(u_mac_n_0),
        .D(u_mac_n_1),
        .Q(run_done_reg_n_0));
  OBUF t_valid_OBUF_inst
       (.I(t_valid_OBUF),
        .O(t_valid));
  LUT4 #(
    .INIT(16'h8000)) 
    t_valid_i_1
       (.I0(rstn_IBUF),
        .I1(finish_done_reg_n_0),
        .I2(state[0]),
        .I3(state[1]),
        .O(t_valid0_out));
  FDRE #(
    .INIT(1'b0)) 
    t_valid_reg
       (.C(clk_IBUF_BUFG),
        .CE(t_valid0_out),
        .D(finish_done_reg_n_0),
        .Q(t_valid_OBUF),
        .R(1'b0));
  MAC u_mac
       (.\FSM_onehot_state_reg[2]_0 (mac_en_reg_n_0),
        .\FSM_sequential_state_reg[0] (u_mac_n_1),
        .Q(pre_sum__0),
        .clk_IBUF_BUFG(clk_IBUF_BUFG),
        .\data_in_bf_0_reg[7]_0 (data_in_0__0),
        .\data_in_bf_1_reg[7]_0 (data_in_1),
        .\data_in_bf_2_reg[7]_0 (data_in_2),
        .\out_temp_reg[19]_0 (out),
        .rstn(u_mac_n_0),
        .rstn_IBUF(rstn_IBUF),
        .run_done_reg(run_done_reg_n_0),
        .state(state),
        .\weights_bf_0_reg[7]_0 (weights_0__0),
        .\weights_bf_1_reg[7]_0 (weights_1),
        .\weights_bf_2_reg[7]_0 ({\weights_2_reg_n_0_[7] ,\weights_2_reg_n_0_[6] ,\weights_2_reg_n_0_[5] ,\weights_2_reg_n_0_[4] ,\weights_2_reg_n_0_[3] ,\weights_2_reg_n_0_[2] ,\weights_2_reg_n_0_[1] ,\weights_2_reg_n_0_[0] }));
  FDCE #(
    .INIT(1'b0)) 
    \weights_0_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(weights_0),
        .CLR(u_mac_n_0),
        .D(data_in_IBUF[0]),
        .Q(weights_0__0[0]));
  FDCE #(
    .INIT(1'b0)) 
    \weights_0_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(weights_0),
        .CLR(u_mac_n_0),
        .D(data_in_IBUF[1]),
        .Q(weights_0__0[1]));
  FDCE #(
    .INIT(1'b0)) 
    \weights_0_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(weights_0),
        .CLR(u_mac_n_0),
        .D(data_in_IBUF[2]),
        .Q(weights_0__0[2]));
  FDCE #(
    .INIT(1'b0)) 
    \weights_0_reg[3] 
       (.C(clk_IBUF_BUFG),
        .CE(weights_0),
        .CLR(u_mac_n_0),
        .D(data_in_IBUF[3]),
        .Q(weights_0__0[3]));
  FDCE #(
    .INIT(1'b0)) 
    \weights_0_reg[4] 
       (.C(clk_IBUF_BUFG),
        .CE(weights_0),
        .CLR(u_mac_n_0),
        .D(data_in_IBUF[4]),
        .Q(weights_0__0[4]));
  FDCE #(
    .INIT(1'b0)) 
    \weights_0_reg[5] 
       (.C(clk_IBUF_BUFG),
        .CE(weights_0),
        .CLR(u_mac_n_0),
        .D(data_in_IBUF[5]),
        .Q(weights_0__0[5]));
  FDCE #(
    .INIT(1'b0)) 
    \weights_0_reg[6] 
       (.C(clk_IBUF_BUFG),
        .CE(weights_0),
        .CLR(u_mac_n_0),
        .D(data_in_IBUF[6]),
        .Q(weights_0__0[6]));
  FDCE #(
    .INIT(1'b0)) 
    \weights_0_reg[7] 
       (.C(clk_IBUF_BUFG),
        .CE(weights_0),
        .CLR(u_mac_n_0),
        .D(data_in_IBUF[7]),
        .Q(weights_0__0[7]));
  FDCE #(
    .INIT(1'b0)) 
    \weights_1_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(weights_0),
        .CLR(u_mac_n_0),
        .D(data_in_IBUF[8]),
        .Q(weights_1[0]));
  FDCE #(
    .INIT(1'b0)) 
    \weights_1_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(weights_0),
        .CLR(u_mac_n_0),
        .D(data_in_IBUF[9]),
        .Q(weights_1[1]));
  FDCE #(
    .INIT(1'b0)) 
    \weights_1_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(weights_0),
        .CLR(u_mac_n_0),
        .D(data_in_IBUF[10]),
        .Q(weights_1[2]));
  FDCE #(
    .INIT(1'b0)) 
    \weights_1_reg[3] 
       (.C(clk_IBUF_BUFG),
        .CE(weights_0),
        .CLR(u_mac_n_0),
        .D(data_in_IBUF[11]),
        .Q(weights_1[3]));
  FDCE #(
    .INIT(1'b0)) 
    \weights_1_reg[4] 
       (.C(clk_IBUF_BUFG),
        .CE(weights_0),
        .CLR(u_mac_n_0),
        .D(data_in_IBUF[12]),
        .Q(weights_1[4]));
  FDCE #(
    .INIT(1'b0)) 
    \weights_1_reg[5] 
       (.C(clk_IBUF_BUFG),
        .CE(weights_0),
        .CLR(u_mac_n_0),
        .D(data_in_IBUF[13]),
        .Q(weights_1[5]));
  FDCE #(
    .INIT(1'b0)) 
    \weights_1_reg[6] 
       (.C(clk_IBUF_BUFG),
        .CE(weights_0),
        .CLR(u_mac_n_0),
        .D(data_in_IBUF[14]),
        .Q(weights_1[6]));
  FDCE #(
    .INIT(1'b0)) 
    \weights_1_reg[7] 
       (.C(clk_IBUF_BUFG),
        .CE(weights_0),
        .CLR(u_mac_n_0),
        .D(data_in_IBUF[15]),
        .Q(weights_1[7]));
  LUT6 #(
    .INIT(64'h0000000000040000)) 
    \weights_2[7]_i_1 
       (.I0(state[1]),
        .I1(state[0]),
        .I2(\counter_reg_n_0_[1] ),
        .I3(\counter_reg_n_0_[0] ),
        .I4(r_valid_IBUF),
        .I5(data_receive_done_reg_n_0),
        .O(weights_0));
  FDCE #(
    .INIT(1'b0)) 
    \weights_2_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(weights_0),
        .CLR(u_mac_n_0),
        .D(data_in_IBUF[16]),
        .Q(\weights_2_reg_n_0_[0] ));
  FDCE #(
    .INIT(1'b0)) 
    \weights_2_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(weights_0),
        .CLR(u_mac_n_0),
        .D(data_in_IBUF[17]),
        .Q(\weights_2_reg_n_0_[1] ));
  FDCE #(
    .INIT(1'b0)) 
    \weights_2_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(weights_0),
        .CLR(u_mac_n_0),
        .D(data_in_IBUF[18]),
        .Q(\weights_2_reg_n_0_[2] ));
  FDCE #(
    .INIT(1'b0)) 
    \weights_2_reg[3] 
       (.C(clk_IBUF_BUFG),
        .CE(weights_0),
        .CLR(u_mac_n_0),
        .D(data_in_IBUF[19]),
        .Q(\weights_2_reg_n_0_[3] ));
  FDCE #(
    .INIT(1'b0)) 
    \weights_2_reg[4] 
       (.C(clk_IBUF_BUFG),
        .CE(weights_0),
        .CLR(u_mac_n_0),
        .D(data_in_IBUF[20]),
        .Q(\weights_2_reg_n_0_[4] ));
  FDCE #(
    .INIT(1'b0)) 
    \weights_2_reg[5] 
       (.C(clk_IBUF_BUFG),
        .CE(weights_0),
        .CLR(u_mac_n_0),
        .D(data_in_IBUF[21]),
        .Q(\weights_2_reg_n_0_[5] ));
  FDCE #(
    .INIT(1'b0)) 
    \weights_2_reg[6] 
       (.C(clk_IBUF_BUFG),
        .CE(weights_0),
        .CLR(u_mac_n_0),
        .D(data_in_IBUF[22]),
        .Q(\weights_2_reg_n_0_[6] ));
  FDCE #(
    .INIT(1'b0)) 
    \weights_2_reg[7] 
       (.C(clk_IBUF_BUFG),
        .CE(weights_0),
        .CLR(u_mac_n_0),
        .D(data_in_IBUF[23]),
        .Q(\weights_2_reg_n_0_[7] ));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif

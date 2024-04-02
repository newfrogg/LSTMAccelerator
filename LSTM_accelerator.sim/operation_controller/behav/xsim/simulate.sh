#!/bin/bash -f
# ****************************************************************************
# Vivado (TM) v2023.1 (64-bit)
#
# Filename    : simulate.sh
# Simulator   : Xilinx Vivado Simulator
# Description : Script for simulating the design by launching the simulator
#
# Generated by Vivado on Tue Apr 02 09:06:41 +07 2024
# SW Build 3865809 on Sun May  7 15:04:56 MDT 2023
#
# IP Build 3864474 on Sun May  7 20:36:21 MDT 2023
#
# usage: simulate.sh
#
# ****************************************************************************
set -Eeuo pipefail
# simulate design
echo "xsim tb_operation_controller_behav -key {Behavioral:operation_controller:Functional:tb_operation_controller} -tclbatch tb_operation_controller.tcl -log simulate.log"
xsim tb_operation_controller_behav -key {Behavioral:operation_controller:Functional:tb_operation_controller} -tclbatch tb_operation_controller.tcl -log simulate.log


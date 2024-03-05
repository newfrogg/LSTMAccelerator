# # Sigmoid Activation 

HDL code for LUT Sigmoid activation
## Describes

Create LUT for Sigmoid activation on 32-bit input and 8-bit output. The reason for 32-bit input is bitwidth of biases equal to 32. In this module, range of input from -5.6 to 5.6 is divided to 2^32 values. Because value of sigmoid always in range (0, 1), output format represented in normal binary format (neither 2's complement nor 1's complement)


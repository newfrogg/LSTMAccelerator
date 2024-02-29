module sigmoid import accel_pkg::*; #(
    parameter int unsigned WL = ELEMENT_BITS
) (
    input logic clk_i,
    input logic rst_ni,


    input logic [WL-1:0] sigm_i,

    output logic [WL-1:0] sigm_o,

    output logic sigm_valid_o
);


endmodule

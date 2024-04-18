module accelerator_top 
(

    input logic clk,
    input logic rst_ni,
    // Device side
    input logic device_req_i,
    input logic [31:0] device_addr_i,
    input logic device_we_i,
    input logic [3:0] device_be_i,
    input logic [31:0] device_wdata_i,
    output logic device_rvalid_o,
    output logic [31:0] device_rdata_o
    // Interrupt
    // output logic accel_irq
);
    localparam
        NO_UNITS                = 2,
        NO_FEATURES             = 3,
        NO_TIMESTEPS            = 2,

        W_BITWIDTH              = 8,
        IN_BITWIDTH             = 8,
        OUT_BITWIDTH            = 32,
        B_BITWIDTH              = 32,
        SIZE_BUFFER             = 10,
        N_WEIGHTS               = 4,
        N_BIASES                = 4,
        N_INPUTS                = 1,
        N_GATES                 = 4;

    localparam int unsigned ACCEL_DATA_IN_REG = 32'h0;

    // 3 Weight + 1 Input (3 * 8 + 8) for a 32-bit data cell
    localparam int unsigned WEIGHT_INPUT_DATA_SPACE_SIZE = NO_UNITS * N_GATES;
    localparam int unsigned BIAS_DATA_SPACE_SIZE = NO_UNITS * N_GATES;

    localparam int unsigned WEIGHT_INPUT_DATA_SPACE_START = 32'h4;
    localparam int unsigned WEIGHT_INPUT_DATA_SPACE_END = WEIGHT_INPUT_DATA_SPACE_START + WEIGHT_INPUT_DATA_SPACE_SIZE;

    localparam int unsigned BIAS_DATA_SPACE_START = WEIGHT_INPUT_DATA_SPACE_END + 32'h4;
    localparam int unsigned BIAS_DATA_SPACE_END = BIAS_DATA_SPACE_START + BIAS_DATA_SPACE_SIZE;

    // localparam int unsigned ACCEL_DATA_OUT_REG = 32'h132;

    logic [31:0] reg_addr;
    logic accel_data_in_wr_en;
    logic accel_load_data_in_finshed_rd_en;
    logic accel_data_out_rd_en;
    logic [31:0] data_in_accel;

    logic is_last_data_gate;




    assign reg_addr = device_addr_i;
    assign accel_data_in_wr_en = device_req_i & device_we_i & (reg_addr >= DATA_IN_START[31:0] & reg_addr <= DATA_IN_END);
    assign accel_load_data_in_finshed_rd_en = device_req_i & ~device_we_i & (reg_addr == ACCEL_LOAD_DATA_IN_FINISHED);
    assign accel_data_out_rd_en = device_req_i & ~device_we_i & ( reg_addr == ACCEL_DATA_OUT_REG);

    always @(posedge clk or rst_ni) begin
        if(!rst_ni) begin
            device_rvalid_o <= '0;

        end
        else begin
            if (accel_data_in_wr_en) begin
                data_in_accel <= device_wdata_i;
                if (reg_addr == DATA_IN_END) begin
                    is_last_data_gate <= 1'b1;
                end
            end
            else if (accel_load_data_in_finshed_rd_en) begin
                
            end
        end
    end


    controller u_controller (
        .clk(clk),
        .rstn(rst_ni),

    );



endmodule

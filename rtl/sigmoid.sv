`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/08/2024 08:15:17 AM
// Design Name: 
// Module Name: sigmoid
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


module sigmoid #(parameter INPUT_WIDTH = 32,
                 parameter OUTPUT_WIDTH = 8)(           
        input   logic   [INPUT_WIDTH - 1:0]  data_in,    //  32 bits input
        output  logic   [OUTPUT_WIDTH - 1:0] data_out    // 8 bits output
    );
    always_comb begin
        if ((data_in >= 32'h80000000) && (data_in < 32'h9181450a)) begin
            data_out <= 8'b00000000;
        end
        else if ((data_in >= 32'h9181450a) && (data_in < 32'ha16a644a)) begin
            data_out <= 8'b00000001;
        end
        else if ((data_in >= 32'ha16a644a) && (data_in < 32'haad3dbdd)) begin
            data_out <= 8'b00000010;
        end
        else if ((data_in >= 32'haad3dbdd) && (data_in < 32'hb19159f4)) begin
            data_out <= 8'b00000011;
        end
        else if ((data_in >= 32'hb19159f4) && (data_in < 32'hb6d7865e)) begin
            data_out <= 8'b00000100;
        end
        else if ((data_in >= 32'hb6d7865e) && (data_in < 32'hbb3030c2)) begin
            data_out <= 8'b00000101;
        end
        else if ((data_in >= 32'hbb3030c2) && (data_in < 32'hbee4f71b)) begin
            data_out <= 8'b00000110;
        end
        else if ((data_in >= 32'hbee4f71b) && (data_in < 32'hc221d5c5)) begin
            data_out <= 8'b00000111;
        end
        else if ((data_in >= 32'hc221d5c5) && (data_in < 32'hc5033150)) begin
            data_out <= 8'b00001000;
        end
        else if ((data_in >= 32'hc5033150) && (data_in < 32'hc79c6fb1)) begin
            data_out <= 8'b00001001;
        end
        else if ((data_in >= 32'hc79c6fb1) && (data_in < 32'hc9fb68d5)) begin
            data_out <= 8'b00001010;
        end
        else if ((data_in >= 32'hc9fb68d5) && (data_in < 32'hcc2a56c4)) begin
            data_out <= 8'b00001011;
        end
        else if ((data_in >= 32'hcc2a56c4) && (data_in < 32'hce30fea7)) begin
            data_out <= 8'b00001100;
        end
        else if ((data_in >= 32'hce30fea7) && (data_in < 32'hd0156b82)) begin
            data_out <= 8'b00001101;
        end
        else if ((data_in >= 32'hd0156b82) && (data_in < 32'hd1dc685d)) begin
            data_out <= 8'b00001110;
        end
        else if ((data_in >= 32'hd1dc685d) && (data_in < 32'hd389d301)) begin
            data_out <= 8'b00001111;
        end
        else if ((data_in >= 32'hd389d301) && (data_in < 32'hd520d589)) begin
            data_out <= 8'b00010000;
        end
        else if ((data_in >= 32'hd520d589) && (data_in < 32'hd6a40f86)) begin
            data_out <= 8'b00010001;
        end
        else if ((data_in >= 32'hd6a40f86) && (data_in < 32'hd815b3fd)) begin
            data_out <= 8'b00010010;
        end
        else if ((data_in >= 32'hd815b3fd) && (data_in < 32'hd9779fb1)) begin
            data_out <= 8'b00010011;
        end
        else if ((data_in >= 32'hd9779fb1) && (data_in < 32'hdacb69ff)) begin
            data_out <= 8'b00010100;
        end
        else if ((data_in >= 32'hdacb69ff) && (data_in < 32'hdc1271ce)) begin
            data_out <= 8'b00010101;
        end
        else if ((data_in >= 32'hdc1271ce) && (data_in < 32'hdd4de79c)) begin
            data_out <= 8'b00010110;
        end
        else if ((data_in >= 32'hdd4de79c) && (data_in < 32'hde7ed569)) begin
            data_out <= 8'b00010111;
        end
        else if ((data_in >= 32'hde7ed569) && (data_in < 32'hdfa62503)) begin
            data_out <= 8'b00011000;
        end
        else if ((data_in >= 32'hdfa62503) && (data_in < 32'he0c4a51a)) begin
            data_out <= 8'b00011001;
        end
        else if ((data_in >= 32'he0c4a51a) && (data_in < 32'he1db0d58)) begin
            data_out <= 8'b00011010;
        end
        else if ((data_in >= 32'he1db0d58) && (data_in < 32'he2ea01c2)) begin
            data_out <= 8'b00011011;
        end
        else if ((data_in >= 32'he2ea01c2) && (data_in < 32'he3f2157c)) begin
            data_out <= 8'b00011100;
        end
        else if ((data_in >= 32'he3f2157c) && (data_in < 32'he4f3cd15)) begin
            data_out <= 8'b00011101;
        end
        else if ((data_in >= 32'he4f3cd15) && (data_in < 32'he5efa079)) begin
            data_out <= 8'b00011110;
        end
        else if ((data_in >= 32'he5efa079) && (data_in < 32'he6e5fc8c)) begin
            data_out <= 8'b00011111;
        end
        else if ((data_in >= 32'he6e5fc8c) && (data_in < 32'he7d7448c)) begin
            data_out <= 8'b00100000;
        end
        else if ((data_in >= 32'he7d7448c) && (data_in < 32'he8c3d33a)) begin
            data_out <= 8'b00100001;
        end
        else if ((data_in >= 32'he8c3d33a) && (data_in < 32'he9abfbdf)) begin
            data_out <= 8'b00100010;
        end
        else if ((data_in >= 32'he9abfbdf) && (data_in < 32'hea900b20)) begin
            data_out <= 8'b00100011;
        end
        else if ((data_in >= 32'hea900b20) && (data_in < 32'heb7047c5)) begin
            data_out <= 8'b00100100;
        end
        else if ((data_in >= 32'heb7047c5) && (data_in < 32'hec4cf358)) begin
            data_out <= 8'b00100101;
        end
        else if ((data_in >= 32'hec4cf358) && (data_in < 32'hed264ab8)) begin
            data_out <= 8'b00100110;
        end
        else if ((data_in >= 32'hed264ab8) && (data_in < 32'hedfc8696)) begin
            data_out <= 8'b00100111;
        end
        else if ((data_in >= 32'hedfc8696) && (data_in < 32'heecfdbe4)) begin
            data_out <= 8'b00101000;
        end
        else if ((data_in >= 32'heecfdbe4) && (data_in < 32'hefa07c38)) begin
            data_out <= 8'b00101001;
        end
        else if ((data_in >= 32'hefa07c38) && (data_in < 32'hf06e961f)) begin
            data_out <= 8'b00101010;
        end
        else if ((data_in >= 32'hf06e961f) && (data_in < 32'hf13a556d)) begin
            data_out <= 8'b00101011;
        end
        else if ((data_in >= 32'hf13a556d) && (data_in < 32'hf203e380)) begin
            data_out <= 8'b00101100;
        end
        else if ((data_in >= 32'hf203e380) && (data_in < 32'hf2cb6780)) begin
            data_out <= 8'b00101101;
        end
        else if ((data_in >= 32'hf2cb6780) && (data_in < 32'hf3910690)) begin
            data_out <= 8'b00101110;
        end
        else if ((data_in >= 32'hf3910690) && (data_in < 32'hf454e408)) begin
            data_out <= 8'b00101111;
        end
        else if ((data_in >= 32'hf454e408) && (data_in < 32'hf517219a)) begin
            data_out <= 8'b00110000;
        end
        else if ((data_in >= 32'hf517219a) && (data_in < 32'hf5d7df82)) begin
            data_out <= 8'b00110001;
        end
        else if ((data_in >= 32'hf5d7df82) && (data_in < 32'hf6973ca5)) begin
            data_out <= 8'b00110010;
        end
        else if ((data_in >= 32'hf6973ca5) && (data_in < 32'hf75556b7)) begin
            data_out <= 8'b00110011;
        end
        else if ((data_in >= 32'hf75556b7) && (data_in < 32'hf8124a59)) begin
            data_out <= 8'b00110100;
        end
        else if ((data_in >= 32'hf8124a59) && (data_in < 32'hf8ce3336)) begin
            data_out <= 8'b00110101;
        end
        else if ((data_in >= 32'hf8ce3336) && (data_in < 32'hf9892c20)) begin
            data_out <= 8'b00110110;
        end
        else if ((data_in >= 32'hf9892c20) && (data_in < 32'hfa434f23)) begin
            data_out <= 8'b00110111;
        end
        else if ((data_in >= 32'hfa434f23) && (data_in < 32'hfafcb5a6)) begin
            data_out <= 8'b00111000;
        end
        else if ((data_in >= 32'hfafcb5a6) && (data_in < 32'hfbb57876)) begin
            data_out <= 8'b00111001;
        end
        else if ((data_in >= 32'hfbb57876) && (data_in < 32'hfc6dafe6)) begin
            data_out <= 8'b00111010;
        end
        else if ((data_in >= 32'hfc6dafe6) && (data_in < 32'hfd2573d9)) begin
            data_out <= 8'b00111011;
        end
        else if ((data_in >= 32'hfd2573d9) && (data_in < 32'hfddcdbdd)) begin
            data_out <= 8'b00111100;
        end
        else if ((data_in >= 32'hfddcdbdd) && (data_in < 32'hfe93ff38)) begin
            data_out <= 8'b00111101;
        end
        else if ((data_in >= 32'hfe93ff38) && (data_in < 32'hff4af4fd)) begin
            data_out <= 8'b00111110;
        end
        else if ((data_in >= 32'hff4af4fd) && (data_in < 32'h1d41d)) begin
            data_out <= 8'b00111111;
        end
        else if ((data_in >= 32'h1d41d) && (data_in < 32'hb8b378)) begin
            data_out <= 8'b01000000;
        end
        else if ((data_in >= 32'hb8b378) && (data_in < 32'h16fa9ed)) begin
            data_out <= 8'b01000001;
        end
        else if ((data_in >= 32'h16fa9ed) && (data_in < 32'h226ce6d)) begin
            data_out <= 8'b01000010;
        end
        else if ((data_in >= 32'h226ce6d) && (data_in < 32'h2de380d)) begin
            data_out <= 8'b01000011;
        end
        else if ((data_in >= 32'h2de380d) && (data_in < 32'h395fe14)) begin
            data_out <= 8'b01000100;
        end
        else if ((data_in >= 32'h395fe14) && (data_in < 32'h44e3811)) begin
            data_out <= 8'b01000101;
        end
        else if ((data_in >= 32'h44e3811) && (data_in < 32'h506fdeb)) begin
            data_out <= 8'b01000110;
        end
        else if ((data_in >= 32'h506fdeb) && (data_in < 32'h5c067f4)) begin
            data_out <= 8'b01000111;
        end
        else if ((data_in >= 32'h5c067f4) && (data_in < 32'h67a8efe)) begin
            data_out <= 8'b01001000;
        end
        else if ((data_in >= 32'h67a8efe) && (data_in < 32'h7358c72)) begin
            data_out <= 8'b01001001;
        end
        else if ((data_in >= 32'h7358c72) && (data_in < 32'h7f17a62)) begin
            data_out <= 8'b01001010;
        end
        else if ((data_in >= 32'h7f17a62) && (data_in < 32'h8ae73a1)) begin
            data_out <= 8'b01001011;
        end
        else if ((data_in >= 32'h8ae73a1) && (data_in < 32'h96c93e0)) begin
            data_out <= 8'b01001100;
        end
        else if ((data_in >= 32'h96c93e0) && (data_in < 32'ha2bf7c6)) begin
            data_out <= 8'b01001101;
        end
        else if ((data_in >= 32'ha2bf7c6) && (data_in < 32'haecbd0b)) begin
            data_out <= 8'b01001110;
        end
        else if ((data_in >= 32'haecbd0b) && (data_in < 32'hbaf029d)) begin
            data_out <= 8'b01001111;
        end
        else if ((data_in >= 32'hbaf029d) && (data_in < 32'hc72e8bd)) begin
            data_out <= 8'b01010000;
        end
        else if ((data_in >= 32'hc72e8bd) && (data_in < 32'hd389126)) begin
            data_out <= 8'b01010001;
        end
        else if ((data_in >= 32'hd389126) && (data_in < 32'he001f38)) begin
            data_out <= 8'b01010010;
        end
        else if ((data_in >= 32'he001f38) && (data_in < 32'hec9b821)) begin
            data_out <= 8'b01010011;
        end
        else if ((data_in >= 32'hec9b821) && (data_in < 32'hf958312)) begin
            data_out <= 8'b01010100;
        end
        else if ((data_in >= 32'hf958312) && (data_in < 32'h1063a976)) begin
            data_out <= 8'b01010101;
        end
        else if ((data_in >= 32'h1063a976) && (data_in < 32'h1134572f)) begin
            data_out <= 8'b01010110;
        end
        else if ((data_in >= 32'h1134572f) && (data_in < 32'h1207bad8)) begin
            data_out <= 8'b01010111;
        end
        else if ((data_in >= 32'h1207bad8) && (data_in < 32'h12de0618)) begin
            data_out <= 8'b01011000;
        end
        else if ((data_in >= 32'h12de0618) && (data_in < 32'h13b76df1)) begin
            data_out <= 8'b01011001;
        end
        else if ((data_in >= 32'h13b76df1) && (data_in < 32'h14942b2a)) begin
            data_out <= 8'b01011010;
        end
        else if ((data_in >= 32'h14942b2a) && (data_in < 32'h15747ab9)) begin
            data_out <= 8'b01011011;
        end
        else if ((data_in >= 32'h15747ab9) && (data_in < 32'h16589e41)) begin
            data_out <= 8'b01011100;
        end
        else if ((data_in >= 32'h16589e41) && (data_in < 32'h1740dca5)) begin
            data_out <= 8'b01011101;
        end
        else if ((data_in >= 32'h1740dca5) && (data_in < 32'h182d82ad)) begin
            data_out <= 8'b01011110;
        end
        else if ((data_in >= 32'h182d82ad) && (data_in < 32'h191ee3c2)) begin
            data_out <= 8'b01011111;
        end
        else if ((data_in >= 32'h191ee3c2) && (data_in < 32'h1a155ad1)) begin
            data_out <= 8'b01100000;
        end
        else if ((data_in >= 32'h1a155ad1) && (data_in < 32'h1b114b45)) begin
            data_out <= 8'b01100001;
        end
        else if ((data_in >= 32'h1b114b45) && (data_in < 32'h1c132237)) begin
            data_out <= 8'b01100010;
        end
        else if ((data_in >= 32'h1c132237) && (data_in < 32'h1d1b57cf)) begin
            data_out <= 8'b01100011;
        end
        else if ((data_in >= 32'h1d1b57cf) && (data_in < 32'h1e2a70e3)) begin
            data_out <= 8'b01100100;
        end
        else if ((data_in >= 32'h1e2a70e3) && (data_in < 32'h1f4100e6)) begin
            data_out <= 8'b01100101;
        end
        else if ((data_in >= 32'h1f4100e6) && (data_in < 32'h205fac3a)) begin
            data_out <= 8'b01100110;
        end
        else if ((data_in >= 32'h205fac3a) && (data_in < 32'h21872af7)) begin
            data_out <= 8'b01100111;
        end
        else if ((data_in >= 32'h21872af7) && (data_in < 32'h22b84c4c)) begin
            data_out <= 8'b01101000;
        end
        else if ((data_in >= 32'h22b84c4c) && (data_in < 32'h23f3fa9e)) begin
            data_out <= 8'b01101001;
        end
        else if ((data_in >= 32'h23f3fa9e) && (data_in < 32'h253b40a2)) begin
            data_out <= 8'b01101010;
        end
        else if ((data_in >= 32'h253b40a2) && (data_in < 32'h268f4fad)) begin
            data_out <= 8'b01101011;
        end
        else if ((data_in >= 32'h268f4fad) && (data_in < 32'h27f187ad)) begin
            data_out <= 8'b01101100;
        end
        else if ((data_in >= 32'h27f187ad) && (data_in < 32'h2963813e)) begin
            data_out <= 8'b01101101;
        end
        else if ((data_in >= 32'h2963813e) && (data_in < 32'h2ae71aaf)) begin
            data_out <= 8'b01101110;
        end
        else if ((data_in >= 32'h2ae71aaf) && (data_in < 32'h2c7e88f3)) begin
            data_out <= 8'b01101111;
        end
        else if ((data_in >= 32'h2c7e88f3) && (data_in < 32'h2e2c6e0d)) begin
            data_out <= 8'b01110000;
        end
        else if ((data_in >= 32'h2e2c6e0d) && (data_in < 32'h2ff3f73f)) begin
            data_out <= 8'b01110001;
        end
        else if ((data_in >= 32'h2ff3f73f) && (data_in < 32'h31d9066d)) begin
            data_out <= 8'b01110010;
        end
        else if ((data_in >= 32'h31d9066d) && (data_in < 32'h33e06c1e)) begin
            data_out <= 8'b01110011;
        end
        else if ((data_in >= 32'h33e06c1e) && (data_in < 32'h36103acf)) begin
            data_out <= 8'b01110100;
        end
        else if ((data_in >= 32'h36103acf) && (data_in < 32'h38704222)) begin
            data_out <= 8'b01110101;
        end
        else if ((data_in >= 32'h38704222) && (data_in < 32'h3b0acb42)) begin
            data_out <= 8'b01110110;
        end
        else if ((data_in >= 32'h3b0acb42) && (data_in < 32'h3dedc4cf)) begin
            data_out <= 8'b01110111;
        end
        else if ((data_in >= 32'h3dedc4cf) && (data_in < 32'h412cb866)) begin
            data_out <= 8'b01111000;
        end
        else if ((data_in >= 32'h412cb866) && (data_in < 32'h44e44609)) begin
            data_out <= 8'b01111001;
        end
        else if ((data_in >= 32'h44e44609) && (data_in < 32'h4940d513)) begin
            data_out <= 8'b01111010;
        end
        else if ((data_in >= 32'h4940d513) && (data_in < 32'h4e8cd97f)) begin
            data_out <= 8'b01111011;
        end
        else if ((data_in >= 32'h4e8cd97f) && (data_in < 32'h55541649)) begin
            data_out <= 8'b01111100;
        end
        else if ((data_in >= 32'h55541649) && (data_in < 32'h5ed10d44)) begin
            data_out <= 8'b01111101;
        end
        else if ((data_in >= 32'h5ed10d44) && (data_in < 32'h6ef4af2c)) begin
            data_out <= 8'b01111110;
        end
        else begin 
            data_out <= 8'b01111111;
        end
    end
endmodule
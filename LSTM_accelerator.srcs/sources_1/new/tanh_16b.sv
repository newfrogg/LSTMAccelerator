`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/16/2024 08:55:18 PM
// Design Name: 
// Module Name: tanh_8b
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


module tanh_16b #(parameter INPUT_WIDTH = 16, parameter OUTPUT_WIDTH = 8) (
        input   logic   [INPUT_WIDTH - 1:0]  data_in,    //  16 bits input
        output  logic   [OUTPUT_WIDTH - 1:0] data_out    // 8 bits output
    );
    always_comb begin
        if ( (data_in >= 16'h8000) && (data_in < 16'h8001) ) begin
            data_out <= 8'b10000000;
        end
        else if ((data_in >= 16'h8001) && (data_in < 16'h9005)) begin
            data_out <= 8'b10000001;
        end
        else if ((data_in >= 16'h9005) && (data_in < 16'h9975)) begin
            data_out <= 8'b10000010;
        end
        else if ((data_in >= 16'h9975) && (data_in < 16'ha02f)) begin
            data_out <= 8'b10000011;
        end
        else if ((data_in >= 16'ha02f) && (data_in < 16'ha56e)) begin
            data_out <= 8'b10000100;
        end
        else if ((data_in >= 16'ha56e) && (data_in < 16'ha9bc)) begin
            data_out <= 8'b10000101;
        end
        else if ((data_in >= 16'ha9bc) && (data_in < 16'had63)) begin
            data_out <= 8'b10000110;
        end
        else if ((data_in >= 16'had63) && (data_in < 16'hb091)) begin
            data_out <= 8'b10000111;
        end
        else if ((data_in >= 16'hb091) && (data_in < 16'hb362)) begin
            data_out <= 8'b10001000;
        end
        else if ((data_in >= 16'hb362) && (data_in < 16'hb5e9)) begin
            data_out <= 8'b10001001;
        end
        else if ((data_in >= 16'hb5e9) && (data_in < 16'hb836)) begin
            data_out <= 8'b10001010;
        end
        else if ((data_in >= 16'hb836) && (data_in < 16'hba51)) begin
            data_out <= 8'b10001011;
        end
        else if ((data_in >= 16'hba51) && (data_in < 16'hbc43)) begin
            data_out <= 8'b10001100;
        end
        else if ((data_in >= 16'hbc43) && (data_in < 16'hbe12)) begin
            data_out <= 8'b10001101;
        end
        else if ((data_in >= 16'hbe12) && (data_in < 16'hbfc3)) begin
            data_out <= 8'b10001110;
        end
        else if ((data_in >= 16'hbfc3) && (data_in < 16'hc15a)) begin
            data_out <= 8'b10001111;
        end
        else if ((data_in >= 16'hc15a) && (data_in < 16'hc2d9)) begin
            data_out <= 8'b10010000;
        end
        else if ((data_in >= 16'hc2d9) && (data_in < 16'hc445)) begin
            data_out <= 8'b10010001;
        end
        else if ((data_in >= 16'hc445) && (data_in < 16'hc59e)) begin
            data_out <= 8'b10010010;
        end
        else if ((data_in >= 16'hc59e) && (data_in < 16'hc6e7)) begin
            data_out <= 8'b10010011;
        end
        else if ((data_in >= 16'hc6e7) && (data_in < 16'hc821)) begin
            data_out <= 8'b10010100;
        end
        else if ((data_in >= 16'hc821) && (data_in < 16'hc94d)) begin
            data_out <= 8'b10010101;
        end
        else if ((data_in >= 16'hc94d) && (data_in < 16'hca6e)) begin
            data_out <= 8'b10010110;
        end
        else if ((data_in >= 16'hca6e) && (data_in < 16'hcb83)) begin
            data_out <= 8'b10010111;
        end
        else if ((data_in >= 16'hcb83) && (data_in < 16'hcc8f)) begin
            data_out <= 8'b10011000;
        end
        else if ((data_in >= 16'hcc8f) && (data_in < 16'hcd91)) begin
            data_out <= 8'b10011001;
        end
        else if ((data_in >= 16'hcd91) && (data_in < 16'hce8a)) begin
            data_out <= 8'b10011010;
        end
        else if ((data_in >= 16'hce8a) && (data_in < 16'hcf7b)) begin
            data_out <= 8'b10011011;
        end
        else if ((data_in >= 16'hcf7b) && (data_in < 16'hd065)) begin
            data_out <= 8'b10011100;
        end
        else if ((data_in >= 16'hd065) && (data_in < 16'hd148)) begin
            data_out <= 8'b10011101;
        end
        else if ((data_in >= 16'hd148) && (data_in < 16'hd225)) begin
            data_out <= 8'b10011110;
        end
        else if ((data_in >= 16'hd225) && (data_in < 16'hd2fb)) begin
            data_out <= 8'b10011111;
        end
        else if ((data_in >= 16'hd2fb) && (data_in < 16'hd3cc)) begin
            data_out <= 8'b10100000;
        end
        else if ((data_in >= 16'hd3cc) && (data_in < 16'hd497)) begin
            data_out <= 8'b10100001;
        end
        else if ((data_in >= 16'hd497) && (data_in < 16'hd55e)) begin
            data_out <= 8'b10100010;
        end
        else if ((data_in >= 16'hd55e) && (data_in < 16'hd61f)) begin
            data_out <= 8'b10100011;
        end
        else if ((data_in >= 16'hd61f) && (data_in < 16'hd6dc)) begin
            data_out <= 8'b10100100;
        end
        else if ((data_in >= 16'hd6dc) && (data_in < 16'hd796)) begin
            data_out <= 8'b10100101;
        end
        else if ((data_in >= 16'hd796) && (data_in < 16'hd84b)) begin
            data_out <= 8'b10100110;
        end
        else if ((data_in >= 16'hd84b) && (data_in < 16'hd8fc)) begin
            data_out <= 8'b10100111;
        end
        else if ((data_in >= 16'hd8fc) && (data_in < 16'hd9aa)) begin
            data_out <= 8'b10101000;
        end
        else if ((data_in >= 16'hd9aa) && (data_in < 16'hda54)) begin
            data_out <= 8'b10101001;
        end
        else if ((data_in >= 16'hda54) && (data_in < 16'hdafb)) begin
            data_out <= 8'b10101010;
        end
        else if ((data_in >= 16'hdafb) && (data_in < 16'hdb9f)) begin
            data_out <= 8'b10101011;
        end
        else if ((data_in >= 16'hdb9f) && (data_in < 16'hdc40)) begin
            data_out <= 8'b10101100;
        end
        else if ((data_in >= 16'hdc40) && (data_in < 16'hdcdf)) begin
            data_out <= 8'b10101101;
        end
        else if ((data_in >= 16'hdcdf) && (data_in < 16'hdd7a)) begin
            data_out <= 8'b10101110;
        end
        else if ((data_in >= 16'hdd7a) && (data_in < 16'hde13)) begin
            data_out <= 8'b10101111;
        end
        else if ((data_in >= 16'hde13) && (data_in < 16'hdeaa)) begin
            data_out <= 8'b10110000;
        end
        else if ((data_in >= 16'hdeaa) && (data_in < 16'hdf3e)) begin
            data_out <= 8'b10110001;
        end
        else if ((data_in >= 16'hdf3e) && (data_in < 16'hdfd0)) begin
            data_out <= 8'b10110010;
        end
        else if ((data_in >= 16'hdfd0) && (data_in < 16'he060)) begin
            data_out <= 8'b10110011;
        end
        else if ((data_in >= 16'he060) && (data_in < 16'he0ee)) begin
            data_out <= 8'b10110100;
        end
        else if ((data_in >= 16'he0ee) && (data_in < 16'he17a)) begin
            data_out <= 8'b10110101;
        end
        else if ((data_in >= 16'he17a) && (data_in < 16'he204)) begin
            data_out <= 8'b10110110;
        end
        else if ((data_in >= 16'he204) && (data_in < 16'he28d)) begin
            data_out <= 8'b10110111;
        end
        else if ((data_in >= 16'he28d) && (data_in < 16'he313)) begin
            data_out <= 8'b10111000;
        end
        else if ((data_in >= 16'he313) && (data_in < 16'he398)) begin
            data_out <= 8'b10111001;
        end
        else if ((data_in >= 16'he398) && (data_in < 16'he41b)) begin
            data_out <= 8'b10111010;
        end
        else if ((data_in >= 16'he41b) && (data_in < 16'he49d)) begin
            data_out <= 8'b10111011;
        end
        else if ((data_in >= 16'he49d) && (data_in < 16'he51d)) begin
            data_out <= 8'b10111100;
        end
        else if ((data_in >= 16'he51d) && (data_in < 16'he59c)) begin
            data_out <= 8'b10111101;
        end
        else if ((data_in >= 16'he59c) && (data_in < 16'he619)) begin
            data_out <= 8'b10111110;
        end
        else if ((data_in >= 16'he619) && (data_in < 16'he695)) begin
            data_out <= 8'b10111111;
        end
        else if ((data_in >= 16'he695) && (data_in < 16'he710)) begin
            data_out <= 8'b11000000;
        end
        else if ((data_in >= 16'he710) && (data_in < 16'he78a)) begin
            data_out <= 8'b11000001;
        end
        else if ((data_in >= 16'he78a) && (data_in < 16'he802)) begin
            data_out <= 8'b11000010;
        end
        else if ((data_in >= 16'he802) && (data_in < 16'he879)) begin
            data_out <= 8'b11000011;
        end
        else if ((data_in >= 16'he879) && (data_in < 16'he8ef)) begin
            data_out <= 8'b11000100;
        end
        else if ((data_in >= 16'he8ef) && (data_in < 16'he964)) begin
            data_out <= 8'b11000101;
        end
        else if ((data_in >= 16'he964) && (data_in < 16'he9d8)) begin
            data_out <= 8'b11000110;
        end
        else if ((data_in >= 16'he9d8) && (data_in < 16'hea4b)) begin
            data_out <= 8'b11000111;
        end
        else if ((data_in >= 16'hea4b) && (data_in < 16'heabd)) begin
            data_out <= 8'b11001000;
        end
        else if ((data_in >= 16'heabd) && (data_in < 16'heb2e)) begin
            data_out <= 8'b11001001;
        end
        else if ((data_in >= 16'heb2e) && (data_in < 16'heb9e)) begin
            data_out <= 8'b11001010;
        end
        else if ((data_in >= 16'heb9e) && (data_in < 16'hec0e)) begin
            data_out <= 8'b11001011;
        end
        else if ((data_in >= 16'hec0e) && (data_in < 16'hec7c)) begin
            data_out <= 8'b11001100;
        end
        else if ((data_in >= 16'hec7c) && (data_in < 16'hecea)) begin
            data_out <= 8'b11001101;
        end
        else if ((data_in >= 16'hecea) && (data_in < 16'hed56)) begin
            data_out <= 8'b11001110;
        end
        else if ((data_in >= 16'hed56) && (data_in < 16'hedc3)) begin
            data_out <= 8'b11001111;
        end
        else if ((data_in >= 16'hedc3) && (data_in < 16'hee2e)) begin
            data_out <= 8'b11010000;
        end
        else if ((data_in >= 16'hee2e) && (data_in < 16'hee99)) begin
            data_out <= 8'b11010001;
        end
        else if ((data_in >= 16'hee99) && (data_in < 16'hef02)) begin
            data_out <= 8'b11010010;
        end
        else if ((data_in >= 16'hef02) && (data_in < 16'hef6c)) begin
            data_out <= 8'b11010011;
        end
        else if ((data_in >= 16'hef6c) && (data_in < 16'hefd4)) begin
            data_out <= 8'b11010100;
        end
        else if ((data_in >= 16'hefd4) && (data_in < 16'hf03c)) begin
            data_out <= 8'b11010101;
        end
        else if ((data_in >= 16'hf03c) && (data_in < 16'hf0a4)) begin
            data_out <= 8'b11010110;
        end
        else if ((data_in >= 16'hf0a4) && (data_in < 16'hf10b)) begin
            data_out <= 8'b11010111;
        end
        else if ((data_in >= 16'hf10b) && (data_in < 16'hf171)) begin
            data_out <= 8'b11011000;
        end
        else if ((data_in >= 16'hf171) && (data_in < 16'hf1d7)) begin
            data_out <= 8'b11011001;
        end
        else if ((data_in >= 16'hf1d7) && (data_in < 16'hf23c)) begin
            data_out <= 8'b11011010;
        end
        else if ((data_in >= 16'hf23c) && (data_in < 16'hf2a1)) begin
            data_out <= 8'b11011011;
        end
        else if ((data_in >= 16'hf2a1) && (data_in < 16'hf305)) begin
            data_out <= 8'b11011100;
        end
        else if ((data_in >= 16'hf305) && (data_in < 16'hf369)) begin
            data_out <= 8'b11011101;
        end
        else if ((data_in >= 16'hf369) && (data_in < 16'hf3cc)) begin
            data_out <= 8'b11011110;
        end
        else if ((data_in >= 16'hf3cc) && (data_in < 16'hf42f)) begin
            data_out <= 8'b11011111;
        end
        else if ((data_in >= 16'hf42f) && (data_in < 16'hf492)) begin
            data_out <= 8'b11100000;
        end
        else if ((data_in >= 16'hf492) && (data_in < 16'hf4f4)) begin
            data_out <= 8'b11100001;
        end
        else if ((data_in >= 16'hf4f4) && (data_in < 16'hf555)) begin
            data_out <= 8'b11100010;
        end
        else if ((data_in >= 16'hf555) && (data_in < 16'hf5b7)) begin
            data_out <= 8'b11100011;
        end
        else if ((data_in >= 16'hf5b7) && (data_in < 16'hf618)) begin
            data_out <= 8'b11100100;
        end
        else if ((data_in >= 16'hf618) && (data_in < 16'hf679)) begin
            data_out <= 8'b11100101;
        end
        else if ((data_in >= 16'hf679) && (data_in < 16'hf6d9)) begin
            data_out <= 8'b11100110;
        end
        else if ((data_in >= 16'hf6d9) && (data_in < 16'hf739)) begin
            data_out <= 8'b11100111;
        end
        else if ((data_in >= 16'hf739) && (data_in < 16'hf799)) begin
            data_out <= 8'b11101000;
        end
        else if ((data_in >= 16'hf799) && (data_in < 16'hf7f8)) begin
            data_out <= 8'b11101001;
        end
        else if ((data_in >= 16'hf7f8) && (data_in < 16'hf858)) begin
            data_out <= 8'b11101010;
        end
        else if ((data_in >= 16'hf858) && (data_in < 16'hf8b7)) begin
            data_out <= 8'b11101011;
        end
        else if ((data_in >= 16'hf8b7) && (data_in < 16'hf915)) begin
            data_out <= 8'b11101100;
        end
        else if ((data_in >= 16'hf915) && (data_in < 16'hf974)) begin
            data_out <= 8'b11101101;
        end
        else if ((data_in >= 16'hf974) && (data_in < 16'hf9d2)) begin
            data_out <= 8'b11101110;
        end
        else if ((data_in >= 16'hf9d2) && (data_in < 16'hfa30)) begin
            data_out <= 8'b11101111;
        end
        else if ((data_in >= 16'hfa30) && (data_in < 16'hfa8e)) begin
            data_out <= 8'b11110000;
        end
        else if ((data_in >= 16'hfa8e) && (data_in < 16'hfaec)) begin
            data_out <= 8'b11110001;
        end
        else if ((data_in >= 16'hfaec) && (data_in < 16'hfb4a)) begin
            data_out <= 8'b11110010;
        end
        else if ((data_in >= 16'hfb4a) && (data_in < 16'hfba7)) begin
            data_out <= 8'b11110011;
        end
        else if ((data_in >= 16'hfba7) && (data_in < 16'hfc04)) begin
            data_out <= 8'b11110100;
        end
        else if ((data_in >= 16'hfc04) && (data_in < 16'hfc62)) begin
            data_out <= 8'b11110101;
        end
        else if ((data_in >= 16'hfc62) && (data_in < 16'hfcbf)) begin
            data_out <= 8'b11110110;
        end
        else if ((data_in >= 16'hfcbf) && (data_in < 16'hfd1c)) begin
            data_out <= 8'b11110111;
        end
        else if ((data_in >= 16'hfd1c) && (data_in < 16'hfd78)) begin
            data_out <= 8'b11111000;
        end
        else if ((data_in >= 16'hfd78) && (data_in < 16'hfdd5)) begin
            data_out <= 8'b11111001;
        end
        else if ((data_in >= 16'hfdd5) && (data_in < 16'hfe32)) begin
            data_out <= 8'b11111010;
        end
        else if ((data_in >= 16'hfe32) && (data_in < 16'hfe8f)) begin
            data_out <= 8'b11111011;
        end
        else if ((data_in >= 16'hfe8f) && (data_in < 16'hfeeb)) begin
            data_out <= 8'b11111100;
        end
        else if ((data_in >= 16'hfeeb) && (data_in < 16'hff48)) begin
            data_out <= 8'b11111101;
        end
        else if ((data_in >= 16'hff48) && (data_in < 16'hffa4)) begin
            data_out <= 8'b11111110;
        end
        else if ((data_in >= 16'hffa4) && (data_in < 16'h1)) begin
            data_out <= 8'b11111111;
        end
        else if ((data_in >= 16'h1) && (data_in < 16'h5c)) begin
            data_out <= 8'b00000000;
        end
        else if ((data_in >= 16'h5c) && (data_in < 16'hb8)) begin
            data_out <= 8'b00000001;
        end
        else if ((data_in >= 16'hb8) && (data_in < 16'h115)) begin
            data_out <= 8'b00000010;
        end
        else if ((data_in >= 16'h115) && (data_in < 16'h171)) begin
            data_out <= 8'b00000011;
        end
        else if ((data_in >= 16'h171) && (data_in < 16'h1ce)) begin
            data_out <= 8'b00000100;
        end
        else if ((data_in >= 16'h1ce) && (data_in < 16'h22b)) begin
            data_out <= 8'b00000101;
        end
        else if ((data_in >= 16'h22b) && (data_in < 16'h288)) begin
            data_out <= 8'b00000110;
        end
        else if ((data_in >= 16'h288) && (data_in < 16'h2e4)) begin
            data_out <= 8'b00000111;
        end
        else if ((data_in >= 16'h2e4) && (data_in < 16'h341)) begin
            data_out <= 8'b00001000;
        end
        else if ((data_in >= 16'h341) && (data_in < 16'h39e)) begin
            data_out <= 8'b00001001;
        end
        else if ((data_in >= 16'h39e) && (data_in < 16'h3fc)) begin
            data_out <= 8'b00001010;
        end
        else if ((data_in >= 16'h3fc) && (data_in < 16'h459)) begin
            data_out <= 8'b00001011;
        end
        else if ((data_in >= 16'h459) && (data_in < 16'h4b6)) begin
            data_out <= 8'b00001100;
        end
        else if ((data_in >= 16'h4b6) && (data_in < 16'h514)) begin
            data_out <= 8'b00001101;
        end
        else if ((data_in >= 16'h514) && (data_in < 16'h572)) begin
            data_out <= 8'b00001110;
        end
        else if ((data_in >= 16'h572) && (data_in < 16'h5d0)) begin
            data_out <= 8'b00001111;
        end
        else if ((data_in >= 16'h5d0) && (data_in < 16'h62e)) begin
            data_out <= 8'b00010000;
        end
        else if ((data_in >= 16'h62e) && (data_in < 16'h68c)) begin
            data_out <= 8'b00010001;
        end
        else if ((data_in >= 16'h68c) && (data_in < 16'h6eb)) begin
            data_out <= 8'b00010010;
        end
        else if ((data_in >= 16'h6eb) && (data_in < 16'h749)) begin
            data_out <= 8'b00010011;
        end
        else if ((data_in >= 16'h749) && (data_in < 16'h7a8)) begin
            data_out <= 8'b00010100;
        end
        else if ((data_in >= 16'h7a8) && (data_in < 16'h808)) begin
            data_out <= 8'b00010101;
        end
        else if ((data_in >= 16'h808) && (data_in < 16'h867)) begin
            data_out <= 8'b00010110;
        end
        else if ((data_in >= 16'h867) && (data_in < 16'h8c7)) begin
            data_out <= 8'b00010111;
        end
        else if ((data_in >= 16'h8c7) && (data_in < 16'h927)) begin
            data_out <= 8'b00011000;
        end
        else if ((data_in >= 16'h927) && (data_in < 16'h987)) begin
            data_out <= 8'b00011001;
        end
        else if ((data_in >= 16'h987) && (data_in < 16'h9e8)) begin
            data_out <= 8'b00011010;
        end
        else if ((data_in >= 16'h9e8) && (data_in < 16'ha49)) begin
            data_out <= 8'b00011011;
        end
        else if ((data_in >= 16'ha49) && (data_in < 16'haab)) begin
            data_out <= 8'b00011100;
        end
        else if ((data_in >= 16'haab) && (data_in < 16'hb0c)) begin
            data_out <= 8'b00011101;
        end
        else if ((data_in >= 16'hb0c) && (data_in < 16'hb6e)) begin
            data_out <= 8'b00011110;
        end
        else if ((data_in >= 16'hb6e) && (data_in < 16'hbd1)) begin
            data_out <= 8'b00011111;
        end
        else if ((data_in >= 16'hbd1) && (data_in < 16'hc34)) begin
            data_out <= 8'b00100000;
        end
        else if ((data_in >= 16'hc34) && (data_in < 16'hc97)) begin
            data_out <= 8'b00100001;
        end
        else if ((data_in >= 16'hc97) && (data_in < 16'hcfb)) begin
            data_out <= 8'b00100010;
        end
        else if ((data_in >= 16'hcfb) && (data_in < 16'hd5f)) begin
            data_out <= 8'b00100011;
        end
        else if ((data_in >= 16'hd5f) && (data_in < 16'hdc4)) begin
            data_out <= 8'b00100100;
        end
        else if ((data_in >= 16'hdc4) && (data_in < 16'he29)) begin
            data_out <= 8'b00100101;
        end
        else if ((data_in >= 16'he29) && (data_in < 16'he8f)) begin
            data_out <= 8'b00100110;
        end
        else if ((data_in >= 16'he8f) && (data_in < 16'hef5)) begin
            data_out <= 8'b00100111;
        end
        else if ((data_in >= 16'hef5) && (data_in < 16'hf5c)) begin
            data_out <= 8'b00101000;
        end
        else if ((data_in >= 16'hf5c) && (data_in < 16'hfc4)) begin
            data_out <= 8'b00101001;
        end
        else if ((data_in >= 16'hfc4) && (data_in < 16'h102c)) begin
            data_out <= 8'b00101010;
        end
        else if ((data_in >= 16'h102c) && (data_in < 16'h1094)) begin
            data_out <= 8'b00101011;
        end
        else if ((data_in >= 16'h1094) && (data_in < 16'h10fe)) begin
            data_out <= 8'b00101100;
        end
        else if ((data_in >= 16'h10fe) && (data_in < 16'h1167)) begin
            data_out <= 8'b00101101;
        end
        else if ((data_in >= 16'h1167) && (data_in < 16'h11d2)) begin
            data_out <= 8'b00101110;
        end
        else if ((data_in >= 16'h11d2) && (data_in < 16'h123d)) begin
            data_out <= 8'b00101111;
        end
        else if ((data_in >= 16'h123d) && (data_in < 16'h12aa)) begin
            data_out <= 8'b00110000;
        end
        else if ((data_in >= 16'h12aa) && (data_in < 16'h1316)) begin
            data_out <= 8'b00110001;
        end
        else if ((data_in >= 16'h1316) && (data_in < 16'h1384)) begin
            data_out <= 8'b00110010;
        end
        else if ((data_in >= 16'h1384) && (data_in < 16'h13f2)) begin
            data_out <= 8'b00110011;
        end
        else if ((data_in >= 16'h13f2) && (data_in < 16'h1462)) begin
            data_out <= 8'b00110100;
        end
        else if ((data_in >= 16'h1462) && (data_in < 16'h14d2)) begin
            data_out <= 8'b00110101;
        end
        else if ((data_in >= 16'h14d2) && (data_in < 16'h1543)) begin
            data_out <= 8'b00110110;
        end
        else if ((data_in >= 16'h1543) && (data_in < 16'h15b5)) begin
            data_out <= 8'b00110111;
        end
        else if ((data_in >= 16'h15b5) && (data_in < 16'h1628)) begin
            data_out <= 8'b00111000;
        end
        else if ((data_in >= 16'h1628) && (data_in < 16'h169c)) begin
            data_out <= 8'b00111001;
        end
        else if ((data_in >= 16'h169c) && (data_in < 16'h1711)) begin
            data_out <= 8'b00111010;
        end
        else if ((data_in >= 16'h1711) && (data_in < 16'h1787)) begin
            data_out <= 8'b00111011;
        end
        else if ((data_in >= 16'h1787) && (data_in < 16'h17fe)) begin
            data_out <= 8'b00111100;
        end
        else if ((data_in >= 16'h17fe) && (data_in < 16'h1876)) begin
            data_out <= 8'b00111101;
        end
        else if ((data_in >= 16'h1876) && (data_in < 16'h18f0)) begin
            data_out <= 8'b00111110;
        end
        else if ((data_in >= 16'h18f0) && (data_in < 16'h196b)) begin
            data_out <= 8'b00111111;
        end
        else if ((data_in >= 16'h196b) && (data_in < 16'h19e7)) begin
            data_out <= 8'b01000000;
        end
        else if ((data_in >= 16'h19e7) && (data_in < 16'h1a64)) begin
            data_out <= 8'b01000001;
        end
        else if ((data_in >= 16'h1a64) && (data_in < 16'h1ae3)) begin
            data_out <= 8'b01000010;
        end
        else if ((data_in >= 16'h1ae3) && (data_in < 16'h1b63)) begin
            data_out <= 8'b01000011;
        end
        else if ((data_in >= 16'h1b63) && (data_in < 16'h1be5)) begin
            data_out <= 8'b01000100;
        end
        else if ((data_in >= 16'h1be5) && (data_in < 16'h1c68)) begin
            data_out <= 8'b01000101;
        end
        else if ((data_in >= 16'h1c68) && (data_in < 16'h1ced)) begin
            data_out <= 8'b01000110;
        end
        else if ((data_in >= 16'h1ced) && (data_in < 16'h1d73)) begin
            data_out <= 8'b01000111;
        end
        else if ((data_in >= 16'h1d73) && (data_in < 16'h1dfc)) begin
            data_out <= 8'b01001000;
        end
        else if ((data_in >= 16'h1dfc) && (data_in < 16'h1e86)) begin
            data_out <= 8'b01001001;
        end
        else if ((data_in >= 16'h1e86) && (data_in < 16'h1f12)) begin
            data_out <= 8'b01001010;
        end
        else if ((data_in >= 16'h1f12) && (data_in < 16'h1fa0)) begin
            data_out <= 8'b01001011;
        end
        else if ((data_in >= 16'h1fa0) && (data_in < 16'h2030)) begin
            data_out <= 8'b01001100;
        end
        else if ((data_in >= 16'h2030) && (data_in < 16'h20c2)) begin
            data_out <= 8'b01001101;
        end
        else if ((data_in >= 16'h20c2) && (data_in < 16'h2156)) begin
            data_out <= 8'b01001110;
        end
        else if ((data_in >= 16'h2156) && (data_in < 16'h21ed)) begin
            data_out <= 8'b01001111;
        end
        else if ((data_in >= 16'h21ed) && (data_in < 16'h2286)) begin
            data_out <= 8'b01010000;
        end
        else if ((data_in >= 16'h2286) && (data_in < 16'h2321)) begin
            data_out <= 8'b01010001;
        end
        else if ((data_in >= 16'h2321) && (data_in < 16'h23c0)) begin
            data_out <= 8'b01010010;
        end
        else if ((data_in >= 16'h23c0) && (data_in < 16'h2461)) begin
            data_out <= 8'b01010011;
        end
        else if ((data_in >= 16'h2461) && (data_in < 16'h2505)) begin
            data_out <= 8'b01010100;
        end
        else if ((data_in >= 16'h2505) && (data_in < 16'h25ac)) begin
            data_out <= 8'b01010101;
        end
        else if ((data_in >= 16'h25ac) && (data_in < 16'h2656)) begin
            data_out <= 8'b01010110;
        end
        else if ((data_in >= 16'h2656) && (data_in < 16'h2704)) begin
            data_out <= 8'b01010111;
        end
        else if ((data_in >= 16'h2704) && (data_in < 16'h27b5)) begin
            data_out <= 8'b01011000;
        end
        else if ((data_in >= 16'h27b5) && (data_in < 16'h286a)) begin
            data_out <= 8'b01011001;
        end
        else if ((data_in >= 16'h286a) && (data_in < 16'h2924)) begin
            data_out <= 8'b01011010;
        end
        else if ((data_in >= 16'h2924) && (data_in < 16'h29e1)) begin
            data_out <= 8'b01011011;
        end
        else if ((data_in >= 16'h29e1) && (data_in < 16'h2aa2)) begin
            data_out <= 8'b01011100;
        end
        else if ((data_in >= 16'h2aa2) && (data_in < 16'h2b69)) begin
            data_out <= 8'b01011101;
        end
        else if ((data_in >= 16'h2b69) && (data_in < 16'h2c34)) begin
            data_out <= 8'b01011110;
        end
        else if ((data_in >= 16'h2c34) && (data_in < 16'h2d05)) begin
            data_out <= 8'b01011111;
        end
        else if ((data_in >= 16'h2d05) && (data_in < 16'h2ddb)) begin
            data_out <= 8'b01100000;
        end
        else if ((data_in >= 16'h2ddb) && (data_in < 16'h2eb8)) begin
            data_out <= 8'b01100001;
        end
        else if ((data_in >= 16'h2eb8) && (data_in < 16'h2f9b)) begin
            data_out <= 8'b01100010;
        end
        else if ((data_in >= 16'h2f9b) && (data_in < 16'h3085)) begin
            data_out <= 8'b01100011;
        end
        else if ((data_in >= 16'h3085) && (data_in < 16'h3176)) begin
            data_out <= 8'b01100100;
        end
        else if ((data_in >= 16'h3176) && (data_in < 16'h326f)) begin
            data_out <= 8'b01100101;
        end
        else if ((data_in >= 16'h326f) && (data_in < 16'h3371)) begin
            data_out <= 8'b01100110;
        end
        else if ((data_in >= 16'h3371) && (data_in < 16'h347d)) begin
            data_out <= 8'b01100111;
        end
        else if ((data_in >= 16'h347d) && (data_in < 16'h3592)) begin
            data_out <= 8'b01101000;
        end
        else if ((data_in >= 16'h3592) && (data_in < 16'h36b3)) begin
            data_out <= 8'b01101001;
        end
        else if ((data_in >= 16'h36b3) && (data_in < 16'h37df)) begin
            data_out <= 8'b01101010;
        end
        else if ((data_in >= 16'h37df) && (data_in < 16'h3919)) begin
            data_out <= 8'b01101011;
        end
        else if ((data_in >= 16'h3919) && (data_in < 16'h3a62)) begin
            data_out <= 8'b01101100;
        end
        else if ((data_in >= 16'h3a62) && (data_in < 16'h3bbb)) begin
            data_out <= 8'b01101101;
        end
        else if ((data_in >= 16'h3bbb) && (data_in < 16'h3d27)) begin
            data_out <= 8'b01101110;
        end
        else if ((data_in >= 16'h3d27) && (data_in < 16'h3ea6)) begin
            data_out <= 8'b01101111;
        end
        else if ((data_in >= 16'h3ea6) && (data_in < 16'h403d)) begin
            data_out <= 8'b01110000;
        end
        else if ((data_in >= 16'h403d) && (data_in < 16'h41ee)) begin
            data_out <= 8'b01110001;
        end
        else if ((data_in >= 16'h41ee) && (data_in < 16'h43bd)) begin
            data_out <= 8'b01110010;
        end
        else if ((data_in >= 16'h43bd) && (data_in < 16'h45af)) begin
            data_out <= 8'b01110011;
        end
        else if ((data_in >= 16'h45af) && (data_in < 16'h47ca)) begin
            data_out <= 8'b01110100;
        end
        else if ((data_in >= 16'h47ca) && (data_in < 16'h4a17)) begin
            data_out <= 8'b01110101;
        end
        else if ((data_in >= 16'h4a17) && (data_in < 16'h4c9e)) begin
            data_out <= 8'b01110110;
        end
        else if ((data_in >= 16'h4c9e) && (data_in < 16'h4f6f)) begin
            data_out <= 8'b01110111;
        end
        else if ((data_in >= 16'h4f6f) && (data_in < 16'h529d)) begin
            data_out <= 8'b01111000;
        end
        else if ((data_in >= 16'h529d) && (data_in < 16'h5644)) begin
            data_out <= 8'b01111001;
        end
        else if ((data_in >= 16'h5644) && (data_in < 16'h5a92)) begin
            data_out <= 8'b01111010;
        end
        else if ((data_in >= 16'h5a92) && (data_in < 16'h5fd1)) begin
            data_out <= 8'b01111011;
        end
        else if ((data_in >= 16'h5fd1) && (data_in < 16'h668b)) begin
            data_out <= 8'b01111100;
        end
        else if ((data_in >= 16'h668b) && (data_in < 16'h6ffb)) begin
            data_out <= 8'b01111101;
        end
        else if ((data_in >= 16'h6ffb) && (data_in < 16'h7fff)) begin
            data_out <= 8'b01111110;
        end
        else begin
            data_out <= 8'b01111111;
        end
    end
endmodule

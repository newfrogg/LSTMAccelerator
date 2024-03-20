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
    if ((data_in >= 32'h80000000) && (data_in < 32'h81922532)) begin
        data_out <= 8'b00000000;
    end
    else if ((data_in >= 32'h81922532) && (data_in < 32'h9163fff9)) begin
        data_out <= 8'b00000001;
    end
    else if ((data_in >= 32'h9163fff9) && (data_in < 32'h9ab5ebee)) begin
        data_out <= 8'b00000010;
    end
    else if ((data_in >= 32'h9ab5ebee) && (data_in < 32'ha15b95ea)) begin
        data_out <= 8'b00000011;
    end
    else if ((data_in >= 32'ha15b95ea) && (data_in < 32'ha689a460)) begin
        data_out <= 8'b00000100;
    end
    else if ((data_in >= 32'ha689a460) && (data_in < 32'haac9e58e)) begin
        data_out <= 8'b00000101;
    end
    else if ((data_in >= 32'haac9e58e) && (data_in < 32'hae65f600)) begin
        data_out <= 8'b00000110;
    end
    else if ((data_in >= 32'hae65f600) && (data_in < 32'hb189d098)) begin
        data_out <= 8'b00000111;
    end
    else if ((data_in >= 32'hb189d098) && (data_in < 32'hb451d861)) begin
        data_out <= 8'b00001000;
    end
    else if ((data_in >= 32'hb451d861) && (data_in < 32'hb6d171c0)) begin
        data_out <= 8'b00001001;
    end
    else if ((data_in >= 32'hb6d171c0) && (data_in < 32'hb9167308)) begin
        data_out <= 8'b00001010;
    end
    else if ((data_in >= 32'hb9167308) && (data_in < 32'hbb2b149e)) begin
        data_out <= 8'b00001011;
    end
    else if ((data_in >= 32'hbb2b149e) && (data_in < 32'hbd1719f9)) begin
        data_out <= 8'b00001100;
    end
    else if ((data_in >= 32'hbd1719f9) && (data_in < 32'hbee08c5f)) begin
        data_out <= 8'b00001101;
    end
    else if ((data_in >= 32'hbee08c5f) && (data_in < 32'hc08c3511)) begin
        data_out <= 8'b00001110;
    end
    else if ((data_in >= 32'hc08c3511) && (data_in < 32'hc21df000)) begin
        data_out <= 8'b00001111;
    end
    else if ((data_in >= 32'hc21df000) && (data_in < 32'hc398e564)) begin
        data_out <= 8'b00010000;
    end
    else if ((data_in >= 32'hc398e564) && (data_in < 32'hc4ffb2dc)) begin
        data_out <= 8'b00010001;
    end
    else if ((data_in >= 32'hc4ffb2dc) && (data_in < 32'hc654896d)) begin
        data_out <= 8'b00010010;
    end
    else if ((data_in >= 32'hc654896d) && (data_in < 32'hc79943cb)) begin
        data_out <= 8'b00010011;
    end
    else if ((data_in >= 32'hc79943cb) && (data_in < 32'hc8cf7735)) begin
        data_out <= 8'b00010100;
    end
    else if ((data_in >= 32'hc8cf7735) && (data_in < 32'hc9f88062)) begin
        data_out <= 8'b00010101;
    end
    else if ((data_in >= 32'hc9f88062) && (data_in < 32'hcb158d90)) begin
        data_out <= 8'b00010110;
    end
    else if ((data_in >= 32'hcb158d90) && (data_in < 32'hcc27a66e)) begin
        data_out <= 8'b00010111;
    end
    else if ((data_in >= 32'hcc27a66e) && (data_in < 32'hcd2fb268)) begin
        data_out <= 8'b00011000;
    end
    else if ((data_in >= 32'hcd2fb268) && (data_in < 32'hce2e7db6)) begin
        data_out <= 8'b00011001;
    end
    else if ((data_in >= 32'hce2e7db6) && (data_in < 32'hcf24bd7a)) begin
        data_out <= 8'b00011010;
    end
    else if ((data_in >= 32'hcf24bd7a) && (data_in < 32'hd013131a)) begin
        data_out <= 8'b00011011;
    end
    else if ((data_in >= 32'hd013131a) && (data_in < 32'hd0fa0f04)) begin
        data_out <= 8'b00011100;
    end
    else if ((data_in >= 32'hd0fa0f04) && (data_in < 32'hd1da3301)) begin
        data_out <= 8'b00011101;
    end
    else if ((data_in >= 32'hd1da3301) && (data_in < 32'hd2b3f41a)) begin
        data_out <= 8'b00011110;
    end
    else if ((data_in >= 32'hd2b3f41a) && (data_in < 32'hd387bc3b)) begin
        data_out <= 8'b00011111;
    end
    else if ((data_in >= 32'hd387bc3b) && (data_in < 32'hd455eb8f)) begin
        data_out <= 8'b00100000;
    end
    else if ((data_in >= 32'hd455eb8f) && (data_in < 32'hd51ed9ab)) begin
        data_out <= 8'b00100001;
    end
    else if ((data_in >= 32'hd51ed9ab) && (data_in < 32'hd5e2d690)) begin
        data_out <= 8'b00100010;
    end
    else if ((data_in >= 32'hd5e2d690) && (data_in < 32'hd6a22b80)) begin
        data_out <= 8'b00100011;
    end
    else if ((data_in >= 32'hd6a22b80) && (data_in < 32'hd75d1bc0)) begin
        data_out <= 8'b00100100;
    end
    else if ((data_in >= 32'hd75d1bc0) && (data_in < 32'hd813e539)) begin
        data_out <= 8'b00100101;
    end
    else if ((data_in >= 32'hd813e539) && (data_in < 32'hd8c6c108)) begin
        data_out <= 8'b00100110;
    end
    else if ((data_in >= 32'hd8c6c108) && (data_in < 32'hd975e3fc)) begin
        data_out <= 8'b00100111;
    end
    else if ((data_in >= 32'hd975e3fc) && (data_in < 32'hda217efe)) begin
        data_out <= 8'b00101000;
    end
    else if ((data_in >= 32'hda217efe) && (data_in < 32'hdac9bf76)) begin
        data_out <= 8'b00101001;
    end
    else if ((data_in >= 32'hdac9bf76) && (data_in < 32'hdb6ecf9f)) begin
        data_out <= 8'b00101010;
    end
    else if ((data_in >= 32'hdb6ecf9f) && (data_in < 32'hdc10d6d0)) begin
        data_out <= 8'b00101011;
    end
    else if ((data_in >= 32'hdc10d6d0) && (data_in < 32'hdcaff9be)) begin
        data_out <= 8'b00101100;
    end
    else if ((data_in >= 32'hdcaff9be) && (data_in < 32'hdd4c5abc)) begin
        data_out <= 8'b00101101;
    end
    else if ((data_in >= 32'hdd4c5abc) && (data_in < 32'hdde619ea)) begin
        data_out <= 8'b00101110;
    end
    else if ((data_in >= 32'hdde619ea) && (data_in < 32'hde7d5569)) begin
        data_out <= 8'b00101111;
    end
    else if ((data_in >= 32'hde7d5569) && (data_in < 32'hdf122980)) begin
        data_out <= 8'b00110000;
    end
    else if ((data_in >= 32'hdf122980) && (data_in < 32'hdfa4b0c9)) begin
        data_out <= 8'b00110001;
    end
    else if ((data_in >= 32'hdfa4b0c9) && (data_in < 32'he035044f)) begin
        data_out <= 8'b00110010;
    end
    else if ((data_in >= 32'he035044f) && (data_in < 32'he0c33bae)) begin
        data_out <= 8'b00110011;
    end
    else if ((data_in >= 32'he0c33bae) && (data_in < 32'he14f6d2d)) begin
        data_out <= 8'b00110100;
    end
    else if ((data_in >= 32'he14f6d2d) && (data_in < 32'he1d9addc)) begin
        data_out <= 8'b00110101;
    end
    else if ((data_in >= 32'he1d9addc) && (data_in < 32'he26211a7)) begin
        data_out <= 8'b00110110;
    end
    else if ((data_in >= 32'he26211a7) && (data_in < 32'he2e8ab6f)) begin
        data_out <= 8'b00110111;
    end
    else if ((data_in >= 32'he2e8ab6f) && (data_in < 32'he36d8d18)) begin
        data_out <= 8'b00111000;
    end
    else if ((data_in >= 32'he36d8d18) && (data_in < 32'he3f0c79e)) begin
        data_out <= 8'b00111001;
    end
    else if ((data_in >= 32'he3f0c79e) && (data_in < 32'he4726b27)) begin
        data_out <= 8'b00111010;
    end
    else if ((data_in >= 32'he4726b27) && (data_in < 32'he4f2870d)) begin
        data_out <= 8'b00111011;
    end
    else if ((data_in >= 32'he4f2870d) && (data_in < 32'he57129ec)) begin
        data_out <= 8'b00111100;
    end
    else if ((data_in >= 32'he57129ec) && (data_in < 32'he5ee61b4)) begin
        data_out <= 8'b00111101;
    end
    else if ((data_in >= 32'he5ee61b4) && (data_in < 32'he66a3bac)) begin
        data_out <= 8'b00111110;
    end
    else if ((data_in >= 32'he66a3bac) && (data_in < 32'he6e4c485)) begin
        data_out <= 8'b00111111;
    end
    else if ((data_in >= 32'he6e4c485) && (data_in < 32'he75e085c)) begin
        data_out <= 8'b01000000;
    end
    else if ((data_in >= 32'he75e085c) && (data_in < 32'he7d612c9)) begin
        data_out <= 8'b01000001;
    end
    else if ((data_in >= 32'he7d612c9) && (data_in < 32'he84ceee4)) begin
        data_out <= 8'b01000010;
    end
    else if ((data_in >= 32'he84ceee4) && (data_in < 32'he8c2a74d)) begin
        data_out <= 8'b01000011;
    end
    else if ((data_in >= 32'he8c2a74d) && (data_in < 32'he9374635)) begin
        data_out <= 8'b01000100;
    end
    else if ((data_in >= 32'he9374635) && (data_in < 32'he9aad561)) begin
        data_out <= 8'b01000101;
    end
    else if ((data_in >= 32'he9aad561) && (data_in < 32'hea1d5e34)) begin
        data_out <= 8'b01000110;
    end
    else if ((data_in >= 32'hea1d5e34) && (data_in < 32'hea8ee9b3)) begin
        data_out <= 8'b01000111;
    end
    else if ((data_in >= 32'hea8ee9b3) && (data_in < 32'heaff808a)) begin
        data_out <= 8'b01001000;
    end
    else if ((data_in >= 32'heaff808a) && (data_in < 32'heb6f2b12)) begin
        data_out <= 8'b01001001;
    end
    else if ((data_in >= 32'heb6f2b12) && (data_in < 32'hebddf153)) begin
        data_out <= 8'b01001010;
    end
    else if ((data_in >= 32'hebddf153) && (data_in < 32'hec4bdb0e)) begin
        data_out <= 8'b01001011;
    end
    else if ((data_in >= 32'hec4bdb0e) && (data_in < 32'hecb8efb9)) begin
        data_out <= 8'b01001100;
    end
    else if ((data_in >= 32'hecb8efb9) && (data_in < 32'hed25368b)) begin
        data_out <= 8'b01001101;
    end
    else if ((data_in >= 32'hed25368b) && (data_in < 32'hed90b67b)) begin
        data_out <= 8'b01001110;
    end
    else if ((data_in >= 32'hed90b67b) && (data_in < 32'hedfb7641)) begin
        data_out <= 8'b01001111;
    end
    else if ((data_in >= 32'hedfb7641) && (data_in < 32'hee657c61)) begin
        data_out <= 8'b01010000;
    end
    else if ((data_in >= 32'hee657c61) && (data_in < 32'heececf26)) begin
        data_out <= 8'b01010001;
    end
    else if ((data_in >= 32'heececf26) && (data_in < 32'hef3774a9)) begin
        data_out <= 8'b01010010;
    end
    else if ((data_in >= 32'hef3774a9) && (data_in < 32'hef9f72d3)) begin
        data_out <= 8'b01010011;
    end
    else if ((data_in >= 32'hef9f72d3) && (data_in < 32'hf006cf5d)) begin
        data_out <= 8'b01010100;
    end
    else if ((data_in >= 32'hf006cf5d) && (data_in < 32'hf06d8fd8)) begin
        data_out <= 8'b01010101;
    end
    else if ((data_in >= 32'hf06d8fd8) && (data_in < 32'hf0d3b9a9)) begin
        data_out <= 8'b01010110;
    end
    else if ((data_in >= 32'hf0d3b9a9) && (data_in < 32'hf139520f)) begin
        data_out <= 8'b01010111;
    end
    else if ((data_in >= 32'hf139520f) && (data_in < 32'hf19e5e22)) begin
        data_out <= 8'b01011000;
    end
    else if ((data_in >= 32'hf19e5e22) && (data_in < 32'hf202e2d7)) begin
        data_out <= 8'b01011001;
    end
    else if ((data_in >= 32'hf202e2d7) && (data_in < 32'hf266e504)) begin
        data_out <= 8'b01011010;
    end
    else if ((data_in >= 32'hf266e504) && (data_in < 32'hf2ca695b)) begin
        data_out <= 8'b01011011;
    end
    else if ((data_in >= 32'hf2ca695b) && (data_in < 32'hf32d7472)) begin
        data_out <= 8'b01011100;
    end
    else if ((data_in >= 32'hf32d7472) && (data_in < 32'hf3900ac1)) begin
        data_out <= 8'b01011101;
    end
    else if ((data_in >= 32'hf3900ac1) && (data_in < 32'hf3f230a6)) begin
        data_out <= 8'b01011110;
    end
    else if ((data_in >= 32'hf3f230a6) && (data_in < 32'hf453ea63)) begin
        data_out <= 8'b01011111;
    end
    else if ((data_in >= 32'hf453ea63) && (data_in < 32'hf4b53c21)) begin
        data_out <= 8'b01100000;
    end
    else if ((data_in >= 32'hf4b53c21) && (data_in < 32'hf51629f5)) begin
        data_out <= 8'b01100001;
    end
    else if ((data_in >= 32'hf51629f5) && (data_in < 32'hf576b7d9)) begin
        data_out <= 8'b01100010;
    end
    else if ((data_in >= 32'hf576b7d9) && (data_in < 32'hf5d6e9b4)) begin
        data_out <= 8'b01100011;
    end
    else if ((data_in >= 32'hf5d6e9b4) && (data_in < 32'hf636c359)) begin
        data_out <= 8'b01100100;
    end
    else if ((data_in >= 32'hf636c359) && (data_in < 32'hf6964887)) begin
        data_out <= 8'b01100101;
    end
    else if ((data_in >= 32'hf6964887) && (data_in < 32'hf6f57cec)) begin
        data_out <= 8'b01100110;
    end
    else if ((data_in >= 32'hf6f57cec) && (data_in < 32'hf7546424)) begin
        data_out <= 8'b01100111;
    end
    else if ((data_in >= 32'hf7546424) && (data_in < 32'hf7b301bb)) begin
        data_out <= 8'b01101000;
    end
    else if ((data_in >= 32'hf7b301bb) && (data_in < 32'hf811592d)) begin
        data_out <= 8'b01101001;
    end
    else if ((data_in >= 32'hf811592d) && (data_in < 32'hf86f6de9)) begin
        data_out <= 8'b01101010;
    end
    else if ((data_in >= 32'hf86f6de9) && (data_in < 32'hf8cd434e)) begin
        data_out <= 8'b01101011;
    end
    else if ((data_in >= 32'hf8cd434e) && (data_in < 32'hf92adcb2)) begin
        data_out <= 8'b01101100;
    end
    else if ((data_in >= 32'hf92adcb2) && (data_in < 32'hf9883d5a)) begin
        data_out <= 8'b01101101;
    end
    else if ((data_in >= 32'hf9883d5a) && (data_in < 32'hf9e56884)) begin
        data_out <= 8'b01101110;
    end
    else if ((data_in >= 32'hf9e56884) && (data_in < 32'hfa42615f)) begin
        data_out <= 8'b01101111;
    end
    else if ((data_in >= 32'hfa42615f) && (data_in < 32'hfa9f2b15)) begin
        data_out <= 8'b01110000;
    end
    else if ((data_in >= 32'hfa9f2b15) && (data_in < 32'hfafbc8c3)) begin
        data_out <= 8'b01110001;
    end
    else if ((data_in >= 32'hfafbc8c3) && (data_in < 32'hfb583d7f)) begin
        data_out <= 8'b01110010;
    end
    else if ((data_in >= 32'hfb583d7f) && (data_in < 32'hfbb48c56)) begin
        data_out <= 8'b01110011;
    end
    else if ((data_in >= 32'hfbb48c56) && (data_in < 32'hfc10b84f)) begin
        data_out <= 8'b01110100;
    end
    else if ((data_in >= 32'hfc10b84f) && (data_in < 32'hfc6cc469)) begin
        data_out <= 8'b01110101;
    end
    else if ((data_in >= 32'hfc6cc469) && (data_in < 32'hfcc8b39d)) begin
        data_out <= 8'b01110110;
    end
    else if ((data_in >= 32'hfcc8b39d) && (data_in < 32'hfd2488e1)) begin
        data_out <= 8'b01110111;
    end
    else if ((data_in >= 32'hfd2488e1) && (data_in < 32'hfd804722)) begin
        data_out <= 8'b01111000;
    end
    else if ((data_in >= 32'hfd804722) && (data_in < 32'hfddbf14b)) begin
        data_out <= 8'b01111001;
    end
    else if ((data_in >= 32'hfddbf14b) && (data_in < 32'hfe378a44)) begin
        data_out <= 8'b01111010;
    end
    else if ((data_in >= 32'hfe378a44) && (data_in < 32'hfe9314ef)) begin
        data_out <= 8'b01111011;
    end
    else if ((data_in >= 32'hfe9314ef) && (data_in < 32'hfeee942e)) begin
        data_out <= 8'b01111100;
    end
    else if ((data_in >= 32'hfeee942e) && (data_in < 32'hff4a0ae0)) begin
        data_out <= 8'b01111101;
    end
    else if ((data_in >= 32'hff4a0ae0) && (data_in < 32'hffa57be1)) begin
        data_out <= 8'b01111110;
    end
    else if ((data_in >= 32'hffa57be1) || (data_in < 32'hea0f)) begin
        data_out <= 8'b01111111;
    end
    else if ((data_in >= 32'hea0f) && (data_in < 32'h5c5843)) begin
        data_out <= 8'b10000000;
    end
    else if ((data_in >= 32'h5c5843) && (data_in < 32'hb7c95a)) begin
        data_out <= 8'b10000001;
    end
    else if ((data_in >= 32'hb7c95a) && (data_in < 32'h1134031)) begin
        data_out <= 8'b10000010;
    end
    else if ((data_in >= 32'h1134031) && (data_in < 32'h16ebfa3)) begin
        data_out <= 8'b10000011;
    end
    else if ((data_in >= 32'h16ebfa3) && (data_in < 32'h1ca4a91)) begin
        data_out <= 8'b10000100;
    end
    else if ((data_in >= 32'h1ca4a91) && (data_in < 32'h225e3da)) begin
        data_out <= 8'b10000101;
    end
    else if ((data_in >= 32'h225e3da) && (data_in < 32'h2818e63)) begin
        data_out <= 8'b10000110;
    end
    else if ((data_in >= 32'h2818e63) && (data_in < 32'h2dd4d13)) begin
        data_out <= 8'b10000111;
    end
    else if ((data_in >= 32'h2dd4d13) && (data_in < 32'h33922d3)) begin
        data_out <= 8'b10001000;
    end
    else if ((data_in >= 32'h33922d3) && (data_in < 32'h3951295)) begin
        data_out <= 8'b10001001;
    end
    else if ((data_in >= 32'h3951295) && (data_in < 32'h3f11f4a)) begin
        data_out <= 8'b10001010;
    end
    else if ((data_in >= 32'h3f11f4a) && (data_in < 32'h44d4bee)) begin
        data_out <= 8'b10001011;
    end
    else if ((data_in >= 32'h44d4bee) && (data_in < 32'h4a99b7f)) begin
        data_out <= 8'b10001100;
    end
    else if ((data_in >= 32'h4a99b7f) && (data_in < 32'h5061105)) begin
        data_out <= 8'b10001101;
    end
    else if ((data_in >= 32'h5061105) && (data_in < 32'h562af8d)) begin
        data_out <= 8'b10001110;
    end
    else if ((data_in >= 32'h562af8d) && (data_in < 32'h5bf7a2c)) begin
        data_out <= 8'b10001111;
    end
    else if ((data_in >= 32'h5bf7a2c) && (data_in < 32'h61c7401)) begin
        data_out <= 8'b10010000;
    end
    else if ((data_in >= 32'h61c7401) && (data_in < 32'h679a035)) begin
        data_out <= 8'b10010001;
    end
    else if ((data_in >= 32'h679a035) && (data_in < 32'h6d701f7)) begin
        data_out <= 8'b10010010;
    end
    else if ((data_in >= 32'h6d701f7) && (data_in < 32'h7349c86)) begin
        data_out <= 8'b10010011;
    end
    else if ((data_in >= 32'h7349c86) && (data_in < 32'h7927327)) begin
        data_out <= 8'b10010100;
    end
    else if ((data_in >= 32'h7927327) && (data_in < 32'h7f08930)) begin
        data_out <= 8'b10010101;
    end
    else if ((data_in >= 32'h7f08930) && (data_in < 32'h84ee201)) begin
        data_out <= 8'b10010110;
    end
    else if ((data_in >= 32'h84ee201) && (data_in < 32'h8ad8108)) begin
        data_out <= 8'b10010111;
    end
    else if ((data_in >= 32'h8ad8108) && (data_in < 32'h90c69c2)) begin
        data_out <= 8'b10011000;
    end
    else if ((data_in >= 32'h90c69c2) && (data_in < 32'h96b9fbc)) begin
        data_out <= 8'b10011001;
    end
    else if ((data_in >= 32'h96b9fbc) && (data_in < 32'h9cb2691)) begin
        data_out <= 8'b10011010;
    end
    else if ((data_in >= 32'h9cb2691) && (data_in < 32'ha2b01f0)) begin
        data_out <= 8'b10011011;
    end
    else if ((data_in >= 32'ha2b01f0) && (data_in < 32'ha8b3599)) begin
        data_out <= 8'b10011100;
    end
    else if ((data_in >= 32'ha8b3599) && (data_in < 32'haebc55e)) begin
        data_out <= 8'b10011101;
    end
    else if ((data_in >= 32'haebc55e) && (data_in < 32'hb4cb527)) begin
        data_out <= 8'b10011110;
    end
    else if ((data_in >= 32'hb4cb527) && (data_in < 32'hbae08f0)) begin
        data_out <= 8'b10011111;
    end
    else if ((data_in >= 32'hbae08f0) && (data_in < 32'hc0fc4cc)) begin
        data_out <= 8'b10100000;
    end
    else if ((data_in >= 32'hc0fc4cc) && (data_in < 32'hc71ece5)) begin
        data_out <= 8'b10100001;
    end
    else if ((data_in >= 32'hc71ece5) && (data_in < 32'hcd4857f)) begin
        data_out <= 8'b10100010;
    end
    else if ((data_in >= 32'hcd4857f) && (data_in < 32'hd3792f8)) begin
        data_out <= 8'b10100011;
    end
    else if ((data_in >= 32'hd3792f8) && (data_in < 32'hd9b19c8)) begin
        data_out <= 8'b10100100;
    end
    else if ((data_in >= 32'hd9b19c8) && (data_in < 32'hdff1e85)) begin
        data_out <= 8'b10100101;
    end
    else if ((data_in >= 32'hdff1e85) && (data_in < 32'he63a5e3)) begin
        data_out <= 8'b10100110;
    end
    else if ((data_in >= 32'he63a5e3) && (data_in < 32'hec8b4b8)) begin
        data_out <= 8'b10100111;
    end
    else if ((data_in >= 32'hec8b4b8) && (data_in < 32'hf2e4ff9)) begin
        data_out <= 8'b10101000;
    end
    else if ((data_in >= 32'hf2e4ff9) && (data_in < 32'hf947cc0)) begin
        data_out <= 8'b10101001;
    end
    else if ((data_in >= 32'hf947cc0) && (data_in < 32'hffb404c)) begin
        data_out <= 8'b10101010;
    end
    else if ((data_in >= 32'hffb404c) && (data_in < 32'h1062a005)) begin
        data_out <= 8'b10101011;
    end
    else if ((data_in >= 32'h1062a005) && (data_in < 32'h10caa178)) begin
        data_out <= 8'b10101100;
    end
    else if ((data_in >= 32'h10caa178) && (data_in < 32'h11334a64)) begin
        data_out <= 8'b10101101;
    end
    else if ((data_in >= 32'h11334a64) && (data_in < 32'h119ca0af)) begin
        data_out <= 8'b10101110;
    end
    else if ((data_in >= 32'h119ca0af) && (data_in < 32'h1206aa76)) begin
        data_out <= 8'b10101111;
    end
    else if ((data_in >= 32'h1206aa76) && (data_in < 32'h12716e04)) begin
        data_out <= 8'b10110000;
    end
    else if ((data_in >= 32'h12716e04) && (data_in < 32'h12dcf1dc)) begin
        data_out <= 8'b10110001;
    end
    else if ((data_in >= 32'h12dcf1dc) && (data_in < 32'h13493cbb)) begin
        data_out <= 8'b10110010;
    end
    else if ((data_in >= 32'h13493cbb) && (data_in < 32'h13b65597)) begin
        data_out <= 8'b10110011;
    end
    else if ((data_in >= 32'h13b65597) && (data_in < 32'h142443a7)) begin
        data_out <= 8'b10110100;
    end
    else if ((data_in >= 32'h142443a7) && (data_in < 32'h14930e66)) begin
        data_out <= 8'b10110101;
    end
    else if ((data_in >= 32'h14930e66) && (data_in < 32'h1502bd93)) begin
        data_out <= 8'b10110110;
    end
    else if ((data_in >= 32'h1502bd93) && (data_in < 32'h15735939)) begin
        data_out <= 8'b10110111;
    end
    else if ((data_in >= 32'h15735939) && (data_in < 32'h15e4e9b3)) begin
        data_out <= 8'b10111000;
    end
    else if ((data_in >= 32'h15e4e9b3) && (data_in < 32'h165777af)) begin
        data_out <= 8'b10111001;
    end
    else if ((data_in >= 32'h165777af) && (data_in < 32'h16cb0c32)) begin
        data_out <= 8'b10111010;
    end
    else if ((data_in >= 32'h16cb0c32) && (data_in < 32'h173fb0a2)) begin
        data_out <= 8'b10111011;
    end
    else if ((data_in >= 32'h173fb0a2) && (data_in < 32'h17b56ec7)) begin
        data_out <= 8'b10111100;
    end
    else if ((data_in >= 32'h17b56ec7) && (data_in < 32'h182c50d3)) begin
        data_out <= 8'b10111101;
    end
    else if ((data_in >= 32'h182c50d3) && (data_in < 32'h18a46169)) begin
        data_out <= 8'b10111110;
    end
    else if ((data_in >= 32'h18a46169) && (data_in < 32'h191daba2)) begin
        data_out <= 8'b10111111;
    end
    else if ((data_in >= 32'h191daba2) && (data_in < 32'h19983b1a)) begin
        data_out <= 8'b11000000;
    end
    else if ((data_in >= 32'h19983b1a) && (data_in < 32'h1a141bf1)) begin
        data_out <= 8'b11000001;
    end
    else if ((data_in >= 32'h1a141bf1) && (data_in < 32'h1a915ada)) begin
        data_out <= 8'b11000010;
    end
    else if ((data_in >= 32'h1a915ada) && (data_in < 32'h1b100520)) begin
        data_out <= 8'b11000011;
    end
    else if ((data_in >= 32'h1b100520) && (data_in < 32'h1b9028b5)) begin
        data_out <= 8'b11000100;
    end
    else if ((data_in >= 32'h1b9028b5) && (data_in < 32'h1c11d43b)) begin
        data_out <= 8'b11000101;
    end
    else if ((data_in >= 32'h1c11d43b) && (data_in < 32'h1c95170f)) begin
        data_out <= 8'b11000110;
    end
    else if ((data_in >= 32'h1c95170f) && (data_in < 32'h1d1a015a)) begin
        data_out <= 8'b11000111;
    end
    else if ((data_in >= 32'h1d1a015a) && (data_in < 32'h1da0a41d)) begin
        data_out <= 8'b11001000;
    end
    else if ((data_in >= 32'h1da0a41d) && (data_in < 32'h1e291142)) begin
        data_out <= 8'b11001001;
    end
    else if ((data_in >= 32'h1e291142) && (data_in < 32'h1eb35bae)) begin
        data_out <= 8'b11001010;
    end
    else if ((data_in >= 32'h1eb35bae) && (data_in < 32'h1f3f9752)) begin
        data_out <= 8'b11001011;
    end
    else if ((data_in >= 32'h1f3f9752) && (data_in < 32'h1fcdd945)) begin
        data_out <= 8'b11001100;
    end
    else if ((data_in >= 32'h1fcdd945) && (data_in < 32'h205e37d5)) begin
        data_out <= 8'b11001101;
    end
    else if ((data_in >= 32'h205e37d5) && (data_in < 32'h20f0caa5)) begin
        data_out <= 8'b11001110;
    end
    else if ((data_in >= 32'h20f0caa5) && (data_in < 32'h2185aac7)) begin
        data_out <= 8'b11001111;
    end
    else if ((data_in >= 32'h2185aac7) && (data_in < 32'h221cf2dd)) begin
        data_out <= 8'b11010000;
    end
    else if ((data_in >= 32'h221cf2dd) && (data_in < 32'h22b6bf38)) begin
        data_out <= 8'b11010001;
    end
    else if ((data_in >= 32'h22b6bf38) && (data_in < 32'h23532e02)) begin
        data_out <= 8'b11010010;
    end
    else if ((data_in >= 32'h23532e02) && (data_in < 32'h23f25f66)) begin
        data_out <= 8'b11010011;
    end
    else if ((data_in >= 32'h23f25f66) && (data_in < 32'h249475c3)) begin
        data_out <= 8'b11010100;
    end
    else if ((data_in >= 32'h249475c3) && (data_in < 32'h253995da)) begin
        data_out <= 8'b11010101;
    end
    else if ((data_in >= 32'h253995da) && (data_in < 32'h25e1e712)) begin
        data_out <= 8'b11010110;
    end
    else if ((data_in >= 32'h25e1e712) && (data_in < 32'h268d93b3)) begin
        data_out <= 8'b11010111;
    end
    else if ((data_in >= 32'h268d93b3) && (data_in < 32'h273cc937)) begin
        data_out <= 8'b11011000;
    end
    else if ((data_in >= 32'h273cc937) && (data_in < 32'h27efb89c)) begin
        data_out <= 8'b11011001;
    end
    else if ((data_in >= 32'h27efb89c) && (data_in < 32'h28a696c3)) begin
        data_out <= 8'b11011010;
    end
    else if ((data_in >= 32'h28a696c3) && (data_in < 32'h29619ce2)) begin
        data_out <= 8'b11011011;
    end
    else if ((data_in >= 32'h29619ce2) && (data_in < 32'h2a2108fb)) begin
        data_out <= 8'b11011100;
    end
    else if ((data_in >= 32'h2a2108fb) && (data_in < 32'h2ae51e70)) begin
        data_out <= 8'b11011101;
    end
    else if ((data_in >= 32'h2ae51e70) && (data_in < 32'h2bae26a6)) begin
        data_out <= 8'b11011110;
    end
    else if ((data_in >= 32'h2bae26a6) && (data_in < 32'h2c7c71bf)) begin
        data_out <= 8'b11011111;
    end
    else if ((data_in >= 32'h2c7c71bf) && (data_in < 32'h2d50577b)) begin
        data_out <= 8'b11100000;
    end
    else if ((data_in >= 32'h2d50577b) && (data_in < 32'h2e2a3834)) begin
        data_out <= 8'b11100001;
    end
    else if ((data_in >= 32'h2e2a3834) && (data_in < 32'h2f0a7e0b)) begin
        data_out <= 8'b11100010;
    end
    else if ((data_in >= 32'h2f0a7e0b) && (data_in < 32'h2ff19e47)) begin
        data_out <= 8'b11100011;
    end
    else if ((data_in >= 32'h2ff19e47) && (data_in < 32'h30e01af4)) begin
        data_out <= 8'b11100100;
    end
    else if ((data_in >= 32'h30e01af4) && (data_in < 32'h31d684d4)) begin
        data_out <= 8'b11100101;
    end
    else if ((data_in >= 32'h31d684d4) && (data_in < 32'h32d57da9)) begin
        data_out <= 8'b11100110;
    end
    else if ((data_in >= 32'h32d57da9) && (data_in < 32'h33ddbb03)) begin
        data_out <= 8'b11100111;
    end
    else if ((data_in >= 32'h33ddbb03) && (data_in < 32'h34f00999)) begin
        data_out <= 8'b11101000;
    end
    else if ((data_in >= 32'h34f00999) && (data_in < 32'h360d5170)) begin
        data_out <= 8'b11101001;
    end
    else if ((data_in >= 32'h360d5170) && (data_in < 32'h37369aea)) begin
        data_out <= 8'b11101010;
    end
    else if ((data_in >= 32'h37369aea) && (data_in < 32'h386d151f)) begin
        data_out <= 8'b11101011;
    end
    else if ((data_in >= 32'h386d151f) && (data_in < 32'h39b21dca)) begin
        data_out <= 8'b11101100;
    end
    else if ((data_in >= 32'h39b21dca) && (data_in < 32'h3b074b6d)) begin
        data_out <= 8'b11101101;
    end
    else if ((data_in >= 32'h3b074b6d) && (data_in < 32'h3c6e7a47)) begin
        data_out <= 8'b11101110;
    end
    else if ((data_in >= 32'h3c6e7a47) && (data_in < 32'h3de9dd4a)) begin
        data_out <= 8'b11101111;
    end
    else if ((data_in >= 32'h3de9dd4a) && (data_in < 32'h3f7c1489)) begin
        data_out <= 8'b11110000;
    end
    else if ((data_in >= 32'h3f7c1489) && (data_in < 32'h41284b61)) begin
        data_out <= 8'b11110001;
    end
    else if ((data_in >= 32'h41284b61) && (data_in < 32'h42f261e1)) begin
        data_out <= 8'b11110010;
    end
    else if ((data_in >= 32'h42f261e1) && (data_in < 32'h44df26c7)) begin
        data_out <= 8'b11110011;
    end
    else if ((data_in >= 32'h44df26c7) && (data_in < 32'h46f4aad4)) begin
        data_out <= 8'b11110100;
    end
    else if ((data_in >= 32'h46f4aad4) && (data_in < 32'h493abbf8)) begin
        data_out <= 8'b11110101;
    end
    else if ((data_in >= 32'h493abbf8) && (data_in < 32'h4bbba1ba)) begin
        data_out <= 8'b11110110;
    end
    else if ((data_in >= 32'h4bbba1ba) && (data_in < 32'h4e854920)) begin
        data_out <= 8'b11110111;
    end
    else if ((data_in >= 32'h4e854920) && (data_in < 32'h51ab3a39)) begin
        data_out <= 8'b11111000;
    end
    else if ((data_in >= 32'h51ab3a39) && (data_in < 32'h554a1381)) begin
        data_out <= 8'b11111001;
    end
    else if ((data_in >= 32'h554a1381) && (data_in < 32'h598e3adb)) begin
        data_out <= 8'b11111010;
    end
    else if ((data_in >= 32'h598e3adb) && (data_in < 32'h5ec222d1)) begin
        data_out <= 8'b11111011;
    end
    else if ((data_in >= 32'h5ec222d1) && (data_in < 32'h65718cf6)) begin
        data_out <= 8'b11111100;
    end
    else if ((data_in >= 32'h65718cf6) && (data_in < 32'h6ed6f9c2)) begin
        data_out <= 8'b11111101;
    end
    else if ((data_in >= 32'h6ed6f9c2) && (data_in < 32'h7ee3589b)) begin
        data_out <= 8'b11111110;
    end
    else begin
        data_out <= 8'b11111111;
    end
    end
endmodule

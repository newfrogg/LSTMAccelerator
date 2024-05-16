`timescale 1ps / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/04/2024 09:55:22 AM
// Design Name: 
// Module Name: tanh_activation
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

// tanh(Wx + Wh + b)
// W: 8 bits, b: 32 bits
module tanh #(parameter OUT_BITWIDTH = 8,
              parameter IN_BITWIDTH = 32
)(
        input   logic   [31:0]  data_in,    //  32 bits input
        output  logic   [7:0]   data_out    // 8 bits output
    );
//logic [OUTPUT_WIDTH - 1:0] out;

//assign data_out = out;

always @(*) begin
	if ((data_in >= 32'h80000000) && (data_in < 32'h90041d32)) begin
        data_out <= 8'b10000001;
    end
    else if ((data_in >= 32'h90041d32) && (data_in < 32'h9973a50a)) begin
        data_out <= 8'b10000010;
    end
    else if ((data_in >= 32'h9973a50a) && (data_in < 32'ha02e6cf2)) begin
        data_out <= 8'b10000011;
    end
    else if ((data_in >= 32'ha02e6cf2) && (data_in < 32'ha56ceff7)) begin
        data_out <= 8'b10000100;
    end
    else if ((data_in >= 32'ha56ceff7) && (data_in < 32'ha9bab22f)) begin
        data_out <= 8'b10000101;
    end
    else if ((data_in >= 32'ha9bab22f) && (data_in < 32'had623a01)) begin
        data_out <= 8'b10000110;
    end
    else if ((data_in >= 32'had623a01) && (data_in < 32'hb0900e0c)) begin
        data_out <= 8'b10000111;
    end
    else if ((data_in >= 32'hb0900e0c) && (data_in < 32'hb360eb8b)) begin
        data_out <= 8'b10001000;
    end
    else if ((data_in >= 32'hb360eb8b) && (data_in < 32'hb5e8747f)) begin
        data_out <= 8'b10001001;
    end
    else if ((data_in >= 32'hb5e8747f) && (data_in < 32'hb834ab33)) begin
        data_out <= 8'b10001010;
    end
    else if ((data_in >= 32'hb834ab33) && (data_in < 32'hba4fe883)) begin
        data_out <= 8'b10001011;
    end
    else if ((data_in >= 32'hba4fe883) && (data_in < 32'hbc420891)) begin
        data_out <= 8'b10001100;
    end
    else if ((data_in >= 32'hbc420891) && (data_in < 32'hbe1127d0)) begin
        data_out <= 8'b10001101;
    end
    else if ((data_in >= 32'hbe1127d0) && (data_in < 32'hbfc21eb7)) begin
        data_out <= 8'b10001110;
    end
    else if ((data_in >= 32'hbfc21eb7) && (data_in < 32'hc158d578)) begin
        data_out <= 8'b10001111;
    end
    else if ((data_in >= 32'hc158d578) && (data_in < 32'hc2d87e54)) begin
        data_out <= 8'b10010000;
    end
    else if ((data_in >= 32'hc2d87e54) && (data_in < 32'hc443bf39)) begin
        data_out <= 8'b10010001;
    end
    else if ((data_in >= 32'hc443bf39) && (data_in < 32'hc59cd023)) begin
        data_out <= 8'b10010010;
    end
    else if ((data_in >= 32'hc59cd023) && (data_in < 32'hc6e591a9)) begin
        data_out <= 8'b10010011;
    end
    else if ((data_in >= 32'hc6e591a9) && (data_in < 32'hc81f9e12)) begin
        data_out <= 8'b10010100;
    end
    else if ((data_in >= 32'hc81f9e12) && (data_in < 32'hc94c566a)) begin
        data_out <= 8'b10010101;
    end
    else if ((data_in >= 32'hc94c566a) && (data_in < 32'hca6cecaf)) begin
        data_out <= 8'b10010110;
    end
    else if ((data_in >= 32'hca6cecaf) && (data_in < 32'hcb826bd4)) begin
        data_out <= 8'b10010111;
    end
    else if ((data_in >= 32'hcb826bd4) && (data_in < 32'hcc8dbe26)) begin
        data_out <= 8'b10011000;
    end
    else if ((data_in >= 32'hcc8dbe26) && (data_in < 32'hcd8fb265)) begin
        data_out <= 8'b10011001;
    end
    else if ((data_in >= 32'hcd8fb265) && (data_in < 32'hce88fff3)) begin
        data_out <= 8'b10011010;
    end
    else if ((data_in >= 32'hce88fff3) && (data_in < 32'hcf7a4a35)) begin
        data_out <= 8'b10011011;
    end
    else if ((data_in >= 32'hcf7a4a35) && (data_in < 32'hd0642367)) begin
        data_out <= 8'b10011100;
    end
    else if ((data_in >= 32'hd0642367) && (data_in < 32'hd1470eec)) begin
        data_out <= 8'b10011101;
    end
    else if ((data_in >= 32'hd1470eec) && (data_in < 32'hd2238341)) begin
        data_out <= 8'b10011110;
    end
    else if ((data_in >= 32'hd2238341) && (data_in < 32'hd2f9eba3)) begin
        data_out <= 8'b10011111;
    end
    else if ((data_in >= 32'hd2f9eba3) && (data_in < 32'hd3caa96e)) begin
        data_out <= 8'b10100000;
    end
    else if ((data_in >= 32'hd3caa96e) && (data_in < 32'hd496154f)) begin
        data_out <= 8'b10100001;
    end
    else if ((data_in >= 32'hd496154f) && (data_in < 32'hd55c8043)) begin
        data_out <= 8'b10100010;
    end
    else if ((data_in >= 32'hd55c8043) && (data_in < 32'hd61e3476)) begin
        data_out <= 8'b10100011;
    end
    else if ((data_in >= 32'hd61e3476) && (data_in < 32'hd6db7602)) begin
        data_out <= 8'b10100100;
    end
    else if ((data_in >= 32'hd6db7602) && (data_in < 32'hd7948394)) begin
        data_out <= 8'b10100101;
    end
    else if ((data_in >= 32'hd7948394) && (data_in < 32'hd8499701)) begin
        data_out <= 8'b10100110;
    end
    else if ((data_in >= 32'hd8499701) && (data_in < 32'hd8fae5bd)) begin
        data_out <= 8'b10100111;
    end
    else if ((data_in >= 32'hd8fae5bd) && (data_in < 32'hd9a8a14e)) begin
        data_out <= 8'b10101000;
    end
    else if ((data_in >= 32'hd9a8a14e) && (data_in < 32'hda52f7ac)) begin
        data_out <= 8'b10101001;
    end
    else if ((data_in >= 32'hda52f7ac) && (data_in < 32'hdafa1398)) begin
        data_out <= 8'b10101010;
    end
    else if ((data_in >= 32'hdafa1398) && (data_in < 32'hdb9e1ce5)) begin
        data_out <= 8'b10101011;
    end
    else if ((data_in >= 32'hdb9e1ce5) && (data_in < 32'hdc3f38be)) begin
        data_out <= 8'b10101100;
    end
    else if ((data_in >= 32'hdc3f38be) && (data_in < 32'hdcdd89e3)) begin
        data_out <= 8'b10101101;
    end
    else if ((data_in >= 32'hdcdd89e3) && (data_in < 32'hdd7930d9)) begin
        data_out <= 8'b10101110;
    end
    else if ((data_in >= 32'hdd7930d9) && (data_in < 32'hde124c20)) begin
        data_out <= 8'b10101111;
    end
    else if ((data_in >= 32'hde124c20) && (data_in < 32'hdea8f85c)) begin
        data_out <= 8'b10110000;
    end
    else if ((data_in >= 32'hdea8f85c) && (data_in < 32'hdf3d5079)) begin
        data_out <= 8'b10110001;
    end
    else if ((data_in >= 32'hdf3d5079) && (data_in < 32'hdfcf6dd2)) begin
        data_out <= 8'b10110010;
    end
    else if ((data_in >= 32'hdfcf6dd2) && (data_in < 32'he05f684d)) begin
        data_out <= 8'b10110011;
    end
    else if ((data_in >= 32'he05f684d) && (data_in < 32'he0ed567a)) begin
        data_out <= 8'b10110100;
    end
    else if ((data_in >= 32'he0ed567a) && (data_in < 32'he1794daa)) begin
        data_out <= 8'b10110101;
    end
    else if ((data_in >= 32'he1794daa) && (data_in < 32'he203620a)) begin
        data_out <= 8'b10110110;
    end
    else if ((data_in >= 32'he203620a) && (data_in < 32'he28ba6b5)) begin
        data_out <= 8'b10110111;
    end
    else if ((data_in >= 32'he28ba6b5) && (data_in < 32'he3122dc9)) begin
        data_out <= 8'b10111000;
    end
    else if ((data_in >= 32'he3122dc9) && (data_in < 32'he3970879)) begin
        data_out <= 8'b10111001;
    end
    else if ((data_in >= 32'he3970879) && (data_in < 32'he41a471c)) begin
        data_out <= 8'b10111010;
    end
    else if ((data_in >= 32'he41a471c) && (data_in < 32'he49bf93d)) begin
        data_out <= 8'b10111011;
    end
    else if ((data_in >= 32'he49bf93d) && (data_in < 32'he51c2da8)) begin
        data_out <= 8'b10111100;
    end
    else if ((data_in >= 32'he51c2da8) && (data_in < 32'he59af277)) begin
        data_out <= 8'b10111101;
    end
    else if ((data_in >= 32'he59af277) && (data_in < 32'he618551e)) begin
        data_out <= 8'b10111110;
    end
    else if ((data_in >= 32'he618551e) && (data_in < 32'he6946273)) begin
        data_out <= 8'b10111111;
    end
    else if ((data_in >= 32'he6946273) && (data_in < 32'he70f26bd)) begin
        data_out <= 8'b11000000;
    end
    else if ((data_in >= 32'he70f26bd) && (data_in < 32'he788adb6)) begin
        data_out <= 8'b11000001;
    end
    else if ((data_in >= 32'he788adb6) && (data_in < 32'he801029b)) begin
        data_out <= 8'b11000010;
    end
    else if ((data_in >= 32'he801029b) && (data_in < 32'he878302d)) begin
        data_out <= 8'b11000011;
    end
    else if ((data_in >= 32'he878302d) && (data_in < 32'he8ee40bc)) begin
        data_out <= 8'b11000100;
    end
    else if ((data_in >= 32'he8ee40bc) && (data_in < 32'he9633e2e)) begin
        data_out <= 8'b11000101;
    end
    else if ((data_in >= 32'he9633e2e) && (data_in < 32'he9d73204)) begin
        data_out <= 8'b11000110;
    end
    else if ((data_in >= 32'he9d73204) && (data_in < 32'hea4a255d)) begin
        data_out <= 8'b11000111;
    end
    else if ((data_in >= 32'hea4a255d) && (data_in < 32'heabc2104)) begin
        data_out <= 8'b11001000;
    end
    else if ((data_in >= 32'heabc2104) && (data_in < 32'heb2d2d69)) begin
        data_out <= 8'b11001001;
    end
    else if ((data_in >= 32'heb2d2d69) && (data_in < 32'heb9d52b0)) begin
        data_out <= 8'b11001010;
    end
    else if ((data_in >= 32'heb9d52b0) && (data_in < 32'hec0c98b1)) begin
        data_out <= 8'b11001011;
    end
    else if ((data_in >= 32'hec0c98b1) && (data_in < 32'hec7b06fc)) begin
        data_out <= 8'b11001100;
    end
    else if ((data_in >= 32'hec7b06fc) && (data_in < 32'hece8a4dc)) begin
        data_out <= 8'b11001101;
    end
    else if ((data_in >= 32'hece8a4dc) && (data_in < 32'hed55795f)) begin
        data_out <= 8'b11001110;
    end
    else if ((data_in >= 32'hed55795f) && (data_in < 32'hedc18b54)) begin
        data_out <= 8'b11001111;
    end
    else if ((data_in >= 32'hedc18b54) && (data_in < 32'hee2ce152)) begin
        data_out <= 8'b11010000;
    end
    else if ((data_in >= 32'hee2ce152) && (data_in < 32'hee9781b8)) begin
        data_out <= 8'b11010001;
    end
    else if ((data_in >= 32'hee9781b8) && (data_in < 32'hef0172b2)) begin
        data_out <= 8'b11010010;
    end
    else if ((data_in >= 32'hef0172b2) && (data_in < 32'hef6aba3d)) begin
        data_out <= 8'b11010011;
    end
    else if ((data_in >= 32'hef6aba3d) && (data_in < 32'hefd35e24)) begin
        data_out <= 8'b11010100;
    end
    else if ((data_in >= 32'hefd35e24) && (data_in < 32'hf03b6408)) begin
        data_out <= 8'b11010101;
    end
    else if ((data_in >= 32'hf03b6408) && (data_in < 32'hf0a2d161)) begin
        data_out <= 8'b11010110;
    end
    else if ((data_in >= 32'hf0a2d161) && (data_in < 32'hf109ab7d)) begin
        data_out <= 8'b11010111;
    end
    else if ((data_in >= 32'hf109ab7d) && (data_in < 32'hf16ff785)) begin
        data_out <= 8'b11011000;
    end
    else if ((data_in >= 32'hf16ff785) && (data_in < 32'hf1d5ba7e)) begin
        data_out <= 8'b11011001;
    end
    else if ((data_in >= 32'hf1d5ba7e) && (data_in < 32'hf23af94d)) begin
        data_out <= 8'b11011010;
    end
    else if ((data_in >= 32'hf23af94d) && (data_in < 32'hf29fb8b2)) begin
        data_out <= 8'b11011011;
    end
    else if ((data_in >= 32'hf29fb8b2) && (data_in < 32'hf303fd53)) begin
        data_out <= 8'b11011100;
    end
    else if ((data_in >= 32'hf303fd53) && (data_in < 32'hf367cbb5)) begin
        data_out <= 8'b11011101;
    end
    else if ((data_in >= 32'hf367cbb5) && (data_in < 32'hf3cb2844)) begin
        data_out <= 8'b11011110;
    end
    else if ((data_in >= 32'hf3cb2844) && (data_in < 32'hf42e1750)) begin
        data_out <= 8'b11011111;
    end
    else if ((data_in >= 32'hf42e1750) && (data_in < 32'hf4909d10)) begin
        data_out <= 8'b11100000;
    end
    else if ((data_in >= 32'hf4909d10) && (data_in < 32'hf4f2bda2)) begin
        data_out <= 8'b11100001;
    end
    else if ((data_in >= 32'hf4f2bda2) && (data_in < 32'hf5547d11)) begin
        data_out <= 8'b11100010;
    end
    else if ((data_in >= 32'hf5547d11) && (data_in < 32'hf5b5df4e)) begin
        data_out <= 8'b11100011;
    end
    else if ((data_in >= 32'hf5b5df4e) && (data_in < 32'hf616e839)) begin
        data_out <= 8'b11100100;
    end
    else if ((data_in >= 32'hf616e839) && (data_in < 32'hf6779b9d)) begin
        data_out <= 8'b11100101;
    end
    else if ((data_in >= 32'hf6779b9d) && (data_in < 32'hf6d7fd32)) begin
        data_out <= 8'b11100110;
    end
    else if ((data_in >= 32'hf6d7fd32) && (data_in < 32'hf73810a1)) begin
        data_out <= 8'b11100111;
    end
    else if ((data_in >= 32'hf73810a1) && (data_in < 32'hf797d981)) begin
        data_out <= 8'b11101000;
    end
    else if ((data_in >= 32'hf797d981) && (data_in < 32'hf7f75b58)) begin
        data_out <= 8'b11101001;
    end
    else if ((data_in >= 32'hf7f75b58) && (data_in < 32'hf85699a1)) begin
        data_out <= 8'b11101010;
    end
    else if ((data_in >= 32'hf85699a1) && (data_in < 32'hf8b597c5)) begin
        data_out <= 8'b11101011;
    end
    else if ((data_in >= 32'hf8b597c5) && (data_in < 32'hf9145924)) begin
        data_out <= 8'b11101100;
    end
    else if ((data_in >= 32'hf9145924) && (data_in < 32'hf972e10f)) begin
        data_out <= 8'b11101101;
    end
    else if ((data_in >= 32'hf972e10f) && (data_in < 32'hf9d132cb)) begin
        data_out <= 8'b11101110;
    end
    else if ((data_in >= 32'hf9d132cb) && (data_in < 32'hfa2f5196)) begin
        data_out <= 8'b11101111;
    end
    else if ((data_in >= 32'hfa2f5196) && (data_in < 32'hfa8d409f)) begin
        data_out <= 8'b11110000;
    end
    else if ((data_in >= 32'hfa8d409f) && (data_in < 32'hfaeb030f)) begin
        data_out <= 8'b11110001;
    end
    else if ((data_in >= 32'hfaeb030f) && (data_in < 32'hfb489c05)) begin
        data_out <= 8'b11110010;
    end
    else if ((data_in >= 32'hfb489c05) && (data_in < 32'hfba60e99)) begin
        data_out <= 8'b11110011;
    end
    else if ((data_in >= 32'hfba60e99) && (data_in < 32'hfc035dda)) begin
        data_out <= 8'b11110100;
    end
    else if ((data_in >= 32'hfc035dda) && (data_in < 32'hfc608cd1)) begin
        data_out <= 8'b11110101;
    end
    else if ((data_in >= 32'hfc608cd1) && (data_in < 32'hfcbd9e81)) begin
        data_out <= 8'b11110110;
    end
    else if ((data_in >= 32'hfcbd9e81) && (data_in < 32'hfd1a95e7)) begin
        data_out <= 8'b11110111;
    end
    else if ((data_in >= 32'hfd1a95e7) && (data_in < 32'hfd7775fc)) begin
        data_out <= 8'b11111000;
    end
    else if ((data_in >= 32'hfd7775fc) && (data_in < 32'hfdd441b3)) begin
        data_out <= 8'b11111001;
    end
    else if ((data_in >= 32'hfdd441b3) && (data_in < 32'hfe30fbfc)) begin
        data_out <= 8'b11111010;
    end
    else if ((data_in >= 32'hfe30fbfc) && (data_in < 32'hfe8da7c4)) begin
        data_out <= 8'b11111011;
    end
    else if ((data_in >= 32'hfe8da7c4) && (data_in < 32'hfeea47f5)) begin
        data_out <= 8'b11111100;
    end
    else if ((data_in >= 32'hfeea47f5) && (data_in < 32'hff46df76)) begin
        data_out <= 8'b11111101;
    end
    else if ((data_in >= 32'hff46df76) && (data_in < 32'hffa3712e)) begin
        data_out <= 8'b11111110;
    end
    else if ((data_in >= 32'hffa3712e) && (data_in <= 32'hffffffff)) begin
        data_out <= 8'b11111111;
    end
    else if ((data_in >= 32'h0) && (data_in < 32'h5c8ed2)) begin
        data_out <= 8'b00000000;
    end
    else if ((data_in >= 32'h5c8ed2) && (data_in < 32'hb9208a)) begin
        data_out <= 8'b00000001;
    end
    else if ((data_in >= 32'hb9208a) && (data_in < 32'h115b80b)) begin
        data_out <= 8'b00000010;
    end
    else if ((data_in >= 32'h115b80b) && (data_in < 32'h172583c)) begin
        data_out <= 8'b00000011;
    end
    else if ((data_in >= 32'h172583c) && (data_in < 32'h1cf0404)) begin
        data_out <= 8'b00000100;
    end
    else if ((data_in >= 32'h1cf0404) && (data_in < 32'h22bbe4d)) begin
        data_out <= 8'b00000101;
    end
    else if ((data_in >= 32'h22bbe4d) && (data_in < 32'h2888a04)) begin
        data_out <= 8'b00000110;
    end
    else if ((data_in >= 32'h2888a04) && (data_in < 32'h2e56a19)) begin
        data_out <= 8'b00000111;
    end
    else if ((data_in >= 32'h2e56a19) && (data_in < 32'h342617f)) begin
        data_out <= 8'b00001000;
    end
    else if ((data_in >= 32'h342617f) && (data_in < 32'h39f732f)) begin
        data_out <= 8'b00001001;
    end
    else if ((data_in >= 32'h39f732f) && (data_in < 32'h3fca226)) begin
        data_out <= 8'b00001010;
    end
    else if ((data_in >= 32'h3fca226) && (data_in < 32'h459f167)) begin
        data_out <= 8'b00001011;
    end
    else if ((data_in >= 32'h459f167) && (data_in < 32'h4b763fb)) begin
        data_out <= 8'b00001100;
    end
    else if ((data_in >= 32'h4b763fb) && (data_in < 32'h514fcf1)) begin
        data_out <= 8'b00001101;
    end
    else if ((data_in >= 32'h514fcf1) && (data_in < 32'h572bf61)) begin
        data_out <= 8'b00001110;
    end
    else if ((data_in >= 32'h572bf61) && (data_in < 32'h5d0ae6a)) begin
        data_out <= 8'b00001111;
    end
    else if ((data_in >= 32'h5d0ae6a) && (data_in < 32'h62ecd35)) begin
        data_out <= 8'b00010000;
    end
    else if ((data_in >= 32'h62ecd35) && (data_in < 32'h68d1ef1)) begin
        data_out <= 8'b00010001;
    end
    else if ((data_in >= 32'h68d1ef1) && (data_in < 32'h6eba6dc)) begin
        data_out <= 8'b00010010;
    end
    else if ((data_in >= 32'h6eba6dc) && (data_in < 32'h74a683b)) begin
        data_out <= 8'b00010011;
    end
    else if ((data_in >= 32'h74a683b) && (data_in < 32'h7a9665f)) begin
        data_out <= 8'b00010100;
    end
    else if ((data_in >= 32'h7a9665f) && (data_in < 32'h808a4a8)) begin
        data_out <= 8'b00010101;
    end
    else if ((data_in >= 32'h808a4a8) && (data_in < 32'h868267f)) begin
        data_out <= 8'b00010110;
    end
    else if ((data_in >= 32'h868267f) && (data_in < 32'h8c7ef5f)) begin
        data_out <= 8'b00010111;
    end
    else if ((data_in >= 32'h8c7ef5f) && (data_in < 32'h92802ce)) begin
        data_out <= 8'b00011000;
    end
    else if ((data_in >= 32'h92802ce) && (data_in < 32'h9886463)) begin
        data_out <= 8'b00011001;
    end
    else if ((data_in >= 32'h9886463) && (data_in < 32'h9e917c7)) begin
        data_out <= 8'b00011010;
    end
    else if ((data_in >= 32'h9e917c7) && (data_in < 32'ha4a20b2)) begin
        data_out <= 8'b00011011;
    end
    else if ((data_in >= 32'ha4a20b2) && (data_in < 32'haab82ef)) begin
        data_out <= 8'b00011100;
    end
    else if ((data_in >= 32'haab82ef) && (data_in < 32'hb0d425e)) begin
        data_out <= 8'b00011101;
    end
    else if ((data_in >= 32'hb0d425e) && (data_in < 32'hb6f62f0)) begin
        data_out <= 8'b00011110;
    end
    else if ((data_in >= 32'hb6f62f0) && (data_in < 32'hbd1e8b0)) begin
        data_out <= 8'b00011111;
    end
    else if ((data_in >= 32'hbd1e8b0) && (data_in < 32'hc34d7bc)) begin
        data_out <= 8'b00100000;
    end
    else if ((data_in >= 32'hc34d7bc) && (data_in < 32'hc98344b)) begin
        data_out <= 8'b00100001;
    end
    else if ((data_in >= 32'hc98344b) && (data_in < 32'hcfc02ad)) begin
        data_out <= 8'b00100010;
    end
    else if ((data_in >= 32'hcfc02ad) && (data_in < 32'hd60474e)) begin
        data_out <= 8'b00100011;
    end
    else if ((data_in >= 32'hd60474e) && (data_in < 32'hdc506b3)) begin
        data_out <= 8'b00100100;
    end
    else if ((data_in >= 32'hdc506b3) && (data_in < 32'he2a4582)) begin
        data_out <= 8'b00100101;
    end
    else if ((data_in >= 32'he2a4582) && (data_in < 32'he90087b)) begin
        data_out <= 8'b00100110;
    end
    else if ((data_in >= 32'he90087b) && (data_in < 32'hef65483)) begin
        data_out <= 8'b00100111;
    end
    else if ((data_in >= 32'hef65483) && (data_in < 32'hf5d2e9f)) begin
        data_out <= 8'b00101000;
    end
    else if ((data_in >= 32'hf5d2e9f) && (data_in < 32'hfc49bf8)) begin
        data_out <= 8'b00101001;
    end
    else if ((data_in >= 32'hfc49bf8) && (data_in < 32'h102ca1dc)) begin
        data_out <= 8'b00101010;
    end
    else if ((data_in >= 32'h102ca1dc) && (data_in < 32'h109545c3)) begin
        data_out <= 8'b00101011;
    end
    else if ((data_in >= 32'h109545c3) && (data_in < 32'h10fe8d4e)) begin
        data_out <= 8'b00101100;
    end
    else if ((data_in >= 32'h10fe8d4e) && (data_in < 32'h11687e48)) begin
        data_out <= 8'b00101101;
    end
    else if ((data_in >= 32'h11687e48) && (data_in < 32'h11d31eae)) begin
        data_out <= 8'b00101110;
    end
    else if ((data_in >= 32'h11d31eae) && (data_in < 32'h123e74ac)) begin
        data_out <= 8'b00101111;
    end
    else if ((data_in >= 32'h123e74ac) && (data_in < 32'h12aa86a1)) begin
        data_out <= 8'b00110000;
    end
    else if ((data_in >= 32'h12aa86a1) && (data_in < 32'h13175b24)) begin
        data_out <= 8'b00110001;
    end
    else if ((data_in >= 32'h13175b24) && (data_in < 32'h1384f904)) begin
        data_out <= 8'b00110010;
    end
    else if ((data_in >= 32'h1384f904) && (data_in < 32'h13f3674f)) begin
        data_out <= 8'b00110011;
    end
    else if ((data_in >= 32'h13f3674f) && (data_in < 32'h1462ad50)) begin
        data_out <= 8'b00110100;
    end
    else if ((data_in >= 32'h1462ad50) && (data_in < 32'h14d2d297)) begin
        data_out <= 8'b00110101;
    end
    else if ((data_in >= 32'h14d2d297) && (data_in < 32'h1543defc)) begin
        data_out <= 8'b00110110;
    end
    else if ((data_in >= 32'h1543defc) && (data_in < 32'h15b5daa3)) begin
        data_out <= 8'b00110111;
    end
    else if ((data_in >= 32'h15b5daa3) && (data_in < 32'h1628cdfc)) begin
        data_out <= 8'b00111000;
    end
    else if ((data_in >= 32'h1628cdfc) && (data_in < 32'h169cc1d2)) begin
        data_out <= 8'b00111001;
    end
    else if ((data_in >= 32'h169cc1d2) && (data_in < 32'h1711bf44)) begin
        data_out <= 8'b00111010;
    end
    else if ((data_in >= 32'h1711bf44) && (data_in < 32'h1787cfd3)) begin
        data_out <= 8'b00111011;
    end
    else if ((data_in >= 32'h1787cfd3) && (data_in < 32'h17fefd65)) begin
        data_out <= 8'b00111100;
    end
    else if ((data_in >= 32'h17fefd65) && (data_in < 32'h1877524a)) begin
        data_out <= 8'b00111101;
    end
    else if ((data_in >= 32'h1877524a) && (data_in < 32'h18f0d943)) begin
        data_out <= 8'b00111110;
    end
    else if ((data_in >= 32'h18f0d943) && (data_in < 32'h196b9d8d)) begin
        data_out <= 8'b00111111;
    end
    else if ((data_in >= 32'h196b9d8d) && (data_in < 32'h19e7aae2)) begin
        data_out <= 8'b01000000;
    end
    else if ((data_in >= 32'h19e7aae2) && (data_in < 32'h1a650d89)) begin
        data_out <= 8'b01000001;
    end
    else if ((data_in >= 32'h1a650d89) && (data_in < 32'h1ae3d258)) begin
        data_out <= 8'b01000010;
    end
    else if ((data_in >= 32'h1ae3d258) && (data_in < 32'h1b6406c3)) begin
        data_out <= 8'b01000011;
    end
    else if ((data_in >= 32'h1b6406c3) && (data_in < 32'h1be5b8e4)) begin
        data_out <= 8'b01000100;
    end
    else if ((data_in >= 32'h1be5b8e4) && (data_in < 32'h1c68f787)) begin
        data_out <= 8'b01000101;
    end
    else if ((data_in >= 32'h1c68f787) && (data_in < 32'h1cedd237)) begin
        data_out <= 8'b01000110;
    end
    else if ((data_in >= 32'h1cedd237) && (data_in < 32'h1d74594b)) begin
        data_out <= 8'b01000111;
    end
    else if ((data_in >= 32'h1d74594b) && (data_in < 32'h1dfc9df6)) begin
        data_out <= 8'b01001000;
    end
    else if ((data_in >= 32'h1dfc9df6) && (data_in < 32'h1e86b256)) begin
        data_out <= 8'b01001001;
    end
    else if ((data_in >= 32'h1e86b256) && (data_in < 32'h1f12a986)) begin
        data_out <= 8'b01001010;
    end
    else if ((data_in >= 32'h1f12a986) && (data_in < 32'h1fa097b3)) begin
        data_out <= 8'b01001011;
    end
    else if ((data_in >= 32'h1fa097b3) && (data_in < 32'h2030922e)) begin
        data_out <= 8'b01001100;
    end
    else if ((data_in >= 32'h2030922e) && (data_in < 32'h20c2af87)) begin
        data_out <= 8'b01001101;
    end
    else if ((data_in >= 32'h20c2af87) && (data_in < 32'h215707a4)) begin
        data_out <= 8'b01001110;
    end
    else if ((data_in >= 32'h215707a4) && (data_in < 32'h21edb3e0)) begin
        data_out <= 8'b01001111;
    end
    else if ((data_in >= 32'h21edb3e0) && (data_in < 32'h2286cf27)) begin
        data_out <= 8'b01010000;
    end
    else if ((data_in >= 32'h2286cf27) && (data_in < 32'h2322761d)) begin
        data_out <= 8'b01010001;
    end
    else if ((data_in >= 32'h2322761d) && (data_in < 32'h23c0c742)) begin
        data_out <= 8'b01010010;
    end
    else if ((data_in >= 32'h23c0c742) && (data_in < 32'h2461e31b)) begin
        data_out <= 8'b01010011;
    end
    else if ((data_in >= 32'h2461e31b) && (data_in < 32'h2505ec68)) begin
        data_out <= 8'b01010100;
    end
    else if ((data_in >= 32'h2505ec68) && (data_in < 32'h25ad0854)) begin
        data_out <= 8'b01010101;
    end
    else if ((data_in >= 32'h25ad0854) && (data_in < 32'h26575eb2)) begin
        data_out <= 8'b01010110;
    end
    else if ((data_in >= 32'h26575eb2) && (data_in < 32'h27051a43)) begin
        data_out <= 8'b01010111;
    end
    else if ((data_in >= 32'h27051a43) && (data_in < 32'h27b668ff)) begin
        data_out <= 8'b01011000;
    end
    else if ((data_in >= 32'h27b668ff) && (data_in < 32'h286b7c6c)) begin
        data_out <= 8'b01011001;
    end
    else if ((data_in >= 32'h286b7c6c) && (data_in < 32'h292489fe)) begin
        data_out <= 8'b01011010;
    end
    else if ((data_in >= 32'h292489fe) && (data_in < 32'h29e1cb8a)) begin
        data_out <= 8'b01011011;
    end
    else if ((data_in >= 32'h29e1cb8a) && (data_in < 32'h2aa37fbd)) begin
        data_out <= 8'b01011100;
    end
    else if ((data_in >= 32'h2aa37fbd) && (data_in < 32'h2b69eab1)) begin
        data_out <= 8'b01011101;
    end
    else if ((data_in >= 32'h2b69eab1) && (data_in < 32'h2c355692)) begin
        data_out <= 8'b01011110;
    end
    else if ((data_in >= 32'h2c355692) && (data_in < 32'h2d06145d)) begin
        data_out <= 8'b01011111;
    end
    else if ((data_in >= 32'h2d06145d) && (data_in < 32'h2ddc7cbf)) begin
        data_out <= 8'b01100000;
    end
    else if ((data_in >= 32'h2ddc7cbf) && (data_in < 32'h2eb8f114)) begin
        data_out <= 8'b01100001;
    end
    else if ((data_in >= 32'h2eb8f114) && (data_in < 32'h2f9bdc99)) begin
        data_out <= 8'b01100010;
    end
    else if ((data_in >= 32'h2f9bdc99) && (data_in < 32'h3085b5cb)) begin
        data_out <= 8'b01100011;
    end
    else if ((data_in >= 32'h3085b5cb) && (data_in < 32'h3177000d)) begin
        data_out <= 8'b01100100;
    end
    else if ((data_in >= 32'h3177000d) && (data_in < 32'h32704d9b)) begin
        data_out <= 8'b01100101;
    end
    else if ((data_in >= 32'h32704d9b) && (data_in < 32'h337241da)) begin
        data_out <= 8'b01100110;
    end
    else if ((data_in >= 32'h337241da) && (data_in < 32'h347d942c)) begin
        data_out <= 8'b01100111;
    end
    else if ((data_in >= 32'h347d942c) && (data_in < 32'h35931351)) begin
        data_out <= 8'b01101000;
    end
    else if ((data_in >= 32'h35931351) && (data_in < 32'h36b3a996)) begin
        data_out <= 8'b01101001;
    end
    else if ((data_in >= 32'h36b3a996) && (data_in < 32'h37e061ee)) begin
        data_out <= 8'b01101010;
    end
    else if ((data_in >= 32'h37e061ee) && (data_in < 32'h391a6e57)) begin
        data_out <= 8'b01101011;
    end
    else if ((data_in >= 32'h391a6e57) && (data_in < 32'h3a632fdd)) begin
        data_out <= 8'b01101100;
    end
    else if ((data_in >= 32'h3a632fdd) && (data_in < 32'h3bbc40c7)) begin
        data_out <= 8'b01101101;
    end
    else if ((data_in >= 32'h3bbc40c7) && (data_in < 32'h3d2781ac)) begin
        data_out <= 8'b01101110;
    end
    else if ((data_in >= 32'h3d2781ac) && (data_in < 32'h3ea72a88)) begin
        data_out <= 8'b01101111;
    end
    else if ((data_in >= 32'h3ea72a88) && (data_in < 32'h403de149)) begin
        data_out <= 8'b01110000;
    end
    else if ((data_in >= 32'h403de149) && (data_in < 32'h41eed830)) begin
        data_out <= 8'b01110001;
    end
    else if ((data_in >= 32'h41eed830) && (data_in < 32'h43bdf76f)) begin
        data_out <= 8'b01110010;
    end
    else if ((data_in >= 32'h43bdf76f) && (data_in < 32'h45b0177d)) begin
        data_out <= 8'b01110011;
    end
    else if ((data_in >= 32'h45b0177d) && (data_in < 32'h47cb54cd)) begin
        data_out <= 8'b01110100;
    end
    else if ((data_in >= 32'h47cb54cd) && (data_in < 32'h4a178b81)) begin
        data_out <= 8'b01110101;
    end
    else if ((data_in >= 32'h4a178b81) && (data_in < 32'h4c9f1475)) begin
        data_out <= 8'b01110110;
    end
    else if ((data_in >= 32'h4c9f1475) && (data_in < 32'h4f6ff1f4)) begin
        data_out <= 8'b01110111;
    end
    else if ((data_in >= 32'h4f6ff1f4) && (data_in < 32'h529dc5ff)) begin
        data_out <= 8'b01111000;
    end
    else if ((data_in >= 32'h529dc5ff) && (data_in < 32'h56454dd1)) begin
        data_out <= 8'b01111001;
    end
    else if ((data_in >= 32'h56454dd1) && (data_in < 32'h5a931009)) begin
        data_out <= 8'b01111010;
    end
    else if ((data_in >= 32'h5a931009) && (data_in < 32'h5fd1930e)) begin
        data_out <= 8'b01111011;
    end
    else if ((data_in >= 32'h5fd1930e) && (data_in < 32'h668c5af6)) begin
        data_out <= 8'b01111100;
    end
    else if ((data_in >= 32'h668c5af6) && (data_in < 32'h6ffbe2ce)) begin
        data_out <= 8'b01111101;
    end
    else if ((data_in >= 32'h6ffbe2ce) && (data_in < 32'h7fffffff)) begin
        data_out <= 8'b01111110;
    end
    else begin
        data_out <= 8'b01111111;
    end
end
endmodule

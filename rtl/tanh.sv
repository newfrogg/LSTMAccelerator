`timescale 1ns / 1ps
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
module tanh_activation #(parameter OUTPUT_BITWIDTH = 8,
                         parameter INPUT_BITWIDTH = 32
)(
        input   logic   [INPUT_BITWIDTH - 1:0]  data_in,    //  32 bits input
        output  logic   [OUTPUT_BITWIDTH - 1:0] data_out    // 8 bits output
    );
logic [OUTPUT_BITWIDTH - 1:0] out;

assign data_out = out;

always_comb begin
	if (data_in < -1878778574) begin
        out <= 10000001;
    end
    else if ((data_in >= -1878778574) && (data_in < -1720474358)) begin
            out <= 10000010;
    end
    else if ((data_in >= -1720474358) && (data_in < -1607570190)) begin
            out <= 10000011;
    end
    else if ((data_in >= -1607570190) && (data_in < -1519587337)) begin
            out <= 10000100;
    end
    else if ((data_in >= -1519587337) && (data_in < -1447382481)) begin
            out <= 10000101;
    end
    else if ((data_in >= -1447382481) && (data_in < -1386071551)) begin
            out <= 10000110;
    end
    else if ((data_in >= -1386071551) && (data_in < -1332736500)) begin
            out <= 10000111;
    end
    else if ((data_in >= -1332736500) && (data_in < -1285493877)) begin
            out <= 10001000;
    end
    else if ((data_in >= -1285493877) && (data_in < -1243057025)) begin
            out <= 10001001;
    end
    else if ((data_in >= -1243057025) && (data_in < -1204507853)) begin
            out <= 10001010;
    end
    else if ((data_in >= -1204507853) && (data_in < -1169168253)) begin
            out <= 10001011;
    end
    else if ((data_in >= -1169168253) && (data_in < -1136523119)) begin
            out <= 10001100;
    end
    else if ((data_in >= -1136523119) && (data_in < -1106171952)) begin
            out <= 10001101;
    end
    else if ((data_in >= -1106171952) && (data_in < -1077797193)) begin
            out <= 10001110;
    end
    else if ((data_in >= -1077797193) && (data_in < -1051142792)) begin
            out <= 10001111;
    end
    else if ((data_in >= -1051142792) && (data_in < -1025999276)) begin
            out <= 10010000;
    end
    else if ((data_in >= -1025999276) && (data_in < -1002193095)) begin
            out <= 10010001;
    end
    else if ((data_in >= -1002193095) && (data_in < -979578845)) begin
            out <= 10010010;
    end
    else if ((data_in >= -979578845) && (data_in < -958033495)) begin
            out <= 10010011;
    end
    else if ((data_in >= -958033495) && (data_in < -937452014)) begin
            out <= 10010100;
    end
    else if ((data_in >= -937452014) && (data_in < -917744022)) begin
            out <= 10010101;
    end
    else if ((data_in >= -917744022) && (data_in < -898831185)) begin
            out <= 10010110;
    end
    else if ((data_in >= -898831185) && (data_in < -880645164)) begin
            out <= 10010111;
    end
    else if ((data_in >= -880645164) && (data_in < -863125978)) begin
            out <= 10011000;
    end
    else if ((data_in >= -863125978) && (data_in < -846220699)) begin
            out <= 10011001;
    end
    else if ((data_in >= -846220699) && (data_in < -829882381)) begin
            out <= 10011010;
    end
    else if ((data_in >= -829882381) && (data_in < -814069195)) begin
            out <= 10011011;
    end
    else if ((data_in >= -814069195) && (data_in < -798743705)) begin
            out <= 10011100;
    end
    else if ((data_in >= -798743705) && (data_in < -783872276)) begin
            out <= 10011101;
    end
    else if ((data_in >= -783872276) && (data_in < -769424575)) begin
            out <= 10011110;
    end
    else if ((data_in >= -769424575) && (data_in < -755373149)) begin
            out <= 10011111;
    end
    else if ((data_in >= -755373149) && (data_in < -741693074)) begin
            out <= 10100000;
    end
    else if ((data_in >= -741693074) && (data_in < -728361649)) begin
            out <= 10100001;
    end
    else if ((data_in >= -728361649) && (data_in < -715358141)) begin
            out <= 10100010;
    end
    else if ((data_in >= -715358141) && (data_in < -702663562)) begin
            out <= 10100011;
    end
    else if ((data_in >= -702663562) && (data_in < -690260478)) begin
            out <= 10100100;
    end
    else if ((data_in >= -690260478) && (data_in < -678132844)) begin
            out <= 10100101;
    end
    else if ((data_in >= -678132844) && (data_in < -666265855)) begin
            out <= 10100110;
    end
    else if ((data_in >= -666265855) && (data_in < -654645827)) begin
            out <= 10100111;
    end
    else if ((data_in >= -654645827) && (data_in < -643260082)) begin
            out <= 10101000;
    end
    else if ((data_in >= -643260082) && (data_in < -632096852)) begin
            out <= 10101001;
    end
    else if ((data_in >= -632096852) && (data_in < -621145192)) begin
            out <= 10101010;
    end
    else if ((data_in >= -621145192) && (data_in < -610394907)) begin
            out <= 10101011;
    end
    else if ((data_in >= -610394907) && (data_in < -599836482)) begin
            out <= 10101100;
    end
    else if ((data_in >= -599836482) && (data_in < -589461021)) begin
            out <= 10101101;
    end
    else if ((data_in >= -589461021) && (data_in < -579260199)) begin
            out <= 10101110;
    end
    else if ((data_in >= -579260199) && (data_in < -569226208)) begin
            out <= 10101111;
    end
    else if ((data_in >= -569226208) && (data_in < -559351716)) begin
            out <= 10110000;
    end
    else if ((data_in >= -559351716) && (data_in < -549629831)) begin
            out <= 10110001;
    end
    else if ((data_in >= -549629831) && (data_in < -540054062)) begin
            out <= 10110010;
    end
    else if ((data_in >= -540054062) && (data_in < -530618291)) begin
            out <= 10110011;
    end
    else if ((data_in >= -530618291) && (data_in < -521316742)) begin
            out <= 10110100;
    end
    else if ((data_in >= -521316742) && (data_in < -512143958)) begin
            out <= 10110101;
    end
    else if ((data_in >= -512143958) && (data_in < -503094774)) begin
            out <= 10110110;
    end
    else if ((data_in >= -503094774) && (data_in < -494164299)) begin
            out <= 10110111;
    end
    else if ((data_in >= -494164299) && (data_in < -485347895)) begin
            out <= 10111000;
    end
    else if ((data_in >= -485347895) && (data_in < -476641159)) begin
            out <= 10111001;
    end
    else if ((data_in >= -476641159) && (data_in < -468039908)) begin
            out <= 10111010;
    end
    else if ((data_in >= -468039908) && (data_in < -459540163)) begin
            out <= 10111011;
    end
    else if ((data_in >= -459540163) && (data_in < -451138136)) begin
            out <= 10111100;
    end
    else if ((data_in >= -451138136) && (data_in < -442830217)) begin
            out <= 10111101;
    end
    else if ((data_in >= -442830217) && (data_in < -434612962)) begin
            out <= 10111110;
    end
    else if ((data_in >= -434612962) && (data_in < -426483085)) begin
            out <= 10111111;
    end
    else if ((data_in >= -426483085) && (data_in < -418437443)) begin
            out <= 11000000;
    end
    else if ((data_in >= -418437443) && (data_in < -410473034)) begin
            out <= 11000001;
    end
    else if ((data_in >= -410473034) && (data_in < -402586981)) begin
            out <= 11000010;
    end
    else if ((data_in >= -402586981) && (data_in < -394776531)) begin
            out <= 11000011;
    end
    else if ((data_in >= -394776531) && (data_in < -387039044)) begin
            out <= 11000100;
    end
    else if ((data_in >= -387039044) && (data_in < -379371986)) begin
            out <= 11000101;
    end
    else if ((data_in >= -379371986) && (data_in < -371772924)) begin
            out <= 11000110;
    end
    else if ((data_in >= -371772924) && (data_in < -364239523)) begin
            out <= 11000111;
    end
    else if ((data_in >= -364239523) && (data_in < -356769532)) begin
            out <= 11001000;
    end
    else if ((data_in >= -356769532) && (data_in < -349360791)) begin
            out <= 11001001;
    end
    else if ((data_in >= -349360791) && (data_in < -342011216)) begin
            out <= 11001010;
    end
    else if ((data_in >= -342011216) && (data_in < -334718799)) begin
            out <= 11001011;
    end
    else if ((data_in >= -334718799) && (data_in < -327481604)) begin
            out <= 11001100;
    end
    else if ((data_in >= -327481604) && (data_in < -320297764)) begin
            out <= 11001101;
    end
    else if ((data_in >= -320297764) && (data_in < -313165473)) begin
            out <= 11001110;
    end
    else if ((data_in >= -313165473) && (data_in < -306082988)) begin
            out <= 11001111;
    end
    else if ((data_in >= -306082988) && (data_in < -299048622)) begin
            out <= 11010000;
    end
    else if ((data_in >= -299048622) && (data_in < -292060744)) begin
            out <= 11010001;
    end
    else if ((data_in >= -292060744) && (data_in < -285117774)) begin
            out <= 11010010;
    end
    else if ((data_in >= -285117774) && (data_in < -278218179)) begin
            out <= 11010011;
    end
    else if ((data_in >= -278218179) && (data_in < -271360476)) begin
            out <= 11010100;
    end
    else if ((data_in >= -271360476) && (data_in < -264543224)) begin
            out <= 11010101;
    end
    else if ((data_in >= -264543224) && (data_in < -257765023)) begin
            out <= 11010110;
    end
    else if ((data_in >= -257765023) && (data_in < -251024515)) begin
            out <= 11010111;
    end
    else if ((data_in >= -251024515) && (data_in < -244320379)) begin
            out <= 11011000;
    end
    else if ((data_in >= -244320379) && (data_in < -237651330)) begin
            out <= 11011001;
    end
    else if ((data_in >= -237651330) && (data_in < -231016115)) begin
            out <= 11011010;
    end
    else if ((data_in >= -231016115) && (data_in < -224413518)) begin
            out <= 11011011;
    end
    else if ((data_in >= -224413518) && (data_in < -217842349)) begin
            out <= 11011100;
    end
    else if ((data_in >= -217842349) && (data_in < -211301451)) begin
            out <= 11011101;
    end
    else if ((data_in >= -211301451) && (data_in < -204789692)) begin
            out <= 11011110;
    end
    else if ((data_in >= -204789692) && (data_in < -198305968)) begin
            out <= 11011111;
    end
    else if ((data_in >= -198305968) && (data_in < -191849200)) begin
            out <= 11100000;
    end
    else if ((data_in >= -191849200) && (data_in < -185418334)) begin
            out <= 11100001;
    end
    else if ((data_in >= -185418334) && (data_in < -179012335)) begin
            out <= 11100010;
    end
    else if ((data_in >= -179012335) && (data_in < -172630194)) begin
            out <= 11100011;
    end
    else if ((data_in >= -172630194) && (data_in < -166270919)) begin
            out <= 11100100;
    end
    else if ((data_in >= -166270919) && (data_in < -159933539)) begin
            out <= 11100101;
    end
    else if ((data_in >= -159933539) && (data_in < -153617102)) begin
            out <= 11100110;
    end
    else if ((data_in >= -153617102) && (data_in < -147320671)) begin
            out <= 11100111;
    end
    else if ((data_in >= -147320671) && (data_in < -141043327)) begin
            out <= 11101000;
    end
    else if ((data_in >= -141043327) && (data_in < -134784168)) begin
            out <= 11101001;
    end
    else if ((data_in >= -134784168) && (data_in < -128542303)) begin
            out <= 11101010;
    end
    else if ((data_in >= -128542303) && (data_in < -122316859)) begin
            out <= 11101011;
    end
    else if ((data_in >= -122316859) && (data_in < -116106972)) begin
            out <= 11101100;
    end
    else if ((data_in >= -116106972) && (data_in < -109911793)) begin
            out <= 11101101;
    end
    else if ((data_in >= -109911793) && (data_in < -103730485)) begin
            out <= 11101110;
    end
    else if ((data_in >= -103730485) && (data_in < -97562218)) begin
            out <= 11101111;
    end
    else if ((data_in >= -97562218) && (data_in < -91406177)) begin
            out <= 11110000;
    end
    else if ((data_in >= -91406177) && (data_in < -85261553)) begin
            out <= 11110001;
    end
    else if ((data_in >= -85261553) && (data_in < -79127547)) begin
            out <= 11110010;
    end
    else if ((data_in >= -79127547) && (data_in < -73003367)) begin
            out <= 11110011;
    end
    else if ((data_in >= -73003367) && (data_in < -66888230)) begin
            out <= 11110100;
    end
    else if ((data_in >= -66888230) && (data_in < -60781359)) begin
            out <= 11110101;
    end
    else if ((data_in >= -60781359) && (data_in < -54681983)) begin
            out <= 11110110;
    end
    else if ((data_in >= -54681983) && (data_in < -48589337)) begin
            out <= 11110111;
    end
    else if ((data_in >= -48589337) && (data_in < -42502660)) begin
            out <= 11111000;
    end
    else if ((data_in >= -42502660) && (data_in < -36421197)) begin
            out <= 11111001;
    end
    else if ((data_in >= -36421197) && (data_in < -30344196)) begin
            out <= 11111010;
    end
    else if ((data_in >= -30344196) && (data_in < -24270908)) begin
            out <= 11111011;
    end
    else if ((data_in >= -24270908) && (data_in < -18200587)) begin
            out <= 11111100;
    end
    else if ((data_in >= -18200587) && (data_in < -12132490)) begin
            out <= 11111101;
    end
    else if ((data_in >= -12132490) && (data_in < -6065874)) begin
            out <= 11111110;
    end
    else if ((data_in >= -6065874) && (data_in < 1)) begin
            out <= 11111111;
    end
    else if ((data_in >= 1) && (data_in < 6065874)) begin
            out <= 00000000;
    end
    else if ((data_in >= 6065874) && (data_in < 12132490)) begin
            out <= 00000001;
    end
    else if ((data_in >= 12132490) && (data_in < 18200587)) begin
            out <= 00000010;
    end
    else if ((data_in >= 18200587) && (data_in < 24270908)) begin
            out <= 00000011;
    end
    else if ((data_in >= 24270908) && (data_in < 30344196)) begin
            out <= 00000100;
    end
    else if ((data_in >= 30344196) && (data_in < 36421197)) begin
            out <= 00000101;
    end
    else if ((data_in >= 36421197) && (data_in < 42502660)) begin
            out <= 00000110;
    end
    else if ((data_in >= 42502660) && (data_in < 48589337)) begin
            out <= 00000111;
    end
    else if ((data_in >= 48589337) && (data_in < 54681983)) begin
            out <= 00001000;
    end
    else if ((data_in >= 54681983) && (data_in < 60781359)) begin
            out <= 00001001;
    end
    else if ((data_in >= 60781359) && (data_in < 66888230)) begin
            out <= 00001010;
    end
    else if ((data_in >= 66888230) && (data_in < 73003367)) begin
            out <= 00001011;
    end
    else if ((data_in >= 73003367) && (data_in < 79127547)) begin
            out <= 00001100;
    end
    else if ((data_in >= 79127547) && (data_in < 85261553)) begin
            out <= 00001101;
    end
    else if ((data_in >= 85261553) && (data_in < 91406177)) begin
            out <= 00001110;
    end
    else if ((data_in >= 91406177) && (data_in < 97562218)) begin
            out <= 00001111;
    end
    else if ((data_in >= 97562218) && (data_in < 103730485)) begin
            out <= 00010000;
    end
    else if ((data_in >= 103730485) && (data_in < 109911793)) begin
            out <= 00010001;
    end
    else if ((data_in >= 109911793) && (data_in < 116106972)) begin
            out <= 00010010;
    end
    else if ((data_in >= 116106972) && (data_in < 122316859)) begin
            out <= 00010011;
    end
    else if ((data_in >= 122316859) && (data_in < 128542303)) begin
            out <= 00010100;
    end
    else if ((data_in >= 128542303) && (data_in < 134784168)) begin
            out <= 00010101;
    end
    else if ((data_in >= 134784168) && (data_in < 141043327)) begin
            out <= 00010110;
    end
    else if ((data_in >= 141043327) && (data_in < 147320671)) begin
            out <= 00010111;
    end
    else if ((data_in >= 147320671) && (data_in < 153617102)) begin
            out <= 00011000;
    end
    else if ((data_in >= 153617102) && (data_in < 159933539)) begin
            out <= 00011001;
    end
    else if ((data_in >= 159933539) && (data_in < 166270919)) begin
            out <= 00011010;
    end
    else if ((data_in >= 166270919) && (data_in < 172630194)) begin
            out <= 00011011;
    end
    else if ((data_in >= 172630194) && (data_in < 179012335)) begin
            out <= 00011100;
    end
    else if ((data_in >= 179012335) && (data_in < 185418334)) begin
            out <= 00011101;
    end
    else if ((data_in >= 185418334) && (data_in < 191849200)) begin
            out <= 00011110;
    end
    else if ((data_in >= 191849200) && (data_in < 198305968)) begin
            out <= 00011111;
    end
    else if ((data_in >= 198305968) && (data_in < 204789692)) begin
            out <= 00100000;
    end
    else if ((data_in >= 204789692) && (data_in < 211301451)) begin
            out <= 00100001;
    end
    else if ((data_in >= 211301451) && (data_in < 217842349)) begin
            out <= 00100010;
    end
    else if ((data_in >= 217842349) && (data_in < 224413518)) begin
            out <= 00100011;
    end
    else if ((data_in >= 224413518) && (data_in < 231016115)) begin
            out <= 00100100;
    end
    else if ((data_in >= 231016115) && (data_in < 237651330)) begin
            out <= 00100101;
    end
    else if ((data_in >= 237651330) && (data_in < 244320379)) begin
            out <= 00100110;
    end
    else if ((data_in >= 244320379) && (data_in < 251024515)) begin
            out <= 00100111;
    end
    else if ((data_in >= 251024515) && (data_in < 257765023)) begin
            out <= 00101000;
    end
    else if ((data_in >= 257765023) && (data_in < 264543224)) begin
            out <= 00101001;
    end
    else if ((data_in >= 264543224) && (data_in < 271360476)) begin
            out <= 00101010;
    end
    else if ((data_in >= 271360476) && (data_in < 278218179)) begin
            out <= 00101011;
    end
    else if ((data_in >= 278218179) && (data_in < 285117774)) begin
            out <= 00101100;
    end
    else if ((data_in >= 285117774) && (data_in < 292060744)) begin
            out <= 00101101;
    end
    else if ((data_in >= 292060744) && (data_in < 299048622)) begin
            out <= 00101110;
    end
    else if ((data_in >= 299048622) && (data_in < 306082988)) begin
            out <= 00101111;
    end
    else if ((data_in >= 306082988) && (data_in < 313165473)) begin
            out <= 00110000;
    end
    else if ((data_in >= 313165473) && (data_in < 320297764)) begin
            out <= 00110001;
    end
    else if ((data_in >= 320297764) && (data_in < 327481604)) begin
            out <= 00110010;
    end
    else if ((data_in >= 327481604) && (data_in < 334718799)) begin
            out <= 00110011;
    end
    else if ((data_in >= 334718799) && (data_in < 342011216)) begin
            out <= 00110100;
    end
    else if ((data_in >= 342011216) && (data_in < 349360791)) begin
            out <= 00110101;
    end
    else if ((data_in >= 349360791) && (data_in < 356769532)) begin
            out <= 00110110;
    end
    else if ((data_in >= 356769532) && (data_in < 364239523)) begin
            out <= 00110111;
    end
    else if ((data_in >= 364239523) && (data_in < 371772924)) begin
            out <= 00111000;
    end
    else if ((data_in >= 371772924) && (data_in < 379371986)) begin
            out <= 00111001;
    end
    else if ((data_in >= 379371986) && (data_in < 387039044)) begin
            out <= 00111010;
    end
    else if ((data_in >= 387039044) && (data_in < 394776531)) begin
            out <= 00111011;
    end
    else if ((data_in >= 394776531) && (data_in < 402586981)) begin
            out <= 00111100;
    end
    else if ((data_in >= 402586981) && (data_in < 410473034)) begin
            out <= 00111101;
    end
    else if ((data_in >= 410473034) && (data_in < 418437443)) begin
            out <= 00111110;
    end
    else if ((data_in >= 418437443) && (data_in < 426483085)) begin
            out <= 00111111;
    end
    else if ((data_in >= 426483085) && (data_in < 434612962)) begin
            out <= 01000000;
    end
    else if ((data_in >= 434612962) && (data_in < 442830217)) begin
            out <= 01000001;
    end
    else if ((data_in >= 442830217) && (data_in < 451138136)) begin
            out <= 01000010;
    end
    else if ((data_in >= 451138136) && (data_in < 459540163)) begin
            out <= 01000011;
    end
    else if ((data_in >= 459540163) && (data_in < 468039908)) begin
            out <= 01000100;
    end
    else if ((data_in >= 468039908) && (data_in < 476641159)) begin
            out <= 01000101;
    end
    else if ((data_in >= 476641159) && (data_in < 485347895)) begin
            out <= 01000110;
    end
    else if ((data_in >= 485347895) && (data_in < 494164299)) begin
            out <= 01000111;
    end
    else if ((data_in >= 494164299) && (data_in < 503094774)) begin
            out <= 01001000;
    end
    else if ((data_in >= 503094774) && (data_in < 512143958)) begin
            out <= 01001001;
    end
    else if ((data_in >= 512143958) && (data_in < 521316742)) begin
            out <= 01001010;
    end
    else if ((data_in >= 521316742) && (data_in < 530618291)) begin
            out <= 01001011;
    end
    else if ((data_in >= 530618291) && (data_in < 540054062)) begin
            out <= 01001100;
    end
    else if ((data_in >= 540054062) && (data_in < 549629831)) begin
            out <= 01001101;
    end
    else if ((data_in >= 549629831) && (data_in < 559351716)) begin
            out <= 01001110;
    end
    else if ((data_in >= 559351716) && (data_in < 569226208)) begin
            out <= 01001111;
    end
    else if ((data_in >= 569226208) && (data_in < 579260199)) begin
            out <= 01010000;
    end
    else if ((data_in >= 579260199) && (data_in < 589461021)) begin
            out <= 01010001;
    end
    else if ((data_in >= 589461021) && (data_in < 599836482)) begin
            out <= 01010010;
    end
    else if ((data_in >= 599836482) && (data_in < 610394907)) begin
            out <= 01010011;
    end
    else if ((data_in >= 610394907) && (data_in < 621145192)) begin
            out <= 01010100;
    end
    else if ((data_in >= 621145192) && (data_in < 632096852)) begin
            out <= 01010101;
    end
    else if ((data_in >= 632096852) && (data_in < 643260082)) begin
            out <= 01010110;
    end
    else if ((data_in >= 643260082) && (data_in < 654645827)) begin
            out <= 01010111;
    end
    else if ((data_in >= 654645827) && (data_in < 666265855)) begin
            out <= 01011000;
    end
    else if ((data_in >= 666265855) && (data_in < 678132844)) begin
            out <= 01011001;
    end
    else if ((data_in >= 678132844) && (data_in < 690260478)) begin
            out <= 01011010;
    end
    else if ((data_in >= 690260478) && (data_in < 702663562)) begin
            out <= 01011011;
    end
    else if ((data_in >= 702663562) && (data_in < 715358141)) begin
            out <= 01011100;
    end
    else if ((data_in >= 715358141) && (data_in < 728361649)) begin
            out <= 01011101;
    end
    else if ((data_in >= 728361649) && (data_in < 741693074)) begin
            out <= 01011110;
    end
    else if ((data_in >= 741693074) && (data_in < 755373149)) begin
            out <= 01011111;
    end
    else if ((data_in >= 755373149) && (data_in < 769424575)) begin
            out <= 01100000;
    end
    else if ((data_in >= 769424575) && (data_in < 783872276)) begin
            out <= 01100001;
    end
    else if ((data_in >= 783872276) && (data_in < 798743705)) begin
            out <= 01100010;
    end
    else if ((data_in >= 798743705) && (data_in < 814069195)) begin
            out <= 01100011;
    end
    else if ((data_in >= 814069195) && (data_in < 829882381)) begin
            out <= 01100100;
    end
    else if ((data_in >= 829882381) && (data_in < 846220699)) begin
            out <= 01100101;
    end
    else if ((data_in >= 846220699) && (data_in < 863125978)) begin
            out <= 01100110;
    end
    else if ((data_in >= 863125978) && (data_in < 880645164)) begin
            out <= 01100111;
    end
    else if ((data_in >= 880645164) && (data_in < 898831185)) begin
            out <= 01101000;
    end
    else if ((data_in >= 898831185) && (data_in < 917744022)) begin
            out <= 01101001;
    end
    else if ((data_in >= 917744022) && (data_in < 937452014)) begin
            out <= 01101010;
    end
    else if ((data_in >= 937452014) && (data_in < 958033495)) begin
            out <= 01101011;
    end
    else if ((data_in >= 958033495) && (data_in < 979578845)) begin
            out <= 01101100;
    end
    else if ((data_in >= 979578845) && (data_in < 1002193095)) begin
            out <= 01101101;
    end
    else if ((data_in >= 1002193095) && (data_in < 1025999276)) begin
            out <= 01101110;
    end
    else if ((data_in >= 1025999276) && (data_in < 1051142792)) begin
            out <= 01101111;
    end
    else if ((data_in >= 1051142792) && (data_in < 1077797193)) begin
            out <= 01110000;
    end
    else if ((data_in >= 1077797193) && (data_in < 1106171952)) begin
            out <= 01110001;
    end
    else if ((data_in >= 1106171952) && (data_in < 1136523119)) begin
            out <= 01110010;
    end
    else if ((data_in >= 1136523119) && (data_in < 1169168253)) begin
            out <= 01110011;
    end
    else if ((data_in >= 1169168253) && (data_in < 1204507853)) begin
            out <= 01110100;
    end
    else if ((data_in >= 1204507853) && (data_in < 1243057025)) begin
            out <= 01110101;
    end
    else if ((data_in >= 1243057025) && (data_in < 1285493877)) begin
            out <= 01110110;
    end
    else if ((data_in >= 1285493877) && (data_in < 1332736500)) begin
            out <= 01110111;
    end
    else if ((data_in >= 1332736500) && (data_in < 1386071551)) begin
            out <= 01111000;
    end
    else if ((data_in >= 1386071551) && (data_in < 1447382481)) begin
            out <= 01111001;
    end
    else if ((data_in >= 1447382481) && (data_in < 1519587337)) begin
            out <= 01111010;
    end
    else if ((data_in >= 1519587337) && (data_in < 1607570190)) begin
            out <= 01111011;
    end
    else if ((data_in >= 1607570190) && (data_in < 1720474358)) begin
            out <= 01111100;
    end
    else if ((data_in >= 1720474358) && (data_in < 1878778574)) begin
            out <= 01111101;
    end
    else if ((data_in >= 1878778574) && (data_in < 2147483647)) begin
            out <= 01111110;
    end
    else begin
            out <= 01111111;
    end
end
endmodule


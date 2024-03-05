`timescale 1ns / 1ps

module sigmoid #(parameter OUTPUT_BITWIDTH = 8,
                         parameter INPUT_BITWIDTH = 32 )(
	input   logic   [INPUT_BITWIDTH - 1:0]  data_in,    //  32 bits input
	output  logic   [OUTPUT_BITWIDTH - 1:0] data_out    // 8 bits output
);

always_comb begin
    if (data_in < -2121128654) begin
        data_out <= 00000000
	end
    else if ((data_in >= -2121128654) && (data_in < -1855717383)) begin
		data_out <= 00000001
	end
	else if ((data_in >= -1855717383) && (data_in < -1699353618)) begin
		data_out <= 00000010
	end
	else if ((data_in >= -1699353618) && (data_in < -1587833366)) begin
		data_out <= 00000011
	end
	else if ((data_in >= -1587833366) && (data_in < -1500928928)) begin
		data_out <= 00000100
	end
	else if ((data_in >= -1500928928) && (data_in < -1429609074)) begin
		data_out <= 00000101
	end
	else if ((data_in >= -1429609074) && (data_in < -1369049600)) begin
		data_out <= 00000110
	end
	else if ((data_in >= -1369049600) && (data_in < -1316368232)) begin
		data_out <= 00000111
	end
	else if ((data_in >= -1316368232) && (data_in < -1269704607)) begin
		data_out <= 00001000
	end
	else if ((data_in >= -1269704607) && (data_in < -1227787840)) begin
		data_out <= 00001001
	end
	else if ((data_in >= -1227787840) && (data_in < -1189711096)) begin
		data_out <= 00001010
	end
	else if ((data_in >= -1189711096) && (data_in < -1154804578)) begin
		data_out <= 00001011
	end
	else if ((data_in >= -1154804578) && (data_in < -1122559495)) begin
		data_out <= 00001100
	end
	else if ((data_in >= -1122559495) && (data_in < -1092580257)) begin
		data_out <= 00001101
	end
	else if ((data_in >= -1092580257) && (data_in < -1064553199)) begin
		data_out <= 00001110
	end
	else if ((data_in >= -1064553199) && (data_in < -1038225408)) begin
		data_out <= 00001111
	end
	else if ((data_in >= -1038225408) && (data_in < -1013389980)) begin
		data_out <= 00010000
	end
	else if ((data_in >= -1013389980) && (data_in < -989875492)) begin
		data_out <= 00010001
	end
	else if ((data_in >= -989875492) && (data_in < -967538323)) begin
		data_out <= 00010010
	end
	else if ((data_in >= -967538323) && (data_in < -946256949)) begin
		data_out <= 00010011
	end
	else if ((data_in >= -946256949) && (data_in < -925927627)) begin
		data_out <= 00010100
	end
	else if ((data_in >= -925927627) && (data_in < -906461086)) begin
		data_out <= 00010101
	end
	else if ((data_in >= -906461086) && (data_in < -887779952)) begin
		data_out <= 00010110
	end
	else if ((data_in >= -887779952) && (data_in < -869816722)) begin
		data_out <= 00010111
	end
	else if ((data_in >= -869816722) && (data_in < -852512152)) begin
		data_out <= 00011000
	end
	else if ((data_in >= -852512152) && (data_in < -835813962)) begin
		data_out <= 00011001
	end
	else if ((data_in >= -835813962) && (data_in < -819675782)) begin
		data_out <= 00011010
	end
	else if ((data_in >= -819675782) && (data_in < -804056294)) begin
		data_out <= 00011011
	end
	else if ((data_in >= -804056294) && (data_in < -788918524)) begin
		data_out <= 00011100
	end
	else if ((data_in >= -788918524) && (data_in < -774229247)) begin
		data_out <= 00011101
	end
	else if ((data_in >= -774229247) && (data_in < -759958502)) begin
		data_out <= 00011110
	end
	else if ((data_in >= -759958502) && (data_in < -746079173)) begin
		data_out <= 00011111
	end
	else if ((data_in >= -746079173) && (data_in < -732566641)) begin
		data_out <= 00100000
	end
	else if ((data_in >= -732566641) && (data_in < -719398485)) begin
		data_out <= 00100001
	end
	else if ((data_in >= -719398485) && (data_in < -706554224)) begin
		data_out <= 00100010
	end
	else if ((data_in >= -706554224) && (data_in < -694015104)) begin
		data_out <= 00100011
	end
	else if ((data_in >= -694015104) && (data_in < -681763904)) begin
		data_out <= 00100100
	end
	else if ((data_in >= -681763904) && (data_in < -669784775)) begin
		data_out <= 00100101
	end
	else if ((data_in >= -669784775) && (data_in < -658063096)) begin
		data_out <= 00100110
	end
	else if ((data_in >= -658063096) && (data_in < -646585348)) begin
		data_out <= 00100111
	end
	else if ((data_in >= -646585348) && (data_in < -635339010)) begin
		data_out <= 00101000
	end
	else if ((data_in >= -635339010) && (data_in < -624312458)) begin
		data_out <= 00101001
	end
	else if ((data_in >= -624312458) && (data_in < -613494881)) begin
		data_out <= 00101010
	end
	else if ((data_in >= -613494881) && (data_in < -602876208)) begin
		data_out <= 00101011
	end
	else if ((data_in >= -602876208) && (data_in < -592447042)) begin
		data_out <= 00101100
	end
	else if ((data_in >= -592447042) && (data_in < -582198596)) begin
		data_out <= 00101101
	end
	else if ((data_in >= -582198596) && (data_in < -572122646)) begin
		data_out <= 00101110
	end
	else if ((data_in >= -572122646) && (data_in < -562211479)) begin
		data_out <= 00101111
	end
	else if ((data_in >= -562211479) && (data_in < -552457856)) begin
		data_out <= 00110000
	end
	else if ((data_in >= -552457856) && (data_in < -542854967)) begin
		data_out <= 00110001
	end
	else if ((data_in >= -542854967) && (data_in < -533396401)) begin
		data_out <= 00110010
	end
	else if ((data_in >= -533396401) && (data_in < -524076114)) begin
		data_out <= 00110011
	end
	else if ((data_in >= -524076114) && (data_in < -514888403)) begin
		data_out <= 00110100
	end
	else if ((data_in >= -514888403) && (data_in < -505827876)) begin
		data_out <= 00110101
	end
	else if ((data_in >= -505827876) && (data_in < -496889433)) begin
		data_out <= 00110110
	end
	else if ((data_in >= -496889433) && (data_in < -488068241)) begin
		data_out <= 00110111
	end
	else if ((data_in >= -488068241) && (data_in < -479359720)) begin
		data_out <= 00111000
	end
	else if ((data_in >= -479359720) && (data_in < -470759522)) begin
		data_out <= 00111001
	end
	else if ((data_in >= -470759522) && (data_in < -462263513)) begin
		data_out <= 00111010
	end
	else if ((data_in >= -462263513) && (data_in < -453867763)) begin
		data_out <= 00111011
	end
	else if ((data_in >= -453867763) && (data_in < -445568532)) begin
		data_out <= 00111100
	end
	else if ((data_in >= -445568532) && (data_in < -437362252)) begin
		data_out <= 00111101
	end
	else if ((data_in >= -437362252) && (data_in < -429245524)) begin
		data_out <= 00111110
	end
	else if ((data_in >= -429245524) && (data_in < -421215099)) begin
		data_out <= 00111111
	end
	else if ((data_in >= -421215099) && (data_in < -413267876)) begin
		data_out <= 01000000
	end
	else if ((data_in >= -413267876) && (data_in < -405400887)) begin
		data_out <= 01000001
	end
	else if ((data_in >= -405400887) && (data_in < -397611292)) begin
		data_out <= 01000010
	end
	else if ((data_in >= -397611292) && (data_in < -389896371)) begin
		data_out <= 01000011
	end
	else if ((data_in >= -389896371) && (data_in < -382253515)) begin
		data_out <= 01000100
	end
	else if ((data_in >= -382253515) && (data_in < -374680223)) begin
		data_out <= 01000101
	end
	else if ((data_in >= -374680223) && (data_in < -367174092)) begin
		data_out <= 01000110
	end
	else if ((data_in >= -367174092) && (data_in < -359732813)) begin
		data_out <= 01000111
	end
	else if ((data_in >= -359732813) && (data_in < -352354166)) begin
		data_out <= 01001000
	end
	else if ((data_in >= -352354166) && (data_in < -345036014)) begin
		data_out <= 01001001
	end
	else if ((data_in >= -345036014) && (data_in < -337776301)) begin
		data_out <= 01001010
	end
	else if ((data_in >= -337776301) && (data_in < -330573042)) begin
		data_out <= 01001011
	end
	else if ((data_in >= -330573042) && (data_in < -323424327)) begin
		data_out <= 01001100
	end
	else if ((data_in >= -323424327) && (data_in < -316328309)) begin
		data_out <= 01001101
	end
	else if ((data_in >= -316328309) && (data_in < -309283205)) begin
		data_out <= 01001110
	end
	else if ((data_in >= -309283205) && (data_in < -302287295)) begin
		data_out <= 01001111
	end
	else if ((data_in >= -302287295) && (data_in < -295338911)) begin
		data_out <= 01010000
	end
	else if ((data_in >= -295338911) && (data_in < -288436442)) begin
		data_out <= 01010001
	end
	else if ((data_in >= -288436442) && (data_in < -281578327)) begin
		data_out <= 01010010
	end
	else if ((data_in >= -281578327) && (data_in < -274763053)) begin
		data_out <= 01010011
	end
	else if ((data_in >= -274763053) && (data_in < -267989155)) begin
		data_out <= 01010100
	end
	else if ((data_in >= -267989155) && (data_in < -261255208)) begin
		data_out <= 01010101
	end
	else if ((data_in >= -261255208) && (data_in < -254559831)) begin
		data_out <= 01010110
	end
	else if ((data_in >= -254559831) && (data_in < -247901681)) begin
		data_out <= 01010111
	end
	else if ((data_in >= -247901681) && (data_in < -241279454)) begin
		data_out <= 01011000
	end
	else if ((data_in >= -241279454) && (data_in < -234691881)) begin
		data_out <= 01011001
	end
	else if ((data_in >= -234691881) && (data_in < -228137724)) begin
		data_out <= 01011010
	end
	else if ((data_in >= -228137724) && (data_in < -221615781)) begin
		data_out <= 01011011
	end
	else if ((data_in >= -221615781) && (data_in < -215124878)) begin
		data_out <= 01011100
	end
	else if ((data_in >= -215124878) && (data_in < -208663871)) begin
		data_out <= 01011101
	end
	else if ((data_in >= -208663871) && (data_in < -202231642)) begin
		data_out <= 01011110
	end
	else if ((data_in >= -202231642) && (data_in < -195827101)) begin
		data_out <= 01011111
	end
	else if ((data_in >= -195827101) && (data_in < -189449183)) begin
		data_out <= 01100000
	end
	else if ((data_in >= -189449183) && (data_in < -183096843)) begin
		data_out <= 01100001
	end
	else if ((data_in >= -183096843) && (data_in < -176769063)) begin
		data_out <= 01100010
	end
	else if ((data_in >= -176769063) && (data_in < -170464844)) begin
		data_out <= 01100011
	end
	else if ((data_in >= -170464844) && (data_in < -164183207)) begin
		data_out <= 01100100
	end
	else if ((data_in >= -164183207) && (data_in < -157923193)) begin
		data_out <= 01100101
	end
	else if ((data_in >= -157923193) && (data_in < -151683860)) begin
		data_out <= 01100110
	end
	else if ((data_in >= -151683860) && (data_in < -145464284)) begin
		data_out <= 01100111
	end
	else if ((data_in >= -145464284) && (data_in < -139263557)) begin
		data_out <= 01101000
	end
	else if ((data_in >= -139263557) && (data_in < -133080787)) begin
		data_out <= 01101001
	end
	else if ((data_in >= -133080787) && (data_in < -126915095)) begin
		data_out <= 01101010
	end
	else if ((data_in >= -126915095) && (data_in < -120765618)) begin
		data_out <= 01101011
	end
	else if ((data_in >= -120765618) && (data_in < -114631502)) begin
		data_out <= 01101100
	end
	else if ((data_in >= -114631502) && (data_in < -108511910)) begin
		data_out <= 01101101
	end
	else if ((data_in >= -108511910) && (data_in < -102406012)) begin
		data_out <= 01101110
	end
	else if ((data_in >= -102406012) && (data_in < -96312993)) begin
		data_out <= 01101111
	end
	else if ((data_in >= -96312993) && (data_in < -90232043)) begin
		data_out <= 01110000
	end
	else if ((data_in >= -90232043) && (data_in < -84162365)) begin
		data_out <= 01110001
	end
	else if ((data_in >= -84162365) && (data_in < -78103169)) begin
		data_out <= 01110010
	end
	else if ((data_in >= -78103169) && (data_in < -72053674)) begin
		data_out <= 01110011
	end
	else if ((data_in >= -72053674) && (data_in < -66013105)) begin
		data_out <= 01110100
	end
	else if ((data_in >= -66013105) && (data_in < -59980695)) begin
		data_out <= 01110101
	end
	else if ((data_in >= -59980695) && (data_in < -53955683)) begin
		data_out <= 01110110
	end
	else if ((data_in >= -53955683) && (data_in < -47937311)) begin
		data_out <= 01110111
	end
	else if ((data_in >= -47937311) && (data_in < -41924830)) begin
		data_out <= 01111000
	end
	else if ((data_in >= -41924830) && (data_in < -35917493)) begin
		data_out <= 01111001
	end
	else if ((data_in >= -35917493) && (data_in < -29914556)) begin
		data_out <= 01111010
	end
	else if ((data_in >= -29914556) && (data_in < -23915281)) begin
		data_out <= 01111011
	end
	else if ((data_in >= -23915281) && (data_in < -17918930)) begin
		data_out <= 01111100
	end
	else if ((data_in >= -17918930) && (data_in < -11924768)) begin
		data_out <= 01111101
	end
	else if ((data_in >= -11924768) && (data_in < -5932063)) begin
		data_out <= 01111110
	end
	else if ((data_in >= -5932063) && (data_in < 59919)) begin
		data_out <= 01111111
	end
	else if ((data_in >= 59919) && (data_in < 6051907)) begin
		data_out <= 10000000
	end
	else if ((data_in >= 6051907) && (data_in < 12044634)) begin
		data_out <= 10000001
	end
	else if ((data_in >= 12044634) && (data_in < 18038833)) begin
		data_out <= 10000010
	end
	else if ((data_in >= 18038833) && (data_in < 24035235)) begin
		data_out <= 10000011
	end
	else if ((data_in >= 24035235) && (data_in < 30034577)) begin
		data_out <= 10000100
	end
	else if ((data_in >= 30034577) && (data_in < 36037594)) begin
		data_out <= 10000101
	end
	else if ((data_in >= 36037594) && (data_in < 42045027)) begin
		data_out <= 10000110
	end
	else if ((data_in >= 42045027) && (data_in < 48057619)) begin
		data_out <= 10000111
	end
	else if ((data_in >= 48057619) && (data_in < 54076115)) begin
		data_out <= 10001000
	end
	else if ((data_in >= 54076115) && (data_in < 60101269)) begin
		data_out <= 10001001
	end
	else if ((data_in >= 60101269) && (data_in < 66133834)) begin
		data_out <= 10001010
	end
	else if ((data_in >= 66133834) && (data_in < 72174574)) begin
		data_out <= 10001011
	end
	else if ((data_in >= 72174574) && (data_in < 78224255)) begin
		data_out <= 10001100
	end
	else if ((data_in >= 78224255) && (data_in < 84283653)) begin
		data_out <= 10001101
	end
	else if ((data_in >= 84283653) && (data_in < 90353549)) begin
		data_out <= 10001110
	end
	else if ((data_in >= 90353549) && (data_in < 96434732)) begin
		data_out <= 10001111
	end
	else if ((data_in >= 96434732) && (data_in < 102528001)) begin
		data_out <= 10010000
	end
	else if ((data_in >= 102528001) && (data_in < 108634165)) begin
		data_out <= 10010001
	end
	else if ((data_in >= 108634165) && (data_in < 114754039)) begin
		data_out <= 10010010
	end
	else if ((data_in >= 114754039) && (data_in < 120888454)) begin
		data_out <= 10010011
	end
	else if ((data_in >= 120888454) && (data_in < 127038247)) begin
		data_out <= 10010100
	end
	else if ((data_in >= 127038247) && (data_in < 133204272)) begin
		data_out <= 10010101
	end
	else if ((data_in >= 133204272) && (data_in < 139387393)) begin
		data_out <= 10010110
	end
	else if ((data_in >= 139387393) && (data_in < 145588488)) begin
		data_out <= 10010111
	end
	else if ((data_in >= 145588488) && (data_in < 151808450)) begin
		data_out <= 10011000
	end
	else if ((data_in >= 151808450) && (data_in < 158048188)) begin
		data_out <= 10011001
	end
	else if ((data_in >= 158048188) && (data_in < 164308625)) begin
		data_out <= 10011010
	end
	else if ((data_in >= 164308625) && (data_in < 170590704)) begin
		data_out <= 10011011
	end
	else if ((data_in >= 170590704) && (data_in < 176895385)) begin
		data_out <= 10011100
	end
	else if ((data_in >= 176895385) && (data_in < 183223646)) begin
		data_out <= 10011101
	end
	else if ((data_in >= 183223646) && (data_in < 189576487)) begin
		data_out <= 10011110
	end
	else if ((data_in >= 189576487) && (data_in < 195954928)) begin
		data_out <= 10011111
	end
	else if ((data_in >= 195954928) && (data_in < 202360012)) begin
		data_out <= 10100000
	end
	else if ((data_in >= 202360012) && (data_in < 208792805)) begin
		data_out <= 10100001
	end
	else if ((data_in >= 208792805) && (data_in < 215254399)) begin
		data_out <= 10100010
	end
	else if ((data_in >= 215254399) && (data_in < 221745912)) begin
		data_out <= 10100011
	end
	else if ((data_in >= 221745912) && (data_in < 228268488)) begin
		data_out <= 10100100
	end
	else if ((data_in >= 228268488) && (data_in < 234823301)) begin
		data_out <= 10100101
	end
	else if ((data_in >= 234823301) && (data_in < 241411555)) begin
		data_out <= 10100110
	end
	else if ((data_in >= 241411555) && (data_in < 248034488)) begin
		data_out <= 10100111
	end
	else if ((data_in >= 248034488) && (data_in < 254693369)) begin
		data_out <= 10101000
	end
	else if ((data_in >= 254693369) && (data_in < 261389504)) begin
		data_out <= 10101001
	end
	else if ((data_in >= 261389504) && (data_in < 268124236)) begin
		data_out <= 10101010
	end
	else if ((data_in >= 268124236) && (data_in < 274898949)) begin
		data_out <= 10101011
	end
	else if ((data_in >= 274898949) && (data_in < 281715064)) begin
		data_out <= 10101100
	end
	else if ((data_in >= 281715064) && (data_in < 288574052)) begin
		data_out <= 10101101
	end
	else if ((data_in >= 288574052) && (data_in < 295477423)) begin
		data_out <= 10101110
	end
	else if ((data_in >= 295477423) && (data_in < 302426742)) begin
		data_out <= 10101111
	end
	else if ((data_in >= 302426742) && (data_in < 309423620)) begin
		data_out <= 10110000
	end
	else if ((data_in >= 309423620) && (data_in < 316469724)) begin
		data_out <= 10110001
	end
	else if ((data_in >= 316469724) && (data_in < 323566779)) begin
		data_out <= 10110010
	end
	else if ((data_in >= 323566779) && (data_in < 330716567)) begin
		data_out <= 10110011
	end
	else if ((data_in >= 330716567) && (data_in < 337920935)) begin
		data_out <= 10110100
	end
	else if ((data_in >= 337920935) && (data_in < 345181798)) begin
		data_out <= 10110101
	end
	else if ((data_in >= 345181798) && (data_in < 352501139)) begin
		data_out <= 10110110
	end
	else if ((data_in >= 352501139) && (data_in < 359881017)) begin
		data_out <= 10110111
	end
	else if ((data_in >= 359881017) && (data_in < 367323571)) begin
		data_out <= 10111000
	end
	else if ((data_in >= 367323571) && (data_in < 374831023)) begin
		data_out <= 10111001
	end
	else if ((data_in >= 374831023) && (data_in < 382405682)) begin
		data_out <= 10111010
	end
	else if ((data_in >= 382405682) && (data_in < 390049954)) begin
		data_out <= 10111011
	end
	else if ((data_in >= 390049954) && (data_in < 397766343)) begin
		data_out <= 10111100
	end
	else if ((data_in >= 397766343) && (data_in < 405557459)) begin
		data_out <= 10111101
	end
	else if ((data_in >= 405557459) && (data_in < 413426025)) begin
		data_out <= 10111110
	end
	else if ((data_in >= 413426025) && (data_in < 421374882)) begin
		data_out <= 10111111
	end
	else if ((data_in >= 421374882) && (data_in < 429407002)) begin
		data_out <= 11000000
	end
	else if ((data_in >= 429407002) && (data_in < 437525489)) begin
		data_out <= 11000001
	end
	else if ((data_in >= 437525489) && (data_in < 445733594)) begin
		data_out <= 11000010
	end
	else if ((data_in >= 445733594) && (data_in < 454034720)) begin
		data_out <= 11000011
	end
	else if ((data_in >= 454034720) && (data_in < 462432437)) begin
		data_out <= 11000100
	end
	else if ((data_in >= 462432437) && (data_in < 470930491)) begin
		data_out <= 11000101
	end
	else if ((data_in >= 470930491) && (data_in < 479532815)) begin
		data_out <= 11000110
	end
	else if ((data_in >= 479532815) && (data_in < 488243546)) begin
		data_out <= 11000111
	end
	else if ((data_in >= 488243546) && (data_in < 497067037)) begin
		data_out <= 11001000
	end
	else if ((data_in >= 497067037) && (data_in < 506007874)) begin
		data_out <= 11001001
	end
	else if ((data_in >= 506007874) && (data_in < 515070894)) begin
		data_out <= 11001010
	end
	else if ((data_in >= 515070894) && (data_in < 524261202)) begin
		data_out <= 11001011
	end
	else if ((data_in >= 524261202) && (data_in < 533584197)) begin
		data_out <= 11001100
	end
	else if ((data_in >= 533584197) && (data_in < 543045589)) begin
		data_out <= 11001101
	end
	else if ((data_in >= 543045589) && (data_in < 552651429)) begin
		data_out <= 11001110
	end
	else if ((data_in >= 552651429) && (data_in < 562408135)) begin
		data_out <= 11001111
	end
	else if ((data_in >= 562408135) && (data_in < 572322525)) begin
		data_out <= 11010000
	end
	else if ((data_in >= 572322525) && (data_in < 582401848)) begin
		data_out <= 11010001
	end
	else if ((data_in >= 582401848) && (data_in < 592653826)) begin
		data_out <= 11010010
	end
	else if ((data_in >= 592653826) && (data_in < 603086694)) begin
		data_out <= 11010011
	end
	else if ((data_in >= 603086694) && (data_in < 613709251)) begin
		data_out <= 11010100
	end
	else if ((data_in >= 613709251) && (data_in < 624530906)) begin
		data_out <= 11010101
	end
	else if ((data_in >= 624530906) && (data_in < 635561746)) begin
		data_out <= 11010110
	end
	else if ((data_in >= 635561746) && (data_in < 646812595)) begin
		data_out <= 11010111
	end
	else if ((data_in >= 646812595) && (data_in < 658295095)) begin
		data_out <= 11011000
	end
	else if ((data_in >= 658295095) && (data_in < 670021788)) begin
		data_out <= 11011001
	end
	else if ((data_in >= 670021788) && (data_in < 682006211)) begin
		data_out <= 11011010
	end
	else if ((data_in >= 682006211) && (data_in < 694263010)) begin
		data_out <= 11011011
	end
	else if ((data_in >= 694263010) && (data_in < 706808059)) begin
		data_out <= 11011100
	end
	else if ((data_in >= 706808059) && (data_in < 719658608)) begin
		data_out <= 11011101
	end
	else if ((data_in >= 719658608) && (data_in < 732833446)) begin
		data_out <= 11011110
	end
	else if ((data_in >= 732833446) && (data_in < 746353087)) begin
		data_out <= 11011111
	end
	else if ((data_in >= 746353087) && (data_in < 760239995)) begin
		data_out <= 11100000
	end
	else if ((data_in >= 760239995) && (data_in < 774518836)) begin
		data_out <= 11100001
	end
	else if ((data_in >= 774518836) && (data_in < 789216779)) begin
		data_out <= 11100010
	end
	else if ((data_in >= 789216779) && (data_in < 804363847)) begin
		data_out <= 11100011
	end
	else if ((data_in >= 804363847) && (data_in < 819993332)) begin
		data_out <= 11100100
	end
	else if ((data_in >= 819993332) && (data_in < 836142292)) begin
		data_out <= 11100101
	end
	else if ((data_in >= 836142292) && (data_in < 852852137)) begin
		data_out <= 11100110
	end
	else if ((data_in >= 852852137) && (data_in < 870169347)) begin
		data_out <= 11100111
	end
	else if ((data_in >= 870169347) && (data_in < 888146329)) begin
		data_out <= 11101000
	end
	else if ((data_in >= 888146329) && (data_in < 906842480)) begin
		data_out <= 11101001
	end
	else if ((data_in >= 906842480) && (data_in < 926325482)) begin
		data_out <= 11101010
	end
	else if ((data_in >= 926325482) && (data_in < 946672927)) begin
		data_out <= 11101011
	end
	else if ((data_in >= 946672927) && (data_in < 967974346)) begin
		data_out <= 11101100
	end
	else if ((data_in >= 967974346) && (data_in < 990333805)) begin
		data_out <= 11101101
	end
	else if ((data_in >= 990333805) && (data_in < 1013873223)) begin
		data_out <= 11101110
	end
	else if ((data_in >= 1013873223) && (data_in < 1038736714)) begin
		data_out <= 11101111
	end
	else if ((data_in >= 1038736714) && (data_in < 1065096329)) begin
		data_out <= 11110000
	end
	else if ((data_in >= 1065096329) && (data_in < 1093159777)) begin
		data_out <= 11110001
	end
	else if ((data_in >= 1093159777) && (data_in < 1123181025)) begin
		data_out <= 11110010
	end
	else if ((data_in >= 1123181025) && (data_in < 1155475143)) begin
		data_out <= 11110011
	end
	else if ((data_in >= 1155475143) && (data_in < 1190439636)) begin
		data_out <= 11110100
	end
	else if ((data_in >= 1190439636) && (data_in < 1228585976)) begin
		data_out <= 11110101
	end
	else if ((data_in >= 1228585976) && (data_in < 1270587834)) begin
		data_out <= 11110110
	end
	else if ((data_in >= 1270587834) && (data_in < 1317357856)) begin
		data_out <= 11110111
	end
	else if ((data_in >= 1317357856) && (data_in < 1370176057)) begin
		data_out <= 11111000
	end
	else if ((data_in >= 1370176057) && (data_in < 1430918017)) begin
		data_out <= 11111001
	end
	else if ((data_in >= 1430918017) && (data_in < 1502493403)) begin
		data_out <= 11111010
	end
	else if ((data_in >= 1502493403) && (data_in < 1589781201)) begin
		data_out <= 11111011
	end
	else if ((data_in >= 1589781201) && (data_in < 1701940470)) begin
		data_out <= 11111100
	end
	else if ((data_in >= 1701940470) && (data_in < 1859582402)) begin
		data_out <= 11111101
	end
	else if ((data_in >= 1859582402) && (data_in < 2128828571)) begin
		data_out <= 11111110
	end
	else begin
        data_out <= 11111111;
    end
end
endmodule

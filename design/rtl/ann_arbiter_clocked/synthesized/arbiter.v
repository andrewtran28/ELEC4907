
module allocation_buffer_0 ( clk, rst, data_in, data_out, full, empty, rd_ptr, 
        wr_en, rd_en );
  input [19:0] data_in;
  output [19:0] data_out;
  input [2:0] rd_ptr;
  input clk, rst, wr_en, rd_en;
  output full, empty;
  wire   N14, \buffer[7][7] , \buffer[7][6] , \buffer[7][5] , \buffer[7][4] ,
         \buffer[7][3] , \buffer[7][2] , \buffer[7][1] , \buffer[7][0] ,
         \buffer[6][7] , \buffer[6][6] , \buffer[6][5] , \buffer[6][4] ,
         \buffer[6][3] , \buffer[6][2] , \buffer[6][1] , \buffer[6][0] ,
         \buffer[5][7] , \buffer[5][6] , \buffer[5][5] , \buffer[5][4] ,
         \buffer[5][3] , \buffer[5][2] , \buffer[5][1] , \buffer[5][0] ,
         \buffer[4][7] , \buffer[4][6] , \buffer[4][5] , \buffer[4][4] ,
         \buffer[4][3] , \buffer[4][2] , \buffer[4][1] , \buffer[4][0] ,
         \buffer[3][7] , \buffer[3][6] , \buffer[3][5] , \buffer[3][4] ,
         \buffer[3][3] , \buffer[3][2] , \buffer[3][1] , \buffer[3][0] ,
         \buffer[2][7] , \buffer[2][6] , \buffer[2][5] , \buffer[2][4] ,
         \buffer[2][3] , \buffer[2][2] , \buffer[2][1] , \buffer[2][0] ,
         \buffer[1][7] , \buffer[1][6] , \buffer[1][5] , \buffer[1][4] ,
         \buffer[1][3] , \buffer[1][2] , \buffer[1][1] , \buffer[1][0] ,
         \buffer[0][7] , \buffer[0][6] , \buffer[0][5] , \buffer[0][4] ,
         \buffer[0][3] , \buffer[0][2] , \buffer[0][1] , \buffer[0][0] , N101,
         N102, N103, N104, N105, N106, N107, N108, N109, N110, N111, N112,
         N113, N114, N115, N116, N117, N118, N119, N120, N121, N122, N124,
         N125, N127, N128, N129, N130, N131, N132, N133, N134, N135, N136,
         N137, n312, n314, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12,
         n13, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26,
         n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40,
         n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53, n54,
         n55, n56, n57, n58, n59, n60, n61, n62, n63, n64, n65, n66, n67, n68,
         n69, n70, n71, n72, n73, n74, n75, n76, n77, n78, n79;
  wire   [2:0] wr_ptr;
  wire   [2:0] count;
  assign full = N14;

  EDFQD1 \data_out_reg[19]  ( .D(N121), .E(N101), .CP(clk), .Q(data_out[19])
         );
  EDFQD1 \data_out_reg[18]  ( .D(N120), .E(N101), .CP(clk), .Q(data_out[18])
         );
  EDFQD1 \data_out_reg[17]  ( .D(N119), .E(N101), .CP(clk), .Q(data_out[17])
         );
  EDFQD1 \data_out_reg[16]  ( .D(N118), .E(N101), .CP(clk), .Q(data_out[16])
         );
  EDFQD1 \data_out_reg[15]  ( .D(N117), .E(N101), .CP(clk), .Q(data_out[15])
         );
  EDFQD1 \data_out_reg[14]  ( .D(N116), .E(N101), .CP(clk), .Q(data_out[14])
         );
  EDFQD1 \data_out_reg[13]  ( .D(N115), .E(N101), .CP(clk), .Q(data_out[13])
         );
  EDFQD1 \data_out_reg[12]  ( .D(N114), .E(N101), .CP(clk), .Q(data_out[12])
         );
  EDFQD1 \data_out_reg[11]  ( .D(N113), .E(N101), .CP(clk), .Q(data_out[11])
         );
  EDFQD1 \data_out_reg[10]  ( .D(N112), .E(N101), .CP(clk), .Q(data_out[10])
         );
  EDFQD1 \data_out_reg[9]  ( .D(N111), .E(N101), .CP(clk), .Q(data_out[9]) );
  EDFQD1 \data_out_reg[8]  ( .D(N110), .E(N101), .CP(clk), .Q(data_out[8]) );
  EDFQD1 \data_out_reg[7]  ( .D(N109), .E(N101), .CP(clk), .Q(data_out[7]) );
  EDFQD1 \data_out_reg[6]  ( .D(N108), .E(N101), .CP(clk), .Q(data_out[6]) );
  EDFQD1 \data_out_reg[5]  ( .D(N107), .E(N101), .CP(clk), .Q(data_out[5]) );
  EDFQD1 \data_out_reg[4]  ( .D(N106), .E(N101), .CP(clk), .Q(data_out[4]) );
  EDFQD1 \data_out_reg[3]  ( .D(N105), .E(N101), .CP(clk), .Q(data_out[3]) );
  EDFQD1 \data_out_reg[2]  ( .D(N104), .E(N101), .CP(clk), .Q(data_out[2]) );
  EDFQD1 \data_out_reg[1]  ( .D(N103), .E(N101), .CP(clk), .Q(data_out[1]) );
  EDFQD1 \data_out_reg[0]  ( .D(N102), .E(N101), .CP(clk), .Q(data_out[0]) );
  EDFQD1 \buffer_reg[7][7]  ( .D(data_in[7]), .E(N137), .CP(clk), .Q(
        \buffer[7][7] ) );
  EDFQD1 \buffer_reg[7][6]  ( .D(data_in[6]), .E(N137), .CP(clk), .Q(
        \buffer[7][6] ) );
  EDFQD1 \buffer_reg[7][5]  ( .D(data_in[5]), .E(N137), .CP(clk), .Q(
        \buffer[7][5] ) );
  EDFQD1 \buffer_reg[7][4]  ( .D(data_in[4]), .E(N137), .CP(clk), .Q(
        \buffer[7][4] ) );
  EDFQD1 \buffer_reg[7][3]  ( .D(data_in[3]), .E(N137), .CP(clk), .Q(
        \buffer[7][3] ) );
  EDFQD1 \buffer_reg[7][2]  ( .D(data_in[2]), .E(N137), .CP(clk), .Q(
        \buffer[7][2] ) );
  EDFQD1 \buffer_reg[7][1]  ( .D(data_in[1]), .E(N137), .CP(clk), .Q(
        \buffer[7][1] ) );
  EDFQD1 \buffer_reg[7][0]  ( .D(data_in[0]), .E(N137), .CP(clk), .Q(
        \buffer[7][0] ) );
  EDFQD1 \buffer_reg[5][7]  ( .D(data_in[7]), .E(N135), .CP(clk), .Q(
        \buffer[5][7] ) );
  EDFQD1 \buffer_reg[5][6]  ( .D(data_in[6]), .E(N135), .CP(clk), .Q(
        \buffer[5][6] ) );
  EDFQD1 \buffer_reg[5][5]  ( .D(data_in[5]), .E(N135), .CP(clk), .Q(
        \buffer[5][5] ) );
  EDFQD1 \buffer_reg[5][4]  ( .D(data_in[4]), .E(N135), .CP(clk), .Q(
        \buffer[5][4] ) );
  EDFQD1 \buffer_reg[5][3]  ( .D(data_in[3]), .E(N135), .CP(clk), .Q(
        \buffer[5][3] ) );
  EDFQD1 \buffer_reg[5][2]  ( .D(data_in[2]), .E(N135), .CP(clk), .Q(
        \buffer[5][2] ) );
  EDFQD1 \buffer_reg[5][1]  ( .D(data_in[1]), .E(N135), .CP(clk), .Q(
        \buffer[5][1] ) );
  EDFQD1 \buffer_reg[5][0]  ( .D(data_in[0]), .E(N135), .CP(clk), .Q(
        \buffer[5][0] ) );
  EDFQD1 \buffer_reg[3][7]  ( .D(data_in[7]), .E(N133), .CP(clk), .Q(
        \buffer[3][7] ) );
  EDFQD1 \buffer_reg[3][6]  ( .D(data_in[6]), .E(N133), .CP(clk), .Q(
        \buffer[3][6] ) );
  EDFQD1 \buffer_reg[3][5]  ( .D(data_in[5]), .E(N133), .CP(clk), .Q(
        \buffer[3][5] ) );
  EDFQD1 \buffer_reg[3][4]  ( .D(data_in[4]), .E(N133), .CP(clk), .Q(
        \buffer[3][4] ) );
  EDFQD1 \buffer_reg[3][3]  ( .D(data_in[3]), .E(N133), .CP(clk), .Q(
        \buffer[3][3] ) );
  EDFQD1 \buffer_reg[3][2]  ( .D(data_in[2]), .E(N133), .CP(clk), .Q(
        \buffer[3][2] ) );
  EDFQD1 \buffer_reg[3][1]  ( .D(data_in[1]), .E(N133), .CP(clk), .Q(
        \buffer[3][1] ) );
  EDFQD1 \buffer_reg[3][0]  ( .D(data_in[0]), .E(N133), .CP(clk), .Q(
        \buffer[3][0] ) );
  EDFQD1 \buffer_reg[1][7]  ( .D(data_in[7]), .E(N131), .CP(clk), .Q(
        \buffer[1][7] ) );
  EDFQD1 \buffer_reg[1][6]  ( .D(data_in[6]), .E(N131), .CP(clk), .Q(
        \buffer[1][6] ) );
  EDFQD1 \buffer_reg[1][5]  ( .D(data_in[5]), .E(N131), .CP(clk), .Q(
        \buffer[1][5] ) );
  EDFQD1 \buffer_reg[1][4]  ( .D(data_in[4]), .E(N131), .CP(clk), .Q(
        \buffer[1][4] ) );
  EDFQD1 \buffer_reg[1][3]  ( .D(data_in[3]), .E(N131), .CP(clk), .Q(
        \buffer[1][3] ) );
  EDFQD1 \buffer_reg[1][2]  ( .D(data_in[2]), .E(N131), .CP(clk), .Q(
        \buffer[1][2] ) );
  EDFQD1 \buffer_reg[1][1]  ( .D(data_in[1]), .E(N131), .CP(clk), .Q(
        \buffer[1][1] ) );
  EDFQD1 \buffer_reg[1][0]  ( .D(data_in[0]), .E(N131), .CP(clk), .Q(
        \buffer[1][0] ) );
  EDFQD1 \buffer_reg[6][7]  ( .D(data_in[7]), .E(N136), .CP(clk), .Q(
        \buffer[6][7] ) );
  EDFQD1 \buffer_reg[6][6]  ( .D(data_in[6]), .E(N136), .CP(clk), .Q(
        \buffer[6][6] ) );
  EDFQD1 \buffer_reg[6][5]  ( .D(data_in[5]), .E(N136), .CP(clk), .Q(
        \buffer[6][5] ) );
  EDFQD1 \buffer_reg[6][4]  ( .D(data_in[4]), .E(N136), .CP(clk), .Q(
        \buffer[6][4] ) );
  EDFQD1 \buffer_reg[6][3]  ( .D(data_in[3]), .E(N136), .CP(clk), .Q(
        \buffer[6][3] ) );
  EDFQD1 \buffer_reg[6][2]  ( .D(data_in[2]), .E(N136), .CP(clk), .Q(
        \buffer[6][2] ) );
  EDFQD1 \buffer_reg[6][1]  ( .D(data_in[1]), .E(N136), .CP(clk), .Q(
        \buffer[6][1] ) );
  EDFQD1 \buffer_reg[6][0]  ( .D(data_in[0]), .E(N136), .CP(clk), .Q(
        \buffer[6][0] ) );
  EDFQD1 \buffer_reg[4][7]  ( .D(data_in[7]), .E(N134), .CP(clk), .Q(
        \buffer[4][7] ) );
  EDFQD1 \buffer_reg[4][6]  ( .D(data_in[6]), .E(N134), .CP(clk), .Q(
        \buffer[4][6] ) );
  EDFQD1 \buffer_reg[4][5]  ( .D(data_in[5]), .E(N134), .CP(clk), .Q(
        \buffer[4][5] ) );
  EDFQD1 \buffer_reg[4][4]  ( .D(data_in[4]), .E(N134), .CP(clk), .Q(
        \buffer[4][4] ) );
  EDFQD1 \buffer_reg[4][3]  ( .D(data_in[3]), .E(N134), .CP(clk), .Q(
        \buffer[4][3] ) );
  EDFQD1 \buffer_reg[4][2]  ( .D(data_in[2]), .E(N134), .CP(clk), .Q(
        \buffer[4][2] ) );
  EDFQD1 \buffer_reg[4][1]  ( .D(data_in[1]), .E(N134), .CP(clk), .Q(
        \buffer[4][1] ) );
  EDFQD1 \buffer_reg[4][0]  ( .D(data_in[0]), .E(N134), .CP(clk), .Q(
        \buffer[4][0] ) );
  EDFQD1 \buffer_reg[2][7]  ( .D(data_in[7]), .E(N132), .CP(clk), .Q(
        \buffer[2][7] ) );
  EDFQD1 \buffer_reg[2][6]  ( .D(data_in[6]), .E(N132), .CP(clk), .Q(
        \buffer[2][6] ) );
  EDFQD1 \buffer_reg[2][5]  ( .D(data_in[5]), .E(N132), .CP(clk), .Q(
        \buffer[2][5] ) );
  EDFQD1 \buffer_reg[2][4]  ( .D(data_in[4]), .E(N132), .CP(clk), .Q(
        \buffer[2][4] ) );
  EDFQD1 \buffer_reg[2][3]  ( .D(data_in[3]), .E(N132), .CP(clk), .Q(
        \buffer[2][3] ) );
  EDFQD1 \buffer_reg[2][2]  ( .D(data_in[2]), .E(N132), .CP(clk), .Q(
        \buffer[2][2] ) );
  EDFQD1 \buffer_reg[2][1]  ( .D(data_in[1]), .E(N132), .CP(clk), .Q(
        \buffer[2][1] ) );
  EDFQD1 \buffer_reg[2][0]  ( .D(data_in[0]), .E(N132), .CP(clk), .Q(
        \buffer[2][0] ) );
  EDFQD1 \buffer_reg[0][7]  ( .D(data_in[7]), .E(N130), .CP(clk), .Q(
        \buffer[0][7] ) );
  EDFQD1 \buffer_reg[0][6]  ( .D(data_in[6]), .E(N130), .CP(clk), .Q(
        \buffer[0][6] ) );
  EDFQD1 \buffer_reg[0][5]  ( .D(data_in[5]), .E(N130), .CP(clk), .Q(
        \buffer[0][5] ) );
  EDFQD1 \buffer_reg[0][4]  ( .D(data_in[4]), .E(N130), .CP(clk), .Q(
        \buffer[0][4] ) );
  EDFQD1 \buffer_reg[0][3]  ( .D(data_in[3]), .E(N130), .CP(clk), .Q(
        \buffer[0][3] ) );
  EDFQD1 \buffer_reg[0][2]  ( .D(data_in[2]), .E(N130), .CP(clk), .Q(
        \buffer[0][2] ) );
  EDFQD1 \buffer_reg[0][1]  ( .D(data_in[1]), .E(N130), .CP(clk), .Q(
        \buffer[0][1] ) );
  EDFQD1 \buffer_reg[0][0]  ( .D(data_in[0]), .E(N130), .CP(clk), .Q(
        \buffer[0][0] ) );
  EDFQD1 \wr_ptr_reg[0]  ( .D(n312), .E(N122), .CP(clk), .Q(wr_ptr[0]) );
  EDFQD1 \count_reg[0]  ( .D(n314), .E(N129), .CP(clk), .Q(count[0]) );
  EDFQD1 \wr_ptr_reg[2]  ( .D(N125), .E(N122), .CP(clk), .Q(wr_ptr[2]) );
  EDFQD1 \count_reg[1]  ( .D(N127), .E(N129), .CP(clk), .Q(count[1]) );
  EDFQD1 \count_reg[2]  ( .D(N128), .E(N129), .CP(clk), .Q(count[2]) );
  EDFQD1 \wr_ptr_reg[1]  ( .D(N124), .E(N122), .CP(clk), .Q(wr_ptr[1]) );
  CKND0 U231 ( .I(n1), .ZN(n314) );
  NR3D0 U232 ( .A1(count[0]), .A2(count[2]), .A3(count[1]), .ZN(empty) );
  INR2D0 U233 ( .A1(N14), .B1(n2), .ZN(N137) );
  NR3D0 U234 ( .A1(n3), .A2(n4), .A3(n5), .ZN(N14) );
  NR3D0 U235 ( .A1(n6), .A2(n3), .A3(n5), .ZN(N136) );
  NR2D0 U236 ( .A1(n7), .A2(n8), .ZN(N135) );
  NR2D0 U237 ( .A1(n6), .A2(n8), .ZN(N134) );
  NR2D0 U238 ( .A1(n7), .A2(n9), .ZN(N133) );
  NR2D0 U239 ( .A1(n6), .A2(n9), .ZN(N132) );
  NR3D0 U240 ( .A1(n7), .A2(wr_ptr[2]), .A3(wr_ptr[1]), .ZN(N131) );
  IND2D0 U241 ( .A1(n2), .B1(wr_ptr[0]), .ZN(n7) );
  NR3D0 U242 ( .A1(n6), .A2(wr_ptr[2]), .A3(wr_ptr[1]), .ZN(N130) );
  CKND2D0 U243 ( .A1(n312), .A2(wr_en), .ZN(n6) );
  CKND0 U244 ( .I(n10), .ZN(n312) );
  OAI211D0 U245 ( .A1(rd_en), .A2(n2), .B(n11), .C(n12), .ZN(N129) );
  OAI22D0 U246 ( .A1(rst), .A2(n13), .B1(n1), .B2(n14), .ZN(N128) );
  MUX2ND0 U247 ( .I0(n15), .I1(count[2]), .S(count[1]), .ZN(n14) );
  NR2D0 U248 ( .A1(count[2]), .A2(n11), .ZN(n15) );
  MUX2ND0 U249 ( .I0(n16), .I1(n17), .S(count[2]), .ZN(n13) );
  MUX2ND0 U250 ( .I0(count[1]), .I1(n18), .S(n19), .ZN(n17) );
  NR3D0 U251 ( .A1(n18), .A2(n19), .A3(n20), .ZN(n16) );
  CKND0 U252 ( .I(n11), .ZN(n19) );
  MUX2ND0 U253 ( .I0(n21), .I1(n1), .S(n22), .ZN(N127) );
  CKXOR2D0 U254 ( .A1(n11), .A2(n20), .Z(n22) );
  CKND0 U255 ( .I(count[1]), .ZN(n20) );
  CKND2D0 U256 ( .A1(rd_en), .A2(n23), .ZN(n11) );
  CKND2D0 U257 ( .A1(n18), .A2(n12), .ZN(n1) );
  CKND0 U258 ( .I(count[0]), .ZN(n18) );
  CKND2D0 U259 ( .A1(count[0]), .A2(n12), .ZN(n21) );
  OAI22D0 U260 ( .A1(n5), .A2(n10), .B1(n24), .B2(n25), .ZN(N125) );
  OA21D0 U261 ( .A1(n9), .A2(n4), .B(n8), .Z(n25) );
  CKND2D0 U262 ( .A1(wr_ptr[2]), .A2(n3), .ZN(n8) );
  CKND0 U263 ( .I(wr_ptr[1]), .ZN(n3) );
  CKND2D0 U264 ( .A1(wr_ptr[1]), .A2(n5), .ZN(n9) );
  CKND0 U265 ( .I(n26), .ZN(n24) );
  CKND0 U266 ( .I(wr_ptr[2]), .ZN(n5) );
  MUX2ND0 U267 ( .I0(n27), .I1(n10), .S(wr_ptr[1]), .ZN(N124) );
  CKND2D0 U268 ( .A1(n26), .A2(n4), .ZN(n10) );
  CKND2D0 U269 ( .A1(wr_ptr[0]), .A2(n26), .ZN(n27) );
  CKND2D0 U270 ( .A1(n12), .A2(n2), .ZN(N122) );
  CKND2D0 U271 ( .A1(wr_en), .A2(n26), .ZN(n2) );
  AN2D0 U272 ( .A1(data_in[19]), .A2(n28), .Z(N121) );
  AN2D0 U273 ( .A1(data_in[18]), .A2(n28), .Z(N120) );
  AN2D0 U274 ( .A1(data_in[17]), .A2(n28), .Z(N119) );
  AN2D0 U275 ( .A1(data_in[16]), .A2(n28), .Z(N118) );
  AN2D0 U276 ( .A1(data_in[15]), .A2(n28), .Z(N117) );
  AN2D0 U277 ( .A1(data_in[14]), .A2(n28), .Z(N116) );
  AN2D0 U278 ( .A1(data_in[13]), .A2(n28), .Z(N115) );
  AN2D0 U279 ( .A1(data_in[12]), .A2(n28), .Z(N114) );
  AN2D0 U280 ( .A1(data_in[11]), .A2(n28), .Z(N113) );
  AN2D0 U281 ( .A1(data_in[10]), .A2(n28), .Z(N112) );
  AN2D0 U282 ( .A1(data_in[9]), .A2(n28), .Z(N111) );
  AN2D0 U283 ( .A1(data_in[8]), .A2(n28), .Z(N110) );
  AO22D0 U284 ( .A1(data_in[7]), .A2(n28), .B1(n29), .B2(n26), .Z(N109) );
  ND4D0 U285 ( .A1(n30), .A2(n31), .A3(n32), .A4(n33), .ZN(n29) );
  AOI22D0 U286 ( .A1(\buffer[6][7] ), .A2(n34), .B1(\buffer[7][7] ), .B2(n35), 
        .ZN(n33) );
  AOI22D0 U287 ( .A1(\buffer[4][7] ), .A2(n36), .B1(\buffer[5][7] ), .B2(n37), 
        .ZN(n32) );
  AOI22D0 U288 ( .A1(\buffer[2][7] ), .A2(n38), .B1(\buffer[3][7] ), .B2(n39), 
        .ZN(n31) );
  AOI22D0 U289 ( .A1(\buffer[0][7] ), .A2(n40), .B1(\buffer[1][7] ), .B2(n41), 
        .ZN(n30) );
  AO22D0 U290 ( .A1(data_in[6]), .A2(n28), .B1(n42), .B2(n26), .Z(N108) );
  ND4D0 U291 ( .A1(n43), .A2(n44), .A3(n45), .A4(n46), .ZN(n42) );
  AOI22D0 U292 ( .A1(\buffer[6][6] ), .A2(n34), .B1(\buffer[7][6] ), .B2(n35), 
        .ZN(n46) );
  AOI22D0 U293 ( .A1(\buffer[4][6] ), .A2(n36), .B1(\buffer[5][6] ), .B2(n37), 
        .ZN(n45) );
  AOI22D0 U294 ( .A1(\buffer[2][6] ), .A2(n38), .B1(\buffer[3][6] ), .B2(n39), 
        .ZN(n44) );
  AOI22D0 U295 ( .A1(\buffer[0][6] ), .A2(n40), .B1(\buffer[1][6] ), .B2(n41), 
        .ZN(n43) );
  AO22D0 U296 ( .A1(data_in[5]), .A2(n28), .B1(n47), .B2(n26), .Z(N107) );
  ND4D0 U297 ( .A1(n48), .A2(n49), .A3(n50), .A4(n51), .ZN(n47) );
  AOI22D0 U298 ( .A1(\buffer[6][5] ), .A2(n34), .B1(\buffer[7][5] ), .B2(n35), 
        .ZN(n51) );
  AOI22D0 U299 ( .A1(\buffer[4][5] ), .A2(n36), .B1(\buffer[5][5] ), .B2(n37), 
        .ZN(n50) );
  AOI22D0 U300 ( .A1(\buffer[2][5] ), .A2(n38), .B1(\buffer[3][5] ), .B2(n39), 
        .ZN(n49) );
  AOI22D0 U301 ( .A1(\buffer[0][5] ), .A2(n40), .B1(\buffer[1][5] ), .B2(n41), 
        .ZN(n48) );
  AO22D0 U302 ( .A1(data_in[4]), .A2(n28), .B1(n52), .B2(n26), .Z(N106) );
  ND4D0 U303 ( .A1(n53), .A2(n54), .A3(n55), .A4(n56), .ZN(n52) );
  AOI22D0 U304 ( .A1(\buffer[6][4] ), .A2(n34), .B1(\buffer[7][4] ), .B2(n35), 
        .ZN(n56) );
  AOI22D0 U305 ( .A1(\buffer[4][4] ), .A2(n36), .B1(\buffer[5][4] ), .B2(n37), 
        .ZN(n55) );
  AOI22D0 U306 ( .A1(\buffer[2][4] ), .A2(n38), .B1(\buffer[3][4] ), .B2(n39), 
        .ZN(n54) );
  AOI22D0 U307 ( .A1(\buffer[0][4] ), .A2(n40), .B1(\buffer[1][4] ), .B2(n41), 
        .ZN(n53) );
  AO22D0 U308 ( .A1(data_in[3]), .A2(n28), .B1(n57), .B2(n26), .Z(N105) );
  ND4D0 U309 ( .A1(n58), .A2(n59), .A3(n60), .A4(n61), .ZN(n57) );
  AOI22D0 U310 ( .A1(\buffer[6][3] ), .A2(n34), .B1(\buffer[7][3] ), .B2(n35), 
        .ZN(n61) );
  AOI22D0 U311 ( .A1(\buffer[4][3] ), .A2(n36), .B1(\buffer[5][3] ), .B2(n37), 
        .ZN(n60) );
  AOI22D0 U312 ( .A1(\buffer[2][3] ), .A2(n38), .B1(\buffer[3][3] ), .B2(n39), 
        .ZN(n59) );
  AOI22D0 U313 ( .A1(\buffer[0][3] ), .A2(n40), .B1(\buffer[1][3] ), .B2(n41), 
        .ZN(n58) );
  AO22D0 U314 ( .A1(data_in[2]), .A2(n28), .B1(n62), .B2(n26), .Z(N104) );
  ND4D0 U315 ( .A1(n63), .A2(n64), .A3(n65), .A4(n66), .ZN(n62) );
  AOI22D0 U316 ( .A1(\buffer[6][2] ), .A2(n34), .B1(\buffer[7][2] ), .B2(n35), 
        .ZN(n66) );
  AOI22D0 U317 ( .A1(\buffer[4][2] ), .A2(n36), .B1(\buffer[5][2] ), .B2(n37), 
        .ZN(n65) );
  AOI22D0 U318 ( .A1(\buffer[2][2] ), .A2(n38), .B1(\buffer[3][2] ), .B2(n39), 
        .ZN(n64) );
  AOI22D0 U319 ( .A1(\buffer[0][2] ), .A2(n40), .B1(\buffer[1][2] ), .B2(n41), 
        .ZN(n63) );
  AO22D0 U320 ( .A1(data_in[1]), .A2(n28), .B1(n67), .B2(n26), .Z(N103) );
  ND4D0 U321 ( .A1(n68), .A2(n69), .A3(n70), .A4(n71), .ZN(n67) );
  AOI22D0 U322 ( .A1(\buffer[6][1] ), .A2(n34), .B1(\buffer[7][1] ), .B2(n35), 
        .ZN(n71) );
  AOI22D0 U323 ( .A1(\buffer[4][1] ), .A2(n36), .B1(\buffer[5][1] ), .B2(n37), 
        .ZN(n70) );
  AOI22D0 U324 ( .A1(\buffer[2][1] ), .A2(n38), .B1(\buffer[3][1] ), .B2(n39), 
        .ZN(n69) );
  AOI22D0 U325 ( .A1(\buffer[0][1] ), .A2(n40), .B1(\buffer[1][1] ), .B2(n41), 
        .ZN(n68) );
  AO22D0 U326 ( .A1(data_in[0]), .A2(n28), .B1(n72), .B2(n26), .Z(N102) );
  OAI21D0 U327 ( .A1(rst), .A2(n73), .B(N101), .ZN(n26) );
  ND4D0 U328 ( .A1(n74), .A2(n75), .A3(n76), .A4(n77), .ZN(n72) );
  AOI22D0 U329 ( .A1(\buffer[6][0] ), .A2(n34), .B1(\buffer[7][0] ), .B2(n35), 
        .ZN(n77) );
  INR3D0 U330 ( .A1(rd_ptr[2]), .B1(n78), .B2(n79), .ZN(n35) );
  INR3D0 U331 ( .A1(rd_ptr[2]), .B1(n78), .B2(rd_ptr[0]), .ZN(n34) );
  AOI22D0 U332 ( .A1(\buffer[4][0] ), .A2(n36), .B1(\buffer[5][0] ), .B2(n37), 
        .ZN(n76) );
  INR3D0 U333 ( .A1(rd_ptr[2]), .B1(n79), .B2(rd_ptr[1]), .ZN(n37) );
  INR3D0 U334 ( .A1(rd_ptr[2]), .B1(rd_ptr[0]), .B2(rd_ptr[1]), .ZN(n36) );
  AOI22D0 U335 ( .A1(\buffer[2][0] ), .A2(n38), .B1(\buffer[3][0] ), .B2(n39), 
        .ZN(n75) );
  NR3D0 U336 ( .A1(n79), .A2(rd_ptr[2]), .A3(n78), .ZN(n39) );
  NR3D0 U337 ( .A1(rd_ptr[0]), .A2(rd_ptr[2]), .A3(n78), .ZN(n38) );
  CKND0 U338 ( .I(rd_ptr[1]), .ZN(n78) );
  AOI22D0 U339 ( .A1(\buffer[0][0] ), .A2(n40), .B1(\buffer[1][0] ), .B2(n41), 
        .ZN(n74) );
  NR3D0 U340 ( .A1(rd_ptr[1]), .A2(rd_ptr[2]), .A3(n79), .ZN(n41) );
  NR3D0 U341 ( .A1(rd_ptr[1]), .A2(rd_ptr[2]), .A3(rd_ptr[0]), .ZN(n40) );
  AN3D0 U342 ( .A1(rd_en), .A2(n12), .A3(n73), .Z(n28) );
  NR3D0 U343 ( .A1(n23), .A2(n79), .A3(n4), .ZN(n73) );
  CKND0 U344 ( .I(wr_ptr[0]), .ZN(n4) );
  CKND0 U345 ( .I(rd_ptr[0]), .ZN(n79) );
  CKND0 U346 ( .I(wr_en), .ZN(n23) );
  CKND0 U347 ( .I(rst), .ZN(n12) );
  OR2D0 U348 ( .A1(rd_en), .A2(rst), .Z(N101) );
endmodule


module allocation_buffer_1 ( clk, rst, data_in, data_out, full, empty, rd_ptr, 
        wr_en, rd_en );
  input [19:0] data_in;
  output [19:0] data_out;
  input [2:0] rd_ptr;
  input clk, rst, wr_en, rd_en;
  output full, empty;
  wire   N14, \buffer[7][7] , \buffer[7][6] , \buffer[7][5] , \buffer[7][4] ,
         \buffer[7][3] , \buffer[7][2] , \buffer[7][1] , \buffer[7][0] ,
         \buffer[6][7] , \buffer[6][6] , \buffer[6][5] , \buffer[6][4] ,
         \buffer[6][3] , \buffer[6][2] , \buffer[6][1] , \buffer[6][0] ,
         \buffer[5][7] , \buffer[5][6] , \buffer[5][5] , \buffer[5][4] ,
         \buffer[5][3] , \buffer[5][2] , \buffer[5][1] , \buffer[5][0] ,
         \buffer[4][7] , \buffer[4][6] , \buffer[4][5] , \buffer[4][4] ,
         \buffer[4][3] , \buffer[4][2] , \buffer[4][1] , \buffer[4][0] ,
         \buffer[3][7] , \buffer[3][6] , \buffer[3][5] , \buffer[3][4] ,
         \buffer[3][3] , \buffer[3][2] , \buffer[3][1] , \buffer[3][0] ,
         \buffer[2][7] , \buffer[2][6] , \buffer[2][5] , \buffer[2][4] ,
         \buffer[2][3] , \buffer[2][2] , \buffer[2][1] , \buffer[2][0] ,
         \buffer[1][7] , \buffer[1][6] , \buffer[1][5] , \buffer[1][4] ,
         \buffer[1][3] , \buffer[1][2] , \buffer[1][1] , \buffer[1][0] ,
         \buffer[0][7] , \buffer[0][6] , \buffer[0][5] , \buffer[0][4] ,
         \buffer[0][3] , \buffer[0][2] , \buffer[0][1] , \buffer[0][0] , N101,
         N102, N103, N104, N105, N106, N107, N108, N109, N110, N111, N112,
         N113, N114, N115, N116, N117, N118, N119, N120, N121, N122, N124,
         N125, N127, N128, N129, N130, N131, N132, N133, N134, N135, N136,
         N137, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14,
         n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28,
         n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42,
         n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56,
         n57, n58, n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70,
         n71, n72, n73, n74, n75, n76, n77, n78, n79, n80, n81;
  wire   [2:0] wr_ptr;
  wire   [2:0] count;
  assign full = N14;

  EDFQD1 \data_out_reg[19]  ( .D(N121), .E(N101), .CP(clk), .Q(data_out[19])
         );
  EDFQD1 \data_out_reg[18]  ( .D(N120), .E(N101), .CP(clk), .Q(data_out[18])
         );
  EDFQD1 \data_out_reg[17]  ( .D(N119), .E(N101), .CP(clk), .Q(data_out[17])
         );
  EDFQD1 \data_out_reg[16]  ( .D(N118), .E(N101), .CP(clk), .Q(data_out[16])
         );
  EDFQD1 \data_out_reg[15]  ( .D(N117), .E(N101), .CP(clk), .Q(data_out[15])
         );
  EDFQD1 \data_out_reg[14]  ( .D(N116), .E(N101), .CP(clk), .Q(data_out[14])
         );
  EDFQD1 \data_out_reg[13]  ( .D(N115), .E(N101), .CP(clk), .Q(data_out[13])
         );
  EDFQD1 \data_out_reg[12]  ( .D(N114), .E(N101), .CP(clk), .Q(data_out[12])
         );
  EDFQD1 \data_out_reg[11]  ( .D(N113), .E(N101), .CP(clk), .Q(data_out[11])
         );
  EDFQD1 \data_out_reg[10]  ( .D(N112), .E(N101), .CP(clk), .Q(data_out[10])
         );
  EDFQD1 \data_out_reg[9]  ( .D(N111), .E(N101), .CP(clk), .Q(data_out[9]) );
  EDFQD1 \data_out_reg[8]  ( .D(N110), .E(N101), .CP(clk), .Q(data_out[8]) );
  EDFQD1 \data_out_reg[7]  ( .D(N109), .E(N101), .CP(clk), .Q(data_out[7]) );
  EDFQD1 \data_out_reg[6]  ( .D(N108), .E(N101), .CP(clk), .Q(data_out[6]) );
  EDFQD1 \data_out_reg[5]  ( .D(N107), .E(N101), .CP(clk), .Q(data_out[5]) );
  EDFQD1 \data_out_reg[4]  ( .D(N106), .E(N101), .CP(clk), .Q(data_out[4]) );
  EDFQD1 \data_out_reg[3]  ( .D(N105), .E(N101), .CP(clk), .Q(data_out[3]) );
  EDFQD1 \data_out_reg[2]  ( .D(N104), .E(N101), .CP(clk), .Q(data_out[2]) );
  EDFQD1 \data_out_reg[1]  ( .D(N103), .E(N101), .CP(clk), .Q(data_out[1]) );
  EDFQD1 \data_out_reg[0]  ( .D(N102), .E(N101), .CP(clk), .Q(data_out[0]) );
  EDFQD1 \buffer_reg[7][7]  ( .D(data_in[7]), .E(N137), .CP(clk), .Q(
        \buffer[7][7] ) );
  EDFQD1 \buffer_reg[7][6]  ( .D(data_in[6]), .E(N137), .CP(clk), .Q(
        \buffer[7][6] ) );
  EDFQD1 \buffer_reg[7][5]  ( .D(data_in[5]), .E(N137), .CP(clk), .Q(
        \buffer[7][5] ) );
  EDFQD1 \buffer_reg[7][4]  ( .D(data_in[4]), .E(N137), .CP(clk), .Q(
        \buffer[7][4] ) );
  EDFQD1 \buffer_reg[7][3]  ( .D(data_in[3]), .E(N137), .CP(clk), .Q(
        \buffer[7][3] ) );
  EDFQD1 \buffer_reg[7][2]  ( .D(data_in[2]), .E(N137), .CP(clk), .Q(
        \buffer[7][2] ) );
  EDFQD1 \buffer_reg[7][1]  ( .D(data_in[1]), .E(N137), .CP(clk), .Q(
        \buffer[7][1] ) );
  EDFQD1 \buffer_reg[7][0]  ( .D(data_in[0]), .E(N137), .CP(clk), .Q(
        \buffer[7][0] ) );
  EDFQD1 \buffer_reg[5][7]  ( .D(data_in[7]), .E(N135), .CP(clk), .Q(
        \buffer[5][7] ) );
  EDFQD1 \buffer_reg[5][6]  ( .D(data_in[6]), .E(N135), .CP(clk), .Q(
        \buffer[5][6] ) );
  EDFQD1 \buffer_reg[5][5]  ( .D(data_in[5]), .E(N135), .CP(clk), .Q(
        \buffer[5][5] ) );
  EDFQD1 \buffer_reg[5][4]  ( .D(data_in[4]), .E(N135), .CP(clk), .Q(
        \buffer[5][4] ) );
  EDFQD1 \buffer_reg[5][3]  ( .D(data_in[3]), .E(N135), .CP(clk), .Q(
        \buffer[5][3] ) );
  EDFQD1 \buffer_reg[5][2]  ( .D(data_in[2]), .E(N135), .CP(clk), .Q(
        \buffer[5][2] ) );
  EDFQD1 \buffer_reg[5][1]  ( .D(data_in[1]), .E(N135), .CP(clk), .Q(
        \buffer[5][1] ) );
  EDFQD1 \buffer_reg[5][0]  ( .D(data_in[0]), .E(N135), .CP(clk), .Q(
        \buffer[5][0] ) );
  EDFQD1 \buffer_reg[3][7]  ( .D(data_in[7]), .E(N133), .CP(clk), .Q(
        \buffer[3][7] ) );
  EDFQD1 \buffer_reg[3][6]  ( .D(data_in[6]), .E(N133), .CP(clk), .Q(
        \buffer[3][6] ) );
  EDFQD1 \buffer_reg[3][5]  ( .D(data_in[5]), .E(N133), .CP(clk), .Q(
        \buffer[3][5] ) );
  EDFQD1 \buffer_reg[3][4]  ( .D(data_in[4]), .E(N133), .CP(clk), .Q(
        \buffer[3][4] ) );
  EDFQD1 \buffer_reg[3][3]  ( .D(data_in[3]), .E(N133), .CP(clk), .Q(
        \buffer[3][3] ) );
  EDFQD1 \buffer_reg[3][2]  ( .D(data_in[2]), .E(N133), .CP(clk), .Q(
        \buffer[3][2] ) );
  EDFQD1 \buffer_reg[3][1]  ( .D(data_in[1]), .E(N133), .CP(clk), .Q(
        \buffer[3][1] ) );
  EDFQD1 \buffer_reg[3][0]  ( .D(data_in[0]), .E(N133), .CP(clk), .Q(
        \buffer[3][0] ) );
  EDFQD1 \buffer_reg[1][7]  ( .D(data_in[7]), .E(N131), .CP(clk), .Q(
        \buffer[1][7] ) );
  EDFQD1 \buffer_reg[1][6]  ( .D(data_in[6]), .E(N131), .CP(clk), .Q(
        \buffer[1][6] ) );
  EDFQD1 \buffer_reg[1][5]  ( .D(data_in[5]), .E(N131), .CP(clk), .Q(
        \buffer[1][5] ) );
  EDFQD1 \buffer_reg[1][4]  ( .D(data_in[4]), .E(N131), .CP(clk), .Q(
        \buffer[1][4] ) );
  EDFQD1 \buffer_reg[1][3]  ( .D(data_in[3]), .E(N131), .CP(clk), .Q(
        \buffer[1][3] ) );
  EDFQD1 \buffer_reg[1][2]  ( .D(data_in[2]), .E(N131), .CP(clk), .Q(
        \buffer[1][2] ) );
  EDFQD1 \buffer_reg[1][1]  ( .D(data_in[1]), .E(N131), .CP(clk), .Q(
        \buffer[1][1] ) );
  EDFQD1 \buffer_reg[1][0]  ( .D(data_in[0]), .E(N131), .CP(clk), .Q(
        \buffer[1][0] ) );
  EDFQD1 \buffer_reg[6][7]  ( .D(data_in[7]), .E(N136), .CP(clk), .Q(
        \buffer[6][7] ) );
  EDFQD1 \buffer_reg[6][6]  ( .D(data_in[6]), .E(N136), .CP(clk), .Q(
        \buffer[6][6] ) );
  EDFQD1 \buffer_reg[6][5]  ( .D(data_in[5]), .E(N136), .CP(clk), .Q(
        \buffer[6][5] ) );
  EDFQD1 \buffer_reg[6][4]  ( .D(data_in[4]), .E(N136), .CP(clk), .Q(
        \buffer[6][4] ) );
  EDFQD1 \buffer_reg[6][3]  ( .D(data_in[3]), .E(N136), .CP(clk), .Q(
        \buffer[6][3] ) );
  EDFQD1 \buffer_reg[6][2]  ( .D(data_in[2]), .E(N136), .CP(clk), .Q(
        \buffer[6][2] ) );
  EDFQD1 \buffer_reg[6][1]  ( .D(data_in[1]), .E(N136), .CP(clk), .Q(
        \buffer[6][1] ) );
  EDFQD1 \buffer_reg[6][0]  ( .D(data_in[0]), .E(N136), .CP(clk), .Q(
        \buffer[6][0] ) );
  EDFQD1 \buffer_reg[4][7]  ( .D(data_in[7]), .E(N134), .CP(clk), .Q(
        \buffer[4][7] ) );
  EDFQD1 \buffer_reg[4][6]  ( .D(data_in[6]), .E(N134), .CP(clk), .Q(
        \buffer[4][6] ) );
  EDFQD1 \buffer_reg[4][5]  ( .D(data_in[5]), .E(N134), .CP(clk), .Q(
        \buffer[4][5] ) );
  EDFQD1 \buffer_reg[4][4]  ( .D(data_in[4]), .E(N134), .CP(clk), .Q(
        \buffer[4][4] ) );
  EDFQD1 \buffer_reg[4][3]  ( .D(data_in[3]), .E(N134), .CP(clk), .Q(
        \buffer[4][3] ) );
  EDFQD1 \buffer_reg[4][2]  ( .D(data_in[2]), .E(N134), .CP(clk), .Q(
        \buffer[4][2] ) );
  EDFQD1 \buffer_reg[4][1]  ( .D(data_in[1]), .E(N134), .CP(clk), .Q(
        \buffer[4][1] ) );
  EDFQD1 \buffer_reg[4][0]  ( .D(data_in[0]), .E(N134), .CP(clk), .Q(
        \buffer[4][0] ) );
  EDFQD1 \buffer_reg[2][7]  ( .D(data_in[7]), .E(N132), .CP(clk), .Q(
        \buffer[2][7] ) );
  EDFQD1 \buffer_reg[2][6]  ( .D(data_in[6]), .E(N132), .CP(clk), .Q(
        \buffer[2][6] ) );
  EDFQD1 \buffer_reg[2][5]  ( .D(data_in[5]), .E(N132), .CP(clk), .Q(
        \buffer[2][5] ) );
  EDFQD1 \buffer_reg[2][4]  ( .D(data_in[4]), .E(N132), .CP(clk), .Q(
        \buffer[2][4] ) );
  EDFQD1 \buffer_reg[2][3]  ( .D(data_in[3]), .E(N132), .CP(clk), .Q(
        \buffer[2][3] ) );
  EDFQD1 \buffer_reg[2][2]  ( .D(data_in[2]), .E(N132), .CP(clk), .Q(
        \buffer[2][2] ) );
  EDFQD1 \buffer_reg[2][1]  ( .D(data_in[1]), .E(N132), .CP(clk), .Q(
        \buffer[2][1] ) );
  EDFQD1 \buffer_reg[2][0]  ( .D(data_in[0]), .E(N132), .CP(clk), .Q(
        \buffer[2][0] ) );
  EDFQD1 \buffer_reg[0][7]  ( .D(data_in[7]), .E(N130), .CP(clk), .Q(
        \buffer[0][7] ) );
  EDFQD1 \buffer_reg[0][6]  ( .D(data_in[6]), .E(N130), .CP(clk), .Q(
        \buffer[0][6] ) );
  EDFQD1 \buffer_reg[0][5]  ( .D(data_in[5]), .E(N130), .CP(clk), .Q(
        \buffer[0][5] ) );
  EDFQD1 \buffer_reg[0][4]  ( .D(data_in[4]), .E(N130), .CP(clk), .Q(
        \buffer[0][4] ) );
  EDFQD1 \buffer_reg[0][3]  ( .D(data_in[3]), .E(N130), .CP(clk), .Q(
        \buffer[0][3] ) );
  EDFQD1 \buffer_reg[0][2]  ( .D(data_in[2]), .E(N130), .CP(clk), .Q(
        \buffer[0][2] ) );
  EDFQD1 \buffer_reg[0][1]  ( .D(data_in[1]), .E(N130), .CP(clk), .Q(
        \buffer[0][1] ) );
  EDFQD1 \buffer_reg[0][0]  ( .D(data_in[0]), .E(N130), .CP(clk), .Q(
        \buffer[0][0] ) );
  EDFQD1 \wr_ptr_reg[0]  ( .D(n81), .E(N122), .CP(clk), .Q(wr_ptr[0]) );
  EDFQD1 \count_reg[0]  ( .D(n80), .E(N129), .CP(clk), .Q(count[0]) );
  EDFQD1 \wr_ptr_reg[2]  ( .D(N125), .E(N122), .CP(clk), .Q(wr_ptr[2]) );
  EDFQD1 \count_reg[1]  ( .D(N127), .E(N129), .CP(clk), .Q(count[1]) );
  EDFQD1 \count_reg[2]  ( .D(N128), .E(N129), .CP(clk), .Q(count[2]) );
  EDFQD1 \wr_ptr_reg[1]  ( .D(N124), .E(N122), .CP(clk), .Q(wr_ptr[1]) );
  CKND0 U231 ( .I(n1), .ZN(n80) );
  NR3D0 U232 ( .A1(count[0]), .A2(count[2]), .A3(count[1]), .ZN(empty) );
  INR2D0 U233 ( .A1(N14), .B1(n2), .ZN(N137) );
  NR3D0 U234 ( .A1(n3), .A2(n4), .A3(n5), .ZN(N14) );
  NR3D0 U235 ( .A1(n6), .A2(n3), .A3(n5), .ZN(N136) );
  NR2D0 U236 ( .A1(n7), .A2(n8), .ZN(N135) );
  NR2D0 U237 ( .A1(n6), .A2(n8), .ZN(N134) );
  NR2D0 U238 ( .A1(n7), .A2(n9), .ZN(N133) );
  NR2D0 U239 ( .A1(n6), .A2(n9), .ZN(N132) );
  NR3D0 U240 ( .A1(n7), .A2(wr_ptr[2]), .A3(wr_ptr[1]), .ZN(N131) );
  IND2D0 U241 ( .A1(n2), .B1(wr_ptr[0]), .ZN(n7) );
  NR3D0 U242 ( .A1(n6), .A2(wr_ptr[2]), .A3(wr_ptr[1]), .ZN(N130) );
  CKND2D0 U243 ( .A1(n81), .A2(wr_en), .ZN(n6) );
  CKND0 U244 ( .I(n10), .ZN(n81) );
  OAI211D0 U245 ( .A1(rd_en), .A2(n2), .B(n11), .C(n12), .ZN(N129) );
  OAI22D0 U246 ( .A1(rst), .A2(n13), .B1(n1), .B2(n14), .ZN(N128) );
  MUX2ND0 U247 ( .I0(n15), .I1(count[2]), .S(count[1]), .ZN(n14) );
  NR2D0 U248 ( .A1(count[2]), .A2(n11), .ZN(n15) );
  MUX2ND0 U249 ( .I0(n16), .I1(n17), .S(count[2]), .ZN(n13) );
  MUX2ND0 U250 ( .I0(count[1]), .I1(n18), .S(n19), .ZN(n17) );
  NR3D0 U251 ( .A1(n18), .A2(n19), .A3(n20), .ZN(n16) );
  CKND0 U252 ( .I(n11), .ZN(n19) );
  MUX2ND0 U253 ( .I0(n21), .I1(n1), .S(n22), .ZN(N127) );
  CKXOR2D0 U254 ( .A1(n11), .A2(n20), .Z(n22) );
  CKND0 U255 ( .I(count[1]), .ZN(n20) );
  CKND2D0 U256 ( .A1(rd_en), .A2(n23), .ZN(n11) );
  CKND2D0 U257 ( .A1(n18), .A2(n12), .ZN(n1) );
  CKND0 U258 ( .I(count[0]), .ZN(n18) );
  CKND2D0 U259 ( .A1(count[0]), .A2(n12), .ZN(n21) );
  OAI22D0 U260 ( .A1(n5), .A2(n10), .B1(n24), .B2(n25), .ZN(N125) );
  OA21D0 U261 ( .A1(n9), .A2(n4), .B(n8), .Z(n25) );
  CKND2D0 U262 ( .A1(wr_ptr[2]), .A2(n3), .ZN(n8) );
  CKND0 U263 ( .I(wr_ptr[1]), .ZN(n3) );
  CKND2D0 U264 ( .A1(wr_ptr[1]), .A2(n5), .ZN(n9) );
  CKND0 U265 ( .I(n26), .ZN(n24) );
  CKND0 U266 ( .I(wr_ptr[2]), .ZN(n5) );
  MUX2ND0 U267 ( .I0(n27), .I1(n10), .S(wr_ptr[1]), .ZN(N124) );
  CKND2D0 U268 ( .A1(n26), .A2(n4), .ZN(n10) );
  CKND2D0 U269 ( .A1(wr_ptr[0]), .A2(n26), .ZN(n27) );
  CKND2D0 U270 ( .A1(n12), .A2(n2), .ZN(N122) );
  CKND2D0 U271 ( .A1(wr_en), .A2(n26), .ZN(n2) );
  AN2D0 U272 ( .A1(data_in[19]), .A2(n28), .Z(N121) );
  AN2D0 U273 ( .A1(data_in[18]), .A2(n28), .Z(N120) );
  AN2D0 U274 ( .A1(data_in[17]), .A2(n28), .Z(N119) );
  AN2D0 U275 ( .A1(data_in[16]), .A2(n28), .Z(N118) );
  AN2D0 U276 ( .A1(data_in[15]), .A2(n28), .Z(N117) );
  AN2D0 U277 ( .A1(data_in[14]), .A2(n28), .Z(N116) );
  AN2D0 U278 ( .A1(data_in[13]), .A2(n28), .Z(N115) );
  AN2D0 U279 ( .A1(data_in[12]), .A2(n28), .Z(N114) );
  AN2D0 U280 ( .A1(data_in[11]), .A2(n28), .Z(N113) );
  AN2D0 U281 ( .A1(data_in[10]), .A2(n28), .Z(N112) );
  AN2D0 U282 ( .A1(data_in[9]), .A2(n28), .Z(N111) );
  AN2D0 U283 ( .A1(data_in[8]), .A2(n28), .Z(N110) );
  AO22D0 U284 ( .A1(data_in[7]), .A2(n28), .B1(n29), .B2(n26), .Z(N109) );
  ND4D0 U285 ( .A1(n30), .A2(n31), .A3(n32), .A4(n33), .ZN(n29) );
  AOI22D0 U286 ( .A1(\buffer[6][7] ), .A2(n34), .B1(\buffer[7][7] ), .B2(n35), 
        .ZN(n33) );
  AOI22D0 U287 ( .A1(\buffer[4][7] ), .A2(n36), .B1(\buffer[5][7] ), .B2(n37), 
        .ZN(n32) );
  AOI22D0 U288 ( .A1(\buffer[2][7] ), .A2(n38), .B1(\buffer[3][7] ), .B2(n39), 
        .ZN(n31) );
  AOI22D0 U289 ( .A1(\buffer[0][7] ), .A2(n40), .B1(\buffer[1][7] ), .B2(n41), 
        .ZN(n30) );
  AO22D0 U290 ( .A1(data_in[6]), .A2(n28), .B1(n42), .B2(n26), .Z(N108) );
  ND4D0 U291 ( .A1(n43), .A2(n44), .A3(n45), .A4(n46), .ZN(n42) );
  AOI22D0 U292 ( .A1(\buffer[6][6] ), .A2(n34), .B1(\buffer[7][6] ), .B2(n35), 
        .ZN(n46) );
  AOI22D0 U293 ( .A1(\buffer[4][6] ), .A2(n36), .B1(\buffer[5][6] ), .B2(n37), 
        .ZN(n45) );
  AOI22D0 U294 ( .A1(\buffer[2][6] ), .A2(n38), .B1(\buffer[3][6] ), .B2(n39), 
        .ZN(n44) );
  AOI22D0 U295 ( .A1(\buffer[0][6] ), .A2(n40), .B1(\buffer[1][6] ), .B2(n41), 
        .ZN(n43) );
  AO22D0 U296 ( .A1(data_in[5]), .A2(n28), .B1(n47), .B2(n26), .Z(N107) );
  ND4D0 U297 ( .A1(n48), .A2(n49), .A3(n50), .A4(n51), .ZN(n47) );
  AOI22D0 U298 ( .A1(\buffer[6][5] ), .A2(n34), .B1(\buffer[7][5] ), .B2(n35), 
        .ZN(n51) );
  AOI22D0 U299 ( .A1(\buffer[4][5] ), .A2(n36), .B1(\buffer[5][5] ), .B2(n37), 
        .ZN(n50) );
  AOI22D0 U300 ( .A1(\buffer[2][5] ), .A2(n38), .B1(\buffer[3][5] ), .B2(n39), 
        .ZN(n49) );
  AOI22D0 U301 ( .A1(\buffer[0][5] ), .A2(n40), .B1(\buffer[1][5] ), .B2(n41), 
        .ZN(n48) );
  AO22D0 U302 ( .A1(data_in[4]), .A2(n28), .B1(n52), .B2(n26), .Z(N106) );
  ND4D0 U303 ( .A1(n53), .A2(n54), .A3(n55), .A4(n56), .ZN(n52) );
  AOI22D0 U304 ( .A1(\buffer[6][4] ), .A2(n34), .B1(\buffer[7][4] ), .B2(n35), 
        .ZN(n56) );
  AOI22D0 U305 ( .A1(\buffer[4][4] ), .A2(n36), .B1(\buffer[5][4] ), .B2(n37), 
        .ZN(n55) );
  AOI22D0 U306 ( .A1(\buffer[2][4] ), .A2(n38), .B1(\buffer[3][4] ), .B2(n39), 
        .ZN(n54) );
  AOI22D0 U307 ( .A1(\buffer[0][4] ), .A2(n40), .B1(\buffer[1][4] ), .B2(n41), 
        .ZN(n53) );
  AO22D0 U308 ( .A1(data_in[3]), .A2(n28), .B1(n57), .B2(n26), .Z(N105) );
  ND4D0 U309 ( .A1(n58), .A2(n59), .A3(n60), .A4(n61), .ZN(n57) );
  AOI22D0 U310 ( .A1(\buffer[6][3] ), .A2(n34), .B1(\buffer[7][3] ), .B2(n35), 
        .ZN(n61) );
  AOI22D0 U311 ( .A1(\buffer[4][3] ), .A2(n36), .B1(\buffer[5][3] ), .B2(n37), 
        .ZN(n60) );
  AOI22D0 U312 ( .A1(\buffer[2][3] ), .A2(n38), .B1(\buffer[3][3] ), .B2(n39), 
        .ZN(n59) );
  AOI22D0 U313 ( .A1(\buffer[0][3] ), .A2(n40), .B1(\buffer[1][3] ), .B2(n41), 
        .ZN(n58) );
  AO22D0 U314 ( .A1(data_in[2]), .A2(n28), .B1(n62), .B2(n26), .Z(N104) );
  ND4D0 U315 ( .A1(n63), .A2(n64), .A3(n65), .A4(n66), .ZN(n62) );
  AOI22D0 U316 ( .A1(\buffer[6][2] ), .A2(n34), .B1(\buffer[7][2] ), .B2(n35), 
        .ZN(n66) );
  AOI22D0 U317 ( .A1(\buffer[4][2] ), .A2(n36), .B1(\buffer[5][2] ), .B2(n37), 
        .ZN(n65) );
  AOI22D0 U318 ( .A1(\buffer[2][2] ), .A2(n38), .B1(\buffer[3][2] ), .B2(n39), 
        .ZN(n64) );
  AOI22D0 U319 ( .A1(\buffer[0][2] ), .A2(n40), .B1(\buffer[1][2] ), .B2(n41), 
        .ZN(n63) );
  AO22D0 U320 ( .A1(data_in[1]), .A2(n28), .B1(n67), .B2(n26), .Z(N103) );
  ND4D0 U321 ( .A1(n68), .A2(n69), .A3(n70), .A4(n71), .ZN(n67) );
  AOI22D0 U322 ( .A1(\buffer[6][1] ), .A2(n34), .B1(\buffer[7][1] ), .B2(n35), 
        .ZN(n71) );
  AOI22D0 U323 ( .A1(\buffer[4][1] ), .A2(n36), .B1(\buffer[5][1] ), .B2(n37), 
        .ZN(n70) );
  AOI22D0 U324 ( .A1(\buffer[2][1] ), .A2(n38), .B1(\buffer[3][1] ), .B2(n39), 
        .ZN(n69) );
  AOI22D0 U325 ( .A1(\buffer[0][1] ), .A2(n40), .B1(\buffer[1][1] ), .B2(n41), 
        .ZN(n68) );
  AO22D0 U326 ( .A1(data_in[0]), .A2(n28), .B1(n72), .B2(n26), .Z(N102) );
  OAI21D0 U327 ( .A1(rst), .A2(n73), .B(N101), .ZN(n26) );
  ND4D0 U328 ( .A1(n74), .A2(n75), .A3(n76), .A4(n77), .ZN(n72) );
  AOI22D0 U329 ( .A1(\buffer[6][0] ), .A2(n34), .B1(\buffer[7][0] ), .B2(n35), 
        .ZN(n77) );
  INR3D0 U330 ( .A1(rd_ptr[2]), .B1(n78), .B2(n79), .ZN(n35) );
  INR3D0 U331 ( .A1(rd_ptr[2]), .B1(n78), .B2(rd_ptr[0]), .ZN(n34) );
  AOI22D0 U332 ( .A1(\buffer[4][0] ), .A2(n36), .B1(\buffer[5][0] ), .B2(n37), 
        .ZN(n76) );
  INR3D0 U333 ( .A1(rd_ptr[2]), .B1(n79), .B2(rd_ptr[1]), .ZN(n37) );
  INR3D0 U334 ( .A1(rd_ptr[2]), .B1(rd_ptr[0]), .B2(rd_ptr[1]), .ZN(n36) );
  AOI22D0 U335 ( .A1(\buffer[2][0] ), .A2(n38), .B1(\buffer[3][0] ), .B2(n39), 
        .ZN(n75) );
  NR3D0 U336 ( .A1(n79), .A2(rd_ptr[2]), .A3(n78), .ZN(n39) );
  NR3D0 U337 ( .A1(rd_ptr[0]), .A2(rd_ptr[2]), .A3(n78), .ZN(n38) );
  CKND0 U338 ( .I(rd_ptr[1]), .ZN(n78) );
  AOI22D0 U339 ( .A1(\buffer[0][0] ), .A2(n40), .B1(\buffer[1][0] ), .B2(n41), 
        .ZN(n74) );
  NR3D0 U340 ( .A1(rd_ptr[1]), .A2(rd_ptr[2]), .A3(n79), .ZN(n41) );
  NR3D0 U341 ( .A1(rd_ptr[1]), .A2(rd_ptr[2]), .A3(rd_ptr[0]), .ZN(n40) );
  AN3D0 U342 ( .A1(rd_en), .A2(n12), .A3(n73), .Z(n28) );
  NR3D0 U343 ( .A1(n23), .A2(n79), .A3(n4), .ZN(n73) );
  CKND0 U344 ( .I(wr_ptr[0]), .ZN(n4) );
  CKND0 U345 ( .I(rd_ptr[0]), .ZN(n79) );
  CKND0 U346 ( .I(wr_en), .ZN(n23) );
  CKND0 U347 ( .I(rst), .ZN(n12) );
  OR2D0 U348 ( .A1(rd_en), .A2(rst), .Z(N101) );
endmodule


module allocation_buffer_2 ( clk, rst, data_in, data_out, full, empty, rd_ptr, 
        wr_en, rd_en );
  input [19:0] data_in;
  output [19:0] data_out;
  input [2:0] rd_ptr;
  input clk, rst, wr_en, rd_en;
  output full, empty;
  wire   N14, \buffer[7][7] , \buffer[7][6] , \buffer[7][5] , \buffer[7][4] ,
         \buffer[7][3] , \buffer[7][2] , \buffer[7][1] , \buffer[7][0] ,
         \buffer[6][7] , \buffer[6][6] , \buffer[6][5] , \buffer[6][4] ,
         \buffer[6][3] , \buffer[6][2] , \buffer[6][1] , \buffer[6][0] ,
         \buffer[5][7] , \buffer[5][6] , \buffer[5][5] , \buffer[5][4] ,
         \buffer[5][3] , \buffer[5][2] , \buffer[5][1] , \buffer[5][0] ,
         \buffer[4][7] , \buffer[4][6] , \buffer[4][5] , \buffer[4][4] ,
         \buffer[4][3] , \buffer[4][2] , \buffer[4][1] , \buffer[4][0] ,
         \buffer[3][7] , \buffer[3][6] , \buffer[3][5] , \buffer[3][4] ,
         \buffer[3][3] , \buffer[3][2] , \buffer[3][1] , \buffer[3][0] ,
         \buffer[2][7] , \buffer[2][6] , \buffer[2][5] , \buffer[2][4] ,
         \buffer[2][3] , \buffer[2][2] , \buffer[2][1] , \buffer[2][0] ,
         \buffer[1][7] , \buffer[1][6] , \buffer[1][5] , \buffer[1][4] ,
         \buffer[1][3] , \buffer[1][2] , \buffer[1][1] , \buffer[1][0] ,
         \buffer[0][7] , \buffer[0][6] , \buffer[0][5] , \buffer[0][4] ,
         \buffer[0][3] , \buffer[0][2] , \buffer[0][1] , \buffer[0][0] , N101,
         N102, N103, N104, N105, N106, N107, N108, N109, N110, N111, N112,
         N113, N114, N115, N116, N117, N118, N119, N120, N121, N122, N124,
         N125, N127, N128, N129, N130, N131, N132, N133, N134, N135, N136,
         N137, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14,
         n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28,
         n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42,
         n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56,
         n57, n58, n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70,
         n71, n72, n73, n74, n75, n76, n77, n78, n79, n80, n81;
  wire   [2:0] wr_ptr;
  wire   [2:0] count;
  assign full = N14;

  EDFQD1 \data_out_reg[19]  ( .D(N121), .E(N101), .CP(clk), .Q(data_out[19])
         );
  EDFQD1 \data_out_reg[18]  ( .D(N120), .E(N101), .CP(clk), .Q(data_out[18])
         );
  EDFQD1 \data_out_reg[17]  ( .D(N119), .E(N101), .CP(clk), .Q(data_out[17])
         );
  EDFQD1 \data_out_reg[16]  ( .D(N118), .E(N101), .CP(clk), .Q(data_out[16])
         );
  EDFQD1 \data_out_reg[15]  ( .D(N117), .E(N101), .CP(clk), .Q(data_out[15])
         );
  EDFQD1 \data_out_reg[14]  ( .D(N116), .E(N101), .CP(clk), .Q(data_out[14])
         );
  EDFQD1 \data_out_reg[13]  ( .D(N115), .E(N101), .CP(clk), .Q(data_out[13])
         );
  EDFQD1 \data_out_reg[12]  ( .D(N114), .E(N101), .CP(clk), .Q(data_out[12])
         );
  EDFQD1 \data_out_reg[11]  ( .D(N113), .E(N101), .CP(clk), .Q(data_out[11])
         );
  EDFQD1 \data_out_reg[10]  ( .D(N112), .E(N101), .CP(clk), .Q(data_out[10])
         );
  EDFQD1 \data_out_reg[9]  ( .D(N111), .E(N101), .CP(clk), .Q(data_out[9]) );
  EDFQD1 \data_out_reg[8]  ( .D(N110), .E(N101), .CP(clk), .Q(data_out[8]) );
  EDFQD1 \data_out_reg[7]  ( .D(N109), .E(N101), .CP(clk), .Q(data_out[7]) );
  EDFQD1 \data_out_reg[6]  ( .D(N108), .E(N101), .CP(clk), .Q(data_out[6]) );
  EDFQD1 \data_out_reg[5]  ( .D(N107), .E(N101), .CP(clk), .Q(data_out[5]) );
  EDFQD1 \data_out_reg[4]  ( .D(N106), .E(N101), .CP(clk), .Q(data_out[4]) );
  EDFQD1 \data_out_reg[3]  ( .D(N105), .E(N101), .CP(clk), .Q(data_out[3]) );
  EDFQD1 \data_out_reg[2]  ( .D(N104), .E(N101), .CP(clk), .Q(data_out[2]) );
  EDFQD1 \data_out_reg[1]  ( .D(N103), .E(N101), .CP(clk), .Q(data_out[1]) );
  EDFQD1 \data_out_reg[0]  ( .D(N102), .E(N101), .CP(clk), .Q(data_out[0]) );
  EDFQD1 \buffer_reg[7][7]  ( .D(data_in[7]), .E(N137), .CP(clk), .Q(
        \buffer[7][7] ) );
  EDFQD1 \buffer_reg[7][6]  ( .D(data_in[6]), .E(N137), .CP(clk), .Q(
        \buffer[7][6] ) );
  EDFQD1 \buffer_reg[7][5]  ( .D(data_in[5]), .E(N137), .CP(clk), .Q(
        \buffer[7][5] ) );
  EDFQD1 \buffer_reg[7][4]  ( .D(data_in[4]), .E(N137), .CP(clk), .Q(
        \buffer[7][4] ) );
  EDFQD1 \buffer_reg[7][3]  ( .D(data_in[3]), .E(N137), .CP(clk), .Q(
        \buffer[7][3] ) );
  EDFQD1 \buffer_reg[7][2]  ( .D(data_in[2]), .E(N137), .CP(clk), .Q(
        \buffer[7][2] ) );
  EDFQD1 \buffer_reg[7][1]  ( .D(data_in[1]), .E(N137), .CP(clk), .Q(
        \buffer[7][1] ) );
  EDFQD1 \buffer_reg[7][0]  ( .D(data_in[0]), .E(N137), .CP(clk), .Q(
        \buffer[7][0] ) );
  EDFQD1 \buffer_reg[5][7]  ( .D(data_in[7]), .E(N135), .CP(clk), .Q(
        \buffer[5][7] ) );
  EDFQD1 \buffer_reg[5][6]  ( .D(data_in[6]), .E(N135), .CP(clk), .Q(
        \buffer[5][6] ) );
  EDFQD1 \buffer_reg[5][5]  ( .D(data_in[5]), .E(N135), .CP(clk), .Q(
        \buffer[5][5] ) );
  EDFQD1 \buffer_reg[5][4]  ( .D(data_in[4]), .E(N135), .CP(clk), .Q(
        \buffer[5][4] ) );
  EDFQD1 \buffer_reg[5][3]  ( .D(data_in[3]), .E(N135), .CP(clk), .Q(
        \buffer[5][3] ) );
  EDFQD1 \buffer_reg[5][2]  ( .D(data_in[2]), .E(N135), .CP(clk), .Q(
        \buffer[5][2] ) );
  EDFQD1 \buffer_reg[5][1]  ( .D(data_in[1]), .E(N135), .CP(clk), .Q(
        \buffer[5][1] ) );
  EDFQD1 \buffer_reg[5][0]  ( .D(data_in[0]), .E(N135), .CP(clk), .Q(
        \buffer[5][0] ) );
  EDFQD1 \buffer_reg[3][7]  ( .D(data_in[7]), .E(N133), .CP(clk), .Q(
        \buffer[3][7] ) );
  EDFQD1 \buffer_reg[3][6]  ( .D(data_in[6]), .E(N133), .CP(clk), .Q(
        \buffer[3][6] ) );
  EDFQD1 \buffer_reg[3][5]  ( .D(data_in[5]), .E(N133), .CP(clk), .Q(
        \buffer[3][5] ) );
  EDFQD1 \buffer_reg[3][4]  ( .D(data_in[4]), .E(N133), .CP(clk), .Q(
        \buffer[3][4] ) );
  EDFQD1 \buffer_reg[3][3]  ( .D(data_in[3]), .E(N133), .CP(clk), .Q(
        \buffer[3][3] ) );
  EDFQD1 \buffer_reg[3][2]  ( .D(data_in[2]), .E(N133), .CP(clk), .Q(
        \buffer[3][2] ) );
  EDFQD1 \buffer_reg[3][1]  ( .D(data_in[1]), .E(N133), .CP(clk), .Q(
        \buffer[3][1] ) );
  EDFQD1 \buffer_reg[3][0]  ( .D(data_in[0]), .E(N133), .CP(clk), .Q(
        \buffer[3][0] ) );
  EDFQD1 \buffer_reg[1][7]  ( .D(data_in[7]), .E(N131), .CP(clk), .Q(
        \buffer[1][7] ) );
  EDFQD1 \buffer_reg[1][6]  ( .D(data_in[6]), .E(N131), .CP(clk), .Q(
        \buffer[1][6] ) );
  EDFQD1 \buffer_reg[1][5]  ( .D(data_in[5]), .E(N131), .CP(clk), .Q(
        \buffer[1][5] ) );
  EDFQD1 \buffer_reg[1][4]  ( .D(data_in[4]), .E(N131), .CP(clk), .Q(
        \buffer[1][4] ) );
  EDFQD1 \buffer_reg[1][3]  ( .D(data_in[3]), .E(N131), .CP(clk), .Q(
        \buffer[1][3] ) );
  EDFQD1 \buffer_reg[1][2]  ( .D(data_in[2]), .E(N131), .CP(clk), .Q(
        \buffer[1][2] ) );
  EDFQD1 \buffer_reg[1][1]  ( .D(data_in[1]), .E(N131), .CP(clk), .Q(
        \buffer[1][1] ) );
  EDFQD1 \buffer_reg[1][0]  ( .D(data_in[0]), .E(N131), .CP(clk), .Q(
        \buffer[1][0] ) );
  EDFQD1 \buffer_reg[6][7]  ( .D(data_in[7]), .E(N136), .CP(clk), .Q(
        \buffer[6][7] ) );
  EDFQD1 \buffer_reg[6][6]  ( .D(data_in[6]), .E(N136), .CP(clk), .Q(
        \buffer[6][6] ) );
  EDFQD1 \buffer_reg[6][5]  ( .D(data_in[5]), .E(N136), .CP(clk), .Q(
        \buffer[6][5] ) );
  EDFQD1 \buffer_reg[6][4]  ( .D(data_in[4]), .E(N136), .CP(clk), .Q(
        \buffer[6][4] ) );
  EDFQD1 \buffer_reg[6][3]  ( .D(data_in[3]), .E(N136), .CP(clk), .Q(
        \buffer[6][3] ) );
  EDFQD1 \buffer_reg[6][2]  ( .D(data_in[2]), .E(N136), .CP(clk), .Q(
        \buffer[6][2] ) );
  EDFQD1 \buffer_reg[6][1]  ( .D(data_in[1]), .E(N136), .CP(clk), .Q(
        \buffer[6][1] ) );
  EDFQD1 \buffer_reg[6][0]  ( .D(data_in[0]), .E(N136), .CP(clk), .Q(
        \buffer[6][0] ) );
  EDFQD1 \buffer_reg[4][7]  ( .D(data_in[7]), .E(N134), .CP(clk), .Q(
        \buffer[4][7] ) );
  EDFQD1 \buffer_reg[4][6]  ( .D(data_in[6]), .E(N134), .CP(clk), .Q(
        \buffer[4][6] ) );
  EDFQD1 \buffer_reg[4][5]  ( .D(data_in[5]), .E(N134), .CP(clk), .Q(
        \buffer[4][5] ) );
  EDFQD1 \buffer_reg[4][4]  ( .D(data_in[4]), .E(N134), .CP(clk), .Q(
        \buffer[4][4] ) );
  EDFQD1 \buffer_reg[4][3]  ( .D(data_in[3]), .E(N134), .CP(clk), .Q(
        \buffer[4][3] ) );
  EDFQD1 \buffer_reg[4][2]  ( .D(data_in[2]), .E(N134), .CP(clk), .Q(
        \buffer[4][2] ) );
  EDFQD1 \buffer_reg[4][1]  ( .D(data_in[1]), .E(N134), .CP(clk), .Q(
        \buffer[4][1] ) );
  EDFQD1 \buffer_reg[4][0]  ( .D(data_in[0]), .E(N134), .CP(clk), .Q(
        \buffer[4][0] ) );
  EDFQD1 \buffer_reg[2][7]  ( .D(data_in[7]), .E(N132), .CP(clk), .Q(
        \buffer[2][7] ) );
  EDFQD1 \buffer_reg[2][6]  ( .D(data_in[6]), .E(N132), .CP(clk), .Q(
        \buffer[2][6] ) );
  EDFQD1 \buffer_reg[2][5]  ( .D(data_in[5]), .E(N132), .CP(clk), .Q(
        \buffer[2][5] ) );
  EDFQD1 \buffer_reg[2][4]  ( .D(data_in[4]), .E(N132), .CP(clk), .Q(
        \buffer[2][4] ) );
  EDFQD1 \buffer_reg[2][3]  ( .D(data_in[3]), .E(N132), .CP(clk), .Q(
        \buffer[2][3] ) );
  EDFQD1 \buffer_reg[2][2]  ( .D(data_in[2]), .E(N132), .CP(clk), .Q(
        \buffer[2][2] ) );
  EDFQD1 \buffer_reg[2][1]  ( .D(data_in[1]), .E(N132), .CP(clk), .Q(
        \buffer[2][1] ) );
  EDFQD1 \buffer_reg[2][0]  ( .D(data_in[0]), .E(N132), .CP(clk), .Q(
        \buffer[2][0] ) );
  EDFQD1 \buffer_reg[0][7]  ( .D(data_in[7]), .E(N130), .CP(clk), .Q(
        \buffer[0][7] ) );
  EDFQD1 \buffer_reg[0][6]  ( .D(data_in[6]), .E(N130), .CP(clk), .Q(
        \buffer[0][6] ) );
  EDFQD1 \buffer_reg[0][5]  ( .D(data_in[5]), .E(N130), .CP(clk), .Q(
        \buffer[0][5] ) );
  EDFQD1 \buffer_reg[0][4]  ( .D(data_in[4]), .E(N130), .CP(clk), .Q(
        \buffer[0][4] ) );
  EDFQD1 \buffer_reg[0][3]  ( .D(data_in[3]), .E(N130), .CP(clk), .Q(
        \buffer[0][3] ) );
  EDFQD1 \buffer_reg[0][2]  ( .D(data_in[2]), .E(N130), .CP(clk), .Q(
        \buffer[0][2] ) );
  EDFQD1 \buffer_reg[0][1]  ( .D(data_in[1]), .E(N130), .CP(clk), .Q(
        \buffer[0][1] ) );
  EDFQD1 \buffer_reg[0][0]  ( .D(data_in[0]), .E(N130), .CP(clk), .Q(
        \buffer[0][0] ) );
  EDFQD1 \wr_ptr_reg[0]  ( .D(n81), .E(N122), .CP(clk), .Q(wr_ptr[0]) );
  EDFQD1 \count_reg[0]  ( .D(n80), .E(N129), .CP(clk), .Q(count[0]) );
  EDFQD1 \wr_ptr_reg[2]  ( .D(N125), .E(N122), .CP(clk), .Q(wr_ptr[2]) );
  EDFQD1 \count_reg[1]  ( .D(N127), .E(N129), .CP(clk), .Q(count[1]) );
  EDFQD1 \count_reg[2]  ( .D(N128), .E(N129), .CP(clk), .Q(count[2]) );
  EDFQD1 \wr_ptr_reg[1]  ( .D(N124), .E(N122), .CP(clk), .Q(wr_ptr[1]) );
  CKND0 U231 ( .I(n1), .ZN(n80) );
  NR3D0 U232 ( .A1(count[0]), .A2(count[2]), .A3(count[1]), .ZN(empty) );
  INR2D0 U233 ( .A1(N14), .B1(n2), .ZN(N137) );
  NR3D0 U234 ( .A1(n3), .A2(n4), .A3(n5), .ZN(N14) );
  NR3D0 U235 ( .A1(n6), .A2(n3), .A3(n5), .ZN(N136) );
  NR2D0 U236 ( .A1(n7), .A2(n8), .ZN(N135) );
  NR2D0 U237 ( .A1(n6), .A2(n8), .ZN(N134) );
  NR2D0 U238 ( .A1(n7), .A2(n9), .ZN(N133) );
  NR2D0 U239 ( .A1(n6), .A2(n9), .ZN(N132) );
  NR3D0 U240 ( .A1(n7), .A2(wr_ptr[2]), .A3(wr_ptr[1]), .ZN(N131) );
  IND2D0 U241 ( .A1(n2), .B1(wr_ptr[0]), .ZN(n7) );
  NR3D0 U242 ( .A1(n6), .A2(wr_ptr[2]), .A3(wr_ptr[1]), .ZN(N130) );
  CKND2D0 U243 ( .A1(n81), .A2(wr_en), .ZN(n6) );
  CKND0 U244 ( .I(n10), .ZN(n81) );
  OAI211D0 U245 ( .A1(rd_en), .A2(n2), .B(n11), .C(n12), .ZN(N129) );
  OAI22D0 U246 ( .A1(rst), .A2(n13), .B1(n1), .B2(n14), .ZN(N128) );
  MUX2ND0 U247 ( .I0(n15), .I1(count[2]), .S(count[1]), .ZN(n14) );
  NR2D0 U248 ( .A1(count[2]), .A2(n11), .ZN(n15) );
  MUX2ND0 U249 ( .I0(n16), .I1(n17), .S(count[2]), .ZN(n13) );
  MUX2ND0 U250 ( .I0(count[1]), .I1(n18), .S(n19), .ZN(n17) );
  NR3D0 U251 ( .A1(n18), .A2(n19), .A3(n20), .ZN(n16) );
  CKND0 U252 ( .I(n11), .ZN(n19) );
  MUX2ND0 U253 ( .I0(n21), .I1(n1), .S(n22), .ZN(N127) );
  CKXOR2D0 U254 ( .A1(n11), .A2(n20), .Z(n22) );
  CKND0 U255 ( .I(count[1]), .ZN(n20) );
  CKND2D0 U256 ( .A1(rd_en), .A2(n23), .ZN(n11) );
  CKND2D0 U257 ( .A1(n18), .A2(n12), .ZN(n1) );
  CKND0 U258 ( .I(count[0]), .ZN(n18) );
  CKND2D0 U259 ( .A1(count[0]), .A2(n12), .ZN(n21) );
  OAI22D0 U260 ( .A1(n5), .A2(n10), .B1(n24), .B2(n25), .ZN(N125) );
  OA21D0 U261 ( .A1(n9), .A2(n4), .B(n8), .Z(n25) );
  CKND2D0 U262 ( .A1(wr_ptr[2]), .A2(n3), .ZN(n8) );
  CKND0 U263 ( .I(wr_ptr[1]), .ZN(n3) );
  CKND2D0 U264 ( .A1(wr_ptr[1]), .A2(n5), .ZN(n9) );
  CKND0 U265 ( .I(n26), .ZN(n24) );
  CKND0 U266 ( .I(wr_ptr[2]), .ZN(n5) );
  MUX2ND0 U267 ( .I0(n27), .I1(n10), .S(wr_ptr[1]), .ZN(N124) );
  CKND2D0 U268 ( .A1(n26), .A2(n4), .ZN(n10) );
  CKND2D0 U269 ( .A1(wr_ptr[0]), .A2(n26), .ZN(n27) );
  CKND2D0 U270 ( .A1(n12), .A2(n2), .ZN(N122) );
  CKND2D0 U271 ( .A1(wr_en), .A2(n26), .ZN(n2) );
  AN2D0 U272 ( .A1(data_in[19]), .A2(n28), .Z(N121) );
  AN2D0 U273 ( .A1(data_in[18]), .A2(n28), .Z(N120) );
  AN2D0 U274 ( .A1(data_in[17]), .A2(n28), .Z(N119) );
  AN2D0 U275 ( .A1(data_in[16]), .A2(n28), .Z(N118) );
  AN2D0 U276 ( .A1(data_in[15]), .A2(n28), .Z(N117) );
  AN2D0 U277 ( .A1(data_in[14]), .A2(n28), .Z(N116) );
  AN2D0 U278 ( .A1(data_in[13]), .A2(n28), .Z(N115) );
  AN2D0 U279 ( .A1(data_in[12]), .A2(n28), .Z(N114) );
  AN2D0 U280 ( .A1(data_in[11]), .A2(n28), .Z(N113) );
  AN2D0 U281 ( .A1(data_in[10]), .A2(n28), .Z(N112) );
  AN2D0 U282 ( .A1(data_in[9]), .A2(n28), .Z(N111) );
  AN2D0 U283 ( .A1(data_in[8]), .A2(n28), .Z(N110) );
  AO22D0 U284 ( .A1(data_in[7]), .A2(n28), .B1(n29), .B2(n26), .Z(N109) );
  ND4D0 U285 ( .A1(n30), .A2(n31), .A3(n32), .A4(n33), .ZN(n29) );
  AOI22D0 U286 ( .A1(\buffer[6][7] ), .A2(n34), .B1(\buffer[7][7] ), .B2(n35), 
        .ZN(n33) );
  AOI22D0 U287 ( .A1(\buffer[4][7] ), .A2(n36), .B1(\buffer[5][7] ), .B2(n37), 
        .ZN(n32) );
  AOI22D0 U288 ( .A1(\buffer[2][7] ), .A2(n38), .B1(\buffer[3][7] ), .B2(n39), 
        .ZN(n31) );
  AOI22D0 U289 ( .A1(\buffer[0][7] ), .A2(n40), .B1(\buffer[1][7] ), .B2(n41), 
        .ZN(n30) );
  AO22D0 U290 ( .A1(data_in[6]), .A2(n28), .B1(n42), .B2(n26), .Z(N108) );
  ND4D0 U291 ( .A1(n43), .A2(n44), .A3(n45), .A4(n46), .ZN(n42) );
  AOI22D0 U292 ( .A1(\buffer[6][6] ), .A2(n34), .B1(\buffer[7][6] ), .B2(n35), 
        .ZN(n46) );
  AOI22D0 U293 ( .A1(\buffer[4][6] ), .A2(n36), .B1(\buffer[5][6] ), .B2(n37), 
        .ZN(n45) );
  AOI22D0 U294 ( .A1(\buffer[2][6] ), .A2(n38), .B1(\buffer[3][6] ), .B2(n39), 
        .ZN(n44) );
  AOI22D0 U295 ( .A1(\buffer[0][6] ), .A2(n40), .B1(\buffer[1][6] ), .B2(n41), 
        .ZN(n43) );
  AO22D0 U296 ( .A1(data_in[5]), .A2(n28), .B1(n47), .B2(n26), .Z(N107) );
  ND4D0 U297 ( .A1(n48), .A2(n49), .A3(n50), .A4(n51), .ZN(n47) );
  AOI22D0 U298 ( .A1(\buffer[6][5] ), .A2(n34), .B1(\buffer[7][5] ), .B2(n35), 
        .ZN(n51) );
  AOI22D0 U299 ( .A1(\buffer[4][5] ), .A2(n36), .B1(\buffer[5][5] ), .B2(n37), 
        .ZN(n50) );
  AOI22D0 U300 ( .A1(\buffer[2][5] ), .A2(n38), .B1(\buffer[3][5] ), .B2(n39), 
        .ZN(n49) );
  AOI22D0 U301 ( .A1(\buffer[0][5] ), .A2(n40), .B1(\buffer[1][5] ), .B2(n41), 
        .ZN(n48) );
  AO22D0 U302 ( .A1(data_in[4]), .A2(n28), .B1(n52), .B2(n26), .Z(N106) );
  ND4D0 U303 ( .A1(n53), .A2(n54), .A3(n55), .A4(n56), .ZN(n52) );
  AOI22D0 U304 ( .A1(\buffer[6][4] ), .A2(n34), .B1(\buffer[7][4] ), .B2(n35), 
        .ZN(n56) );
  AOI22D0 U305 ( .A1(\buffer[4][4] ), .A2(n36), .B1(\buffer[5][4] ), .B2(n37), 
        .ZN(n55) );
  AOI22D0 U306 ( .A1(\buffer[2][4] ), .A2(n38), .B1(\buffer[3][4] ), .B2(n39), 
        .ZN(n54) );
  AOI22D0 U307 ( .A1(\buffer[0][4] ), .A2(n40), .B1(\buffer[1][4] ), .B2(n41), 
        .ZN(n53) );
  AO22D0 U308 ( .A1(data_in[3]), .A2(n28), .B1(n57), .B2(n26), .Z(N105) );
  ND4D0 U309 ( .A1(n58), .A2(n59), .A3(n60), .A4(n61), .ZN(n57) );
  AOI22D0 U310 ( .A1(\buffer[6][3] ), .A2(n34), .B1(\buffer[7][3] ), .B2(n35), 
        .ZN(n61) );
  AOI22D0 U311 ( .A1(\buffer[4][3] ), .A2(n36), .B1(\buffer[5][3] ), .B2(n37), 
        .ZN(n60) );
  AOI22D0 U312 ( .A1(\buffer[2][3] ), .A2(n38), .B1(\buffer[3][3] ), .B2(n39), 
        .ZN(n59) );
  AOI22D0 U313 ( .A1(\buffer[0][3] ), .A2(n40), .B1(\buffer[1][3] ), .B2(n41), 
        .ZN(n58) );
  AO22D0 U314 ( .A1(data_in[2]), .A2(n28), .B1(n62), .B2(n26), .Z(N104) );
  ND4D0 U315 ( .A1(n63), .A2(n64), .A3(n65), .A4(n66), .ZN(n62) );
  AOI22D0 U316 ( .A1(\buffer[6][2] ), .A2(n34), .B1(\buffer[7][2] ), .B2(n35), 
        .ZN(n66) );
  AOI22D0 U317 ( .A1(\buffer[4][2] ), .A2(n36), .B1(\buffer[5][2] ), .B2(n37), 
        .ZN(n65) );
  AOI22D0 U318 ( .A1(\buffer[2][2] ), .A2(n38), .B1(\buffer[3][2] ), .B2(n39), 
        .ZN(n64) );
  AOI22D0 U319 ( .A1(\buffer[0][2] ), .A2(n40), .B1(\buffer[1][2] ), .B2(n41), 
        .ZN(n63) );
  AO22D0 U320 ( .A1(data_in[1]), .A2(n28), .B1(n67), .B2(n26), .Z(N103) );
  ND4D0 U321 ( .A1(n68), .A2(n69), .A3(n70), .A4(n71), .ZN(n67) );
  AOI22D0 U322 ( .A1(\buffer[6][1] ), .A2(n34), .B1(\buffer[7][1] ), .B2(n35), 
        .ZN(n71) );
  AOI22D0 U323 ( .A1(\buffer[4][1] ), .A2(n36), .B1(\buffer[5][1] ), .B2(n37), 
        .ZN(n70) );
  AOI22D0 U324 ( .A1(\buffer[2][1] ), .A2(n38), .B1(\buffer[3][1] ), .B2(n39), 
        .ZN(n69) );
  AOI22D0 U325 ( .A1(\buffer[0][1] ), .A2(n40), .B1(\buffer[1][1] ), .B2(n41), 
        .ZN(n68) );
  AO22D0 U326 ( .A1(data_in[0]), .A2(n28), .B1(n72), .B2(n26), .Z(N102) );
  OAI21D0 U327 ( .A1(rst), .A2(n73), .B(N101), .ZN(n26) );
  ND4D0 U328 ( .A1(n74), .A2(n75), .A3(n76), .A4(n77), .ZN(n72) );
  AOI22D0 U329 ( .A1(\buffer[6][0] ), .A2(n34), .B1(\buffer[7][0] ), .B2(n35), 
        .ZN(n77) );
  INR3D0 U330 ( .A1(rd_ptr[2]), .B1(n78), .B2(n79), .ZN(n35) );
  INR3D0 U331 ( .A1(rd_ptr[2]), .B1(n78), .B2(rd_ptr[0]), .ZN(n34) );
  AOI22D0 U332 ( .A1(\buffer[4][0] ), .A2(n36), .B1(\buffer[5][0] ), .B2(n37), 
        .ZN(n76) );
  INR3D0 U333 ( .A1(rd_ptr[2]), .B1(n79), .B2(rd_ptr[1]), .ZN(n37) );
  INR3D0 U334 ( .A1(rd_ptr[2]), .B1(rd_ptr[0]), .B2(rd_ptr[1]), .ZN(n36) );
  AOI22D0 U335 ( .A1(\buffer[2][0] ), .A2(n38), .B1(\buffer[3][0] ), .B2(n39), 
        .ZN(n75) );
  NR3D0 U336 ( .A1(n79), .A2(rd_ptr[2]), .A3(n78), .ZN(n39) );
  NR3D0 U337 ( .A1(rd_ptr[0]), .A2(rd_ptr[2]), .A3(n78), .ZN(n38) );
  CKND0 U338 ( .I(rd_ptr[1]), .ZN(n78) );
  AOI22D0 U339 ( .A1(\buffer[0][0] ), .A2(n40), .B1(\buffer[1][0] ), .B2(n41), 
        .ZN(n74) );
  NR3D0 U340 ( .A1(rd_ptr[1]), .A2(rd_ptr[2]), .A3(n79), .ZN(n41) );
  NR3D0 U341 ( .A1(rd_ptr[1]), .A2(rd_ptr[2]), .A3(rd_ptr[0]), .ZN(n40) );
  AN3D0 U342 ( .A1(rd_en), .A2(n12), .A3(n73), .Z(n28) );
  NR3D0 U343 ( .A1(n23), .A2(n79), .A3(n4), .ZN(n73) );
  CKND0 U344 ( .I(wr_ptr[0]), .ZN(n4) );
  CKND0 U345 ( .I(rd_ptr[0]), .ZN(n79) );
  CKND0 U346 ( .I(wr_en), .ZN(n23) );
  CKND0 U347 ( .I(rst), .ZN(n12) );
  OR2D0 U348 ( .A1(rd_en), .A2(rst), .Z(N101) );
endmodule


module allocation_buffer_3 ( clk, rst, data_in, data_out, full, empty, rd_ptr, 
        wr_en, rd_en );
  input [19:0] data_in;
  output [19:0] data_out;
  input [2:0] rd_ptr;
  input clk, rst, wr_en, rd_en;
  output full, empty;
  wire   N14, \buffer[7][7] , \buffer[7][6] , \buffer[7][5] , \buffer[7][4] ,
         \buffer[7][3] , \buffer[7][2] , \buffer[7][1] , \buffer[7][0] ,
         \buffer[6][7] , \buffer[6][6] , \buffer[6][5] , \buffer[6][4] ,
         \buffer[6][3] , \buffer[6][2] , \buffer[6][1] , \buffer[6][0] ,
         \buffer[5][7] , \buffer[5][6] , \buffer[5][5] , \buffer[5][4] ,
         \buffer[5][3] , \buffer[5][2] , \buffer[5][1] , \buffer[5][0] ,
         \buffer[4][7] , \buffer[4][6] , \buffer[4][5] , \buffer[4][4] ,
         \buffer[4][3] , \buffer[4][2] , \buffer[4][1] , \buffer[4][0] ,
         \buffer[3][7] , \buffer[3][6] , \buffer[3][5] , \buffer[3][4] ,
         \buffer[3][3] , \buffer[3][2] , \buffer[3][1] , \buffer[3][0] ,
         \buffer[2][7] , \buffer[2][6] , \buffer[2][5] , \buffer[2][4] ,
         \buffer[2][3] , \buffer[2][2] , \buffer[2][1] , \buffer[2][0] ,
         \buffer[1][7] , \buffer[1][6] , \buffer[1][5] , \buffer[1][4] ,
         \buffer[1][3] , \buffer[1][2] , \buffer[1][1] , \buffer[1][0] ,
         \buffer[0][7] , \buffer[0][6] , \buffer[0][5] , \buffer[0][4] ,
         \buffer[0][3] , \buffer[0][2] , \buffer[0][1] , \buffer[0][0] , N101,
         N102, N103, N104, N105, N106, N107, N108, N109, N110, N111, N112,
         N113, N114, N115, N116, N117, N118, N119, N120, N121, N122, N124,
         N125, N127, N128, N129, N130, N131, N132, N133, N134, N135, N136,
         N137, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14,
         n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28,
         n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42,
         n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56,
         n57, n58, n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70,
         n71, n72, n73, n74, n75, n76, n77, n78, n79, n80, n81;
  wire   [2:0] wr_ptr;
  wire   [2:0] count;
  assign full = N14;

  EDFQD1 \data_out_reg[19]  ( .D(N121), .E(N101), .CP(clk), .Q(data_out[19])
         );
  EDFQD1 \data_out_reg[18]  ( .D(N120), .E(N101), .CP(clk), .Q(data_out[18])
         );
  EDFQD1 \data_out_reg[17]  ( .D(N119), .E(N101), .CP(clk), .Q(data_out[17])
         );
  EDFQD1 \data_out_reg[16]  ( .D(N118), .E(N101), .CP(clk), .Q(data_out[16])
         );
  EDFQD1 \data_out_reg[15]  ( .D(N117), .E(N101), .CP(clk), .Q(data_out[15])
         );
  EDFQD1 \data_out_reg[14]  ( .D(N116), .E(N101), .CP(clk), .Q(data_out[14])
         );
  EDFQD1 \data_out_reg[13]  ( .D(N115), .E(N101), .CP(clk), .Q(data_out[13])
         );
  EDFQD1 \data_out_reg[12]  ( .D(N114), .E(N101), .CP(clk), .Q(data_out[12])
         );
  EDFQD1 \data_out_reg[11]  ( .D(N113), .E(N101), .CP(clk), .Q(data_out[11])
         );
  EDFQD1 \data_out_reg[10]  ( .D(N112), .E(N101), .CP(clk), .Q(data_out[10])
         );
  EDFQD1 \data_out_reg[9]  ( .D(N111), .E(N101), .CP(clk), .Q(data_out[9]) );
  EDFQD1 \data_out_reg[8]  ( .D(N110), .E(N101), .CP(clk), .Q(data_out[8]) );
  EDFQD1 \data_out_reg[7]  ( .D(N109), .E(N101), .CP(clk), .Q(data_out[7]) );
  EDFQD1 \data_out_reg[6]  ( .D(N108), .E(N101), .CP(clk), .Q(data_out[6]) );
  EDFQD1 \data_out_reg[5]  ( .D(N107), .E(N101), .CP(clk), .Q(data_out[5]) );
  EDFQD1 \data_out_reg[4]  ( .D(N106), .E(N101), .CP(clk), .Q(data_out[4]) );
  EDFQD1 \data_out_reg[3]  ( .D(N105), .E(N101), .CP(clk), .Q(data_out[3]) );
  EDFQD1 \data_out_reg[2]  ( .D(N104), .E(N101), .CP(clk), .Q(data_out[2]) );
  EDFQD1 \data_out_reg[1]  ( .D(N103), .E(N101), .CP(clk), .Q(data_out[1]) );
  EDFQD1 \data_out_reg[0]  ( .D(N102), .E(N101), .CP(clk), .Q(data_out[0]) );
  EDFQD1 \buffer_reg[7][7]  ( .D(data_in[7]), .E(N137), .CP(clk), .Q(
        \buffer[7][7] ) );
  EDFQD1 \buffer_reg[7][6]  ( .D(data_in[6]), .E(N137), .CP(clk), .Q(
        \buffer[7][6] ) );
  EDFQD1 \buffer_reg[7][5]  ( .D(data_in[5]), .E(N137), .CP(clk), .Q(
        \buffer[7][5] ) );
  EDFQD1 \buffer_reg[7][4]  ( .D(data_in[4]), .E(N137), .CP(clk), .Q(
        \buffer[7][4] ) );
  EDFQD1 \buffer_reg[7][3]  ( .D(data_in[3]), .E(N137), .CP(clk), .Q(
        \buffer[7][3] ) );
  EDFQD1 \buffer_reg[7][2]  ( .D(data_in[2]), .E(N137), .CP(clk), .Q(
        \buffer[7][2] ) );
  EDFQD1 \buffer_reg[7][1]  ( .D(data_in[1]), .E(N137), .CP(clk), .Q(
        \buffer[7][1] ) );
  EDFQD1 \buffer_reg[7][0]  ( .D(data_in[0]), .E(N137), .CP(clk), .Q(
        \buffer[7][0] ) );
  EDFQD1 \buffer_reg[5][7]  ( .D(data_in[7]), .E(N135), .CP(clk), .Q(
        \buffer[5][7] ) );
  EDFQD1 \buffer_reg[5][6]  ( .D(data_in[6]), .E(N135), .CP(clk), .Q(
        \buffer[5][6] ) );
  EDFQD1 \buffer_reg[5][5]  ( .D(data_in[5]), .E(N135), .CP(clk), .Q(
        \buffer[5][5] ) );
  EDFQD1 \buffer_reg[5][4]  ( .D(data_in[4]), .E(N135), .CP(clk), .Q(
        \buffer[5][4] ) );
  EDFQD1 \buffer_reg[5][3]  ( .D(data_in[3]), .E(N135), .CP(clk), .Q(
        \buffer[5][3] ) );
  EDFQD1 \buffer_reg[5][2]  ( .D(data_in[2]), .E(N135), .CP(clk), .Q(
        \buffer[5][2] ) );
  EDFQD1 \buffer_reg[5][1]  ( .D(data_in[1]), .E(N135), .CP(clk), .Q(
        \buffer[5][1] ) );
  EDFQD1 \buffer_reg[5][0]  ( .D(data_in[0]), .E(N135), .CP(clk), .Q(
        \buffer[5][0] ) );
  EDFQD1 \buffer_reg[3][7]  ( .D(data_in[7]), .E(N133), .CP(clk), .Q(
        \buffer[3][7] ) );
  EDFQD1 \buffer_reg[3][6]  ( .D(data_in[6]), .E(N133), .CP(clk), .Q(
        \buffer[3][6] ) );
  EDFQD1 \buffer_reg[3][5]  ( .D(data_in[5]), .E(N133), .CP(clk), .Q(
        \buffer[3][5] ) );
  EDFQD1 \buffer_reg[3][4]  ( .D(data_in[4]), .E(N133), .CP(clk), .Q(
        \buffer[3][4] ) );
  EDFQD1 \buffer_reg[3][3]  ( .D(data_in[3]), .E(N133), .CP(clk), .Q(
        \buffer[3][3] ) );
  EDFQD1 \buffer_reg[3][2]  ( .D(data_in[2]), .E(N133), .CP(clk), .Q(
        \buffer[3][2] ) );
  EDFQD1 \buffer_reg[3][1]  ( .D(data_in[1]), .E(N133), .CP(clk), .Q(
        \buffer[3][1] ) );
  EDFQD1 \buffer_reg[3][0]  ( .D(data_in[0]), .E(N133), .CP(clk), .Q(
        \buffer[3][0] ) );
  EDFQD1 \buffer_reg[1][7]  ( .D(data_in[7]), .E(N131), .CP(clk), .Q(
        \buffer[1][7] ) );
  EDFQD1 \buffer_reg[1][6]  ( .D(data_in[6]), .E(N131), .CP(clk), .Q(
        \buffer[1][6] ) );
  EDFQD1 \buffer_reg[1][5]  ( .D(data_in[5]), .E(N131), .CP(clk), .Q(
        \buffer[1][5] ) );
  EDFQD1 \buffer_reg[1][4]  ( .D(data_in[4]), .E(N131), .CP(clk), .Q(
        \buffer[1][4] ) );
  EDFQD1 \buffer_reg[1][3]  ( .D(data_in[3]), .E(N131), .CP(clk), .Q(
        \buffer[1][3] ) );
  EDFQD1 \buffer_reg[1][2]  ( .D(data_in[2]), .E(N131), .CP(clk), .Q(
        \buffer[1][2] ) );
  EDFQD1 \buffer_reg[1][1]  ( .D(data_in[1]), .E(N131), .CP(clk), .Q(
        \buffer[1][1] ) );
  EDFQD1 \buffer_reg[1][0]  ( .D(data_in[0]), .E(N131), .CP(clk), .Q(
        \buffer[1][0] ) );
  EDFQD1 \buffer_reg[6][7]  ( .D(data_in[7]), .E(N136), .CP(clk), .Q(
        \buffer[6][7] ) );
  EDFQD1 \buffer_reg[6][6]  ( .D(data_in[6]), .E(N136), .CP(clk), .Q(
        \buffer[6][6] ) );
  EDFQD1 \buffer_reg[6][5]  ( .D(data_in[5]), .E(N136), .CP(clk), .Q(
        \buffer[6][5] ) );
  EDFQD1 \buffer_reg[6][4]  ( .D(data_in[4]), .E(N136), .CP(clk), .Q(
        \buffer[6][4] ) );
  EDFQD1 \buffer_reg[6][3]  ( .D(data_in[3]), .E(N136), .CP(clk), .Q(
        \buffer[6][3] ) );
  EDFQD1 \buffer_reg[6][2]  ( .D(data_in[2]), .E(N136), .CP(clk), .Q(
        \buffer[6][2] ) );
  EDFQD1 \buffer_reg[6][1]  ( .D(data_in[1]), .E(N136), .CP(clk), .Q(
        \buffer[6][1] ) );
  EDFQD1 \buffer_reg[6][0]  ( .D(data_in[0]), .E(N136), .CP(clk), .Q(
        \buffer[6][0] ) );
  EDFQD1 \buffer_reg[4][7]  ( .D(data_in[7]), .E(N134), .CP(clk), .Q(
        \buffer[4][7] ) );
  EDFQD1 \buffer_reg[4][6]  ( .D(data_in[6]), .E(N134), .CP(clk), .Q(
        \buffer[4][6] ) );
  EDFQD1 \buffer_reg[4][5]  ( .D(data_in[5]), .E(N134), .CP(clk), .Q(
        \buffer[4][5] ) );
  EDFQD1 \buffer_reg[4][4]  ( .D(data_in[4]), .E(N134), .CP(clk), .Q(
        \buffer[4][4] ) );
  EDFQD1 \buffer_reg[4][3]  ( .D(data_in[3]), .E(N134), .CP(clk), .Q(
        \buffer[4][3] ) );
  EDFQD1 \buffer_reg[4][2]  ( .D(data_in[2]), .E(N134), .CP(clk), .Q(
        \buffer[4][2] ) );
  EDFQD1 \buffer_reg[4][1]  ( .D(data_in[1]), .E(N134), .CP(clk), .Q(
        \buffer[4][1] ) );
  EDFQD1 \buffer_reg[4][0]  ( .D(data_in[0]), .E(N134), .CP(clk), .Q(
        \buffer[4][0] ) );
  EDFQD1 \buffer_reg[2][7]  ( .D(data_in[7]), .E(N132), .CP(clk), .Q(
        \buffer[2][7] ) );
  EDFQD1 \buffer_reg[2][6]  ( .D(data_in[6]), .E(N132), .CP(clk), .Q(
        \buffer[2][6] ) );
  EDFQD1 \buffer_reg[2][5]  ( .D(data_in[5]), .E(N132), .CP(clk), .Q(
        \buffer[2][5] ) );
  EDFQD1 \buffer_reg[2][4]  ( .D(data_in[4]), .E(N132), .CP(clk), .Q(
        \buffer[2][4] ) );
  EDFQD1 \buffer_reg[2][3]  ( .D(data_in[3]), .E(N132), .CP(clk), .Q(
        \buffer[2][3] ) );
  EDFQD1 \buffer_reg[2][2]  ( .D(data_in[2]), .E(N132), .CP(clk), .Q(
        \buffer[2][2] ) );
  EDFQD1 \buffer_reg[2][1]  ( .D(data_in[1]), .E(N132), .CP(clk), .Q(
        \buffer[2][1] ) );
  EDFQD1 \buffer_reg[2][0]  ( .D(data_in[0]), .E(N132), .CP(clk), .Q(
        \buffer[2][0] ) );
  EDFQD1 \buffer_reg[0][7]  ( .D(data_in[7]), .E(N130), .CP(clk), .Q(
        \buffer[0][7] ) );
  EDFQD1 \buffer_reg[0][6]  ( .D(data_in[6]), .E(N130), .CP(clk), .Q(
        \buffer[0][6] ) );
  EDFQD1 \buffer_reg[0][5]  ( .D(data_in[5]), .E(N130), .CP(clk), .Q(
        \buffer[0][5] ) );
  EDFQD1 \buffer_reg[0][4]  ( .D(data_in[4]), .E(N130), .CP(clk), .Q(
        \buffer[0][4] ) );
  EDFQD1 \buffer_reg[0][3]  ( .D(data_in[3]), .E(N130), .CP(clk), .Q(
        \buffer[0][3] ) );
  EDFQD1 \buffer_reg[0][2]  ( .D(data_in[2]), .E(N130), .CP(clk), .Q(
        \buffer[0][2] ) );
  EDFQD1 \buffer_reg[0][1]  ( .D(data_in[1]), .E(N130), .CP(clk), .Q(
        \buffer[0][1] ) );
  EDFQD1 \buffer_reg[0][0]  ( .D(data_in[0]), .E(N130), .CP(clk), .Q(
        \buffer[0][0] ) );
  EDFQD1 \wr_ptr_reg[0]  ( .D(n81), .E(N122), .CP(clk), .Q(wr_ptr[0]) );
  EDFQD1 \count_reg[0]  ( .D(n80), .E(N129), .CP(clk), .Q(count[0]) );
  EDFQD1 \wr_ptr_reg[2]  ( .D(N125), .E(N122), .CP(clk), .Q(wr_ptr[2]) );
  EDFQD1 \count_reg[1]  ( .D(N127), .E(N129), .CP(clk), .Q(count[1]) );
  EDFQD1 \count_reg[2]  ( .D(N128), .E(N129), .CP(clk), .Q(count[2]) );
  EDFQD1 \wr_ptr_reg[1]  ( .D(N124), .E(N122), .CP(clk), .Q(wr_ptr[1]) );
  CKND0 U231 ( .I(n1), .ZN(n80) );
  NR3D0 U232 ( .A1(count[0]), .A2(count[2]), .A3(count[1]), .ZN(empty) );
  INR2D0 U233 ( .A1(N14), .B1(n2), .ZN(N137) );
  NR3D0 U234 ( .A1(n3), .A2(n4), .A3(n5), .ZN(N14) );
  NR3D0 U235 ( .A1(n6), .A2(n3), .A3(n5), .ZN(N136) );
  NR2D0 U236 ( .A1(n7), .A2(n8), .ZN(N135) );
  NR2D0 U237 ( .A1(n6), .A2(n8), .ZN(N134) );
  NR2D0 U238 ( .A1(n7), .A2(n9), .ZN(N133) );
  NR2D0 U239 ( .A1(n6), .A2(n9), .ZN(N132) );
  NR3D0 U240 ( .A1(n7), .A2(wr_ptr[2]), .A3(wr_ptr[1]), .ZN(N131) );
  IND2D0 U241 ( .A1(n2), .B1(wr_ptr[0]), .ZN(n7) );
  NR3D0 U242 ( .A1(n6), .A2(wr_ptr[2]), .A3(wr_ptr[1]), .ZN(N130) );
  CKND2D0 U243 ( .A1(n81), .A2(wr_en), .ZN(n6) );
  CKND0 U244 ( .I(n10), .ZN(n81) );
  OAI211D0 U245 ( .A1(rd_en), .A2(n2), .B(n11), .C(n12), .ZN(N129) );
  OAI22D0 U246 ( .A1(rst), .A2(n13), .B1(n1), .B2(n14), .ZN(N128) );
  MUX2ND0 U247 ( .I0(n15), .I1(count[2]), .S(count[1]), .ZN(n14) );
  NR2D0 U248 ( .A1(count[2]), .A2(n11), .ZN(n15) );
  MUX2ND0 U249 ( .I0(n16), .I1(n17), .S(count[2]), .ZN(n13) );
  MUX2ND0 U250 ( .I0(count[1]), .I1(n18), .S(n19), .ZN(n17) );
  NR3D0 U251 ( .A1(n18), .A2(n19), .A3(n20), .ZN(n16) );
  CKND0 U252 ( .I(n11), .ZN(n19) );
  MUX2ND0 U253 ( .I0(n21), .I1(n1), .S(n22), .ZN(N127) );
  CKXOR2D0 U254 ( .A1(n11), .A2(n20), .Z(n22) );
  CKND0 U255 ( .I(count[1]), .ZN(n20) );
  CKND2D0 U256 ( .A1(rd_en), .A2(n23), .ZN(n11) );
  CKND2D0 U257 ( .A1(n18), .A2(n12), .ZN(n1) );
  CKND0 U258 ( .I(count[0]), .ZN(n18) );
  CKND2D0 U259 ( .A1(count[0]), .A2(n12), .ZN(n21) );
  OAI22D0 U260 ( .A1(n5), .A2(n10), .B1(n24), .B2(n25), .ZN(N125) );
  OA21D0 U261 ( .A1(n9), .A2(n4), .B(n8), .Z(n25) );
  CKND2D0 U262 ( .A1(wr_ptr[2]), .A2(n3), .ZN(n8) );
  CKND0 U263 ( .I(wr_ptr[1]), .ZN(n3) );
  CKND2D0 U264 ( .A1(wr_ptr[1]), .A2(n5), .ZN(n9) );
  CKND0 U265 ( .I(n26), .ZN(n24) );
  CKND0 U266 ( .I(wr_ptr[2]), .ZN(n5) );
  MUX2ND0 U267 ( .I0(n27), .I1(n10), .S(wr_ptr[1]), .ZN(N124) );
  CKND2D0 U268 ( .A1(n26), .A2(n4), .ZN(n10) );
  CKND2D0 U269 ( .A1(wr_ptr[0]), .A2(n26), .ZN(n27) );
  CKND2D0 U270 ( .A1(n12), .A2(n2), .ZN(N122) );
  CKND2D0 U271 ( .A1(wr_en), .A2(n26), .ZN(n2) );
  AN2D0 U272 ( .A1(data_in[19]), .A2(n28), .Z(N121) );
  AN2D0 U273 ( .A1(data_in[18]), .A2(n28), .Z(N120) );
  AN2D0 U274 ( .A1(data_in[17]), .A2(n28), .Z(N119) );
  AN2D0 U275 ( .A1(data_in[16]), .A2(n28), .Z(N118) );
  AN2D0 U276 ( .A1(data_in[15]), .A2(n28), .Z(N117) );
  AN2D0 U277 ( .A1(data_in[14]), .A2(n28), .Z(N116) );
  AN2D0 U278 ( .A1(data_in[13]), .A2(n28), .Z(N115) );
  AN2D0 U279 ( .A1(data_in[12]), .A2(n28), .Z(N114) );
  AN2D0 U280 ( .A1(data_in[11]), .A2(n28), .Z(N113) );
  AN2D0 U281 ( .A1(data_in[10]), .A2(n28), .Z(N112) );
  AN2D0 U282 ( .A1(data_in[9]), .A2(n28), .Z(N111) );
  AN2D0 U283 ( .A1(data_in[8]), .A2(n28), .Z(N110) );
  AO22D0 U284 ( .A1(data_in[7]), .A2(n28), .B1(n29), .B2(n26), .Z(N109) );
  ND4D0 U285 ( .A1(n30), .A2(n31), .A3(n32), .A4(n33), .ZN(n29) );
  AOI22D0 U286 ( .A1(\buffer[6][7] ), .A2(n34), .B1(\buffer[7][7] ), .B2(n35), 
        .ZN(n33) );
  AOI22D0 U287 ( .A1(\buffer[4][7] ), .A2(n36), .B1(\buffer[5][7] ), .B2(n37), 
        .ZN(n32) );
  AOI22D0 U288 ( .A1(\buffer[2][7] ), .A2(n38), .B1(\buffer[3][7] ), .B2(n39), 
        .ZN(n31) );
  AOI22D0 U289 ( .A1(\buffer[0][7] ), .A2(n40), .B1(\buffer[1][7] ), .B2(n41), 
        .ZN(n30) );
  AO22D0 U290 ( .A1(data_in[6]), .A2(n28), .B1(n42), .B2(n26), .Z(N108) );
  ND4D0 U291 ( .A1(n43), .A2(n44), .A3(n45), .A4(n46), .ZN(n42) );
  AOI22D0 U292 ( .A1(\buffer[6][6] ), .A2(n34), .B1(\buffer[7][6] ), .B2(n35), 
        .ZN(n46) );
  AOI22D0 U293 ( .A1(\buffer[4][6] ), .A2(n36), .B1(\buffer[5][6] ), .B2(n37), 
        .ZN(n45) );
  AOI22D0 U294 ( .A1(\buffer[2][6] ), .A2(n38), .B1(\buffer[3][6] ), .B2(n39), 
        .ZN(n44) );
  AOI22D0 U295 ( .A1(\buffer[0][6] ), .A2(n40), .B1(\buffer[1][6] ), .B2(n41), 
        .ZN(n43) );
  AO22D0 U296 ( .A1(data_in[5]), .A2(n28), .B1(n47), .B2(n26), .Z(N107) );
  ND4D0 U297 ( .A1(n48), .A2(n49), .A3(n50), .A4(n51), .ZN(n47) );
  AOI22D0 U298 ( .A1(\buffer[6][5] ), .A2(n34), .B1(\buffer[7][5] ), .B2(n35), 
        .ZN(n51) );
  AOI22D0 U299 ( .A1(\buffer[4][5] ), .A2(n36), .B1(\buffer[5][5] ), .B2(n37), 
        .ZN(n50) );
  AOI22D0 U300 ( .A1(\buffer[2][5] ), .A2(n38), .B1(\buffer[3][5] ), .B2(n39), 
        .ZN(n49) );
  AOI22D0 U301 ( .A1(\buffer[0][5] ), .A2(n40), .B1(\buffer[1][5] ), .B2(n41), 
        .ZN(n48) );
  AO22D0 U302 ( .A1(data_in[4]), .A2(n28), .B1(n52), .B2(n26), .Z(N106) );
  ND4D0 U303 ( .A1(n53), .A2(n54), .A3(n55), .A4(n56), .ZN(n52) );
  AOI22D0 U304 ( .A1(\buffer[6][4] ), .A2(n34), .B1(\buffer[7][4] ), .B2(n35), 
        .ZN(n56) );
  AOI22D0 U305 ( .A1(\buffer[4][4] ), .A2(n36), .B1(\buffer[5][4] ), .B2(n37), 
        .ZN(n55) );
  AOI22D0 U306 ( .A1(\buffer[2][4] ), .A2(n38), .B1(\buffer[3][4] ), .B2(n39), 
        .ZN(n54) );
  AOI22D0 U307 ( .A1(\buffer[0][4] ), .A2(n40), .B1(\buffer[1][4] ), .B2(n41), 
        .ZN(n53) );
  AO22D0 U308 ( .A1(data_in[3]), .A2(n28), .B1(n57), .B2(n26), .Z(N105) );
  ND4D0 U309 ( .A1(n58), .A2(n59), .A3(n60), .A4(n61), .ZN(n57) );
  AOI22D0 U310 ( .A1(\buffer[6][3] ), .A2(n34), .B1(\buffer[7][3] ), .B2(n35), 
        .ZN(n61) );
  AOI22D0 U311 ( .A1(\buffer[4][3] ), .A2(n36), .B1(\buffer[5][3] ), .B2(n37), 
        .ZN(n60) );
  AOI22D0 U312 ( .A1(\buffer[2][3] ), .A2(n38), .B1(\buffer[3][3] ), .B2(n39), 
        .ZN(n59) );
  AOI22D0 U313 ( .A1(\buffer[0][3] ), .A2(n40), .B1(\buffer[1][3] ), .B2(n41), 
        .ZN(n58) );
  AO22D0 U314 ( .A1(data_in[2]), .A2(n28), .B1(n62), .B2(n26), .Z(N104) );
  ND4D0 U315 ( .A1(n63), .A2(n64), .A3(n65), .A4(n66), .ZN(n62) );
  AOI22D0 U316 ( .A1(\buffer[6][2] ), .A2(n34), .B1(\buffer[7][2] ), .B2(n35), 
        .ZN(n66) );
  AOI22D0 U317 ( .A1(\buffer[4][2] ), .A2(n36), .B1(\buffer[5][2] ), .B2(n37), 
        .ZN(n65) );
  AOI22D0 U318 ( .A1(\buffer[2][2] ), .A2(n38), .B1(\buffer[3][2] ), .B2(n39), 
        .ZN(n64) );
  AOI22D0 U319 ( .A1(\buffer[0][2] ), .A2(n40), .B1(\buffer[1][2] ), .B2(n41), 
        .ZN(n63) );
  AO22D0 U320 ( .A1(data_in[1]), .A2(n28), .B1(n67), .B2(n26), .Z(N103) );
  ND4D0 U321 ( .A1(n68), .A2(n69), .A3(n70), .A4(n71), .ZN(n67) );
  AOI22D0 U322 ( .A1(\buffer[6][1] ), .A2(n34), .B1(\buffer[7][1] ), .B2(n35), 
        .ZN(n71) );
  AOI22D0 U323 ( .A1(\buffer[4][1] ), .A2(n36), .B1(\buffer[5][1] ), .B2(n37), 
        .ZN(n70) );
  AOI22D0 U324 ( .A1(\buffer[2][1] ), .A2(n38), .B1(\buffer[3][1] ), .B2(n39), 
        .ZN(n69) );
  AOI22D0 U325 ( .A1(\buffer[0][1] ), .A2(n40), .B1(\buffer[1][1] ), .B2(n41), 
        .ZN(n68) );
  AO22D0 U326 ( .A1(data_in[0]), .A2(n28), .B1(n72), .B2(n26), .Z(N102) );
  OAI21D0 U327 ( .A1(rst), .A2(n73), .B(N101), .ZN(n26) );
  ND4D0 U328 ( .A1(n74), .A2(n75), .A3(n76), .A4(n77), .ZN(n72) );
  AOI22D0 U329 ( .A1(\buffer[6][0] ), .A2(n34), .B1(\buffer[7][0] ), .B2(n35), 
        .ZN(n77) );
  INR3D0 U330 ( .A1(rd_ptr[2]), .B1(n78), .B2(n79), .ZN(n35) );
  INR3D0 U331 ( .A1(rd_ptr[2]), .B1(n78), .B2(rd_ptr[0]), .ZN(n34) );
  AOI22D0 U332 ( .A1(\buffer[4][0] ), .A2(n36), .B1(\buffer[5][0] ), .B2(n37), 
        .ZN(n76) );
  INR3D0 U333 ( .A1(rd_ptr[2]), .B1(n79), .B2(rd_ptr[1]), .ZN(n37) );
  INR3D0 U334 ( .A1(rd_ptr[2]), .B1(rd_ptr[0]), .B2(rd_ptr[1]), .ZN(n36) );
  AOI22D0 U335 ( .A1(\buffer[2][0] ), .A2(n38), .B1(\buffer[3][0] ), .B2(n39), 
        .ZN(n75) );
  NR3D0 U336 ( .A1(n79), .A2(rd_ptr[2]), .A3(n78), .ZN(n39) );
  NR3D0 U337 ( .A1(rd_ptr[0]), .A2(rd_ptr[2]), .A3(n78), .ZN(n38) );
  CKND0 U338 ( .I(rd_ptr[1]), .ZN(n78) );
  AOI22D0 U339 ( .A1(\buffer[0][0] ), .A2(n40), .B1(\buffer[1][0] ), .B2(n41), 
        .ZN(n74) );
  NR3D0 U340 ( .A1(rd_ptr[1]), .A2(rd_ptr[2]), .A3(n79), .ZN(n41) );
  NR3D0 U341 ( .A1(rd_ptr[1]), .A2(rd_ptr[2]), .A3(rd_ptr[0]), .ZN(n40) );
  AN3D0 U342 ( .A1(rd_en), .A2(n12), .A3(n73), .Z(n28) );
  NR3D0 U343 ( .A1(n23), .A2(n79), .A3(n4), .ZN(n73) );
  CKND0 U344 ( .I(wr_ptr[0]), .ZN(n4) );
  CKND0 U345 ( .I(rd_ptr[0]), .ZN(n79) );
  CKND0 U346 ( .I(wr_en), .ZN(n23) );
  CKND0 U347 ( .I(rst), .ZN(n12) );
  OR2D0 U348 ( .A1(rd_en), .A2(rst), .Z(N101) );
endmodule


module allocation_buffer_4 ( clk, rst, data_in, data_out, full, empty, rd_ptr, 
        wr_en, rd_en );
  input [19:0] data_in;
  output [19:0] data_out;
  input [2:0] rd_ptr;
  input clk, rst, wr_en, rd_en;
  output full, empty;
  wire   N14, \buffer[7][7] , \buffer[7][6] , \buffer[7][5] , \buffer[7][4] ,
         \buffer[7][3] , \buffer[7][2] , \buffer[7][1] , \buffer[7][0] ,
         \buffer[6][7] , \buffer[6][6] , \buffer[6][5] , \buffer[6][4] ,
         \buffer[6][3] , \buffer[6][2] , \buffer[6][1] , \buffer[6][0] ,
         \buffer[5][7] , \buffer[5][6] , \buffer[5][5] , \buffer[5][4] ,
         \buffer[5][3] , \buffer[5][2] , \buffer[5][1] , \buffer[5][0] ,
         \buffer[4][7] , \buffer[4][6] , \buffer[4][5] , \buffer[4][4] ,
         \buffer[4][3] , \buffer[4][2] , \buffer[4][1] , \buffer[4][0] ,
         \buffer[3][7] , \buffer[3][6] , \buffer[3][5] , \buffer[3][4] ,
         \buffer[3][3] , \buffer[3][2] , \buffer[3][1] , \buffer[3][0] ,
         \buffer[2][7] , \buffer[2][6] , \buffer[2][5] , \buffer[2][4] ,
         \buffer[2][3] , \buffer[2][2] , \buffer[2][1] , \buffer[2][0] ,
         \buffer[1][7] , \buffer[1][6] , \buffer[1][5] , \buffer[1][4] ,
         \buffer[1][3] , \buffer[1][2] , \buffer[1][1] , \buffer[1][0] ,
         \buffer[0][7] , \buffer[0][6] , \buffer[0][5] , \buffer[0][4] ,
         \buffer[0][3] , \buffer[0][2] , \buffer[0][1] , \buffer[0][0] , N101,
         N102, N103, N104, N105, N106, N107, N108, N109, N110, N111, N112,
         N113, N114, N115, N116, N117, N118, N119, N120, N121, N122, N124,
         N125, N127, N128, N129, N130, N131, N132, N133, N134, N135, N136,
         N137, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14,
         n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28,
         n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42,
         n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56,
         n57, n58, n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70,
         n71, n72, n73, n74, n75, n76, n77, n78, n79, n80, n81;
  wire   [2:0] wr_ptr;
  wire   [2:0] count;
  assign full = N14;

  EDFQD1 \data_out_reg[19]  ( .D(N121), .E(N101), .CP(clk), .Q(data_out[19])
         );
  EDFQD1 \data_out_reg[18]  ( .D(N120), .E(N101), .CP(clk), .Q(data_out[18])
         );
  EDFQD1 \data_out_reg[17]  ( .D(N119), .E(N101), .CP(clk), .Q(data_out[17])
         );
  EDFQD1 \data_out_reg[16]  ( .D(N118), .E(N101), .CP(clk), .Q(data_out[16])
         );
  EDFQD1 \data_out_reg[15]  ( .D(N117), .E(N101), .CP(clk), .Q(data_out[15])
         );
  EDFQD1 \data_out_reg[14]  ( .D(N116), .E(N101), .CP(clk), .Q(data_out[14])
         );
  EDFQD1 \data_out_reg[13]  ( .D(N115), .E(N101), .CP(clk), .Q(data_out[13])
         );
  EDFQD1 \data_out_reg[12]  ( .D(N114), .E(N101), .CP(clk), .Q(data_out[12])
         );
  EDFQD1 \data_out_reg[11]  ( .D(N113), .E(N101), .CP(clk), .Q(data_out[11])
         );
  EDFQD1 \data_out_reg[10]  ( .D(N112), .E(N101), .CP(clk), .Q(data_out[10])
         );
  EDFQD1 \data_out_reg[9]  ( .D(N111), .E(N101), .CP(clk), .Q(data_out[9]) );
  EDFQD1 \data_out_reg[8]  ( .D(N110), .E(N101), .CP(clk), .Q(data_out[8]) );
  EDFQD1 \data_out_reg[7]  ( .D(N109), .E(N101), .CP(clk), .Q(data_out[7]) );
  EDFQD1 \data_out_reg[6]  ( .D(N108), .E(N101), .CP(clk), .Q(data_out[6]) );
  EDFQD1 \data_out_reg[5]  ( .D(N107), .E(N101), .CP(clk), .Q(data_out[5]) );
  EDFQD1 \data_out_reg[4]  ( .D(N106), .E(N101), .CP(clk), .Q(data_out[4]) );
  EDFQD1 \data_out_reg[3]  ( .D(N105), .E(N101), .CP(clk), .Q(data_out[3]) );
  EDFQD1 \data_out_reg[2]  ( .D(N104), .E(N101), .CP(clk), .Q(data_out[2]) );
  EDFQD1 \data_out_reg[1]  ( .D(N103), .E(N101), .CP(clk), .Q(data_out[1]) );
  EDFQD1 \data_out_reg[0]  ( .D(N102), .E(N101), .CP(clk), .Q(data_out[0]) );
  EDFQD1 \buffer_reg[7][7]  ( .D(data_in[7]), .E(N137), .CP(clk), .Q(
        \buffer[7][7] ) );
  EDFQD1 \buffer_reg[7][6]  ( .D(data_in[6]), .E(N137), .CP(clk), .Q(
        \buffer[7][6] ) );
  EDFQD1 \buffer_reg[7][5]  ( .D(data_in[5]), .E(N137), .CP(clk), .Q(
        \buffer[7][5] ) );
  EDFQD1 \buffer_reg[7][4]  ( .D(data_in[4]), .E(N137), .CP(clk), .Q(
        \buffer[7][4] ) );
  EDFQD1 \buffer_reg[7][3]  ( .D(data_in[3]), .E(N137), .CP(clk), .Q(
        \buffer[7][3] ) );
  EDFQD1 \buffer_reg[7][2]  ( .D(data_in[2]), .E(N137), .CP(clk), .Q(
        \buffer[7][2] ) );
  EDFQD1 \buffer_reg[7][1]  ( .D(data_in[1]), .E(N137), .CP(clk), .Q(
        \buffer[7][1] ) );
  EDFQD1 \buffer_reg[7][0]  ( .D(data_in[0]), .E(N137), .CP(clk), .Q(
        \buffer[7][0] ) );
  EDFQD1 \buffer_reg[5][7]  ( .D(data_in[7]), .E(N135), .CP(clk), .Q(
        \buffer[5][7] ) );
  EDFQD1 \buffer_reg[5][6]  ( .D(data_in[6]), .E(N135), .CP(clk), .Q(
        \buffer[5][6] ) );
  EDFQD1 \buffer_reg[5][5]  ( .D(data_in[5]), .E(N135), .CP(clk), .Q(
        \buffer[5][5] ) );
  EDFQD1 \buffer_reg[5][4]  ( .D(data_in[4]), .E(N135), .CP(clk), .Q(
        \buffer[5][4] ) );
  EDFQD1 \buffer_reg[5][3]  ( .D(data_in[3]), .E(N135), .CP(clk), .Q(
        \buffer[5][3] ) );
  EDFQD1 \buffer_reg[5][2]  ( .D(data_in[2]), .E(N135), .CP(clk), .Q(
        \buffer[5][2] ) );
  EDFQD1 \buffer_reg[5][1]  ( .D(data_in[1]), .E(N135), .CP(clk), .Q(
        \buffer[5][1] ) );
  EDFQD1 \buffer_reg[5][0]  ( .D(data_in[0]), .E(N135), .CP(clk), .Q(
        \buffer[5][0] ) );
  EDFQD1 \buffer_reg[3][7]  ( .D(data_in[7]), .E(N133), .CP(clk), .Q(
        \buffer[3][7] ) );
  EDFQD1 \buffer_reg[3][6]  ( .D(data_in[6]), .E(N133), .CP(clk), .Q(
        \buffer[3][6] ) );
  EDFQD1 \buffer_reg[3][5]  ( .D(data_in[5]), .E(N133), .CP(clk), .Q(
        \buffer[3][5] ) );
  EDFQD1 \buffer_reg[3][4]  ( .D(data_in[4]), .E(N133), .CP(clk), .Q(
        \buffer[3][4] ) );
  EDFQD1 \buffer_reg[3][3]  ( .D(data_in[3]), .E(N133), .CP(clk), .Q(
        \buffer[3][3] ) );
  EDFQD1 \buffer_reg[3][2]  ( .D(data_in[2]), .E(N133), .CP(clk), .Q(
        \buffer[3][2] ) );
  EDFQD1 \buffer_reg[3][1]  ( .D(data_in[1]), .E(N133), .CP(clk), .Q(
        \buffer[3][1] ) );
  EDFQD1 \buffer_reg[3][0]  ( .D(data_in[0]), .E(N133), .CP(clk), .Q(
        \buffer[3][0] ) );
  EDFQD1 \buffer_reg[1][7]  ( .D(data_in[7]), .E(N131), .CP(clk), .Q(
        \buffer[1][7] ) );
  EDFQD1 \buffer_reg[1][6]  ( .D(data_in[6]), .E(N131), .CP(clk), .Q(
        \buffer[1][6] ) );
  EDFQD1 \buffer_reg[1][5]  ( .D(data_in[5]), .E(N131), .CP(clk), .Q(
        \buffer[1][5] ) );
  EDFQD1 \buffer_reg[1][4]  ( .D(data_in[4]), .E(N131), .CP(clk), .Q(
        \buffer[1][4] ) );
  EDFQD1 \buffer_reg[1][3]  ( .D(data_in[3]), .E(N131), .CP(clk), .Q(
        \buffer[1][3] ) );
  EDFQD1 \buffer_reg[1][2]  ( .D(data_in[2]), .E(N131), .CP(clk), .Q(
        \buffer[1][2] ) );
  EDFQD1 \buffer_reg[1][1]  ( .D(data_in[1]), .E(N131), .CP(clk), .Q(
        \buffer[1][1] ) );
  EDFQD1 \buffer_reg[1][0]  ( .D(data_in[0]), .E(N131), .CP(clk), .Q(
        \buffer[1][0] ) );
  EDFQD1 \buffer_reg[6][7]  ( .D(data_in[7]), .E(N136), .CP(clk), .Q(
        \buffer[6][7] ) );
  EDFQD1 \buffer_reg[6][6]  ( .D(data_in[6]), .E(N136), .CP(clk), .Q(
        \buffer[6][6] ) );
  EDFQD1 \buffer_reg[6][5]  ( .D(data_in[5]), .E(N136), .CP(clk), .Q(
        \buffer[6][5] ) );
  EDFQD1 \buffer_reg[6][4]  ( .D(data_in[4]), .E(N136), .CP(clk), .Q(
        \buffer[6][4] ) );
  EDFQD1 \buffer_reg[6][3]  ( .D(data_in[3]), .E(N136), .CP(clk), .Q(
        \buffer[6][3] ) );
  EDFQD1 \buffer_reg[6][2]  ( .D(data_in[2]), .E(N136), .CP(clk), .Q(
        \buffer[6][2] ) );
  EDFQD1 \buffer_reg[6][1]  ( .D(data_in[1]), .E(N136), .CP(clk), .Q(
        \buffer[6][1] ) );
  EDFQD1 \buffer_reg[6][0]  ( .D(data_in[0]), .E(N136), .CP(clk), .Q(
        \buffer[6][0] ) );
  EDFQD1 \buffer_reg[4][7]  ( .D(data_in[7]), .E(N134), .CP(clk), .Q(
        \buffer[4][7] ) );
  EDFQD1 \buffer_reg[4][6]  ( .D(data_in[6]), .E(N134), .CP(clk), .Q(
        \buffer[4][6] ) );
  EDFQD1 \buffer_reg[4][5]  ( .D(data_in[5]), .E(N134), .CP(clk), .Q(
        \buffer[4][5] ) );
  EDFQD1 \buffer_reg[4][4]  ( .D(data_in[4]), .E(N134), .CP(clk), .Q(
        \buffer[4][4] ) );
  EDFQD1 \buffer_reg[4][3]  ( .D(data_in[3]), .E(N134), .CP(clk), .Q(
        \buffer[4][3] ) );
  EDFQD1 \buffer_reg[4][2]  ( .D(data_in[2]), .E(N134), .CP(clk), .Q(
        \buffer[4][2] ) );
  EDFQD1 \buffer_reg[4][1]  ( .D(data_in[1]), .E(N134), .CP(clk), .Q(
        \buffer[4][1] ) );
  EDFQD1 \buffer_reg[4][0]  ( .D(data_in[0]), .E(N134), .CP(clk), .Q(
        \buffer[4][0] ) );
  EDFQD1 \buffer_reg[2][7]  ( .D(data_in[7]), .E(N132), .CP(clk), .Q(
        \buffer[2][7] ) );
  EDFQD1 \buffer_reg[2][6]  ( .D(data_in[6]), .E(N132), .CP(clk), .Q(
        \buffer[2][6] ) );
  EDFQD1 \buffer_reg[2][5]  ( .D(data_in[5]), .E(N132), .CP(clk), .Q(
        \buffer[2][5] ) );
  EDFQD1 \buffer_reg[2][4]  ( .D(data_in[4]), .E(N132), .CP(clk), .Q(
        \buffer[2][4] ) );
  EDFQD1 \buffer_reg[2][3]  ( .D(data_in[3]), .E(N132), .CP(clk), .Q(
        \buffer[2][3] ) );
  EDFQD1 \buffer_reg[2][2]  ( .D(data_in[2]), .E(N132), .CP(clk), .Q(
        \buffer[2][2] ) );
  EDFQD1 \buffer_reg[2][1]  ( .D(data_in[1]), .E(N132), .CP(clk), .Q(
        \buffer[2][1] ) );
  EDFQD1 \buffer_reg[2][0]  ( .D(data_in[0]), .E(N132), .CP(clk), .Q(
        \buffer[2][0] ) );
  EDFQD1 \buffer_reg[0][7]  ( .D(data_in[7]), .E(N130), .CP(clk), .Q(
        \buffer[0][7] ) );
  EDFQD1 \buffer_reg[0][6]  ( .D(data_in[6]), .E(N130), .CP(clk), .Q(
        \buffer[0][6] ) );
  EDFQD1 \buffer_reg[0][5]  ( .D(data_in[5]), .E(N130), .CP(clk), .Q(
        \buffer[0][5] ) );
  EDFQD1 \buffer_reg[0][4]  ( .D(data_in[4]), .E(N130), .CP(clk), .Q(
        \buffer[0][4] ) );
  EDFQD1 \buffer_reg[0][3]  ( .D(data_in[3]), .E(N130), .CP(clk), .Q(
        \buffer[0][3] ) );
  EDFQD1 \buffer_reg[0][2]  ( .D(data_in[2]), .E(N130), .CP(clk), .Q(
        \buffer[0][2] ) );
  EDFQD1 \buffer_reg[0][1]  ( .D(data_in[1]), .E(N130), .CP(clk), .Q(
        \buffer[0][1] ) );
  EDFQD1 \buffer_reg[0][0]  ( .D(data_in[0]), .E(N130), .CP(clk), .Q(
        \buffer[0][0] ) );
  EDFQD1 \wr_ptr_reg[0]  ( .D(n81), .E(N122), .CP(clk), .Q(wr_ptr[0]) );
  EDFQD1 \count_reg[0]  ( .D(n80), .E(N129), .CP(clk), .Q(count[0]) );
  EDFQD1 \wr_ptr_reg[2]  ( .D(N125), .E(N122), .CP(clk), .Q(wr_ptr[2]) );
  EDFQD1 \count_reg[1]  ( .D(N127), .E(N129), .CP(clk), .Q(count[1]) );
  EDFQD1 \count_reg[2]  ( .D(N128), .E(N129), .CP(clk), .Q(count[2]) );
  EDFQD1 \wr_ptr_reg[1]  ( .D(N124), .E(N122), .CP(clk), .Q(wr_ptr[1]) );
  CKND0 U231 ( .I(n1), .ZN(n80) );
  NR3D0 U232 ( .A1(count[0]), .A2(count[2]), .A3(count[1]), .ZN(empty) );
  INR2D0 U233 ( .A1(N14), .B1(n2), .ZN(N137) );
  NR3D0 U234 ( .A1(n3), .A2(n4), .A3(n5), .ZN(N14) );
  NR3D0 U235 ( .A1(n6), .A2(n3), .A3(n5), .ZN(N136) );
  NR2D0 U236 ( .A1(n7), .A2(n8), .ZN(N135) );
  NR2D0 U237 ( .A1(n6), .A2(n8), .ZN(N134) );
  NR2D0 U238 ( .A1(n7), .A2(n9), .ZN(N133) );
  NR2D0 U239 ( .A1(n6), .A2(n9), .ZN(N132) );
  NR3D0 U240 ( .A1(n7), .A2(wr_ptr[2]), .A3(wr_ptr[1]), .ZN(N131) );
  IND2D0 U241 ( .A1(n2), .B1(wr_ptr[0]), .ZN(n7) );
  NR3D0 U242 ( .A1(n6), .A2(wr_ptr[2]), .A3(wr_ptr[1]), .ZN(N130) );
  CKND2D0 U243 ( .A1(n81), .A2(wr_en), .ZN(n6) );
  CKND0 U244 ( .I(n10), .ZN(n81) );
  OAI211D0 U245 ( .A1(rd_en), .A2(n2), .B(n11), .C(n12), .ZN(N129) );
  OAI22D0 U246 ( .A1(rst), .A2(n13), .B1(n1), .B2(n14), .ZN(N128) );
  MUX2ND0 U247 ( .I0(n15), .I1(count[2]), .S(count[1]), .ZN(n14) );
  NR2D0 U248 ( .A1(count[2]), .A2(n11), .ZN(n15) );
  MUX2ND0 U249 ( .I0(n16), .I1(n17), .S(count[2]), .ZN(n13) );
  MUX2ND0 U250 ( .I0(count[1]), .I1(n18), .S(n19), .ZN(n17) );
  NR3D0 U251 ( .A1(n18), .A2(n19), .A3(n20), .ZN(n16) );
  CKND0 U252 ( .I(n11), .ZN(n19) );
  MUX2ND0 U253 ( .I0(n21), .I1(n1), .S(n22), .ZN(N127) );
  CKXOR2D0 U254 ( .A1(n11), .A2(n20), .Z(n22) );
  CKND0 U255 ( .I(count[1]), .ZN(n20) );
  CKND2D0 U256 ( .A1(rd_en), .A2(n23), .ZN(n11) );
  CKND2D0 U257 ( .A1(n18), .A2(n12), .ZN(n1) );
  CKND0 U258 ( .I(count[0]), .ZN(n18) );
  CKND2D0 U259 ( .A1(count[0]), .A2(n12), .ZN(n21) );
  OAI22D0 U260 ( .A1(n5), .A2(n10), .B1(n24), .B2(n25), .ZN(N125) );
  OA21D0 U261 ( .A1(n9), .A2(n4), .B(n8), .Z(n25) );
  CKND2D0 U262 ( .A1(wr_ptr[2]), .A2(n3), .ZN(n8) );
  CKND0 U263 ( .I(wr_ptr[1]), .ZN(n3) );
  CKND2D0 U264 ( .A1(wr_ptr[1]), .A2(n5), .ZN(n9) );
  CKND0 U265 ( .I(n26), .ZN(n24) );
  CKND0 U266 ( .I(wr_ptr[2]), .ZN(n5) );
  MUX2ND0 U267 ( .I0(n27), .I1(n10), .S(wr_ptr[1]), .ZN(N124) );
  CKND2D0 U268 ( .A1(n26), .A2(n4), .ZN(n10) );
  CKND2D0 U269 ( .A1(wr_ptr[0]), .A2(n26), .ZN(n27) );
  CKND2D0 U270 ( .A1(n12), .A2(n2), .ZN(N122) );
  CKND2D0 U271 ( .A1(wr_en), .A2(n26), .ZN(n2) );
  AN2D0 U272 ( .A1(data_in[19]), .A2(n28), .Z(N121) );
  AN2D0 U273 ( .A1(data_in[18]), .A2(n28), .Z(N120) );
  AN2D0 U274 ( .A1(data_in[17]), .A2(n28), .Z(N119) );
  AN2D0 U275 ( .A1(data_in[16]), .A2(n28), .Z(N118) );
  AN2D0 U276 ( .A1(data_in[15]), .A2(n28), .Z(N117) );
  AN2D0 U277 ( .A1(data_in[14]), .A2(n28), .Z(N116) );
  AN2D0 U278 ( .A1(data_in[13]), .A2(n28), .Z(N115) );
  AN2D0 U279 ( .A1(data_in[12]), .A2(n28), .Z(N114) );
  AN2D0 U280 ( .A1(data_in[11]), .A2(n28), .Z(N113) );
  AN2D0 U281 ( .A1(data_in[10]), .A2(n28), .Z(N112) );
  AN2D0 U282 ( .A1(data_in[9]), .A2(n28), .Z(N111) );
  AN2D0 U283 ( .A1(data_in[8]), .A2(n28), .Z(N110) );
  AO22D0 U284 ( .A1(data_in[7]), .A2(n28), .B1(n29), .B2(n26), .Z(N109) );
  ND4D0 U285 ( .A1(n30), .A2(n31), .A3(n32), .A4(n33), .ZN(n29) );
  AOI22D0 U286 ( .A1(\buffer[6][7] ), .A2(n34), .B1(\buffer[7][7] ), .B2(n35), 
        .ZN(n33) );
  AOI22D0 U287 ( .A1(\buffer[4][7] ), .A2(n36), .B1(\buffer[5][7] ), .B2(n37), 
        .ZN(n32) );
  AOI22D0 U288 ( .A1(\buffer[2][7] ), .A2(n38), .B1(\buffer[3][7] ), .B2(n39), 
        .ZN(n31) );
  AOI22D0 U289 ( .A1(\buffer[0][7] ), .A2(n40), .B1(\buffer[1][7] ), .B2(n41), 
        .ZN(n30) );
  AO22D0 U290 ( .A1(data_in[6]), .A2(n28), .B1(n42), .B2(n26), .Z(N108) );
  ND4D0 U291 ( .A1(n43), .A2(n44), .A3(n45), .A4(n46), .ZN(n42) );
  AOI22D0 U292 ( .A1(\buffer[6][6] ), .A2(n34), .B1(\buffer[7][6] ), .B2(n35), 
        .ZN(n46) );
  AOI22D0 U293 ( .A1(\buffer[4][6] ), .A2(n36), .B1(\buffer[5][6] ), .B2(n37), 
        .ZN(n45) );
  AOI22D0 U294 ( .A1(\buffer[2][6] ), .A2(n38), .B1(\buffer[3][6] ), .B2(n39), 
        .ZN(n44) );
  AOI22D0 U295 ( .A1(\buffer[0][6] ), .A2(n40), .B1(\buffer[1][6] ), .B2(n41), 
        .ZN(n43) );
  AO22D0 U296 ( .A1(data_in[5]), .A2(n28), .B1(n47), .B2(n26), .Z(N107) );
  ND4D0 U297 ( .A1(n48), .A2(n49), .A3(n50), .A4(n51), .ZN(n47) );
  AOI22D0 U298 ( .A1(\buffer[6][5] ), .A2(n34), .B1(\buffer[7][5] ), .B2(n35), 
        .ZN(n51) );
  AOI22D0 U299 ( .A1(\buffer[4][5] ), .A2(n36), .B1(\buffer[5][5] ), .B2(n37), 
        .ZN(n50) );
  AOI22D0 U300 ( .A1(\buffer[2][5] ), .A2(n38), .B1(\buffer[3][5] ), .B2(n39), 
        .ZN(n49) );
  AOI22D0 U301 ( .A1(\buffer[0][5] ), .A2(n40), .B1(\buffer[1][5] ), .B2(n41), 
        .ZN(n48) );
  AO22D0 U302 ( .A1(data_in[4]), .A2(n28), .B1(n52), .B2(n26), .Z(N106) );
  ND4D0 U303 ( .A1(n53), .A2(n54), .A3(n55), .A4(n56), .ZN(n52) );
  AOI22D0 U304 ( .A1(\buffer[6][4] ), .A2(n34), .B1(\buffer[7][4] ), .B2(n35), 
        .ZN(n56) );
  AOI22D0 U305 ( .A1(\buffer[4][4] ), .A2(n36), .B1(\buffer[5][4] ), .B2(n37), 
        .ZN(n55) );
  AOI22D0 U306 ( .A1(\buffer[2][4] ), .A2(n38), .B1(\buffer[3][4] ), .B2(n39), 
        .ZN(n54) );
  AOI22D0 U307 ( .A1(\buffer[0][4] ), .A2(n40), .B1(\buffer[1][4] ), .B2(n41), 
        .ZN(n53) );
  AO22D0 U308 ( .A1(data_in[3]), .A2(n28), .B1(n57), .B2(n26), .Z(N105) );
  ND4D0 U309 ( .A1(n58), .A2(n59), .A3(n60), .A4(n61), .ZN(n57) );
  AOI22D0 U310 ( .A1(\buffer[6][3] ), .A2(n34), .B1(\buffer[7][3] ), .B2(n35), 
        .ZN(n61) );
  AOI22D0 U311 ( .A1(\buffer[4][3] ), .A2(n36), .B1(\buffer[5][3] ), .B2(n37), 
        .ZN(n60) );
  AOI22D0 U312 ( .A1(\buffer[2][3] ), .A2(n38), .B1(\buffer[3][3] ), .B2(n39), 
        .ZN(n59) );
  AOI22D0 U313 ( .A1(\buffer[0][3] ), .A2(n40), .B1(\buffer[1][3] ), .B2(n41), 
        .ZN(n58) );
  AO22D0 U314 ( .A1(data_in[2]), .A2(n28), .B1(n62), .B2(n26), .Z(N104) );
  ND4D0 U315 ( .A1(n63), .A2(n64), .A3(n65), .A4(n66), .ZN(n62) );
  AOI22D0 U316 ( .A1(\buffer[6][2] ), .A2(n34), .B1(\buffer[7][2] ), .B2(n35), 
        .ZN(n66) );
  AOI22D0 U317 ( .A1(\buffer[4][2] ), .A2(n36), .B1(\buffer[5][2] ), .B2(n37), 
        .ZN(n65) );
  AOI22D0 U318 ( .A1(\buffer[2][2] ), .A2(n38), .B1(\buffer[3][2] ), .B2(n39), 
        .ZN(n64) );
  AOI22D0 U319 ( .A1(\buffer[0][2] ), .A2(n40), .B1(\buffer[1][2] ), .B2(n41), 
        .ZN(n63) );
  AO22D0 U320 ( .A1(data_in[1]), .A2(n28), .B1(n67), .B2(n26), .Z(N103) );
  ND4D0 U321 ( .A1(n68), .A2(n69), .A3(n70), .A4(n71), .ZN(n67) );
  AOI22D0 U322 ( .A1(\buffer[6][1] ), .A2(n34), .B1(\buffer[7][1] ), .B2(n35), 
        .ZN(n71) );
  AOI22D0 U323 ( .A1(\buffer[4][1] ), .A2(n36), .B1(\buffer[5][1] ), .B2(n37), 
        .ZN(n70) );
  AOI22D0 U324 ( .A1(\buffer[2][1] ), .A2(n38), .B1(\buffer[3][1] ), .B2(n39), 
        .ZN(n69) );
  AOI22D0 U325 ( .A1(\buffer[0][1] ), .A2(n40), .B1(\buffer[1][1] ), .B2(n41), 
        .ZN(n68) );
  AO22D0 U326 ( .A1(data_in[0]), .A2(n28), .B1(n72), .B2(n26), .Z(N102) );
  OAI21D0 U327 ( .A1(rst), .A2(n73), .B(N101), .ZN(n26) );
  ND4D0 U328 ( .A1(n74), .A2(n75), .A3(n76), .A4(n77), .ZN(n72) );
  AOI22D0 U329 ( .A1(\buffer[6][0] ), .A2(n34), .B1(\buffer[7][0] ), .B2(n35), 
        .ZN(n77) );
  INR3D0 U330 ( .A1(rd_ptr[2]), .B1(n78), .B2(n79), .ZN(n35) );
  INR3D0 U331 ( .A1(rd_ptr[2]), .B1(n78), .B2(rd_ptr[0]), .ZN(n34) );
  AOI22D0 U332 ( .A1(\buffer[4][0] ), .A2(n36), .B1(\buffer[5][0] ), .B2(n37), 
        .ZN(n76) );
  INR3D0 U333 ( .A1(rd_ptr[2]), .B1(n79), .B2(rd_ptr[1]), .ZN(n37) );
  INR3D0 U334 ( .A1(rd_ptr[2]), .B1(rd_ptr[0]), .B2(rd_ptr[1]), .ZN(n36) );
  AOI22D0 U335 ( .A1(\buffer[2][0] ), .A2(n38), .B1(\buffer[3][0] ), .B2(n39), 
        .ZN(n75) );
  NR3D0 U336 ( .A1(n79), .A2(rd_ptr[2]), .A3(n78), .ZN(n39) );
  NR3D0 U337 ( .A1(rd_ptr[0]), .A2(rd_ptr[2]), .A3(n78), .ZN(n38) );
  CKND0 U338 ( .I(rd_ptr[1]), .ZN(n78) );
  AOI22D0 U339 ( .A1(\buffer[0][0] ), .A2(n40), .B1(\buffer[1][0] ), .B2(n41), 
        .ZN(n74) );
  NR3D0 U340 ( .A1(rd_ptr[1]), .A2(rd_ptr[2]), .A3(n79), .ZN(n41) );
  NR3D0 U341 ( .A1(rd_ptr[1]), .A2(rd_ptr[2]), .A3(rd_ptr[0]), .ZN(n40) );
  AN3D0 U342 ( .A1(rd_en), .A2(n12), .A3(n73), .Z(n28) );
  NR3D0 U343 ( .A1(n23), .A2(n79), .A3(n4), .ZN(n73) );
  CKND0 U344 ( .I(wr_ptr[0]), .ZN(n4) );
  CKND0 U345 ( .I(rd_ptr[0]), .ZN(n79) );
  CKND0 U346 ( .I(wr_en), .ZN(n23) );
  CKND0 U347 ( .I(rst), .ZN(n12) );
  OR2D0 U348 ( .A1(rd_en), .A2(rst), .Z(N101) );
endmodule


module allocation_buffer_5 ( clk, rst, data_in, data_out, full, empty, rd_ptr, 
        wr_en, rd_en );
  input [19:0] data_in;
  output [19:0] data_out;
  input [2:0] rd_ptr;
  input clk, rst, wr_en, rd_en;
  output full, empty;
  wire   N14, \buffer[7][7] , \buffer[7][6] , \buffer[7][5] , \buffer[7][4] ,
         \buffer[7][3] , \buffer[7][2] , \buffer[7][1] , \buffer[7][0] ,
         \buffer[6][7] , \buffer[6][6] , \buffer[6][5] , \buffer[6][4] ,
         \buffer[6][3] , \buffer[6][2] , \buffer[6][1] , \buffer[6][0] ,
         \buffer[5][7] , \buffer[5][6] , \buffer[5][5] , \buffer[5][4] ,
         \buffer[5][3] , \buffer[5][2] , \buffer[5][1] , \buffer[5][0] ,
         \buffer[4][7] , \buffer[4][6] , \buffer[4][5] , \buffer[4][4] ,
         \buffer[4][3] , \buffer[4][2] , \buffer[4][1] , \buffer[4][0] ,
         \buffer[3][7] , \buffer[3][6] , \buffer[3][5] , \buffer[3][4] ,
         \buffer[3][3] , \buffer[3][2] , \buffer[3][1] , \buffer[3][0] ,
         \buffer[2][7] , \buffer[2][6] , \buffer[2][5] , \buffer[2][4] ,
         \buffer[2][3] , \buffer[2][2] , \buffer[2][1] , \buffer[2][0] ,
         \buffer[1][7] , \buffer[1][6] , \buffer[1][5] , \buffer[1][4] ,
         \buffer[1][3] , \buffer[1][2] , \buffer[1][1] , \buffer[1][0] ,
         \buffer[0][7] , \buffer[0][6] , \buffer[0][5] , \buffer[0][4] ,
         \buffer[0][3] , \buffer[0][2] , \buffer[0][1] , \buffer[0][0] , N101,
         N102, N103, N104, N105, N106, N107, N108, N109, N110, N111, N112,
         N113, N114, N115, N116, N117, N118, N119, N120, N121, N122, N124,
         N125, N127, N128, N129, N130, N131, N132, N133, N134, N135, N136,
         N137, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14,
         n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28,
         n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42,
         n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56,
         n57, n58, n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70,
         n71, n72, n73, n74, n75, n76, n77, n78, n79, n80, n81;
  wire   [2:0] wr_ptr;
  wire   [2:0] count;
  assign full = N14;

  EDFQD1 \data_out_reg[19]  ( .D(N121), .E(N101), .CP(clk), .Q(data_out[19])
         );
  EDFQD1 \data_out_reg[18]  ( .D(N120), .E(N101), .CP(clk), .Q(data_out[18])
         );
  EDFQD1 \data_out_reg[17]  ( .D(N119), .E(N101), .CP(clk), .Q(data_out[17])
         );
  EDFQD1 \data_out_reg[16]  ( .D(N118), .E(N101), .CP(clk), .Q(data_out[16])
         );
  EDFQD1 \data_out_reg[15]  ( .D(N117), .E(N101), .CP(clk), .Q(data_out[15])
         );
  EDFQD1 \data_out_reg[14]  ( .D(N116), .E(N101), .CP(clk), .Q(data_out[14])
         );
  EDFQD1 \data_out_reg[13]  ( .D(N115), .E(N101), .CP(clk), .Q(data_out[13])
         );
  EDFQD1 \data_out_reg[12]  ( .D(N114), .E(N101), .CP(clk), .Q(data_out[12])
         );
  EDFQD1 \data_out_reg[11]  ( .D(N113), .E(N101), .CP(clk), .Q(data_out[11])
         );
  EDFQD1 \data_out_reg[10]  ( .D(N112), .E(N101), .CP(clk), .Q(data_out[10])
         );
  EDFQD1 \data_out_reg[9]  ( .D(N111), .E(N101), .CP(clk), .Q(data_out[9]) );
  EDFQD1 \data_out_reg[8]  ( .D(N110), .E(N101), .CP(clk), .Q(data_out[8]) );
  EDFQD1 \data_out_reg[7]  ( .D(N109), .E(N101), .CP(clk), .Q(data_out[7]) );
  EDFQD1 \data_out_reg[6]  ( .D(N108), .E(N101), .CP(clk), .Q(data_out[6]) );
  EDFQD1 \data_out_reg[5]  ( .D(N107), .E(N101), .CP(clk), .Q(data_out[5]) );
  EDFQD1 \data_out_reg[4]  ( .D(N106), .E(N101), .CP(clk), .Q(data_out[4]) );
  EDFQD1 \data_out_reg[3]  ( .D(N105), .E(N101), .CP(clk), .Q(data_out[3]) );
  EDFQD1 \data_out_reg[2]  ( .D(N104), .E(N101), .CP(clk), .Q(data_out[2]) );
  EDFQD1 \data_out_reg[1]  ( .D(N103), .E(N101), .CP(clk), .Q(data_out[1]) );
  EDFQD1 \data_out_reg[0]  ( .D(N102), .E(N101), .CP(clk), .Q(data_out[0]) );
  EDFQD1 \buffer_reg[7][7]  ( .D(data_in[7]), .E(N137), .CP(clk), .Q(
        \buffer[7][7] ) );
  EDFQD1 \buffer_reg[7][6]  ( .D(data_in[6]), .E(N137), .CP(clk), .Q(
        \buffer[7][6] ) );
  EDFQD1 \buffer_reg[7][5]  ( .D(data_in[5]), .E(N137), .CP(clk), .Q(
        \buffer[7][5] ) );
  EDFQD1 \buffer_reg[7][4]  ( .D(data_in[4]), .E(N137), .CP(clk), .Q(
        \buffer[7][4] ) );
  EDFQD1 \buffer_reg[7][3]  ( .D(data_in[3]), .E(N137), .CP(clk), .Q(
        \buffer[7][3] ) );
  EDFQD1 \buffer_reg[7][2]  ( .D(data_in[2]), .E(N137), .CP(clk), .Q(
        \buffer[7][2] ) );
  EDFQD1 \buffer_reg[7][1]  ( .D(data_in[1]), .E(N137), .CP(clk), .Q(
        \buffer[7][1] ) );
  EDFQD1 \buffer_reg[7][0]  ( .D(data_in[0]), .E(N137), .CP(clk), .Q(
        \buffer[7][0] ) );
  EDFQD1 \buffer_reg[5][7]  ( .D(data_in[7]), .E(N135), .CP(clk), .Q(
        \buffer[5][7] ) );
  EDFQD1 \buffer_reg[5][6]  ( .D(data_in[6]), .E(N135), .CP(clk), .Q(
        \buffer[5][6] ) );
  EDFQD1 \buffer_reg[5][5]  ( .D(data_in[5]), .E(N135), .CP(clk), .Q(
        \buffer[5][5] ) );
  EDFQD1 \buffer_reg[5][4]  ( .D(data_in[4]), .E(N135), .CP(clk), .Q(
        \buffer[5][4] ) );
  EDFQD1 \buffer_reg[5][3]  ( .D(data_in[3]), .E(N135), .CP(clk), .Q(
        \buffer[5][3] ) );
  EDFQD1 \buffer_reg[5][2]  ( .D(data_in[2]), .E(N135), .CP(clk), .Q(
        \buffer[5][2] ) );
  EDFQD1 \buffer_reg[5][1]  ( .D(data_in[1]), .E(N135), .CP(clk), .Q(
        \buffer[5][1] ) );
  EDFQD1 \buffer_reg[5][0]  ( .D(data_in[0]), .E(N135), .CP(clk), .Q(
        \buffer[5][0] ) );
  EDFQD1 \buffer_reg[3][7]  ( .D(data_in[7]), .E(N133), .CP(clk), .Q(
        \buffer[3][7] ) );
  EDFQD1 \buffer_reg[3][6]  ( .D(data_in[6]), .E(N133), .CP(clk), .Q(
        \buffer[3][6] ) );
  EDFQD1 \buffer_reg[3][5]  ( .D(data_in[5]), .E(N133), .CP(clk), .Q(
        \buffer[3][5] ) );
  EDFQD1 \buffer_reg[3][4]  ( .D(data_in[4]), .E(N133), .CP(clk), .Q(
        \buffer[3][4] ) );
  EDFQD1 \buffer_reg[3][3]  ( .D(data_in[3]), .E(N133), .CP(clk), .Q(
        \buffer[3][3] ) );
  EDFQD1 \buffer_reg[3][2]  ( .D(data_in[2]), .E(N133), .CP(clk), .Q(
        \buffer[3][2] ) );
  EDFQD1 \buffer_reg[3][1]  ( .D(data_in[1]), .E(N133), .CP(clk), .Q(
        \buffer[3][1] ) );
  EDFQD1 \buffer_reg[3][0]  ( .D(data_in[0]), .E(N133), .CP(clk), .Q(
        \buffer[3][0] ) );
  EDFQD1 \buffer_reg[1][7]  ( .D(data_in[7]), .E(N131), .CP(clk), .Q(
        \buffer[1][7] ) );
  EDFQD1 \buffer_reg[1][6]  ( .D(data_in[6]), .E(N131), .CP(clk), .Q(
        \buffer[1][6] ) );
  EDFQD1 \buffer_reg[1][5]  ( .D(data_in[5]), .E(N131), .CP(clk), .Q(
        \buffer[1][5] ) );
  EDFQD1 \buffer_reg[1][4]  ( .D(data_in[4]), .E(N131), .CP(clk), .Q(
        \buffer[1][4] ) );
  EDFQD1 \buffer_reg[1][3]  ( .D(data_in[3]), .E(N131), .CP(clk), .Q(
        \buffer[1][3] ) );
  EDFQD1 \buffer_reg[1][2]  ( .D(data_in[2]), .E(N131), .CP(clk), .Q(
        \buffer[1][2] ) );
  EDFQD1 \buffer_reg[1][1]  ( .D(data_in[1]), .E(N131), .CP(clk), .Q(
        \buffer[1][1] ) );
  EDFQD1 \buffer_reg[1][0]  ( .D(data_in[0]), .E(N131), .CP(clk), .Q(
        \buffer[1][0] ) );
  EDFQD1 \buffer_reg[6][7]  ( .D(data_in[7]), .E(N136), .CP(clk), .Q(
        \buffer[6][7] ) );
  EDFQD1 \buffer_reg[6][6]  ( .D(data_in[6]), .E(N136), .CP(clk), .Q(
        \buffer[6][6] ) );
  EDFQD1 \buffer_reg[6][5]  ( .D(data_in[5]), .E(N136), .CP(clk), .Q(
        \buffer[6][5] ) );
  EDFQD1 \buffer_reg[6][4]  ( .D(data_in[4]), .E(N136), .CP(clk), .Q(
        \buffer[6][4] ) );
  EDFQD1 \buffer_reg[6][3]  ( .D(data_in[3]), .E(N136), .CP(clk), .Q(
        \buffer[6][3] ) );
  EDFQD1 \buffer_reg[6][2]  ( .D(data_in[2]), .E(N136), .CP(clk), .Q(
        \buffer[6][2] ) );
  EDFQD1 \buffer_reg[6][1]  ( .D(data_in[1]), .E(N136), .CP(clk), .Q(
        \buffer[6][1] ) );
  EDFQD1 \buffer_reg[6][0]  ( .D(data_in[0]), .E(N136), .CP(clk), .Q(
        \buffer[6][0] ) );
  EDFQD1 \buffer_reg[4][7]  ( .D(data_in[7]), .E(N134), .CP(clk), .Q(
        \buffer[4][7] ) );
  EDFQD1 \buffer_reg[4][6]  ( .D(data_in[6]), .E(N134), .CP(clk), .Q(
        \buffer[4][6] ) );
  EDFQD1 \buffer_reg[4][5]  ( .D(data_in[5]), .E(N134), .CP(clk), .Q(
        \buffer[4][5] ) );
  EDFQD1 \buffer_reg[4][4]  ( .D(data_in[4]), .E(N134), .CP(clk), .Q(
        \buffer[4][4] ) );
  EDFQD1 \buffer_reg[4][3]  ( .D(data_in[3]), .E(N134), .CP(clk), .Q(
        \buffer[4][3] ) );
  EDFQD1 \buffer_reg[4][2]  ( .D(data_in[2]), .E(N134), .CP(clk), .Q(
        \buffer[4][2] ) );
  EDFQD1 \buffer_reg[4][1]  ( .D(data_in[1]), .E(N134), .CP(clk), .Q(
        \buffer[4][1] ) );
  EDFQD1 \buffer_reg[4][0]  ( .D(data_in[0]), .E(N134), .CP(clk), .Q(
        \buffer[4][0] ) );
  EDFQD1 \buffer_reg[2][7]  ( .D(data_in[7]), .E(N132), .CP(clk), .Q(
        \buffer[2][7] ) );
  EDFQD1 \buffer_reg[2][6]  ( .D(data_in[6]), .E(N132), .CP(clk), .Q(
        \buffer[2][6] ) );
  EDFQD1 \buffer_reg[2][5]  ( .D(data_in[5]), .E(N132), .CP(clk), .Q(
        \buffer[2][5] ) );
  EDFQD1 \buffer_reg[2][4]  ( .D(data_in[4]), .E(N132), .CP(clk), .Q(
        \buffer[2][4] ) );
  EDFQD1 \buffer_reg[2][3]  ( .D(data_in[3]), .E(N132), .CP(clk), .Q(
        \buffer[2][3] ) );
  EDFQD1 \buffer_reg[2][2]  ( .D(data_in[2]), .E(N132), .CP(clk), .Q(
        \buffer[2][2] ) );
  EDFQD1 \buffer_reg[2][1]  ( .D(data_in[1]), .E(N132), .CP(clk), .Q(
        \buffer[2][1] ) );
  EDFQD1 \buffer_reg[2][0]  ( .D(data_in[0]), .E(N132), .CP(clk), .Q(
        \buffer[2][0] ) );
  EDFQD1 \buffer_reg[0][7]  ( .D(data_in[7]), .E(N130), .CP(clk), .Q(
        \buffer[0][7] ) );
  EDFQD1 \buffer_reg[0][6]  ( .D(data_in[6]), .E(N130), .CP(clk), .Q(
        \buffer[0][6] ) );
  EDFQD1 \buffer_reg[0][5]  ( .D(data_in[5]), .E(N130), .CP(clk), .Q(
        \buffer[0][5] ) );
  EDFQD1 \buffer_reg[0][4]  ( .D(data_in[4]), .E(N130), .CP(clk), .Q(
        \buffer[0][4] ) );
  EDFQD1 \buffer_reg[0][3]  ( .D(data_in[3]), .E(N130), .CP(clk), .Q(
        \buffer[0][3] ) );
  EDFQD1 \buffer_reg[0][2]  ( .D(data_in[2]), .E(N130), .CP(clk), .Q(
        \buffer[0][2] ) );
  EDFQD1 \buffer_reg[0][1]  ( .D(data_in[1]), .E(N130), .CP(clk), .Q(
        \buffer[0][1] ) );
  EDFQD1 \buffer_reg[0][0]  ( .D(data_in[0]), .E(N130), .CP(clk), .Q(
        \buffer[0][0] ) );
  EDFQD1 \wr_ptr_reg[0]  ( .D(n81), .E(N122), .CP(clk), .Q(wr_ptr[0]) );
  EDFQD1 \count_reg[0]  ( .D(n80), .E(N129), .CP(clk), .Q(count[0]) );
  EDFQD1 \wr_ptr_reg[2]  ( .D(N125), .E(N122), .CP(clk), .Q(wr_ptr[2]) );
  EDFQD1 \count_reg[1]  ( .D(N127), .E(N129), .CP(clk), .Q(count[1]) );
  EDFQD1 \count_reg[2]  ( .D(N128), .E(N129), .CP(clk), .Q(count[2]) );
  EDFQD1 \wr_ptr_reg[1]  ( .D(N124), .E(N122), .CP(clk), .Q(wr_ptr[1]) );
  CKND0 U231 ( .I(n1), .ZN(n80) );
  NR3D0 U232 ( .A1(count[0]), .A2(count[2]), .A3(count[1]), .ZN(empty) );
  INR2D0 U233 ( .A1(N14), .B1(n2), .ZN(N137) );
  NR3D0 U234 ( .A1(n3), .A2(n4), .A3(n5), .ZN(N14) );
  NR3D0 U235 ( .A1(n6), .A2(n3), .A3(n5), .ZN(N136) );
  NR2D0 U236 ( .A1(n7), .A2(n8), .ZN(N135) );
  NR2D0 U237 ( .A1(n6), .A2(n8), .ZN(N134) );
  NR2D0 U238 ( .A1(n7), .A2(n9), .ZN(N133) );
  NR2D0 U239 ( .A1(n6), .A2(n9), .ZN(N132) );
  NR3D0 U240 ( .A1(n7), .A2(wr_ptr[2]), .A3(wr_ptr[1]), .ZN(N131) );
  IND2D0 U241 ( .A1(n2), .B1(wr_ptr[0]), .ZN(n7) );
  NR3D0 U242 ( .A1(n6), .A2(wr_ptr[2]), .A3(wr_ptr[1]), .ZN(N130) );
  CKND2D0 U243 ( .A1(n81), .A2(wr_en), .ZN(n6) );
  CKND0 U244 ( .I(n10), .ZN(n81) );
  OAI211D0 U245 ( .A1(rd_en), .A2(n2), .B(n11), .C(n12), .ZN(N129) );
  OAI22D0 U246 ( .A1(rst), .A2(n13), .B1(n1), .B2(n14), .ZN(N128) );
  MUX2ND0 U247 ( .I0(n15), .I1(count[2]), .S(count[1]), .ZN(n14) );
  NR2D0 U248 ( .A1(count[2]), .A2(n11), .ZN(n15) );
  MUX2ND0 U249 ( .I0(n16), .I1(n17), .S(count[2]), .ZN(n13) );
  MUX2ND0 U250 ( .I0(count[1]), .I1(n18), .S(n19), .ZN(n17) );
  NR3D0 U251 ( .A1(n18), .A2(n19), .A3(n20), .ZN(n16) );
  CKND0 U252 ( .I(n11), .ZN(n19) );
  MUX2ND0 U253 ( .I0(n21), .I1(n1), .S(n22), .ZN(N127) );
  CKXOR2D0 U254 ( .A1(n11), .A2(n20), .Z(n22) );
  CKND0 U255 ( .I(count[1]), .ZN(n20) );
  CKND2D0 U256 ( .A1(rd_en), .A2(n23), .ZN(n11) );
  CKND2D0 U257 ( .A1(n18), .A2(n12), .ZN(n1) );
  CKND0 U258 ( .I(count[0]), .ZN(n18) );
  CKND2D0 U259 ( .A1(count[0]), .A2(n12), .ZN(n21) );
  OAI22D0 U260 ( .A1(n5), .A2(n10), .B1(n24), .B2(n25), .ZN(N125) );
  OA21D0 U261 ( .A1(n9), .A2(n4), .B(n8), .Z(n25) );
  CKND2D0 U262 ( .A1(wr_ptr[2]), .A2(n3), .ZN(n8) );
  CKND0 U263 ( .I(wr_ptr[1]), .ZN(n3) );
  CKND2D0 U264 ( .A1(wr_ptr[1]), .A2(n5), .ZN(n9) );
  CKND0 U265 ( .I(n26), .ZN(n24) );
  CKND0 U266 ( .I(wr_ptr[2]), .ZN(n5) );
  MUX2ND0 U267 ( .I0(n27), .I1(n10), .S(wr_ptr[1]), .ZN(N124) );
  CKND2D0 U268 ( .A1(n26), .A2(n4), .ZN(n10) );
  CKND2D0 U269 ( .A1(wr_ptr[0]), .A2(n26), .ZN(n27) );
  CKND2D0 U270 ( .A1(n12), .A2(n2), .ZN(N122) );
  CKND2D0 U271 ( .A1(wr_en), .A2(n26), .ZN(n2) );
  AN2D0 U272 ( .A1(data_in[19]), .A2(n28), .Z(N121) );
  AN2D0 U273 ( .A1(data_in[18]), .A2(n28), .Z(N120) );
  AN2D0 U274 ( .A1(data_in[17]), .A2(n28), .Z(N119) );
  AN2D0 U275 ( .A1(data_in[16]), .A2(n28), .Z(N118) );
  AN2D0 U276 ( .A1(data_in[15]), .A2(n28), .Z(N117) );
  AN2D0 U277 ( .A1(data_in[14]), .A2(n28), .Z(N116) );
  AN2D0 U278 ( .A1(data_in[13]), .A2(n28), .Z(N115) );
  AN2D0 U279 ( .A1(data_in[12]), .A2(n28), .Z(N114) );
  AN2D0 U280 ( .A1(data_in[11]), .A2(n28), .Z(N113) );
  AN2D0 U281 ( .A1(data_in[10]), .A2(n28), .Z(N112) );
  AN2D0 U282 ( .A1(data_in[9]), .A2(n28), .Z(N111) );
  AN2D0 U283 ( .A1(data_in[8]), .A2(n28), .Z(N110) );
  AO22D0 U284 ( .A1(data_in[7]), .A2(n28), .B1(n29), .B2(n26), .Z(N109) );
  ND4D0 U285 ( .A1(n30), .A2(n31), .A3(n32), .A4(n33), .ZN(n29) );
  AOI22D0 U286 ( .A1(\buffer[6][7] ), .A2(n34), .B1(\buffer[7][7] ), .B2(n35), 
        .ZN(n33) );
  AOI22D0 U287 ( .A1(\buffer[4][7] ), .A2(n36), .B1(\buffer[5][7] ), .B2(n37), 
        .ZN(n32) );
  AOI22D0 U288 ( .A1(\buffer[2][7] ), .A2(n38), .B1(\buffer[3][7] ), .B2(n39), 
        .ZN(n31) );
  AOI22D0 U289 ( .A1(\buffer[0][7] ), .A2(n40), .B1(\buffer[1][7] ), .B2(n41), 
        .ZN(n30) );
  AO22D0 U290 ( .A1(data_in[6]), .A2(n28), .B1(n42), .B2(n26), .Z(N108) );
  ND4D0 U291 ( .A1(n43), .A2(n44), .A3(n45), .A4(n46), .ZN(n42) );
  AOI22D0 U292 ( .A1(\buffer[6][6] ), .A2(n34), .B1(\buffer[7][6] ), .B2(n35), 
        .ZN(n46) );
  AOI22D0 U293 ( .A1(\buffer[4][6] ), .A2(n36), .B1(\buffer[5][6] ), .B2(n37), 
        .ZN(n45) );
  AOI22D0 U294 ( .A1(\buffer[2][6] ), .A2(n38), .B1(\buffer[3][6] ), .B2(n39), 
        .ZN(n44) );
  AOI22D0 U295 ( .A1(\buffer[0][6] ), .A2(n40), .B1(\buffer[1][6] ), .B2(n41), 
        .ZN(n43) );
  AO22D0 U296 ( .A1(data_in[5]), .A2(n28), .B1(n47), .B2(n26), .Z(N107) );
  ND4D0 U297 ( .A1(n48), .A2(n49), .A3(n50), .A4(n51), .ZN(n47) );
  AOI22D0 U298 ( .A1(\buffer[6][5] ), .A2(n34), .B1(\buffer[7][5] ), .B2(n35), 
        .ZN(n51) );
  AOI22D0 U299 ( .A1(\buffer[4][5] ), .A2(n36), .B1(\buffer[5][5] ), .B2(n37), 
        .ZN(n50) );
  AOI22D0 U300 ( .A1(\buffer[2][5] ), .A2(n38), .B1(\buffer[3][5] ), .B2(n39), 
        .ZN(n49) );
  AOI22D0 U301 ( .A1(\buffer[0][5] ), .A2(n40), .B1(\buffer[1][5] ), .B2(n41), 
        .ZN(n48) );
  AO22D0 U302 ( .A1(data_in[4]), .A2(n28), .B1(n52), .B2(n26), .Z(N106) );
  ND4D0 U303 ( .A1(n53), .A2(n54), .A3(n55), .A4(n56), .ZN(n52) );
  AOI22D0 U304 ( .A1(\buffer[6][4] ), .A2(n34), .B1(\buffer[7][4] ), .B2(n35), 
        .ZN(n56) );
  AOI22D0 U305 ( .A1(\buffer[4][4] ), .A2(n36), .B1(\buffer[5][4] ), .B2(n37), 
        .ZN(n55) );
  AOI22D0 U306 ( .A1(\buffer[2][4] ), .A2(n38), .B1(\buffer[3][4] ), .B2(n39), 
        .ZN(n54) );
  AOI22D0 U307 ( .A1(\buffer[0][4] ), .A2(n40), .B1(\buffer[1][4] ), .B2(n41), 
        .ZN(n53) );
  AO22D0 U308 ( .A1(data_in[3]), .A2(n28), .B1(n57), .B2(n26), .Z(N105) );
  ND4D0 U309 ( .A1(n58), .A2(n59), .A3(n60), .A4(n61), .ZN(n57) );
  AOI22D0 U310 ( .A1(\buffer[6][3] ), .A2(n34), .B1(\buffer[7][3] ), .B2(n35), 
        .ZN(n61) );
  AOI22D0 U311 ( .A1(\buffer[4][3] ), .A2(n36), .B1(\buffer[5][3] ), .B2(n37), 
        .ZN(n60) );
  AOI22D0 U312 ( .A1(\buffer[2][3] ), .A2(n38), .B1(\buffer[3][3] ), .B2(n39), 
        .ZN(n59) );
  AOI22D0 U313 ( .A1(\buffer[0][3] ), .A2(n40), .B1(\buffer[1][3] ), .B2(n41), 
        .ZN(n58) );
  AO22D0 U314 ( .A1(data_in[2]), .A2(n28), .B1(n62), .B2(n26), .Z(N104) );
  ND4D0 U315 ( .A1(n63), .A2(n64), .A3(n65), .A4(n66), .ZN(n62) );
  AOI22D0 U316 ( .A1(\buffer[6][2] ), .A2(n34), .B1(\buffer[7][2] ), .B2(n35), 
        .ZN(n66) );
  AOI22D0 U317 ( .A1(\buffer[4][2] ), .A2(n36), .B1(\buffer[5][2] ), .B2(n37), 
        .ZN(n65) );
  AOI22D0 U318 ( .A1(\buffer[2][2] ), .A2(n38), .B1(\buffer[3][2] ), .B2(n39), 
        .ZN(n64) );
  AOI22D0 U319 ( .A1(\buffer[0][2] ), .A2(n40), .B1(\buffer[1][2] ), .B2(n41), 
        .ZN(n63) );
  AO22D0 U320 ( .A1(data_in[1]), .A2(n28), .B1(n67), .B2(n26), .Z(N103) );
  ND4D0 U321 ( .A1(n68), .A2(n69), .A3(n70), .A4(n71), .ZN(n67) );
  AOI22D0 U322 ( .A1(\buffer[6][1] ), .A2(n34), .B1(\buffer[7][1] ), .B2(n35), 
        .ZN(n71) );
  AOI22D0 U323 ( .A1(\buffer[4][1] ), .A2(n36), .B1(\buffer[5][1] ), .B2(n37), 
        .ZN(n70) );
  AOI22D0 U324 ( .A1(\buffer[2][1] ), .A2(n38), .B1(\buffer[3][1] ), .B2(n39), 
        .ZN(n69) );
  AOI22D0 U325 ( .A1(\buffer[0][1] ), .A2(n40), .B1(\buffer[1][1] ), .B2(n41), 
        .ZN(n68) );
  AO22D0 U326 ( .A1(data_in[0]), .A2(n28), .B1(n72), .B2(n26), .Z(N102) );
  OAI21D0 U327 ( .A1(rst), .A2(n73), .B(N101), .ZN(n26) );
  ND4D0 U328 ( .A1(n74), .A2(n75), .A3(n76), .A4(n77), .ZN(n72) );
  AOI22D0 U329 ( .A1(\buffer[6][0] ), .A2(n34), .B1(\buffer[7][0] ), .B2(n35), 
        .ZN(n77) );
  INR3D0 U330 ( .A1(rd_ptr[2]), .B1(n78), .B2(n79), .ZN(n35) );
  INR3D0 U331 ( .A1(rd_ptr[2]), .B1(n78), .B2(rd_ptr[0]), .ZN(n34) );
  AOI22D0 U332 ( .A1(\buffer[4][0] ), .A2(n36), .B1(\buffer[5][0] ), .B2(n37), 
        .ZN(n76) );
  INR3D0 U333 ( .A1(rd_ptr[2]), .B1(n79), .B2(rd_ptr[1]), .ZN(n37) );
  INR3D0 U334 ( .A1(rd_ptr[2]), .B1(rd_ptr[0]), .B2(rd_ptr[1]), .ZN(n36) );
  AOI22D0 U335 ( .A1(\buffer[2][0] ), .A2(n38), .B1(\buffer[3][0] ), .B2(n39), 
        .ZN(n75) );
  NR3D0 U336 ( .A1(n79), .A2(rd_ptr[2]), .A3(n78), .ZN(n39) );
  NR3D0 U337 ( .A1(rd_ptr[0]), .A2(rd_ptr[2]), .A3(n78), .ZN(n38) );
  CKND0 U338 ( .I(rd_ptr[1]), .ZN(n78) );
  AOI22D0 U339 ( .A1(\buffer[0][0] ), .A2(n40), .B1(\buffer[1][0] ), .B2(n41), 
        .ZN(n74) );
  NR3D0 U340 ( .A1(rd_ptr[1]), .A2(rd_ptr[2]), .A3(n79), .ZN(n41) );
  NR3D0 U341 ( .A1(rd_ptr[1]), .A2(rd_ptr[2]), .A3(rd_ptr[0]), .ZN(n40) );
  AN3D0 U342 ( .A1(rd_en), .A2(n12), .A3(n73), .Z(n28) );
  NR3D0 U343 ( .A1(n23), .A2(n79), .A3(n4), .ZN(n73) );
  CKND0 U344 ( .I(wr_ptr[0]), .ZN(n4) );
  CKND0 U345 ( .I(rd_ptr[0]), .ZN(n79) );
  CKND0 U346 ( .I(wr_en), .ZN(n23) );
  CKND0 U347 ( .I(rst), .ZN(n12) );
  OR2D0 U348 ( .A1(rd_en), .A2(rst), .Z(N101) );
endmodule


module allocation_buffer_6 ( clk, rst, data_in, data_out, full, empty, rd_ptr, 
        wr_en, rd_en );
  input [19:0] data_in;
  output [19:0] data_out;
  input [2:0] rd_ptr;
  input clk, rst, wr_en, rd_en;
  output full, empty;
  wire   N14, \buffer[7][7] , \buffer[7][6] , \buffer[7][5] , \buffer[7][4] ,
         \buffer[7][3] , \buffer[7][2] , \buffer[7][1] , \buffer[7][0] ,
         \buffer[6][7] , \buffer[6][6] , \buffer[6][5] , \buffer[6][4] ,
         \buffer[6][3] , \buffer[6][2] , \buffer[6][1] , \buffer[6][0] ,
         \buffer[5][7] , \buffer[5][6] , \buffer[5][5] , \buffer[5][4] ,
         \buffer[5][3] , \buffer[5][2] , \buffer[5][1] , \buffer[5][0] ,
         \buffer[4][7] , \buffer[4][6] , \buffer[4][5] , \buffer[4][4] ,
         \buffer[4][3] , \buffer[4][2] , \buffer[4][1] , \buffer[4][0] ,
         \buffer[3][7] , \buffer[3][6] , \buffer[3][5] , \buffer[3][4] ,
         \buffer[3][3] , \buffer[3][2] , \buffer[3][1] , \buffer[3][0] ,
         \buffer[2][7] , \buffer[2][6] , \buffer[2][5] , \buffer[2][4] ,
         \buffer[2][3] , \buffer[2][2] , \buffer[2][1] , \buffer[2][0] ,
         \buffer[1][7] , \buffer[1][6] , \buffer[1][5] , \buffer[1][4] ,
         \buffer[1][3] , \buffer[1][2] , \buffer[1][1] , \buffer[1][0] ,
         \buffer[0][7] , \buffer[0][6] , \buffer[0][5] , \buffer[0][4] ,
         \buffer[0][3] , \buffer[0][2] , \buffer[0][1] , \buffer[0][0] , N101,
         N102, N103, N104, N105, N106, N107, N108, N109, N110, N111, N112,
         N113, N114, N115, N116, N117, N118, N119, N120, N121, N122, N124,
         N125, N127, N128, N129, N130, N131, N132, N133, N134, N135, N136,
         N137, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14,
         n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28,
         n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42,
         n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56,
         n57, n58, n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70,
         n71, n72, n73, n74, n75, n76, n77, n78, n79, n80, n81;
  wire   [2:0] wr_ptr;
  wire   [2:0] count;
  assign full = N14;

  EDFQD1 \data_out_reg[19]  ( .D(N121), .E(N101), .CP(clk), .Q(data_out[19])
         );
  EDFQD1 \data_out_reg[18]  ( .D(N120), .E(N101), .CP(clk), .Q(data_out[18])
         );
  EDFQD1 \data_out_reg[17]  ( .D(N119), .E(N101), .CP(clk), .Q(data_out[17])
         );
  EDFQD1 \data_out_reg[16]  ( .D(N118), .E(N101), .CP(clk), .Q(data_out[16])
         );
  EDFQD1 \data_out_reg[15]  ( .D(N117), .E(N101), .CP(clk), .Q(data_out[15])
         );
  EDFQD1 \data_out_reg[14]  ( .D(N116), .E(N101), .CP(clk), .Q(data_out[14])
         );
  EDFQD1 \data_out_reg[13]  ( .D(N115), .E(N101), .CP(clk), .Q(data_out[13])
         );
  EDFQD1 \data_out_reg[12]  ( .D(N114), .E(N101), .CP(clk), .Q(data_out[12])
         );
  EDFQD1 \data_out_reg[11]  ( .D(N113), .E(N101), .CP(clk), .Q(data_out[11])
         );
  EDFQD1 \data_out_reg[10]  ( .D(N112), .E(N101), .CP(clk), .Q(data_out[10])
         );
  EDFQD1 \data_out_reg[9]  ( .D(N111), .E(N101), .CP(clk), .Q(data_out[9]) );
  EDFQD1 \data_out_reg[8]  ( .D(N110), .E(N101), .CP(clk), .Q(data_out[8]) );
  EDFQD1 \data_out_reg[7]  ( .D(N109), .E(N101), .CP(clk), .Q(data_out[7]) );
  EDFQD1 \data_out_reg[6]  ( .D(N108), .E(N101), .CP(clk), .Q(data_out[6]) );
  EDFQD1 \data_out_reg[5]  ( .D(N107), .E(N101), .CP(clk), .Q(data_out[5]) );
  EDFQD1 \data_out_reg[4]  ( .D(N106), .E(N101), .CP(clk), .Q(data_out[4]) );
  EDFQD1 \data_out_reg[3]  ( .D(N105), .E(N101), .CP(clk), .Q(data_out[3]) );
  EDFQD1 \data_out_reg[2]  ( .D(N104), .E(N101), .CP(clk), .Q(data_out[2]) );
  EDFQD1 \data_out_reg[1]  ( .D(N103), .E(N101), .CP(clk), .Q(data_out[1]) );
  EDFQD1 \data_out_reg[0]  ( .D(N102), .E(N101), .CP(clk), .Q(data_out[0]) );
  EDFQD1 \buffer_reg[7][7]  ( .D(data_in[7]), .E(N137), .CP(clk), .Q(
        \buffer[7][7] ) );
  EDFQD1 \buffer_reg[7][6]  ( .D(data_in[6]), .E(N137), .CP(clk), .Q(
        \buffer[7][6] ) );
  EDFQD1 \buffer_reg[7][5]  ( .D(data_in[5]), .E(N137), .CP(clk), .Q(
        \buffer[7][5] ) );
  EDFQD1 \buffer_reg[7][4]  ( .D(data_in[4]), .E(N137), .CP(clk), .Q(
        \buffer[7][4] ) );
  EDFQD1 \buffer_reg[7][3]  ( .D(data_in[3]), .E(N137), .CP(clk), .Q(
        \buffer[7][3] ) );
  EDFQD1 \buffer_reg[7][2]  ( .D(data_in[2]), .E(N137), .CP(clk), .Q(
        \buffer[7][2] ) );
  EDFQD1 \buffer_reg[7][1]  ( .D(data_in[1]), .E(N137), .CP(clk), .Q(
        \buffer[7][1] ) );
  EDFQD1 \buffer_reg[7][0]  ( .D(data_in[0]), .E(N137), .CP(clk), .Q(
        \buffer[7][0] ) );
  EDFQD1 \buffer_reg[5][7]  ( .D(data_in[7]), .E(N135), .CP(clk), .Q(
        \buffer[5][7] ) );
  EDFQD1 \buffer_reg[5][6]  ( .D(data_in[6]), .E(N135), .CP(clk), .Q(
        \buffer[5][6] ) );
  EDFQD1 \buffer_reg[5][5]  ( .D(data_in[5]), .E(N135), .CP(clk), .Q(
        \buffer[5][5] ) );
  EDFQD1 \buffer_reg[5][4]  ( .D(data_in[4]), .E(N135), .CP(clk), .Q(
        \buffer[5][4] ) );
  EDFQD1 \buffer_reg[5][3]  ( .D(data_in[3]), .E(N135), .CP(clk), .Q(
        \buffer[5][3] ) );
  EDFQD1 \buffer_reg[5][2]  ( .D(data_in[2]), .E(N135), .CP(clk), .Q(
        \buffer[5][2] ) );
  EDFQD1 \buffer_reg[5][1]  ( .D(data_in[1]), .E(N135), .CP(clk), .Q(
        \buffer[5][1] ) );
  EDFQD1 \buffer_reg[5][0]  ( .D(data_in[0]), .E(N135), .CP(clk), .Q(
        \buffer[5][0] ) );
  EDFQD1 \buffer_reg[3][7]  ( .D(data_in[7]), .E(N133), .CP(clk), .Q(
        \buffer[3][7] ) );
  EDFQD1 \buffer_reg[3][6]  ( .D(data_in[6]), .E(N133), .CP(clk), .Q(
        \buffer[3][6] ) );
  EDFQD1 \buffer_reg[3][5]  ( .D(data_in[5]), .E(N133), .CP(clk), .Q(
        \buffer[3][5] ) );
  EDFQD1 \buffer_reg[3][4]  ( .D(data_in[4]), .E(N133), .CP(clk), .Q(
        \buffer[3][4] ) );
  EDFQD1 \buffer_reg[3][3]  ( .D(data_in[3]), .E(N133), .CP(clk), .Q(
        \buffer[3][3] ) );
  EDFQD1 \buffer_reg[3][2]  ( .D(data_in[2]), .E(N133), .CP(clk), .Q(
        \buffer[3][2] ) );
  EDFQD1 \buffer_reg[3][1]  ( .D(data_in[1]), .E(N133), .CP(clk), .Q(
        \buffer[3][1] ) );
  EDFQD1 \buffer_reg[3][0]  ( .D(data_in[0]), .E(N133), .CP(clk), .Q(
        \buffer[3][0] ) );
  EDFQD1 \buffer_reg[1][7]  ( .D(data_in[7]), .E(N131), .CP(clk), .Q(
        \buffer[1][7] ) );
  EDFQD1 \buffer_reg[1][6]  ( .D(data_in[6]), .E(N131), .CP(clk), .Q(
        \buffer[1][6] ) );
  EDFQD1 \buffer_reg[1][5]  ( .D(data_in[5]), .E(N131), .CP(clk), .Q(
        \buffer[1][5] ) );
  EDFQD1 \buffer_reg[1][4]  ( .D(data_in[4]), .E(N131), .CP(clk), .Q(
        \buffer[1][4] ) );
  EDFQD1 \buffer_reg[1][3]  ( .D(data_in[3]), .E(N131), .CP(clk), .Q(
        \buffer[1][3] ) );
  EDFQD1 \buffer_reg[1][2]  ( .D(data_in[2]), .E(N131), .CP(clk), .Q(
        \buffer[1][2] ) );
  EDFQD1 \buffer_reg[1][1]  ( .D(data_in[1]), .E(N131), .CP(clk), .Q(
        \buffer[1][1] ) );
  EDFQD1 \buffer_reg[1][0]  ( .D(data_in[0]), .E(N131), .CP(clk), .Q(
        \buffer[1][0] ) );
  EDFQD1 \buffer_reg[6][7]  ( .D(data_in[7]), .E(N136), .CP(clk), .Q(
        \buffer[6][7] ) );
  EDFQD1 \buffer_reg[6][6]  ( .D(data_in[6]), .E(N136), .CP(clk), .Q(
        \buffer[6][6] ) );
  EDFQD1 \buffer_reg[6][5]  ( .D(data_in[5]), .E(N136), .CP(clk), .Q(
        \buffer[6][5] ) );
  EDFQD1 \buffer_reg[6][4]  ( .D(data_in[4]), .E(N136), .CP(clk), .Q(
        \buffer[6][4] ) );
  EDFQD1 \buffer_reg[6][3]  ( .D(data_in[3]), .E(N136), .CP(clk), .Q(
        \buffer[6][3] ) );
  EDFQD1 \buffer_reg[6][2]  ( .D(data_in[2]), .E(N136), .CP(clk), .Q(
        \buffer[6][2] ) );
  EDFQD1 \buffer_reg[6][1]  ( .D(data_in[1]), .E(N136), .CP(clk), .Q(
        \buffer[6][1] ) );
  EDFQD1 \buffer_reg[6][0]  ( .D(data_in[0]), .E(N136), .CP(clk), .Q(
        \buffer[6][0] ) );
  EDFQD1 \buffer_reg[4][7]  ( .D(data_in[7]), .E(N134), .CP(clk), .Q(
        \buffer[4][7] ) );
  EDFQD1 \buffer_reg[4][6]  ( .D(data_in[6]), .E(N134), .CP(clk), .Q(
        \buffer[4][6] ) );
  EDFQD1 \buffer_reg[4][5]  ( .D(data_in[5]), .E(N134), .CP(clk), .Q(
        \buffer[4][5] ) );
  EDFQD1 \buffer_reg[4][4]  ( .D(data_in[4]), .E(N134), .CP(clk), .Q(
        \buffer[4][4] ) );
  EDFQD1 \buffer_reg[4][3]  ( .D(data_in[3]), .E(N134), .CP(clk), .Q(
        \buffer[4][3] ) );
  EDFQD1 \buffer_reg[4][2]  ( .D(data_in[2]), .E(N134), .CP(clk), .Q(
        \buffer[4][2] ) );
  EDFQD1 \buffer_reg[4][1]  ( .D(data_in[1]), .E(N134), .CP(clk), .Q(
        \buffer[4][1] ) );
  EDFQD1 \buffer_reg[4][0]  ( .D(data_in[0]), .E(N134), .CP(clk), .Q(
        \buffer[4][0] ) );
  EDFQD1 \buffer_reg[2][7]  ( .D(data_in[7]), .E(N132), .CP(clk), .Q(
        \buffer[2][7] ) );
  EDFQD1 \buffer_reg[2][6]  ( .D(data_in[6]), .E(N132), .CP(clk), .Q(
        \buffer[2][6] ) );
  EDFQD1 \buffer_reg[2][5]  ( .D(data_in[5]), .E(N132), .CP(clk), .Q(
        \buffer[2][5] ) );
  EDFQD1 \buffer_reg[2][4]  ( .D(data_in[4]), .E(N132), .CP(clk), .Q(
        \buffer[2][4] ) );
  EDFQD1 \buffer_reg[2][3]  ( .D(data_in[3]), .E(N132), .CP(clk), .Q(
        \buffer[2][3] ) );
  EDFQD1 \buffer_reg[2][2]  ( .D(data_in[2]), .E(N132), .CP(clk), .Q(
        \buffer[2][2] ) );
  EDFQD1 \buffer_reg[2][1]  ( .D(data_in[1]), .E(N132), .CP(clk), .Q(
        \buffer[2][1] ) );
  EDFQD1 \buffer_reg[2][0]  ( .D(data_in[0]), .E(N132), .CP(clk), .Q(
        \buffer[2][0] ) );
  EDFQD1 \buffer_reg[0][7]  ( .D(data_in[7]), .E(N130), .CP(clk), .Q(
        \buffer[0][7] ) );
  EDFQD1 \buffer_reg[0][6]  ( .D(data_in[6]), .E(N130), .CP(clk), .Q(
        \buffer[0][6] ) );
  EDFQD1 \buffer_reg[0][5]  ( .D(data_in[5]), .E(N130), .CP(clk), .Q(
        \buffer[0][5] ) );
  EDFQD1 \buffer_reg[0][4]  ( .D(data_in[4]), .E(N130), .CP(clk), .Q(
        \buffer[0][4] ) );
  EDFQD1 \buffer_reg[0][3]  ( .D(data_in[3]), .E(N130), .CP(clk), .Q(
        \buffer[0][3] ) );
  EDFQD1 \buffer_reg[0][2]  ( .D(data_in[2]), .E(N130), .CP(clk), .Q(
        \buffer[0][2] ) );
  EDFQD1 \buffer_reg[0][1]  ( .D(data_in[1]), .E(N130), .CP(clk), .Q(
        \buffer[0][1] ) );
  EDFQD1 \buffer_reg[0][0]  ( .D(data_in[0]), .E(N130), .CP(clk), .Q(
        \buffer[0][0] ) );
  EDFQD1 \wr_ptr_reg[0]  ( .D(n81), .E(N122), .CP(clk), .Q(wr_ptr[0]) );
  EDFQD1 \count_reg[0]  ( .D(n80), .E(N129), .CP(clk), .Q(count[0]) );
  EDFQD1 \wr_ptr_reg[2]  ( .D(N125), .E(N122), .CP(clk), .Q(wr_ptr[2]) );
  EDFQD1 \count_reg[1]  ( .D(N127), .E(N129), .CP(clk), .Q(count[1]) );
  EDFQD1 \count_reg[2]  ( .D(N128), .E(N129), .CP(clk), .Q(count[2]) );
  EDFQD1 \wr_ptr_reg[1]  ( .D(N124), .E(N122), .CP(clk), .Q(wr_ptr[1]) );
  CKND0 U231 ( .I(n1), .ZN(n80) );
  NR3D0 U232 ( .A1(count[0]), .A2(count[2]), .A3(count[1]), .ZN(empty) );
  INR2D0 U233 ( .A1(N14), .B1(n2), .ZN(N137) );
  NR3D0 U234 ( .A1(n3), .A2(n4), .A3(n5), .ZN(N14) );
  NR3D0 U235 ( .A1(n6), .A2(n3), .A3(n5), .ZN(N136) );
  NR2D0 U236 ( .A1(n7), .A2(n8), .ZN(N135) );
  NR2D0 U237 ( .A1(n6), .A2(n8), .ZN(N134) );
  NR2D0 U238 ( .A1(n7), .A2(n9), .ZN(N133) );
  NR2D0 U239 ( .A1(n6), .A2(n9), .ZN(N132) );
  NR3D0 U240 ( .A1(n7), .A2(wr_ptr[2]), .A3(wr_ptr[1]), .ZN(N131) );
  IND2D0 U241 ( .A1(n2), .B1(wr_ptr[0]), .ZN(n7) );
  NR3D0 U242 ( .A1(n6), .A2(wr_ptr[2]), .A3(wr_ptr[1]), .ZN(N130) );
  CKND2D0 U243 ( .A1(n81), .A2(wr_en), .ZN(n6) );
  CKND0 U244 ( .I(n10), .ZN(n81) );
  OAI211D0 U245 ( .A1(rd_en), .A2(n2), .B(n11), .C(n12), .ZN(N129) );
  OAI22D0 U246 ( .A1(rst), .A2(n13), .B1(n1), .B2(n14), .ZN(N128) );
  MUX2ND0 U247 ( .I0(n15), .I1(count[2]), .S(count[1]), .ZN(n14) );
  NR2D0 U248 ( .A1(count[2]), .A2(n11), .ZN(n15) );
  MUX2ND0 U249 ( .I0(n16), .I1(n17), .S(count[2]), .ZN(n13) );
  MUX2ND0 U250 ( .I0(count[1]), .I1(n18), .S(n19), .ZN(n17) );
  NR3D0 U251 ( .A1(n18), .A2(n19), .A3(n20), .ZN(n16) );
  CKND0 U252 ( .I(n11), .ZN(n19) );
  MUX2ND0 U253 ( .I0(n21), .I1(n1), .S(n22), .ZN(N127) );
  CKXOR2D0 U254 ( .A1(n11), .A2(n20), .Z(n22) );
  CKND0 U255 ( .I(count[1]), .ZN(n20) );
  CKND2D0 U256 ( .A1(rd_en), .A2(n23), .ZN(n11) );
  CKND2D0 U257 ( .A1(n18), .A2(n12), .ZN(n1) );
  CKND0 U258 ( .I(count[0]), .ZN(n18) );
  CKND2D0 U259 ( .A1(count[0]), .A2(n12), .ZN(n21) );
  OAI22D0 U260 ( .A1(n5), .A2(n10), .B1(n24), .B2(n25), .ZN(N125) );
  OA21D0 U261 ( .A1(n9), .A2(n4), .B(n8), .Z(n25) );
  CKND2D0 U262 ( .A1(wr_ptr[2]), .A2(n3), .ZN(n8) );
  CKND0 U263 ( .I(wr_ptr[1]), .ZN(n3) );
  CKND2D0 U264 ( .A1(wr_ptr[1]), .A2(n5), .ZN(n9) );
  CKND0 U265 ( .I(n26), .ZN(n24) );
  CKND0 U266 ( .I(wr_ptr[2]), .ZN(n5) );
  MUX2ND0 U267 ( .I0(n27), .I1(n10), .S(wr_ptr[1]), .ZN(N124) );
  CKND2D0 U268 ( .A1(n26), .A2(n4), .ZN(n10) );
  CKND2D0 U269 ( .A1(wr_ptr[0]), .A2(n26), .ZN(n27) );
  CKND2D0 U270 ( .A1(n12), .A2(n2), .ZN(N122) );
  CKND2D0 U271 ( .A1(wr_en), .A2(n26), .ZN(n2) );
  AN2D0 U272 ( .A1(data_in[19]), .A2(n28), .Z(N121) );
  AN2D0 U273 ( .A1(data_in[18]), .A2(n28), .Z(N120) );
  AN2D0 U274 ( .A1(data_in[17]), .A2(n28), .Z(N119) );
  AN2D0 U275 ( .A1(data_in[16]), .A2(n28), .Z(N118) );
  AN2D0 U276 ( .A1(data_in[15]), .A2(n28), .Z(N117) );
  AN2D0 U277 ( .A1(data_in[14]), .A2(n28), .Z(N116) );
  AN2D0 U278 ( .A1(data_in[13]), .A2(n28), .Z(N115) );
  AN2D0 U279 ( .A1(data_in[12]), .A2(n28), .Z(N114) );
  AN2D0 U280 ( .A1(data_in[11]), .A2(n28), .Z(N113) );
  AN2D0 U281 ( .A1(data_in[10]), .A2(n28), .Z(N112) );
  AN2D0 U282 ( .A1(data_in[9]), .A2(n28), .Z(N111) );
  AN2D0 U283 ( .A1(data_in[8]), .A2(n28), .Z(N110) );
  AO22D0 U284 ( .A1(data_in[7]), .A2(n28), .B1(n29), .B2(n26), .Z(N109) );
  ND4D0 U285 ( .A1(n30), .A2(n31), .A3(n32), .A4(n33), .ZN(n29) );
  AOI22D0 U286 ( .A1(\buffer[6][7] ), .A2(n34), .B1(\buffer[7][7] ), .B2(n35), 
        .ZN(n33) );
  AOI22D0 U287 ( .A1(\buffer[4][7] ), .A2(n36), .B1(\buffer[5][7] ), .B2(n37), 
        .ZN(n32) );
  AOI22D0 U288 ( .A1(\buffer[2][7] ), .A2(n38), .B1(\buffer[3][7] ), .B2(n39), 
        .ZN(n31) );
  AOI22D0 U289 ( .A1(\buffer[0][7] ), .A2(n40), .B1(\buffer[1][7] ), .B2(n41), 
        .ZN(n30) );
  AO22D0 U290 ( .A1(data_in[6]), .A2(n28), .B1(n42), .B2(n26), .Z(N108) );
  ND4D0 U291 ( .A1(n43), .A2(n44), .A3(n45), .A4(n46), .ZN(n42) );
  AOI22D0 U292 ( .A1(\buffer[6][6] ), .A2(n34), .B1(\buffer[7][6] ), .B2(n35), 
        .ZN(n46) );
  AOI22D0 U293 ( .A1(\buffer[4][6] ), .A2(n36), .B1(\buffer[5][6] ), .B2(n37), 
        .ZN(n45) );
  AOI22D0 U294 ( .A1(\buffer[2][6] ), .A2(n38), .B1(\buffer[3][6] ), .B2(n39), 
        .ZN(n44) );
  AOI22D0 U295 ( .A1(\buffer[0][6] ), .A2(n40), .B1(\buffer[1][6] ), .B2(n41), 
        .ZN(n43) );
  AO22D0 U296 ( .A1(data_in[5]), .A2(n28), .B1(n47), .B2(n26), .Z(N107) );
  ND4D0 U297 ( .A1(n48), .A2(n49), .A3(n50), .A4(n51), .ZN(n47) );
  AOI22D0 U298 ( .A1(\buffer[6][5] ), .A2(n34), .B1(\buffer[7][5] ), .B2(n35), 
        .ZN(n51) );
  AOI22D0 U299 ( .A1(\buffer[4][5] ), .A2(n36), .B1(\buffer[5][5] ), .B2(n37), 
        .ZN(n50) );
  AOI22D0 U300 ( .A1(\buffer[2][5] ), .A2(n38), .B1(\buffer[3][5] ), .B2(n39), 
        .ZN(n49) );
  AOI22D0 U301 ( .A1(\buffer[0][5] ), .A2(n40), .B1(\buffer[1][5] ), .B2(n41), 
        .ZN(n48) );
  AO22D0 U302 ( .A1(data_in[4]), .A2(n28), .B1(n52), .B2(n26), .Z(N106) );
  ND4D0 U303 ( .A1(n53), .A2(n54), .A3(n55), .A4(n56), .ZN(n52) );
  AOI22D0 U304 ( .A1(\buffer[6][4] ), .A2(n34), .B1(\buffer[7][4] ), .B2(n35), 
        .ZN(n56) );
  AOI22D0 U305 ( .A1(\buffer[4][4] ), .A2(n36), .B1(\buffer[5][4] ), .B2(n37), 
        .ZN(n55) );
  AOI22D0 U306 ( .A1(\buffer[2][4] ), .A2(n38), .B1(\buffer[3][4] ), .B2(n39), 
        .ZN(n54) );
  AOI22D0 U307 ( .A1(\buffer[0][4] ), .A2(n40), .B1(\buffer[1][4] ), .B2(n41), 
        .ZN(n53) );
  AO22D0 U308 ( .A1(data_in[3]), .A2(n28), .B1(n57), .B2(n26), .Z(N105) );
  ND4D0 U309 ( .A1(n58), .A2(n59), .A3(n60), .A4(n61), .ZN(n57) );
  AOI22D0 U310 ( .A1(\buffer[6][3] ), .A2(n34), .B1(\buffer[7][3] ), .B2(n35), 
        .ZN(n61) );
  AOI22D0 U311 ( .A1(\buffer[4][3] ), .A2(n36), .B1(\buffer[5][3] ), .B2(n37), 
        .ZN(n60) );
  AOI22D0 U312 ( .A1(\buffer[2][3] ), .A2(n38), .B1(\buffer[3][3] ), .B2(n39), 
        .ZN(n59) );
  AOI22D0 U313 ( .A1(\buffer[0][3] ), .A2(n40), .B1(\buffer[1][3] ), .B2(n41), 
        .ZN(n58) );
  AO22D0 U314 ( .A1(data_in[2]), .A2(n28), .B1(n62), .B2(n26), .Z(N104) );
  ND4D0 U315 ( .A1(n63), .A2(n64), .A3(n65), .A4(n66), .ZN(n62) );
  AOI22D0 U316 ( .A1(\buffer[6][2] ), .A2(n34), .B1(\buffer[7][2] ), .B2(n35), 
        .ZN(n66) );
  AOI22D0 U317 ( .A1(\buffer[4][2] ), .A2(n36), .B1(\buffer[5][2] ), .B2(n37), 
        .ZN(n65) );
  AOI22D0 U318 ( .A1(\buffer[2][2] ), .A2(n38), .B1(\buffer[3][2] ), .B2(n39), 
        .ZN(n64) );
  AOI22D0 U319 ( .A1(\buffer[0][2] ), .A2(n40), .B1(\buffer[1][2] ), .B2(n41), 
        .ZN(n63) );
  AO22D0 U320 ( .A1(data_in[1]), .A2(n28), .B1(n67), .B2(n26), .Z(N103) );
  ND4D0 U321 ( .A1(n68), .A2(n69), .A3(n70), .A4(n71), .ZN(n67) );
  AOI22D0 U322 ( .A1(\buffer[6][1] ), .A2(n34), .B1(\buffer[7][1] ), .B2(n35), 
        .ZN(n71) );
  AOI22D0 U323 ( .A1(\buffer[4][1] ), .A2(n36), .B1(\buffer[5][1] ), .B2(n37), 
        .ZN(n70) );
  AOI22D0 U324 ( .A1(\buffer[2][1] ), .A2(n38), .B1(\buffer[3][1] ), .B2(n39), 
        .ZN(n69) );
  AOI22D0 U325 ( .A1(\buffer[0][1] ), .A2(n40), .B1(\buffer[1][1] ), .B2(n41), 
        .ZN(n68) );
  AO22D0 U326 ( .A1(data_in[0]), .A2(n28), .B1(n72), .B2(n26), .Z(N102) );
  OAI21D0 U327 ( .A1(rst), .A2(n73), .B(N101), .ZN(n26) );
  ND4D0 U328 ( .A1(n74), .A2(n75), .A3(n76), .A4(n77), .ZN(n72) );
  AOI22D0 U329 ( .A1(\buffer[6][0] ), .A2(n34), .B1(\buffer[7][0] ), .B2(n35), 
        .ZN(n77) );
  INR3D0 U330 ( .A1(rd_ptr[2]), .B1(n78), .B2(n79), .ZN(n35) );
  INR3D0 U331 ( .A1(rd_ptr[2]), .B1(n78), .B2(rd_ptr[0]), .ZN(n34) );
  AOI22D0 U332 ( .A1(\buffer[4][0] ), .A2(n36), .B1(\buffer[5][0] ), .B2(n37), 
        .ZN(n76) );
  INR3D0 U333 ( .A1(rd_ptr[2]), .B1(n79), .B2(rd_ptr[1]), .ZN(n37) );
  INR3D0 U334 ( .A1(rd_ptr[2]), .B1(rd_ptr[0]), .B2(rd_ptr[1]), .ZN(n36) );
  AOI22D0 U335 ( .A1(\buffer[2][0] ), .A2(n38), .B1(\buffer[3][0] ), .B2(n39), 
        .ZN(n75) );
  NR3D0 U336 ( .A1(n79), .A2(rd_ptr[2]), .A3(n78), .ZN(n39) );
  NR3D0 U337 ( .A1(rd_ptr[0]), .A2(rd_ptr[2]), .A3(n78), .ZN(n38) );
  CKND0 U338 ( .I(rd_ptr[1]), .ZN(n78) );
  AOI22D0 U339 ( .A1(\buffer[0][0] ), .A2(n40), .B1(\buffer[1][0] ), .B2(n41), 
        .ZN(n74) );
  NR3D0 U340 ( .A1(rd_ptr[1]), .A2(rd_ptr[2]), .A3(n79), .ZN(n41) );
  NR3D0 U341 ( .A1(rd_ptr[1]), .A2(rd_ptr[2]), .A3(rd_ptr[0]), .ZN(n40) );
  AN3D0 U342 ( .A1(rd_en), .A2(n12), .A3(n73), .Z(n28) );
  NR3D0 U343 ( .A1(n23), .A2(n79), .A3(n4), .ZN(n73) );
  CKND0 U344 ( .I(wr_ptr[0]), .ZN(n4) );
  CKND0 U345 ( .I(rd_ptr[0]), .ZN(n79) );
  CKND0 U346 ( .I(wr_en), .ZN(n23) );
  CKND0 U347 ( .I(rst), .ZN(n12) );
  OR2D0 U348 ( .A1(rd_en), .A2(rst), .Z(N101) );
endmodule


module allocation_buffer_7 ( clk, rst, data_in, data_out, full, empty, rd_ptr, 
        wr_en, rd_en );
  input [19:0] data_in;
  output [19:0] data_out;
  input [2:0] rd_ptr;
  input clk, rst, wr_en, rd_en;
  output full, empty;
  wire   N14, \buffer[7][7] , \buffer[7][6] , \buffer[7][5] , \buffer[7][4] ,
         \buffer[7][3] , \buffer[7][2] , \buffer[7][1] , \buffer[7][0] ,
         \buffer[6][7] , \buffer[6][6] , \buffer[6][5] , \buffer[6][4] ,
         \buffer[6][3] , \buffer[6][2] , \buffer[6][1] , \buffer[6][0] ,
         \buffer[5][7] , \buffer[5][6] , \buffer[5][5] , \buffer[5][4] ,
         \buffer[5][3] , \buffer[5][2] , \buffer[5][1] , \buffer[5][0] ,
         \buffer[4][7] , \buffer[4][6] , \buffer[4][5] , \buffer[4][4] ,
         \buffer[4][3] , \buffer[4][2] , \buffer[4][1] , \buffer[4][0] ,
         \buffer[3][7] , \buffer[3][6] , \buffer[3][5] , \buffer[3][4] ,
         \buffer[3][3] , \buffer[3][2] , \buffer[3][1] , \buffer[3][0] ,
         \buffer[2][7] , \buffer[2][6] , \buffer[2][5] , \buffer[2][4] ,
         \buffer[2][3] , \buffer[2][2] , \buffer[2][1] , \buffer[2][0] ,
         \buffer[1][7] , \buffer[1][6] , \buffer[1][5] , \buffer[1][4] ,
         \buffer[1][3] , \buffer[1][2] , \buffer[1][1] , \buffer[1][0] ,
         \buffer[0][7] , \buffer[0][6] , \buffer[0][5] , \buffer[0][4] ,
         \buffer[0][3] , \buffer[0][2] , \buffer[0][1] , \buffer[0][0] , N101,
         N102, N103, N104, N105, N106, N107, N108, N109, N110, N111, N112,
         N113, N114, N115, N116, N117, N118, N119, N120, N121, N122, N124,
         N125, N127, N128, N129, N130, N131, N132, N133, N134, N135, N136,
         N137, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14,
         n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28,
         n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42,
         n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56,
         n57, n58, n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70,
         n71, n72, n73, n74, n75, n76, n77, n78, n79, n80, n81;
  wire   [2:0] wr_ptr;
  wire   [2:0] count;
  assign full = N14;

  EDFQD1 \data_out_reg[19]  ( .D(N121), .E(N101), .CP(clk), .Q(data_out[19])
         );
  EDFQD1 \data_out_reg[18]  ( .D(N120), .E(N101), .CP(clk), .Q(data_out[18])
         );
  EDFQD1 \data_out_reg[17]  ( .D(N119), .E(N101), .CP(clk), .Q(data_out[17])
         );
  EDFQD1 \data_out_reg[16]  ( .D(N118), .E(N101), .CP(clk), .Q(data_out[16])
         );
  EDFQD1 \data_out_reg[15]  ( .D(N117), .E(N101), .CP(clk), .Q(data_out[15])
         );
  EDFQD1 \data_out_reg[14]  ( .D(N116), .E(N101), .CP(clk), .Q(data_out[14])
         );
  EDFQD1 \data_out_reg[13]  ( .D(N115), .E(N101), .CP(clk), .Q(data_out[13])
         );
  EDFQD1 \data_out_reg[12]  ( .D(N114), .E(N101), .CP(clk), .Q(data_out[12])
         );
  EDFQD1 \data_out_reg[11]  ( .D(N113), .E(N101), .CP(clk), .Q(data_out[11])
         );
  EDFQD1 \data_out_reg[10]  ( .D(N112), .E(N101), .CP(clk), .Q(data_out[10])
         );
  EDFQD1 \data_out_reg[9]  ( .D(N111), .E(N101), .CP(clk), .Q(data_out[9]) );
  EDFQD1 \data_out_reg[8]  ( .D(N110), .E(N101), .CP(clk), .Q(data_out[8]) );
  EDFQD1 \data_out_reg[7]  ( .D(N109), .E(N101), .CP(clk), .Q(data_out[7]) );
  EDFQD1 \data_out_reg[6]  ( .D(N108), .E(N101), .CP(clk), .Q(data_out[6]) );
  EDFQD1 \data_out_reg[5]  ( .D(N107), .E(N101), .CP(clk), .Q(data_out[5]) );
  EDFQD1 \data_out_reg[4]  ( .D(N106), .E(N101), .CP(clk), .Q(data_out[4]) );
  EDFQD1 \data_out_reg[3]  ( .D(N105), .E(N101), .CP(clk), .Q(data_out[3]) );
  EDFQD1 \data_out_reg[2]  ( .D(N104), .E(N101), .CP(clk), .Q(data_out[2]) );
  EDFQD1 \data_out_reg[1]  ( .D(N103), .E(N101), .CP(clk), .Q(data_out[1]) );
  EDFQD1 \data_out_reg[0]  ( .D(N102), .E(N101), .CP(clk), .Q(data_out[0]) );
  EDFQD1 \buffer_reg[7][7]  ( .D(data_in[7]), .E(N137), .CP(clk), .Q(
        \buffer[7][7] ) );
  EDFQD1 \buffer_reg[7][6]  ( .D(data_in[6]), .E(N137), .CP(clk), .Q(
        \buffer[7][6] ) );
  EDFQD1 \buffer_reg[7][5]  ( .D(data_in[5]), .E(N137), .CP(clk), .Q(
        \buffer[7][5] ) );
  EDFQD1 \buffer_reg[7][4]  ( .D(data_in[4]), .E(N137), .CP(clk), .Q(
        \buffer[7][4] ) );
  EDFQD1 \buffer_reg[7][3]  ( .D(data_in[3]), .E(N137), .CP(clk), .Q(
        \buffer[7][3] ) );
  EDFQD1 \buffer_reg[7][2]  ( .D(data_in[2]), .E(N137), .CP(clk), .Q(
        \buffer[7][2] ) );
  EDFQD1 \buffer_reg[7][1]  ( .D(data_in[1]), .E(N137), .CP(clk), .Q(
        \buffer[7][1] ) );
  EDFQD1 \buffer_reg[7][0]  ( .D(data_in[0]), .E(N137), .CP(clk), .Q(
        \buffer[7][0] ) );
  EDFQD1 \buffer_reg[5][7]  ( .D(data_in[7]), .E(N135), .CP(clk), .Q(
        \buffer[5][7] ) );
  EDFQD1 \buffer_reg[5][6]  ( .D(data_in[6]), .E(N135), .CP(clk), .Q(
        \buffer[5][6] ) );
  EDFQD1 \buffer_reg[5][5]  ( .D(data_in[5]), .E(N135), .CP(clk), .Q(
        \buffer[5][5] ) );
  EDFQD1 \buffer_reg[5][4]  ( .D(data_in[4]), .E(N135), .CP(clk), .Q(
        \buffer[5][4] ) );
  EDFQD1 \buffer_reg[5][3]  ( .D(data_in[3]), .E(N135), .CP(clk), .Q(
        \buffer[5][3] ) );
  EDFQD1 \buffer_reg[5][2]  ( .D(data_in[2]), .E(N135), .CP(clk), .Q(
        \buffer[5][2] ) );
  EDFQD1 \buffer_reg[5][1]  ( .D(data_in[1]), .E(N135), .CP(clk), .Q(
        \buffer[5][1] ) );
  EDFQD1 \buffer_reg[5][0]  ( .D(data_in[0]), .E(N135), .CP(clk), .Q(
        \buffer[5][0] ) );
  EDFQD1 \buffer_reg[3][7]  ( .D(data_in[7]), .E(N133), .CP(clk), .Q(
        \buffer[3][7] ) );
  EDFQD1 \buffer_reg[3][6]  ( .D(data_in[6]), .E(N133), .CP(clk), .Q(
        \buffer[3][6] ) );
  EDFQD1 \buffer_reg[3][5]  ( .D(data_in[5]), .E(N133), .CP(clk), .Q(
        \buffer[3][5] ) );
  EDFQD1 \buffer_reg[3][4]  ( .D(data_in[4]), .E(N133), .CP(clk), .Q(
        \buffer[3][4] ) );
  EDFQD1 \buffer_reg[3][3]  ( .D(data_in[3]), .E(N133), .CP(clk), .Q(
        \buffer[3][3] ) );
  EDFQD1 \buffer_reg[3][2]  ( .D(data_in[2]), .E(N133), .CP(clk), .Q(
        \buffer[3][2] ) );
  EDFQD1 \buffer_reg[3][1]  ( .D(data_in[1]), .E(N133), .CP(clk), .Q(
        \buffer[3][1] ) );
  EDFQD1 \buffer_reg[3][0]  ( .D(data_in[0]), .E(N133), .CP(clk), .Q(
        \buffer[3][0] ) );
  EDFQD1 \buffer_reg[1][7]  ( .D(data_in[7]), .E(N131), .CP(clk), .Q(
        \buffer[1][7] ) );
  EDFQD1 \buffer_reg[1][6]  ( .D(data_in[6]), .E(N131), .CP(clk), .Q(
        \buffer[1][6] ) );
  EDFQD1 \buffer_reg[1][5]  ( .D(data_in[5]), .E(N131), .CP(clk), .Q(
        \buffer[1][5] ) );
  EDFQD1 \buffer_reg[1][4]  ( .D(data_in[4]), .E(N131), .CP(clk), .Q(
        \buffer[1][4] ) );
  EDFQD1 \buffer_reg[1][3]  ( .D(data_in[3]), .E(N131), .CP(clk), .Q(
        \buffer[1][3] ) );
  EDFQD1 \buffer_reg[1][2]  ( .D(data_in[2]), .E(N131), .CP(clk), .Q(
        \buffer[1][2] ) );
  EDFQD1 \buffer_reg[1][1]  ( .D(data_in[1]), .E(N131), .CP(clk), .Q(
        \buffer[1][1] ) );
  EDFQD1 \buffer_reg[1][0]  ( .D(data_in[0]), .E(N131), .CP(clk), .Q(
        \buffer[1][0] ) );
  EDFQD1 \buffer_reg[6][7]  ( .D(data_in[7]), .E(N136), .CP(clk), .Q(
        \buffer[6][7] ) );
  EDFQD1 \buffer_reg[6][6]  ( .D(data_in[6]), .E(N136), .CP(clk), .Q(
        \buffer[6][6] ) );
  EDFQD1 \buffer_reg[6][5]  ( .D(data_in[5]), .E(N136), .CP(clk), .Q(
        \buffer[6][5] ) );
  EDFQD1 \buffer_reg[6][4]  ( .D(data_in[4]), .E(N136), .CP(clk), .Q(
        \buffer[6][4] ) );
  EDFQD1 \buffer_reg[6][3]  ( .D(data_in[3]), .E(N136), .CP(clk), .Q(
        \buffer[6][3] ) );
  EDFQD1 \buffer_reg[6][2]  ( .D(data_in[2]), .E(N136), .CP(clk), .Q(
        \buffer[6][2] ) );
  EDFQD1 \buffer_reg[6][1]  ( .D(data_in[1]), .E(N136), .CP(clk), .Q(
        \buffer[6][1] ) );
  EDFQD1 \buffer_reg[6][0]  ( .D(data_in[0]), .E(N136), .CP(clk), .Q(
        \buffer[6][0] ) );
  EDFQD1 \buffer_reg[4][7]  ( .D(data_in[7]), .E(N134), .CP(clk), .Q(
        \buffer[4][7] ) );
  EDFQD1 \buffer_reg[4][6]  ( .D(data_in[6]), .E(N134), .CP(clk), .Q(
        \buffer[4][6] ) );
  EDFQD1 \buffer_reg[4][5]  ( .D(data_in[5]), .E(N134), .CP(clk), .Q(
        \buffer[4][5] ) );
  EDFQD1 \buffer_reg[4][4]  ( .D(data_in[4]), .E(N134), .CP(clk), .Q(
        \buffer[4][4] ) );
  EDFQD1 \buffer_reg[4][3]  ( .D(data_in[3]), .E(N134), .CP(clk), .Q(
        \buffer[4][3] ) );
  EDFQD1 \buffer_reg[4][2]  ( .D(data_in[2]), .E(N134), .CP(clk), .Q(
        \buffer[4][2] ) );
  EDFQD1 \buffer_reg[4][1]  ( .D(data_in[1]), .E(N134), .CP(clk), .Q(
        \buffer[4][1] ) );
  EDFQD1 \buffer_reg[4][0]  ( .D(data_in[0]), .E(N134), .CP(clk), .Q(
        \buffer[4][0] ) );
  EDFQD1 \buffer_reg[2][7]  ( .D(data_in[7]), .E(N132), .CP(clk), .Q(
        \buffer[2][7] ) );
  EDFQD1 \buffer_reg[2][6]  ( .D(data_in[6]), .E(N132), .CP(clk), .Q(
        \buffer[2][6] ) );
  EDFQD1 \buffer_reg[2][5]  ( .D(data_in[5]), .E(N132), .CP(clk), .Q(
        \buffer[2][5] ) );
  EDFQD1 \buffer_reg[2][4]  ( .D(data_in[4]), .E(N132), .CP(clk), .Q(
        \buffer[2][4] ) );
  EDFQD1 \buffer_reg[2][3]  ( .D(data_in[3]), .E(N132), .CP(clk), .Q(
        \buffer[2][3] ) );
  EDFQD1 \buffer_reg[2][2]  ( .D(data_in[2]), .E(N132), .CP(clk), .Q(
        \buffer[2][2] ) );
  EDFQD1 \buffer_reg[2][1]  ( .D(data_in[1]), .E(N132), .CP(clk), .Q(
        \buffer[2][1] ) );
  EDFQD1 \buffer_reg[2][0]  ( .D(data_in[0]), .E(N132), .CP(clk), .Q(
        \buffer[2][0] ) );
  EDFQD1 \buffer_reg[0][7]  ( .D(data_in[7]), .E(N130), .CP(clk), .Q(
        \buffer[0][7] ) );
  EDFQD1 \buffer_reg[0][6]  ( .D(data_in[6]), .E(N130), .CP(clk), .Q(
        \buffer[0][6] ) );
  EDFQD1 \buffer_reg[0][5]  ( .D(data_in[5]), .E(N130), .CP(clk), .Q(
        \buffer[0][5] ) );
  EDFQD1 \buffer_reg[0][4]  ( .D(data_in[4]), .E(N130), .CP(clk), .Q(
        \buffer[0][4] ) );
  EDFQD1 \buffer_reg[0][3]  ( .D(data_in[3]), .E(N130), .CP(clk), .Q(
        \buffer[0][3] ) );
  EDFQD1 \buffer_reg[0][2]  ( .D(data_in[2]), .E(N130), .CP(clk), .Q(
        \buffer[0][2] ) );
  EDFQD1 \buffer_reg[0][1]  ( .D(data_in[1]), .E(N130), .CP(clk), .Q(
        \buffer[0][1] ) );
  EDFQD1 \buffer_reg[0][0]  ( .D(data_in[0]), .E(N130), .CP(clk), .Q(
        \buffer[0][0] ) );
  EDFQD1 \wr_ptr_reg[0]  ( .D(n81), .E(N122), .CP(clk), .Q(wr_ptr[0]) );
  EDFQD1 \count_reg[0]  ( .D(n80), .E(N129), .CP(clk), .Q(count[0]) );
  EDFQD1 \wr_ptr_reg[2]  ( .D(N125), .E(N122), .CP(clk), .Q(wr_ptr[2]) );
  EDFQD1 \count_reg[1]  ( .D(N127), .E(N129), .CP(clk), .Q(count[1]) );
  EDFQD1 \count_reg[2]  ( .D(N128), .E(N129), .CP(clk), .Q(count[2]) );
  EDFQD1 \wr_ptr_reg[1]  ( .D(N124), .E(N122), .CP(clk), .Q(wr_ptr[1]) );
  CKND0 U231 ( .I(n1), .ZN(n80) );
  NR3D0 U232 ( .A1(count[0]), .A2(count[2]), .A3(count[1]), .ZN(empty) );
  INR2D0 U233 ( .A1(N14), .B1(n2), .ZN(N137) );
  NR3D0 U234 ( .A1(n3), .A2(n4), .A3(n5), .ZN(N14) );
  NR3D0 U235 ( .A1(n6), .A2(n3), .A3(n5), .ZN(N136) );
  NR2D0 U236 ( .A1(n7), .A2(n8), .ZN(N135) );
  NR2D0 U237 ( .A1(n6), .A2(n8), .ZN(N134) );
  NR2D0 U238 ( .A1(n7), .A2(n9), .ZN(N133) );
  NR2D0 U239 ( .A1(n6), .A2(n9), .ZN(N132) );
  NR3D0 U240 ( .A1(n7), .A2(wr_ptr[2]), .A3(wr_ptr[1]), .ZN(N131) );
  IND2D0 U241 ( .A1(n2), .B1(wr_ptr[0]), .ZN(n7) );
  NR3D0 U242 ( .A1(n6), .A2(wr_ptr[2]), .A3(wr_ptr[1]), .ZN(N130) );
  CKND2D0 U243 ( .A1(n81), .A2(wr_en), .ZN(n6) );
  CKND0 U244 ( .I(n10), .ZN(n81) );
  OAI211D0 U245 ( .A1(rd_en), .A2(n2), .B(n11), .C(n12), .ZN(N129) );
  OAI22D0 U246 ( .A1(rst), .A2(n13), .B1(n1), .B2(n14), .ZN(N128) );
  MUX2ND0 U247 ( .I0(n15), .I1(count[2]), .S(count[1]), .ZN(n14) );
  NR2D0 U248 ( .A1(count[2]), .A2(n11), .ZN(n15) );
  MUX2ND0 U249 ( .I0(n16), .I1(n17), .S(count[2]), .ZN(n13) );
  MUX2ND0 U250 ( .I0(count[1]), .I1(n18), .S(n19), .ZN(n17) );
  NR3D0 U251 ( .A1(n18), .A2(n19), .A3(n20), .ZN(n16) );
  CKND0 U252 ( .I(n11), .ZN(n19) );
  MUX2ND0 U253 ( .I0(n21), .I1(n1), .S(n22), .ZN(N127) );
  CKXOR2D0 U254 ( .A1(n11), .A2(n20), .Z(n22) );
  CKND0 U255 ( .I(count[1]), .ZN(n20) );
  CKND2D0 U256 ( .A1(rd_en), .A2(n23), .ZN(n11) );
  CKND2D0 U257 ( .A1(n18), .A2(n12), .ZN(n1) );
  CKND0 U258 ( .I(count[0]), .ZN(n18) );
  CKND2D0 U259 ( .A1(count[0]), .A2(n12), .ZN(n21) );
  OAI22D0 U260 ( .A1(n5), .A2(n10), .B1(n24), .B2(n25), .ZN(N125) );
  OA21D0 U261 ( .A1(n9), .A2(n4), .B(n8), .Z(n25) );
  CKND2D0 U262 ( .A1(wr_ptr[2]), .A2(n3), .ZN(n8) );
  CKND0 U263 ( .I(wr_ptr[1]), .ZN(n3) );
  CKND2D0 U264 ( .A1(wr_ptr[1]), .A2(n5), .ZN(n9) );
  CKND0 U265 ( .I(n26), .ZN(n24) );
  CKND0 U266 ( .I(wr_ptr[2]), .ZN(n5) );
  MUX2ND0 U267 ( .I0(n27), .I1(n10), .S(wr_ptr[1]), .ZN(N124) );
  CKND2D0 U268 ( .A1(n26), .A2(n4), .ZN(n10) );
  CKND2D0 U269 ( .A1(wr_ptr[0]), .A2(n26), .ZN(n27) );
  CKND2D0 U270 ( .A1(n12), .A2(n2), .ZN(N122) );
  CKND2D0 U271 ( .A1(wr_en), .A2(n26), .ZN(n2) );
  AN2D0 U272 ( .A1(data_in[19]), .A2(n28), .Z(N121) );
  AN2D0 U273 ( .A1(data_in[18]), .A2(n28), .Z(N120) );
  AN2D0 U274 ( .A1(data_in[17]), .A2(n28), .Z(N119) );
  AN2D0 U275 ( .A1(data_in[16]), .A2(n28), .Z(N118) );
  AN2D0 U276 ( .A1(data_in[15]), .A2(n28), .Z(N117) );
  AN2D0 U277 ( .A1(data_in[14]), .A2(n28), .Z(N116) );
  AN2D0 U278 ( .A1(data_in[13]), .A2(n28), .Z(N115) );
  AN2D0 U279 ( .A1(data_in[12]), .A2(n28), .Z(N114) );
  AN2D0 U280 ( .A1(data_in[11]), .A2(n28), .Z(N113) );
  AN2D0 U281 ( .A1(data_in[10]), .A2(n28), .Z(N112) );
  AN2D0 U282 ( .A1(data_in[9]), .A2(n28), .Z(N111) );
  AN2D0 U283 ( .A1(data_in[8]), .A2(n28), .Z(N110) );
  AO22D0 U284 ( .A1(data_in[7]), .A2(n28), .B1(n29), .B2(n26), .Z(N109) );
  ND4D0 U285 ( .A1(n30), .A2(n31), .A3(n32), .A4(n33), .ZN(n29) );
  AOI22D0 U286 ( .A1(\buffer[6][7] ), .A2(n34), .B1(\buffer[7][7] ), .B2(n35), 
        .ZN(n33) );
  AOI22D0 U287 ( .A1(\buffer[4][7] ), .A2(n36), .B1(\buffer[5][7] ), .B2(n37), 
        .ZN(n32) );
  AOI22D0 U288 ( .A1(\buffer[2][7] ), .A2(n38), .B1(\buffer[3][7] ), .B2(n39), 
        .ZN(n31) );
  AOI22D0 U289 ( .A1(\buffer[0][7] ), .A2(n40), .B1(\buffer[1][7] ), .B2(n41), 
        .ZN(n30) );
  AO22D0 U290 ( .A1(data_in[6]), .A2(n28), .B1(n42), .B2(n26), .Z(N108) );
  ND4D0 U291 ( .A1(n43), .A2(n44), .A3(n45), .A4(n46), .ZN(n42) );
  AOI22D0 U292 ( .A1(\buffer[6][6] ), .A2(n34), .B1(\buffer[7][6] ), .B2(n35), 
        .ZN(n46) );
  AOI22D0 U293 ( .A1(\buffer[4][6] ), .A2(n36), .B1(\buffer[5][6] ), .B2(n37), 
        .ZN(n45) );
  AOI22D0 U294 ( .A1(\buffer[2][6] ), .A2(n38), .B1(\buffer[3][6] ), .B2(n39), 
        .ZN(n44) );
  AOI22D0 U295 ( .A1(\buffer[0][6] ), .A2(n40), .B1(\buffer[1][6] ), .B2(n41), 
        .ZN(n43) );
  AO22D0 U296 ( .A1(data_in[5]), .A2(n28), .B1(n47), .B2(n26), .Z(N107) );
  ND4D0 U297 ( .A1(n48), .A2(n49), .A3(n50), .A4(n51), .ZN(n47) );
  AOI22D0 U298 ( .A1(\buffer[6][5] ), .A2(n34), .B1(\buffer[7][5] ), .B2(n35), 
        .ZN(n51) );
  AOI22D0 U299 ( .A1(\buffer[4][5] ), .A2(n36), .B1(\buffer[5][5] ), .B2(n37), 
        .ZN(n50) );
  AOI22D0 U300 ( .A1(\buffer[2][5] ), .A2(n38), .B1(\buffer[3][5] ), .B2(n39), 
        .ZN(n49) );
  AOI22D0 U301 ( .A1(\buffer[0][5] ), .A2(n40), .B1(\buffer[1][5] ), .B2(n41), 
        .ZN(n48) );
  AO22D0 U302 ( .A1(data_in[4]), .A2(n28), .B1(n52), .B2(n26), .Z(N106) );
  ND4D0 U303 ( .A1(n53), .A2(n54), .A3(n55), .A4(n56), .ZN(n52) );
  AOI22D0 U304 ( .A1(\buffer[6][4] ), .A2(n34), .B1(\buffer[7][4] ), .B2(n35), 
        .ZN(n56) );
  AOI22D0 U305 ( .A1(\buffer[4][4] ), .A2(n36), .B1(\buffer[5][4] ), .B2(n37), 
        .ZN(n55) );
  AOI22D0 U306 ( .A1(\buffer[2][4] ), .A2(n38), .B1(\buffer[3][4] ), .B2(n39), 
        .ZN(n54) );
  AOI22D0 U307 ( .A1(\buffer[0][4] ), .A2(n40), .B1(\buffer[1][4] ), .B2(n41), 
        .ZN(n53) );
  AO22D0 U308 ( .A1(data_in[3]), .A2(n28), .B1(n57), .B2(n26), .Z(N105) );
  ND4D0 U309 ( .A1(n58), .A2(n59), .A3(n60), .A4(n61), .ZN(n57) );
  AOI22D0 U310 ( .A1(\buffer[6][3] ), .A2(n34), .B1(\buffer[7][3] ), .B2(n35), 
        .ZN(n61) );
  AOI22D0 U311 ( .A1(\buffer[4][3] ), .A2(n36), .B1(\buffer[5][3] ), .B2(n37), 
        .ZN(n60) );
  AOI22D0 U312 ( .A1(\buffer[2][3] ), .A2(n38), .B1(\buffer[3][3] ), .B2(n39), 
        .ZN(n59) );
  AOI22D0 U313 ( .A1(\buffer[0][3] ), .A2(n40), .B1(\buffer[1][3] ), .B2(n41), 
        .ZN(n58) );
  AO22D0 U314 ( .A1(data_in[2]), .A2(n28), .B1(n62), .B2(n26), .Z(N104) );
  ND4D0 U315 ( .A1(n63), .A2(n64), .A3(n65), .A4(n66), .ZN(n62) );
  AOI22D0 U316 ( .A1(\buffer[6][2] ), .A2(n34), .B1(\buffer[7][2] ), .B2(n35), 
        .ZN(n66) );
  AOI22D0 U317 ( .A1(\buffer[4][2] ), .A2(n36), .B1(\buffer[5][2] ), .B2(n37), 
        .ZN(n65) );
  AOI22D0 U318 ( .A1(\buffer[2][2] ), .A2(n38), .B1(\buffer[3][2] ), .B2(n39), 
        .ZN(n64) );
  AOI22D0 U319 ( .A1(\buffer[0][2] ), .A2(n40), .B1(\buffer[1][2] ), .B2(n41), 
        .ZN(n63) );
  AO22D0 U320 ( .A1(data_in[1]), .A2(n28), .B1(n67), .B2(n26), .Z(N103) );
  ND4D0 U321 ( .A1(n68), .A2(n69), .A3(n70), .A4(n71), .ZN(n67) );
  AOI22D0 U322 ( .A1(\buffer[6][1] ), .A2(n34), .B1(\buffer[7][1] ), .B2(n35), 
        .ZN(n71) );
  AOI22D0 U323 ( .A1(\buffer[4][1] ), .A2(n36), .B1(\buffer[5][1] ), .B2(n37), 
        .ZN(n70) );
  AOI22D0 U324 ( .A1(\buffer[2][1] ), .A2(n38), .B1(\buffer[3][1] ), .B2(n39), 
        .ZN(n69) );
  AOI22D0 U325 ( .A1(\buffer[0][1] ), .A2(n40), .B1(\buffer[1][1] ), .B2(n41), 
        .ZN(n68) );
  AO22D0 U326 ( .A1(data_in[0]), .A2(n28), .B1(n72), .B2(n26), .Z(N102) );
  OAI21D0 U327 ( .A1(rst), .A2(n73), .B(N101), .ZN(n26) );
  ND4D0 U328 ( .A1(n74), .A2(n75), .A3(n76), .A4(n77), .ZN(n72) );
  AOI22D0 U329 ( .A1(\buffer[6][0] ), .A2(n34), .B1(\buffer[7][0] ), .B2(n35), 
        .ZN(n77) );
  INR3D0 U330 ( .A1(rd_ptr[2]), .B1(n78), .B2(n79), .ZN(n35) );
  INR3D0 U331 ( .A1(rd_ptr[2]), .B1(n78), .B2(rd_ptr[0]), .ZN(n34) );
  AOI22D0 U332 ( .A1(\buffer[4][0] ), .A2(n36), .B1(\buffer[5][0] ), .B2(n37), 
        .ZN(n76) );
  INR3D0 U333 ( .A1(rd_ptr[2]), .B1(n79), .B2(rd_ptr[1]), .ZN(n37) );
  INR3D0 U334 ( .A1(rd_ptr[2]), .B1(rd_ptr[0]), .B2(rd_ptr[1]), .ZN(n36) );
  AOI22D0 U335 ( .A1(\buffer[2][0] ), .A2(n38), .B1(\buffer[3][0] ), .B2(n39), 
        .ZN(n75) );
  NR3D0 U336 ( .A1(n79), .A2(rd_ptr[2]), .A3(n78), .ZN(n39) );
  NR3D0 U337 ( .A1(rd_ptr[0]), .A2(rd_ptr[2]), .A3(n78), .ZN(n38) );
  CKND0 U338 ( .I(rd_ptr[1]), .ZN(n78) );
  AOI22D0 U339 ( .A1(\buffer[0][0] ), .A2(n40), .B1(\buffer[1][0] ), .B2(n41), 
        .ZN(n74) );
  NR3D0 U340 ( .A1(rd_ptr[1]), .A2(rd_ptr[2]), .A3(n79), .ZN(n41) );
  NR3D0 U341 ( .A1(rd_ptr[1]), .A2(rd_ptr[2]), .A3(rd_ptr[0]), .ZN(n40) );
  AN3D0 U342 ( .A1(rd_en), .A2(n12), .A3(n73), .Z(n28) );
  NR3D0 U343 ( .A1(n23), .A2(n79), .A3(n4), .ZN(n73) );
  CKND0 U344 ( .I(wr_ptr[0]), .ZN(n4) );
  CKND0 U345 ( .I(rd_ptr[0]), .ZN(n79) );
  CKND0 U346 ( .I(wr_en), .ZN(n23) );
  CKND0 U347 ( .I(rst), .ZN(n12) );
  OR2D0 U348 ( .A1(rd_en), .A2(rst), .Z(N101) );
endmodule


module arbiter ( clk, rst, neuron_0_port, neuron_1_port, neuron_2_port, 
        neuron_3_port, neuron_4_port, neuron_5_port, neuron_6_port, 
        neuron_7_port, neuron_0_done, neuron_1_done, neuron_2_done, 
        neuron_3_done, neuron_4_done, neuron_5_done, neuron_6_done, 
        neuron_7_done, neuron_0_connection, neuron_1_connection, 
        neuron_2_connection, neuron_3_connection, neuron_4_connection, 
        neuron_5_connection, neuron_6_connection, neuron_7_connection, 
        router_port_0, router_port_1, router_port_2, router_port_3, 
        router_port_4, router_port_5, router_port_6, router_port_7 );
  input [15:0] neuron_0_port;
  input [15:0] neuron_1_port;
  input [15:0] neuron_2_port;
  input [15:0] neuron_3_port;
  input [15:0] neuron_4_port;
  input [15:0] neuron_5_port;
  input [15:0] neuron_6_port;
  input [15:0] neuron_7_port;
  input [7:0] neuron_0_connection;
  input [7:0] neuron_1_connection;
  input [7:0] neuron_2_connection;
  input [7:0] neuron_3_connection;
  input [7:0] neuron_4_connection;
  input [7:0] neuron_5_connection;
  input [7:0] neuron_6_connection;
  input [7:0] neuron_7_connection;
  output [19:0] router_port_0;
  output [19:0] router_port_1;
  output [19:0] router_port_2;
  output [19:0] router_port_3;
  output [19:0] router_port_4;
  output [19:0] router_port_5;
  output [19:0] router_port_6;
  output [19:0] router_port_7;
  input clk, rst, neuron_0_done, neuron_1_done, neuron_2_done, neuron_3_done,
         neuron_4_done, neuron_5_done, neuron_6_done, neuron_7_done;
  wire   buffer_0_empty, buffer_0_rd_en, buffer_1_empty, buffer_1_rd_en,
         buffer_2_empty, buffer_2_rd_en, buffer_3_empty, buffer_3_rd_en,
         buffer_4_empty, buffer_4_rd_en, buffer_5_empty, buffer_5_rd_en,
         buffer_6_empty, buffer_6_rd_en, buffer_7_empty, buffer_0_wr_en,
         buffer_7_rd_en, n1, n2, n3, n4, n5, n6, n7, n8, n170, n171, n172,
         n173, n174, n175, n176, n177, n178, n179, n180, n181, n182, n183,
         n184, n185, n186, n187, n188, n189, n190, n191, n192, n209, n210,
         n211, n212, n213, n214, n215, n216, n217, n218, n219, n220, n221,
         n222, n223, n224, n225, n226, n227, n228, n229, n230, n231, n248,
         n249, n250, n251, n252, n253, n254, n255, n256, n257, n258, n259,
         n260, n261, n262, n263, n264, n265, n266, n267, n268, n269, n270,
         n287, n288, n289, n290, n291, n292, n293, n294, n295, n296, n297,
         n298, n299, n300, n301, n302, n303, n304, n305, n306, n307, n308,
         n309, n326, n327, n328, n329, n330, n331, n332, n333, n334, n335,
         n336, n337, n338, n339, n340, n341, n342, n343, n344, n345, n346,
         n347, n348, n365, n366, n367, n368, n369, n370, n371, n372, n373,
         n374, n375, n376, n377, n378, n379, n380, n381, n382, n383, n384,
         n385, n386, n387, n404, n405, n406, n407, n408, n409, n410, n411,
         n412, n413, n414, n415, n416, n417, n418, n419, n420, n421, n422,
         n423, n424, n425, n426, n427, n428, n429, n430, n431, n432, n433,
         n434, n435, n436, n437, n438, n439, n440, n441, n442, n443, n444,
         n445, n446, n447, n448, n449, n482, n483, n484, n485, n486, n487,
         n488, n489, n490, n491, n492, n493, n494, n495, n496, n497, n498,
         n499, n500, n501, n502, n503, n504, n505, n506, n507, n508, n509,
         n510, n511, n512, n513, n514, n515, n516, n517, n518, n519, n520,
         n521, n522;
  wire   [19:0] buffer_0_data_in;
  wire   [19:0] buffer_0_data_out;
  wire   [2:0] buffer_0_rd_ptr;
  wire   [19:0] buffer_1_data_in;
  wire   [19:0] buffer_1_data_out;
  wire   [2:0] buffer_1_rd_ptr;
  wire   [19:0] buffer_2_data_in;
  wire   [19:0] buffer_2_data_out;
  wire   [2:0] buffer_2_rd_ptr;
  wire   [19:0] buffer_3_data_in;
  wire   [19:0] buffer_3_data_out;
  wire   [2:0] buffer_3_rd_ptr;
  wire   [19:0] buffer_4_data_in;
  wire   [19:0] buffer_4_data_out;
  wire   [2:0] buffer_4_rd_ptr;
  wire   [19:0] buffer_5_data_in;
  wire   [19:0] buffer_5_data_out;
  wire   [2:0] buffer_5_rd_ptr;
  wire   [19:0] buffer_6_data_in;
  wire   [19:0] buffer_6_data_out;
  wire   [2:0] buffer_6_rd_ptr;
  wire   [19:0] buffer_7_data_in;
  wire   [19:0] buffer_7_data_out;
  wire   [2:0] buffer_7_rd_ptr;

  allocation_buffer_0 u0_allocation_buffer ( .clk(clk), .rst(rst), .data_in({
        n482, n482, n482, n482, buffer_0_data_in[15:0]}), .data_out(
        buffer_0_data_out), .empty(buffer_0_empty), .rd_ptr(buffer_0_rd_ptr), 
        .wr_en(buffer_0_wr_en), .rd_en(buffer_0_rd_en) );
  allocation_buffer_7 u1_allocation_buffer ( .clk(clk), .rst(rst), .data_in({
        n482, n482, n482, buffer_0_wr_en, buffer_1_data_in[15:0]}), .data_out(
        buffer_1_data_out), .empty(buffer_1_empty), .rd_ptr(buffer_1_rd_ptr), 
        .wr_en(buffer_0_wr_en), .rd_en(buffer_1_rd_en) );
  allocation_buffer_6 u2_allocation_buffer ( .clk(clk), .rst(rst), .data_in({
        n482, n482, buffer_0_wr_en, n482, buffer_2_data_in[15:0]}), .data_out(
        buffer_2_data_out), .empty(buffer_2_empty), .rd_ptr(buffer_2_rd_ptr), 
        .wr_en(buffer_0_wr_en), .rd_en(buffer_2_rd_en) );
  allocation_buffer_5 u3_allocation_buffer ( .clk(clk), .rst(rst), .data_in({
        n482, n482, buffer_0_wr_en, buffer_0_wr_en, buffer_3_data_in[15:0]}), 
        .data_out(buffer_3_data_out), .empty(buffer_3_empty), .rd_ptr(
        buffer_3_rd_ptr), .wr_en(buffer_0_wr_en), .rd_en(buffer_3_rd_en) );
  allocation_buffer_4 u4_allocation_buffer ( .clk(clk), .rst(rst), .data_in({
        n482, buffer_0_wr_en, n482, n482, buffer_4_data_in[15:0]}), .data_out(
        buffer_4_data_out), .empty(buffer_4_empty), .rd_ptr(buffer_4_rd_ptr), 
        .wr_en(buffer_0_wr_en), .rd_en(buffer_4_rd_en) );
  allocation_buffer_3 u5_allocation_buffer ( .clk(clk), .rst(rst), .data_in({
        n482, buffer_0_wr_en, n482, buffer_0_wr_en, buffer_5_data_in[15:0]}), 
        .data_out(buffer_5_data_out), .empty(buffer_5_empty), .rd_ptr(
        buffer_5_rd_ptr), .wr_en(buffer_0_wr_en), .rd_en(buffer_5_rd_en) );
  allocation_buffer_2 u6_allocation_buffer ( .clk(clk), .rst(rst), .data_in({
        n482, buffer_0_wr_en, buffer_0_wr_en, n482, buffer_6_data_in[15:0]}), 
        .data_out(buffer_6_data_out), .empty(buffer_6_empty), .rd_ptr(
        buffer_6_rd_ptr), .wr_en(buffer_0_wr_en), .rd_en(buffer_6_rd_en) );
  allocation_buffer_1 u7_allocation_buffer ( .clk(clk), .rst(rst), .data_in({
        n482, buffer_0_wr_en, buffer_0_wr_en, buffer_0_wr_en, 
        buffer_7_data_in[15:0]}), .data_out(buffer_7_data_out), .empty(
        buffer_7_empty), .rd_ptr(buffer_7_rd_ptr), .wr_en(buffer_0_wr_en), 
        .rd_en(buffer_7_rd_en) );
  DFND1 \buffer_6_data_in_reg[15]  ( .D(buffer_6_data_in[15]), .CPN(clk), .Q(
        buffer_6_data_in[15]) );
  DFND1 \buffer_6_data_in_reg[14]  ( .D(buffer_6_data_in[14]), .CPN(clk), .Q(
        buffer_6_data_in[14]) );
  DFND1 \buffer_6_data_in_reg[13]  ( .D(buffer_6_data_in[13]), .CPN(clk), .Q(
        buffer_6_data_in[13]) );
  DFND1 \buffer_6_data_in_reg[12]  ( .D(buffer_6_data_in[12]), .CPN(clk), .Q(
        buffer_6_data_in[12]) );
  DFND1 \buffer_6_data_in_reg[11]  ( .D(buffer_6_data_in[11]), .CPN(clk), .Q(
        buffer_6_data_in[11]) );
  DFND1 \buffer_6_data_in_reg[10]  ( .D(buffer_6_data_in[10]), .CPN(clk), .Q(
        buffer_6_data_in[10]) );
  DFND1 \buffer_6_data_in_reg[9]  ( .D(buffer_6_data_in[9]), .CPN(clk), .Q(
        buffer_6_data_in[9]) );
  DFND1 \buffer_6_data_in_reg[8]  ( .D(buffer_6_data_in[8]), .CPN(clk), .Q(
        buffer_6_data_in[8]) );
  DFND1 \buffer_6_data_in_reg[7]  ( .D(buffer_6_data_in[7]), .CPN(clk), .Q(
        buffer_6_data_in[7]) );
  DFND1 \buffer_6_data_in_reg[6]  ( .D(buffer_6_data_in[6]), .CPN(clk), .Q(
        buffer_6_data_in[6]) );
  DFND1 \buffer_6_data_in_reg[5]  ( .D(buffer_6_data_in[5]), .CPN(clk), .Q(
        buffer_6_data_in[5]) );
  DFND1 \buffer_6_data_in_reg[4]  ( .D(buffer_6_data_in[4]), .CPN(clk), .Q(
        buffer_6_data_in[4]) );
  DFND1 \buffer_6_data_in_reg[3]  ( .D(buffer_6_data_in[3]), .CPN(clk), .Q(
        buffer_6_data_in[3]) );
  DFND1 \buffer_6_data_in_reg[2]  ( .D(buffer_6_data_in[2]), .CPN(clk), .Q(
        buffer_6_data_in[2]) );
  DFND1 \buffer_6_data_in_reg[1]  ( .D(buffer_6_data_in[1]), .CPN(clk), .Q(
        buffer_6_data_in[1]) );
  DFND1 \buffer_6_data_in_reg[0]  ( .D(buffer_6_data_in[0]), .CPN(clk), .Q(
        buffer_6_data_in[0]) );
  DFND1 \buffer_7_data_in_reg[15]  ( .D(buffer_7_data_in[15]), .CPN(clk), .Q(
        buffer_7_data_in[15]) );
  DFND1 \buffer_7_data_in_reg[14]  ( .D(buffer_7_data_in[14]), .CPN(clk), .Q(
        buffer_7_data_in[14]) );
  DFND1 \buffer_7_data_in_reg[13]  ( .D(buffer_7_data_in[13]), .CPN(clk), .Q(
        buffer_7_data_in[13]) );
  DFND1 \buffer_7_data_in_reg[12]  ( .D(buffer_7_data_in[12]), .CPN(clk), .Q(
        buffer_7_data_in[12]) );
  DFND1 \buffer_7_data_in_reg[11]  ( .D(buffer_7_data_in[11]), .CPN(clk), .Q(
        buffer_7_data_in[11]) );
  DFND1 \buffer_7_data_in_reg[10]  ( .D(buffer_7_data_in[10]), .CPN(clk), .Q(
        buffer_7_data_in[10]) );
  DFND1 \buffer_7_data_in_reg[9]  ( .D(buffer_7_data_in[9]), .CPN(clk), .Q(
        buffer_7_data_in[9]) );
  DFND1 \buffer_7_data_in_reg[8]  ( .D(buffer_7_data_in[8]), .CPN(clk), .Q(
        buffer_7_data_in[8]) );
  DFND1 \buffer_7_data_in_reg[7]  ( .D(buffer_7_data_in[7]), .CPN(clk), .Q(
        buffer_7_data_in[7]) );
  DFND1 \buffer_7_data_in_reg[6]  ( .D(buffer_7_data_in[6]), .CPN(clk), .Q(
        buffer_7_data_in[6]) );
  DFND1 \buffer_7_data_in_reg[5]  ( .D(buffer_7_data_in[5]), .CPN(clk), .Q(
        buffer_7_data_in[5]) );
  DFND1 \buffer_7_data_in_reg[4]  ( .D(buffer_7_data_in[4]), .CPN(clk), .Q(
        buffer_7_data_in[4]) );
  DFND1 \buffer_7_data_in_reg[3]  ( .D(buffer_7_data_in[3]), .CPN(clk), .Q(
        buffer_7_data_in[3]) );
  DFND1 \buffer_7_data_in_reg[2]  ( .D(buffer_7_data_in[2]), .CPN(clk), .Q(
        buffer_7_data_in[2]) );
  DFND1 \buffer_7_data_in_reg[1]  ( .D(buffer_7_data_in[1]), .CPN(clk), .Q(
        buffer_7_data_in[1]) );
  DFND1 \buffer_7_data_in_reg[0]  ( .D(buffer_7_data_in[0]), .CPN(clk), .Q(
        buffer_7_data_in[0]) );
  DFQD1 buffer_7_rd_en_reg ( .D(n8), .CP(clk), .Q(buffer_7_rd_en) );
  DFND1 \buffer_7_rd_ptr_reg[0]  ( .D(n449), .CPN(clk), .Q(buffer_7_rd_ptr[0]), 
        .QN(n522) );
  DFND1 \buffer_7_rd_ptr_reg[1]  ( .D(n448), .CPN(clk), .Q(buffer_7_rd_ptr[1]), 
        .QN(n521) );
  DFND1 \buffer_7_rd_ptr_reg[2]  ( .D(n447), .CPN(clk), .Q(buffer_7_rd_ptr[2])
         );
  DFQD1 buffer_6_rd_en_reg ( .D(n7), .CP(clk), .Q(buffer_6_rd_en) );
  DFND1 \buffer_6_rd_ptr_reg[0]  ( .D(n426), .CPN(clk), .Q(buffer_6_rd_ptr[0]), 
        .QN(n520) );
  DFND1 \buffer_6_rd_ptr_reg[1]  ( .D(n425), .CPN(clk), .Q(buffer_6_rd_ptr[1]), 
        .QN(n519) );
  DFND1 \buffer_6_rd_ptr_reg[2]  ( .D(n424), .CPN(clk), .Q(buffer_6_rd_ptr[2])
         );
  DFND1 \buffer_5_data_in_reg[15]  ( .D(buffer_5_data_in[15]), .CPN(clk), .Q(
        buffer_5_data_in[15]) );
  DFND1 \buffer_5_data_in_reg[14]  ( .D(buffer_5_data_in[14]), .CPN(clk), .Q(
        buffer_5_data_in[14]) );
  DFND1 \buffer_5_data_in_reg[13]  ( .D(buffer_5_data_in[13]), .CPN(clk), .Q(
        buffer_5_data_in[13]) );
  DFND1 \buffer_5_data_in_reg[12]  ( .D(buffer_5_data_in[12]), .CPN(clk), .Q(
        buffer_5_data_in[12]) );
  DFND1 \buffer_5_data_in_reg[11]  ( .D(buffer_5_data_in[11]), .CPN(clk), .Q(
        buffer_5_data_in[11]) );
  DFND1 \buffer_5_data_in_reg[10]  ( .D(buffer_5_data_in[10]), .CPN(clk), .Q(
        buffer_5_data_in[10]) );
  DFND1 \buffer_5_data_in_reg[9]  ( .D(buffer_5_data_in[9]), .CPN(clk), .Q(
        buffer_5_data_in[9]) );
  DFND1 \buffer_5_data_in_reg[8]  ( .D(buffer_5_data_in[8]), .CPN(clk), .Q(
        buffer_5_data_in[8]) );
  DFND1 \buffer_5_data_in_reg[7]  ( .D(buffer_5_data_in[7]), .CPN(clk), .Q(
        buffer_5_data_in[7]) );
  DFND1 \buffer_5_data_in_reg[6]  ( .D(buffer_5_data_in[6]), .CPN(clk), .Q(
        buffer_5_data_in[6]) );
  DFND1 \buffer_5_data_in_reg[5]  ( .D(buffer_5_data_in[5]), .CPN(clk), .Q(
        buffer_5_data_in[5]) );
  DFND1 \buffer_5_data_in_reg[4]  ( .D(buffer_5_data_in[4]), .CPN(clk), .Q(
        buffer_5_data_in[4]) );
  DFND1 \buffer_5_data_in_reg[3]  ( .D(buffer_5_data_in[3]), .CPN(clk), .Q(
        buffer_5_data_in[3]) );
  DFND1 \buffer_5_data_in_reg[2]  ( .D(buffer_5_data_in[2]), .CPN(clk), .Q(
        buffer_5_data_in[2]) );
  DFND1 \buffer_5_data_in_reg[1]  ( .D(buffer_5_data_in[1]), .CPN(clk), .Q(
        buffer_5_data_in[1]) );
  DFND1 \buffer_5_data_in_reg[0]  ( .D(buffer_5_data_in[0]), .CPN(clk), .Q(
        buffer_5_data_in[0]) );
  DFQD1 buffer_5_rd_en_reg ( .D(n6), .CP(clk), .Q(buffer_5_rd_en) );
  DFND1 \buffer_5_rd_ptr_reg[0]  ( .D(n387), .CPN(clk), .Q(buffer_5_rd_ptr[0]), 
        .QN(n518) );
  DFND1 \buffer_5_rd_ptr_reg[1]  ( .D(n386), .CPN(clk), .Q(buffer_5_rd_ptr[1]), 
        .QN(n517) );
  DFND1 \buffer_5_rd_ptr_reg[2]  ( .D(n385), .CPN(clk), .Q(buffer_5_rd_ptr[2])
         );
  DFND1 \buffer_4_data_in_reg[15]  ( .D(buffer_4_data_in[15]), .CPN(clk), .Q(
        buffer_4_data_in[15]) );
  DFND1 \buffer_4_data_in_reg[14]  ( .D(buffer_4_data_in[14]), .CPN(clk), .Q(
        buffer_4_data_in[14]) );
  DFND1 \buffer_4_data_in_reg[13]  ( .D(buffer_4_data_in[13]), .CPN(clk), .Q(
        buffer_4_data_in[13]) );
  DFND1 \buffer_4_data_in_reg[12]  ( .D(buffer_4_data_in[12]), .CPN(clk), .Q(
        buffer_4_data_in[12]) );
  DFND1 \buffer_4_data_in_reg[11]  ( .D(buffer_4_data_in[11]), .CPN(clk), .Q(
        buffer_4_data_in[11]) );
  DFND1 \buffer_4_data_in_reg[10]  ( .D(buffer_4_data_in[10]), .CPN(clk), .Q(
        buffer_4_data_in[10]) );
  DFND1 \buffer_4_data_in_reg[9]  ( .D(buffer_4_data_in[9]), .CPN(clk), .Q(
        buffer_4_data_in[9]) );
  DFND1 \buffer_4_data_in_reg[8]  ( .D(buffer_4_data_in[8]), .CPN(clk), .Q(
        buffer_4_data_in[8]) );
  DFND1 \buffer_4_data_in_reg[7]  ( .D(buffer_4_data_in[7]), .CPN(clk), .Q(
        buffer_4_data_in[7]) );
  DFND1 \buffer_4_data_in_reg[6]  ( .D(buffer_4_data_in[6]), .CPN(clk), .Q(
        buffer_4_data_in[6]) );
  DFND1 \buffer_4_data_in_reg[5]  ( .D(buffer_4_data_in[5]), .CPN(clk), .Q(
        buffer_4_data_in[5]) );
  DFND1 \buffer_4_data_in_reg[4]  ( .D(buffer_4_data_in[4]), .CPN(clk), .Q(
        buffer_4_data_in[4]) );
  DFND1 \buffer_4_data_in_reg[3]  ( .D(buffer_4_data_in[3]), .CPN(clk), .Q(
        buffer_4_data_in[3]) );
  DFND1 \buffer_4_data_in_reg[2]  ( .D(buffer_4_data_in[2]), .CPN(clk), .Q(
        buffer_4_data_in[2]) );
  DFND1 \buffer_4_data_in_reg[1]  ( .D(buffer_4_data_in[1]), .CPN(clk), .Q(
        buffer_4_data_in[1]) );
  DFND1 \buffer_4_data_in_reg[0]  ( .D(buffer_4_data_in[0]), .CPN(clk), .Q(
        buffer_4_data_in[0]) );
  DFQD1 buffer_4_rd_en_reg ( .D(n5), .CP(clk), .Q(buffer_4_rd_en) );
  DFND1 \buffer_4_rd_ptr_reg[0]  ( .D(n348), .CPN(clk), .Q(buffer_4_rd_ptr[0]), 
        .QN(n516) );
  DFND1 \buffer_4_rd_ptr_reg[1]  ( .D(n347), .CPN(clk), .Q(buffer_4_rd_ptr[1]), 
        .QN(n515) );
  DFND1 \buffer_4_rd_ptr_reg[2]  ( .D(n346), .CPN(clk), .Q(buffer_4_rd_ptr[2])
         );
  DFND1 \buffer_3_data_in_reg[15]  ( .D(buffer_3_data_in[15]), .CPN(clk), .Q(
        buffer_3_data_in[15]) );
  DFND1 \buffer_3_data_in_reg[14]  ( .D(buffer_3_data_in[14]), .CPN(clk), .Q(
        buffer_3_data_in[14]) );
  DFND1 \buffer_3_data_in_reg[13]  ( .D(buffer_3_data_in[13]), .CPN(clk), .Q(
        buffer_3_data_in[13]) );
  DFND1 \buffer_3_data_in_reg[12]  ( .D(buffer_3_data_in[12]), .CPN(clk), .Q(
        buffer_3_data_in[12]) );
  DFND1 \buffer_3_data_in_reg[11]  ( .D(buffer_3_data_in[11]), .CPN(clk), .Q(
        buffer_3_data_in[11]) );
  DFND1 \buffer_3_data_in_reg[10]  ( .D(buffer_3_data_in[10]), .CPN(clk), .Q(
        buffer_3_data_in[10]) );
  DFND1 \buffer_3_data_in_reg[9]  ( .D(buffer_3_data_in[9]), .CPN(clk), .Q(
        buffer_3_data_in[9]) );
  DFND1 \buffer_3_data_in_reg[8]  ( .D(buffer_3_data_in[8]), .CPN(clk), .Q(
        buffer_3_data_in[8]) );
  DFND1 \buffer_3_data_in_reg[7]  ( .D(buffer_3_data_in[7]), .CPN(clk), .Q(
        buffer_3_data_in[7]) );
  DFND1 \buffer_3_data_in_reg[6]  ( .D(buffer_3_data_in[6]), .CPN(clk), .Q(
        buffer_3_data_in[6]) );
  DFND1 \buffer_3_data_in_reg[5]  ( .D(buffer_3_data_in[5]), .CPN(clk), .Q(
        buffer_3_data_in[5]) );
  DFND1 \buffer_3_data_in_reg[4]  ( .D(buffer_3_data_in[4]), .CPN(clk), .Q(
        buffer_3_data_in[4]) );
  DFND1 \buffer_3_data_in_reg[3]  ( .D(buffer_3_data_in[3]), .CPN(clk), .Q(
        buffer_3_data_in[3]) );
  DFND1 \buffer_3_data_in_reg[2]  ( .D(buffer_3_data_in[2]), .CPN(clk), .Q(
        buffer_3_data_in[2]) );
  DFND1 \buffer_3_data_in_reg[1]  ( .D(buffer_3_data_in[1]), .CPN(clk), .Q(
        buffer_3_data_in[1]) );
  DFND1 \buffer_3_data_in_reg[0]  ( .D(buffer_3_data_in[0]), .CPN(clk), .Q(
        buffer_3_data_in[0]) );
  DFQD1 buffer_3_rd_en_reg ( .D(n4), .CP(clk), .Q(buffer_3_rd_en) );
  DFND1 \buffer_3_rd_ptr_reg[0]  ( .D(n309), .CPN(clk), .Q(buffer_3_rd_ptr[0]), 
        .QN(n514) );
  DFND1 \buffer_3_rd_ptr_reg[1]  ( .D(n308), .CPN(clk), .Q(buffer_3_rd_ptr[1]), 
        .QN(n513) );
  DFND1 \buffer_3_rd_ptr_reg[2]  ( .D(n307), .CPN(clk), .Q(buffer_3_rd_ptr[2])
         );
  DFND1 \buffer_2_data_in_reg[15]  ( .D(buffer_2_data_in[15]), .CPN(clk), .Q(
        buffer_2_data_in[15]) );
  DFND1 \buffer_2_data_in_reg[14]  ( .D(buffer_2_data_in[14]), .CPN(clk), .Q(
        buffer_2_data_in[14]) );
  DFND1 \buffer_2_data_in_reg[13]  ( .D(buffer_2_data_in[13]), .CPN(clk), .Q(
        buffer_2_data_in[13]) );
  DFND1 \buffer_2_data_in_reg[12]  ( .D(buffer_2_data_in[12]), .CPN(clk), .Q(
        buffer_2_data_in[12]) );
  DFND1 \buffer_2_data_in_reg[11]  ( .D(buffer_2_data_in[11]), .CPN(clk), .Q(
        buffer_2_data_in[11]) );
  DFND1 \buffer_2_data_in_reg[10]  ( .D(buffer_2_data_in[10]), .CPN(clk), .Q(
        buffer_2_data_in[10]) );
  DFND1 \buffer_2_data_in_reg[9]  ( .D(buffer_2_data_in[9]), .CPN(clk), .Q(
        buffer_2_data_in[9]) );
  DFND1 \buffer_2_data_in_reg[8]  ( .D(buffer_2_data_in[8]), .CPN(clk), .Q(
        buffer_2_data_in[8]) );
  DFND1 \buffer_2_data_in_reg[7]  ( .D(buffer_2_data_in[7]), .CPN(clk), .Q(
        buffer_2_data_in[7]) );
  DFND1 \buffer_2_data_in_reg[6]  ( .D(buffer_2_data_in[6]), .CPN(clk), .Q(
        buffer_2_data_in[6]) );
  DFND1 \buffer_2_data_in_reg[5]  ( .D(buffer_2_data_in[5]), .CPN(clk), .Q(
        buffer_2_data_in[5]) );
  DFND1 \buffer_2_data_in_reg[4]  ( .D(buffer_2_data_in[4]), .CPN(clk), .Q(
        buffer_2_data_in[4]) );
  DFND1 \buffer_2_data_in_reg[3]  ( .D(buffer_2_data_in[3]), .CPN(clk), .Q(
        buffer_2_data_in[3]) );
  DFND1 \buffer_2_data_in_reg[2]  ( .D(buffer_2_data_in[2]), .CPN(clk), .Q(
        buffer_2_data_in[2]) );
  DFND1 \buffer_2_data_in_reg[1]  ( .D(buffer_2_data_in[1]), .CPN(clk), .Q(
        buffer_2_data_in[1]) );
  DFND1 \buffer_2_data_in_reg[0]  ( .D(buffer_2_data_in[0]), .CPN(clk), .Q(
        buffer_2_data_in[0]) );
  DFQD1 buffer_2_rd_en_reg ( .D(n3), .CP(clk), .Q(buffer_2_rd_en) );
  DFND1 \buffer_2_rd_ptr_reg[0]  ( .D(n270), .CPN(clk), .Q(buffer_2_rd_ptr[0]), 
        .QN(n512) );
  DFND1 \buffer_2_rd_ptr_reg[1]  ( .D(n269), .CPN(clk), .Q(buffer_2_rd_ptr[1]), 
        .QN(n511) );
  DFND1 \buffer_2_rd_ptr_reg[2]  ( .D(n268), .CPN(clk), .Q(buffer_2_rd_ptr[2])
         );
  DFND1 \buffer_1_data_in_reg[15]  ( .D(buffer_1_data_in[15]), .CPN(clk), .Q(
        buffer_1_data_in[15]) );
  DFND1 \buffer_1_data_in_reg[14]  ( .D(buffer_1_data_in[14]), .CPN(clk), .Q(
        buffer_1_data_in[14]) );
  DFND1 \buffer_1_data_in_reg[13]  ( .D(buffer_1_data_in[13]), .CPN(clk), .Q(
        buffer_1_data_in[13]) );
  DFND1 \buffer_1_data_in_reg[12]  ( .D(buffer_1_data_in[12]), .CPN(clk), .Q(
        buffer_1_data_in[12]) );
  DFND1 \buffer_1_data_in_reg[11]  ( .D(buffer_1_data_in[11]), .CPN(clk), .Q(
        buffer_1_data_in[11]) );
  DFND1 \buffer_1_data_in_reg[10]  ( .D(buffer_1_data_in[10]), .CPN(clk), .Q(
        buffer_1_data_in[10]) );
  DFND1 \buffer_1_data_in_reg[9]  ( .D(buffer_1_data_in[9]), .CPN(clk), .Q(
        buffer_1_data_in[9]) );
  DFND1 \buffer_1_data_in_reg[8]  ( .D(buffer_1_data_in[8]), .CPN(clk), .Q(
        buffer_1_data_in[8]) );
  DFND1 \buffer_1_data_in_reg[7]  ( .D(buffer_1_data_in[7]), .CPN(clk), .Q(
        buffer_1_data_in[7]) );
  DFND1 \buffer_1_data_in_reg[6]  ( .D(buffer_1_data_in[6]), .CPN(clk), .Q(
        buffer_1_data_in[6]) );
  DFND1 \buffer_1_data_in_reg[5]  ( .D(buffer_1_data_in[5]), .CPN(clk), .Q(
        buffer_1_data_in[5]) );
  DFND1 \buffer_1_data_in_reg[4]  ( .D(buffer_1_data_in[4]), .CPN(clk), .Q(
        buffer_1_data_in[4]) );
  DFND1 \buffer_1_data_in_reg[3]  ( .D(buffer_1_data_in[3]), .CPN(clk), .Q(
        buffer_1_data_in[3]) );
  DFND1 \buffer_1_data_in_reg[2]  ( .D(buffer_1_data_in[2]), .CPN(clk), .Q(
        buffer_1_data_in[2]) );
  DFND1 \buffer_1_data_in_reg[1]  ( .D(buffer_1_data_in[1]), .CPN(clk), .Q(
        buffer_1_data_in[1]) );
  DFND1 \buffer_1_data_in_reg[0]  ( .D(buffer_1_data_in[0]), .CPN(clk), .Q(
        buffer_1_data_in[0]) );
  DFQD1 buffer_1_rd_en_reg ( .D(n2), .CP(clk), .Q(buffer_1_rd_en) );
  DFND1 \buffer_1_rd_ptr_reg[0]  ( .D(n231), .CPN(clk), .Q(buffer_1_rd_ptr[0]), 
        .QN(n510) );
  DFND1 \buffer_1_rd_ptr_reg[1]  ( .D(n230), .CPN(clk), .Q(buffer_1_rd_ptr[1]), 
        .QN(n509) );
  DFND1 \buffer_1_rd_ptr_reg[2]  ( .D(n229), .CPN(clk), .Q(buffer_1_rd_ptr[2])
         );
  DFND1 \buffer_0_data_in_reg[15]  ( .D(buffer_0_data_in[15]), .CPN(clk), .Q(
        buffer_0_data_in[15]) );
  DFND1 \buffer_0_data_in_reg[14]  ( .D(buffer_0_data_in[14]), .CPN(clk), .Q(
        buffer_0_data_in[14]) );
  DFND1 \buffer_0_data_in_reg[13]  ( .D(buffer_0_data_in[13]), .CPN(clk), .Q(
        buffer_0_data_in[13]) );
  DFND1 \buffer_0_data_in_reg[12]  ( .D(buffer_0_data_in[12]), .CPN(clk), .Q(
        buffer_0_data_in[12]) );
  DFND1 \buffer_0_data_in_reg[11]  ( .D(buffer_0_data_in[11]), .CPN(clk), .Q(
        buffer_0_data_in[11]) );
  DFND1 \buffer_0_data_in_reg[10]  ( .D(buffer_0_data_in[10]), .CPN(clk), .Q(
        buffer_0_data_in[10]) );
  DFND1 \buffer_0_data_in_reg[9]  ( .D(buffer_0_data_in[9]), .CPN(clk), .Q(
        buffer_0_data_in[9]) );
  DFND1 \buffer_0_data_in_reg[8]  ( .D(buffer_0_data_in[8]), .CPN(clk), .Q(
        buffer_0_data_in[8]) );
  DFND1 \buffer_0_data_in_reg[7]  ( .D(buffer_0_data_in[7]), .CPN(clk), .Q(
        buffer_0_data_in[7]) );
  DFND1 \buffer_0_data_in_reg[6]  ( .D(buffer_0_data_in[6]), .CPN(clk), .Q(
        buffer_0_data_in[6]) );
  DFND1 \buffer_0_data_in_reg[5]  ( .D(buffer_0_data_in[5]), .CPN(clk), .Q(
        buffer_0_data_in[5]) );
  DFND1 \buffer_0_data_in_reg[4]  ( .D(buffer_0_data_in[4]), .CPN(clk), .Q(
        buffer_0_data_in[4]) );
  DFND1 \buffer_0_data_in_reg[3]  ( .D(buffer_0_data_in[3]), .CPN(clk), .Q(
        buffer_0_data_in[3]) );
  DFND1 \buffer_0_data_in_reg[2]  ( .D(buffer_0_data_in[2]), .CPN(clk), .Q(
        buffer_0_data_in[2]) );
  DFND1 \buffer_0_data_in_reg[1]  ( .D(buffer_0_data_in[1]), .CPN(clk), .Q(
        buffer_0_data_in[1]) );
  DFND1 \buffer_0_data_in_reg[0]  ( .D(buffer_0_data_in[0]), .CPN(clk), .Q(
        buffer_0_data_in[0]) );
  DFQD1 buffer_0_rd_en_reg ( .D(n1), .CP(clk), .Q(buffer_0_rd_en) );
  DFND1 \buffer_0_rd_ptr_reg[0]  ( .D(n192), .CPN(clk), .Q(buffer_0_rd_ptr[0]), 
        .QN(n508) );
  DFND1 \buffer_0_rd_ptr_reg[1]  ( .D(n191), .CPN(clk), .Q(buffer_0_rd_ptr[1]), 
        .QN(n507) );
  DFND1 \buffer_0_rd_ptr_reg[2]  ( .D(n190), .CPN(clk), .Q(buffer_0_rd_ptr[2])
         );
  DFND2 \router_port_0_reg[19]  ( .D(n170), .CPN(clk), .Q(router_port_0[19])
         );
  DFND2 \router_port_0_reg[18]  ( .D(n171), .CPN(clk), .Q(router_port_0[18])
         );
  DFND2 \router_port_0_reg[17]  ( .D(n172), .CPN(clk), .Q(router_port_0[17])
         );
  DFND2 \router_port_0_reg[16]  ( .D(n173), .CPN(clk), .Q(router_port_0[16])
         );
  DFND2 \router_port_0_reg[15]  ( .D(n174), .CPN(clk), .Q(router_port_0[15])
         );
  DFND2 \router_port_0_reg[14]  ( .D(n175), .CPN(clk), .Q(router_port_0[14])
         );
  DFND2 \router_port_0_reg[13]  ( .D(n176), .CPN(clk), .Q(router_port_0[13])
         );
  DFND2 \router_port_0_reg[12]  ( .D(n177), .CPN(clk), .Q(router_port_0[12])
         );
  DFND2 \router_port_0_reg[11]  ( .D(n178), .CPN(clk), .Q(router_port_0[11])
         );
  DFND2 \router_port_0_reg[10]  ( .D(n179), .CPN(clk), .Q(router_port_0[10])
         );
  DFND2 \router_port_0_reg[9]  ( .D(n180), .CPN(clk), .Q(router_port_0[9]) );
  DFND2 \router_port_0_reg[8]  ( .D(n181), .CPN(clk), .Q(router_port_0[8]) );
  DFND2 \router_port_0_reg[7]  ( .D(n182), .CPN(clk), .Q(router_port_0[7]) );
  DFND2 \router_port_0_reg[6]  ( .D(n183), .CPN(clk), .Q(router_port_0[6]) );
  DFND2 \router_port_0_reg[5]  ( .D(n184), .CPN(clk), .Q(router_port_0[5]) );
  DFND2 \router_port_0_reg[4]  ( .D(n185), .CPN(clk), .Q(router_port_0[4]) );
  DFND2 \router_port_0_reg[3]  ( .D(n186), .CPN(clk), .Q(router_port_0[3]) );
  DFND2 \router_port_0_reg[2]  ( .D(n187), .CPN(clk), .Q(router_port_0[2]) );
  DFND2 \router_port_0_reg[1]  ( .D(n188), .CPN(clk), .Q(router_port_0[1]) );
  DFND2 \router_port_0_reg[0]  ( .D(n189), .CPN(clk), .Q(router_port_0[0]) );
  DFND2 \router_port_1_reg[19]  ( .D(n209), .CPN(clk), .Q(router_port_1[19])
         );
  DFND2 \router_port_1_reg[18]  ( .D(n210), .CPN(clk), .Q(router_port_1[18])
         );
  DFND2 \router_port_1_reg[17]  ( .D(n211), .CPN(clk), .Q(router_port_1[17])
         );
  DFND2 \router_port_1_reg[16]  ( .D(n212), .CPN(clk), .Q(router_port_1[16])
         );
  DFND2 \router_port_1_reg[15]  ( .D(n213), .CPN(clk), .Q(router_port_1[15])
         );
  DFND2 \router_port_1_reg[14]  ( .D(n214), .CPN(clk), .Q(router_port_1[14])
         );
  DFND2 \router_port_1_reg[13]  ( .D(n215), .CPN(clk), .Q(router_port_1[13])
         );
  DFND2 \router_port_1_reg[12]  ( .D(n216), .CPN(clk), .Q(router_port_1[12])
         );
  DFND2 \router_port_1_reg[11]  ( .D(n217), .CPN(clk), .Q(router_port_1[11])
         );
  DFND2 \router_port_1_reg[10]  ( .D(n218), .CPN(clk), .Q(router_port_1[10])
         );
  DFND2 \router_port_1_reg[9]  ( .D(n219), .CPN(clk), .Q(router_port_1[9]) );
  DFND2 \router_port_1_reg[8]  ( .D(n220), .CPN(clk), .Q(router_port_1[8]) );
  DFND2 \router_port_1_reg[7]  ( .D(n221), .CPN(clk), .Q(router_port_1[7]) );
  DFND2 \router_port_1_reg[6]  ( .D(n222), .CPN(clk), .Q(router_port_1[6]) );
  DFND2 \router_port_1_reg[5]  ( .D(n223), .CPN(clk), .Q(router_port_1[5]) );
  DFND2 \router_port_1_reg[4]  ( .D(n224), .CPN(clk), .Q(router_port_1[4]) );
  DFND2 \router_port_1_reg[3]  ( .D(n225), .CPN(clk), .Q(router_port_1[3]) );
  DFND2 \router_port_1_reg[2]  ( .D(n226), .CPN(clk), .Q(router_port_1[2]) );
  DFND2 \router_port_1_reg[1]  ( .D(n227), .CPN(clk), .Q(router_port_1[1]) );
  DFND2 \router_port_1_reg[0]  ( .D(n228), .CPN(clk), .Q(router_port_1[0]) );
  DFND2 \router_port_2_reg[19]  ( .D(n248), .CPN(clk), .Q(router_port_2[19])
         );
  DFND2 \router_port_2_reg[18]  ( .D(n249), .CPN(clk), .Q(router_port_2[18])
         );
  DFND2 \router_port_2_reg[17]  ( .D(n250), .CPN(clk), .Q(router_port_2[17])
         );
  DFND2 \router_port_2_reg[16]  ( .D(n251), .CPN(clk), .Q(router_port_2[16])
         );
  DFND2 \router_port_2_reg[15]  ( .D(n252), .CPN(clk), .Q(router_port_2[15])
         );
  DFND2 \router_port_2_reg[14]  ( .D(n253), .CPN(clk), .Q(router_port_2[14])
         );
  DFND2 \router_port_2_reg[13]  ( .D(n254), .CPN(clk), .Q(router_port_2[13])
         );
  DFND2 \router_port_2_reg[12]  ( .D(n255), .CPN(clk), .Q(router_port_2[12])
         );
  DFND2 \router_port_2_reg[11]  ( .D(n256), .CPN(clk), .Q(router_port_2[11])
         );
  DFND2 \router_port_2_reg[10]  ( .D(n257), .CPN(clk), .Q(router_port_2[10])
         );
  DFND2 \router_port_2_reg[9]  ( .D(n258), .CPN(clk), .Q(router_port_2[9]) );
  DFND2 \router_port_2_reg[8]  ( .D(n259), .CPN(clk), .Q(router_port_2[8]) );
  DFND2 \router_port_2_reg[7]  ( .D(n260), .CPN(clk), .Q(router_port_2[7]) );
  DFND2 \router_port_2_reg[6]  ( .D(n261), .CPN(clk), .Q(router_port_2[6]) );
  DFND2 \router_port_2_reg[5]  ( .D(n262), .CPN(clk), .Q(router_port_2[5]) );
  DFND2 \router_port_2_reg[4]  ( .D(n263), .CPN(clk), .Q(router_port_2[4]) );
  DFND2 \router_port_2_reg[3]  ( .D(n264), .CPN(clk), .Q(router_port_2[3]) );
  DFND2 \router_port_2_reg[2]  ( .D(n265), .CPN(clk), .Q(router_port_2[2]) );
  DFND2 \router_port_2_reg[1]  ( .D(n266), .CPN(clk), .Q(router_port_2[1]) );
  DFND2 \router_port_2_reg[0]  ( .D(n267), .CPN(clk), .Q(router_port_2[0]) );
  DFND2 \router_port_3_reg[19]  ( .D(n287), .CPN(clk), .Q(router_port_3[19])
         );
  DFND2 \router_port_3_reg[18]  ( .D(n288), .CPN(clk), .Q(router_port_3[18])
         );
  DFND2 \router_port_3_reg[17]  ( .D(n289), .CPN(clk), .Q(router_port_3[17])
         );
  DFND2 \router_port_3_reg[16]  ( .D(n290), .CPN(clk), .Q(router_port_3[16])
         );
  DFND2 \router_port_3_reg[15]  ( .D(n291), .CPN(clk), .Q(router_port_3[15])
         );
  DFND2 \router_port_3_reg[14]  ( .D(n292), .CPN(clk), .Q(router_port_3[14])
         );
  DFND2 \router_port_3_reg[13]  ( .D(n293), .CPN(clk), .Q(router_port_3[13])
         );
  DFND2 \router_port_3_reg[12]  ( .D(n294), .CPN(clk), .Q(router_port_3[12])
         );
  DFND2 \router_port_3_reg[11]  ( .D(n295), .CPN(clk), .Q(router_port_3[11])
         );
  DFND2 \router_port_3_reg[10]  ( .D(n296), .CPN(clk), .Q(router_port_3[10])
         );
  DFND2 \router_port_3_reg[9]  ( .D(n297), .CPN(clk), .Q(router_port_3[9]) );
  DFND2 \router_port_3_reg[8]  ( .D(n298), .CPN(clk), .Q(router_port_3[8]) );
  DFND2 \router_port_3_reg[7]  ( .D(n299), .CPN(clk), .Q(router_port_3[7]) );
  DFND2 \router_port_3_reg[6]  ( .D(n300), .CPN(clk), .Q(router_port_3[6]) );
  DFND2 \router_port_3_reg[5]  ( .D(n301), .CPN(clk), .Q(router_port_3[5]) );
  DFND2 \router_port_3_reg[4]  ( .D(n302), .CPN(clk), .Q(router_port_3[4]) );
  DFND2 \router_port_3_reg[3]  ( .D(n303), .CPN(clk), .Q(router_port_3[3]) );
  DFND2 \router_port_3_reg[2]  ( .D(n304), .CPN(clk), .Q(router_port_3[2]) );
  DFND2 \router_port_3_reg[1]  ( .D(n305), .CPN(clk), .Q(router_port_3[1]) );
  DFND2 \router_port_3_reg[0]  ( .D(n306), .CPN(clk), .Q(router_port_3[0]) );
  DFND2 \router_port_4_reg[19]  ( .D(n326), .CPN(clk), .Q(router_port_4[19])
         );
  DFND2 \router_port_4_reg[18]  ( .D(n327), .CPN(clk), .Q(router_port_4[18])
         );
  DFND2 \router_port_4_reg[17]  ( .D(n328), .CPN(clk), .Q(router_port_4[17])
         );
  DFND2 \router_port_4_reg[16]  ( .D(n329), .CPN(clk), .Q(router_port_4[16])
         );
  DFND2 \router_port_4_reg[15]  ( .D(n330), .CPN(clk), .Q(router_port_4[15])
         );
  DFND2 \router_port_4_reg[14]  ( .D(n331), .CPN(clk), .Q(router_port_4[14])
         );
  DFND2 \router_port_4_reg[13]  ( .D(n332), .CPN(clk), .Q(router_port_4[13])
         );
  DFND2 \router_port_4_reg[12]  ( .D(n333), .CPN(clk), .Q(router_port_4[12])
         );
  DFND2 \router_port_4_reg[11]  ( .D(n334), .CPN(clk), .Q(router_port_4[11])
         );
  DFND2 \router_port_4_reg[10]  ( .D(n335), .CPN(clk), .Q(router_port_4[10])
         );
  DFND2 \router_port_4_reg[9]  ( .D(n336), .CPN(clk), .Q(router_port_4[9]) );
  DFND2 \router_port_4_reg[8]  ( .D(n337), .CPN(clk), .Q(router_port_4[8]) );
  DFND2 \router_port_4_reg[7]  ( .D(n338), .CPN(clk), .Q(router_port_4[7]) );
  DFND2 \router_port_4_reg[6]  ( .D(n339), .CPN(clk), .Q(router_port_4[6]) );
  DFND2 \router_port_4_reg[5]  ( .D(n340), .CPN(clk), .Q(router_port_4[5]) );
  DFND2 \router_port_4_reg[4]  ( .D(n341), .CPN(clk), .Q(router_port_4[4]) );
  DFND2 \router_port_4_reg[3]  ( .D(n342), .CPN(clk), .Q(router_port_4[3]) );
  DFND2 \router_port_4_reg[2]  ( .D(n343), .CPN(clk), .Q(router_port_4[2]) );
  DFND2 \router_port_4_reg[1]  ( .D(n344), .CPN(clk), .Q(router_port_4[1]) );
  DFND2 \router_port_4_reg[0]  ( .D(n345), .CPN(clk), .Q(router_port_4[0]) );
  DFND2 \router_port_5_reg[19]  ( .D(n365), .CPN(clk), .Q(router_port_5[19])
         );
  DFND2 \router_port_5_reg[18]  ( .D(n366), .CPN(clk), .Q(router_port_5[18])
         );
  DFND2 \router_port_5_reg[17]  ( .D(n367), .CPN(clk), .Q(router_port_5[17])
         );
  DFND2 \router_port_5_reg[16]  ( .D(n368), .CPN(clk), .Q(router_port_5[16])
         );
  DFND2 \router_port_5_reg[15]  ( .D(n369), .CPN(clk), .Q(router_port_5[15])
         );
  DFND2 \router_port_5_reg[14]  ( .D(n370), .CPN(clk), .Q(router_port_5[14])
         );
  DFND2 \router_port_5_reg[13]  ( .D(n371), .CPN(clk), .Q(router_port_5[13])
         );
  DFND2 \router_port_5_reg[12]  ( .D(n372), .CPN(clk), .Q(router_port_5[12])
         );
  DFND2 \router_port_5_reg[11]  ( .D(n373), .CPN(clk), .Q(router_port_5[11])
         );
  DFND2 \router_port_5_reg[10]  ( .D(n374), .CPN(clk), .Q(router_port_5[10])
         );
  DFND2 \router_port_5_reg[9]  ( .D(n375), .CPN(clk), .Q(router_port_5[9]) );
  DFND2 \router_port_5_reg[8]  ( .D(n376), .CPN(clk), .Q(router_port_5[8]) );
  DFND2 \router_port_5_reg[7]  ( .D(n377), .CPN(clk), .Q(router_port_5[7]) );
  DFND2 \router_port_5_reg[6]  ( .D(n378), .CPN(clk), .Q(router_port_5[6]) );
  DFND2 \router_port_5_reg[5]  ( .D(n379), .CPN(clk), .Q(router_port_5[5]) );
  DFND2 \router_port_5_reg[4]  ( .D(n380), .CPN(clk), .Q(router_port_5[4]) );
  DFND2 \router_port_5_reg[3]  ( .D(n381), .CPN(clk), .Q(router_port_5[3]) );
  DFND2 \router_port_5_reg[2]  ( .D(n382), .CPN(clk), .Q(router_port_5[2]) );
  DFND2 \router_port_5_reg[1]  ( .D(n383), .CPN(clk), .Q(router_port_5[1]) );
  DFND2 \router_port_5_reg[0]  ( .D(n384), .CPN(clk), .Q(router_port_5[0]) );
  DFND2 \router_port_6_reg[19]  ( .D(n404), .CPN(clk), .Q(router_port_6[19])
         );
  DFND2 \router_port_6_reg[18]  ( .D(n405), .CPN(clk), .Q(router_port_6[18])
         );
  DFND2 \router_port_6_reg[17]  ( .D(n406), .CPN(clk), .Q(router_port_6[17])
         );
  DFND2 \router_port_6_reg[16]  ( .D(n407), .CPN(clk), .Q(router_port_6[16])
         );
  DFND2 \router_port_6_reg[15]  ( .D(n408), .CPN(clk), .Q(router_port_6[15])
         );
  DFND2 \router_port_6_reg[14]  ( .D(n409), .CPN(clk), .Q(router_port_6[14])
         );
  DFND2 \router_port_6_reg[13]  ( .D(n410), .CPN(clk), .Q(router_port_6[13])
         );
  DFND2 \router_port_6_reg[12]  ( .D(n411), .CPN(clk), .Q(router_port_6[12])
         );
  DFND2 \router_port_6_reg[11]  ( .D(n412), .CPN(clk), .Q(router_port_6[11])
         );
  DFND2 \router_port_6_reg[10]  ( .D(n413), .CPN(clk), .Q(router_port_6[10])
         );
  DFND2 \router_port_6_reg[9]  ( .D(n414), .CPN(clk), .Q(router_port_6[9]) );
  DFND2 \router_port_6_reg[8]  ( .D(n415), .CPN(clk), .Q(router_port_6[8]) );
  DFND2 \router_port_6_reg[7]  ( .D(n416), .CPN(clk), .Q(router_port_6[7]) );
  DFND2 \router_port_6_reg[6]  ( .D(n417), .CPN(clk), .Q(router_port_6[6]) );
  DFND2 \router_port_6_reg[5]  ( .D(n418), .CPN(clk), .Q(router_port_6[5]) );
  DFND2 \router_port_6_reg[4]  ( .D(n419), .CPN(clk), .Q(router_port_6[4]) );
  DFND2 \router_port_6_reg[3]  ( .D(n420), .CPN(clk), .Q(router_port_6[3]) );
  DFND2 \router_port_6_reg[2]  ( .D(n421), .CPN(clk), .Q(router_port_6[2]) );
  DFND2 \router_port_6_reg[1]  ( .D(n422), .CPN(clk), .Q(router_port_6[1]) );
  DFND2 \router_port_6_reg[0]  ( .D(n423), .CPN(clk), .Q(router_port_6[0]) );
  DFND2 \router_port_7_reg[19]  ( .D(n427), .CPN(clk), .Q(router_port_7[19])
         );
  DFND2 \router_port_7_reg[18]  ( .D(n428), .CPN(clk), .Q(router_port_7[18])
         );
  DFND2 \router_port_7_reg[17]  ( .D(n429), .CPN(clk), .Q(router_port_7[17])
         );
  DFND2 \router_port_7_reg[16]  ( .D(n430), .CPN(clk), .Q(router_port_7[16])
         );
  DFND2 \router_port_7_reg[15]  ( .D(n431), .CPN(clk), .Q(router_port_7[15])
         );
  DFND2 \router_port_7_reg[14]  ( .D(n432), .CPN(clk), .Q(router_port_7[14])
         );
  DFND2 \router_port_7_reg[13]  ( .D(n433), .CPN(clk), .Q(router_port_7[13])
         );
  DFND2 \router_port_7_reg[12]  ( .D(n434), .CPN(clk), .Q(router_port_7[12])
         );
  DFND2 \router_port_7_reg[11]  ( .D(n435), .CPN(clk), .Q(router_port_7[11])
         );
  DFND2 \router_port_7_reg[10]  ( .D(n436), .CPN(clk), .Q(router_port_7[10])
         );
  DFND2 \router_port_7_reg[9]  ( .D(n437), .CPN(clk), .Q(router_port_7[9]) );
  DFND2 \router_port_7_reg[8]  ( .D(n438), .CPN(clk), .Q(router_port_7[8]) );
  DFND2 \router_port_7_reg[7]  ( .D(n439), .CPN(clk), .Q(router_port_7[7]) );
  DFND2 \router_port_7_reg[6]  ( .D(n440), .CPN(clk), .Q(router_port_7[6]) );
  DFND2 \router_port_7_reg[5]  ( .D(n441), .CPN(clk), .Q(router_port_7[5]) );
  DFND2 \router_port_7_reg[4]  ( .D(n442), .CPN(clk), .Q(router_port_7[4]) );
  DFND2 \router_port_7_reg[3]  ( .D(n443), .CPN(clk), .Q(router_port_7[3]) );
  DFND2 \router_port_7_reg[2]  ( .D(n444), .CPN(clk), .Q(router_port_7[2]) );
  DFND2 \router_port_7_reg[1]  ( .D(n445), .CPN(clk), .Q(router_port_7[1]) );
  DFND2 \router_port_7_reg[0]  ( .D(n446), .CPN(clk), .Q(router_port_7[0]) );
  TIEL U532 ( .ZN(n482) );
  INR2XD0 U533 ( .A1(buffer_7_rd_en), .B1(rst), .ZN(n483) );
  INR2XD0 U534 ( .A1(buffer_6_rd_en), .B1(rst), .ZN(n486) );
  INR2XD0 U535 ( .A1(buffer_5_rd_en), .B1(rst), .ZN(n489) );
  INR2XD0 U536 ( .A1(buffer_4_rd_en), .B1(rst), .ZN(n492) );
  INR2XD0 U537 ( .A1(buffer_3_rd_en), .B1(rst), .ZN(n495) );
  INR2XD0 U538 ( .A1(buffer_2_rd_en), .B1(rst), .ZN(n498) );
  INR2XD0 U539 ( .A1(buffer_1_rd_en), .B1(rst), .ZN(n501) );
  INR2XD0 U540 ( .A1(buffer_0_rd_en), .B1(rst), .ZN(n504) );
  TIEH U541 ( .Z(buffer_0_wr_en) );
  CKND0 U542 ( .I(buffer_7_empty), .ZN(n8) );
  CKND0 U543 ( .I(buffer_6_empty), .ZN(n7) );
  CKND0 U544 ( .I(buffer_5_empty), .ZN(n6) );
  CKND0 U545 ( .I(buffer_4_empty), .ZN(n5) );
  XNR2D0 U546 ( .A1(n483), .A2(n522), .ZN(n449) );
  CKXOR2D0 U547 ( .A1(n521), .A2(n484), .Z(n448) );
  CKXOR2D0 U548 ( .A1(n485), .A2(buffer_7_rd_ptr[2]), .Z(n447) );
  NR2D0 U549 ( .A1(n521), .A2(n484), .ZN(n485) );
  IND2D0 U550 ( .A1(n522), .B1(n483), .ZN(n484) );
  MUX2D0 U551 ( .I0(router_port_7[0]), .I1(buffer_7_data_out[0]), .S(n483), 
        .Z(n446) );
  MUX2D0 U552 ( .I0(router_port_7[1]), .I1(buffer_7_data_out[1]), .S(n483), 
        .Z(n445) );
  MUX2D0 U553 ( .I0(router_port_7[2]), .I1(buffer_7_data_out[2]), .S(n483), 
        .Z(n444) );
  MUX2D0 U554 ( .I0(router_port_7[3]), .I1(buffer_7_data_out[3]), .S(n483), 
        .Z(n443) );
  MUX2D0 U555 ( .I0(router_port_7[4]), .I1(buffer_7_data_out[4]), .S(n483), 
        .Z(n442) );
  MUX2D0 U556 ( .I0(router_port_7[5]), .I1(buffer_7_data_out[5]), .S(n483), 
        .Z(n441) );
  MUX2D0 U557 ( .I0(router_port_7[6]), .I1(buffer_7_data_out[6]), .S(n483), 
        .Z(n440) );
  MUX2D0 U558 ( .I0(router_port_7[7]), .I1(buffer_7_data_out[7]), .S(n483), 
        .Z(n439) );
  MUX2D0 U559 ( .I0(router_port_7[8]), .I1(buffer_7_data_out[8]), .S(n483), 
        .Z(n438) );
  MUX2D0 U560 ( .I0(router_port_7[9]), .I1(buffer_7_data_out[9]), .S(n483), 
        .Z(n437) );
  MUX2D0 U561 ( .I0(router_port_7[10]), .I1(buffer_7_data_out[10]), .S(n483), 
        .Z(n436) );
  MUX2D0 U562 ( .I0(router_port_7[11]), .I1(buffer_7_data_out[11]), .S(n483), 
        .Z(n435) );
  MUX2D0 U563 ( .I0(router_port_7[12]), .I1(buffer_7_data_out[12]), .S(n483), 
        .Z(n434) );
  MUX2D0 U564 ( .I0(router_port_7[13]), .I1(buffer_7_data_out[13]), .S(n483), 
        .Z(n433) );
  MUX2D0 U565 ( .I0(router_port_7[14]), .I1(buffer_7_data_out[14]), .S(n483), 
        .Z(n432) );
  MUX2D0 U566 ( .I0(router_port_7[15]), .I1(buffer_7_data_out[15]), .S(n483), 
        .Z(n431) );
  MUX2D0 U567 ( .I0(router_port_7[16]), .I1(buffer_7_data_out[16]), .S(n483), 
        .Z(n430) );
  MUX2D0 U568 ( .I0(router_port_7[17]), .I1(buffer_7_data_out[17]), .S(n483), 
        .Z(n429) );
  MUX2D0 U569 ( .I0(router_port_7[18]), .I1(buffer_7_data_out[18]), .S(n483), 
        .Z(n428) );
  MUX2D0 U570 ( .I0(router_port_7[19]), .I1(buffer_7_data_out[19]), .S(n483), 
        .Z(n427) );
  XNR2D0 U571 ( .A1(n486), .A2(n520), .ZN(n426) );
  CKXOR2D0 U572 ( .A1(n519), .A2(n487), .Z(n425) );
  CKXOR2D0 U573 ( .A1(n488), .A2(buffer_6_rd_ptr[2]), .Z(n424) );
  NR2D0 U574 ( .A1(n519), .A2(n487), .ZN(n488) );
  IND2D0 U575 ( .A1(n520), .B1(n486), .ZN(n487) );
  MUX2D0 U576 ( .I0(router_port_6[0]), .I1(buffer_6_data_out[0]), .S(n486), 
        .Z(n423) );
  MUX2D0 U577 ( .I0(router_port_6[1]), .I1(buffer_6_data_out[1]), .S(n486), 
        .Z(n422) );
  MUX2D0 U578 ( .I0(router_port_6[2]), .I1(buffer_6_data_out[2]), .S(n486), 
        .Z(n421) );
  MUX2D0 U579 ( .I0(router_port_6[3]), .I1(buffer_6_data_out[3]), .S(n486), 
        .Z(n420) );
  MUX2D0 U580 ( .I0(router_port_6[4]), .I1(buffer_6_data_out[4]), .S(n486), 
        .Z(n419) );
  MUX2D0 U581 ( .I0(router_port_6[5]), .I1(buffer_6_data_out[5]), .S(n486), 
        .Z(n418) );
  MUX2D0 U582 ( .I0(router_port_6[6]), .I1(buffer_6_data_out[6]), .S(n486), 
        .Z(n417) );
  MUX2D0 U583 ( .I0(router_port_6[7]), .I1(buffer_6_data_out[7]), .S(n486), 
        .Z(n416) );
  MUX2D0 U584 ( .I0(router_port_6[8]), .I1(buffer_6_data_out[8]), .S(n486), 
        .Z(n415) );
  MUX2D0 U585 ( .I0(router_port_6[9]), .I1(buffer_6_data_out[9]), .S(n486), 
        .Z(n414) );
  MUX2D0 U586 ( .I0(router_port_6[10]), .I1(buffer_6_data_out[10]), .S(n486), 
        .Z(n413) );
  MUX2D0 U587 ( .I0(router_port_6[11]), .I1(buffer_6_data_out[11]), .S(n486), 
        .Z(n412) );
  MUX2D0 U588 ( .I0(router_port_6[12]), .I1(buffer_6_data_out[12]), .S(n486), 
        .Z(n411) );
  MUX2D0 U589 ( .I0(router_port_6[13]), .I1(buffer_6_data_out[13]), .S(n486), 
        .Z(n410) );
  MUX2D0 U590 ( .I0(router_port_6[14]), .I1(buffer_6_data_out[14]), .S(n486), 
        .Z(n409) );
  MUX2D0 U591 ( .I0(router_port_6[15]), .I1(buffer_6_data_out[15]), .S(n486), 
        .Z(n408) );
  MUX2D0 U592 ( .I0(router_port_6[16]), .I1(buffer_6_data_out[16]), .S(n486), 
        .Z(n407) );
  MUX2D0 U593 ( .I0(router_port_6[17]), .I1(buffer_6_data_out[17]), .S(n486), 
        .Z(n406) );
  MUX2D0 U594 ( .I0(router_port_6[18]), .I1(buffer_6_data_out[18]), .S(n486), 
        .Z(n405) );
  MUX2D0 U595 ( .I0(router_port_6[19]), .I1(buffer_6_data_out[19]), .S(n486), 
        .Z(n404) );
  CKND0 U596 ( .I(buffer_3_empty), .ZN(n4) );
  XNR2D0 U597 ( .A1(n489), .A2(n518), .ZN(n387) );
  CKXOR2D0 U598 ( .A1(n517), .A2(n490), .Z(n386) );
  CKXOR2D0 U599 ( .A1(n491), .A2(buffer_5_rd_ptr[2]), .Z(n385) );
  NR2D0 U600 ( .A1(n517), .A2(n490), .ZN(n491) );
  IND2D0 U601 ( .A1(n518), .B1(n489), .ZN(n490) );
  MUX2D0 U602 ( .I0(router_port_5[0]), .I1(buffer_5_data_out[0]), .S(n489), 
        .Z(n384) );
  MUX2D0 U603 ( .I0(router_port_5[1]), .I1(buffer_5_data_out[1]), .S(n489), 
        .Z(n383) );
  MUX2D0 U604 ( .I0(router_port_5[2]), .I1(buffer_5_data_out[2]), .S(n489), 
        .Z(n382) );
  MUX2D0 U605 ( .I0(router_port_5[3]), .I1(buffer_5_data_out[3]), .S(n489), 
        .Z(n381) );
  MUX2D0 U606 ( .I0(router_port_5[4]), .I1(buffer_5_data_out[4]), .S(n489), 
        .Z(n380) );
  MUX2D0 U607 ( .I0(router_port_5[5]), .I1(buffer_5_data_out[5]), .S(n489), 
        .Z(n379) );
  MUX2D0 U608 ( .I0(router_port_5[6]), .I1(buffer_5_data_out[6]), .S(n489), 
        .Z(n378) );
  MUX2D0 U609 ( .I0(router_port_5[7]), .I1(buffer_5_data_out[7]), .S(n489), 
        .Z(n377) );
  MUX2D0 U610 ( .I0(router_port_5[8]), .I1(buffer_5_data_out[8]), .S(n489), 
        .Z(n376) );
  MUX2D0 U611 ( .I0(router_port_5[9]), .I1(buffer_5_data_out[9]), .S(n489), 
        .Z(n375) );
  MUX2D0 U612 ( .I0(router_port_5[10]), .I1(buffer_5_data_out[10]), .S(n489), 
        .Z(n374) );
  MUX2D0 U613 ( .I0(router_port_5[11]), .I1(buffer_5_data_out[11]), .S(n489), 
        .Z(n373) );
  MUX2D0 U614 ( .I0(router_port_5[12]), .I1(buffer_5_data_out[12]), .S(n489), 
        .Z(n372) );
  MUX2D0 U615 ( .I0(router_port_5[13]), .I1(buffer_5_data_out[13]), .S(n489), 
        .Z(n371) );
  MUX2D0 U616 ( .I0(router_port_5[14]), .I1(buffer_5_data_out[14]), .S(n489), 
        .Z(n370) );
  MUX2D0 U617 ( .I0(router_port_5[15]), .I1(buffer_5_data_out[15]), .S(n489), 
        .Z(n369) );
  MUX2D0 U618 ( .I0(router_port_5[16]), .I1(buffer_5_data_out[16]), .S(n489), 
        .Z(n368) );
  MUX2D0 U619 ( .I0(router_port_5[17]), .I1(buffer_5_data_out[17]), .S(n489), 
        .Z(n367) );
  MUX2D0 U620 ( .I0(router_port_5[18]), .I1(buffer_5_data_out[18]), .S(n489), 
        .Z(n366) );
  MUX2D0 U621 ( .I0(router_port_5[19]), .I1(buffer_5_data_out[19]), .S(n489), 
        .Z(n365) );
  XNR2D0 U622 ( .A1(n492), .A2(n516), .ZN(n348) );
  CKXOR2D0 U623 ( .A1(n515), .A2(n493), .Z(n347) );
  CKXOR2D0 U624 ( .A1(n494), .A2(buffer_4_rd_ptr[2]), .Z(n346) );
  NR2D0 U625 ( .A1(n515), .A2(n493), .ZN(n494) );
  IND2D0 U626 ( .A1(n516), .B1(n492), .ZN(n493) );
  MUX2D0 U627 ( .I0(router_port_4[0]), .I1(buffer_4_data_out[0]), .S(n492), 
        .Z(n345) );
  MUX2D0 U628 ( .I0(router_port_4[1]), .I1(buffer_4_data_out[1]), .S(n492), 
        .Z(n344) );
  MUX2D0 U629 ( .I0(router_port_4[2]), .I1(buffer_4_data_out[2]), .S(n492), 
        .Z(n343) );
  MUX2D0 U630 ( .I0(router_port_4[3]), .I1(buffer_4_data_out[3]), .S(n492), 
        .Z(n342) );
  MUX2D0 U631 ( .I0(router_port_4[4]), .I1(buffer_4_data_out[4]), .S(n492), 
        .Z(n341) );
  MUX2D0 U632 ( .I0(router_port_4[5]), .I1(buffer_4_data_out[5]), .S(n492), 
        .Z(n340) );
  MUX2D0 U633 ( .I0(router_port_4[6]), .I1(buffer_4_data_out[6]), .S(n492), 
        .Z(n339) );
  MUX2D0 U634 ( .I0(router_port_4[7]), .I1(buffer_4_data_out[7]), .S(n492), 
        .Z(n338) );
  MUX2D0 U635 ( .I0(router_port_4[8]), .I1(buffer_4_data_out[8]), .S(n492), 
        .Z(n337) );
  MUX2D0 U636 ( .I0(router_port_4[9]), .I1(buffer_4_data_out[9]), .S(n492), 
        .Z(n336) );
  MUX2D0 U637 ( .I0(router_port_4[10]), .I1(buffer_4_data_out[10]), .S(n492), 
        .Z(n335) );
  MUX2D0 U638 ( .I0(router_port_4[11]), .I1(buffer_4_data_out[11]), .S(n492), 
        .Z(n334) );
  MUX2D0 U639 ( .I0(router_port_4[12]), .I1(buffer_4_data_out[12]), .S(n492), 
        .Z(n333) );
  MUX2D0 U640 ( .I0(router_port_4[13]), .I1(buffer_4_data_out[13]), .S(n492), 
        .Z(n332) );
  MUX2D0 U641 ( .I0(router_port_4[14]), .I1(buffer_4_data_out[14]), .S(n492), 
        .Z(n331) );
  MUX2D0 U642 ( .I0(router_port_4[15]), .I1(buffer_4_data_out[15]), .S(n492), 
        .Z(n330) );
  MUX2D0 U643 ( .I0(router_port_4[16]), .I1(buffer_4_data_out[16]), .S(n492), 
        .Z(n329) );
  MUX2D0 U644 ( .I0(router_port_4[17]), .I1(buffer_4_data_out[17]), .S(n492), 
        .Z(n328) );
  MUX2D0 U645 ( .I0(router_port_4[18]), .I1(buffer_4_data_out[18]), .S(n492), 
        .Z(n327) );
  MUX2D0 U646 ( .I0(router_port_4[19]), .I1(buffer_4_data_out[19]), .S(n492), 
        .Z(n326) );
  XNR2D0 U647 ( .A1(n495), .A2(n514), .ZN(n309) );
  CKXOR2D0 U648 ( .A1(n513), .A2(n496), .Z(n308) );
  CKXOR2D0 U649 ( .A1(n497), .A2(buffer_3_rd_ptr[2]), .Z(n307) );
  NR2D0 U650 ( .A1(n513), .A2(n496), .ZN(n497) );
  IND2D0 U651 ( .A1(n514), .B1(n495), .ZN(n496) );
  MUX2D0 U652 ( .I0(router_port_3[0]), .I1(buffer_3_data_out[0]), .S(n495), 
        .Z(n306) );
  MUX2D0 U653 ( .I0(router_port_3[1]), .I1(buffer_3_data_out[1]), .S(n495), 
        .Z(n305) );
  MUX2D0 U654 ( .I0(router_port_3[2]), .I1(buffer_3_data_out[2]), .S(n495), 
        .Z(n304) );
  MUX2D0 U655 ( .I0(router_port_3[3]), .I1(buffer_3_data_out[3]), .S(n495), 
        .Z(n303) );
  MUX2D0 U656 ( .I0(router_port_3[4]), .I1(buffer_3_data_out[4]), .S(n495), 
        .Z(n302) );
  MUX2D0 U657 ( .I0(router_port_3[5]), .I1(buffer_3_data_out[5]), .S(n495), 
        .Z(n301) );
  MUX2D0 U658 ( .I0(router_port_3[6]), .I1(buffer_3_data_out[6]), .S(n495), 
        .Z(n300) );
  CKND0 U659 ( .I(buffer_2_empty), .ZN(n3) );
  MUX2D0 U660 ( .I0(router_port_3[7]), .I1(buffer_3_data_out[7]), .S(n495), 
        .Z(n299) );
  MUX2D0 U661 ( .I0(router_port_3[8]), .I1(buffer_3_data_out[8]), .S(n495), 
        .Z(n298) );
  MUX2D0 U662 ( .I0(router_port_3[9]), .I1(buffer_3_data_out[9]), .S(n495), 
        .Z(n297) );
  MUX2D0 U663 ( .I0(router_port_3[10]), .I1(buffer_3_data_out[10]), .S(n495), 
        .Z(n296) );
  MUX2D0 U664 ( .I0(router_port_3[11]), .I1(buffer_3_data_out[11]), .S(n495), 
        .Z(n295) );
  MUX2D0 U665 ( .I0(router_port_3[12]), .I1(buffer_3_data_out[12]), .S(n495), 
        .Z(n294) );
  MUX2D0 U666 ( .I0(router_port_3[13]), .I1(buffer_3_data_out[13]), .S(n495), 
        .Z(n293) );
  MUX2D0 U667 ( .I0(router_port_3[14]), .I1(buffer_3_data_out[14]), .S(n495), 
        .Z(n292) );
  MUX2D0 U668 ( .I0(router_port_3[15]), .I1(buffer_3_data_out[15]), .S(n495), 
        .Z(n291) );
  MUX2D0 U669 ( .I0(router_port_3[16]), .I1(buffer_3_data_out[16]), .S(n495), 
        .Z(n290) );
  MUX2D0 U670 ( .I0(router_port_3[17]), .I1(buffer_3_data_out[17]), .S(n495), 
        .Z(n289) );
  MUX2D0 U671 ( .I0(router_port_3[18]), .I1(buffer_3_data_out[18]), .S(n495), 
        .Z(n288) );
  MUX2D0 U672 ( .I0(router_port_3[19]), .I1(buffer_3_data_out[19]), .S(n495), 
        .Z(n287) );
  XNR2D0 U673 ( .A1(n498), .A2(n512), .ZN(n270) );
  CKXOR2D0 U674 ( .A1(n511), .A2(n499), .Z(n269) );
  CKXOR2D0 U675 ( .A1(n500), .A2(buffer_2_rd_ptr[2]), .Z(n268) );
  NR2D0 U676 ( .A1(n511), .A2(n499), .ZN(n500) );
  IND2D0 U677 ( .A1(n512), .B1(n498), .ZN(n499) );
  MUX2D0 U678 ( .I0(router_port_2[0]), .I1(buffer_2_data_out[0]), .S(n498), 
        .Z(n267) );
  MUX2D0 U679 ( .I0(router_port_2[1]), .I1(buffer_2_data_out[1]), .S(n498), 
        .Z(n266) );
  MUX2D0 U680 ( .I0(router_port_2[2]), .I1(buffer_2_data_out[2]), .S(n498), 
        .Z(n265) );
  MUX2D0 U681 ( .I0(router_port_2[3]), .I1(buffer_2_data_out[3]), .S(n498), 
        .Z(n264) );
  MUX2D0 U682 ( .I0(router_port_2[4]), .I1(buffer_2_data_out[4]), .S(n498), 
        .Z(n263) );
  MUX2D0 U683 ( .I0(router_port_2[5]), .I1(buffer_2_data_out[5]), .S(n498), 
        .Z(n262) );
  MUX2D0 U684 ( .I0(router_port_2[6]), .I1(buffer_2_data_out[6]), .S(n498), 
        .Z(n261) );
  MUX2D0 U685 ( .I0(router_port_2[7]), .I1(buffer_2_data_out[7]), .S(n498), 
        .Z(n260) );
  MUX2D0 U686 ( .I0(router_port_2[8]), .I1(buffer_2_data_out[8]), .S(n498), 
        .Z(n259) );
  MUX2D0 U687 ( .I0(router_port_2[9]), .I1(buffer_2_data_out[9]), .S(n498), 
        .Z(n258) );
  MUX2D0 U688 ( .I0(router_port_2[10]), .I1(buffer_2_data_out[10]), .S(n498), 
        .Z(n257) );
  MUX2D0 U689 ( .I0(router_port_2[11]), .I1(buffer_2_data_out[11]), .S(n498), 
        .Z(n256) );
  MUX2D0 U690 ( .I0(router_port_2[12]), .I1(buffer_2_data_out[12]), .S(n498), 
        .Z(n255) );
  MUX2D0 U691 ( .I0(router_port_2[13]), .I1(buffer_2_data_out[13]), .S(n498), 
        .Z(n254) );
  MUX2D0 U692 ( .I0(router_port_2[14]), .I1(buffer_2_data_out[14]), .S(n498), 
        .Z(n253) );
  MUX2D0 U693 ( .I0(router_port_2[15]), .I1(buffer_2_data_out[15]), .S(n498), 
        .Z(n252) );
  MUX2D0 U694 ( .I0(router_port_2[16]), .I1(buffer_2_data_out[16]), .S(n498), 
        .Z(n251) );
  MUX2D0 U695 ( .I0(router_port_2[17]), .I1(buffer_2_data_out[17]), .S(n498), 
        .Z(n250) );
  MUX2D0 U696 ( .I0(router_port_2[18]), .I1(buffer_2_data_out[18]), .S(n498), 
        .Z(n249) );
  MUX2D0 U697 ( .I0(router_port_2[19]), .I1(buffer_2_data_out[19]), .S(n498), 
        .Z(n248) );
  XNR2D0 U698 ( .A1(n501), .A2(n510), .ZN(n231) );
  CKXOR2D0 U699 ( .A1(n509), .A2(n502), .Z(n230) );
  CKXOR2D0 U700 ( .A1(n503), .A2(buffer_1_rd_ptr[2]), .Z(n229) );
  NR2D0 U701 ( .A1(n509), .A2(n502), .ZN(n503) );
  IND2D0 U702 ( .A1(n510), .B1(n501), .ZN(n502) );
  MUX2D0 U703 ( .I0(router_port_1[0]), .I1(buffer_1_data_out[0]), .S(n501), 
        .Z(n228) );
  MUX2D0 U704 ( .I0(router_port_1[1]), .I1(buffer_1_data_out[1]), .S(n501), 
        .Z(n227) );
  MUX2D0 U705 ( .I0(router_port_1[2]), .I1(buffer_1_data_out[2]), .S(n501), 
        .Z(n226) );
  MUX2D0 U706 ( .I0(router_port_1[3]), .I1(buffer_1_data_out[3]), .S(n501), 
        .Z(n225) );
  MUX2D0 U707 ( .I0(router_port_1[4]), .I1(buffer_1_data_out[4]), .S(n501), 
        .Z(n224) );
  MUX2D0 U708 ( .I0(router_port_1[5]), .I1(buffer_1_data_out[5]), .S(n501), 
        .Z(n223) );
  MUX2D0 U709 ( .I0(router_port_1[6]), .I1(buffer_1_data_out[6]), .S(n501), 
        .Z(n222) );
  MUX2D0 U710 ( .I0(router_port_1[7]), .I1(buffer_1_data_out[7]), .S(n501), 
        .Z(n221) );
  MUX2D0 U711 ( .I0(router_port_1[8]), .I1(buffer_1_data_out[8]), .S(n501), 
        .Z(n220) );
  MUX2D0 U712 ( .I0(router_port_1[9]), .I1(buffer_1_data_out[9]), .S(n501), 
        .Z(n219) );
  MUX2D0 U713 ( .I0(router_port_1[10]), .I1(buffer_1_data_out[10]), .S(n501), 
        .Z(n218) );
  MUX2D0 U714 ( .I0(router_port_1[11]), .I1(buffer_1_data_out[11]), .S(n501), 
        .Z(n217) );
  MUX2D0 U715 ( .I0(router_port_1[12]), .I1(buffer_1_data_out[12]), .S(n501), 
        .Z(n216) );
  MUX2D0 U716 ( .I0(router_port_1[13]), .I1(buffer_1_data_out[13]), .S(n501), 
        .Z(n215) );
  MUX2D0 U717 ( .I0(router_port_1[14]), .I1(buffer_1_data_out[14]), .S(n501), 
        .Z(n214) );
  MUX2D0 U718 ( .I0(router_port_1[15]), .I1(buffer_1_data_out[15]), .S(n501), 
        .Z(n213) );
  MUX2D0 U719 ( .I0(router_port_1[16]), .I1(buffer_1_data_out[16]), .S(n501), 
        .Z(n212) );
  MUX2D0 U720 ( .I0(router_port_1[17]), .I1(buffer_1_data_out[17]), .S(n501), 
        .Z(n211) );
  MUX2D0 U721 ( .I0(router_port_1[18]), .I1(buffer_1_data_out[18]), .S(n501), 
        .Z(n210) );
  MUX2D0 U722 ( .I0(router_port_1[19]), .I1(buffer_1_data_out[19]), .S(n501), 
        .Z(n209) );
  CKND0 U723 ( .I(buffer_1_empty), .ZN(n2) );
  XNR2D0 U724 ( .A1(n504), .A2(n508), .ZN(n192) );
  CKXOR2D0 U725 ( .A1(n507), .A2(n505), .Z(n191) );
  CKXOR2D0 U726 ( .A1(n506), .A2(buffer_0_rd_ptr[2]), .Z(n190) );
  NR2D0 U727 ( .A1(n507), .A2(n505), .ZN(n506) );
  IND2D0 U728 ( .A1(n508), .B1(n504), .ZN(n505) );
  MUX2D0 U729 ( .I0(router_port_0[0]), .I1(buffer_0_data_out[0]), .S(n504), 
        .Z(n189) );
  MUX2D0 U730 ( .I0(router_port_0[1]), .I1(buffer_0_data_out[1]), .S(n504), 
        .Z(n188) );
  MUX2D0 U731 ( .I0(router_port_0[2]), .I1(buffer_0_data_out[2]), .S(n504), 
        .Z(n187) );
  MUX2D0 U732 ( .I0(router_port_0[3]), .I1(buffer_0_data_out[3]), .S(n504), 
        .Z(n186) );
  MUX2D0 U733 ( .I0(router_port_0[4]), .I1(buffer_0_data_out[4]), .S(n504), 
        .Z(n185) );
  MUX2D0 U734 ( .I0(router_port_0[5]), .I1(buffer_0_data_out[5]), .S(n504), 
        .Z(n184) );
  MUX2D0 U735 ( .I0(router_port_0[6]), .I1(buffer_0_data_out[6]), .S(n504), 
        .Z(n183) );
  MUX2D0 U736 ( .I0(router_port_0[7]), .I1(buffer_0_data_out[7]), .S(n504), 
        .Z(n182) );
  MUX2D0 U737 ( .I0(router_port_0[8]), .I1(buffer_0_data_out[8]), .S(n504), 
        .Z(n181) );
  MUX2D0 U738 ( .I0(router_port_0[9]), .I1(buffer_0_data_out[9]), .S(n504), 
        .Z(n180) );
  MUX2D0 U739 ( .I0(router_port_0[10]), .I1(buffer_0_data_out[10]), .S(n504), 
        .Z(n179) );
  MUX2D0 U740 ( .I0(router_port_0[11]), .I1(buffer_0_data_out[11]), .S(n504), 
        .Z(n178) );
  MUX2D0 U741 ( .I0(router_port_0[12]), .I1(buffer_0_data_out[12]), .S(n504), 
        .Z(n177) );
  MUX2D0 U742 ( .I0(router_port_0[13]), .I1(buffer_0_data_out[13]), .S(n504), 
        .Z(n176) );
  MUX2D0 U743 ( .I0(router_port_0[14]), .I1(buffer_0_data_out[14]), .S(n504), 
        .Z(n175) );
  MUX2D0 U744 ( .I0(router_port_0[15]), .I1(buffer_0_data_out[15]), .S(n504), 
        .Z(n174) );
  MUX2D0 U745 ( .I0(router_port_0[16]), .I1(buffer_0_data_out[16]), .S(n504), 
        .Z(n173) );
  MUX2D0 U746 ( .I0(router_port_0[17]), .I1(buffer_0_data_out[17]), .S(n504), 
        .Z(n172) );
  MUX2D0 U747 ( .I0(router_port_0[18]), .I1(buffer_0_data_out[18]), .S(n504), 
        .Z(n171) );
  MUX2D0 U748 ( .I0(router_port_0[19]), .I1(buffer_0_data_out[19]), .S(n504), 
        .Z(n170) );
  CKND0 U749 ( .I(buffer_0_empty), .ZN(n1) );
endmodule


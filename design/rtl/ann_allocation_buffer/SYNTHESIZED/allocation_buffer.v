
module allocation_buffer ( clk, rst, data_in, data_out, full, empty, rd_ptr, 
        wr_en, rd_en );
  input [19:0] data_in;
  output [19:0] data_out;
  input [2:0] rd_ptr;
  input clk, rst, wr_en, rd_en;
  output full, empty;
  wire   N14, \buffer[5][7] , \buffer[5][6] , \buffer[5][5] , \buffer[5][4] ,
         \buffer[5][3] , \buffer[5][2] , \buffer[5][1] , \buffer[5][0] ,
         \buffer[4][7] , \buffer[4][6] , \buffer[4][5] , \buffer[4][4] ,
         \buffer[4][3] , \buffer[4][2] , \buffer[4][1] , \buffer[4][0] ,
         \buffer[1][7] , \buffer[1][6] , \buffer[1][5] , \buffer[1][4] ,
         \buffer[1][3] , \buffer[1][2] , \buffer[1][1] , \buffer[1][0] ,
         \buffer[0][7] , \buffer[0][6] , \buffer[0][5] , \buffer[0][4] ,
         \buffer[0][3] , \buffer[0][2] , \buffer[0][1] , \buffer[0][0] , n1,
         n2, n3, n4, n6, n25, n26, n27, n28, n29, n30, n31, n32, n41, n42, n43,
         n44, n45, n46, n47, n48, n123, n139, n140, n141, n142, n143, n144,
         n145, n146, n147, n148, n149, n150, n151, n152, n153, n154, n155,
         n156, n157, n158, n159, n160, n161, n162, n163, n164, n165, n166,
         n167, n168, n169, n170, n171, n172, n173, n174, n175, n176, n177,
         n178, n179, n180, n182, n183, n184, n185, n186, n187, n188, n189,
         n190, n191, n192, n193, n194, n195, n196, n197, n198, n199, n200,
         n201, n202, n203, n204, n205, n206, n207, n208, n209, n210, n211,
         n212, n213, n214, n215, n216, n217, n218, n219, n220, n221, n222,
         n223, n224, n225, n226, n227, n228, n229, n230, n231, n232, n233,
         n234, n235, n236, n237, n238, n239, n240, n241, n242, n243, n244,
         n245, n246, n247, n248, n249, n250, n251, n252, n253, n254, n255,
         n256, n257, n258, n259, n260, n261, n262, n263, n264, n265, n266,
         n267, n268, n269, n270, n271, n272, n273, n274, n275, n276, n277,
         n278, n279, n280, n281, n282, n283, n284, n285, n286, n287, n288,
         n289, n290, n291, n292, n293, n294;
  wire   [2:0] wr_ptr;
  wire   [2:0] count;
  assign full = N14;

  DFQD1 \wr_ptr_reg[0]  ( .D(n180), .CP(clk), .Q(wr_ptr[0]) );
  DFQD1 \data_out_reg[19]  ( .D(n168), .CP(clk), .Q(data_out[19]) );
  DFQD1 \data_out_reg[18]  ( .D(n169), .CP(clk), .Q(data_out[18]) );
  DFQD1 \data_out_reg[17]  ( .D(n170), .CP(clk), .Q(data_out[17]) );
  DFQD1 \data_out_reg[16]  ( .D(n171), .CP(clk), .Q(data_out[16]) );
  DFQD1 \data_out_reg[15]  ( .D(n172), .CP(clk), .Q(data_out[15]) );
  DFQD1 \data_out_reg[14]  ( .D(n173), .CP(clk), .Q(data_out[14]) );
  DFQD1 \data_out_reg[13]  ( .D(n174), .CP(clk), .Q(data_out[13]) );
  DFQD1 \data_out_reg[12]  ( .D(n175), .CP(clk), .Q(data_out[12]) );
  DFQD1 \data_out_reg[11]  ( .D(n176), .CP(clk), .Q(data_out[11]) );
  DFQD1 \data_out_reg[10]  ( .D(n177), .CP(clk), .Q(data_out[10]) );
  DFQD1 \data_out_reg[9]  ( .D(n178), .CP(clk), .Q(data_out[9]) );
  DFQD1 \data_out_reg[8]  ( .D(n179), .CP(clk), .Q(data_out[8]) );
  DFQD1 \wr_ptr_reg[1]  ( .D(n167), .CP(clk), .Q(wr_ptr[1]) );
  DFQD1 \wr_ptr_reg[2]  ( .D(n166), .CP(clk), .Q(wr_ptr[2]) );
  DFQD1 \count_reg[0]  ( .D(n165), .CP(clk), .Q(count[0]) );
  DFQD1 \count_reg[1]  ( .D(n164), .CP(clk), .Q(count[1]) );
  DFQD1 \count_reg[2]  ( .D(n163), .CP(clk), .Q(count[2]) );
  EDFQD1 \buffer_reg[5][7]  ( .D(data_in[7]), .E(n4), .CP(clk), .Q(
        \buffer[5][7] ) );
  EDFQD1 \buffer_reg[5][6]  ( .D(data_in[6]), .E(n4), .CP(clk), .Q(
        \buffer[5][6] ) );
  EDFQD1 \buffer_reg[5][5]  ( .D(data_in[5]), .E(n4), .CP(clk), .Q(
        \buffer[5][5] ) );
  EDFQD1 \buffer_reg[5][4]  ( .D(data_in[4]), .E(n4), .CP(clk), .Q(
        \buffer[5][4] ) );
  EDFQD1 \buffer_reg[5][3]  ( .D(data_in[3]), .E(n4), .CP(clk), .Q(
        \buffer[5][3] ) );
  EDFQD1 \buffer_reg[5][2]  ( .D(data_in[2]), .E(n4), .CP(clk), .Q(
        \buffer[5][2] ) );
  EDFQD1 \buffer_reg[5][1]  ( .D(data_in[1]), .E(n4), .CP(clk), .Q(
        \buffer[5][1] ) );
  EDFQD1 \buffer_reg[5][0]  ( .D(data_in[0]), .E(n4), .CP(clk), .Q(
        \buffer[5][0] ) );
  EDFQD1 \buffer_reg[4][7]  ( .D(data_in[7]), .E(n3), .CP(clk), .Q(
        \buffer[4][7] ) );
  EDFQD1 \buffer_reg[4][6]  ( .D(data_in[6]), .E(n3), .CP(clk), .Q(
        \buffer[4][6] ) );
  EDFQD1 \buffer_reg[4][5]  ( .D(data_in[5]), .E(n3), .CP(clk), .Q(
        \buffer[4][5] ) );
  EDFQD1 \buffer_reg[4][4]  ( .D(data_in[4]), .E(n3), .CP(clk), .Q(
        \buffer[4][4] ) );
  EDFQD1 \buffer_reg[4][3]  ( .D(data_in[3]), .E(n3), .CP(clk), .Q(
        \buffer[4][3] ) );
  EDFQD1 \buffer_reg[4][2]  ( .D(data_in[2]), .E(n3), .CP(clk), .Q(
        \buffer[4][2] ) );
  EDFQD1 \buffer_reg[4][1]  ( .D(data_in[1]), .E(n3), .CP(clk), .Q(
        \buffer[4][1] ) );
  EDFQD1 \buffer_reg[4][0]  ( .D(data_in[0]), .E(n3), .CP(clk), .Q(
        \buffer[4][0] ) );
  EDFQD1 \buffer_reg[1][7]  ( .D(data_in[7]), .E(n2), .CP(clk), .Q(
        \buffer[1][7] ) );
  EDFQD1 \buffer_reg[1][6]  ( .D(data_in[6]), .E(n2), .CP(clk), .Q(
        \buffer[1][6] ) );
  EDFQD1 \buffer_reg[1][5]  ( .D(data_in[5]), .E(n2), .CP(clk), .Q(
        \buffer[1][5] ) );
  EDFQD1 \buffer_reg[1][4]  ( .D(data_in[4]), .E(n2), .CP(clk), .Q(
        \buffer[1][4] ) );
  EDFQD1 \buffer_reg[1][3]  ( .D(data_in[3]), .E(n2), .CP(clk), .Q(
        \buffer[1][3] ) );
  EDFQD1 \buffer_reg[1][2]  ( .D(data_in[2]), .E(n2), .CP(clk), .Q(
        \buffer[1][2] ) );
  EDFQD1 \buffer_reg[1][1]  ( .D(data_in[1]), .E(n2), .CP(clk), .Q(
        \buffer[1][1] ) );
  EDFQD1 \buffer_reg[1][0]  ( .D(data_in[0]), .E(n2), .CP(clk), .Q(
        \buffer[1][0] ) );
  EDFQD1 \buffer_reg[0][7]  ( .D(data_in[7]), .E(n1), .CP(clk), .Q(
        \buffer[0][7] ) );
  DFQD1 \data_out_reg[7]  ( .D(n139), .CP(clk), .Q(data_out[7]) );
  EDFQD1 \buffer_reg[0][6]  ( .D(data_in[6]), .E(n1), .CP(clk), .Q(
        \buffer[0][6] ) );
  DFQD1 \data_out_reg[6]  ( .D(n140), .CP(clk), .Q(data_out[6]) );
  EDFQD1 \buffer_reg[0][5]  ( .D(data_in[5]), .E(n1), .CP(clk), .Q(
        \buffer[0][5] ) );
  DFQD1 \data_out_reg[5]  ( .D(n141), .CP(clk), .Q(data_out[5]) );
  EDFQD1 \buffer_reg[0][4]  ( .D(data_in[4]), .E(n1), .CP(clk), .Q(
        \buffer[0][4] ) );
  DFQD1 \data_out_reg[4]  ( .D(n142), .CP(clk), .Q(data_out[4]) );
  EDFQD1 \buffer_reg[0][3]  ( .D(data_in[3]), .E(n1), .CP(clk), .Q(
        \buffer[0][3] ) );
  DFQD1 \data_out_reg[3]  ( .D(n143), .CP(clk), .Q(data_out[3]) );
  EDFQD1 \buffer_reg[0][2]  ( .D(data_in[2]), .E(n1), .CP(clk), .Q(
        \buffer[0][2] ) );
  DFQD1 \data_out_reg[2]  ( .D(n144), .CP(clk), .Q(data_out[2]) );
  EDFQD1 \buffer_reg[0][1]  ( .D(data_in[1]), .E(n1), .CP(clk), .Q(
        \buffer[0][1] ) );
  DFQD1 \data_out_reg[1]  ( .D(n145), .CP(clk), .Q(data_out[1]) );
  EDFQD1 \buffer_reg[0][0]  ( .D(data_in[0]), .E(n1), .CP(clk), .Q(
        \buffer[0][0] ) );
  DFQD1 \data_out_reg[0]  ( .D(n146), .CP(clk), .Q(data_out[0]) );
  EDFD1 \buffer_reg[6][7]  ( .D(data_in[7]), .E(n123), .CP(clk), .QN(n25) );
  EDFD1 \buffer_reg[6][6]  ( .D(data_in[6]), .E(n123), .CP(clk), .QN(n26) );
  EDFD1 \buffer_reg[6][5]  ( .D(data_in[5]), .E(n123), .CP(clk), .QN(n27) );
  EDFD1 \buffer_reg[6][4]  ( .D(data_in[4]), .E(n123), .CP(clk), .QN(n28) );
  EDFD1 \buffer_reg[6][3]  ( .D(data_in[3]), .E(n123), .CP(clk), .QN(n29) );
  EDFD1 \buffer_reg[6][2]  ( .D(data_in[2]), .E(n123), .CP(clk), .QN(n30) );
  EDFD1 \buffer_reg[6][1]  ( .D(data_in[1]), .E(n123), .CP(clk), .QN(n31) );
  EDFD1 \buffer_reg[6][0]  ( .D(data_in[0]), .E(n123), .CP(clk), .QN(n32) );
  EDFD1 \buffer_reg[2][7]  ( .D(data_in[7]), .E(n6), .CP(clk), .QN(n41) );
  EDFD1 \buffer_reg[2][6]  ( .D(data_in[6]), .E(n6), .CP(clk), .QN(n42) );
  EDFD1 \buffer_reg[2][5]  ( .D(data_in[5]), .E(n6), .CP(clk), .QN(n43) );
  EDFD1 \buffer_reg[2][4]  ( .D(data_in[4]), .E(n6), .CP(clk), .QN(n44) );
  EDFD1 \buffer_reg[2][3]  ( .D(data_in[3]), .E(n6), .CP(clk), .QN(n45) );
  EDFD1 \buffer_reg[2][2]  ( .D(data_in[2]), .E(n6), .CP(clk), .QN(n46) );
  EDFD1 \buffer_reg[2][1]  ( .D(data_in[1]), .E(n6), .CP(clk), .QN(n47) );
  EDFD1 \buffer_reg[2][0]  ( .D(data_in[0]), .E(n6), .CP(clk), .QN(n48) );
  DFD1 \buffer_reg[7][7]  ( .D(n162), .CP(clk), .QN(n196) );
  DFD1 \buffer_reg[7][6]  ( .D(n161), .CP(clk), .QN(n194) );
  DFD1 \buffer_reg[7][5]  ( .D(n160), .CP(clk), .QN(n192) );
  DFD1 \buffer_reg[7][4]  ( .D(n159), .CP(clk), .QN(n190) );
  DFD1 \buffer_reg[7][3]  ( .D(n158), .CP(clk), .QN(n188) );
  DFD1 \buffer_reg[7][2]  ( .D(n157), .CP(clk), .QN(n186) );
  DFD1 \buffer_reg[7][1]  ( .D(n156), .CP(clk), .QN(n184) );
  DFD1 \buffer_reg[7][0]  ( .D(n155), .CP(clk), .QN(n182) );
  DFD1 \buffer_reg[3][7]  ( .D(n154), .CP(clk), .QN(n197) );
  DFD1 \buffer_reg[3][6]  ( .D(n153), .CP(clk), .QN(n195) );
  DFD1 \buffer_reg[3][5]  ( .D(n152), .CP(clk), .QN(n193) );
  DFD1 \buffer_reg[3][4]  ( .D(n151), .CP(clk), .QN(n191) );
  DFD1 \buffer_reg[3][3]  ( .D(n150), .CP(clk), .QN(n189) );
  DFD1 \buffer_reg[3][2]  ( .D(n149), .CP(clk), .QN(n187) );
  DFD1 \buffer_reg[3][1]  ( .D(n148), .CP(clk), .QN(n185) );
  DFD1 \buffer_reg[3][0]  ( .D(n147), .CP(clk), .QN(n183) );
  NR2D0 U153 ( .A1(wr_ptr[2]), .A2(n198), .ZN(n6) );
  NR3D0 U154 ( .A1(n199), .A2(n200), .A3(n201), .ZN(n4) );
  NR3D0 U155 ( .A1(n199), .A2(wr_ptr[0]), .A3(n201), .ZN(n3) );
  NR3D0 U156 ( .A1(n201), .A2(wr_ptr[2]), .A3(n200), .ZN(n2) );
  MUX2ND0 U157 ( .I0(n202), .I1(n203), .S(wr_ptr[0]), .ZN(n180) );
  CKND2D0 U158 ( .A1(n204), .A2(n203), .ZN(n202) );
  AO22D0 U159 ( .A1(data_in[8]), .A2(n205), .B1(data_out[8]), .B2(n206), .Z(
        n179) );
  AO22D0 U160 ( .A1(data_in[9]), .A2(n205), .B1(data_out[9]), .B2(n206), .Z(
        n178) );
  AO22D0 U161 ( .A1(data_in[10]), .A2(n205), .B1(data_out[10]), .B2(n206), .Z(
        n177) );
  AO22D0 U162 ( .A1(data_in[11]), .A2(n205), .B1(data_out[11]), .B2(n206), .Z(
        n176) );
  AO22D0 U163 ( .A1(data_in[12]), .A2(n205), .B1(data_out[12]), .B2(n206), .Z(
        n175) );
  AO22D0 U164 ( .A1(data_in[13]), .A2(n205), .B1(data_out[13]), .B2(n206), .Z(
        n174) );
  AO22D0 U165 ( .A1(data_in[14]), .A2(n205), .B1(data_out[14]), .B2(n206), .Z(
        n173) );
  AO22D0 U166 ( .A1(data_in[15]), .A2(n205), .B1(data_out[15]), .B2(n206), .Z(
        n172) );
  AO22D0 U167 ( .A1(data_in[16]), .A2(n205), .B1(data_out[16]), .B2(n206), .Z(
        n171) );
  AO22D0 U168 ( .A1(data_in[17]), .A2(n205), .B1(data_out[17]), .B2(n206), .Z(
        n170) );
  AO22D0 U169 ( .A1(data_in[18]), .A2(n205), .B1(data_out[18]), .B2(n206), .Z(
        n169) );
  AO22D0 U170 ( .A1(data_in[19]), .A2(n205), .B1(data_out[19]), .B2(n206), .Z(
        n168) );
  MUX2D0 U171 ( .I0(n207), .I1(n208), .S(n209), .Z(n167) );
  MUX2ND0 U172 ( .I0(n210), .I1(n211), .S(wr_ptr[2]), .ZN(n166) );
  AOI21D0 U173 ( .A1(n204), .A2(n209), .B(n207), .ZN(n211) );
  OAI21D0 U174 ( .A1(wr_ptr[0]), .A2(n212), .B(n203), .ZN(n207) );
  CKND2D0 U175 ( .A1(n208), .A2(wr_ptr[1]), .ZN(n210) );
  AN3D0 U176 ( .A1(n203), .A2(wr_ptr[0]), .A3(n204), .Z(n208) );
  CKND2D0 U177 ( .A1(n213), .A2(n214), .ZN(n203) );
  MUX2ND0 U178 ( .I0(n215), .I1(n216), .S(count[0]), .ZN(n165) );
  CKND2D0 U179 ( .A1(n216), .A2(n213), .ZN(n215) );
  OAI22D0 U180 ( .A1(n217), .A2(n218), .B1(rst), .B2(n219), .ZN(n164) );
  MUX2ND0 U181 ( .I0(n220), .I1(n221), .S(count[1]), .ZN(n219) );
  NR2D0 U182 ( .A1(count[0]), .A2(n222), .ZN(n221) );
  NR2D0 U183 ( .A1(n223), .A2(n224), .ZN(n220) );
  XNR2D0 U184 ( .A1(count[0]), .A2(n222), .ZN(n224) );
  CKND0 U185 ( .I(count[1]), .ZN(n218) );
  OAI22D0 U186 ( .A1(n217), .A2(n225), .B1(rst), .B2(n226), .ZN(n163) );
  AOI22D0 U187 ( .A1(n227), .A2(n216), .B1(n228), .B2(count[2]), .ZN(n226) );
  MUX2ND0 U188 ( .I0(n222), .I1(count[0]), .S(count[1]), .ZN(n228) );
  CKND0 U189 ( .I(n223), .ZN(n216) );
  MUX2ND0 U190 ( .I0(n229), .I1(n230), .S(n222), .ZN(n227) );
  CKND0 U191 ( .I(empty), .ZN(n230) );
  ND3D0 U192 ( .A1(count[0]), .A2(n225), .A3(count[1]), .ZN(n229) );
  CKND0 U193 ( .I(count[2]), .ZN(n225) );
  AOI31D0 U194 ( .A1(n222), .A2(n213), .A3(count[0]), .B(n223), .ZN(n217) );
  AOI211D0 U195 ( .A1(n231), .A2(n232), .B(n222), .C(rst), .ZN(n223) );
  NR2D0 U196 ( .A1(n231), .A2(wr_en), .ZN(n222) );
  MUX2ND0 U197 ( .I0(n196), .I1(n233), .S(n234), .ZN(n162) );
  MUX2ND0 U198 ( .I0(n194), .I1(n235), .S(n234), .ZN(n161) );
  MUX2ND0 U199 ( .I0(n192), .I1(n236), .S(n234), .ZN(n160) );
  MUX2ND0 U200 ( .I0(n190), .I1(n237), .S(n234), .ZN(n159) );
  MUX2ND0 U201 ( .I0(n188), .I1(n238), .S(n234), .ZN(n158) );
  MUX2ND0 U202 ( .I0(n186), .I1(n239), .S(n234), .ZN(n157) );
  MUX2ND0 U203 ( .I0(n184), .I1(n240), .S(n234), .ZN(n156) );
  MUX2ND0 U204 ( .I0(n182), .I1(n241), .S(n234), .ZN(n155) );
  INR2D0 U205 ( .A1(N14), .B1(n214), .ZN(n234) );
  MUX2ND0 U206 ( .I0(n197), .I1(n233), .S(n242), .ZN(n154) );
  CKND0 U207 ( .I(data_in[7]), .ZN(n233) );
  MUX2ND0 U208 ( .I0(n195), .I1(n235), .S(n242), .ZN(n153) );
  CKND0 U209 ( .I(data_in[6]), .ZN(n235) );
  MUX2ND0 U210 ( .I0(n193), .I1(n236), .S(n242), .ZN(n152) );
  CKND0 U211 ( .I(data_in[5]), .ZN(n236) );
  MUX2ND0 U212 ( .I0(n191), .I1(n237), .S(n242), .ZN(n151) );
  CKND0 U213 ( .I(data_in[4]), .ZN(n237) );
  MUX2ND0 U214 ( .I0(n189), .I1(n238), .S(n242), .ZN(n150) );
  CKND0 U215 ( .I(data_in[3]), .ZN(n238) );
  MUX2ND0 U216 ( .I0(n187), .I1(n239), .S(n242), .ZN(n149) );
  CKND0 U217 ( .I(data_in[2]), .ZN(n239) );
  MUX2ND0 U218 ( .I0(n185), .I1(n240), .S(n242), .ZN(n148) );
  CKND0 U219 ( .I(data_in[1]), .ZN(n240) );
  MUX2ND0 U220 ( .I0(n183), .I1(n241), .S(n242), .ZN(n147) );
  NR4D0 U221 ( .A1(n209), .A2(n214), .A3(n200), .A4(wr_ptr[2]), .ZN(n242) );
  CKND0 U222 ( .I(data_in[0]), .ZN(n241) );
  AO222D0 U223 ( .A1(data_out[0]), .A2(n206), .B1(n243), .B2(n244), .C1(
        data_in[0]), .C2(n205), .Z(n146) );
  CKND2D0 U224 ( .A1(n245), .A2(n246), .ZN(n244) );
  AOI221D0 U225 ( .A1(\buffer[4][0] ), .A2(n247), .B1(\buffer[5][0] ), .B2(
        n248), .C(n249), .ZN(n246) );
  OAI22D0 U226 ( .A1(n250), .A2(n32), .B1(n182), .B2(n251), .ZN(n249) );
  AOI221D0 U227 ( .A1(\buffer[0][0] ), .A2(n252), .B1(\buffer[1][0] ), .B2(
        n253), .C(n254), .ZN(n245) );
  OAI22D0 U228 ( .A1(n255), .A2(n48), .B1(n183), .B2(n256), .ZN(n254) );
  AO222D0 U229 ( .A1(data_out[1]), .A2(n206), .B1(n243), .B2(n257), .C1(
        data_in[1]), .C2(n205), .Z(n145) );
  CKND2D0 U230 ( .A1(n258), .A2(n259), .ZN(n257) );
  AOI221D0 U231 ( .A1(\buffer[4][1] ), .A2(n247), .B1(\buffer[5][1] ), .B2(
        n248), .C(n260), .ZN(n259) );
  OAI22D0 U232 ( .A1(n250), .A2(n31), .B1(n184), .B2(n251), .ZN(n260) );
  AOI221D0 U233 ( .A1(\buffer[0][1] ), .A2(n252), .B1(\buffer[1][1] ), .B2(
        n253), .C(n261), .ZN(n258) );
  OAI22D0 U234 ( .A1(n255), .A2(n47), .B1(n185), .B2(n256), .ZN(n261) );
  AO222D0 U235 ( .A1(data_out[2]), .A2(n206), .B1(n243), .B2(n262), .C1(
        data_in[2]), .C2(n205), .Z(n144) );
  CKND2D0 U236 ( .A1(n263), .A2(n264), .ZN(n262) );
  AOI221D0 U237 ( .A1(\buffer[4][2] ), .A2(n247), .B1(\buffer[5][2] ), .B2(
        n248), .C(n265), .ZN(n264) );
  OAI22D0 U238 ( .A1(n250), .A2(n30), .B1(n186), .B2(n251), .ZN(n265) );
  AOI221D0 U239 ( .A1(\buffer[0][2] ), .A2(n252), .B1(\buffer[1][2] ), .B2(
        n253), .C(n266), .ZN(n263) );
  OAI22D0 U240 ( .A1(n255), .A2(n46), .B1(n187), .B2(n256), .ZN(n266) );
  AO222D0 U241 ( .A1(data_out[3]), .A2(n206), .B1(n243), .B2(n267), .C1(
        data_in[3]), .C2(n205), .Z(n143) );
  CKND2D0 U242 ( .A1(n268), .A2(n269), .ZN(n267) );
  AOI221D0 U243 ( .A1(\buffer[4][3] ), .A2(n247), .B1(\buffer[5][3] ), .B2(
        n248), .C(n270), .ZN(n269) );
  OAI22D0 U244 ( .A1(n250), .A2(n29), .B1(n188), .B2(n251), .ZN(n270) );
  AOI221D0 U245 ( .A1(\buffer[0][3] ), .A2(n252), .B1(\buffer[1][3] ), .B2(
        n253), .C(n271), .ZN(n268) );
  OAI22D0 U246 ( .A1(n255), .A2(n45), .B1(n189), .B2(n256), .ZN(n271) );
  AO222D0 U247 ( .A1(data_out[4]), .A2(n206), .B1(n243), .B2(n272), .C1(
        data_in[4]), .C2(n205), .Z(n142) );
  CKND2D0 U248 ( .A1(n273), .A2(n274), .ZN(n272) );
  AOI221D0 U249 ( .A1(\buffer[4][4] ), .A2(n247), .B1(\buffer[5][4] ), .B2(
        n248), .C(n275), .ZN(n274) );
  OAI22D0 U250 ( .A1(n250), .A2(n28), .B1(n190), .B2(n251), .ZN(n275) );
  AOI221D0 U251 ( .A1(\buffer[0][4] ), .A2(n252), .B1(\buffer[1][4] ), .B2(
        n253), .C(n276), .ZN(n273) );
  OAI22D0 U252 ( .A1(n255), .A2(n44), .B1(n191), .B2(n256), .ZN(n276) );
  AO222D0 U253 ( .A1(data_out[5]), .A2(n206), .B1(n243), .B2(n277), .C1(
        data_in[5]), .C2(n205), .Z(n141) );
  CKND2D0 U254 ( .A1(n278), .A2(n279), .ZN(n277) );
  AOI221D0 U255 ( .A1(\buffer[4][5] ), .A2(n247), .B1(\buffer[5][5] ), .B2(
        n248), .C(n280), .ZN(n279) );
  OAI22D0 U256 ( .A1(n250), .A2(n27), .B1(n192), .B2(n251), .ZN(n280) );
  AOI221D0 U257 ( .A1(\buffer[0][5] ), .A2(n252), .B1(\buffer[1][5] ), .B2(
        n253), .C(n281), .ZN(n278) );
  OAI22D0 U258 ( .A1(n255), .A2(n43), .B1(n193), .B2(n256), .ZN(n281) );
  AO222D0 U259 ( .A1(data_out[6]), .A2(n206), .B1(n243), .B2(n282), .C1(
        data_in[6]), .C2(n205), .Z(n140) );
  CKND2D0 U260 ( .A1(n283), .A2(n284), .ZN(n282) );
  AOI221D0 U261 ( .A1(\buffer[4][6] ), .A2(n247), .B1(\buffer[5][6] ), .B2(
        n248), .C(n285), .ZN(n284) );
  OAI22D0 U262 ( .A1(n250), .A2(n26), .B1(n194), .B2(n251), .ZN(n285) );
  AOI221D0 U263 ( .A1(\buffer[0][6] ), .A2(n252), .B1(\buffer[1][6] ), .B2(
        n253), .C(n286), .ZN(n283) );
  OAI22D0 U264 ( .A1(n255), .A2(n42), .B1(n195), .B2(n256), .ZN(n286) );
  AO222D0 U265 ( .A1(data_out[7]), .A2(n206), .B1(n243), .B2(n287), .C1(
        data_in[7]), .C2(n205), .Z(n139) );
  AN3D0 U266 ( .A1(n288), .A2(n213), .A3(wr_en), .Z(n205) );
  CKND0 U267 ( .I(rst), .ZN(n213) );
  CKND2D0 U268 ( .A1(n289), .A2(n290), .ZN(n287) );
  AOI221D0 U269 ( .A1(\buffer[4][7] ), .A2(n247), .B1(\buffer[5][7] ), .B2(
        n248), .C(n291), .ZN(n290) );
  OAI22D0 U270 ( .A1(n250), .A2(n25), .B1(n196), .B2(n251), .ZN(n291) );
  ND3D0 U271 ( .A1(rd_ptr[1]), .A2(rd_ptr[0]), .A3(rd_ptr[2]), .ZN(n251) );
  ND3D0 U272 ( .A1(rd_ptr[1]), .A2(n292), .A3(rd_ptr[2]), .ZN(n250) );
  NR3D0 U273 ( .A1(n292), .A2(rd_ptr[1]), .A3(n293), .ZN(n248) );
  NR3D0 U274 ( .A1(rd_ptr[0]), .A2(rd_ptr[1]), .A3(n293), .ZN(n247) );
  AOI221D0 U275 ( .A1(\buffer[0][7] ), .A2(n252), .B1(\buffer[1][7] ), .B2(
        n253), .C(n294), .ZN(n289) );
  OAI22D0 U276 ( .A1(n255), .A2(n41), .B1(n197), .B2(n256), .ZN(n294) );
  ND3D0 U277 ( .A1(rd_ptr[0]), .A2(n293), .A3(rd_ptr[1]), .ZN(n256) );
  ND3D0 U278 ( .A1(n292), .A2(n293), .A3(rd_ptr[1]), .ZN(n255) );
  CKND0 U279 ( .I(rd_ptr[2]), .ZN(n293) );
  NR3D0 U280 ( .A1(rd_ptr[1]), .A2(rd_ptr[2]), .A3(n292), .ZN(n253) );
  NR3D0 U281 ( .A1(rd_ptr[1]), .A2(rd_ptr[2]), .A3(rd_ptr[0]), .ZN(n252) );
  NR2D0 U282 ( .A1(n212), .A2(n206), .ZN(n243) );
  CKND0 U283 ( .I(n204), .ZN(n212) );
  NR2D0 U284 ( .A1(rd_en), .A2(rst), .ZN(n206) );
  NR2D0 U285 ( .A1(n198), .A2(n199), .ZN(n123) );
  ND3D0 U286 ( .A1(n232), .A2(n200), .A3(wr_ptr[1]), .ZN(n198) );
  NR3D0 U287 ( .A1(n201), .A2(wr_ptr[2]), .A3(wr_ptr[0]), .ZN(n1) );
  CKND2D0 U288 ( .A1(n232), .A2(n209), .ZN(n201) );
  CKND0 U289 ( .I(n214), .ZN(n232) );
  CKND2D0 U290 ( .A1(n204), .A2(wr_en), .ZN(n214) );
  AOI21D0 U291 ( .A1(n288), .A2(wr_en), .B(rst), .ZN(n204) );
  NR3D0 U292 ( .A1(n292), .A2(n231), .A3(n200), .ZN(n288) );
  CKND0 U293 ( .I(rd_en), .ZN(n231) );
  CKND0 U294 ( .I(rd_ptr[0]), .ZN(n292) );
  NR3D0 U295 ( .A1(count[1]), .A2(count[2]), .A3(count[0]), .ZN(empty) );
  NR3D0 U296 ( .A1(n209), .A2(n200), .A3(n199), .ZN(N14) );
  CKND0 U297 ( .I(wr_ptr[2]), .ZN(n199) );
  CKND0 U298 ( .I(wr_ptr[0]), .ZN(n200) );
  CKND0 U299 ( .I(wr_ptr[1]), .ZN(n209) );
endmodule


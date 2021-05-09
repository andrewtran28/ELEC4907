
module fma_exp_diff ( exp_a, exp_b, exp_c, exp_diff_start, fma_byp, exp_diff, 
        exp_ab, exp_ab_greater, exp_ab_less, exp_diff_done );
  input [4:0] exp_a;
  input [4:0] exp_b;
  input [4:0] exp_c;
  output [4:0] exp_diff;
  output [4:0] exp_ab;
  input exp_diff_start, fma_byp;
  output exp_ab_greater, exp_ab_less, exp_diff_done;
  wire   exp_diff_start, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12,
         n13, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26,
         n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40,
         n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53, n54,
         n55, n56, n57, n58, n59, n60, n61, n62, n63, n64, n65, n66, n67, n68,
         n69, n70, n71, n72, n73, n74, n75, n76, n77, n78, n79, n80, n81;

  OAI22D0 U3 ( .A1(n1), .A2(n2), .B1(n3), .B2(n4), .ZN(exp_diff[4]) );
  XNR3D0 U4 ( .A1(n5), .A2(n6), .A3(n7), .ZN(n3) );
  OAI22D0 U5 ( .A1(n8), .A2(n9), .B1(n10), .B2(n11), .ZN(n7) );
  XNR3D0 U6 ( .A1(n6), .A2(n12), .A3(n13), .ZN(n2) );
  OAI22D0 U7 ( .A1(n14), .A2(n8), .B1(n15), .B2(n16), .ZN(n13) );
  XNR2D0 U8 ( .A1(n17), .A2(n18), .ZN(n6) );
  IND2D0 U9 ( .A1(n19), .B1(n20), .ZN(n18) );
  NR2D0 U10 ( .A1(n12), .A2(n5), .ZN(n17) );
  OAI22D0 U11 ( .A1(n21), .A2(n1), .B1(n4), .B2(n22), .ZN(exp_diff[3]) );
  XNR2D0 U12 ( .A1(n10), .A2(n11), .ZN(n22) );
  XNR2D0 U13 ( .A1(n8), .A2(n9), .ZN(n11) );
  AOI22D0 U14 ( .A1(n23), .A2(exp_c[2]), .B1(n24), .B2(n25), .ZN(n10) );
  XNR2D0 U15 ( .A1(n15), .A2(n16), .ZN(n21) );
  XNR2D0 U16 ( .A1(n8), .A2(n14), .ZN(n16) );
  CKXOR2D0 U17 ( .A1(n20), .A2(n19), .Z(n8) );
  MUX2ND0 U18 ( .I0(n14), .I1(n9), .S(n26), .ZN(n19) );
  NR3D0 U19 ( .A1(n27), .A2(n28), .A3(n29), .ZN(n20) );
  MAOI22D0 U20 ( .A1(n30), .A2(n23), .B1(n31), .B2(n32), .ZN(n15) );
  OAI22D0 U21 ( .A1(n33), .A2(n1), .B1(n4), .B2(n34), .ZN(exp_diff[2]) );
  XNR2D0 U22 ( .A1(n24), .A2(n25), .ZN(n34) );
  XNR2D0 U23 ( .A1(n23), .A2(n35), .ZN(n25) );
  CKND0 U24 ( .I(n36), .ZN(n24) );
  MAOI222D0 U25 ( .A(exp_c[1]), .B(n37), .C(n38), .ZN(n36) );
  NR2D0 U26 ( .A1(n39), .A2(n40), .ZN(n38) );
  XNR2D0 U27 ( .A1(n31), .A2(n32), .ZN(n33) );
  XNR2D0 U28 ( .A1(n23), .A2(n30), .ZN(n32) );
  XNR2D0 U29 ( .A1(n41), .A2(n28), .ZN(n23) );
  MUX2ND0 U30 ( .I0(n42), .I1(n35), .S(n26), .ZN(n28) );
  NR2D0 U31 ( .A1(n27), .A2(n29), .ZN(n41) );
  MAOI222D0 U32 ( .A(n43), .B(n37), .C(n44), .ZN(n31) );
  XNR2D0 U33 ( .A1(n40), .A2(n29), .ZN(n37) );
  OAI22D0 U34 ( .A1(n1), .A2(n45), .B1(n46), .B2(n4), .ZN(exp_diff[1]) );
  XNR3D0 U35 ( .A1(n47), .A2(exp_c[1]), .A3(n48), .ZN(n46) );
  CKND2D0 U36 ( .A1(n27), .A2(exp_c[0]), .ZN(n47) );
  XNR3D0 U37 ( .A1(n49), .A2(n44), .A3(n48), .ZN(n45) );
  XNR2D0 U38 ( .A1(n27), .A2(n29), .ZN(n48) );
  MUX2ND0 U39 ( .I0(n49), .I1(n50), .S(n26), .ZN(n29) );
  OAI32D0 U40 ( .A1(n1), .A2(n44), .A3(n51), .B1(n4), .B2(n52), .ZN(
        exp_diff[0]) );
  XNR2D0 U41 ( .A1(n40), .A2(n39), .ZN(n52) );
  CKND0 U42 ( .I(exp_ab_less), .ZN(n4) );
  NR2D0 U43 ( .A1(n27), .A2(n53), .ZN(n51) );
  NR2D0 U44 ( .A1(n40), .A2(n54), .ZN(n44) );
  CKND0 U45 ( .I(n27), .ZN(n40) );
  MUX2ND0 U46 ( .I0(n54), .I1(n39), .S(n26), .ZN(n27) );
  INR2D0 U47 ( .A1(n55), .B1(fma_byp), .ZN(exp_ab_less) );
  OAI22D0 U48 ( .A1(n56), .A2(n5), .B1(n57), .B2(n58), .ZN(n55) );
  AOI22D0 U49 ( .A1(n59), .A2(n60), .B1(n14), .B2(exp_c[3]), .ZN(n57) );
  OAI22D0 U50 ( .A1(n35), .A2(n30), .B1(n61), .B2(n62), .ZN(n60) );
  AOI32D0 U51 ( .A1(n54), .A2(n63), .A3(exp_c[0]), .B1(n49), .B2(exp_c[1]), 
        .ZN(n61) );
  CKND0 U52 ( .I(n1), .ZN(exp_ab_greater) );
  IND2D0 U53 ( .A1(fma_byp), .B1(n26), .ZN(n1) );
  OAI22D0 U54 ( .A1(exp_c[4]), .A2(n12), .B1(n64), .B2(n58), .ZN(n26) );
  XNR2D0 U55 ( .A1(n56), .A2(n5), .ZN(n58) );
  CKND0 U56 ( .I(exp_c[4]), .ZN(n5) );
  AOI22D0 U57 ( .A1(n59), .A2(n65), .B1(n66), .B2(n9), .ZN(n64) );
  OAI22D0 U58 ( .A1(exp_c[2]), .A2(n42), .B1(n67), .B2(n62), .ZN(n65) );
  XNR2D0 U59 ( .A1(n30), .A2(n35), .ZN(n62) );
  CKND0 U60 ( .I(exp_c[2]), .ZN(n35) );
  AOI32D0 U61 ( .A1(n53), .A2(n39), .A3(n63), .B1(n43), .B2(n50), .ZN(n67) );
  XNR2D0 U62 ( .A1(n49), .A2(n50), .ZN(n63) );
  CKND0 U63 ( .I(exp_c[1]), .ZN(n50) );
  CKND0 U64 ( .I(exp_c[0]), .ZN(n39) );
  XNR2D0 U65 ( .A1(n14), .A2(n9), .ZN(n59) );
  CKND0 U66 ( .I(exp_c[3]), .ZN(n9) );
  NR2D0 U67 ( .A1(fma_byp), .A2(n12), .ZN(exp_ab[4]) );
  CKND0 U68 ( .I(n56), .ZN(n12) );
  CKND2D0 U69 ( .A1(n68), .A2(n69), .ZN(n56) );
  NR2D0 U70 ( .A1(fma_byp), .A2(n14), .ZN(exp_ab[3]) );
  CKND0 U71 ( .I(n66), .ZN(n14) );
  CKND2D0 U72 ( .A1(n70), .A2(n71), .ZN(n66) );
  XNR2D0 U73 ( .A1(n72), .A2(n73), .ZN(n71) );
  NR2D0 U74 ( .A1(fma_byp), .A2(n42), .ZN(exp_ab[2]) );
  CKND0 U75 ( .I(n30), .ZN(n42) );
  CKND2D0 U76 ( .A1(n74), .A2(n70), .ZN(n30) );
  XNR2D0 U77 ( .A1(n75), .A2(n76), .ZN(n74) );
  NR2D0 U78 ( .A1(fma_byp), .A2(n49), .ZN(exp_ab[1]) );
  CKND0 U79 ( .I(n43), .ZN(n49) );
  CKND2D0 U80 ( .A1(n77), .A2(n70), .ZN(n43) );
  XNR3D0 U81 ( .A1(exp_b[1]), .A2(exp_a[1]), .A3(n78), .ZN(n77) );
  NR2D0 U82 ( .A1(fma_byp), .A2(n54), .ZN(exp_ab[0]) );
  CKND0 U83 ( .I(n53), .ZN(n54) );
  OAI21D0 U84 ( .A1(n79), .A2(n78), .B(n70), .ZN(n53) );
  MAOI22D0 U85 ( .A1(exp_b[4]), .A2(exp_a[4]), .B1(n68), .B2(n69), .ZN(n70) );
  NR2D0 U86 ( .A1(exp_a[4]), .A2(exp_b[4]), .ZN(n69) );
  OA21D0 U87 ( .A1(n72), .A2(n73), .B(n80), .Z(n68) );
  OAI21D0 U88 ( .A1(exp_b[3]), .A2(exp_a[3]), .B(n80), .ZN(n73) );
  CKND2D0 U89 ( .A1(exp_b[3]), .A2(exp_a[3]), .ZN(n80) );
  OA21D0 U90 ( .A1(n75), .A2(n76), .B(n81), .Z(n72) );
  MAOI222D0 U91 ( .A(exp_b[1]), .B(n78), .C(exp_a[1]), .ZN(n76) );
  OAI21D0 U92 ( .A1(exp_b[2]), .A2(exp_a[2]), .B(n81), .ZN(n75) );
  CKND2D0 U93 ( .A1(exp_b[2]), .A2(exp_a[2]), .ZN(n81) );
  AN2D0 U94 ( .A1(exp_b[0]), .A2(exp_a[0]), .Z(n78) );
  NR2D0 U95 ( .A1(exp_b[0]), .A2(exp_a[0]), .ZN(n79) );
endmodule


module fma_mult_tree ( mantissa_a, mantissa_b, sign_a, sign_b, fma_byp, 
        a_equals_one, b_equals_one, mult_start, mantissa_ab, sign_ab, 
        mult_done );
  input [9:0] mantissa_a;
  input [9:0] mantissa_b;
  output [19:0] mantissa_ab;
  input sign_a, sign_b, fma_byp, a_equals_one, b_equals_one, mult_start;
  output sign_ab, mult_done;
  wire   mult_start, N37, N66, N93, N118, N141, N142, N251, N255, N317, N323,
         N324, N325, N326, N327, N328, N329, N332, N333, N336, N337, N340,
         N341, N344, N345, N348, N349, N352, N353, N356, N357, N360, N361,
         N364, N365, N368, N369, N373, N470, n583, n584, n585, n586, n587,
         n588, n589, n590, n591, n592, n593, n594, n595, n596, n597, n598,
         n599, n600, n601, n602, n603, n604, n606, n607, n608, n609, n610,
         n611, n612, n613, n614, n615, n616, n617, n618, n619, n620, n621,
         n622, n623, n624, n625, n626, n627, n628, n629, n630, n1, n2, n3, n4,
         n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19,
         n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33,
         n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47,
         n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, n59, n60, n61,
         n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72, n73, n74, n75,
         n76, n77, n78, n79, n80, n81, n82, n83, n84, n85, n86, n87, n88, n89,
         n90, n91, n92, n93, n94, n95, n96, n97, n98, n99, n100, n101, n102,
         n103, n104, n105, n106, n107, n108, n109, n110, n111, n112, n113,
         n114, n115, n116, n117, n118, n119, n120, n121, n122, n123, n124,
         n125, n126, n127, n128, n129, n130, n131, n132, n133, n134, n135,
         n136, n137, n138, n139, n140, n141, n142, n143, n144, n145, n146,
         n147, n148, n149, n150, n151, n152, n153, n154, n155, n156, n157,
         n158, n159, n160, n161, n162, n163, n164, n165, n166, n167, n168,
         n169, n170, n171, n172, n173, n174, n175, n176, n177, n178, n179,
         n180, n181, n182, n183, n184, n185, n186, n187, n188, n189, n190,
         n191, n192, n193, n194, n195, n196, n197, n198, n199, n200, n201,
         n202, n203, n204, n205, n206, n207, n208, n209, n210, n211, n212,
         n213, n214, n215, n216, n217, n218, n219, n220, n221, n222, n223,
         n224, n225, n226, n227, n228, n229, n230, n231, n232, n233, n234,
         n235, n236, n237, n238, n239, n240, n241, n242, n243, n244, n245,
         n246, n247, n248, n249, n250, n251, n252, n253, n254, n255, n256,
         n257, n258, n259, n260, n261, n262, n263, n264, n265, n266, n267,
         n268, n269, n270, n271, n272, n273, n274, n275, n276, n277, n278,
         n279, n280, n281, n282, n283, n284, n285, n286, n287, n288, n289,
         n290, n291, n292, n293, n294, n295, n296, n297, n298, n299, n300,
         n301, n302, n303, n304, n305, n306, n307, n308, n309, n310, n311,
         n312, n313, n314, n315, n316, n317, n318, n319, n320, n321, n322,
         n323, n324, n325, n326, n327, n328, n329, n330, n331, n332, n333,
         n334, n335, n336, n337, n338, n339, n340, n341, n342, n343, n344,
         n345, n346, n347, n348, n349, n350, n351, n352, n353, n354, n355,
         n356, n357, n358, n359, n360, n361, n362, n363, n364, n365, n366,
         n367, n368, n369, n370, n371, n372, n373, n374, n375, n376, n377,
         n378, n379, n380, n381, n382, n383, n384, n385, n386, n387, n388,
         n389, n390, n391, n392, n393, n394, n395, n396, n397, n398, n399,
         n400, n401, n402, n403, n404, n405, n406, n407, n408, n409, n410,
         n411, n412, n413, n414, n415, n416, n417, n418, n419, n420, n421,
         n422, n423, n424, n425, n426, n427, n428, n429, n430, n431, n432,
         n433, n434, n435, n436, n437, n438, n439, n440, n441, n442, n443,
         n444, n445, n446, n447, n448, n449, n450, n451, n452, n453, n454,
         n455, n456, n457, n458, n459, n460, n461, n462, n463, n464, n465,
         n466, n467, n468, n469, n470, n471, n472, n473, n474, n475, n476,
         n477, n478, n479, n480, n481, n482, n483, n484, n485, n486, n487,
         n488, n489, n490, n491, n492, n493, n494;


  CKXOR2D1 U419 ( .A1(N373), .A2(N323), .Z(n604) );
  CKXOR2D1 U420 ( .A1(N324), .A2(n604), .Z(N470) );
  CKXOR2D1 U421 ( .A1(N325), .A2(N326), .Z(n603) );
  CKXOR2D1 U422 ( .A1(n630), .A2(n603), .Z(n618) );
  CKXOR2D1 U423 ( .A1(N327), .A2(N328), .Z(n602) );
  CKXOR2D1 U424 ( .A1(n629), .A2(n602), .Z(n617) );
  CKXOR2D1 U425 ( .A1(N329), .A2(N332), .Z(n601) );
  CKXOR2D1 U426 ( .A1(n628), .A2(n601), .Z(n616) );
  CKXOR2D1 U427 ( .A1(N333), .A2(N336), .Z(n600) );
  CKXOR2D1 U428 ( .A1(n627), .A2(n600), .Z(n615) );
  CKXOR2D1 U429 ( .A1(N337), .A2(N340), .Z(n599) );
  CKXOR2D1 U430 ( .A1(n626), .A2(n599), .Z(n614) );
  CKXOR2D1 U431 ( .A1(N341), .A2(N344), .Z(n598) );
  CKXOR2D1 U432 ( .A1(n625), .A2(n598), .Z(n613) );
  CKXOR2D1 U433 ( .A1(N345), .A2(N348), .Z(n597) );
  CKXOR2D1 U434 ( .A1(n494), .A2(n597), .Z(n612) );
  CKXOR2D1 U435 ( .A1(N349), .A2(N352), .Z(n596) );
  CKXOR2D1 U436 ( .A1(n624), .A2(n596), .Z(n611) );
  CKXOR2D1 U437 ( .A1(N353), .A2(N356), .Z(n595) );
  CKXOR2D1 U438 ( .A1(n623), .A2(n595), .Z(n610) );
  CKXOR2D1 U439 ( .A1(N357), .A2(N360), .Z(n594) );
  CKXOR2D1 U440 ( .A1(n622), .A2(n594), .Z(n609) );
  CKXOR2D1 U441 ( .A1(N361), .A2(N364), .Z(n593) );
  CKXOR2D1 U442 ( .A1(n621), .A2(n593), .Z(n608) );
  CKXOR2D1 U443 ( .A1(N365), .A2(N368), .Z(n592) );
  CKXOR2D1 U444 ( .A1(n620), .A2(n592), .Z(n607) );
  CKXOR2D1 U445 ( .A1(N142), .A2(N37), .Z(n591) );
  CKXOR2D1 U446 ( .A1(N66), .A2(N93), .Z(n590) );
  CKXOR2D1 U447 ( .A1(N118), .A2(N141), .Z(n589) );
  CKXOR2D1 U448 ( .A1(N251), .A2(N255), .Z(n588) );
  CKXOR2D1 U449 ( .A1(N317), .A2(N369), .Z(n587) );
  CKXOR2D1 U450 ( .A1(n619), .A2(n591), .Z(n586) );
  CKXOR2D1 U451 ( .A1(n590), .A2(n589), .Z(n585) );
  CKXOR2D1 U452 ( .A1(n588), .A2(n587), .Z(n584) );
  CKXOR2D1 U453 ( .A1(n586), .A2(n585), .Z(n583) );
  CKXOR2D1 U454 ( .A1(n584), .A2(n583), .Z(n606) );
  CKXOR2D0 U2 ( .A1(sign_b), .A2(sign_a), .Z(sign_ab) );
  CKND0 U3 ( .I(n1), .ZN(n494) );
  OA211D0 U4 ( .A1(n2), .A2(n3), .B(n4), .C(n5), .Z(n622) );
  OA21D0 U5 ( .A1(n625), .A2(n6), .B(n7), .Z(n3) );
  OA221D0 U6 ( .A1(n8), .A2(n9), .B1(n10), .B2(n11), .C(n12), .Z(n625) );
  CKND2D0 U7 ( .A1(n13), .A2(n14), .ZN(n9) );
  AOI21D0 U8 ( .A1(n15), .A2(n16), .B(n17), .ZN(n621) );
  MOAI22D0 U9 ( .A1(n18), .A2(n5), .B1(N357), .B2(N360), .ZN(n17) );
  OAI21D0 U10 ( .A1(n19), .A2(n2), .B(n4), .ZN(n16) );
  AOI21D0 U11 ( .A1(n1), .A2(n20), .B(n21), .ZN(n19) );
  OAI22D0 U12 ( .A1(n22), .A2(n23), .B1(n24), .B2(n25), .ZN(n1) );
  OA221D0 U13 ( .A1(n26), .A2(n27), .B1(n10), .B2(n628), .C(n28), .Z(n24) );
  ND3D0 U14 ( .A1(N332), .A2(n14), .A3(n13), .ZN(n10) );
  CKND0 U15 ( .I(n18), .ZN(n15) );
  AOI21D0 U16 ( .A1(n29), .A2(n30), .B(n31), .ZN(n620) );
  OAI21D0 U17 ( .A1(n624), .A2(n2), .B(n4), .ZN(n30) );
  CKND2D0 U18 ( .A1(n32), .A2(n33), .ZN(n4) );
  OAI21D0 U19 ( .A1(N349), .A2(N352), .B(n33), .ZN(n2) );
  IAO21D0 U20 ( .A1(n34), .A2(n6), .B(n35), .ZN(n624) );
  OA31D0 U21 ( .A1(n26), .A2(n627), .A3(n36), .B(n12), .Z(n34) );
  AOI31D0 U22 ( .A1(N336), .A2(N333), .A3(n14), .B(n37), .ZN(n12) );
  CKND0 U23 ( .I(n28), .ZN(n37) );
  CKND0 U24 ( .I(n26), .ZN(n14) );
  OA21D0 U25 ( .A1(n38), .A2(n11), .B(n8), .Z(n627) );
  CKND2D0 U26 ( .A1(N332), .A2(n39), .ZN(n8) );
  OAI21D0 U27 ( .A1(n40), .A2(n41), .B(n42), .ZN(n39) );
  OR2D0 U28 ( .A1(n629), .A2(n40), .Z(n11) );
  CKND0 U29 ( .I(N328), .ZN(n40) );
  CKND0 U30 ( .I(n43), .ZN(n619) );
  MAOI222D0 U31 ( .A(n44), .B(n45), .C(n46), .ZN(n43) );
  MAOI22D0 U32 ( .A1(n47), .A2(n48), .B1(n49), .B2(n50), .ZN(n46) );
  CKXOR2D0 U33 ( .A1(n51), .A2(n52), .Z(n45) );
  CKND0 U34 ( .I(n53), .ZN(n52) );
  AOI31D0 U35 ( .A1(n33), .A2(n54), .A3(n29), .B(n31), .ZN(n44) );
  MAOI222D0 U36 ( .A(n55), .B(n56), .C(n57), .ZN(n31) );
  AOI22D0 U37 ( .A1(n58), .A2(n59), .B1(n60), .B2(n61), .ZN(n57) );
  MAOI22D0 U38 ( .A1(N360), .A2(N357), .B1(n5), .B2(n18), .ZN(n56) );
  CKND2D0 U39 ( .A1(N356), .A2(N353), .ZN(n5) );
  IAO21D0 U40 ( .A1(N361), .A2(N364), .B(n18), .ZN(n29) );
  XNR2D0 U41 ( .A1(N360), .A2(N357), .ZN(n18) );
  CKND0 U42 ( .I(n623), .ZN(n54) );
  OAI32D0 U43 ( .A1(n62), .A2(n32), .A3(n35), .B1(N349), .B2(N352), .ZN(n623)
         );
  CKND0 U44 ( .I(n7), .ZN(n35) );
  AOI31D0 U45 ( .A1(N344), .A2(n20), .A3(N341), .B(n21), .ZN(n7) );
  AN2D0 U46 ( .A1(N348), .A2(N345), .Z(n21) );
  CKND0 U47 ( .I(n63), .ZN(n20) );
  AN2D0 U48 ( .A1(N352), .A2(N349), .Z(n32) );
  OAI33D0 U49 ( .A1(n28), .A2(n63), .A3(n25), .B1(n6), .B2(n626), .B3(n26), 
        .ZN(n62) );
  NR2D0 U50 ( .A1(N340), .A2(N337), .ZN(n26) );
  OA31D0 U51 ( .A1(n36), .A2(n628), .A3(n38), .B(n27), .Z(n626) );
  AOI32D0 U52 ( .A1(N329), .A2(N332), .A3(n13), .B1(N333), .B2(N336), .ZN(n27)
         );
  CKND0 U53 ( .I(n36), .ZN(n13) );
  IOA21D0 U54 ( .A1(n41), .A2(n629), .B(N328), .ZN(n628) );
  OAI21D0 U55 ( .A1(N325), .A2(n64), .B(N326), .ZN(n629) );
  CKND0 U56 ( .I(n630), .ZN(n64) );
  OAI21D0 U57 ( .A1(N373), .A2(N323), .B(N324), .ZN(n630) );
  XNR2D0 U58 ( .A1(N336), .A2(N333), .ZN(n36) );
  OR2D0 U59 ( .A1(n25), .A2(n63), .Z(n6) );
  CKXOR2D0 U60 ( .A1(N344), .A2(n22), .Z(n25) );
  CKND0 U61 ( .I(N341), .ZN(n22) );
  NR2D0 U62 ( .A1(N348), .A2(N345), .ZN(n63) );
  CKND2D0 U63 ( .A1(N340), .A2(N337), .ZN(n28) );
  CKXOR2D0 U64 ( .A1(N353), .A2(N356), .Z(n33) );
  OAI222D0 U65 ( .A1(n616), .A2(n65), .B1(n66), .B2(n67), .C1(n68), .C2(n69), 
        .ZN(mantissa_ab[9]) );
  OAI222D0 U66 ( .A1(n617), .A2(n65), .B1(n70), .B2(n67), .C1(n71), .C2(n69), 
        .ZN(mantissa_ab[8]) );
  OAI222D0 U67 ( .A1(n618), .A2(n65), .B1(n72), .B2(n67), .C1(n73), .C2(n69), 
        .ZN(mantissa_ab[7]) );
  CKND0 U68 ( .I(mantissa_a[7]), .ZN(n72) );
  AO222D0 U69 ( .A1(N470), .A2(n74), .B1(n75), .B2(mantissa_a[6]), .C1(n76), 
        .C2(mantissa_b[6]), .Z(mantissa_ab[6]) );
  CKND0 U70 ( .I(n69), .ZN(n76) );
  OAI222D0 U71 ( .A1(n77), .A2(n67), .B1(n78), .B2(n65), .C1(n79), .C2(n69), 
        .ZN(mantissa_ab[5]) );
  CKXOR2D0 U72 ( .A1(n80), .A2(n81), .Z(n78) );
  CKND0 U73 ( .I(mantissa_a[5]), .ZN(n77) );
  OAI222D0 U74 ( .A1(n82), .A2(n67), .B1(n83), .B2(n65), .C1(n84), .C2(n69), 
        .ZN(mantissa_ab[4]) );
  XNR2D0 U75 ( .A1(n85), .A2(n86), .ZN(n83) );
  CKND0 U76 ( .I(mantissa_a[4]), .ZN(n82) );
  OAI222D0 U77 ( .A1(n87), .A2(n67), .B1(n88), .B2(n65), .C1(n89), .C2(n69), 
        .ZN(mantissa_ab[3]) );
  CKXOR2D0 U78 ( .A1(n90), .A2(n91), .Z(n88) );
  CKND0 U79 ( .I(mantissa_a[3]), .ZN(n87) );
  OAI222D0 U80 ( .A1(n92), .A2(n67), .B1(n65), .B2(n93), .C1(n94), .C2(n69), 
        .ZN(mantissa_ab[2]) );
  XNR2D0 U81 ( .A1(n95), .A2(n96), .ZN(n93) );
  CKND0 U82 ( .I(mantissa_a[2]), .ZN(n92) );
  OAI222D0 U83 ( .A1(n97), .A2(n67), .B1(n65), .B2(n98), .C1(n99), .C2(n69), 
        .ZN(mantissa_ab[1]) );
  CKXOR2D0 U84 ( .A1(n100), .A2(n101), .Z(n98) );
  CKND0 U85 ( .I(mantissa_a[1]), .ZN(n97) );
  NR2D0 U86 ( .A1(n606), .A2(n65), .ZN(mantissa_ab[19]) );
  NR2D0 U87 ( .A1(n607), .A2(n65), .ZN(mantissa_ab[18]) );
  NR2D0 U88 ( .A1(n608), .A2(n65), .ZN(mantissa_ab[17]) );
  NR2D0 U89 ( .A1(n609), .A2(n65), .ZN(mantissa_ab[16]) );
  NR2D0 U90 ( .A1(n610), .A2(n65), .ZN(mantissa_ab[15]) );
  NR2D0 U91 ( .A1(n611), .A2(n65), .ZN(mantissa_ab[14]) );
  NR2D0 U92 ( .A1(n612), .A2(n65), .ZN(mantissa_ab[13]) );
  NR2D0 U93 ( .A1(n613), .A2(n65), .ZN(mantissa_ab[12]) );
  NR2D0 U94 ( .A1(n614), .A2(n65), .ZN(mantissa_ab[11]) );
  NR2D0 U95 ( .A1(n615), .A2(n65), .ZN(mantissa_ab[10]) );
  OAI222D0 U96 ( .A1(n102), .A2(n67), .B1(n65), .B2(n103), .C1(n104), .C2(n69), 
        .ZN(mantissa_ab[0]) );
  IND2D0 U97 ( .A1(fma_byp), .B1(a_equals_one), .ZN(n69) );
  CKXOR2D0 U98 ( .A1(n105), .A2(n99), .Z(n103) );
  CKND0 U99 ( .I(n74), .ZN(n65) );
  CKND0 U100 ( .I(n75), .ZN(n67) );
  NR3D0 U101 ( .A1(a_equals_one), .A2(fma_byp), .A3(n74), .ZN(n75) );
  NR3D0 U102 ( .A1(fma_byp), .A2(b_equals_one), .A3(a_equals_one), .ZN(n74) );
  CKND0 U103 ( .I(n106), .ZN(N93) );
  CKND0 U104 ( .I(n107), .ZN(N66) );
  INR2D0 U105 ( .A1(n80), .B1(n81), .ZN(N373) );
  CKND2D0 U106 ( .A1(n86), .A2(n85), .ZN(n81) );
  XNR2D0 U107 ( .A1(n108), .A2(n109), .ZN(n85) );
  CKND2D0 U108 ( .A1(n110), .A2(n111), .ZN(n109) );
  INR2D0 U109 ( .A1(n90), .B1(n91), .ZN(n86) );
  CKND2D0 U110 ( .A1(n95), .A2(n96), .ZN(n91) );
  CKXOR2D0 U111 ( .A1(n112), .A2(n89), .Z(n96) );
  CKXOR2D0 U112 ( .A1(n113), .A2(n114), .Z(n95) );
  CKXOR2D0 U113 ( .A1(n110), .A2(n111), .Z(n90) );
  XNR2D0 U114 ( .A1(n115), .A2(n116), .ZN(n80) );
  MOAI22D0 U115 ( .A1(n117), .A2(n118), .B1(n53), .B2(n51), .ZN(N369) );
  CKXOR2D0 U116 ( .A1(n51), .A2(n53), .Z(N368) );
  CKXOR2D0 U117 ( .A1(n119), .A2(n120), .Z(n53) );
  CKXOR2D0 U118 ( .A1(n117), .A2(n118), .Z(n51) );
  OA21D0 U119 ( .A1(n121), .A2(n122), .B(n123), .Z(n118) );
  AN2D0 U120 ( .A1(n124), .A2(n125), .Z(n117) );
  MOAI22D0 U121 ( .A1(n50), .A2(n49), .B1(n48), .B2(n47), .ZN(N365) );
  CKND0 U122 ( .I(n55), .ZN(N364) );
  XNR2D0 U123 ( .A1(n50), .A2(n49), .ZN(n55) );
  OAI21D0 U124 ( .A1(n142), .A2(n126), .B(n124), .ZN(n49) );
  CKND2D0 U125 ( .A1(n142), .A2(n126), .ZN(n124) );
  OA21D0 U126 ( .A1(n127), .A2(N251), .B(n125), .Z(n126) );
  CKND2D0 U127 ( .A1(n127), .A2(N251), .ZN(n125) );
  OA21D0 U128 ( .A1(n128), .A2(n129), .B(n123), .Z(n127) );
  CKND2D0 U129 ( .A1(n128), .A2(n129), .ZN(n123) );
  IAO21D0 U130 ( .A1(n130), .A2(n131), .B(n73), .ZN(n129) );
  CKXOR2D0 U131 ( .A1(n121), .A2(n122), .Z(n128) );
  CKND2D0 U132 ( .A1(mantissa_b[9]), .A2(mantissa_a[7]), .ZN(n122) );
  CKXOR2D0 U133 ( .A1(n132), .A2(n133), .Z(n121) );
  CKND2D0 U134 ( .A1(n134), .A2(n135), .ZN(n133) );
  XNR2D0 U135 ( .A1(n48), .A2(n47), .ZN(n50) );
  OAI21D0 U136 ( .A1(n136), .A2(n137), .B(n138), .ZN(n47) );
  CKND2D0 U137 ( .A1(n139), .A2(n140), .ZN(n48) );
  AO22D0 U138 ( .A1(n59), .A2(n58), .B1(n61), .B2(n60), .Z(N361) );
  CKXOR2D0 U139 ( .A1(n59), .A2(n58), .Z(N360) );
  OA21D0 U140 ( .A1(n141), .A2(n142), .B(n139), .Z(n58) );
  CKND2D0 U141 ( .A1(n141), .A2(n142), .ZN(n139) );
  OA21D0 U142 ( .A1(n143), .A2(N251), .B(n140), .Z(n141) );
  CKND2D0 U143 ( .A1(n143), .A2(N251), .ZN(n140) );
  OA21D0 U144 ( .A1(n144), .A2(n145), .B(n138), .Z(n143) );
  CKND2D0 U145 ( .A1(n144), .A2(n145), .ZN(n138) );
  CKXOR2D0 U146 ( .A1(n131), .A2(n130), .Z(n145) );
  CKXOR2D0 U147 ( .A1(n136), .A2(n137), .Z(n144) );
  CKND2D0 U148 ( .A1(mantissa_b[9]), .A2(mantissa_a[6]), .ZN(n137) );
  XNR2D0 U149 ( .A1(n134), .A2(n135), .ZN(n136) );
  CKXOR2D0 U150 ( .A1(n61), .A2(n60), .Z(n59) );
  OAI21D0 U151 ( .A1(n146), .A2(n147), .B(n148), .ZN(n60) );
  CKND2D0 U152 ( .A1(n149), .A2(n150), .ZN(n61) );
  OAI22D0 U153 ( .A1(n151), .A2(n152), .B1(n153), .B2(n154), .ZN(N357) );
  CKXOR2D0 U154 ( .A1(n153), .A2(n154), .Z(N356) );
  OAI21D0 U155 ( .A1(n155), .A2(n142), .B(n149), .ZN(n154) );
  CKND2D0 U156 ( .A1(n155), .A2(n142), .ZN(n149) );
  OA21D0 U157 ( .A1(N37), .A2(n156), .B(n157), .Z(n142) );
  OA21D0 U158 ( .A1(n158), .A2(n159), .B(n150), .Z(n155) );
  CKND2D0 U159 ( .A1(n158), .A2(n159), .ZN(n150) );
  OAI21D0 U160 ( .A1(n107), .A2(n160), .B(n161), .ZN(n159) );
  OA21D0 U161 ( .A1(n162), .A2(n163), .B(n148), .Z(n158) );
  CKND2D0 U162 ( .A1(n162), .A2(n163), .ZN(n148) );
  XNR2D0 U163 ( .A1(n164), .A2(n165), .ZN(n163) );
  CKND2D0 U164 ( .A1(n166), .A2(n167), .ZN(n165) );
  CKXOR2D0 U165 ( .A1(n146), .A2(n147), .Z(n162) );
  CKND2D0 U166 ( .A1(mantissa_b[9]), .A2(mantissa_a[5]), .ZN(n147) );
  XNR2D0 U167 ( .A1(n168), .A2(n169), .ZN(n146) );
  AN2D0 U168 ( .A1(n170), .A2(n171), .Z(n168) );
  XNR2D0 U169 ( .A1(n151), .A2(n152), .ZN(n153) );
  OA21D0 U170 ( .A1(n172), .A2(n173), .B(n174), .Z(n152) );
  AN2D0 U171 ( .A1(n175), .A2(n176), .Z(n151) );
  OAI22D0 U172 ( .A1(n177), .A2(n178), .B1(n179), .B2(n180), .ZN(N353) );
  CKXOR2D0 U173 ( .A1(n179), .A2(n180), .Z(N352) );
  OAI21D0 U174 ( .A1(n181), .A2(n182), .B(n175), .ZN(n180) );
  CKND2D0 U175 ( .A1(n181), .A2(n182), .ZN(n175) );
  OA21D0 U176 ( .A1(N37), .A2(n183), .B(n161), .Z(n182) );
  CKND2D0 U177 ( .A1(n183), .A2(N37), .ZN(n161) );
  CKXOR2D0 U178 ( .A1(n107), .A2(n160), .Z(n183) );
  XNR2D0 U179 ( .A1(n184), .A2(n185), .ZN(n160) );
  OA21D0 U180 ( .A1(n186), .A2(n187), .B(n176), .Z(n181) );
  CKND2D0 U181 ( .A1(n186), .A2(n187), .ZN(n176) );
  OAI21D0 U182 ( .A1(n107), .A2(n188), .B(n189), .ZN(n187) );
  OA21D0 U183 ( .A1(n190), .A2(n191), .B(n174), .Z(n186) );
  CKND2D0 U184 ( .A1(n190), .A2(n191), .ZN(n174) );
  CKXOR2D0 U185 ( .A1(n166), .A2(n167), .Z(n191) );
  CKXOR2D0 U186 ( .A1(n172), .A2(n173), .Z(n190) );
  CKND2D0 U187 ( .A1(mantissa_b[9]), .A2(mantissa_a[4]), .ZN(n173) );
  CKXOR2D0 U188 ( .A1(n192), .A2(n170), .Z(n172) );
  XNR2D0 U189 ( .A1(n177), .A2(n178), .ZN(n179) );
  OA21D0 U190 ( .A1(n193), .A2(n194), .B(n195), .Z(n178) );
  AN2D0 U191 ( .A1(n196), .A2(n197), .Z(n177) );
  OAI22D0 U192 ( .A1(n198), .A2(n199), .B1(n200), .B2(n201), .ZN(N349) );
  CKXOR2D0 U193 ( .A1(n200), .A2(n201), .Z(N348) );
  OAI21D0 U194 ( .A1(n202), .A2(n203), .B(n196), .ZN(n201) );
  CKND2D0 U195 ( .A1(n202), .A2(n203), .ZN(n196) );
  OA21D0 U196 ( .A1(N37), .A2(n204), .B(n189), .Z(n203) );
  CKND2D0 U197 ( .A1(n204), .A2(N37), .ZN(n189) );
  CKXOR2D0 U198 ( .A1(n107), .A2(n188), .Z(n204) );
  CKXOR2D0 U199 ( .A1(n205), .A2(n206), .Z(n188) );
  CKND2D0 U200 ( .A1(n207), .A2(n208), .ZN(n206) );
  OA21D0 U201 ( .A1(n209), .A2(n210), .B(n197), .Z(n202) );
  CKND2D0 U202 ( .A1(n209), .A2(n210), .ZN(n197) );
  OAI21D0 U203 ( .A1(n211), .A2(n212), .B(n213), .ZN(n210) );
  OA21D0 U204 ( .A1(n214), .A2(n215), .B(n195), .Z(n209) );
  CKND2D0 U205 ( .A1(n214), .A2(n215), .ZN(n195) );
  CKXOR2D0 U206 ( .A1(n216), .A2(n217), .Z(n215) );
  NR2D0 U207 ( .A1(n218), .A2(n219), .ZN(n216) );
  CKXOR2D0 U208 ( .A1(n193), .A2(n194), .Z(n214) );
  CKND2D0 U209 ( .A1(mantissa_b[9]), .A2(mantissa_a[3]), .ZN(n194) );
  XNR2D0 U210 ( .A1(n220), .A2(n221), .ZN(n193) );
  CKND2D0 U211 ( .A1(n222), .A2(n223), .ZN(n221) );
  XNR2D0 U212 ( .A1(n198), .A2(n199), .ZN(n200) );
  OA21D0 U213 ( .A1(n224), .A2(n225), .B(n226), .Z(n199) );
  AN2D0 U214 ( .A1(n227), .A2(n228), .Z(n198) );
  OAI22D0 U215 ( .A1(n229), .A2(n230), .B1(n231), .B2(n232), .ZN(N345) );
  CKND0 U216 ( .I(n23), .ZN(N344) );
  XNR2D0 U217 ( .A1(n231), .A2(n232), .ZN(n23) );
  OAI21D0 U218 ( .A1(n233), .A2(n234), .B(n227), .ZN(n232) );
  CKND2D0 U219 ( .A1(n233), .A2(n234), .ZN(n227) );
  OA21D0 U220 ( .A1(N37), .A2(n235), .B(n213), .Z(n234) );
  CKND2D0 U221 ( .A1(n235), .A2(N37), .ZN(n213) );
  CKXOR2D0 U222 ( .A1(n211), .A2(n212), .Z(n235) );
  XNR2D0 U223 ( .A1(n207), .A2(n208), .ZN(n212) );
  XNR2D0 U224 ( .A1(n236), .A2(n237), .ZN(n211) );
  OA21D0 U225 ( .A1(n238), .A2(n239), .B(n228), .Z(n233) );
  CKND2D0 U226 ( .A1(n238), .A2(n239), .ZN(n228) );
  OAI21D0 U227 ( .A1(n240), .A2(n241), .B(n242), .ZN(n239) );
  OA21D0 U228 ( .A1(n243), .A2(n244), .B(n226), .Z(n238) );
  CKND2D0 U229 ( .A1(n243), .A2(n244), .ZN(n226) );
  CKXOR2D0 U230 ( .A1(n219), .A2(n218), .Z(n244) );
  CKXOR2D0 U231 ( .A1(n224), .A2(n225), .Z(n243) );
  CKND2D0 U232 ( .A1(mantissa_b[9]), .A2(mantissa_a[2]), .ZN(n225) );
  XNR2D0 U233 ( .A1(n222), .A2(n223), .ZN(n224) );
  XNR2D0 U234 ( .A1(n229), .A2(n230), .ZN(n231) );
  OA21D0 U235 ( .A1(n245), .A2(n246), .B(n247), .Z(n230) );
  AN2D0 U236 ( .A1(n248), .A2(n249), .Z(n229) );
  OAI22D0 U237 ( .A1(n250), .A2(n251), .B1(n252), .B2(n253), .ZN(N341) );
  CKXOR2D0 U238 ( .A1(n252), .A2(n253), .Z(N340) );
  OAI21D0 U239 ( .A1(n254), .A2(n255), .B(n248), .ZN(n253) );
  CKND2D0 U240 ( .A1(n254), .A2(n255), .ZN(n248) );
  OA21D0 U241 ( .A1(N37), .A2(n256), .B(n242), .Z(n255) );
  CKND2D0 U242 ( .A1(N37), .A2(n256), .ZN(n242) );
  CKXOR2D0 U243 ( .A1(n241), .A2(n240), .Z(n256) );
  XNR2D0 U244 ( .A1(n257), .A2(n258), .ZN(n240) );
  NR2D0 U245 ( .A1(n259), .A2(n260), .ZN(n257) );
  XNR2D0 U246 ( .A1(n261), .A2(n262), .ZN(n241) );
  CKND2D0 U247 ( .A1(n263), .A2(n264), .ZN(n262) );
  OA21D0 U248 ( .A1(n265), .A2(n266), .B(n249), .Z(n254) );
  CKND2D0 U249 ( .A1(n265), .A2(n266), .ZN(n249) );
  OAI21D0 U250 ( .A1(n267), .A2(n268), .B(n269), .ZN(n266) );
  OA21D0 U251 ( .A1(n270), .A2(n271), .B(n247), .Z(n265) );
  CKND2D0 U252 ( .A1(n270), .A2(n271), .ZN(n247) );
  XNR2D0 U253 ( .A1(n272), .A2(n273), .ZN(n271) );
  CKND2D0 U254 ( .A1(n274), .A2(n275), .ZN(n273) );
  CKXOR2D0 U255 ( .A1(n245), .A2(n246), .Z(n270) );
  CKND2D0 U256 ( .A1(mantissa_b[9]), .A2(mantissa_a[1]), .ZN(n246) );
  XNR2D0 U257 ( .A1(n276), .A2(n277), .ZN(n245) );
  AN2D0 U258 ( .A1(n278), .A2(n279), .Z(n276) );
  XNR2D0 U259 ( .A1(n250), .A2(n251), .ZN(n252) );
  OA21D0 U260 ( .A1(n280), .A2(n281), .B(n282), .Z(n251) );
  AN2D0 U261 ( .A1(n283), .A2(n284), .Z(n250) );
  OAI21D0 U262 ( .A1(n285), .A2(n286), .B(n287), .ZN(N337) );
  CKXOR2D0 U263 ( .A1(n286), .A2(n285), .Z(N336) );
  OAI21D0 U264 ( .A1(n288), .A2(n289), .B(n283), .ZN(n285) );
  CKND2D0 U265 ( .A1(n288), .A2(n289), .ZN(n283) );
  OA21D0 U266 ( .A1(n290), .A2(n291), .B(n269), .Z(n289) );
  CKND2D0 U267 ( .A1(n290), .A2(n291), .ZN(n269) );
  CKXOR2D0 U268 ( .A1(n268), .A2(n267), .Z(n291) );
  XNR2D0 U269 ( .A1(n260), .A2(n259), .ZN(n267) );
  XNR2D0 U270 ( .A1(n263), .A2(n264), .ZN(n268) );
  CKXOR2D0 U271 ( .A1(n292), .A2(n293), .Z(n290) );
  OA21D0 U272 ( .A1(n294), .A2(n295), .B(n284), .Z(n288) );
  CKND2D0 U273 ( .A1(n294), .A2(n295), .ZN(n284) );
  OAI21D0 U274 ( .A1(n296), .A2(n297), .B(n298), .ZN(n295) );
  OA21D0 U275 ( .A1(n299), .A2(n300), .B(n282), .Z(n294) );
  CKND2D0 U276 ( .A1(n299), .A2(n300), .ZN(n282) );
  CKXOR2D0 U277 ( .A1(n280), .A2(n281), .Z(n300) );
  CKND2D0 U278 ( .A1(mantissa_b[9]), .A2(mantissa_a[0]), .ZN(n281) );
  CKXOR2D0 U279 ( .A1(n301), .A2(n278), .Z(n280) );
  CKXOR2D0 U280 ( .A1(n274), .A2(n275), .Z(n299) );
  OAI21D0 U281 ( .A1(n302), .A2(n303), .B(n287), .ZN(n286) );
  IND3D0 U282 ( .A1(n304), .B1(n305), .B2(n303), .ZN(n287) );
  CKND2D0 U283 ( .A1(n306), .A2(n307), .ZN(n303) );
  INR2D0 U284 ( .A1(n305), .B1(n304), .ZN(n302) );
  OAI21D0 U285 ( .A1(n308), .A2(n309), .B(n310), .ZN(N333) );
  CKND0 U286 ( .I(n38), .ZN(N332) );
  XNR2D0 U287 ( .A1(n309), .A2(n308), .ZN(n38) );
  OAI21D0 U288 ( .A1(n311), .A2(n312), .B(n306), .ZN(n308) );
  CKND2D0 U289 ( .A1(n311), .A2(n312), .ZN(n306) );
  OA21D0 U290 ( .A1(n313), .A2(n314), .B(n298), .Z(n312) );
  CKND2D0 U291 ( .A1(n313), .A2(n314), .ZN(n298) );
  CKXOR2D0 U292 ( .A1(n297), .A2(n296), .Z(n314) );
  CKXOR2D0 U293 ( .A1(n315), .A2(n316), .Z(n296) );
  CKND2D0 U294 ( .A1(n317), .A2(n318), .ZN(n316) );
  XNR2D0 U295 ( .A1(n319), .A2(n320), .ZN(n297) );
  AN2D0 U296 ( .A1(n321), .A2(n322), .Z(n319) );
  XNR2D0 U297 ( .A1(n323), .A2(n324), .ZN(n313) );
  CKND2D0 U298 ( .A1(n325), .A2(n326), .ZN(n324) );
  OA21D0 U299 ( .A1(n327), .A2(n328), .B(n307), .Z(n311) );
  CKND2D0 U300 ( .A1(n327), .A2(n328), .ZN(n307) );
  OAI21D0 U301 ( .A1(n329), .A2(n330), .B(n331), .ZN(n328) );
  XNR2D0 U302 ( .A1(n304), .A2(n305), .ZN(n327) );
  CKXOR2D0 U303 ( .A1(n332), .A2(n333), .Z(n305) );
  INR2D0 U304 ( .A1(n334), .B1(n68), .ZN(n332) );
  XNR2D0 U305 ( .A1(n335), .A2(n336), .ZN(n304) );
  NR2D0 U306 ( .A1(n337), .A2(n338), .ZN(n335) );
  OAI21D0 U307 ( .A1(n339), .A2(n340), .B(n310), .ZN(n309) );
  IND3D0 U308 ( .A1(n341), .B1(n340), .B2(n342), .ZN(n310) );
  OAI21D0 U309 ( .A1(n343), .A2(n344), .B(n345), .ZN(n340) );
  INR2D0 U310 ( .A1(n342), .B1(n341), .ZN(n339) );
  CKND0 U311 ( .I(n42), .ZN(N329) );
  CKND2D0 U312 ( .A1(n346), .A2(n347), .ZN(n42) );
  CKXOR2D0 U313 ( .A1(n346), .A2(n347), .Z(N328) );
  OAI22D0 U314 ( .A1(n348), .A2(n349), .B1(n350), .B2(n351), .ZN(n347) );
  CKXOR2D0 U315 ( .A1(n344), .A2(n343), .Z(n346) );
  OAI21D0 U316 ( .A1(n352), .A2(n353), .B(n331), .ZN(n343) );
  CKND2D0 U317 ( .A1(n352), .A2(n353), .ZN(n331) );
  CKXOR2D0 U318 ( .A1(n330), .A2(n329), .Z(n353) );
  XNR2D0 U319 ( .A1(n317), .A2(n318), .ZN(n329) );
  CKXOR2D0 U320 ( .A1(n354), .A2(n321), .Z(n330) );
  CKXOR2D0 U321 ( .A1(n325), .A2(n326), .Z(n352) );
  OAI21D0 U322 ( .A1(n355), .A2(n356), .B(n345), .ZN(n344) );
  CKND2D0 U323 ( .A1(n355), .A2(n356), .ZN(n345) );
  OAI21D0 U324 ( .A1(n357), .A2(n358), .B(n359), .ZN(n356) );
  XNR2D0 U325 ( .A1(n342), .A2(n341), .ZN(n355) );
  CKXOR2D0 U326 ( .A1(n334), .A2(n68), .Z(n341) );
  CKXOR2D0 U327 ( .A1(n338), .A2(n337), .Z(n342) );
  CKND0 U328 ( .I(n41), .ZN(N327) );
  CKND2D0 U329 ( .A1(n360), .A2(n361), .ZN(n41) );
  CKXOR2D0 U330 ( .A1(n360), .A2(n361), .Z(N326) );
  OAI22D0 U331 ( .A1(n362), .A2(n363), .B1(n364), .B2(n365), .ZN(n361) );
  CKXOR2D0 U332 ( .A1(n350), .A2(n351), .Z(n360) );
  OAI21D0 U333 ( .A1(n366), .A2(n367), .B(n359), .ZN(n351) );
  CKND2D0 U334 ( .A1(n366), .A2(n367), .ZN(n359) );
  CKXOR2D0 U335 ( .A1(n358), .A2(n357), .Z(n367) );
  XNR2D0 U336 ( .A1(n368), .A2(n369), .ZN(n357) );
  NR2D0 U337 ( .A1(n370), .A2(n371), .ZN(n368) );
  XNR2D0 U338 ( .A1(n372), .A2(n373), .ZN(n358) );
  CKND2D0 U339 ( .A1(n374), .A2(n375), .ZN(n373) );
  CKXOR2D0 U340 ( .A1(n376), .A2(n377), .Z(n366) );
  NR2D0 U341 ( .A1(n378), .A2(n379), .ZN(n376) );
  XNR2D0 U342 ( .A1(n348), .A2(n349), .ZN(n350) );
  XNR2D0 U343 ( .A1(n380), .A2(n381), .ZN(n349) );
  INR2D0 U344 ( .A1(n382), .B1(n73), .ZN(n380) );
  OA21D0 U345 ( .A1(n383), .A2(n384), .B(n385), .Z(n348) );
  INR3D0 U346 ( .A1(n386), .B1(n387), .B2(n388), .ZN(N325) );
  CKXOR2D0 U347 ( .A1(n388), .A2(n389), .Z(N324) );
  IND2D0 U348 ( .A1(n387), .B1(n386), .ZN(n389) );
  XNR2D0 U349 ( .A1(n364), .A2(n365), .ZN(n388) );
  OAI21D0 U350 ( .A1(n390), .A2(n391), .B(n385), .ZN(n365) );
  CKND2D0 U351 ( .A1(n390), .A2(n391), .ZN(n385) );
  CKXOR2D0 U352 ( .A1(n384), .A2(n383), .Z(n391) );
  XNR2D0 U353 ( .A1(n371), .A2(n370), .ZN(n383) );
  XNR2D0 U354 ( .A1(n374), .A2(n375), .ZN(n384) );
  CKXOR2D0 U355 ( .A1(n379), .A2(n378), .Z(n390) );
  XNR2D0 U356 ( .A1(n362), .A2(n363), .ZN(n364) );
  CKXOR2D0 U357 ( .A1(n382), .A2(n73), .Z(n363) );
  MAOI22D0 U358 ( .A1(n392), .A2(n393), .B1(n394), .B2(n395), .ZN(n362) );
  INR2D0 U359 ( .A1(n115), .B1(n116), .ZN(N323) );
  ND3D0 U360 ( .A1(n111), .A2(n108), .A3(n110), .ZN(n116) );
  CKXOR2D0 U361 ( .A1(n396), .A2(n397), .Z(n110) );
  NR2D0 U362 ( .A1(n114), .A2(n113), .ZN(n396) );
  CKXOR2D0 U363 ( .A1(n398), .A2(n399), .Z(n108) );
  CKXOR2D0 U364 ( .A1(n400), .A2(n401), .Z(n111) );
  NR2D0 U365 ( .A1(n112), .A2(n89), .ZN(n400) );
  XNR2D0 U366 ( .A1(n387), .A2(n386), .ZN(n115) );
  OAI22D0 U367 ( .A1(n402), .A2(n403), .B1(n399), .B2(n398), .ZN(n386) );
  XNR2D0 U368 ( .A1(n403), .A2(n402), .ZN(n398) );
  XNR2D0 U369 ( .A1(n404), .A2(n405), .ZN(n399) );
  XNR2D0 U370 ( .A1(n406), .A2(n407), .ZN(n403) );
  CKXOR2D0 U371 ( .A1(n408), .A2(n79), .Z(n402) );
  XNR2D0 U372 ( .A1(n392), .A2(n393), .ZN(n387) );
  CKXOR2D0 U373 ( .A1(n409), .A2(n410), .Z(n393) );
  CKND2D0 U374 ( .A1(n404), .A2(n405), .ZN(n410) );
  CKXOR2D0 U375 ( .A1(n395), .A2(n394), .Z(n392) );
  XNR2D0 U376 ( .A1(n411), .A2(n412), .ZN(n394) );
  INR2D0 U377 ( .A1(n408), .B1(n79), .ZN(n411) );
  XNR2D0 U378 ( .A1(n413), .A2(n414), .ZN(n395) );
  NR2D0 U379 ( .A1(n407), .A2(n406), .ZN(n413) );
  OAI22D0 U380 ( .A1(n415), .A2(n416), .B1(n119), .B2(n120), .ZN(N317) );
  OAI21D0 U381 ( .A1(N37), .A2(n156), .B(n157), .ZN(n120) );
  CKXOR2D0 U382 ( .A1(N251), .A2(n416), .Z(n119) );
  CKXOR2D0 U383 ( .A1(n417), .A2(N118), .Z(n416) );
  CKND0 U384 ( .I(N251), .ZN(n415) );
  OAI21D0 U385 ( .A1(n418), .A2(n417), .B(n419), .ZN(N255) );
  OAI21D0 U386 ( .A1(n420), .A2(n421), .B(n419), .ZN(n417) );
  ND3D0 U387 ( .A1(mantissa_a[8]), .A2(n421), .A3(mantissa_b[9]), .ZN(n419) );
  CKXOR2D0 U388 ( .A1(n422), .A2(n423), .Z(n421) );
  NR2D0 U389 ( .A1(n70), .A2(n68), .ZN(n420) );
  CKND0 U390 ( .I(mantissa_a[8]), .ZN(n70) );
  OAI21D0 U391 ( .A1(n107), .A2(n106), .B(n157), .ZN(N251) );
  CKND2D0 U392 ( .A1(n156), .A2(N37), .ZN(n157) );
  IAO21D0 U393 ( .A1(n293), .A2(n292), .B(n99), .ZN(N37) );
  ND3D0 U394 ( .A1(n326), .A2(n325), .A3(n323), .ZN(n292) );
  XNR2D0 U395 ( .A1(n424), .A2(mantissa_b[1]), .ZN(n323) );
  AOI22D0 U396 ( .A1(mantissa_a[8]), .A2(n425), .B1(mantissa_a[9]), .B2(
        mantissa_b[0]), .ZN(n424) );
  INR3D0 U397 ( .A1(n377), .B1(n378), .B2(n379), .ZN(n325) );
  IND3D0 U398 ( .A1(n409), .B1(n405), .B2(n404), .ZN(n379) );
  INR3D0 U399 ( .A1(n397), .B1(n114), .B2(n113), .ZN(n404) );
  IND2D0 U400 ( .A1(n101), .B1(n100), .ZN(n113) );
  INR2D0 U401 ( .A1(n105), .B1(n99), .ZN(n100) );
  IND2D0 U402 ( .A1(n425), .B1(n426), .ZN(n105) );
  MUX2ND0 U403 ( .I0(n427), .I1(n102), .S(mantissa_b[1]), .ZN(n426) );
  NR2D0 U404 ( .A1(n102), .A2(n104), .ZN(n427) );
  CKND0 U405 ( .I(mantissa_b[0]), .ZN(n104) );
  CKND0 U406 ( .I(mantissa_a[0]), .ZN(n102) );
  XNR2D0 U407 ( .A1(n428), .A2(n99), .ZN(n101) );
  AOI22D0 U408 ( .A1(n425), .A2(mantissa_a[0]), .B1(mantissa_b[0]), .B2(
        mantissa_a[1]), .ZN(n428) );
  CKXOR2D0 U409 ( .A1(n429), .A2(mantissa_b[1]), .Z(n114) );
  AOI22D0 U410 ( .A1(n425), .A2(mantissa_a[1]), .B1(mantissa_b[0]), .B2(
        mantissa_a[2]), .ZN(n429) );
  CKXOR2D0 U411 ( .A1(n430), .A2(n99), .Z(n397) );
  AOI22D0 U412 ( .A1(n425), .A2(mantissa_a[2]), .B1(mantissa_b[0]), .B2(
        mantissa_a[3]), .ZN(n430) );
  CKXOR2D0 U413 ( .A1(n431), .A2(n99), .Z(n405) );
  AOI22D0 U414 ( .A1(n425), .A2(mantissa_a[3]), .B1(mantissa_b[0]), .B2(
        mantissa_a[4]), .ZN(n431) );
  XNR2D0 U415 ( .A1(n432), .A2(n99), .ZN(n409) );
  AOI22D0 U416 ( .A1(n425), .A2(mantissa_a[4]), .B1(mantissa_b[0]), .B2(
        mantissa_a[5]), .ZN(n432) );
  CKXOR2D0 U417 ( .A1(n433), .A2(mantissa_b[1]), .Z(n378) );
  AOI22D0 U418 ( .A1(n425), .A2(mantissa_a[5]), .B1(mantissa_b[0]), .B2(
        mantissa_a[6]), .ZN(n433) );
  CKXOR2D0 U455 ( .A1(n434), .A2(n99), .Z(n377) );
  AOI22D0 U456 ( .A1(n425), .A2(mantissa_a[6]), .B1(mantissa_a[7]), .B2(
        mantissa_b[0]), .ZN(n434) );
  CKXOR2D0 U457 ( .A1(n435), .A2(n99), .Z(n326) );
  AOI22D0 U458 ( .A1(mantissa_a[7]), .A2(n425), .B1(mantissa_a[8]), .B2(
        mantissa_b[0]), .ZN(n435) );
  NR2D0 U459 ( .A1(n99), .A2(mantissa_b[0]), .ZN(n425) );
  OAI21D0 U460 ( .A1(mantissa_b[0]), .A2(n66), .B(mantissa_b[1]), .ZN(n293) );
  CKXOR2D0 U461 ( .A1(n107), .A2(n106), .Z(n156) );
  OAI21D0 U462 ( .A1(n185), .A2(n184), .B(mantissa_b[5]), .ZN(n106) );
  ND3D0 U463 ( .A1(n208), .A2(n207), .A3(n205), .ZN(n184) );
  XNR2D0 U464 ( .A1(n436), .A2(mantissa_b[5]), .ZN(n205) );
  AOI22D0 U465 ( .A1(mantissa_a[9]), .A2(n437), .B1(mantissa_a[8]), .B2(n438), 
        .ZN(n436) );
  INR3D0 U466 ( .A1(n258), .B1(n259), .B2(n260), .ZN(n207) );
  ND3D0 U467 ( .A1(n318), .A2(n317), .A3(n315), .ZN(n260) );
  XNR2D0 U468 ( .A1(n439), .A2(mantissa_b[5]), .ZN(n315) );
  AOI22D0 U469 ( .A1(mantissa_a[5]), .A2(n437), .B1(n438), .B2(mantissa_a[4]), 
        .ZN(n439) );
  INR3D0 U470 ( .A1(n369), .B1(n370), .B2(n371), .ZN(n317) );
  ND3D0 U471 ( .A1(mantissa_b[5]), .A2(n408), .A3(n412), .ZN(n371) );
  CKXOR2D0 U472 ( .A1(n440), .A2(n79), .Z(n412) );
  AOI22D0 U473 ( .A1(mantissa_a[1]), .A2(n437), .B1(n438), .B2(mantissa_a[0]), 
        .ZN(n440) );
  XNR2D0 U474 ( .A1(mantissa_b[5]), .A2(n441), .ZN(n408) );
  CKND2D0 U475 ( .A1(mantissa_a[0]), .A2(n437), .ZN(n441) );
  XNR2D0 U476 ( .A1(n442), .A2(n79), .ZN(n370) );
  AOI22D0 U477 ( .A1(mantissa_a[2]), .A2(n437), .B1(n438), .B2(mantissa_a[1]), 
        .ZN(n442) );
  CKXOR2D0 U478 ( .A1(n443), .A2(n79), .Z(n369) );
  AOI22D0 U479 ( .A1(mantissa_a[3]), .A2(n437), .B1(n438), .B2(mantissa_a[2]), 
        .ZN(n443) );
  CKXOR2D0 U480 ( .A1(n444), .A2(n79), .Z(n318) );
  AOI22D0 U481 ( .A1(mantissa_a[4]), .A2(n437), .B1(n438), .B2(mantissa_a[3]), 
        .ZN(n444) );
  XNR2D0 U482 ( .A1(n445), .A2(n79), .ZN(n259) );
  AOI22D0 U483 ( .A1(mantissa_a[6]), .A2(n437), .B1(n438), .B2(mantissa_a[5]), 
        .ZN(n445) );
  CKXOR2D0 U484 ( .A1(n446), .A2(n79), .Z(n258) );
  AOI22D0 U485 ( .A1(mantissa_a[7]), .A2(n437), .B1(n438), .B2(mantissa_a[6]), 
        .ZN(n446) );
  CKXOR2D0 U486 ( .A1(n447), .A2(n79), .Z(n208) );
  AOI22D0 U487 ( .A1(mantissa_a[8]), .A2(n437), .B1(mantissa_a[7]), .B2(n438), 
        .ZN(n447) );
  CKXOR2D0 U488 ( .A1(n89), .A2(n84), .Z(n437) );
  CKND0 U489 ( .I(mantissa_b[4]), .ZN(n84) );
  CKXOR2D0 U490 ( .A1(mantissa_b[5]), .A2(n448), .Z(n185) );
  CKND2D0 U491 ( .A1(mantissa_a[9]), .A2(n438), .ZN(n448) );
  OA21D0 U492 ( .A1(mantissa_b[4]), .A2(n89), .B(n449), .Z(n438) );
  MUX2ND0 U493 ( .I0(n89), .I1(mantissa_b[4]), .S(mantissa_b[5]), .ZN(n449) );
  OAI21D0 U494 ( .A1(n237), .A2(n236), .B(mantissa_b[3]), .ZN(n107) );
  IND3D0 U495 ( .A1(n261), .B1(n264), .B2(n263), .ZN(n236) );
  AN3D0 U496 ( .A1(n322), .A2(n321), .A3(n320), .Z(n263) );
  CKXOR2D0 U497 ( .A1(n450), .A2(n89), .Z(n320) );
  AOI22D0 U498 ( .A1(mantissa_a[7]), .A2(n451), .B1(mantissa_a[6]), .B2(n452), 
        .ZN(n450) );
  CKXOR2D0 U499 ( .A1(n453), .A2(n89), .Z(n321) );
  AOI22D0 U500 ( .A1(mantissa_a[6]), .A2(n451), .B1(mantissa_a[5]), .B2(n452), 
        .ZN(n453) );
  CKND0 U501 ( .I(n354), .ZN(n322) );
  IND3D0 U502 ( .A1(n372), .B1(n375), .B2(n374), .ZN(n354) );
  INR3D0 U503 ( .A1(n414), .B1(n407), .B2(n406), .ZN(n374) );
  IND3D0 U504 ( .A1(n112), .B1(n401), .B2(mantissa_b[3]), .ZN(n406) );
  CKXOR2D0 U505 ( .A1(n454), .A2(n89), .Z(n401) );
  AOI22D0 U506 ( .A1(mantissa_a[1]), .A2(n451), .B1(n452), .B2(mantissa_a[0]), 
        .ZN(n454) );
  CKXOR2D0 U507 ( .A1(mantissa_b[3]), .A2(n455), .Z(n112) );
  CKND2D0 U508 ( .A1(mantissa_a[0]), .A2(n451), .ZN(n455) );
  XNR2D0 U509 ( .A1(n456), .A2(n89), .ZN(n407) );
  AOI22D0 U510 ( .A1(mantissa_a[2]), .A2(n451), .B1(n452), .B2(mantissa_a[1]), 
        .ZN(n456) );
  CKXOR2D0 U511 ( .A1(n457), .A2(n89), .Z(n414) );
  AOI22D0 U512 ( .A1(mantissa_a[3]), .A2(n451), .B1(mantissa_a[2]), .B2(n452), 
        .ZN(n457) );
  CKXOR2D0 U513 ( .A1(n458), .A2(n89), .Z(n375) );
  AOI22D0 U514 ( .A1(mantissa_a[4]), .A2(n451), .B1(mantissa_a[3]), .B2(n452), 
        .ZN(n458) );
  XNR2D0 U515 ( .A1(n459), .A2(n89), .ZN(n372) );
  AOI22D0 U516 ( .A1(mantissa_a[5]), .A2(n451), .B1(mantissa_a[4]), .B2(n452), 
        .ZN(n459) );
  CKXOR2D0 U517 ( .A1(n460), .A2(n89), .Z(n264) );
  AOI22D0 U518 ( .A1(mantissa_a[8]), .A2(n451), .B1(mantissa_a[7]), .B2(n452), 
        .ZN(n460) );
  XNR2D0 U519 ( .A1(n461), .A2(n89), .ZN(n261) );
  CKND0 U520 ( .I(mantissa_b[3]), .ZN(n89) );
  AOI22D0 U521 ( .A1(mantissa_a[9]), .A2(n451), .B1(mantissa_a[8]), .B2(n452), 
        .ZN(n461) );
  CKXOR2D0 U522 ( .A1(n99), .A2(n94), .Z(n451) );
  CKND0 U523 ( .I(mantissa_b[2]), .ZN(n94) );
  CKXOR2D0 U524 ( .A1(mantissa_b[3]), .A2(n462), .Z(n237) );
  CKND2D0 U525 ( .A1(mantissa_a[9]), .A2(n452), .ZN(n462) );
  OA21D0 U526 ( .A1(mantissa_b[2]), .A2(n99), .B(n463), .Z(n452) );
  MUX2ND0 U527 ( .I0(n99), .I1(mantissa_b[2]), .S(mantissa_b[3]), .ZN(n463) );
  CKND0 U528 ( .I(mantissa_b[1]), .ZN(n99) );
  NR2D0 U529 ( .A1(n68), .A2(n66), .ZN(N142) );
  AOI21D0 U530 ( .A1(n422), .A2(n423), .B(n68), .ZN(N141) );
  XNR2D0 U531 ( .A1(n464), .A2(n68), .ZN(n423) );
  NR2D0 U532 ( .A1(n465), .A2(n66), .ZN(n464) );
  CKND0 U533 ( .I(mantissa_a[9]), .ZN(n66) );
  AN3D0 U534 ( .A1(n132), .A2(n135), .A3(n134), .Z(n422) );
  AN3D0 U535 ( .A1(n170), .A2(n171), .A3(n169), .Z(n134) );
  CKXOR2D0 U536 ( .A1(n466), .A2(n68), .Z(n169) );
  AOI22D0 U537 ( .A1(mantissa_a[6]), .A2(n467), .B1(mantissa_a[7]), .B2(n468), 
        .ZN(n466) );
  CKND0 U538 ( .I(n192), .ZN(n171) );
  IND3D0 U539 ( .A1(n220), .B1(n223), .B2(n222), .ZN(n192) );
  AN3D0 U540 ( .A1(n278), .A2(n279), .A3(n277), .Z(n222) );
  CKXOR2D0 U541 ( .A1(n469), .A2(n68), .Z(n277) );
  AOI22D0 U542 ( .A1(mantissa_a[2]), .A2(n467), .B1(mantissa_a[3]), .B2(n468), 
        .ZN(n469) );
  CKND0 U543 ( .I(n301), .ZN(n279) );
  ND3D0 U544 ( .A1(mantissa_b[9]), .A2(n334), .A3(n333), .ZN(n301) );
  CKXOR2D0 U545 ( .A1(n470), .A2(n68), .Z(n333) );
  AOI22D0 U546 ( .A1(mantissa_a[0]), .A2(n467), .B1(mantissa_a[1]), .B2(n468), 
        .ZN(n470) );
  XNR2D0 U547 ( .A1(mantissa_b[9]), .A2(n471), .ZN(n334) );
  CKND2D0 U548 ( .A1(mantissa_a[0]), .A2(n468), .ZN(n471) );
  CKXOR2D0 U549 ( .A1(n472), .A2(n68), .Z(n278) );
  AOI22D0 U550 ( .A1(mantissa_a[1]), .A2(n467), .B1(mantissa_a[2]), .B2(n468), 
        .ZN(n472) );
  CKXOR2D0 U551 ( .A1(n473), .A2(n68), .Z(n223) );
  AOI22D0 U552 ( .A1(mantissa_a[3]), .A2(n467), .B1(mantissa_a[4]), .B2(n468), 
        .ZN(n473) );
  XNR2D0 U553 ( .A1(n474), .A2(n68), .ZN(n220) );
  AOI22D0 U554 ( .A1(mantissa_a[4]), .A2(n467), .B1(mantissa_a[5]), .B2(n468), 
        .ZN(n474) );
  CKXOR2D0 U555 ( .A1(n475), .A2(n68), .Z(n170) );
  AOI22D0 U556 ( .A1(mantissa_a[5]), .A2(n467), .B1(mantissa_a[6]), .B2(n468), 
        .ZN(n475) );
  CKXOR2D0 U557 ( .A1(n476), .A2(n68), .Z(n135) );
  CKND0 U558 ( .I(mantissa_b[9]), .ZN(n68) );
  AOI22D0 U559 ( .A1(mantissa_a[7]), .A2(n467), .B1(mantissa_a[8]), .B2(n468), 
        .ZN(n476) );
  XNR2D0 U560 ( .A1(n477), .A2(mantissa_b[9]), .ZN(n132) );
  AOI22D0 U561 ( .A1(mantissa_a[8]), .A2(n467), .B1(mantissa_a[9]), .B2(n468), 
        .ZN(n477) );
  CKXOR2D0 U562 ( .A1(n73), .A2(n71), .Z(n468) );
  CKND0 U563 ( .I(n465), .ZN(n467) );
  MUX2ND0 U564 ( .I0(n478), .I1(n479), .S(mantissa_b[9]), .ZN(n465) );
  NR2D0 U565 ( .A1(mantissa_b[8]), .A2(mantissa_b[7]), .ZN(n479) );
  NR2D0 U566 ( .A1(n73), .A2(n71), .ZN(n478) );
  CKND0 U567 ( .I(mantissa_b[8]), .ZN(n71) );
  CKND0 U568 ( .I(n418), .ZN(N118) );
  OAI21D0 U569 ( .A1(n130), .A2(n131), .B(mantissa_b[7]), .ZN(n418) );
  ND3D0 U570 ( .A1(n167), .A2(n166), .A3(n164), .ZN(n131) );
  XNR2D0 U571 ( .A1(n480), .A2(mantissa_b[7]), .ZN(n164) );
  AOI22D0 U572 ( .A1(mantissa_a[9]), .A2(n481), .B1(n482), .B2(mantissa_a[8]), 
        .ZN(n480) );
  INR3D0 U573 ( .A1(n217), .B1(n218), .B2(n219), .ZN(n166) );
  ND3D0 U574 ( .A1(n275), .A2(n274), .A3(n272), .ZN(n219) );
  XNR2D0 U575 ( .A1(n483), .A2(mantissa_b[7]), .ZN(n272) );
  AOI22D0 U576 ( .A1(mantissa_a[5]), .A2(n481), .B1(n482), .B2(mantissa_a[4]), 
        .ZN(n483) );
  INR3D0 U577 ( .A1(n336), .B1(n337), .B2(n338), .ZN(n274) );
  ND3D0 U578 ( .A1(mantissa_b[7]), .A2(n382), .A3(n381), .ZN(n338) );
  CKXOR2D0 U579 ( .A1(n484), .A2(n73), .Z(n381) );
  AOI22D0 U580 ( .A1(mantissa_a[1]), .A2(n481), .B1(n482), .B2(mantissa_a[0]), 
        .ZN(n484) );
  XNR2D0 U581 ( .A1(mantissa_b[7]), .A2(n485), .ZN(n382) );
  CKND2D0 U582 ( .A1(mantissa_a[0]), .A2(n481), .ZN(n485) );
  XNR2D0 U583 ( .A1(n486), .A2(n73), .ZN(n337) );
  AOI22D0 U584 ( .A1(mantissa_a[2]), .A2(n481), .B1(n482), .B2(mantissa_a[1]), 
        .ZN(n486) );
  CKXOR2D0 U585 ( .A1(n487), .A2(n73), .Z(n336) );
  AOI22D0 U586 ( .A1(mantissa_a[3]), .A2(n481), .B1(n482), .B2(mantissa_a[2]), 
        .ZN(n487) );
  CKXOR2D0 U587 ( .A1(n488), .A2(n73), .Z(n275) );
  AOI22D0 U588 ( .A1(mantissa_a[4]), .A2(n481), .B1(n482), .B2(mantissa_a[3]), 
        .ZN(n488) );
  CKXOR2D0 U589 ( .A1(n489), .A2(mantissa_b[7]), .Z(n218) );
  AOI22D0 U590 ( .A1(mantissa_a[6]), .A2(n481), .B1(n482), .B2(mantissa_a[5]), 
        .ZN(n489) );
  CKXOR2D0 U591 ( .A1(n490), .A2(n73), .Z(n217) );
  AOI22D0 U592 ( .A1(mantissa_a[7]), .A2(n481), .B1(n482), .B2(mantissa_a[6]), 
        .ZN(n490) );
  CKXOR2D0 U593 ( .A1(n491), .A2(n73), .Z(n167) );
  CKND0 U594 ( .I(mantissa_b[7]), .ZN(n73) );
  AOI22D0 U595 ( .A1(mantissa_a[8]), .A2(n481), .B1(n482), .B2(mantissa_a[7]), 
        .ZN(n491) );
  XNR2D0 U596 ( .A1(n79), .A2(mantissa_b[6]), .ZN(n481) );
  CKXOR2D0 U597 ( .A1(mantissa_b[7]), .A2(n492), .Z(n130) );
  CKND2D0 U598 ( .A1(mantissa_a[9]), .A2(n482), .ZN(n492) );
  OA21D0 U599 ( .A1(mantissa_b[6]), .A2(n79), .B(n493), .Z(n482) );
  MUX2ND0 U600 ( .I0(n79), .I1(mantissa_b[6]), .S(mantissa_b[7]), .ZN(n493) );
  CKND0 U601 ( .I(mantissa_b[5]), .ZN(n79) );
endmodule


module fma_lza ( mantissa_ab, mantissa_c, exp_ab_greater, exp_ab_less, sign_ab, 
        sign_c, fma_byp, adder_start, mantissa_shift, lza_done );
  input [21:0] mantissa_ab;
  input [21:0] mantissa_c;
  output [4:0] mantissa_shift;
  input exp_ab_greater, exp_ab_less, sign_ab, sign_c, fma_byp, adder_start;
  output lza_done;
  wire   adder_start, n168, n169, n170, n171, n172, n173, n174, n175, n176,
         n177, n178, n179, n180, n181, n182, n183, n184, n185, n186, n187,
         n188, n189, n190, n191, n192, n193, n194, n195, n196, n197, n198,
         n199, n200, n201, n202, n203, n204, n205, n206, n207, n208, n209,
         n210, n211, n212, n213, n214, n215, n216, n217, n218, n219, n220,
         n221, n222, n223, n224, n225, n226, n227, n228, n229, n230, n231,
         n232, n233, n234, n235, n236, n237, n238, n239, n240, n241, n242,
         n243, n244, n245, n246, n247, n248, n249, n250, n251, n252, n253,
         n254, n255, n256, n257, n258, n259, n260, n261, n262, n263, n264,
         n265, n266, n267, n268, n269, n270, n271, n272, n273, n274, n275,
         n276, n277, n278, n279, n280, n281, n282, n283, n284, n285, n286,
         n287, n288, n289, n290, n291, n292, n293, n294, n295, n296, n297,
         n298, n299, n300, n301, n302, n303, n304, n305, n306, n307, n308,
         n309, n310, n311, n312, n313, n314, n315, n316, n317, n318, n319,
         n320, n321, n322, n323, n324, n325, n326, n327, n328, n329, n330,
         n331, n332, n333, n334, n335, n336, n337, n338, n339, n340, n341,
         n342, n343, n344, n345, n346;


  NR2D0 U3 ( .A1(n168), .A2(n169), .ZN(mantissa_shift[4]) );
  CKXOR2D0 U4 ( .A1(n170), .A2(n171), .Z(n169) );
  NR2D0 U5 ( .A1(n172), .A2(n173), .ZN(n170) );
  AOI21D0 U6 ( .A1(n174), .A2(n175), .B(n168), .ZN(mantissa_shift[3]) );
  IND2D0 U7 ( .A1(n173), .B1(n176), .ZN(n175) );
  MUX2ND0 U8 ( .I0(n177), .I1(n172), .S(n173), .ZN(n174) );
  OAI21D0 U9 ( .A1(n178), .A2(n179), .B(n180), .ZN(n173) );
  NR2D0 U10 ( .A1(n176), .A2(n177), .ZN(n172) );
  AN2D0 U11 ( .A1(n181), .A2(n182), .Z(n176) );
  MUX2ND0 U12 ( .I0(n183), .I1(n184), .S(n185), .ZN(n181) );
  AOI221D0 U13 ( .A1(n186), .A2(n187), .B1(n188), .B2(n189), .C(n171), .ZN(
        n177) );
  MUX2D0 U14 ( .I0(n190), .I1(n191), .S(sign_c), .Z(n171) );
  NR2D0 U15 ( .A1(n186), .A2(n187), .ZN(n191) );
  NR2D0 U16 ( .A1(n188), .A2(n189), .ZN(n190) );
  IOA21D0 U17 ( .A1(n192), .A2(n193), .B(n194), .ZN(n189) );
  OAI21D0 U18 ( .A1(n195), .A2(n186), .B(n196), .ZN(n187) );
  NR2D0 U19 ( .A1(n168), .A2(n197), .ZN(mantissa_shift[2]) );
  CKXOR2D0 U20 ( .A1(n198), .A2(n178), .Z(n197) );
  MUX2D0 U21 ( .I0(n199), .I1(n200), .S(sign_c), .Z(n178) );
  CKXOR2D0 U22 ( .A1(n201), .A2(n202), .Z(n200) );
  AOI21D0 U23 ( .A1(n203), .A2(n204), .B(n183), .ZN(n201) );
  CKND2D0 U24 ( .A1(n205), .A2(n206), .ZN(n183) );
  XNR2D0 U25 ( .A1(n207), .A2(n208), .ZN(n199) );
  IND2D0 U26 ( .A1(n184), .B1(n209), .ZN(n208) );
  CKND2D0 U27 ( .A1(n210), .A2(n211), .ZN(n184) );
  NR2D0 U28 ( .A1(n179), .A2(n212), .ZN(n198) );
  MUX2D0 U29 ( .I0(n213), .I1(n214), .S(sign_c), .Z(n179) );
  CKXOR2D0 U30 ( .A1(n196), .A2(n215), .Z(n214) );
  OR2D0 U31 ( .A1(n186), .A2(n195), .Z(n215) );
  AOI21D0 U32 ( .A1(n216), .A2(n217), .B(n218), .ZN(n196) );
  CKXOR2D0 U33 ( .A1(n194), .A2(n219), .Z(n213) );
  CKND2D0 U34 ( .A1(n193), .A2(n192), .ZN(n219) );
  CKND2D0 U35 ( .A1(n220), .A2(n221), .ZN(n192) );
  AOI21D0 U36 ( .A1(n222), .A2(n223), .B(n224), .ZN(n194) );
  AOI211D0 U37 ( .A1(n212), .A2(n225), .B(n226), .C(n168), .ZN(
        mantissa_shift[1]) );
  MUX2ND0 U38 ( .I0(n227), .I1(n228), .S(n185), .ZN(n226) );
  CKND2D0 U39 ( .A1(n229), .A2(n222), .ZN(n228) );
  OAI21D0 U40 ( .A1(n230), .A2(n231), .B(n188), .ZN(n222) );
  CKND0 U41 ( .I(n193), .ZN(n188) );
  NR2D0 U42 ( .A1(n232), .A2(n233), .ZN(n193) );
  NR2D0 U43 ( .A1(n234), .A2(n232), .ZN(n230) );
  NR2D0 U44 ( .A1(n235), .A2(n236), .ZN(n232) );
  CKXOR2D0 U45 ( .A1(n223), .A2(n224), .Z(n229) );
  NR2D0 U46 ( .A1(n237), .A2(n235), .ZN(n224) );
  AN2D0 U47 ( .A1(n238), .A2(n239), .Z(n223) );
  CKND2D0 U48 ( .A1(n240), .A2(n216), .ZN(n227) );
  OAI21D0 U49 ( .A1(n241), .A2(n242), .B(n186), .ZN(n216) );
  CKND2D0 U50 ( .A1(n242), .A2(n241), .ZN(n186) );
  CKXOR2D0 U51 ( .A1(n217), .A2(n218), .Z(n240) );
  IAO21D0 U52 ( .A1(n243), .A2(n195), .B(n244), .ZN(n217) );
  INR2D0 U53 ( .A1(n245), .B1(n246), .ZN(n195) );
  INR2D0 U54 ( .A1(n246), .B1(n245), .ZN(n243) );
  ND3D0 U55 ( .A1(n247), .A2(n248), .A3(n249), .ZN(n225) );
  CKND0 U56 ( .I(n180), .ZN(n212) );
  AOI21D0 U57 ( .A1(n248), .A2(n247), .B(n249), .ZN(n180) );
  AN2D0 U58 ( .A1(n250), .A2(n182), .Z(n249) );
  MUX2D0 U59 ( .I0(n207), .I1(n202), .S(sign_c), .Z(n182) );
  CKND2D0 U60 ( .A1(n251), .A2(n252), .ZN(n202) );
  XNR2D0 U61 ( .A1(n205), .A2(n206), .ZN(n251) );
  CKND2D0 U62 ( .A1(n253), .A2(n254), .ZN(n207) );
  XNR2D0 U63 ( .A1(n211), .A2(n210), .ZN(n254) );
  MUX2ND0 U64 ( .I0(n255), .I1(n256), .S(n185), .ZN(n250) );
  CKND2D0 U65 ( .A1(n257), .A2(n258), .ZN(n256) );
  OAI21D0 U66 ( .A1(n259), .A2(n260), .B(n209), .ZN(n258) );
  CKND2D0 U67 ( .A1(n259), .A2(n260), .ZN(n209) );
  IND3D0 U68 ( .A1(n261), .B1(n262), .B2(n263), .ZN(n255) );
  XNR2D0 U69 ( .A1(n203), .A2(n204), .ZN(n262) );
  NR2D0 U70 ( .A1(n264), .A2(n168), .ZN(mantissa_shift[0]) );
  OR2D0 U71 ( .A1(fma_byp), .A2(sign_ab), .Z(n168) );
  XNR2D0 U72 ( .A1(n248), .A2(n247), .ZN(n264) );
  MUX2ND0 U73 ( .I0(n265), .I1(n266), .S(n185), .ZN(n247) );
  AOI22D0 U74 ( .A1(n259), .A2(n267), .B1(n210), .B2(n268), .ZN(n266) );
  OAI21D0 U75 ( .A1(n253), .A2(n269), .B(n270), .ZN(n268) );
  IAO21D0 U76 ( .A1(n271), .A2(n272), .B(n273), .ZN(n210) );
  OAI31D0 U77 ( .A1(n257), .A2(mantissa_c[21]), .A3(mantissa_ab[21]), .B(n274), 
        .ZN(n267) );
  AOI21D0 U78 ( .A1(n260), .A2(n275), .B(n276), .ZN(n259) );
  AOI22D0 U79 ( .A1(n203), .A2(n277), .B1(n205), .B2(n278), .ZN(n265) );
  OAI21D0 U80 ( .A1(n279), .A2(n280), .B(n281), .ZN(n278) );
  CKND0 U81 ( .I(n282), .ZN(n279) );
  MUX2ND0 U82 ( .I0(n283), .I1(n284), .S(n206), .ZN(n205) );
  NR3D0 U83 ( .A1(n285), .A2(n281), .A3(n286), .ZN(n284) );
  OAI21D0 U84 ( .A1(n263), .A2(n261), .B(n287), .ZN(n277) );
  CKND0 U85 ( .I(n288), .ZN(n287) );
  CKND0 U86 ( .I(n289), .ZN(n263) );
  CKND2D0 U87 ( .A1(n290), .A2(n291), .ZN(n203) );
  OAI21D0 U88 ( .A1(n292), .A2(n293), .B(n294), .ZN(n291) );
  OAI31D0 U89 ( .A1(n185), .A2(n218), .A3(n295), .B(n296), .ZN(n248) );
  MUX2ND0 U90 ( .I0(n235), .I1(n297), .S(n236), .ZN(n296) );
  AOI21D0 U91 ( .A1(n231), .A2(n298), .B(n299), .ZN(n236) );
  CKXOR2D0 U92 ( .A1(n237), .A2(n235), .Z(n297) );
  CKND2D0 U93 ( .A1(n220), .A2(n300), .ZN(n237) );
  OAI21D0 U94 ( .A1(n238), .A2(n301), .B(n302), .ZN(n300) );
  XNR2D0 U95 ( .A1(n239), .A2(n221), .ZN(n220) );
  OR2D0 U96 ( .A1(n303), .A2(n304), .Z(n239) );
  ND4D0 U97 ( .A1(n305), .A2(n306), .A3(n307), .A4(n308), .ZN(n235) );
  NR4D0 U98 ( .A1(n309), .A2(n310), .A3(n234), .A4(n311), .ZN(n308) );
  OAI31D0 U99 ( .A1(n303), .A2(n312), .A3(n313), .B(n261), .ZN(n311) );
  INR3D0 U100 ( .A1(n299), .B1(mantissa_ab[0]), .B2(mantissa_c[0]), .ZN(n234)
         );
  AO31D0 U101 ( .A1(n275), .A2(mantissa_ab[17]), .A3(mantissa_c[17]), .B(n314), 
        .Z(n310) );
  AO33D0 U102 ( .A1(mantissa_c[2]), .A2(mantissa_ab[2]), .A3(n298), .B1(
        mantissa_c[3]), .B2(mantissa_ab[3]), .B3(n304), .Z(n314) );
  OAI211D0 U103 ( .A1(n272), .A2(n315), .B(n316), .C(n317), .ZN(n309) );
  AOI31D0 U104 ( .A1(mantissa_c[8]), .A2(mantissa_ab[8]), .A3(n318), .B(n319), 
        .ZN(n317) );
  AO33D0 U105 ( .A1(n320), .A2(mantissa_ab[18]), .A3(mantissa_c[18]), .B1(n253), .B2(mantissa_ab[13]), .B3(mantissa_c[13]), .Z(n319) );
  CKND0 U106 ( .I(n301), .ZN(n318) );
  AOI33D0 U107 ( .A1(mantissa_c[0]), .A2(mantissa_ab[0]), .A3(n299), .B1(
        mantissa_c[15]), .B2(mantissa_ab[15]), .B3(n276), .ZN(n316) );
  NR3D0 U108 ( .A1(mantissa_ab[1]), .A2(mantissa_c[1]), .A3(n231), .ZN(n299)
         );
  CKND0 U109 ( .I(n233), .ZN(n231) );
  CKND2D0 U110 ( .A1(mantissa_c[11]), .A2(mantissa_ab[11]), .ZN(n315) );
  AOI211D0 U111 ( .A1(n271), .A2(n283), .B(n321), .C(n322), .ZN(n307) );
  OAI33D0 U112 ( .A1(n289), .A2(mantissa_c[21]), .A3(mantissa_ab[21]), .B1(
        n270), .B2(n286), .B3(n285), .ZN(n322) );
  CKND0 U113 ( .I(n323), .ZN(n270) );
  OAI31D0 U114 ( .A1(n324), .A2(n325), .A3(n326), .B(n327), .ZN(n321) );
  AOI33D0 U115 ( .A1(mantissa_c[1]), .A2(mantissa_ab[1]), .A3(n233), .B1(
        mantissa_c[9]), .B2(mantissa_ab[9]), .B3(n273), .ZN(n327) );
  INR3D0 U116 ( .A1(n298), .B1(mantissa_ab[2]), .B2(mantissa_c[2]), .ZN(n233)
         );
  INR3D0 U117 ( .A1(n304), .B1(mantissa_ab[3]), .B2(mantissa_c[3]), .ZN(n298)
         );
  NR3D0 U118 ( .A1(mantissa_ab[4]), .A2(mantissa_c[4]), .A3(n221), .ZN(n304)
         );
  CKND0 U119 ( .I(n328), .ZN(n221) );
  AOI31D0 U120 ( .A1(mantissa_c[7]), .A2(mantissa_ab[7]), .A3(n238), .B(n329), 
        .ZN(n306) );
  OAI32D0 U121 ( .A1(n260), .A2(n292), .A3(n293), .B1(n282), .B2(n269), .ZN(
        n329) );
  CKND0 U122 ( .I(mantissa_ab[16]), .ZN(n292) );
  AOI33D0 U123 ( .A1(mantissa_c[6]), .A2(mantissa_ab[6]), .A3(n330), .B1(
        mantissa_c[4]), .B2(mantissa_ab[4]), .B3(n328), .ZN(n305) );
  NR3D0 U124 ( .A1(mantissa_ab[5]), .A2(mantissa_c[5]), .A3(n303), .ZN(n328)
         );
  OR3D0 U125 ( .A1(mantissa_ab[6]), .A2(mantissa_c[6]), .A3(n302), .Z(n303) );
  CKND0 U126 ( .I(n302), .ZN(n330) );
  ND3D0 U127 ( .A1(n331), .A2(n332), .A3(n238), .ZN(n302) );
  NR3D0 U128 ( .A1(mantissa_ab[8]), .A2(mantissa_c[8]), .A3(n301), .ZN(n238)
         );
  ND3D0 U129 ( .A1(n333), .A2(n334), .A3(n273), .ZN(n301) );
  NR3D0 U130 ( .A1(mantissa_ab[10]), .A2(mantissa_c[10]), .A3(n211), .ZN(n273)
         );
  CKND0 U131 ( .I(n271), .ZN(n211) );
  NR3D0 U132 ( .A1(mantissa_ab[11]), .A2(mantissa_c[11]), .A3(n272), .ZN(n271)
         );
  ND3D0 U133 ( .A1(n286), .A2(n285), .A3(n323), .ZN(n272) );
  INR3D0 U134 ( .A1(n253), .B1(mantissa_ab[13]), .B2(mantissa_c[13]), .ZN(n323) );
  NR3D0 U135 ( .A1(mantissa_ab[14]), .A2(mantissa_c[14]), .A3(n269), .ZN(n253)
         );
  IND3D0 U136 ( .A1(mantissa_ab[15]), .B1(n276), .B2(n335), .ZN(n269) );
  NR3D0 U137 ( .A1(mantissa_ab[16]), .A2(mantissa_c[16]), .A3(n260), .ZN(n276)
         );
  CKND0 U138 ( .I(n336), .ZN(n260) );
  INR3D0 U139 ( .A1(n275), .B1(mantissa_ab[17]), .B2(mantissa_c[17]), .ZN(n336) );
  NR3D0 U140 ( .A1(mantissa_ab[18]), .A2(mantissa_c[18]), .A3(n274), .ZN(n275)
         );
  CKND0 U141 ( .I(n320), .ZN(n274) );
  NR3D0 U142 ( .A1(mantissa_ab[19]), .A2(mantissa_c[19]), .A3(n324), .ZN(n320)
         );
  CKND0 U143 ( .I(n257), .ZN(n324) );
  NR4D0 U144 ( .A1(mantissa_ab[20]), .A2(mantissa_ab[21]), .A3(mantissa_c[20]), 
        .A4(mantissa_c[21]), .ZN(n257) );
  CKND0 U145 ( .I(mantissa_c[12]), .ZN(n285) );
  CKND0 U146 ( .I(mantissa_ab[12]), .ZN(n286) );
  AOI31D0 U147 ( .A1(mantissa_ab[0]), .A2(n337), .A3(mantissa_c[0]), .B(n242), 
        .ZN(n295) );
  OAI21D0 U148 ( .A1(n338), .A2(n241), .B(n339), .ZN(n242) );
  AN2D0 U149 ( .A1(mantissa_ab[1]), .A2(mantissa_c[1]), .Z(n338) );
  CKND0 U150 ( .I(n241), .ZN(n337) );
  ND3D0 U151 ( .A1(mantissa_ab[2]), .A2(n339), .A3(mantissa_c[2]), .ZN(n241)
         );
  AN3D0 U152 ( .A1(n340), .A2(mantissa_ab[3]), .A3(mantissa_c[3]), .Z(n339) );
  OA211D0 U153 ( .A1(n341), .A2(n244), .B(n342), .C(n245), .Z(n218) );
  IAO21D0 U154 ( .A1(n246), .A2(n343), .B(n340), .ZN(n245) );
  AN3D0 U155 ( .A1(mantissa_ab[4]), .A2(n246), .A3(mantissa_c[4]), .Z(n340) );
  NR3D0 U156 ( .A1(n312), .A2(n343), .A3(n313), .ZN(n246) );
  CKND0 U157 ( .I(mantissa_c[5]), .ZN(n313) );
  IND4D0 U158 ( .A1(n244), .B1(mantissa_ab[6]), .B2(mantissa_ab[7]), .B3(n344), 
        .ZN(n343) );
  INR2D0 U159 ( .A1(mantissa_c[6]), .B1(n332), .ZN(n344) );
  CKND0 U160 ( .I(mantissa_ab[5]), .ZN(n312) );
  ND3D0 U161 ( .A1(mantissa_ab[8]), .A2(n342), .A3(mantissa_c[8]), .ZN(n244)
         );
  INR4D0 U162 ( .A1(n283), .B1(n334), .B2(n333), .B3(n206), .ZN(n342) );
  IND4D0 U163 ( .A1(n281), .B1(mantissa_ab[11]), .B2(mantissa_ab[12]), .B3(
        n345), .ZN(n206) );
  AN2D0 U164 ( .A1(mantissa_c[11]), .A2(mantissa_c[12]), .Z(n345) );
  ND3D0 U165 ( .A1(mantissa_ab[13]), .A2(n252), .A3(mantissa_c[13]), .ZN(n281)
         );
  NR2D0 U166 ( .A1(n280), .A2(n282), .ZN(n252) );
  CKND2D0 U167 ( .A1(mantissa_c[14]), .A2(mantissa_ab[14]), .ZN(n282) );
  ND4D0 U168 ( .A1(mantissa_ab[15]), .A2(n294), .A3(mantissa_ab[16]), .A4(n346), .ZN(n280) );
  NR2D0 U169 ( .A1(n335), .A2(n293), .ZN(n346) );
  CKND0 U170 ( .I(mantissa_c[16]), .ZN(n293) );
  CKND0 U171 ( .I(mantissa_c[15]), .ZN(n335) );
  CKND0 U172 ( .I(n204), .ZN(n294) );
  ND3D0 U173 ( .A1(mantissa_ab[17]), .A2(n290), .A3(mantissa_c[17]), .ZN(n204)
         );
  AN3D0 U174 ( .A1(n288), .A2(mantissa_ab[18]), .A3(mantissa_c[18]), .Z(n290)
         );
  NR4D0 U175 ( .A1(n261), .A2(n326), .A3(n325), .A4(n289), .ZN(n288) );
  CKND2D0 U176 ( .A1(mantissa_c[20]), .A2(mantissa_ab[20]), .ZN(n289) );
  CKND0 U177 ( .I(mantissa_ab[19]), .ZN(n325) );
  CKND0 U178 ( .I(mantissa_c[19]), .ZN(n326) );
  CKND2D0 U179 ( .A1(mantissa_c[21]), .A2(mantissa_ab[21]), .ZN(n261) );
  CKND0 U180 ( .I(mantissa_ab[9]), .ZN(n333) );
  CKND0 U181 ( .I(mantissa_c[9]), .ZN(n334) );
  AN2D0 U182 ( .A1(mantissa_c[10]), .A2(mantissa_ab[10]), .Z(n283) );
  NR2D0 U183 ( .A1(n331), .A2(n332), .ZN(n341) );
  CKND0 U184 ( .I(mantissa_c[7]), .ZN(n332) );
  CKND0 U185 ( .I(mantissa_ab[7]), .ZN(n331) );
  CKND0 U186 ( .I(sign_c), .ZN(n185) );
endmodule


module fma_aligner_adder_DW_rash_0 ( A, DATA_TC, SH, SH_TC, B );
  input [20:0] A;
  input [4:0] SH;
  output [20:0] B;
  input DATA_TC, SH_TC;
  wire   n25, n26, n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38,
         n39, n40, n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52,
         n53, n54, n55, n56, n57, n58, n59, n60, n61, n62, n63, n64, n65, n66,
         n67, n68, n69, n70, n71, n72, n73, n74, n75, n76, n77, n78, n79, n80,
         n81, n82, n83, n84, n85, n86, n87, n88, n89, n90, n91, n92, n93, n94,
         n95, n96, n97, n98, n99, n100, n101, n102, n103, n104, n105, n106,
         n107, n108;

  MUX2ND0 U96 ( .I0(n106), .I1(n89), .S(n107), .ZN(n30) );
  AN3XD1 U54 ( .A1(SH[4]), .A2(n107), .A3(n108), .Z(n45) );
  OR2D1 U95 ( .A1(SH[4]), .A2(SH[3]), .Z(n67) );
  OR2D1 U101 ( .A1(SH[4]), .A2(n108), .Z(n31) );
  NR2D1 U3 ( .A1(n103), .A2(SH[1]), .ZN(n52) );
  NR2D1 U4 ( .A1(SH[0]), .A2(SH[1]), .ZN(n53) );
  NR2D1 U5 ( .A1(n107), .A2(n31), .ZN(n36) );
  INVD1 U6 ( .I(n47), .ZN(n98) );
  NR2D1 U7 ( .A1(n27), .A2(n98), .ZN(B[17]) );
  NR2D1 U8 ( .A1(n50), .A2(n98), .ZN(B[19]) );
  NR2D1 U9 ( .A1(n58), .A2(n98), .ZN(B[18]) );
  OAI222D0 U10 ( .A1(n70), .A2(n26), .B1(n99), .B2(n61), .C1(n29), .C2(n98), 
        .ZN(B[12]) );
  NR2D1 U11 ( .A1(n30), .A2(n67), .ZN(B[16]) );
  OAI22D1 U12 ( .A1(n25), .A2(n98), .B1(n27), .B2(n26), .ZN(B[13]) );
  INVD1 U13 ( .I(n37), .ZN(n99) );
  NR2D1 U14 ( .A1(n98), .A2(n61), .ZN(B[20]) );
  INVD1 U15 ( .I(n58), .ZN(n87) );
  INVD1 U16 ( .I(n27), .ZN(n85) );
  INVD1 U17 ( .I(n59), .ZN(n91) );
  INVD1 U18 ( .I(n51), .ZN(n90) );
  INVD1 U19 ( .I(n25), .ZN(n92) );
  INVD1 U20 ( .I(n50), .ZN(n86) );
  INVD1 U21 ( .I(n70), .ZN(n89) );
  INVD1 U22 ( .I(n61), .ZN(n106) );
  AOI222D0 U23 ( .A1(A[19]), .A2(n52), .B1(A[20]), .B2(n102), .C1(A[18]), .C2(
        n53), .ZN(n58) );
  IND2D1 U24 ( .A1(n67), .B1(SH[2]), .ZN(n26) );
  OAI211D1 U25 ( .A1(n29), .A2(n100), .B(n75), .C(n76), .ZN(B[0]) );
  INVD1 U26 ( .I(n36), .ZN(n100) );
  OA22D0 U27 ( .A1(n99), .A2(n32), .B1(n26), .B2(n43), .Z(n76) );
  OAI222D0 U28 ( .A1(n59), .A2(n26), .B1(n58), .B2(n99), .C1(n38), .C2(n98), 
        .ZN(B[10]) );
  OAI222D0 U29 ( .A1(n29), .A2(n26), .B1(n30), .B2(n31), .C1(n32), .C2(n98), 
        .ZN(B[8]) );
  OAI22D1 U30 ( .A1(n59), .A2(n98), .B1(n58), .B2(n26), .ZN(B[14]) );
  OAI222D0 U31 ( .A1(n51), .A2(n26), .B1(n50), .B2(n99), .C1(n33), .C2(n98), 
        .ZN(B[11]) );
  OAI22D1 U32 ( .A1(n51), .A2(n98), .B1(n50), .B2(n26), .ZN(B[15]) );
  AOI221D0 U33 ( .A1(n52), .A2(A[9]), .B1(n53), .B2(A[8]), .C(n78), .ZN(n32)
         );
  AO22D0 U34 ( .A1(A[11]), .A2(n104), .B1(A[10]), .B2(n102), .Z(n78) );
  AOI221D0 U35 ( .A1(n52), .A2(A[13]), .B1(n53), .B2(A[12]), .C(n84), .ZN(n29)
         );
  AO22D0 U36 ( .A1(A[15]), .A2(n104), .B1(A[14]), .B2(n102), .Z(n84) );
  AOI221D0 U37 ( .A1(n52), .A2(A[10]), .B1(n53), .B2(A[9]), .C(n66), .ZN(n28)
         );
  AO22D0 U38 ( .A1(A[12]), .A2(n104), .B1(A[11]), .B2(n102), .Z(n66) );
  AOI221D0 U39 ( .A1(n52), .A2(A[18]), .B1(n53), .B2(A[17]), .C(n68), .ZN(n27)
         );
  AO22D0 U40 ( .A1(A[20]), .A2(n104), .B1(A[19]), .B2(n102), .Z(n68) );
  AOI22D1 U41 ( .A1(A[19]), .A2(n53), .B1(A[20]), .B2(n52), .ZN(n50) );
  AOI221D0 U42 ( .A1(n52), .A2(A[11]), .B1(n53), .B2(A[10]), .C(n73), .ZN(n38)
         );
  AO22D0 U43 ( .A1(A[13]), .A2(n104), .B1(A[12]), .B2(n102), .Z(n73) );
  AOI221D0 U44 ( .A1(n52), .A2(A[12]), .B1(n53), .B2(A[11]), .C(n71), .ZN(n33)
         );
  AO22D0 U45 ( .A1(A[14]), .A2(n104), .B1(A[13]), .B2(n102), .Z(n71) );
  AOI221D0 U46 ( .A1(n52), .A2(A[15]), .B1(n53), .B2(A[14]), .C(n74), .ZN(n59)
         );
  AO22D0 U47 ( .A1(A[17]), .A2(n104), .B1(A[16]), .B2(n102), .Z(n74) );
  AOI221D0 U48 ( .A1(n52), .A2(A[16]), .B1(n53), .B2(A[15]), .C(n72), .ZN(n51)
         );
  AO22D0 U49 ( .A1(A[18]), .A2(n104), .B1(A[17]), .B2(n102), .Z(n72) );
  AOI221D0 U50 ( .A1(n52), .A2(A[14]), .B1(n53), .B2(A[13]), .C(n69), .ZN(n25)
         );
  AO22D0 U51 ( .A1(A[16]), .A2(n104), .B1(A[15]), .B2(n102), .Z(n69) );
  AOI221D0 U52 ( .A1(n52), .A2(A[17]), .B1(n53), .B2(A[16]), .C(n83), .ZN(n70)
         );
  AO22D0 U53 ( .A1(A[19]), .A2(n104), .B1(A[18]), .B2(n102), .Z(n83) );
  OAI222D0 U55 ( .A1(n25), .A2(n26), .B1(n27), .B2(n99), .C1(n28), .C2(n98), 
        .ZN(B[9]) );
  NR2D1 U56 ( .A1(n31), .A2(SH[2]), .ZN(n37) );
  NR2D1 U57 ( .A1(n67), .A2(SH[2]), .ZN(n47) );
  ND2D1 U58 ( .A1(n53), .A2(A[20]), .ZN(n61) );
  INVD1 U59 ( .I(n53), .ZN(n105) );
  INVD1 U60 ( .I(n52), .ZN(n101) );
  INVD1 U61 ( .I(n81), .ZN(n102) );
  INVD1 U62 ( .I(n80), .ZN(n104) );
  INVD1 U63 ( .I(SH[0]), .ZN(n103) );
  INVD1 U64 ( .I(SH[2]), .ZN(n107) );
  INVD1 U65 ( .I(SH[3]), .ZN(n108) );
  OAI221D0 U66 ( .A1(n28), .A2(n99), .B1(n41), .B2(n26), .C(n62), .ZN(B[1]) );
  AOI222D0 U67 ( .A1(n36), .A2(n92), .B1(n45), .B2(n85), .C1(n47), .C2(n63), 
        .ZN(n62) );
  OAI221D0 U68 ( .A1(n101), .A2(n96), .B1(n105), .B2(n97), .C(n64), .ZN(n63)
         );
  OAI221D0 U69 ( .A1(n38), .A2(n99), .B1(n39), .B2(n26), .C(n55), .ZN(B[2]) );
  AOI222D0 U70 ( .A1(n36), .A2(n91), .B1(n45), .B2(n87), .C1(n47), .C2(n56), 
        .ZN(n55) );
  OAI221D0 U71 ( .A1(n101), .A2(n95), .B1(n105), .B2(n96), .C(n57), .ZN(n56)
         );
  OAI221D0 U72 ( .A1(n33), .A2(n99), .B1(n34), .B2(n26), .C(n46), .ZN(B[3]) );
  AOI222D0 U73 ( .A1(n36), .A2(n90), .B1(n45), .B2(n86), .C1(n47), .C2(n48), 
        .ZN(n46) );
  OAI221D0 U74 ( .A1(n101), .A2(n94), .B1(n105), .B2(n95), .C(n49), .ZN(n48)
         );
  OAI221D0 U75 ( .A1(n32), .A2(n26), .B1(n43), .B2(n98), .C(n44), .ZN(B[4]) );
  AOI222D0 U76 ( .A1(n37), .A2(n93), .B1(n45), .B2(n106), .C1(n36), .C2(n89), 
        .ZN(n44) );
  INVD1 U77 ( .I(n29), .ZN(n93) );
  OAI221D0 U78 ( .A1(n28), .A2(n26), .B1(n41), .B2(n98), .C(n42), .ZN(B[5]) );
  AOI22D1 U79 ( .A1(n36), .A2(n85), .B1(n37), .B2(n92), .ZN(n42) );
  OAI221D0 U80 ( .A1(n38), .A2(n26), .B1(n39), .B2(n98), .C(n40), .ZN(B[6]) );
  AOI22D1 U81 ( .A1(n36), .A2(n87), .B1(n37), .B2(n91), .ZN(n40) );
  OAI221D0 U82 ( .A1(n33), .A2(n26), .B1(n34), .B2(n98), .C(n35), .ZN(B[7]) );
  AOI22D1 U83 ( .A1(n36), .A2(n86), .B1(n37), .B2(n90), .ZN(n35) );
  AOI221D0 U84 ( .A1(n52), .A2(A[8]), .B1(n53), .B2(A[7]), .C(n54), .ZN(n34)
         );
  AO22D0 U85 ( .A1(A[10]), .A2(n104), .B1(A[9]), .B2(n102), .Z(n54) );
  AOI221D0 U86 ( .A1(n52), .A2(A[5]), .B1(n53), .B2(A[4]), .C(n77), .ZN(n43)
         );
  AO22D0 U87 ( .A1(A[7]), .A2(n104), .B1(A[6]), .B2(n102), .Z(n77) );
  AOI221D0 U88 ( .A1(n52), .A2(A[7]), .B1(n53), .B2(A[6]), .C(n60), .ZN(n39)
         );
  AO22D0 U89 ( .A1(A[9]), .A2(n104), .B1(A[8]), .B2(n102), .Z(n60) );
  AOI221D0 U90 ( .A1(n52), .A2(A[6]), .B1(n53), .B2(A[5]), .C(n65), .ZN(n41)
         );
  AO22D0 U91 ( .A1(A[8]), .A2(n104), .B1(A[7]), .B2(n102), .Z(n65) );
  AOI22D1 U92 ( .A1(A[5]), .A2(n104), .B1(A[4]), .B2(n102), .ZN(n57) );
  AOI22D1 U93 ( .A1(A[6]), .A2(n104), .B1(A[5]), .B2(n102), .ZN(n49) );
  AOI22D1 U94 ( .A1(A[4]), .A2(n104), .B1(A[3]), .B2(n102), .ZN(n64) );
  ND2D1 U97 ( .A1(SH[1]), .A2(SH[0]), .ZN(n80) );
  ND2D1 U98 ( .A1(SH[1]), .A2(n103), .ZN(n81) );
  AOI32D1 U99 ( .A1(n88), .A2(n108), .A3(SH[4]), .B1(n47), .B2(n79), .ZN(n75)
         );
  INVD1 U100 ( .I(n30), .ZN(n88) );
  OAI221D0 U102 ( .A1(n80), .A2(n95), .B1(n81), .B2(n96), .C(n82), .ZN(n79) );
  AOI22D1 U103 ( .A1(A[1]), .A2(n52), .B1(A[0]), .B2(n53), .ZN(n82) );
  INVD1 U104 ( .I(A[4]), .ZN(n94) );
  INVD1 U105 ( .I(A[3]), .ZN(n95) );
  INVD1 U106 ( .I(A[2]), .ZN(n96) );
  INVD1 U107 ( .I(A[1]), .ZN(n97) );
endmodule


module fma_aligner_adder ( mantissa_ab, exp_ab, sign_ab, c, exp_diff, 
        exp_ab_greater, exp_ab_less, fma_byp, add_byp, adder_start, 
        mantissa_ab_c, exp_ab_c, sign_ab_c, mantissa_shift, adder_done );
  input [19:0] mantissa_ab;
  input [4:0] exp_ab;
  input [15:0] c;
  input [4:0] exp_diff;
  output [21:0] mantissa_ab_c;
  output [4:0] exp_ab_c;
  output [4:0] mantissa_shift;
  input sign_ab, exp_ab_greater, exp_ab_less, fma_byp, add_byp, adder_start;
  output sign_ab_c, adder_done;
  wire   n1147, N45, N46, N47, N48, N49, N50, N51, N52, N53, N54, N55, N56,
         N57, N58, N59, N60, N61, N62, N63, N64, N65, N800, n633, n634, n658,
         n848, n850, n872, n905, n906, n946, n951, n1063, n1103, n1148, n1665,
         n1666, n1667, n1668, n1669, n1670, n1671, n1672, n1673, n1674, n1675,
         n1676, n1677, n1678, n1679, n1680, n1, n2, n3, n4, n5, n6, n7, n8, n9,
         n10, n11, n12, n13, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23,
         n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37,
         n38, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, n51,
         n52, n53, n54, n55, n56, n57, n58, n59, n60, n61, n62, n63, n64, n65,
         n66, n67, n68, n69, n70, n71, n72, n73, n74, n75, n76, n77, n78, n79,
         n80, n81, n82, n83, n84, n85, n86, n87, n88, n89, n90, n91, n92, n93,
         n94, n95, n96, n97, n98, n99, n100, n101, n102, n103, n104, n105,
         n106, n107, n108, n109, n110, n111, n112, n113, n114, n115, n116,
         n117, n118, n119, n120, n121, n122, n123, n124, n125, n126, n127,
         n128, n129, n130, n131, n132, n133, n134, n135, n136, n137, n138,
         n139, n140, n141, n142, n143, n144, n145, n146, n147, n148, n149,
         n150, n151, n152, n153, n154, n155, n156, n157, n158, n159, n160,
         n161, n162, n163, n164, n165, n166, n167, n168, n169, n170, n171,
         n172, n173, n174, n175, n176, n177, n178, n179, n180, n181, n182,
         n183, n184, n185, n186, n187, n188, n189, n190, n191, n192, n193,
         n194, n195, n196, n197, n198, n199, n200, n201, n202, n203, n204,
         n205, n206, n207, n208, n209, n210, n211, n212, n213, n214, n215,
         n216, n217, n218, n219, n220, n221, n222, n223, n224, n225, n226,
         n227, n228, n229, n230, n231, n232, n233, n234, n235, n236, n237,
         n238, n239, n240, n241, n242, n243, n244, n245, n246, n247, n248,
         n249, n250, n251, n252, n253, n254, n255, n256, n257, n258, n259,
         n260, n261, n262, n263, n264, n265, n266, n267, n268, n269, n270,
         n271, n272, n273, n274, n275, n276, n277, n278, n279, n280, n281,
         n282, n283, n284, n285, n286, n287, n288, n289, n290, n291, n292,
         n293, n294, n295, n296, n297, n298, n299, n300, n301, n302, n303,
         n304, n305, n306, n307, n308, n309, n310, n311, n312, n313, n314,
         n315, n316, n317, n318, n319, n320, n321, n322, n323, n324, n325,
         n326, n327, n328, n329, n330, n331, n332, n333, n334, n335, n336,
         n337, n338, n339, n340, n341, n342, n343, n344, n345, n346, n347,
         n348, n349, n350, n351, n352, n353, n354, n355, n356, n357, n358,
         n359, n360, n361, n362, n363, n364, n365, n366, n367, n368, n369,
         n370, n371, n372, n373, n374, n375, n376, n377, n378, n379, n380,
         n381, n382, n383, n384, n385, n386, n387, n388, n389, n390, n391,
         n392, n393, n394, n395, n396, n397, n398, n399, n400, n401, n402,
         n403, n404, n405, n406, n407, n408, n409, n410, n411, n412, n413,
         n414, n415, n416, n417, n418, n419, n420, n421, n422, n423, n424,
         n425, n426, n427, n428, n429, n430, n431, n432, n433, n434, n435,
         n436, n437, n438, n439, n440, n441, n442, n443, n444, n445, n446,
         n447, n448, n449, n450, n451, n452, n453, n454, n455, n456, n457,
         n458, n459, n460, n461, n462, n463, n464, n465, n466, n467, n468,
         n469, n470, n471, n472, n473, n474, n475, n476, n477, n478, n479,
         n480, n481, n482, n483, n484, n485, n486, n487, n488, n489, n490,
         n491, n492, n493, n494, n495, n496, n497, n498, n499, n500, n501,
         n502, n503, n504, n505, n506, n507, n508, n509, n510, n511, n512,
         n513, n514, n515, n516, n517, n518, n519, n520, n521, n522, n523,
         n524, n525, n526, n527, n528, n529, n530, n531, n532;
  wire   [21:0] comp_mantissa_ab;
  wire   [21:0] comp_mantissa_c;

  CKXOR2D1 U1204 ( .A1(n850), .A2(n872), .Z(n1671) );
  CKXOR2D1 U1205 ( .A1(n531), .A2(n1671), .Z(n848) );
  CKXOR2D1 U1206 ( .A1(n633), .A2(n634), .Z(n1680) );
  CKXOR2D1 U1207 ( .A1(n946), .A2(n532), .Z(n1670) );
  CKXOR2D1 U1208 ( .A1(n1103), .A2(n1673), .Z(n1669) );
  CKXOR2D1 U1209 ( .A1(n1670), .A2(n1669), .Z(n634) );
  CKXOR2D1 U1210 ( .A1(n658), .A2(n1679), .Z(n1678) );
  CKXOR2D1 U1211 ( .A1(n951), .A2(n529), .Z(n1668) );
  CKXOR2D1 U1212 ( .A1(n1674), .A2(n530), .Z(n1667) );
  CKXOR2D1 U1213 ( .A1(n1668), .A2(n1667), .Z(n1679) );
  CKXOR2D1 U1214 ( .A1(n1676), .A2(n1677), .Z(n1675) );
  CKXOR2D1 U1215 ( .A1(n905), .A2(n906), .Z(n1666) );
  CKXOR2D1 U1216 ( .A1(n1063), .A2(n1672), .Z(n1665) );
  CKXOR2D1 U1217 ( .A1(n1666), .A2(n1665), .Z(n1677) );
  fma_lza fma_lza_i ( .mantissa_ab(comp_mantissa_ab), .mantissa_c(
        comp_mantissa_c), .exp_ab_greater(exp_ab_greater), .exp_ab_less(
        exp_ab_less), .sign_ab(sign_ab), .sign_c(c[15]), .fma_byp(fma_byp), 
        .adder_start(adder_start), .mantissa_shift(mantissa_shift), .lza_done(
        adder_done) );
  fma_aligner_adder_DW_rash_0 srl_62 ( .A({N800, mantissa_ab}), .DATA_TC(n1148), .SH(exp_diff), .SH_TC(n1148), .B({N65, N64, N63, N62, N61, N60, N59, N58, 
        N57, N56, N55, N54, N53, N52, N51, N50, N49, N48, N47, N46, N45}) );
  TIEL U600 ( .ZN(n1148) );
  OAI21D0 U601 ( .A1(n1), .A2(n2), .B(n3), .ZN(sign_ab_c) );
  MUX2ND0 U602 ( .I0(n4), .I1(c[15]), .S(fma_byp), .ZN(n3) );
  AOI31D0 U603 ( .A1(n5), .A2(n6), .A3(n7), .B(n8), .ZN(n4) );
  OAI21D0 U604 ( .A1(n9), .A2(n10), .B(n11), .ZN(n7) );
  CKND0 U605 ( .I(exp_ab_less), .ZN(n11) );
  OA31D0 U606 ( .A1(n10), .A2(exp_ab_greater), .A3(n9), .B(n12), .Z(n1) );
  NR2D0 U607 ( .A1(n13), .A2(c[9]), .ZN(n9) );
  OA221D0 U608 ( .A1(mantissa_ab[8]), .A2(n14), .B1(mantissa_ab[9]), .B2(n15), 
        .C(n16), .Z(n10) );
  AO22D0 U609 ( .A1(n14), .A2(mantissa_ab[8]), .B1(n17), .B2(n18), .Z(n16) );
  OAI221D0 U610 ( .A1(c[7]), .A2(n19), .B1(c[6]), .B2(n20), .C(n21), .ZN(n18)
         );
  OAI222D0 U611 ( .A1(mantissa_ab[5]), .A2(n22), .B1(mantissa_ab[6]), .B2(n23), 
        .C1(n24), .C2(n25), .ZN(n21) );
  MAOI222D0 U612 ( .A(n26), .B(n27), .C(c[4]), .ZN(n25) );
  AOI22D0 U613 ( .A1(mantissa_ab[3]), .A2(n28), .B1(n29), .B2(n30), .ZN(n27)
         );
  OR2D0 U614 ( .A1(n29), .A2(n30), .Z(n28) );
  MAOI22D0 U615 ( .A1(n31), .A2(c[2]), .B1(mantissa_ab[2]), .B2(n32), .ZN(n29)
         );
  NR2D0 U616 ( .A1(c[2]), .A2(n31), .ZN(n32) );
  OAI22D0 U617 ( .A1(n33), .A2(n34), .B1(mantissa_ab[1]), .B2(n35), .ZN(n31)
         );
  INR2D0 U618 ( .A1(n33), .B1(c[1]), .ZN(n35) );
  NR2D0 U619 ( .A1(n36), .A2(c[0]), .ZN(n33) );
  NR2D0 U620 ( .A1(c[5]), .A2(n37), .ZN(n24) );
  CKND2D0 U621 ( .A1(c[7]), .A2(n19), .ZN(n17) );
  AOI31D0 U622 ( .A1(n38), .A2(n39), .A3(n40), .B(n41), .ZN(n658) );
  OAI21D0 U623 ( .A1(n42), .A2(n43), .B(n44), .ZN(n39) );
  AOI21D0 U624 ( .A1(n45), .A2(n46), .B(n47), .ZN(n42) );
  AOI21D0 U625 ( .A1(n1679), .A2(n48), .B(n49), .ZN(n633) );
  IOA21D0 U626 ( .A1(n50), .A2(n38), .B(n51), .ZN(n48) );
  CKND0 U627 ( .I(n52), .ZN(n1676) );
  NR3D0 U628 ( .A1(n53), .A2(n54), .A3(n55), .ZN(n1147) );
  MUX2ND0 U629 ( .I0(n56), .I1(n57), .S(n58), .ZN(mantissa_ab_c[9]) );
  IAO21D0 U630 ( .A1(n59), .A2(fma_byp), .B(n60), .ZN(n57) );
  CKND2D0 U631 ( .A1(n61), .A2(n59), .ZN(n56) );
  MUX2ND0 U632 ( .I0(n62), .I1(n63), .S(n64), .ZN(mantissa_ab_c[8]) );
  CKND2D0 U633 ( .A1(n61), .A2(n65), .ZN(n63) );
  IAO21D0 U634 ( .A1(n65), .A2(fma_byp), .B(n60), .ZN(n62) );
  MUX2ND0 U635 ( .I0(n66), .I1(n67), .S(n68), .ZN(mantissa_ab_c[7]) );
  CKND2D0 U636 ( .A1(n61), .A2(n69), .ZN(n67) );
  AOI21D0 U637 ( .A1(n70), .A2(n71), .B(n60), .ZN(n66) );
  MUX2ND0 U638 ( .I0(n72), .I1(n73), .S(n74), .ZN(mantissa_ab_c[6]) );
  OR2D0 U639 ( .A1(n75), .A2(n53), .Z(n73) );
  AOI21D0 U640 ( .A1(n75), .A2(n71), .B(n60), .ZN(n72) );
  MUX2ND0 U641 ( .I0(n76), .I1(n77), .S(n78), .ZN(mantissa_ab_c[5]) );
  CKND2D0 U642 ( .A1(n61), .A2(n79), .ZN(n77) );
  IAO21D0 U643 ( .A1(n79), .A2(fma_byp), .B(n60), .ZN(n76) );
  MUX2ND0 U644 ( .I0(n80), .I1(n81), .S(n82), .ZN(mantissa_ab_c[4]) );
  IND2D0 U645 ( .A1(n83), .B1(n61), .ZN(n81) );
  AOI21D0 U646 ( .A1(n83), .A2(n71), .B(n60), .ZN(n80) );
  MUX2ND0 U647 ( .I0(n84), .I1(n85), .S(n86), .ZN(mantissa_ab_c[3]) );
  CKND2D0 U648 ( .A1(n61), .A2(n87), .ZN(n85) );
  IAO21D0 U649 ( .A1(n87), .A2(fma_byp), .B(n60), .ZN(n84) );
  MUX2ND0 U650 ( .I0(n88), .I1(n89), .S(n90), .ZN(mantissa_ab_c[2]) );
  OR2D0 U651 ( .A1(n91), .A2(n53), .Z(n89) );
  AOI21D0 U652 ( .A1(n91), .A2(n71), .B(n60), .ZN(n88) );
  OAI21D0 U653 ( .A1(n92), .A2(n71), .B(n93), .ZN(mantissa_ab_c[20]) );
  MUX2ND0 U654 ( .I0(n94), .I1(n95), .S(n55), .ZN(n93) );
  MUX2ND0 U655 ( .I0(n96), .I1(n1680), .S(n5), .ZN(n55) );
  OAI21D0 U656 ( .A1(fma_byp), .A2(n54), .B(n97), .ZN(n95) );
  INR2D0 U657 ( .A1(n54), .B1(n53), .ZN(n94) );
  CKND2D0 U658 ( .A1(n98), .A2(n99), .ZN(n54) );
  MUX2ND0 U659 ( .I0(n100), .I1(n101), .S(n102), .ZN(mantissa_ab_c[1]) );
  AOI21D0 U660 ( .A1(n103), .A2(n71), .B(n60), .ZN(n101) );
  CKND2D0 U661 ( .A1(n104), .A2(n61), .ZN(n100) );
  CKND0 U662 ( .I(n53), .ZN(n61) );
  OAI21D0 U663 ( .A1(n15), .A2(n71), .B(n105), .ZN(mantissa_ab_c[19]) );
  MUX2ND0 U664 ( .I0(n106), .I1(n107), .S(n99), .ZN(n105) );
  MUX2D0 U665 ( .I0(n108), .I1(n1678), .S(n5), .Z(n99) );
  NR2D0 U666 ( .A1(n98), .A2(n53), .ZN(n107) );
  CKND0 U667 ( .I(n109), .ZN(n98) );
  OAI21D0 U668 ( .A1(fma_byp), .A2(n109), .B(n97), .ZN(n106) );
  CKND2D0 U669 ( .A1(n110), .A2(n111), .ZN(n109) );
  OAI21D0 U670 ( .A1(n14), .A2(n71), .B(n112), .ZN(mantissa_ab_c[18]) );
  MUX2ND0 U671 ( .I0(n113), .I1(n114), .S(n111), .ZN(n112) );
  MUX2ND0 U672 ( .I0(n115), .I1(n116), .S(add_byp), .ZN(n111) );
  CKXOR2D0 U673 ( .A1(n38), .A2(n50), .Z(n115) );
  OAI221D0 U674 ( .A1(n117), .A2(n44), .B1(n117), .B2(n118), .C(n119), .ZN(n50) );
  IND2D0 U675 ( .A1(n43), .B1(n120), .ZN(n118) );
  NR2D0 U676 ( .A1(n110), .A2(n53), .ZN(n114) );
  CKND0 U677 ( .I(n121), .ZN(n110) );
  OAI21D0 U678 ( .A1(fma_byp), .A2(n121), .B(n97), .ZN(n113) );
  CKND2D0 U679 ( .A1(n122), .A2(n123), .ZN(n121) );
  OAI21D0 U680 ( .A1(n124), .A2(n71), .B(n125), .ZN(mantissa_ab_c[17]) );
  MUX2ND0 U681 ( .I0(n126), .I1(n127), .S(n123), .ZN(n125) );
  MUX2ND0 U682 ( .I0(n128), .I1(n129), .S(add_byp), .ZN(n123) );
  CKXOR2D0 U683 ( .A1(n130), .A2(n40), .Z(n128) );
  NR2D0 U684 ( .A1(n122), .A2(n53), .ZN(n127) );
  CKND0 U685 ( .I(n131), .ZN(n122) );
  OAI21D0 U686 ( .A1(fma_byp), .A2(n131), .B(n97), .ZN(n126) );
  CKND2D0 U687 ( .A1(n132), .A2(n133), .ZN(n131) );
  OAI21D0 U688 ( .A1(n23), .A2(n71), .B(n134), .ZN(mantissa_ab_c[16]) );
  MUX2ND0 U689 ( .I0(n135), .I1(n136), .S(n133), .ZN(n134) );
  MUX2ND0 U690 ( .I0(n137), .I1(n138), .S(add_byp), .ZN(n133) );
  XNR2D0 U691 ( .A1(n120), .A2(n43), .ZN(n137) );
  OAI21D0 U692 ( .A1(n139), .A2(n140), .B(n141), .ZN(n120) );
  NR2D0 U693 ( .A1(n132), .A2(n53), .ZN(n136) );
  CKND0 U694 ( .I(n142), .ZN(n132) );
  OAI21D0 U695 ( .A1(fma_byp), .A2(n142), .B(n97), .ZN(n135) );
  CKND2D0 U696 ( .A1(n143), .A2(n144), .ZN(n142) );
  OAI21D0 U697 ( .A1(n22), .A2(n71), .B(n145), .ZN(mantissa_ab_c[15]) );
  MUX2ND0 U698 ( .I0(n146), .I1(n147), .S(n144), .ZN(n145) );
  MUX2D0 U699 ( .I0(n148), .I1(n149), .S(n5), .Z(n144) );
  CKXOR2D0 U700 ( .A1(n46), .A2(n139), .Z(n149) );
  CKND2D0 U701 ( .A1(n150), .A2(n140), .ZN(n46) );
  NR2D0 U702 ( .A1(n143), .A2(n53), .ZN(n147) );
  CKND0 U703 ( .I(n151), .ZN(n143) );
  OAI21D0 U704 ( .A1(fma_byp), .A2(n151), .B(n97), .ZN(n146) );
  CKND2D0 U705 ( .A1(n152), .A2(n153), .ZN(n151) );
  OAI21D0 U706 ( .A1(n154), .A2(n71), .B(n155), .ZN(mantissa_ab_c[14]) );
  MUX2ND0 U707 ( .I0(n156), .I1(n157), .S(n153), .ZN(n155) );
  MUX2D0 U708 ( .I0(n158), .I1(n159), .S(n5), .Z(n153) );
  OAI21D0 U709 ( .A1(n160), .A2(n161), .B(n140), .ZN(n159) );
  CKND2D0 U710 ( .A1(n160), .A2(n161), .ZN(n140) );
  OAI221D0 U711 ( .A1(n162), .A2(n163), .B1(n162), .B2(n164), .C(n165), .ZN(
        n161) );
  NR2D0 U712 ( .A1(n152), .A2(n53), .ZN(n157) );
  CKND0 U713 ( .I(n166), .ZN(n152) );
  OAI21D0 U714 ( .A1(fma_byp), .A2(n166), .B(n97), .ZN(n156) );
  CKND2D0 U715 ( .A1(n167), .A2(n168), .ZN(n166) );
  OAI21D0 U716 ( .A1(n30), .A2(n71), .B(n169), .ZN(mantissa_ab_c[13]) );
  MUX2ND0 U717 ( .I0(n170), .I1(n171), .S(n168), .ZN(n169) );
  MUX2ND0 U718 ( .I0(n172), .I1(n173), .S(add_byp), .ZN(n168) );
  CKXOR2D0 U719 ( .A1(n162), .A2(n174), .Z(n172) );
  NR2D0 U720 ( .A1(n167), .A2(n53), .ZN(n171) );
  CKND0 U721 ( .I(n175), .ZN(n167) );
  OAI21D0 U722 ( .A1(fma_byp), .A2(n175), .B(n97), .ZN(n170) );
  CKND2D0 U723 ( .A1(n176), .A2(n177), .ZN(n175) );
  OAI21D0 U724 ( .A1(n178), .A2(n71), .B(n179), .ZN(mantissa_ab_c[12]) );
  MUX2ND0 U725 ( .I0(n180), .I1(n181), .S(n177), .ZN(n179) );
  MUX2ND0 U726 ( .I0(n182), .I1(n183), .S(add_byp), .ZN(n177) );
  OA21D0 U727 ( .A1(n184), .A2(n185), .B(n164), .Z(n182) );
  NR2D0 U728 ( .A1(n176), .A2(n53), .ZN(n181) );
  CKND0 U729 ( .I(n186), .ZN(n176) );
  OAI21D0 U730 ( .A1(fma_byp), .A2(n186), .B(n97), .ZN(n180) );
  CKND2D0 U731 ( .A1(n187), .A2(n188), .ZN(n186) );
  OAI21D0 U732 ( .A1(n34), .A2(n71), .B(n189), .ZN(mantissa_ab_c[11]) );
  MUX2ND0 U733 ( .I0(n190), .I1(n191), .S(n188), .ZN(n189) );
  MUX2D0 U734 ( .I0(n192), .I1(n193), .S(n5), .Z(n188) );
  OAI21D0 U735 ( .A1(n194), .A2(n195), .B(n196), .ZN(n193) );
  NR2D0 U736 ( .A1(n187), .A2(n53), .ZN(n191) );
  CKND0 U737 ( .I(n197), .ZN(n187) );
  OAI21D0 U738 ( .A1(fma_byp), .A2(n197), .B(n97), .ZN(n190) );
  CKND2D0 U739 ( .A1(n198), .A2(n199), .ZN(n197) );
  OAI21D0 U740 ( .A1(n71), .A2(n200), .B(n201), .ZN(mantissa_ab_c[10]) );
  MUX2ND0 U741 ( .I0(n202), .I1(n203), .S(n199), .ZN(n201) );
  MUX2ND0 U742 ( .I0(n204), .I1(n205), .S(add_byp), .ZN(n199) );
  CKXOR2D0 U743 ( .A1(n206), .A2(n207), .Z(n204) );
  NR2D0 U744 ( .A1(n198), .A2(n53), .ZN(n203) );
  CKND2D0 U745 ( .A1(n208), .A2(n71), .ZN(n53) );
  CKXOR2D0 U746 ( .A1(n209), .A2(n210), .Z(n208) );
  AO21D0 U747 ( .A1(n71), .A2(n198), .B(n60), .Z(n202) );
  CKND0 U748 ( .I(n97), .ZN(n60) );
  MUX2ND0 U749 ( .I0(comp_mantissa_ab[21]), .I1(n211), .S(n210), .ZN(n97) );
  CKND2D0 U750 ( .A1(n212), .A2(n5), .ZN(n210) );
  CKXOR2D0 U751 ( .A1(n213), .A2(n214), .Z(n212) );
  MAOI22D0 U752 ( .A1(n634), .A2(n215), .B1(n216), .B2(n96), .ZN(n213) );
  AO21D0 U753 ( .A1(n217), .A2(n1679), .B(n49), .Z(n215) );
  NR2D0 U754 ( .A1(n108), .A2(n218), .ZN(n49) );
  AO31D0 U755 ( .A1(n38), .A2(n130), .A3(n40), .B(n41), .Z(n217) );
  OAI21D0 U756 ( .A1(n219), .A2(n119), .B(n51), .ZN(n41) );
  CKND0 U757 ( .I(n117), .ZN(n40) );
  OAI21D0 U758 ( .A1(n129), .A2(n220), .B(n119), .ZN(n117) );
  CKND2D0 U759 ( .A1(n129), .A2(n220), .ZN(n119) );
  OAI21D0 U760 ( .A1(n221), .A2(n43), .B(n44), .ZN(n130) );
  OAI21D0 U761 ( .A1(n138), .A2(n222), .B(n44), .ZN(n43) );
  CKND2D0 U762 ( .A1(n138), .A2(n222), .ZN(n44) );
  AOI31D0 U763 ( .A1(n160), .A2(n223), .A3(n45), .B(n224), .ZN(n221) );
  CKND0 U764 ( .I(n141), .ZN(n224) );
  IAO21D0 U765 ( .A1(n139), .A2(n150), .B(n47), .ZN(n141) );
  CKND0 U766 ( .I(n45), .ZN(n139) );
  AOI21D0 U767 ( .A1(n225), .A2(n148), .B(n47), .ZN(n45) );
  NR2D0 U768 ( .A1(n148), .A2(n225), .ZN(n47) );
  OAI21D0 U769 ( .A1(n174), .A2(n162), .B(n165), .ZN(n223) );
  OAI21D0 U770 ( .A1(n226), .A2(n173), .B(n165), .ZN(n162) );
  CKND2D0 U771 ( .A1(n226), .A2(n173), .ZN(n165) );
  CKND0 U772 ( .I(n227), .ZN(n226) );
  AN2D0 U773 ( .A1(n164), .A2(n163), .Z(n174) );
  CKND2D0 U774 ( .A1(n184), .A2(n185), .ZN(n164) );
  OAI21D0 U775 ( .A1(n192), .A2(n228), .B(n196), .ZN(n185) );
  CKND2D0 U776 ( .A1(n194), .A2(n195), .ZN(n196) );
  OAI21D0 U777 ( .A1(n206), .A2(n207), .B(n229), .ZN(n195) );
  OAI21D0 U778 ( .A1(n230), .A2(n205), .B(n229), .ZN(n207) );
  CKND2D0 U779 ( .A1(n205), .A2(n230), .ZN(n229) );
  MAOI22D0 U780 ( .A1(n1677), .A2(n52), .B1(n231), .B2(n232), .ZN(n206) );
  OAI21D0 U781 ( .A1(n233), .A2(n234), .B(n235), .ZN(n52) );
  CKXOR2D0 U782 ( .A1(n192), .A2(n228), .Z(n194) );
  OA21D0 U783 ( .A1(n236), .A2(n183), .B(n163), .Z(n184) );
  CKND2D0 U784 ( .A1(n236), .A2(n183), .ZN(n163) );
  CKND0 U785 ( .I(n237), .ZN(n236) );
  OA21D0 U786 ( .A1(n238), .A2(n239), .B(n150), .Z(n160) );
  CKND2D0 U787 ( .A1(n238), .A2(n239), .ZN(n150) );
  CKND0 U788 ( .I(n240), .ZN(n239) );
  CKND0 U789 ( .I(n219), .ZN(n38) );
  OAI21D0 U790 ( .A1(n116), .A2(n241), .B(n51), .ZN(n219) );
  CKND2D0 U791 ( .A1(n116), .A2(n241), .ZN(n51) );
  CKND0 U792 ( .I(n242), .ZN(n241) );
  AN2D0 U793 ( .A1(n209), .A2(n71), .Z(n211) );
  NR2D0 U794 ( .A1(n59), .A2(n58), .ZN(n198) );
  MUX2ND0 U795 ( .I0(n1675), .I1(n231), .S(add_byp), .ZN(n58) );
  IND2D0 U796 ( .A1(n65), .B1(n64), .ZN(n59) );
  MUX2ND0 U797 ( .I0(n243), .I1(n244), .S(add_byp), .ZN(n64) );
  CKXOR2D0 U798 ( .A1(n234), .A2(n233), .Z(n243) );
  OA22D0 U799 ( .A1(n245), .A2(n246), .B1(n247), .B2(n248), .Z(n233) );
  OAI21D0 U800 ( .A1(n249), .A2(n244), .B(n235), .ZN(n234) );
  CKND2D0 U801 ( .A1(n244), .A2(n249), .ZN(n235) );
  CKND0 U802 ( .I(n250), .ZN(n249) );
  CKND2D0 U803 ( .A1(n70), .A2(n68), .ZN(n65) );
  MUX2D0 U804 ( .I0(n245), .I1(n251), .S(n5), .Z(n68) );
  XNR2D0 U805 ( .A1(n247), .A2(n248), .ZN(n251) );
  XNR2D0 U806 ( .A1(n245), .A2(n246), .ZN(n248) );
  OA21D0 U807 ( .A1(n252), .A2(n253), .B(n254), .Z(n247) );
  CKND0 U808 ( .I(n69), .ZN(n70) );
  CKND2D0 U809 ( .A1(n75), .A2(n74), .ZN(n69) );
  MUX2D0 U810 ( .I0(n255), .I1(n256), .S(n5), .Z(n74) );
  XNR2D0 U811 ( .A1(n253), .A2(n252), .ZN(n256) );
  AOI21D0 U812 ( .A1(n257), .A2(n258), .B(n259), .ZN(n252) );
  OAI21D0 U813 ( .A1(n260), .A2(n261), .B(n254), .ZN(n253) );
  CKND2D0 U814 ( .A1(n260), .A2(n261), .ZN(n254) );
  CKND0 U815 ( .I(n255), .ZN(n260) );
  INR2D0 U816 ( .A1(n78), .B1(n79), .ZN(n75) );
  CKND2D0 U817 ( .A1(n83), .A2(n82), .ZN(n79) );
  MUX2ND0 U818 ( .I0(n262), .I1(n263), .S(add_byp), .ZN(n82) );
  CKXOR2D0 U819 ( .A1(n264), .A2(n265), .Z(n262) );
  INR2D0 U820 ( .A1(n86), .B1(n87), .ZN(n83) );
  CKND2D0 U821 ( .A1(n91), .A2(n90), .ZN(n87) );
  MUX2ND0 U822 ( .I0(n266), .I1(n267), .S(add_byp), .ZN(n90) );
  OA21D0 U823 ( .A1(n268), .A2(n269), .B(n270), .Z(n266) );
  NR2D0 U824 ( .A1(n102), .A2(n104), .ZN(n91) );
  CKXOR2D0 U825 ( .A1(n271), .A2(n272), .Z(n102) );
  CKND2D0 U826 ( .A1(n848), .A2(n5), .ZN(n272) );
  MUX2ND0 U827 ( .I0(n273), .I1(n274), .S(add_byp), .ZN(n86) );
  CKXOR2D0 U828 ( .A1(n275), .A2(n276), .Z(n273) );
  OAI22D0 U829 ( .A1(add_byp), .A2(n277), .B1(n257), .B2(n278), .ZN(n78) );
  AOI21D0 U830 ( .A1(n279), .A2(n280), .B(add_byp), .ZN(n278) );
  AOI31D0 U831 ( .A1(n258), .A2(n257), .A3(n279), .B(n259), .ZN(n277) );
  INR2D0 U832 ( .A1(n281), .B1(n279), .ZN(n259) );
  CKXOR2D0 U833 ( .A1(n280), .A2(n282), .Z(n281) );
  OA21D0 U834 ( .A1(n264), .A2(n265), .B(n283), .Z(n279) );
  OAI21D0 U835 ( .A1(n263), .A2(n284), .B(n283), .ZN(n265) );
  CKND2D0 U836 ( .A1(n263), .A2(n284), .ZN(n283) );
  CKND0 U837 ( .I(n285), .ZN(n263) );
  OA21D0 U838 ( .A1(n275), .A2(n276), .B(n286), .Z(n264) );
  OAI21D0 U839 ( .A1(n274), .A2(n287), .B(n286), .ZN(n276) );
  CKND2D0 U840 ( .A1(n274), .A2(n287), .ZN(n286) );
  CKND0 U841 ( .I(n288), .ZN(n287) );
  AN2D0 U842 ( .A1(n270), .A2(n289), .Z(n275) );
  CKND2D0 U843 ( .A1(n268), .A2(n269), .ZN(n270) );
  OA21D0 U844 ( .A1(n267), .A2(n290), .B(n289), .Z(n269) );
  CKND2D0 U845 ( .A1(n267), .A2(n290), .ZN(n289) );
  CKND0 U846 ( .I(n291), .ZN(n268) );
  MAOI222D0 U847 ( .A(n292), .B(n850), .C(n293), .ZN(n291) );
  MUX2ND0 U848 ( .I0(n294), .I1(n295), .S(n296), .ZN(n293) );
  NR2D0 U849 ( .A1(n8), .A2(n297), .ZN(n294) );
  NR2D0 U850 ( .A1(n298), .A2(n297), .ZN(n850) );
  CKXOR2D0 U851 ( .A1(n872), .A2(n531), .Z(n292) );
  CKND0 U852 ( .I(n282), .ZN(n257) );
  CKND0 U853 ( .I(n280), .ZN(n258) );
  NR2D0 U854 ( .A1(fma_byp), .A2(n103), .ZN(mantissa_ab_c[0]) );
  CKND0 U855 ( .I(n104), .ZN(n103) );
  XNR2D0 U856 ( .A1(n299), .A2(n297), .ZN(n104) );
  MUX2D0 U857 ( .I0(c[14]), .I1(exp_ab[4]), .S(n300), .Z(exp_ab_c[4]) );
  MUX2D0 U858 ( .I0(c[13]), .I1(exp_ab[3]), .S(n300), .Z(exp_ab_c[3]) );
  MUX2ND0 U859 ( .I0(n301), .I1(n302), .S(n300), .ZN(exp_ab_c[2]) );
  MUX2ND0 U860 ( .I0(n303), .I1(n304), .S(n300), .ZN(exp_ab_c[1]) );
  MUX2ND0 U861 ( .I0(n305), .I1(n306), .S(n300), .ZN(exp_ab_c[0]) );
  NR2D0 U862 ( .A1(fma_byp), .A2(n307), .ZN(n300) );
  NR2D0 U863 ( .A1(fma_byp), .A2(n232), .ZN(comp_mantissa_c[9]) );
  CKXOR2D0 U864 ( .A1(n905), .A2(n308), .Z(n232) );
  CKND0 U865 ( .I(n309), .ZN(n905) );
  NR2D0 U866 ( .A1(fma_byp), .A2(n250), .ZN(comp_mantissa_c[8]) );
  CKND2D0 U867 ( .A1(n310), .A2(n311), .ZN(n250) );
  MUX2ND0 U868 ( .I0(n312), .I1(n313), .S(n314), .ZN(n310) );
  NR2D0 U869 ( .A1(n315), .A2(n312), .ZN(n313) );
  NR2D0 U870 ( .A1(fma_byp), .A2(n246), .ZN(comp_mantissa_c[7]) );
  CKND2D0 U871 ( .A1(n316), .A2(n317), .ZN(n246) );
  MUX2ND0 U872 ( .I0(n318), .I1(n319), .S(n314), .ZN(n316) );
  NR2D0 U873 ( .A1(n320), .A2(n318), .ZN(n319) );
  INR2D0 U874 ( .A1(n261), .B1(fma_byp), .ZN(comp_mantissa_c[6]) );
  INR2D0 U875 ( .A1(n321), .B1(n320), .ZN(n261) );
  MUX2ND0 U876 ( .I0(n322), .I1(n323), .S(n314), .ZN(n321) );
  INR2D0 U877 ( .A1(n324), .B1(n322), .ZN(n323) );
  CKND0 U878 ( .I(n325), .ZN(n322) );
  NR2D0 U879 ( .A1(fma_byp), .A2(n280), .ZN(comp_mantissa_c[5]) );
  CKND2D0 U880 ( .A1(n326), .A2(n324), .ZN(n280) );
  MUX2ND0 U881 ( .I0(n327), .I1(n328), .S(n314), .ZN(n326) );
  NR2D0 U882 ( .A1(n327), .A2(n329), .ZN(n328) );
  CKND0 U883 ( .I(n330), .ZN(n327) );
  INR2D0 U884 ( .A1(n284), .B1(fma_byp), .ZN(comp_mantissa_c[4]) );
  INR3D0 U885 ( .A1(n331), .B1(n6), .B2(n329), .ZN(n284) );
  NR2D0 U886 ( .A1(n332), .A2(n333), .ZN(n329) );
  MUX2ND0 U887 ( .I0(n334), .I1(n335), .S(n314), .ZN(n331) );
  NR2D0 U888 ( .A1(n336), .A2(n334), .ZN(n335) );
  CKND0 U889 ( .I(n333), .ZN(n334) );
  NR2D0 U890 ( .A1(fma_byp), .A2(n288), .ZN(comp_mantissa_c[3]) );
  CKND2D0 U891 ( .A1(n337), .A2(n332), .ZN(n288) );
  MUX2ND0 U892 ( .I0(n338), .I1(n339), .S(n314), .ZN(n337) );
  NR2D0 U893 ( .A1(n338), .A2(n340), .ZN(n339) );
  INR2D0 U894 ( .A1(n290), .B1(fma_byp), .ZN(comp_mantissa_c[2]) );
  INR2D0 U895 ( .A1(n341), .B1(n340), .ZN(n290) );
  MUX2ND0 U896 ( .I0(n2), .I1(n342), .S(n343), .ZN(n341) );
  OAI21D0 U897 ( .A1(n2), .A2(n344), .B(n345), .ZN(n342) );
  NR2D0 U898 ( .A1(fma_byp), .A2(n214), .ZN(comp_mantissa_c[21]) );
  CKND2D0 U899 ( .A1(n314), .A2(n346), .ZN(n214) );
  IND4D0 U900 ( .A1(n1673), .B1(n347), .B2(n348), .B3(n349), .ZN(n346) );
  MUX2ND0 U901 ( .I0(n216), .I1(n92), .S(fma_byp), .ZN(comp_mantissa_c[20]) );
  XNR2D0 U902 ( .A1(n946), .A2(n1673), .ZN(n216) );
  AOI211D0 U903 ( .A1(n350), .A2(exp_ab_greater), .B(n351), .C(n92), .ZN(n1673) );
  AO21D0 U904 ( .A1(n314), .A2(n1674), .B(n951), .Z(n946) );
  NR2D0 U905 ( .A1(fma_byp), .A2(n352), .ZN(comp_mantissa_c[1]) );
  CKXOR2D0 U906 ( .A1(n872), .A2(n344), .Z(n352) );
  CKND0 U907 ( .I(n345), .ZN(n872) );
  CKND2D0 U908 ( .A1(n299), .A2(c[15]), .ZN(n345) );
  NR2D0 U909 ( .A1(n298), .A2(add_byp), .ZN(n299) );
  MUX2ND0 U910 ( .I0(n218), .I1(n15), .S(fma_byp), .ZN(comp_mantissa_c[19]) );
  XNR2D0 U911 ( .A1(n951), .A2(n1674), .ZN(n218) );
  CKND0 U912 ( .I(n349), .ZN(n1674) );
  CKND2D0 U913 ( .A1(n353), .A2(n354), .ZN(n349) );
  MUX2ND0 U914 ( .I0(n15), .I1(n355), .S(exp_ab_greater), .ZN(n353) );
  AOI21D0 U915 ( .A1(n348), .A2(n347), .B(n2), .ZN(n951) );
  MUX2ND0 U916 ( .I0(n242), .I1(n14), .S(fma_byp), .ZN(comp_mantissa_c[18]) );
  MUX2ND0 U917 ( .I0(n356), .I1(n357), .S(n348), .ZN(n242) );
  CKND2D0 U918 ( .A1(n358), .A2(n354), .ZN(n348) );
  MUX2ND0 U919 ( .I0(n14), .I1(n359), .S(exp_ab_greater), .ZN(n358) );
  OAI21D0 U920 ( .A1(n2), .A2(n360), .B(n361), .ZN(n357) );
  OR2D0 U921 ( .A1(n347), .A2(n2), .Z(n356) );
  INR3D0 U922 ( .A1(n360), .B1(n362), .B2(n363), .ZN(n347) );
  MUX2D0 U923 ( .I0(c[7]), .I1(n220), .S(n71), .Z(comp_mantissa_c[17]) );
  CKXOR2D0 U924 ( .A1(n361), .A2(n360), .Z(n220) );
  CKND2D0 U925 ( .A1(n364), .A2(n354), .ZN(n360) );
  MUX2ND0 U926 ( .I0(n124), .I1(n365), .S(exp_ab_greater), .ZN(n364) );
  OAI21D0 U927 ( .A1(n362), .A2(n363), .B(n314), .ZN(n361) );
  MUX2D0 U928 ( .I0(c[6]), .I1(n222), .S(n71), .Z(comp_mantissa_c[16]) );
  XNR2D0 U929 ( .A1(n362), .A2(n366), .ZN(n222) );
  CKND2D0 U930 ( .A1(n314), .A2(n363), .ZN(n366) );
  MUX2D0 U931 ( .I0(n367), .I1(c[6]), .S(n6), .Z(n362) );
  NR3D0 U932 ( .A1(n368), .A2(exp_diff[4]), .A3(exp_diff[3]), .ZN(n367) );
  MUX2ND0 U933 ( .I0(n225), .I1(n22), .S(fma_byp), .ZN(comp_mantissa_c[15]) );
  CKND2D0 U934 ( .A1(n369), .A2(n363), .ZN(n225) );
  CKND2D0 U935 ( .A1(n370), .A2(n371), .ZN(n363) );
  MUX2ND0 U936 ( .I0(n371), .I1(n372), .S(n314), .ZN(n369) );
  NR2D0 U937 ( .A1(n370), .A2(n371), .ZN(n372) );
  CKND0 U938 ( .I(n373), .ZN(n370) );
  MUX2D0 U939 ( .I0(n374), .I1(n22), .S(n6), .Z(n371) );
  OA22D0 U940 ( .A1(n375), .A2(n355), .B1(n376), .B2(n377), .Z(n374) );
  MUX2ND0 U941 ( .I0(n240), .I1(n154), .S(fma_byp), .ZN(comp_mantissa_c[14])
         );
  CKND2D0 U942 ( .A1(n378), .A2(n373), .ZN(n240) );
  CKND2D0 U943 ( .A1(n379), .A2(n380), .ZN(n373) );
  MUX2ND0 U944 ( .I0(n380), .I1(n381), .S(n314), .ZN(n378) );
  NR2D0 U945 ( .A1(n379), .A2(n380), .ZN(n381) );
  CKND0 U946 ( .I(n382), .ZN(n379) );
  MUX2D0 U947 ( .I0(n383), .I1(n154), .S(n6), .Z(n380) );
  OA22D0 U948 ( .A1(n376), .A2(n384), .B1(n375), .B2(n359), .Z(n383) );
  MUX2ND0 U949 ( .I0(n227), .I1(n30), .S(fma_byp), .ZN(comp_mantissa_c[13]) );
  CKND2D0 U950 ( .A1(n385), .A2(n382), .ZN(n227) );
  CKND2D0 U951 ( .A1(n386), .A2(n387), .ZN(n382) );
  MUX2ND0 U952 ( .I0(n387), .I1(n388), .S(n314), .ZN(n385) );
  NR2D0 U953 ( .A1(n386), .A2(n387), .ZN(n388) );
  CKND0 U954 ( .I(n389), .ZN(n386) );
  MUX2ND0 U955 ( .I0(c[3]), .I1(n390), .S(exp_ab_greater), .ZN(n387) );
  OAI22D0 U956 ( .A1(n365), .A2(n375), .B1(n391), .B2(n376), .ZN(n390) );
  MUX2ND0 U957 ( .I0(n237), .I1(n178), .S(fma_byp), .ZN(comp_mantissa_c[12])
         );
  CKND2D0 U958 ( .A1(n392), .A2(n389), .ZN(n237) );
  CKND2D0 U959 ( .A1(n393), .A2(n394), .ZN(n389) );
  MUX2ND0 U960 ( .I0(n394), .I1(n395), .S(n314), .ZN(n392) );
  NR2D0 U961 ( .A1(n393), .A2(n394), .ZN(n395) );
  CKND0 U962 ( .I(n396), .ZN(n393) );
  OAI22D0 U963 ( .A1(exp_ab_greater), .A2(c[2]), .B1(n397), .B2(n398), .ZN(
        n394) );
  OAI32D0 U964 ( .A1(n350), .A2(n92), .A3(n399), .B1(n400), .B2(n375), .ZN(
        n398) );
  AOI21D0 U965 ( .A1(n401), .A2(exp_ab_greater), .B(n351), .ZN(n397) );
  MUX2ND0 U966 ( .I0(n228), .I1(n34), .S(fma_byp), .ZN(comp_mantissa_c[11]) );
  CKND2D0 U967 ( .A1(n402), .A2(n396), .ZN(n228) );
  CKND2D0 U968 ( .A1(n403), .A2(n404), .ZN(n396) );
  MUX2ND0 U969 ( .I0(n404), .I1(n405), .S(n314), .ZN(n402) );
  NR2D0 U970 ( .A1(n403), .A2(n404), .ZN(n405) );
  OAI21D0 U971 ( .A1(exp_ab_greater), .A2(c[1]), .B(n406), .ZN(n404) );
  OAI222D0 U972 ( .A1(n377), .A2(n375), .B1(n355), .B2(n399), .C1(n407), .C2(
        n351), .ZN(n406) );
  NR2D0 U973 ( .A1(n6), .A2(n408), .ZN(n407) );
  MUX2D0 U974 ( .I0(c[0]), .I1(n230), .S(n71), .Z(comp_mantissa_c[10]) );
  INR2D0 U975 ( .A1(n409), .B1(n403), .ZN(n230) );
  INR3D0 U976 ( .A1(n410), .B1(n906), .B2(n311), .ZN(n403) );
  CKND0 U977 ( .I(n308), .ZN(n906) );
  MUX2ND0 U978 ( .I0(n411), .I1(n2), .S(n410), .ZN(n409) );
  OAI21D0 U979 ( .A1(exp_ab_greater), .A2(c[0]), .B(n412), .ZN(n410) );
  OAI222D0 U980 ( .A1(n384), .A2(n375), .B1(n359), .B2(n399), .C1(n413), .C2(
        n351), .ZN(n412) );
  CKND0 U981 ( .I(n354), .ZN(n351) );
  CKND2D0 U982 ( .A1(exp_ab_greater), .A2(n376), .ZN(n354) );
  NR2D0 U983 ( .A1(n6), .A2(n414), .ZN(n413) );
  OAI21D0 U984 ( .A1(n2), .A2(n308), .B(n309), .ZN(n411) );
  CKND2D0 U985 ( .A1(n314), .A2(n311), .ZN(n309) );
  CKND2D0 U986 ( .A1(n315), .A2(n312), .ZN(n311) );
  CKND2D0 U987 ( .A1(exp_ab_greater), .A2(n415), .ZN(n312) );
  OAI222D0 U988 ( .A1(n416), .A2(n376), .B1(n368), .B2(n417), .C1(n401), .C2(
        n375), .ZN(n415) );
  CKND2D0 U989 ( .A1(exp_diff[3]), .A2(n418), .ZN(n417) );
  CKND0 U990 ( .I(n317), .ZN(n315) );
  CKND2D0 U991 ( .A1(n320), .A2(n318), .ZN(n317) );
  CKND2D0 U992 ( .A1(exp_ab_greater), .A2(n419), .ZN(n318) );
  OAI221D0 U993 ( .A1(n420), .A2(n375), .B1(n377), .B2(n399), .C(n421), .ZN(
        n419) );
  OA32D0 U994 ( .A1(n422), .A2(n200), .A3(n376), .B1(n423), .B2(n355), .Z(n421) );
  AOI21D0 U995 ( .A1(n325), .A2(exp_ab_greater), .B(n324), .ZN(n320) );
  CKND2D0 U996 ( .A1(n336), .A2(n424), .ZN(n324) );
  OAI21D0 U997 ( .A1(n330), .A2(n333), .B(exp_ab_greater), .ZN(n424) );
  OAI221D0 U998 ( .A1(n401), .A2(n399), .B1(n400), .B2(n423), .C(n425), .ZN(
        n333) );
  OA32D0 U999 ( .A1(n350), .A2(n92), .A3(n426), .B1(n375), .B2(n416), .Z(n425)
         );
  OAI222D0 U1000 ( .A1(n391), .A2(n399), .B1(n427), .B2(n375), .C1(n365), .C2(
        n423), .ZN(n330) );
  CKND0 U1001 ( .I(n332), .ZN(n336) );
  OAI21D0 U1002 ( .A1(n338), .A2(n6), .B(n340), .ZN(n332) );
  AOI211D0 U1003 ( .A1(n343), .A2(exp_ab_greater), .B(n531), .C(n428), .ZN(
        n340) );
  CKND0 U1004 ( .I(n298), .ZN(n428) );
  CKND0 U1005 ( .I(n344), .ZN(n531) );
  CKND2D0 U1006 ( .A1(exp_ab_greater), .A2(n429), .ZN(n344) );
  OAI222D0 U1007 ( .A1(n391), .A2(n423), .B1(n427), .B2(n399), .C1(n365), .C2(
        n426), .ZN(n429) );
  OAI222D0 U1008 ( .A1(n430), .A2(n399), .B1(n359), .B2(n426), .C1(n384), .C2(
        n423), .ZN(n343) );
  OA221D0 U1009 ( .A1(n420), .A2(n399), .B1(n377), .B2(n423), .C(n431), .Z(
        n338) );
  OA32D0 U1010 ( .A1(n422), .A2(n200), .A3(n375), .B1(n426), .B2(n355), .Z(
        n431) );
  AOI22D0 U1011 ( .A1(c[9]), .A2(n432), .B1(n433), .B2(n434), .ZN(n355) );
  ND3D0 U1012 ( .A1(n435), .A2(n436), .A3(exp_diff[4]), .ZN(n426) );
  OA221D0 U1013 ( .A1(n22), .A2(n350), .B1(n14), .B2(n422), .C(n437), .Z(n377)
         );
  AOI22D0 U1014 ( .A1(n438), .A2(c[7]), .B1(n434), .B2(c[6]), .ZN(n437) );
  CKND0 U1015 ( .I(n408), .ZN(n420) );
  OAI221D0 U1016 ( .A1(n34), .A2(n350), .B1(n154), .B2(n422), .C(n439), .ZN(
        n408) );
  AOI22D0 U1017 ( .A1(n438), .A2(c[3]), .B1(n434), .B2(c[2]), .ZN(n439) );
  CKND0 U1018 ( .I(c[1]), .ZN(n34) );
  OAI222D0 U1019 ( .A1(n359), .A2(n423), .B1(n430), .B2(n375), .C1(n384), .C2(
        n399), .ZN(n325) );
  OA221D0 U1020 ( .A1(n154), .A2(n350), .B1(n124), .B2(n422), .C(n440), .Z(
        n384) );
  AOI22D0 U1021 ( .A1(n438), .A2(c[6]), .B1(n434), .B2(c[5]), .ZN(n440) );
  CKND0 U1022 ( .I(c[4]), .ZN(n154) );
  CKND0 U1023 ( .I(n414), .ZN(n430) );
  OAI221D0 U1024 ( .A1(n200), .A2(n350), .B1(n30), .B2(n422), .C(n441), .ZN(
        n414) );
  AOI22D0 U1025 ( .A1(n438), .A2(c[2]), .B1(n434), .B2(c[1]), .ZN(n441) );
  CKND0 U1026 ( .I(c[3]), .ZN(n30) );
  CKND0 U1027 ( .I(c[0]), .ZN(n200) );
  AOI222D0 U1028 ( .A1(c[8]), .A2(n432), .B1(n433), .B2(n438), .C1(c[9]), .C2(
        n434), .ZN(n359) );
  CKND0 U1029 ( .I(n2), .ZN(n314) );
  CKND2D0 U1030 ( .A1(exp_ab_greater), .A2(n442), .ZN(n308) );
  OAI222D0 U1031 ( .A1(n391), .A2(n375), .B1(n427), .B2(n376), .C1(n365), .C2(
        n399), .ZN(n442) );
  OA221D0 U1032 ( .A1(n92), .A2(n422), .B1(n124), .B2(n350), .C(n443), .Z(n365) );
  AOI22D0 U1033 ( .A1(n434), .A2(c[8]), .B1(n438), .B2(c[9]), .ZN(n443) );
  CKND0 U1034 ( .I(c[7]), .ZN(n124) );
  CKND0 U1035 ( .I(n433), .ZN(n92) );
  ND3D0 U1036 ( .A1(n436), .A2(n418), .A3(n435), .ZN(n376) );
  AOI222D0 U1037 ( .A1(c[2]), .A2(n444), .B1(n434), .B2(c[0]), .C1(c[1]), .C2(
        n438), .ZN(n427) );
  ND3D0 U1038 ( .A1(n436), .A2(n418), .A3(exp_diff[2]), .ZN(n375) );
  OA221D0 U1039 ( .A1(n23), .A2(n422), .B1(n22), .B2(n445), .C(n446), .Z(n391)
         );
  AOI22D0 U1040 ( .A1(n432), .A2(c[3]), .B1(n434), .B2(c[4]), .ZN(n446) );
  CKND0 U1041 ( .I(c[6]), .ZN(n23) );
  CKND2D0 U1042 ( .A1(c[15]), .A2(n5), .ZN(n2) );
  CKND0 U1043 ( .I(add_byp), .ZN(n5) );
  NR2D0 U1044 ( .A1(fma_byp), .A2(n298), .ZN(comp_mantissa_c[0]) );
  CKND2D0 U1045 ( .A1(exp_ab_greater), .A2(n447), .ZN(n298) );
  OAI222D0 U1046 ( .A1(n416), .A2(n399), .B1(n368), .B2(n448), .C1(n401), .C2(
        n423), .ZN(n447) );
  ND3D0 U1047 ( .A1(exp_diff[3]), .A2(n418), .A3(exp_diff[2]), .ZN(n423) );
  OA221D0 U1048 ( .A1(n178), .A2(n350), .B1(n22), .B2(n422), .C(n449), .Z(n401) );
  AOI22D0 U1049 ( .A1(n438), .A2(c[4]), .B1(n434), .B2(c[3]), .ZN(n449) );
  CKND0 U1050 ( .I(c[5]), .ZN(n22) );
  CKND0 U1051 ( .I(n432), .ZN(n350) );
  CKND0 U1052 ( .I(c[2]), .ZN(n178) );
  CKND2D0 U1053 ( .A1(exp_diff[4]), .A2(n436), .ZN(n448) );
  CKND0 U1054 ( .I(exp_diff[3]), .ZN(n436) );
  MUX2D0 U1055 ( .I0(n450), .I1(n400), .S(n435), .Z(n368) );
  OA221D0 U1056 ( .A1(n15), .A2(n422), .B1(n14), .B2(n445), .C(n451), .Z(n400)
         );
  AOI22D0 U1057 ( .A1(n432), .A2(c[6]), .B1(n434), .B2(c[7]), .ZN(n451) );
  NR2D0 U1058 ( .A1(n452), .A2(exp_diff[1]), .ZN(n434) );
  CKND0 U1059 ( .I(c[8]), .ZN(n14) );
  CKND0 U1060 ( .I(c[9]), .ZN(n15) );
  CKND2D0 U1061 ( .A1(n432), .A2(n433), .ZN(n450) );
  ND4D0 U1062 ( .A1(n305), .A2(n303), .A3(n453), .A4(n301), .ZN(n433) );
  CKND0 U1063 ( .I(c[12]), .ZN(n301) );
  NR2D0 U1064 ( .A1(c[14]), .A2(c[13]), .ZN(n453) );
  CKND0 U1065 ( .I(c[11]), .ZN(n303) );
  CKND0 U1066 ( .I(c[10]), .ZN(n305) );
  NR2D0 U1067 ( .A1(exp_diff[0]), .A2(exp_diff[1]), .ZN(n432) );
  ND3D0 U1068 ( .A1(n435), .A2(n418), .A3(exp_diff[3]), .ZN(n399) );
  CKND0 U1069 ( .I(exp_diff[4]), .ZN(n418) );
  CKND0 U1070 ( .I(exp_diff[2]), .ZN(n435) );
  AOI22D0 U1071 ( .A1(c[1]), .A2(n444), .B1(c[0]), .B2(n438), .ZN(n416) );
  CKND0 U1072 ( .I(n445), .ZN(n438) );
  CKND2D0 U1073 ( .A1(exp_diff[1]), .A2(n452), .ZN(n445) );
  CKND0 U1074 ( .I(exp_diff[0]), .ZN(n452) );
  CKND0 U1075 ( .I(n422), .ZN(n444) );
  CKND2D0 U1076 ( .A1(exp_diff[1]), .A2(exp_diff[0]), .ZN(n422) );
  MUX2ND0 U1077 ( .I0(n231), .I1(n13), .S(fma_byp), .ZN(comp_mantissa_ab[9])
         );
  CKND0 U1078 ( .I(mantissa_ab[9]), .ZN(n13) );
  CKXOR2D0 U1079 ( .A1(n1063), .A2(n454), .Z(n231) );
  CKND0 U1080 ( .I(n455), .ZN(n1063) );
  MUX2D0 U1081 ( .I0(mantissa_ab[8]), .I1(n244), .S(n71), .Z(
        comp_mantissa_ab[8]) );
  AN2D0 U1082 ( .A1(n456), .A2(n457), .Z(n244) );
  MUX2ND0 U1083 ( .I0(n458), .I1(n459), .S(sign_ab), .ZN(n456) );
  NR2D0 U1084 ( .A1(n460), .A2(n458), .ZN(n459) );
  MUX2ND0 U1085 ( .I0(n245), .I1(n19), .S(fma_byp), .ZN(comp_mantissa_ab[7])
         );
  CKND0 U1086 ( .I(mantissa_ab[7]), .ZN(n19) );
  CKND2D0 U1087 ( .A1(n461), .A2(n462), .ZN(n245) );
  MUX2ND0 U1088 ( .I0(n463), .I1(n464), .S(sign_ab), .ZN(n461) );
  NR2D0 U1089 ( .A1(n465), .A2(n463), .ZN(n464) );
  MUX2ND0 U1090 ( .I0(n255), .I1(n20), .S(fma_byp), .ZN(comp_mantissa_ab[6])
         );
  CKND0 U1091 ( .I(mantissa_ab[6]), .ZN(n20) );
  CKND2D0 U1092 ( .A1(n466), .A2(n467), .ZN(n255) );
  MUX2ND0 U1093 ( .I0(n468), .I1(n469), .S(sign_ab), .ZN(n466) );
  NR2D0 U1094 ( .A1(n470), .A2(n468), .ZN(n469) );
  MUX2ND0 U1095 ( .I0(n282), .I1(n37), .S(fma_byp), .ZN(comp_mantissa_ab[5])
         );
  CKND0 U1096 ( .I(mantissa_ab[5]), .ZN(n37) );
  CKND2D0 U1097 ( .A1(n471), .A2(n472), .ZN(n282) );
  MUX2ND0 U1098 ( .I0(n473), .I1(n474), .S(sign_ab), .ZN(n471) );
  NR2D0 U1099 ( .A1(n475), .A2(n473), .ZN(n474) );
  MUX2ND0 U1100 ( .I0(n285), .I1(n26), .S(fma_byp), .ZN(comp_mantissa_ab[4])
         );
  CKND0 U1101 ( .I(mantissa_ab[4]), .ZN(n26) );
  CKND2D0 U1102 ( .A1(n476), .A2(n477), .ZN(n285) );
  MUX2ND0 U1103 ( .I0(n478), .I1(n479), .S(sign_ab), .ZN(n476) );
  NR2D0 U1104 ( .A1(n480), .A2(n478), .ZN(n479) );
  MUX2D0 U1105 ( .I0(mantissa_ab[3]), .I1(n274), .S(n71), .Z(
        comp_mantissa_ab[3]) );
  INR2D0 U1106 ( .A1(n481), .B1(n480), .ZN(n274) );
  MUX2ND0 U1107 ( .I0(n482), .I1(n483), .S(sign_ab), .ZN(n481) );
  NR2D0 U1108 ( .A1(n484), .A2(n482), .ZN(n483) );
  MUX2D0 U1109 ( .I0(mantissa_ab[2]), .I1(n267), .S(n71), .Z(
        comp_mantissa_ab[2]) );
  INR2D0 U1110 ( .A1(n485), .B1(n484), .ZN(n267) );
  MUX2ND0 U1111 ( .I0(n486), .I1(n8), .S(n487), .ZN(n485) );
  NR2D0 U1112 ( .A1(n209), .A2(fma_byp), .ZN(comp_mantissa_ab[21]) );
  OAI31D0 U1113 ( .A1(n488), .A2(n530), .A3(n532), .B(sign_ab), .ZN(n209) );
  CKND0 U1114 ( .I(n489), .ZN(n530) );
  MUX2ND0 U1115 ( .I0(n96), .I1(n490), .S(fma_byp), .ZN(comp_mantissa_ab[20])
         );
  CKND0 U1116 ( .I(N800), .ZN(n490) );
  XNR2D0 U1117 ( .A1(n1103), .A2(n532), .ZN(n96) );
  MUX2D0 U1118 ( .I0(N800), .I1(N65), .S(n307), .Z(n532) );
  OAI21D0 U1119 ( .A1(n8), .A2(n489), .B(n491), .ZN(n1103) );
  MUX2ND0 U1120 ( .I0(n271), .I1(n492), .S(fma_byp), .ZN(comp_mantissa_ab[1])
         );
  CKND0 U1121 ( .I(mantissa_ab[1]), .ZN(n492) );
  MUX2ND0 U1122 ( .I0(n493), .I1(n486), .S(n296), .ZN(n271) );
  CKND0 U1123 ( .I(n295), .ZN(n486) );
  CKND2D0 U1124 ( .A1(sign_ab), .A2(n494), .ZN(n295) );
  IND2D0 U1125 ( .A1(n297), .B1(sign_ab), .ZN(n493) );
  MUX2ND0 U1126 ( .I0(n108), .I1(n495), .S(fma_byp), .ZN(comp_mantissa_ab[19])
         );
  CKND0 U1127 ( .I(mantissa_ab[19]), .ZN(n495) );
  CKXOR2D0 U1128 ( .A1(n529), .A2(n489), .Z(n108) );
  MUX2ND0 U1129 ( .I0(mantissa_ab[19]), .I1(N64), .S(n307), .ZN(n489) );
  CKND0 U1130 ( .I(n491), .ZN(n529) );
  CKND2D0 U1131 ( .A1(sign_ab), .A2(n488), .ZN(n491) );
  ND3D0 U1132 ( .A1(n496), .A2(n497), .A3(n498), .ZN(n488) );
  MUX2D0 U1133 ( .I0(mantissa_ab[18]), .I1(n116), .S(n71), .Z(
        comp_mantissa_ab[18]) );
  XNR2D0 U1134 ( .A1(n499), .A2(n497), .ZN(n116) );
  MUX2ND0 U1135 ( .I0(mantissa_ab[18]), .I1(N63), .S(n307), .ZN(n497) );
  AOI21D0 U1136 ( .A1(n498), .A2(n496), .B(n8), .ZN(n499) );
  MUX2D0 U1137 ( .I0(mantissa_ab[17]), .I1(n129), .S(n71), .Z(
        comp_mantissa_ab[17]) );
  XNR2D0 U1138 ( .A1(n500), .A2(n496), .ZN(n129) );
  MUX2ND0 U1139 ( .I0(mantissa_ab[17]), .I1(N62), .S(n307), .ZN(n496) );
  NR2D0 U1140 ( .A1(n498), .A2(n8), .ZN(n500) );
  INR2D0 U1141 ( .A1(n501), .B1(n502), .ZN(n498) );
  MUX2D0 U1142 ( .I0(mantissa_ab[16]), .I1(n138), .S(n71), .Z(
        comp_mantissa_ab[16]) );
  XNR2D0 U1143 ( .A1(n503), .A2(n501), .ZN(n138) );
  MUX2ND0 U1144 ( .I0(mantissa_ab[16]), .I1(N61), .S(n307), .ZN(n501) );
  INR2D0 U1145 ( .A1(n502), .B1(n8), .ZN(n503) );
  MUX2ND0 U1146 ( .I0(n148), .I1(n504), .S(fma_byp), .ZN(comp_mantissa_ab[15])
         );
  CKND0 U1147 ( .I(mantissa_ab[15]), .ZN(n504) );
  CKND2D0 U1148 ( .A1(n505), .A2(n502), .ZN(n148) );
  CKND2D0 U1149 ( .A1(n506), .A2(n507), .ZN(n502) );
  MUX2ND0 U1150 ( .I0(n507), .I1(n508), .S(sign_ab), .ZN(n505) );
  NR2D0 U1151 ( .A1(n506), .A2(n507), .ZN(n508) );
  CKND0 U1152 ( .I(n509), .ZN(n506) );
  MUX2ND0 U1153 ( .I0(N60), .I1(mantissa_ab[15]), .S(n12), .ZN(n507) );
  MUX2D0 U1154 ( .I0(mantissa_ab[14]), .I1(n238), .S(n71), .Z(
        comp_mantissa_ab[14]) );
  CKND0 U1155 ( .I(n158), .ZN(n238) );
  CKND2D0 U1156 ( .A1(n510), .A2(n509), .ZN(n158) );
  CKND2D0 U1157 ( .A1(n511), .A2(n512), .ZN(n509) );
  MUX2ND0 U1158 ( .I0(n512), .I1(n513), .S(sign_ab), .ZN(n510) );
  NR2D0 U1159 ( .A1(n511), .A2(n512), .ZN(n513) );
  AN2D0 U1160 ( .A1(n514), .A2(n515), .Z(n511) );
  MUX2ND0 U1161 ( .I0(N59), .I1(mantissa_ab[14]), .S(n12), .ZN(n512) );
  MUX2D0 U1162 ( .I0(mantissa_ab[13]), .I1(n173), .S(n71), .Z(
        comp_mantissa_ab[13]) );
  XNR2D0 U1163 ( .A1(n516), .A2(n515), .ZN(n173) );
  MUX2ND0 U1164 ( .I0(mantissa_ab[13]), .I1(N58), .S(n307), .ZN(n515) );
  NR2D0 U1165 ( .A1(n514), .A2(n8), .ZN(n516) );
  INR2D0 U1166 ( .A1(n517), .B1(n518), .ZN(n514) );
  MUX2D0 U1167 ( .I0(mantissa_ab[12]), .I1(n183), .S(n71), .Z(
        comp_mantissa_ab[12]) );
  XNR2D0 U1168 ( .A1(n519), .A2(n517), .ZN(n183) );
  MUX2ND0 U1169 ( .I0(mantissa_ab[12]), .I1(N57), .S(n307), .ZN(n517) );
  INR2D0 U1170 ( .A1(n518), .B1(n8), .ZN(n519) );
  MUX2ND0 U1171 ( .I0(n192), .I1(n520), .S(fma_byp), .ZN(comp_mantissa_ab[11])
         );
  CKND0 U1172 ( .I(mantissa_ab[11]), .ZN(n520) );
  CKND2D0 U1173 ( .A1(n521), .A2(n518), .ZN(n192) );
  CKND2D0 U1174 ( .A1(n522), .A2(n523), .ZN(n518) );
  MUX2ND0 U1175 ( .I0(n523), .I1(n524), .S(sign_ab), .ZN(n521) );
  NR2D0 U1176 ( .A1(n522), .A2(n523), .ZN(n524) );
  MUX2ND0 U1177 ( .I0(N56), .I1(mantissa_ab[11]), .S(n12), .ZN(n523) );
  MUX2D0 U1178 ( .I0(mantissa_ab[10]), .I1(n205), .S(n71), .Z(
        comp_mantissa_ab[10]) );
  CKND0 U1179 ( .I(fma_byp), .ZN(n71) );
  INR2D0 U1180 ( .A1(n525), .B1(n522), .ZN(n205) );
  INR3D0 U1181 ( .A1(n526), .B1(n1672), .B2(n457), .ZN(n522) );
  CKND0 U1182 ( .I(n454), .ZN(n1672) );
  MUX2ND0 U1183 ( .I0(n527), .I1(n8), .S(n526), .ZN(n525) );
  MUX2ND0 U1184 ( .I0(N55), .I1(mantissa_ab[10]), .S(n12), .ZN(n526) );
  OAI21D0 U1185 ( .A1(n454), .A2(n8), .B(n455), .ZN(n527) );
  CKND2D0 U1186 ( .A1(sign_ab), .A2(n457), .ZN(n455) );
  CKND2D0 U1187 ( .A1(n460), .A2(n458), .ZN(n457) );
  MUX2ND0 U1188 ( .I0(N53), .I1(mantissa_ab[8]), .S(n12), .ZN(n458) );
  CKND0 U1189 ( .I(n462), .ZN(n460) );
  CKND2D0 U1190 ( .A1(n465), .A2(n463), .ZN(n462) );
  MUX2ND0 U1191 ( .I0(N52), .I1(mantissa_ab[7]), .S(n12), .ZN(n463) );
  CKND0 U1192 ( .I(n467), .ZN(n465) );
  CKND2D0 U1193 ( .A1(n470), .A2(n468), .ZN(n467) );
  MUX2ND0 U1194 ( .I0(N51), .I1(mantissa_ab[6]), .S(n12), .ZN(n468) );
  CKND0 U1195 ( .I(n472), .ZN(n470) );
  CKND2D0 U1196 ( .A1(n475), .A2(n473), .ZN(n472) );
  MUX2ND0 U1197 ( .I0(N50), .I1(mantissa_ab[5]), .S(n12), .ZN(n473) );
  CKND0 U1198 ( .I(n477), .ZN(n475) );
  CKND2D0 U1199 ( .A1(n480), .A2(n478), .ZN(n477) );
  MUX2ND0 U1200 ( .I0(N49), .I1(mantissa_ab[4]), .S(n12), .ZN(n478) );
  AN2D0 U1201 ( .A1(n484), .A2(n482), .Z(n480) );
  MUX2ND0 U1202 ( .I0(N48), .I1(mantissa_ab[3]), .S(n12), .ZN(n482) );
  INR2D0 U1203 ( .A1(n487), .B1(n494), .ZN(n484) );
  CKND2D0 U1218 ( .A1(n297), .A2(n296), .ZN(n494) );
  MUX2ND0 U1219 ( .I0(N46), .I1(mantissa_ab[1]), .S(n12), .ZN(n296) );
  MUX2ND0 U1220 ( .I0(N47), .I1(mantissa_ab[2]), .S(n12), .ZN(n487) );
  CKND0 U1221 ( .I(sign_ab), .ZN(n8) );
  MUX2ND0 U1222 ( .I0(mantissa_ab[9]), .I1(N54), .S(n307), .ZN(n454) );
  MUX2ND0 U1223 ( .I0(n297), .I1(n36), .S(fma_byp), .ZN(comp_mantissa_ab[0])
         );
  CKND0 U1224 ( .I(mantissa_ab[0]), .ZN(n36) );
  MUX2ND0 U1225 ( .I0(mantissa_ab[0]), .I1(N45), .S(n307), .ZN(n297) );
  CKND0 U1226 ( .I(n12), .ZN(n307) );
  CKND2D0 U1227 ( .A1(exp_ab_less), .A2(n6), .ZN(n12) );
  CKND0 U1228 ( .I(exp_ab_greater), .ZN(n6) );
  ND4D0 U1229 ( .A1(n306), .A2(n304), .A3(n528), .A4(n302), .ZN(N800) );
  CKND0 U1230 ( .I(exp_ab[2]), .ZN(n302) );
  NR2D0 U1231 ( .A1(exp_ab[4]), .A2(exp_ab[3]), .ZN(n528) );
  CKND0 U1232 ( .I(exp_ab[1]), .ZN(n304) );
  CKND0 U1233 ( .I(exp_ab[0]), .ZN(n306) );
endmodule


module fma_normalizer_rounder_DW01_ash_0 ( A, DATA_TC, SH, SH_TC, B );
  input [19:0] A;
  input [4:0] SH;
  output [19:0] B;
  input DATA_TC, SH_TC;
  wire   \ML_int[1][19] , \ML_int[1][18] , \ML_int[1][17] , \ML_int[1][16] ,
         \ML_int[1][15] , \ML_int[1][14] , \ML_int[1][13] , \ML_int[1][12] ,
         \ML_int[1][11] , \ML_int[1][10] , \ML_int[1][9] , \ML_int[1][8] ,
         \ML_int[1][7] , \ML_int[1][6] , \ML_int[1][5] , \ML_int[1][4] ,
         \ML_int[1][3] , \ML_int[1][2] , \ML_int[1][1] , \ML_int[1][0] ,
         \ML_int[2][19] , \ML_int[2][18] , \ML_int[2][17] , \ML_int[2][16] ,
         \ML_int[2][15] , \ML_int[2][14] , \ML_int[2][13] , \ML_int[2][12] ,
         \ML_int[2][11] , \ML_int[2][10] , \ML_int[2][9] , \ML_int[2][8] ,
         \ML_int[2][7] , \ML_int[2][6] , \ML_int[2][5] , \ML_int[2][4] ,
         \ML_int[2][3] , \ML_int[2][2] , \ML_int[2][1] , \ML_int[2][0] ,
         \ML_int[3][19] , \ML_int[3][18] , \ML_int[3][17] , \ML_int[3][16] ,
         \ML_int[3][15] , \ML_int[3][14] , \ML_int[3][13] , \ML_int[3][12] ,
         \ML_int[3][11] , \ML_int[3][10] , \ML_int[3][9] , \ML_int[3][8] ,
         \ML_int[3][7] , \ML_int[3][6] , \ML_int[3][5] , \ML_int[3][4] ,
         \ML_int[4][19] , \ML_int[4][18] , \ML_int[4][17] , \ML_int[4][3] ,
         \ML_int[4][2] , \ML_int[4][1] , \ML_int[5][19] , \ML_int[5][18] ,
         \ML_int[5][17] , \ML_int[5][16] , \ML_int[5][15] , \ML_int[5][14] ,
         \ML_int[5][13] , \ML_int[5][12] , \ML_int[5][11] , \ML_int[5][10] ,
         \ML_int[5][9] , \ML_int[5][0] , n1, n2, n3, n4, n5, n6, n7, n8, n9,
         n10, n11, n12, n13, n14, n15, n16, n17, n18;


  MUX2D0 M1_0_19 ( .I0(A[19]), .I1(A[18]), .S(SH[0]), .Z(\ML_int[1][19] ) );
  MUX2D0 M1_1_19 ( .I0(\ML_int[1][19] ), .I1(\ML_int[1][17] ), .S(SH[1]), .Z(
        \ML_int[2][19] ) );
  MUX2D0 M1_2_19 ( .I0(\ML_int[2][19] ), .I1(\ML_int[2][15] ), .S(SH[2]), .Z(
        \ML_int[3][19] ) );
  MUX2D0 M1_0_18 ( .I0(A[18]), .I1(A[17]), .S(SH[0]), .Z(\ML_int[1][18] ) );
  MUX2D0 M1_1_18 ( .I0(\ML_int[1][18] ), .I1(\ML_int[1][16] ), .S(SH[1]), .Z(
        \ML_int[2][18] ) );
  MUX2D0 M1_2_18 ( .I0(\ML_int[2][18] ), .I1(\ML_int[2][14] ), .S(SH[2]), .Z(
        \ML_int[3][18] ) );
  MUX2D0 M1_0_1 ( .I0(A[1]), .I1(A[0]), .S(SH[0]), .Z(\ML_int[1][1] ) );
  MUX2D0 M1_0_17 ( .I0(A[17]), .I1(A[16]), .S(SH[0]), .Z(\ML_int[1][17] ) );
  MUX2D0 M1_0_15 ( .I0(A[15]), .I1(A[14]), .S(SH[0]), .Z(\ML_int[1][15] ) );
  MUX2D0 M1_0_13 ( .I0(A[13]), .I1(A[12]), .S(SH[0]), .Z(\ML_int[1][13] ) );
  MUX2D0 M1_0_11 ( .I0(A[11]), .I1(A[10]), .S(SH[0]), .Z(\ML_int[1][11] ) );
  MUX2D0 M1_0_9 ( .I0(A[9]), .I1(A[8]), .S(SH[0]), .Z(\ML_int[1][9] ) );
  MUX2D0 M1_0_5 ( .I0(A[5]), .I1(A[4]), .S(SH[0]), .Z(\ML_int[1][5] ) );
  MUX2D0 M1_0_3 ( .I0(A[3]), .I1(A[2]), .S(SH[0]), .Z(\ML_int[1][3] ) );
  MUX2D0 M1_0_16 ( .I0(A[16]), .I1(A[15]), .S(SH[0]), .Z(\ML_int[1][16] ) );
  MUX2D0 M1_0_14 ( .I0(A[14]), .I1(A[13]), .S(SH[0]), .Z(\ML_int[1][14] ) );
  MUX2D0 M1_0_12 ( .I0(A[12]), .I1(A[11]), .S(SH[0]), .Z(\ML_int[1][12] ) );
  MUX2D0 M1_0_10 ( .I0(A[10]), .I1(A[9]), .S(SH[0]), .Z(\ML_int[1][10] ) );
  MUX2D0 M1_0_8 ( .I0(A[8]), .I1(A[7]), .S(SH[0]), .Z(\ML_int[1][8] ) );
  MUX2D0 M1_0_6 ( .I0(A[6]), .I1(A[5]), .S(SH[0]), .Z(\ML_int[1][6] ) );
  MUX2D0 M1_0_4 ( .I0(A[4]), .I1(A[3]), .S(SH[0]), .Z(\ML_int[1][4] ) );
  MUX2D0 M1_3_19 ( .I0(\ML_int[3][19] ), .I1(\ML_int[3][11] ), .S(SH[3]), .Z(
        \ML_int[4][19] ) );
  MUX2D0 M1_4_19 ( .I0(\ML_int[4][19] ), .I1(\ML_int[4][3] ), .S(SH[4]), .Z(
        \ML_int[5][19] ) );
  MUX2D0 M1_3_18 ( .I0(\ML_int[3][18] ), .I1(\ML_int[3][10] ), .S(SH[3]), .Z(
        \ML_int[4][18] ) );
  MUX2D0 M1_4_18 ( .I0(\ML_int[4][18] ), .I1(\ML_int[4][2] ), .S(SH[4]), .Z(
        \ML_int[5][18] ) );
  MUX2D0 M1_3_17 ( .I0(\ML_int[3][17] ), .I1(\ML_int[3][9] ), .S(SH[3]), .Z(
        \ML_int[4][17] ) );
  MUX2D0 M1_4_17 ( .I0(\ML_int[4][17] ), .I1(\ML_int[4][1] ), .S(SH[4]), .Z(
        \ML_int[5][17] ) );
  MUX2D0 M1_1_17 ( .I0(\ML_int[1][17] ), .I1(\ML_int[1][15] ), .S(SH[1]), .Z(
        \ML_int[2][17] ) );
  MUX2D0 M1_2_17 ( .I0(\ML_int[2][17] ), .I1(\ML_int[2][13] ), .S(SH[2]), .Z(
        \ML_int[3][17] ) );
  MUX2D0 M1_1_16 ( .I0(\ML_int[1][16] ), .I1(\ML_int[1][14] ), .S(SH[1]), .Z(
        \ML_int[2][16] ) );
  MUX2D0 M1_2_16 ( .I0(\ML_int[2][16] ), .I1(\ML_int[2][12] ), .S(SH[2]), .Z(
        \ML_int[3][16] ) );
  MUX2D0 M1_2_8 ( .I0(\ML_int[2][8] ), .I1(\ML_int[2][4] ), .S(SH[2]), .Z(
        \ML_int[3][8] ) );
  MUX2D0 M1_2_7 ( .I0(\ML_int[2][7] ), .I1(\ML_int[2][3] ), .S(SH[2]), .Z(
        \ML_int[3][7] ) );
  MUX2D0 M1_2_6 ( .I0(\ML_int[2][6] ), .I1(\ML_int[2][2] ), .S(SH[2]), .Z(
        \ML_int[3][6] ) );
  MUX2D0 M1_2_5 ( .I0(\ML_int[2][5] ), .I1(\ML_int[2][1] ), .S(SH[2]), .Z(
        \ML_int[3][5] ) );
  MUX2D0 M1_2_4 ( .I0(\ML_int[2][4] ), .I1(\ML_int[2][0] ), .S(SH[2]), .Z(
        \ML_int[3][4] ) );
  MUX2D0 M1_2_11 ( .I0(\ML_int[2][11] ), .I1(\ML_int[2][7] ), .S(SH[2]), .Z(
        \ML_int[3][11] ) );
  MUX2D0 M1_2_10 ( .I0(\ML_int[2][10] ), .I1(\ML_int[2][6] ), .S(SH[2]), .Z(
        \ML_int[3][10] ) );
  MUX2D0 M1_2_9 ( .I0(\ML_int[2][9] ), .I1(\ML_int[2][5] ), .S(SH[2]), .Z(
        \ML_int[3][9] ) );
  MUX2D0 M1_1_3 ( .I0(\ML_int[1][3] ), .I1(\ML_int[1][1] ), .S(SH[1]), .Z(
        \ML_int[2][3] ) );
  MUX2D0 M1_1_2 ( .I0(\ML_int[1][2] ), .I1(\ML_int[1][0] ), .S(SH[1]), .Z(
        \ML_int[2][2] ) );
  MUX2D0 M1_1_15 ( .I0(\ML_int[1][15] ), .I1(\ML_int[1][13] ), .S(SH[1]), .Z(
        \ML_int[2][15] ) );
  MUX2D0 M1_1_11 ( .I0(\ML_int[1][11] ), .I1(\ML_int[1][9] ), .S(SH[1]), .Z(
        \ML_int[2][11] ) );
  MUX2D0 M1_1_7 ( .I0(\ML_int[1][7] ), .I1(\ML_int[1][5] ), .S(SH[1]), .Z(
        \ML_int[2][7] ) );
  MUX2D0 M1_1_14 ( .I0(\ML_int[1][14] ), .I1(\ML_int[1][12] ), .S(SH[1]), .Z(
        \ML_int[2][14] ) );
  MUX2D0 M1_1_10 ( .I0(\ML_int[1][10] ), .I1(\ML_int[1][8] ), .S(SH[1]), .Z(
        \ML_int[2][10] ) );
  MUX2D0 M1_1_6 ( .I0(\ML_int[1][6] ), .I1(\ML_int[1][4] ), .S(SH[1]), .Z(
        \ML_int[2][6] ) );
  MUX2D0 M1_1_13 ( .I0(\ML_int[1][13] ), .I1(\ML_int[1][11] ), .S(SH[1]), .Z(
        \ML_int[2][13] ) );
  MUX2D0 M1_1_9 ( .I0(\ML_int[1][9] ), .I1(\ML_int[1][7] ), .S(SH[1]), .Z(
        \ML_int[2][9] ) );
  MUX2D0 M1_1_5 ( .I0(\ML_int[1][5] ), .I1(\ML_int[1][3] ), .S(SH[1]), .Z(
        \ML_int[2][5] ) );
  MUX2D0 M1_1_12 ( .I0(\ML_int[1][12] ), .I1(\ML_int[1][10] ), .S(SH[1]), .Z(
        \ML_int[2][12] ) );
  MUX2D0 M1_1_8 ( .I0(\ML_int[1][8] ), .I1(\ML_int[1][6] ), .S(SH[1]), .Z(
        \ML_int[2][8] ) );
  MUX2D0 M1_1_4 ( .I0(\ML_int[1][4] ), .I1(\ML_int[1][2] ), .S(SH[1]), .Z(
        \ML_int[2][4] ) );
  MUX2D0 M1_0_7 ( .I0(A[7]), .I1(A[6]), .S(SH[0]), .Z(\ML_int[1][7] ) );
  MUX2D0 M1_0_2 ( .I0(A[2]), .I1(A[1]), .S(SH[0]), .Z(\ML_int[1][2] ) );
  MUX2D0 M1_2_15 ( .I0(\ML_int[2][15] ), .I1(\ML_int[2][11] ), .S(SH[2]), .Z(
        \ML_int[3][15] ) );
  MUX2D0 M1_2_14 ( .I0(\ML_int[2][14] ), .I1(\ML_int[2][10] ), .S(SH[2]), .Z(
        \ML_int[3][14] ) );
  MUX2D0 M1_2_13 ( .I0(\ML_int[2][13] ), .I1(\ML_int[2][9] ), .S(SH[2]), .Z(
        \ML_int[3][13] ) );
  MUX2D0 M1_2_12 ( .I0(\ML_int[2][12] ), .I1(\ML_int[2][8] ), .S(SH[2]), .Z(
        \ML_int[3][12] ) );
  INVD1 U3 ( .I(n18), .ZN(n9) );
  INVD1 U4 ( .I(n17), .ZN(n11) );
  INVD1 U5 ( .I(n16), .ZN(n10) );
  INVD1 U6 ( .I(SH[3]), .ZN(n14) );
  INVD1 U7 ( .I(SH[2]), .ZN(n12) );
  INVD1 U8 ( .I(SH[1]), .ZN(n13) );
  NR2D1 U9 ( .A1(n1), .A2(SH[4]), .ZN(\ML_int[5][9] ) );
  MUX2ND0 U10 ( .I0(\ML_int[3][9] ), .I1(n9), .S(SH[3]), .ZN(n1) );
  NR2D1 U11 ( .A1(n2), .A2(SH[4]), .ZN(\ML_int[5][14] ) );
  MUX2ND0 U12 ( .I0(\ML_int[3][14] ), .I1(\ML_int[3][6] ), .S(SH[3]), .ZN(n2)
         );
  NR2D1 U13 ( .A1(n3), .A2(SH[4]), .ZN(\ML_int[5][10] ) );
  MUX2ND0 U14 ( .I0(\ML_int[3][10] ), .I1(n11), .S(SH[3]), .ZN(n3) );
  NR2D1 U15 ( .A1(n4), .A2(SH[4]), .ZN(\ML_int[5][15] ) );
  MUX2ND0 U16 ( .I0(\ML_int[3][15] ), .I1(\ML_int[3][7] ), .S(SH[3]), .ZN(n4)
         );
  NR2D1 U17 ( .A1(n5), .A2(SH[4]), .ZN(\ML_int[5][12] ) );
  MUX2ND0 U18 ( .I0(\ML_int[3][12] ), .I1(\ML_int[3][4] ), .S(SH[3]), .ZN(n5)
         );
  NR2D1 U19 ( .A1(n6), .A2(SH[4]), .ZN(\ML_int[5][11] ) );
  MUX2ND0 U20 ( .I0(\ML_int[3][11] ), .I1(n10), .S(SH[3]), .ZN(n6) );
  MUX2ND0 U21 ( .I0(n7), .I1(n15), .S(SH[4]), .ZN(\ML_int[5][16] ) );
  MUX2ND0 U22 ( .I0(\ML_int[3][16] ), .I1(\ML_int[3][8] ), .S(SH[3]), .ZN(n7)
         );
  NR2D1 U23 ( .A1(n8), .A2(SH[4]), .ZN(\ML_int[5][13] ) );
  MUX2ND0 U24 ( .I0(\ML_int[3][13] ), .I1(\ML_int[3][5] ), .S(SH[3]), .ZN(n8)
         );
  INR2D1 U25 ( .A1(A[0]), .B1(SH[0]), .ZN(\ML_int[1][0] ) );
  NR2D0 U26 ( .A1(SH[4]), .A2(n15), .ZN(\ML_int[5][0] ) );
  NR2D0 U27 ( .A1(SH[3]), .A2(n16), .ZN(\ML_int[4][3] ) );
  NR2D0 U28 ( .A1(SH[3]), .A2(n17), .ZN(\ML_int[4][2] ) );
  NR2D0 U29 ( .A1(SH[3]), .A2(n18), .ZN(\ML_int[4][1] ) );
  ND3D0 U30 ( .A1(n12), .A2(n14), .A3(\ML_int[2][0] ), .ZN(n15) );
  CKND2D0 U31 ( .A1(\ML_int[2][3] ), .A2(n12), .ZN(n16) );
  CKND2D0 U32 ( .A1(\ML_int[2][2] ), .A2(n12), .ZN(n17) );
  CKND2D0 U33 ( .A1(\ML_int[2][1] ), .A2(n12), .ZN(n18) );
  AN2D0 U34 ( .A1(\ML_int[1][1] ), .A2(n13), .Z(\ML_int[2][1] ) );
  AN2D0 U35 ( .A1(\ML_int[1][0] ), .A2(n13), .Z(\ML_int[2][0] ) );
endmodule


module fma_normalizer_rounder_DW01_addsub_0 ( A, B, CI, ADD_SUB, SUM, CO );
  input [4:0] A;
  input [4:0] B;
  output [4:0] SUM;
  input CI, ADD_SUB;
  output CO;

  wire   [5:0] carry;
  wire   [4:0] B_AS;

  XOR3D1 U1_4 ( .A1(A[4]), .A2(B_AS[4]), .A3(carry[4]), .Z(SUM[4]) );
  FA1D0 U1_3 ( .A(A[3]), .B(B_AS[3]), .CI(carry[3]), .CO(carry[4]), .S(SUM[3])
         );
  FA1D0 U1_2 ( .A(A[2]), .B(B_AS[2]), .CI(carry[2]), .CO(carry[3]), .S(SUM[2])
         );
  FA1D0 U1_1 ( .A(A[1]), .B(B_AS[1]), .CI(carry[1]), .CO(carry[2]), .S(SUM[1])
         );
  FA1D0 U1_0 ( .A(A[0]), .B(B_AS[0]), .CI(carry[0]), .CO(carry[1]), .S(SUM[0])
         );
  CKXOR2D0 U1 ( .A1(B[4]), .A2(carry[0]), .Z(B_AS[4]) );
  CKXOR2D0 U2 ( .A1(B[3]), .A2(carry[0]), .Z(B_AS[3]) );
  CKXOR2D0 U3 ( .A1(B[2]), .A2(carry[0]), .Z(B_AS[2]) );
  CKXOR2D0 U4 ( .A1(B[1]), .A2(carry[0]), .Z(B_AS[1]) );
  CKXOR2D0 U5 ( .A1(B[0]), .A2(carry[0]), .Z(B_AS[0]) );
endmodule


module fma_normalizer_rounder ( mantissa_ab_c_in, exp_ab_c_in, mantissa_shift, 
        fma_byp, rounder_start, mantissa_ab_c_out, exp_ab_c_out, rounder_done
 );
  input [21:0] mantissa_ab_c_in;
  input [4:0] exp_ab_c_in;
  input [4:0] mantissa_shift;
  output [9:0] mantissa_ab_c_out;
  output [4:0] exp_ab_c_out;
  input fma_byp, rounder_start;
  output rounder_done;
  wire   rounder_start, N11, N19, N20, N21, N22, N23, N24, N25, N26, N27, N28,
         N29, N30, N31, N32, N33, N34, N35, \U3/U1/Z_0 , \U3/U1/Z_1 ,
         \U3/U1/Z_2 , \U3/U1/Z_3 , \U3/U1/Z_4 , \U3/U2/Z_0 , n15, n1, n2, n3,
         n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n16, n17, n18, n19,
         n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33,
         n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47,
         n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, n59, n60, n61,
         n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72, n73, n74, n75,
         n76, n77;
  wire   SYNOPSYS_UNCONNECTED__0, SYNOPSYS_UNCONNECTED__1, 
        SYNOPSYS_UNCONNECTED__2, SYNOPSYS_UNCONNECTED__3, 
        SYNOPSYS_UNCONNECTED__4, SYNOPSYS_UNCONNECTED__5, 
        SYNOPSYS_UNCONNECTED__6, SYNOPSYS_UNCONNECTED__7;

  fma_normalizer_rounder_DW01_ash_0 sll_926 ( .A(mantissa_ab_c_in[19:0]), 
        .DATA_TC(n15), .SH({n77, n76, n74, n75, N11}), .SH_TC(n15), .B({N35, 
        N34, N33, N32, N31, N30, N29, N28, N27, N26, N25, 
        SYNOPSYS_UNCONNECTED__0, SYNOPSYS_UNCONNECTED__1, 
        SYNOPSYS_UNCONNECTED__2, SYNOPSYS_UNCONNECTED__3, 
        SYNOPSYS_UNCONNECTED__4, SYNOPSYS_UNCONNECTED__5, 
        SYNOPSYS_UNCONNECTED__6, SYNOPSYS_UNCONNECTED__7, N24}) );
  fma_normalizer_rounder_DW01_addsub_0 r82 ( .A(exp_ab_c_in), .B({\U3/U1/Z_4 , 
        \U3/U1/Z_3 , \U3/U1/Z_2 , \U3/U1/Z_1 , \U3/U1/Z_0 }), .CI(n15), 
        .ADD_SUB(\U3/U2/Z_0 ), .SUM({N23, N22, N21, N20, N19}) );
  TIEL U3 ( .ZN(n15) );
  CKND0 U4 ( .I(n1), .ZN(n74) );
  CKND0 U5 ( .I(n2), .ZN(n75) );
  CKND0 U6 ( .I(n3), .ZN(n76) );
  CKND0 U7 ( .I(n4), .ZN(n77) );
  IOA21D0 U8 ( .A1(fma_byp), .A2(mantissa_ab_c_in[19]), .B(n5), .ZN(
        mantissa_ab_c_out[9]) );
  MUX2ND0 U9 ( .I0(n6), .I1(n7), .S(n8), .ZN(n5) );
  OAI21D0 U10 ( .A1(n9), .A2(n10), .B(n11), .ZN(n7) );
  AN2D0 U11 ( .A1(n10), .A2(n12), .Z(n6) );
  IOA21D0 U12 ( .A1(fma_byp), .A2(mantissa_ab_c_in[18]), .B(n13), .ZN(
        mantissa_ab_c_out[8]) );
  MUX2ND0 U13 ( .I0(n12), .I1(n14), .S(n10), .ZN(n13) );
  CKND0 U14 ( .I(n11), .ZN(n14) );
  AOI21D0 U15 ( .A1(n16), .A2(n17), .B(n18), .ZN(n11) );
  IOA21D0 U16 ( .A1(fma_byp), .A2(mantissa_ab_c_in[17]), .B(n19), .ZN(
        mantissa_ab_c_out[7]) );
  MUX2ND0 U17 ( .I0(n18), .I1(n20), .S(n17), .ZN(n19) );
  NR2D0 U18 ( .A1(n9), .A2(n21), .ZN(n20) );
  OAI21D0 U19 ( .A1(n22), .A2(n9), .B(n23), .ZN(n18) );
  IOA21D0 U20 ( .A1(fma_byp), .A2(mantissa_ab_c_in[16]), .B(n24), .ZN(
        mantissa_ab_c_out[6]) );
  MUX2ND0 U21 ( .I0(n25), .I1(n26), .S(n27), .ZN(n24) );
  NR3D0 U22 ( .A1(n28), .A2(n29), .A3(n30), .ZN(n26) );
  AO21D0 U23 ( .A1(n16), .A2(n30), .B(n31), .Z(n25) );
  IOA21D0 U24 ( .A1(fma_byp), .A2(mantissa_ab_c_in[15]), .B(n32), .ZN(
        mantissa_ab_c_out[5]) );
  MUX2ND0 U25 ( .I0(n31), .I1(n33), .S(n30), .ZN(n32) );
  NR2D0 U26 ( .A1(n29), .A2(n28), .ZN(n33) );
  AO21D0 U27 ( .A1(n16), .A2(n29), .B(n34), .Z(n31) );
  IOA21D0 U28 ( .A1(fma_byp), .A2(mantissa_ab_c_in[14]), .B(n35), .ZN(
        mantissa_ab_c_out[4]) );
  MUX2ND0 U29 ( .I0(n34), .I1(n36), .S(n29), .ZN(n35) );
  CKND0 U30 ( .I(n28), .ZN(n36) );
  CKND2D0 U31 ( .A1(n16), .A2(n37), .ZN(n28) );
  OAI21D0 U32 ( .A1(n37), .A2(n9), .B(n23), .ZN(n34) );
  IOA21D0 U33 ( .A1(fma_byp), .A2(mantissa_ab_c_in[13]), .B(n38), .ZN(
        mantissa_ab_c_out[3]) );
  MUX2ND0 U34 ( .I0(n39), .I1(n40), .S(n41), .ZN(n38) );
  NR3D0 U35 ( .A1(n9), .A2(n42), .A3(n43), .ZN(n40) );
  AO21D0 U36 ( .A1(n16), .A2(n42), .B(n44), .Z(n39) );
  IOA21D0 U37 ( .A1(fma_byp), .A2(mantissa_ab_c_in[12]), .B(n45), .ZN(
        mantissa_ab_c_out[2]) );
  MUX2ND0 U38 ( .I0(n44), .I1(n46), .S(n42), .ZN(n45) );
  NR2D0 U39 ( .A1(n43), .A2(n9), .ZN(n46) );
  AO21D0 U40 ( .A1(n16), .A2(n47), .B(n48), .Z(n44) );
  IOA21D0 U41 ( .A1(fma_byp), .A2(mantissa_ab_c_in[11]), .B(n49), .ZN(
        mantissa_ab_c_out[1]) );
  MUX2ND0 U42 ( .I0(n48), .I1(n50), .S(n47), .ZN(n49) );
  NR2D0 U43 ( .A1(n51), .A2(n9), .ZN(n50) );
  IOA21D0 U44 ( .A1(n51), .A2(n16), .B(n23), .ZN(n48) );
  CKND0 U45 ( .I(n52), .ZN(n23) );
  IOA21D0 U46 ( .A1(fma_byp), .A2(mantissa_ab_c_in[10]), .B(n53), .ZN(
        mantissa_ab_c_out[0]) );
  MUX2ND0 U47 ( .I0(n52), .I1(n16), .S(n51), .ZN(n53) );
  NR2D0 U48 ( .A1(n54), .A2(fma_byp), .ZN(n52) );
  MUX2ND0 U49 ( .I0(n55), .I1(n56), .S(n57), .ZN(exp_ab_c_out[4]) );
  XNR2D0 U50 ( .A1(N23), .A2(n58), .ZN(n56) );
  XNR2D0 U51 ( .A1(n58), .A2(exp_ab_c_in[4]), .ZN(n55) );
  INR3D0 U52 ( .A1(n59), .B1(n60), .B2(n61), .ZN(n58) );
  CKXOR2D0 U53 ( .A1(n62), .A2(n59), .Z(exp_ab_c_out[3]) );
  MUX2D0 U54 ( .I0(exp_ab_c_in[3]), .I1(N22), .S(n57), .Z(n59) );
  NR2D0 U55 ( .A1(n61), .A2(n60), .ZN(n62) );
  CKXOR2D0 U56 ( .A1(n60), .A2(n61), .Z(exp_ab_c_out[2]) );
  MUX2ND0 U57 ( .I0(exp_ab_c_in[2]), .I1(N21), .S(n57), .ZN(n61) );
  IND3D0 U58 ( .A1(n63), .B1(n64), .B2(n65), .ZN(n60) );
  CKXOR2D0 U59 ( .A1(n63), .A2(n66), .Z(exp_ab_c_out[1]) );
  CKND2D0 U60 ( .A1(n65), .A2(n64), .ZN(n66) );
  MUX2ND0 U61 ( .I0(exp_ab_c_in[1]), .I1(N20), .S(n57), .ZN(n63) );
  CKXOR2D0 U62 ( .A1(n65), .A2(n64), .Z(exp_ab_c_out[0]) );
  MUX2D0 U63 ( .I0(exp_ab_c_in[0]), .I1(N19), .S(n57), .Z(n64) );
  NR2D0 U64 ( .A1(n67), .A2(fma_byp), .ZN(n57) );
  AN3D0 U65 ( .A1(n8), .A2(n10), .A3(n12), .Z(n65) );
  NR3D0 U66 ( .A1(n9), .A2(n17), .A3(n21), .ZN(n12) );
  CKND0 U67 ( .I(n22), .ZN(n21) );
  INR4D0 U68 ( .A1(n37), .B1(n27), .B2(n30), .B3(n29), .ZN(n22) );
  AOI222D0 U69 ( .A1(mantissa_ab_c_in[14]), .A2(n67), .B1(mantissa_ab_c_in[15]), .B2(mantissa_ab_c_in[21]), .C1(N30), .C2(\U3/U2/Z_0 ), .ZN(n29) );
  AOI222D0 U70 ( .A1(mantissa_ab_c_in[15]), .A2(n67), .B1(mantissa_ab_c_in[16]), .B2(mantissa_ab_c_in[21]), .C1(N31), .C2(\U3/U2/Z_0 ), .ZN(n30) );
  AOI222D0 U71 ( .A1(mantissa_ab_c_in[16]), .A2(n67), .B1(mantissa_ab_c_in[17]), .B2(mantissa_ab_c_in[21]), .C1(N32), .C2(\U3/U2/Z_0 ), .ZN(n27) );
  NR3D0 U72 ( .A1(n41), .A2(n42), .A3(n43), .ZN(n37) );
  OR2D0 U73 ( .A1(n47), .A2(n51), .Z(n43) );
  AOI222D0 U74 ( .A1(mantissa_ab_c_in[11]), .A2(n67), .B1(mantissa_ab_c_in[12]), .B2(mantissa_ab_c_in[21]), .C1(N27), .C2(\U3/U2/Z_0 ), .ZN(n47) );
  AOI222D0 U75 ( .A1(mantissa_ab_c_in[12]), .A2(n67), .B1(mantissa_ab_c_in[13]), .B2(mantissa_ab_c_in[21]), .C1(N28), .C2(\U3/U2/Z_0 ), .ZN(n42) );
  AOI222D0 U76 ( .A1(mantissa_ab_c_in[13]), .A2(n67), .B1(mantissa_ab_c_in[14]), .B2(mantissa_ab_c_in[21]), .C1(N29), .C2(\U3/U2/Z_0 ), .ZN(n41) );
  AOI222D0 U77 ( .A1(mantissa_ab_c_in[17]), .A2(n67), .B1(mantissa_ab_c_in[18]), .B2(mantissa_ab_c_in[21]), .C1(N33), .C2(\U3/U2/Z_0 ), .ZN(n17) );
  CKND0 U78 ( .I(n16), .ZN(n9) );
  INR2D0 U79 ( .A1(n54), .B1(fma_byp), .ZN(n16) );
  AOI31D0 U80 ( .A1(n51), .A2(n68), .A3(n69), .B(n70), .ZN(n54) );
  AOI222D0 U81 ( .A1(N25), .A2(\U3/U2/Z_0 ), .B1(mantissa_ab_c_in[9]), .B2(n67), .C1(mantissa_ab_c_in[10]), .C2(mantissa_ab_c_in[21]), .ZN(n70) );
  AOI22D0 U82 ( .A1(mantissa_ab_c_in[0]), .A2(n67), .B1(N24), .B2(\U3/U2/Z_0 ), 
        .ZN(n69) );
  CKND2D0 U83 ( .A1(mantissa_ab_c_in[1]), .A2(mantissa_ab_c_in[21]), .ZN(n68)
         );
  AOI222D0 U84 ( .A1(mantissa_ab_c_in[10]), .A2(n67), .B1(mantissa_ab_c_in[11]), .B2(mantissa_ab_c_in[21]), .C1(N26), .C2(\U3/U2/Z_0 ), .ZN(n51) );
  AO222D0 U85 ( .A1(mantissa_ab_c_in[18]), .A2(n67), .B1(mantissa_ab_c_in[21]), 
        .B2(mantissa_ab_c_in[19]), .C1(N34), .C2(\U3/U2/Z_0 ), .Z(n10) );
  AO222D0 U86 ( .A1(n67), .A2(mantissa_ab_c_in[19]), .B1(mantissa_ab_c_in[20]), 
        .B2(mantissa_ab_c_in[21]), .C1(N35), .C2(\U3/U2/Z_0 ), .Z(n8) );
  NR2D0 U87 ( .A1(\U3/U2/Z_0 ), .A2(mantissa_ab_c_in[21]), .ZN(n67) );
  NR2D0 U88 ( .A1(n71), .A2(n4), .ZN(\U3/U1/Z_4 ) );
  CKND2D0 U89 ( .A1(mantissa_shift[4]), .A2(n72), .ZN(n4) );
  NR2D0 U90 ( .A1(n71), .A2(n3), .ZN(\U3/U1/Z_3 ) );
  CKND2D0 U91 ( .A1(mantissa_shift[3]), .A2(n72), .ZN(n3) );
  NR2D0 U92 ( .A1(n71), .A2(n1), .ZN(\U3/U1/Z_2 ) );
  CKND2D0 U93 ( .A1(mantissa_shift[2]), .A2(n72), .ZN(n1) );
  NR2D0 U94 ( .A1(n71), .A2(n2), .ZN(\U3/U1/Z_1 ) );
  CKND2D0 U95 ( .A1(mantissa_shift[1]), .A2(n72), .ZN(n2) );
  CKND0 U96 ( .I(\U3/U2/Z_0 ), .ZN(n71) );
  AO21D0 U97 ( .A1(\U3/U2/Z_0 ), .A2(N11), .B(mantissa_ab_c_in[21]), .Z(
        \U3/U1/Z_0 ) );
  NR2D0 U98 ( .A1(mantissa_ab_c_in[20]), .A2(mantissa_ab_c_in[21]), .ZN(
        \U3/U2/Z_0 ) );
  AN2D0 U99 ( .A1(mantissa_shift[0]), .A2(n72), .Z(N11) );
  AN4D0 U100 ( .A1(exp_ab_c_in[4]), .A2(exp_ab_c_in[3]), .A3(n73), .A4(
        exp_ab_c_in[2]), .Z(n72) );
  AN2D0 U101 ( .A1(exp_ab_c_in[0]), .A2(exp_ab_c_in[1]), .Z(n73) );
endmodule


module fma_top ( a, b, c, fma_en, clk, rst, z, fma_vld );
  input [15:0] a;
  input [15:0] b;
  input [15:0] c;
  output [15:0] z;
  input fma_en, clk, rst;
  output fma_vld;
  wire   N4, a_equals_one, b_equals_one, fma_en_ff, N7, N8, N9, N10, N11, N12,
         N13, N14, N15, N16, N17, N18, N19, N20, N21, N22, N23, N24, N25, N26,
         N27, N28, N29, N30, N31, N32, N33, N34, N35, N36, N37, N38, N39, N40,
         N41, N42, N43, N44, N45, N46, N47, N48, N49, N50, N51, N52, N53, N54,
         N55, exp_ab_greater, exp_ab_less, exp_diff_done, sign_ab, mult_done,
         adder_done, _0_net_, rounder_done, n31, n32, n33, n34, n35, n36, n37,
         n38, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, n51,
         n52, n53, n54, n55, n56, n57, n58, n59, n60;
  wire   [15:0] a_ff;
  wire   [15:0] b_ff;
  wire   [15:0] c_ff;
  wire   [4:0] exp_diff;
  wire   [4:0] exp_ab;
  wire   [19:0] mantissa_ab;
  wire   [21:0] mantissa_ab_c;
  wire   [4:0] exp_ab_c;
  wire   [15:0] result;
  wire   [4:0] mantissa_shift;
  wire   [4:0] exp_ab_c_out;

  fma_exp_diff fma_exp_diff_i ( .exp_a(a_ff[14:10]), .exp_b(b_ff[14:10]), 
        .exp_c(c_ff[14:10]), .exp_diff_start(fma_en_ff), .fma_byp(N4), 
        .exp_diff(exp_diff), .exp_ab(exp_ab), .exp_ab_greater(exp_ab_greater), 
        .exp_ab_less(exp_ab_less), .exp_diff_done(exp_diff_done) );
  fma_mult_tree fma_mult_tree_i ( .mantissa_a(a_ff[9:0]), .mantissa_b(
        b_ff[9:0]), .sign_a(a_ff[15]), .sign_b(b_ff[15]), .fma_byp(N4), 
        .a_equals_one(a_equals_one), .b_equals_one(b_equals_one), .mult_start(
        fma_en_ff), .mantissa_ab(mantissa_ab), .sign_ab(sign_ab), .mult_done(
        mult_done) );
  fma_aligner_adder fma_aligner_adder_i ( .mantissa_ab(mantissa_ab), .exp_ab(
        exp_ab), .sign_ab(sign_ab), .c(c_ff), .exp_diff(exp_diff), 
        .exp_ab_greater(exp_ab_greater), .exp_ab_less(exp_ab_less), .fma_byp(
        N4), .add_byp(n31), .adder_start(_0_net_), .mantissa_ab_c(
        mantissa_ab_c), .exp_ab_c(exp_ab_c), .sign_ab_c(result[15]), 
        .mantissa_shift(mantissa_shift), .adder_done(adder_done) );
  fma_normalizer_rounder fma_normalizer_rounder_i ( .mantissa_ab_c_in(
        mantissa_ab_c), .exp_ab_c_in(exp_ab_c), .mantissa_shift(mantissa_shift), .fma_byp(N4), .rounder_start(adder_done), .mantissa_ab_c_out(result[9:0]), 
        .exp_ab_c_out(exp_ab_c_out), .rounder_done(rounder_done) );
  DFQD1 fma_en_ff_reg ( .D(N55), .CP(clk), .Q(fma_en_ff) );
  DFQD1 \a_ff_reg[15]  ( .D(N22), .CP(clk), .Q(a_ff[15]) );
  DFQD1 \b_ff_reg[10]  ( .D(N33), .CP(clk), .Q(b_ff[10]) );
  DFQD1 \a_ff_reg[14]  ( .D(N21), .CP(clk), .Q(a_ff[14]) );
  DFQD1 \b_ff_reg[14]  ( .D(N37), .CP(clk), .Q(b_ff[14]) );
  DFQD1 \a_ff_reg[10]  ( .D(N17), .CP(clk), .Q(a_ff[10]) );
  DFQD1 \b_ff_reg[8]  ( .D(N31), .CP(clk), .Q(b_ff[8]) );
  DFQD1 \b_ff_reg[15]  ( .D(N38), .CP(clk), .Q(b_ff[15]) );
  DFQD1 \b_ff_reg[11]  ( .D(N34), .CP(clk), .Q(b_ff[11]) );
  DFQD1 \a_ff_reg[12]  ( .D(N19), .CP(clk), .Q(a_ff[12]) );
  DFQD1 \b_ff_reg[12]  ( .D(N35), .CP(clk), .Q(b_ff[12]) );
  DFQD1 \c_ff_reg[5]  ( .D(N44), .CP(clk), .Q(c_ff[5]) );
  DFQD1 \a_ff_reg[13]  ( .D(N20), .CP(clk), .Q(a_ff[13]) );
  DFQD1 \a_ff_reg[11]  ( .D(N18), .CP(clk), .Q(a_ff[11]) );
  DFQD1 \b_ff_reg[13]  ( .D(N36), .CP(clk), .Q(b_ff[13]) );
  DFQD1 \c_ff_reg[8]  ( .D(N47), .CP(clk), .Q(c_ff[8]) );
  DFQD1 \b_ff_reg[4]  ( .D(N27), .CP(clk), .Q(b_ff[4]) );
  DFQD1 \b_ff_reg[2]  ( .D(N25), .CP(clk), .Q(b_ff[2]) );
  DFQD1 \c_ff_reg[4]  ( .D(N43), .CP(clk), .Q(c_ff[4]) );
  DFQD1 \b_ff_reg[6]  ( .D(N29), .CP(clk), .Q(b_ff[6]) );
  DFQD1 \c_ff_reg[10]  ( .D(N49), .CP(clk), .Q(c_ff[10]) );
  DFQD1 \c_ff_reg[9]  ( .D(N48), .CP(clk), .Q(c_ff[9]) );
  DFQD1 \c_ff_reg[12]  ( .D(N51), .CP(clk), .Q(c_ff[12]) );
  DFQD1 \c_ff_reg[14]  ( .D(N53), .CP(clk), .Q(c_ff[14]) );
  DFQD1 \c_ff_reg[13]  ( .D(N52), .CP(clk), .Q(c_ff[13]) );
  DFQD1 \c_ff_reg[3]  ( .D(N42), .CP(clk), .Q(c_ff[3]) );
  DFQD1 \c_ff_reg[1]  ( .D(N40), .CP(clk), .Q(c_ff[1]) );
  DFQD1 \c_ff_reg[7]  ( .D(N46), .CP(clk), .Q(c_ff[7]) );
  DFQD1 \c_ff_reg[0]  ( .D(N39), .CP(clk), .Q(c_ff[0]) );
  DFQD1 \b_ff_reg[1]  ( .D(N24), .CP(clk), .Q(b_ff[1]) );
  DFQD1 \c_ff_reg[2]  ( .D(N41), .CP(clk), .Q(c_ff[2]) );
  DFQD1 \c_ff_reg[6]  ( .D(N45), .CP(clk), .Q(c_ff[6]) );
  DFQD1 \c_ff_reg[11]  ( .D(N50), .CP(clk), .Q(c_ff[11]) );
  DFQD1 \a_ff_reg[9]  ( .D(N16), .CP(clk), .Q(a_ff[9]) );
  DFQD1 \b_ff_reg[3]  ( .D(N26), .CP(clk), .Q(b_ff[3]) );
  DFQD1 \a_ff_reg[0]  ( .D(N7), .CP(clk), .Q(a_ff[0]) );
  DFQD1 \c_ff_reg[15]  ( .D(N54), .CP(clk), .Q(c_ff[15]) );
  DFQD1 \b_ff_reg[5]  ( .D(N28), .CP(clk), .Q(b_ff[5]) );
  DFQD1 \a_ff_reg[7]  ( .D(N14), .CP(clk), .Q(a_ff[7]) );
  DFQD1 \b_ff_reg[0]  ( .D(N23), .CP(clk), .Q(b_ff[0]) );
  DFQD1 \a_ff_reg[4]  ( .D(N11), .CP(clk), .Q(a_ff[4]) );
  DFQD1 \a_ff_reg[8]  ( .D(N15), .CP(clk), .Q(a_ff[8]) );
  DFQD1 \a_ff_reg[1]  ( .D(N8), .CP(clk), .Q(a_ff[1]) );
  DFQD1 \a_ff_reg[3]  ( .D(N10), .CP(clk), .Q(a_ff[3]) );
  DFQD1 \a_ff_reg[5]  ( .D(N12), .CP(clk), .Q(a_ff[5]) );
  DFQD1 \a_ff_reg[2]  ( .D(N9), .CP(clk), .Q(a_ff[2]) );
  DFQD1 \a_ff_reg[6]  ( .D(N13), .CP(clk), .Q(a_ff[6]) );
  DFQD1 \b_ff_reg[7]  ( .D(N30), .CP(clk), .Q(b_ff[7]) );
  DFQD1 \b_ff_reg[9]  ( .D(N32), .CP(clk), .Q(b_ff[9]) );
  ND2D1 U102 ( .A1(n49), .A2(n50), .ZN(N4) );
  TIEL U103 ( .ZN(z[15]) );
  AN2D0 U104 ( .A1(result[9]), .A2(n32), .Z(z[9]) );
  AN2D0 U105 ( .A1(result[8]), .A2(n32), .Z(z[8]) );
  AN2D0 U106 ( .A1(result[7]), .A2(n32), .Z(z[7]) );
  AN2D0 U107 ( .A1(result[6]), .A2(n32), .Z(z[6]) );
  AN2D0 U108 ( .A1(result[5]), .A2(n32), .Z(z[5]) );
  AN2D0 U109 ( .A1(result[4]), .A2(n32), .Z(z[4]) );
  AN2D0 U110 ( .A1(result[3]), .A2(n32), .Z(z[3]) );
  AN2D0 U111 ( .A1(result[2]), .A2(n32), .Z(z[2]) );
  AN2D0 U112 ( .A1(result[1]), .A2(n32), .Z(z[1]) );
  IOA21D0 U113 ( .A1(exp_ab_c_out[4]), .A2(n32), .B(n33), .ZN(z[14]) );
  IOA21D0 U114 ( .A1(exp_ab_c_out[3]), .A2(n32), .B(n33), .ZN(z[13]) );
  IOA21D0 U115 ( .A1(exp_ab_c_out[2]), .A2(n32), .B(n33), .ZN(z[12]) );
  IOA21D0 U116 ( .A1(exp_ab_c_out[1]), .A2(n32), .B(n33), .ZN(z[11]) );
  IOA21D0 U117 ( .A1(exp_ab_c_out[0]), .A2(n32), .B(n33), .ZN(z[10]) );
  OR2D0 U118 ( .A1(n34), .A2(result[15]), .Z(n33) );
  AOI33D0 U119 ( .A1(c_ff[14]), .A2(c_ff[13]), .A3(n35), .B1(exp_ab[4]), .B2(
        exp_ab[3]), .B3(n36), .ZN(n34) );
  AN3D0 U120 ( .A1(exp_ab[1]), .A2(exp_ab[0]), .A3(exp_ab[2]), .Z(n36) );
  AN3D0 U121 ( .A1(c_ff[12]), .A2(c_ff[10]), .A3(c_ff[11]), .Z(n35) );
  AN2D0 U122 ( .A1(result[0]), .A2(n32), .Z(z[0]) );
  CKND0 U123 ( .I(result[15]), .ZN(n32) );
  AN4D0 U124 ( .A1(n37), .A2(n38), .A3(n39), .A4(n40), .Z(n31) );
  NR4D0 U125 ( .A1(c_ff[9]), .A2(c_ff[8]), .A3(c_ff[7]), .A4(c_ff[6]), .ZN(n40) );
  NR4D0 U126 ( .A1(c_ff[5]), .A2(c_ff[4]), .A3(c_ff[3]), .A4(c_ff[2]), .ZN(n39) );
  NR4D0 U127 ( .A1(c_ff[1]), .A2(c_ff[14]), .A3(c_ff[13]), .A4(c_ff[12]), .ZN(
        n38) );
  NR3D0 U128 ( .A1(c_ff[0]), .A2(c_ff[11]), .A3(c_ff[10]), .ZN(n37) );
  NR4D0 U129 ( .A1(n41), .A2(n42), .A3(n43), .A4(n44), .ZN(b_equals_one) );
  CKND2D0 U130 ( .A1(b_ff[13]), .A2(b_ff[12]), .ZN(n41) );
  NR4D0 U131 ( .A1(n45), .A2(n46), .A3(n47), .A4(n48), .ZN(a_equals_one) );
  CKND2D0 U132 ( .A1(a_ff[13]), .A2(a_ff[12]), .ZN(n45) );
  AN2D0 U133 ( .A1(mult_done), .A2(exp_diff_done), .Z(_0_net_) );
  INR2D0 U134 ( .A1(a[2]), .B1(rst), .ZN(N9) );
  INR2D0 U135 ( .A1(a[1]), .B1(rst), .ZN(N8) );
  INR2D0 U136 ( .A1(a[0]), .B1(rst), .ZN(N7) );
  INR2D0 U137 ( .A1(fma_en), .B1(rst), .ZN(N55) );
  INR2D0 U138 ( .A1(c[15]), .B1(rst), .ZN(N54) );
  INR2D0 U139 ( .A1(c[14]), .B1(rst), .ZN(N53) );
  INR2D0 U140 ( .A1(c[13]), .B1(rst), .ZN(N52) );
  INR2D0 U141 ( .A1(c[12]), .B1(rst), .ZN(N51) );
  INR2D0 U142 ( .A1(c[11]), .B1(rst), .ZN(N50) );
  INR2D0 U143 ( .A1(c[10]), .B1(rst), .ZN(N49) );
  INR2D0 U144 ( .A1(c[9]), .B1(rst), .ZN(N48) );
  INR2D0 U145 ( .A1(c[8]), .B1(rst), .ZN(N47) );
  INR2D0 U146 ( .A1(c[7]), .B1(rst), .ZN(N46) );
  INR2D0 U147 ( .A1(c[6]), .B1(rst), .ZN(N45) );
  INR2D0 U148 ( .A1(c[5]), .B1(rst), .ZN(N44) );
  INR2D0 U149 ( .A1(c[4]), .B1(rst), .ZN(N43) );
  INR2D0 U150 ( .A1(c[3]), .B1(rst), .ZN(N42) );
  INR2D0 U151 ( .A1(c[2]), .B1(rst), .ZN(N41) );
  INR2D0 U152 ( .A1(c[1]), .B1(rst), .ZN(N40) );
  IND4D0 U153 ( .A1(n47), .B1(n48), .B2(n46), .B3(n51), .ZN(n50) );
  NR3D0 U154 ( .A1(a_ff[12]), .A2(a_ff[15]), .A3(a_ff[13]), .ZN(n51) );
  CKND0 U155 ( .I(a_ff[11]), .ZN(n46) );
  CKND0 U156 ( .I(a_ff[10]), .ZN(n48) );
  ND4D0 U157 ( .A1(n52), .A2(n53), .A3(n54), .A4(n55), .ZN(n47) );
  NR3D0 U158 ( .A1(a_ff[7]), .A2(a_ff[9]), .A3(a_ff[8]), .ZN(n55) );
  NR3D0 U159 ( .A1(a_ff[4]), .A2(a_ff[6]), .A3(a_ff[5]), .ZN(n54) );
  NR3D0 U160 ( .A1(a_ff[1]), .A2(a_ff[3]), .A3(a_ff[2]), .ZN(n53) );
  NR2D0 U161 ( .A1(a_ff[14]), .A2(a_ff[0]), .ZN(n52) );
  IND4D0 U162 ( .A1(n43), .B1(n44), .B2(n42), .B3(n56), .ZN(n49) );
  NR3D0 U163 ( .A1(b_ff[12]), .A2(b_ff[15]), .A3(b_ff[13]), .ZN(n56) );
  CKND0 U164 ( .I(b_ff[11]), .ZN(n42) );
  CKND0 U165 ( .I(b_ff[10]), .ZN(n44) );
  ND4D0 U166 ( .A1(n57), .A2(n58), .A3(n59), .A4(n60), .ZN(n43) );
  NR3D0 U167 ( .A1(b_ff[7]), .A2(b_ff[9]), .A3(b_ff[8]), .ZN(n60) );
  NR3D0 U168 ( .A1(b_ff[4]), .A2(b_ff[6]), .A3(b_ff[5]), .ZN(n59) );
  NR3D0 U169 ( .A1(b_ff[1]), .A2(b_ff[3]), .A3(b_ff[2]), .ZN(n58) );
  NR2D0 U170 ( .A1(b_ff[14]), .A2(b_ff[0]), .ZN(n57) );
  INR2D0 U171 ( .A1(c[0]), .B1(rst), .ZN(N39) );
  INR2D0 U172 ( .A1(b[15]), .B1(rst), .ZN(N38) );
  INR2D0 U173 ( .A1(b[14]), .B1(rst), .ZN(N37) );
  INR2D0 U174 ( .A1(b[13]), .B1(rst), .ZN(N36) );
  INR2D0 U175 ( .A1(b[12]), .B1(rst), .ZN(N35) );
  INR2D0 U176 ( .A1(b[11]), .B1(rst), .ZN(N34) );
  INR2D0 U177 ( .A1(b[10]), .B1(rst), .ZN(N33) );
  INR2D0 U178 ( .A1(b[9]), .B1(rst), .ZN(N32) );
  INR2D0 U179 ( .A1(b[8]), .B1(rst), .ZN(N31) );
  INR2D0 U180 ( .A1(b[7]), .B1(rst), .ZN(N30) );
  INR2D0 U181 ( .A1(b[6]), .B1(rst), .ZN(N29) );
  INR2D0 U182 ( .A1(b[5]), .B1(rst), .ZN(N28) );
  INR2D0 U183 ( .A1(b[4]), .B1(rst), .ZN(N27) );
  INR2D0 U184 ( .A1(b[3]), .B1(rst), .ZN(N26) );
  INR2D0 U185 ( .A1(b[2]), .B1(rst), .ZN(N25) );
  INR2D0 U186 ( .A1(b[1]), .B1(rst), .ZN(N24) );
  INR2D0 U187 ( .A1(b[0]), .B1(rst), .ZN(N23) );
  INR2D0 U188 ( .A1(a[15]), .B1(rst), .ZN(N22) );
  INR2D0 U189 ( .A1(a[14]), .B1(rst), .ZN(N21) );
  INR2D0 U190 ( .A1(a[13]), .B1(rst), .ZN(N20) );
  INR2D0 U191 ( .A1(a[12]), .B1(rst), .ZN(N19) );
  INR2D0 U192 ( .A1(a[11]), .B1(rst), .ZN(N18) );
  INR2D0 U193 ( .A1(a[10]), .B1(rst), .ZN(N17) );
  INR2D0 U194 ( .A1(a[9]), .B1(rst), .ZN(N16) );
  INR2D0 U195 ( .A1(a[8]), .B1(rst), .ZN(N15) );
  INR2D0 U196 ( .A1(a[7]), .B1(rst), .ZN(N14) );
  INR2D0 U197 ( .A1(a[6]), .B1(rst), .ZN(N13) );
  INR2D0 U198 ( .A1(a[5]), .B1(rst), .ZN(N12) );
  INR2D0 U199 ( .A1(a[4]), .B1(rst), .ZN(N11) );
  INR2D0 U200 ( .A1(a[3]), .B1(rst), .ZN(N10) );
endmodule


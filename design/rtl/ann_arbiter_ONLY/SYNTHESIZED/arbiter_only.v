
module arbiter ( clk, rst, neuron_0_port, neuron_1_port, neuron_2_port, 
        neuron_3_port, neuron_4_port, neuron_5_port, neuron_6_port, 
        neuron_7_port, neuron_0_done, neuron_1_done, neuron_2_done, 
        neuron_3_done, neuron_4_done, neuron_5_done, neuron_6_done, 
        neuron_7_done, neuron_0_connection, neuron_1_connection, 
        neuron_2_connection, neuron_3_connection, neuron_4_connection, 
        neuron_5_connection, neuron_6_connection, neuron_7_connection, 
        router_port_0, router_port_1, router_port_2, router_port_3, 
        router_port_4, router_port_5, router_port_6, router_port_7, 
        buffer_0_data_in, buffer_1_data_in, buffer_2_data_in, buffer_3_data_in, 
        buffer_4_data_in, buffer_5_data_in, buffer_6_data_in, buffer_7_data_in, 
        buffer_0_data_out, buffer_1_data_out, buffer_2_data_out, 
        buffer_3_data_out, buffer_4_data_out, buffer_5_data_out, 
        buffer_6_data_out, buffer_7_data_out, buffer_0_rd_ptr, buffer_1_rd_ptr, 
        buffer_2_rd_ptr, buffer_3_rd_ptr, buffer_4_rd_ptr, buffer_5_rd_ptr, 
        buffer_6_rd_ptr, buffer_7_rd_ptr, buffer_0_wr_en, buffer_1_wr_en, 
        buffer_2_wr_en, buffer_3_wr_en, buffer_4_wr_en, buffer_5_wr_en, 
        buffer_6_wr_en, buffer_7_wr_en, buffer_0_rd_en, buffer_1_rd_en, 
        buffer_2_rd_en, buffer_3_rd_en, buffer_4_rd_en, buffer_5_rd_en, 
        buffer_6_rd_en, buffer_7_rd_en, buffer_0_empty, buffer_1_empty, 
        buffer_2_empty, buffer_3_empty, buffer_4_empty, buffer_5_empty, 
        buffer_6_empty, buffer_7_empty );
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
  output [19:0] buffer_0_data_in;
  output [19:0] buffer_1_data_in;
  output [19:0] buffer_2_data_in;
  output [19:0] buffer_3_data_in;
  output [19:0] buffer_4_data_in;
  output [19:0] buffer_5_data_in;
  output [19:0] buffer_6_data_in;
  output [19:0] buffer_7_data_in;
  input [19:0] buffer_0_data_out;
  input [19:0] buffer_1_data_out;
  input [19:0] buffer_2_data_out;
  input [19:0] buffer_3_data_out;
  input [19:0] buffer_4_data_out;
  input [19:0] buffer_5_data_out;
  input [19:0] buffer_6_data_out;
  input [19:0] buffer_7_data_out;
  output [2:0] buffer_0_rd_ptr;
  output [2:0] buffer_1_rd_ptr;
  output [2:0] buffer_2_rd_ptr;
  output [2:0] buffer_3_rd_ptr;
  output [2:0] buffer_4_rd_ptr;
  output [2:0] buffer_5_rd_ptr;
  output [2:0] buffer_6_rd_ptr;
  output [2:0] buffer_7_rd_ptr;
  input clk, rst, neuron_0_done, neuron_1_done, neuron_2_done, neuron_3_done,
         neuron_4_done, neuron_5_done, neuron_6_done, neuron_7_done,
         buffer_0_empty, buffer_1_empty, buffer_2_empty, buffer_3_empty,
         buffer_4_empty, buffer_5_empty, buffer_6_empty, buffer_7_empty;
  output buffer_0_wr_en, buffer_1_wr_en, buffer_2_wr_en, buffer_3_wr_en,
         buffer_4_wr_en, buffer_5_wr_en, buffer_6_wr_en, buffer_7_wr_en,
         buffer_0_rd_en, buffer_1_rd_en, buffer_2_rd_en, buffer_3_rd_en,
         buffer_4_rd_en, buffer_5_rd_en, buffer_6_rd_en, buffer_7_rd_en;
  wire   \buffer_1_data_in[16] , n26, n27, n28, n29, n30, n31, n32, n33, n298,
         n299, n300, n301, n302, n303, n304, n305, n306, n307, n308, n309,
         n310, n311, n312, n313, n314, n315, n316, n317, n318, n319, n320,
         n321, n322, n323, n324, n325, n326, n327, n328, n329, n330, n331,
         n332, n333, n334, n335, n336, n337, n338, n339, n340, n341, n342,
         n343, n344, n345, n346, n347, n348, n349, n350, n351, n352, n353,
         n354, n355, n356, n357, n358, n359, n360, n361, n362, n363, n364,
         n365, n366, n367, n368, n369, n370, n371, n372, n373, n374, n375,
         n376, n377, n378, n379, n380, n381, n382, n383, n384, n385, n386,
         n387, n388, n389, n390, n391, n392, n393, n394, n395, n396, n397,
         n398, n399, n400, n401, n402, n403, n404, n405, n406, n407, n408,
         n409, n410, n411, n412, n413, n414, n415, n416, n417, n418, n419,
         n420, n421, n422, n423, n424, n425, n426, n427, n428, n429, n430,
         n431, n432, n433, n434, n435, n436, n437, n438, n439, n440, n441,
         n442, n443, n444, n445, n446, n447, n448, n449, n450, n451, n452,
         n453, n454, n455, n456, n457, n458, n459, n460, n461, n462, n463,
         n464, n465, n466, n467, n468, n469, n470, n471, n472, n473, n474,
         n475, n476, n477, n478, n479, n480, n481, \buffer_7_data_in[19] ,
         n483, n484, n485, n486, n487, n488, n489, n490, n491, n492, n493,
         n494, n495, n496, n497, n498, n499, n500, n501, n502, n503, n504,
         n505, n506, n507, n508, n509, n510, n511, n512, n513, n514, n515,
         n516, n517, n518, n519, n520, n521, n522;
  assign buffer_1_data_in[16] = \buffer_1_data_in[16] ;
  assign buffer_2_data_in[17] = \buffer_1_data_in[16] ;
  assign buffer_3_data_in[17] = \buffer_1_data_in[16] ;
  assign buffer_3_data_in[16] = \buffer_1_data_in[16] ;
  assign buffer_4_data_in[18] = \buffer_1_data_in[16] ;
  assign buffer_5_data_in[18] = \buffer_1_data_in[16] ;
  assign buffer_5_data_in[16] = \buffer_1_data_in[16] ;
  assign buffer_6_data_in[18] = \buffer_1_data_in[16] ;
  assign buffer_6_data_in[17] = \buffer_1_data_in[16] ;
  assign buffer_7_data_in[18] = \buffer_1_data_in[16] ;
  assign buffer_7_data_in[17] = \buffer_1_data_in[16] ;
  assign buffer_7_data_in[16] = \buffer_1_data_in[16] ;
  assign buffer_0_wr_en = \buffer_1_data_in[16] ;
  assign buffer_1_wr_en = \buffer_1_data_in[16] ;
  assign buffer_2_wr_en = \buffer_1_data_in[16] ;
  assign buffer_3_wr_en = \buffer_1_data_in[16] ;
  assign buffer_4_wr_en = \buffer_1_data_in[16] ;
  assign buffer_5_wr_en = \buffer_1_data_in[16] ;
  assign buffer_6_wr_en = \buffer_1_data_in[16] ;
  assign buffer_7_wr_en = \buffer_1_data_in[16] ;
  assign buffer_0_data_in[19] = \buffer_7_data_in[19] ;
  assign buffer_0_data_in[18] = \buffer_7_data_in[19] ;
  assign buffer_0_data_in[17] = \buffer_7_data_in[19] ;
  assign buffer_0_data_in[16] = \buffer_7_data_in[19] ;
  assign buffer_1_data_in[19] = \buffer_7_data_in[19] ;
  assign buffer_1_data_in[18] = \buffer_7_data_in[19] ;
  assign buffer_1_data_in[17] = \buffer_7_data_in[19] ;
  assign buffer_2_data_in[19] = \buffer_7_data_in[19] ;
  assign buffer_2_data_in[18] = \buffer_7_data_in[19] ;
  assign buffer_2_data_in[16] = \buffer_7_data_in[19] ;
  assign buffer_3_data_in[19] = \buffer_7_data_in[19] ;
  assign buffer_3_data_in[18] = \buffer_7_data_in[19] ;
  assign buffer_4_data_in[19] = \buffer_7_data_in[19] ;
  assign buffer_4_data_in[17] = \buffer_7_data_in[19] ;
  assign buffer_4_data_in[16] = \buffer_7_data_in[19] ;
  assign buffer_5_data_in[19] = \buffer_7_data_in[19] ;
  assign buffer_5_data_in[17] = \buffer_7_data_in[19] ;
  assign buffer_6_data_in[19] = \buffer_7_data_in[19] ;
  assign buffer_6_data_in[16] = \buffer_7_data_in[19] ;
  assign buffer_7_data_in[19] = \buffer_7_data_in[19] ;

  DFQD1 buffer_7_rd_en_reg ( .D(n33), .CP(clk), .Q(buffer_7_rd_en) );
  DFND1 \buffer_7_rd_ptr_reg[0]  ( .D(n461), .CPN(clk), .Q(buffer_7_rd_ptr[0]), 
        .QN(n522) );
  DFND1 \buffer_7_rd_ptr_reg[1]  ( .D(n460), .CPN(clk), .Q(buffer_7_rd_ptr[1]), 
        .QN(n521) );
  DFND1 \buffer_7_rd_ptr_reg[2]  ( .D(n459), .CPN(clk), .Q(buffer_7_rd_ptr[2])
         );
  DFND1 \router_port_7_reg[19]  ( .D(n462), .CPN(clk), .Q(router_port_7[19])
         );
  DFND1 \router_port_7_reg[18]  ( .D(n463), .CPN(clk), .Q(router_port_7[18])
         );
  DFND1 \router_port_7_reg[17]  ( .D(n464), .CPN(clk), .Q(router_port_7[17])
         );
  DFND1 \router_port_7_reg[16]  ( .D(n465), .CPN(clk), .Q(router_port_7[16])
         );
  DFND1 \router_port_7_reg[15]  ( .D(n466), .CPN(clk), .Q(router_port_7[15])
         );
  DFND1 \router_port_7_reg[14]  ( .D(n467), .CPN(clk), .Q(router_port_7[14])
         );
  DFND1 \router_port_7_reg[13]  ( .D(n468), .CPN(clk), .Q(router_port_7[13])
         );
  DFND1 \router_port_7_reg[12]  ( .D(n469), .CPN(clk), .Q(router_port_7[12])
         );
  DFND1 \router_port_7_reg[11]  ( .D(n470), .CPN(clk), .Q(router_port_7[11])
         );
  DFND1 \router_port_7_reg[10]  ( .D(n471), .CPN(clk), .Q(router_port_7[10])
         );
  DFND1 \router_port_7_reg[9]  ( .D(n472), .CPN(clk), .Q(router_port_7[9]) );
  DFND1 \router_port_7_reg[8]  ( .D(n473), .CPN(clk), .Q(router_port_7[8]) );
  DFND1 \router_port_7_reg[7]  ( .D(n474), .CPN(clk), .Q(router_port_7[7]) );
  DFND1 \router_port_7_reg[6]  ( .D(n475), .CPN(clk), .Q(router_port_7[6]) );
  DFND1 \router_port_7_reg[5]  ( .D(n476), .CPN(clk), .Q(router_port_7[5]) );
  DFND1 \router_port_7_reg[4]  ( .D(n477), .CPN(clk), .Q(router_port_7[4]) );
  DFND1 \router_port_7_reg[3]  ( .D(n478), .CPN(clk), .Q(router_port_7[3]) );
  DFND1 \router_port_7_reg[2]  ( .D(n479), .CPN(clk), .Q(router_port_7[2]) );
  DFND1 \router_port_7_reg[1]  ( .D(n480), .CPN(clk), .Q(router_port_7[1]) );
  DFND1 \router_port_7_reg[0]  ( .D(n481), .CPN(clk), .Q(router_port_7[0]) );
  DFQD1 buffer_6_rd_en_reg ( .D(n32), .CP(clk), .Q(buffer_6_rd_en) );
  DFND1 \buffer_6_rd_ptr_reg[0]  ( .D(n438), .CPN(clk), .Q(buffer_6_rd_ptr[0]), 
        .QN(n520) );
  DFND1 \buffer_6_rd_ptr_reg[1]  ( .D(n437), .CPN(clk), .Q(buffer_6_rd_ptr[1]), 
        .QN(n519) );
  DFND1 \buffer_6_rd_ptr_reg[2]  ( .D(n436), .CPN(clk), .Q(buffer_6_rd_ptr[2])
         );
  DFND1 \router_port_6_reg[19]  ( .D(n439), .CPN(clk), .Q(router_port_6[19])
         );
  DFND1 \router_port_6_reg[18]  ( .D(n440), .CPN(clk), .Q(router_port_6[18])
         );
  DFND1 \router_port_6_reg[17]  ( .D(n441), .CPN(clk), .Q(router_port_6[17])
         );
  DFND1 \router_port_6_reg[16]  ( .D(n442), .CPN(clk), .Q(router_port_6[16])
         );
  DFND1 \router_port_6_reg[15]  ( .D(n443), .CPN(clk), .Q(router_port_6[15])
         );
  DFND1 \router_port_6_reg[14]  ( .D(n444), .CPN(clk), .Q(router_port_6[14])
         );
  DFND1 \router_port_6_reg[13]  ( .D(n445), .CPN(clk), .Q(router_port_6[13])
         );
  DFND1 \router_port_6_reg[12]  ( .D(n446), .CPN(clk), .Q(router_port_6[12])
         );
  DFND1 \router_port_6_reg[11]  ( .D(n447), .CPN(clk), .Q(router_port_6[11])
         );
  DFND1 \router_port_6_reg[10]  ( .D(n448), .CPN(clk), .Q(router_port_6[10])
         );
  DFND1 \router_port_6_reg[9]  ( .D(n449), .CPN(clk), .Q(router_port_6[9]) );
  DFND1 \router_port_6_reg[8]  ( .D(n450), .CPN(clk), .Q(router_port_6[8]) );
  DFND1 \router_port_6_reg[7]  ( .D(n451), .CPN(clk), .Q(router_port_6[7]) );
  DFND1 \router_port_6_reg[6]  ( .D(n452), .CPN(clk), .Q(router_port_6[6]) );
  DFND1 \router_port_6_reg[5]  ( .D(n453), .CPN(clk), .Q(router_port_6[5]) );
  DFND1 \router_port_6_reg[4]  ( .D(n454), .CPN(clk), .Q(router_port_6[4]) );
  DFND1 \router_port_6_reg[3]  ( .D(n455), .CPN(clk), .Q(router_port_6[3]) );
  DFND1 \router_port_6_reg[2]  ( .D(n456), .CPN(clk), .Q(router_port_6[2]) );
  DFND1 \router_port_6_reg[1]  ( .D(n457), .CPN(clk), .Q(router_port_6[1]) );
  DFND1 \router_port_6_reg[0]  ( .D(n458), .CPN(clk), .Q(router_port_6[0]) );
  DFQD1 buffer_5_rd_en_reg ( .D(n31), .CP(clk), .Q(buffer_5_rd_en) );
  DFND1 \buffer_5_rd_ptr_reg[0]  ( .D(n415), .CPN(clk), .Q(buffer_5_rd_ptr[0]), 
        .QN(n518) );
  DFND1 \buffer_5_rd_ptr_reg[1]  ( .D(n414), .CPN(clk), .Q(buffer_5_rd_ptr[1]), 
        .QN(n517) );
  DFND1 \buffer_5_rd_ptr_reg[2]  ( .D(n413), .CPN(clk), .Q(buffer_5_rd_ptr[2])
         );
  DFND1 \router_port_5_reg[19]  ( .D(n416), .CPN(clk), .Q(router_port_5[19])
         );
  DFND1 \router_port_5_reg[18]  ( .D(n417), .CPN(clk), .Q(router_port_5[18])
         );
  DFND1 \router_port_5_reg[17]  ( .D(n418), .CPN(clk), .Q(router_port_5[17])
         );
  DFND1 \router_port_5_reg[16]  ( .D(n419), .CPN(clk), .Q(router_port_5[16])
         );
  DFND1 \router_port_5_reg[15]  ( .D(n420), .CPN(clk), .Q(router_port_5[15])
         );
  DFND1 \router_port_5_reg[14]  ( .D(n421), .CPN(clk), .Q(router_port_5[14])
         );
  DFND1 \router_port_5_reg[13]  ( .D(n422), .CPN(clk), .Q(router_port_5[13])
         );
  DFND1 \router_port_5_reg[12]  ( .D(n423), .CPN(clk), .Q(router_port_5[12])
         );
  DFND1 \router_port_5_reg[11]  ( .D(n424), .CPN(clk), .Q(router_port_5[11])
         );
  DFND1 \router_port_5_reg[10]  ( .D(n425), .CPN(clk), .Q(router_port_5[10])
         );
  DFND1 \router_port_5_reg[9]  ( .D(n426), .CPN(clk), .Q(router_port_5[9]) );
  DFND1 \router_port_5_reg[8]  ( .D(n427), .CPN(clk), .Q(router_port_5[8]) );
  DFND1 \router_port_5_reg[7]  ( .D(n428), .CPN(clk), .Q(router_port_5[7]) );
  DFND1 \router_port_5_reg[6]  ( .D(n429), .CPN(clk), .Q(router_port_5[6]) );
  DFND1 \router_port_5_reg[5]  ( .D(n430), .CPN(clk), .Q(router_port_5[5]) );
  DFND1 \router_port_5_reg[4]  ( .D(n431), .CPN(clk), .Q(router_port_5[4]) );
  DFND1 \router_port_5_reg[3]  ( .D(n432), .CPN(clk), .Q(router_port_5[3]) );
  DFND1 \router_port_5_reg[2]  ( .D(n433), .CPN(clk), .Q(router_port_5[2]) );
  DFND1 \router_port_5_reg[1]  ( .D(n434), .CPN(clk), .Q(router_port_5[1]) );
  DFND1 \router_port_5_reg[0]  ( .D(n435), .CPN(clk), .Q(router_port_5[0]) );
  DFQD1 buffer_4_rd_en_reg ( .D(n30), .CP(clk), .Q(buffer_4_rd_en) );
  DFND1 \buffer_4_rd_ptr_reg[0]  ( .D(n392), .CPN(clk), .Q(buffer_4_rd_ptr[0]), 
        .QN(n516) );
  DFND1 \buffer_4_rd_ptr_reg[1]  ( .D(n391), .CPN(clk), .Q(buffer_4_rd_ptr[1]), 
        .QN(n515) );
  DFND1 \buffer_4_rd_ptr_reg[2]  ( .D(n390), .CPN(clk), .Q(buffer_4_rd_ptr[2])
         );
  DFND1 \router_port_4_reg[19]  ( .D(n393), .CPN(clk), .Q(router_port_4[19])
         );
  DFND1 \router_port_4_reg[18]  ( .D(n394), .CPN(clk), .Q(router_port_4[18])
         );
  DFND1 \router_port_4_reg[17]  ( .D(n395), .CPN(clk), .Q(router_port_4[17])
         );
  DFND1 \router_port_4_reg[16]  ( .D(n396), .CPN(clk), .Q(router_port_4[16])
         );
  DFND1 \router_port_4_reg[15]  ( .D(n397), .CPN(clk), .Q(router_port_4[15])
         );
  DFND1 \router_port_4_reg[14]  ( .D(n398), .CPN(clk), .Q(router_port_4[14])
         );
  DFND1 \router_port_4_reg[13]  ( .D(n399), .CPN(clk), .Q(router_port_4[13])
         );
  DFND1 \router_port_4_reg[12]  ( .D(n400), .CPN(clk), .Q(router_port_4[12])
         );
  DFND1 \router_port_4_reg[11]  ( .D(n401), .CPN(clk), .Q(router_port_4[11])
         );
  DFND1 \router_port_4_reg[10]  ( .D(n402), .CPN(clk), .Q(router_port_4[10])
         );
  DFND1 \router_port_4_reg[9]  ( .D(n403), .CPN(clk), .Q(router_port_4[9]) );
  DFND1 \router_port_4_reg[8]  ( .D(n404), .CPN(clk), .Q(router_port_4[8]) );
  DFND1 \router_port_4_reg[7]  ( .D(n405), .CPN(clk), .Q(router_port_4[7]) );
  DFND1 \router_port_4_reg[6]  ( .D(n406), .CPN(clk), .Q(router_port_4[6]) );
  DFND1 \router_port_4_reg[5]  ( .D(n407), .CPN(clk), .Q(router_port_4[5]) );
  DFND1 \router_port_4_reg[4]  ( .D(n408), .CPN(clk), .Q(router_port_4[4]) );
  DFND1 \router_port_4_reg[3]  ( .D(n409), .CPN(clk), .Q(router_port_4[3]) );
  DFND1 \router_port_4_reg[2]  ( .D(n410), .CPN(clk), .Q(router_port_4[2]) );
  DFND1 \router_port_4_reg[1]  ( .D(n411), .CPN(clk), .Q(router_port_4[1]) );
  DFND1 \router_port_4_reg[0]  ( .D(n412), .CPN(clk), .Q(router_port_4[0]) );
  DFQD1 buffer_3_rd_en_reg ( .D(n29), .CP(clk), .Q(buffer_3_rd_en) );
  DFND1 \buffer_3_rd_ptr_reg[0]  ( .D(n369), .CPN(clk), .Q(buffer_3_rd_ptr[0]), 
        .QN(n514) );
  DFND1 \buffer_3_rd_ptr_reg[1]  ( .D(n368), .CPN(clk), .Q(buffer_3_rd_ptr[1]), 
        .QN(n513) );
  DFND1 \buffer_3_rd_ptr_reg[2]  ( .D(n367), .CPN(clk), .Q(buffer_3_rd_ptr[2])
         );
  DFND1 \router_port_3_reg[19]  ( .D(n370), .CPN(clk), .Q(router_port_3[19])
         );
  DFND1 \router_port_3_reg[18]  ( .D(n371), .CPN(clk), .Q(router_port_3[18])
         );
  DFND1 \router_port_3_reg[17]  ( .D(n372), .CPN(clk), .Q(router_port_3[17])
         );
  DFND1 \router_port_3_reg[16]  ( .D(n373), .CPN(clk), .Q(router_port_3[16])
         );
  DFND1 \router_port_3_reg[15]  ( .D(n374), .CPN(clk), .Q(router_port_3[15])
         );
  DFND1 \router_port_3_reg[14]  ( .D(n375), .CPN(clk), .Q(router_port_3[14])
         );
  DFND1 \router_port_3_reg[13]  ( .D(n376), .CPN(clk), .Q(router_port_3[13])
         );
  DFND1 \router_port_3_reg[12]  ( .D(n377), .CPN(clk), .Q(router_port_3[12])
         );
  DFND1 \router_port_3_reg[11]  ( .D(n378), .CPN(clk), .Q(router_port_3[11])
         );
  DFND1 \router_port_3_reg[10]  ( .D(n379), .CPN(clk), .Q(router_port_3[10])
         );
  DFND1 \router_port_3_reg[9]  ( .D(n380), .CPN(clk), .Q(router_port_3[9]) );
  DFND1 \router_port_3_reg[8]  ( .D(n381), .CPN(clk), .Q(router_port_3[8]) );
  DFND1 \router_port_3_reg[7]  ( .D(n382), .CPN(clk), .Q(router_port_3[7]) );
  DFND1 \router_port_3_reg[6]  ( .D(n383), .CPN(clk), .Q(router_port_3[6]) );
  DFND1 \router_port_3_reg[5]  ( .D(n384), .CPN(clk), .Q(router_port_3[5]) );
  DFND1 \router_port_3_reg[4]  ( .D(n385), .CPN(clk), .Q(router_port_3[4]) );
  DFND1 \router_port_3_reg[3]  ( .D(n386), .CPN(clk), .Q(router_port_3[3]) );
  DFND1 \router_port_3_reg[2]  ( .D(n387), .CPN(clk), .Q(router_port_3[2]) );
  DFND1 \router_port_3_reg[1]  ( .D(n388), .CPN(clk), .Q(router_port_3[1]) );
  DFND1 \router_port_3_reg[0]  ( .D(n389), .CPN(clk), .Q(router_port_3[0]) );
  DFQD1 buffer_2_rd_en_reg ( .D(n28), .CP(clk), .Q(buffer_2_rd_en) );
  DFND1 \buffer_2_rd_ptr_reg[0]  ( .D(n346), .CPN(clk), .Q(buffer_2_rd_ptr[0]), 
        .QN(n512) );
  DFND1 \buffer_2_rd_ptr_reg[1]  ( .D(n345), .CPN(clk), .Q(buffer_2_rd_ptr[1]), 
        .QN(n511) );
  DFND1 \buffer_2_rd_ptr_reg[2]  ( .D(n344), .CPN(clk), .Q(buffer_2_rd_ptr[2])
         );
  DFND1 \router_port_2_reg[19]  ( .D(n347), .CPN(clk), .Q(router_port_2[19])
         );
  DFND1 \router_port_2_reg[18]  ( .D(n348), .CPN(clk), .Q(router_port_2[18])
         );
  DFND1 \router_port_2_reg[17]  ( .D(n349), .CPN(clk), .Q(router_port_2[17])
         );
  DFND1 \router_port_2_reg[16]  ( .D(n350), .CPN(clk), .Q(router_port_2[16])
         );
  DFND1 \router_port_2_reg[15]  ( .D(n351), .CPN(clk), .Q(router_port_2[15])
         );
  DFND1 \router_port_2_reg[14]  ( .D(n352), .CPN(clk), .Q(router_port_2[14])
         );
  DFND1 \router_port_2_reg[13]  ( .D(n353), .CPN(clk), .Q(router_port_2[13])
         );
  DFND1 \router_port_2_reg[12]  ( .D(n354), .CPN(clk), .Q(router_port_2[12])
         );
  DFND1 \router_port_2_reg[11]  ( .D(n355), .CPN(clk), .Q(router_port_2[11])
         );
  DFND1 \router_port_2_reg[10]  ( .D(n356), .CPN(clk), .Q(router_port_2[10])
         );
  DFND1 \router_port_2_reg[9]  ( .D(n357), .CPN(clk), .Q(router_port_2[9]) );
  DFND1 \router_port_2_reg[8]  ( .D(n358), .CPN(clk), .Q(router_port_2[8]) );
  DFND1 \router_port_2_reg[7]  ( .D(n359), .CPN(clk), .Q(router_port_2[7]) );
  DFND1 \router_port_2_reg[6]  ( .D(n360), .CPN(clk), .Q(router_port_2[6]) );
  DFND1 \router_port_2_reg[5]  ( .D(n361), .CPN(clk), .Q(router_port_2[5]) );
  DFND1 \router_port_2_reg[4]  ( .D(n362), .CPN(clk), .Q(router_port_2[4]) );
  DFND1 \router_port_2_reg[3]  ( .D(n363), .CPN(clk), .Q(router_port_2[3]) );
  DFND1 \router_port_2_reg[2]  ( .D(n364), .CPN(clk), .Q(router_port_2[2]) );
  DFND1 \router_port_2_reg[1]  ( .D(n365), .CPN(clk), .Q(router_port_2[1]) );
  DFND1 \router_port_2_reg[0]  ( .D(n366), .CPN(clk), .Q(router_port_2[0]) );
  DFQD1 buffer_1_rd_en_reg ( .D(n27), .CP(clk), .Q(buffer_1_rd_en) );
  DFND1 \buffer_1_rd_ptr_reg[0]  ( .D(n323), .CPN(clk), .Q(buffer_1_rd_ptr[0]), 
        .QN(n510) );
  DFND1 \buffer_1_rd_ptr_reg[1]  ( .D(n322), .CPN(clk), .Q(buffer_1_rd_ptr[1]), 
        .QN(n509) );
  DFND1 \buffer_1_rd_ptr_reg[2]  ( .D(n321), .CPN(clk), .Q(buffer_1_rd_ptr[2])
         );
  DFND1 \router_port_1_reg[19]  ( .D(n324), .CPN(clk), .Q(router_port_1[19])
         );
  DFND1 \router_port_1_reg[18]  ( .D(n325), .CPN(clk), .Q(router_port_1[18])
         );
  DFND1 \router_port_1_reg[17]  ( .D(n326), .CPN(clk), .Q(router_port_1[17])
         );
  DFND1 \router_port_1_reg[16]  ( .D(n327), .CPN(clk), .Q(router_port_1[16])
         );
  DFND1 \router_port_1_reg[15]  ( .D(n328), .CPN(clk), .Q(router_port_1[15])
         );
  DFND1 \router_port_1_reg[14]  ( .D(n329), .CPN(clk), .Q(router_port_1[14])
         );
  DFND1 \router_port_1_reg[13]  ( .D(n330), .CPN(clk), .Q(router_port_1[13])
         );
  DFND1 \router_port_1_reg[12]  ( .D(n331), .CPN(clk), .Q(router_port_1[12])
         );
  DFND1 \router_port_1_reg[11]  ( .D(n332), .CPN(clk), .Q(router_port_1[11])
         );
  DFND1 \router_port_1_reg[10]  ( .D(n333), .CPN(clk), .Q(router_port_1[10])
         );
  DFND1 \router_port_1_reg[9]  ( .D(n334), .CPN(clk), .Q(router_port_1[9]) );
  DFND1 \router_port_1_reg[8]  ( .D(n335), .CPN(clk), .Q(router_port_1[8]) );
  DFND1 \router_port_1_reg[7]  ( .D(n336), .CPN(clk), .Q(router_port_1[7]) );
  DFND1 \router_port_1_reg[6]  ( .D(n337), .CPN(clk), .Q(router_port_1[6]) );
  DFND1 \router_port_1_reg[5]  ( .D(n338), .CPN(clk), .Q(router_port_1[5]) );
  DFND1 \router_port_1_reg[4]  ( .D(n339), .CPN(clk), .Q(router_port_1[4]) );
  DFND1 \router_port_1_reg[3]  ( .D(n340), .CPN(clk), .Q(router_port_1[3]) );
  DFND1 \router_port_1_reg[2]  ( .D(n341), .CPN(clk), .Q(router_port_1[2]) );
  DFND1 \router_port_1_reg[1]  ( .D(n342), .CPN(clk), .Q(router_port_1[1]) );
  DFND1 \router_port_1_reg[0]  ( .D(n343), .CPN(clk), .Q(router_port_1[0]) );
  DFQD1 buffer_0_rd_en_reg ( .D(n26), .CP(clk), .Q(buffer_0_rd_en) );
  DFND1 \buffer_0_rd_ptr_reg[0]  ( .D(n300), .CPN(clk), .Q(buffer_0_rd_ptr[0]), 
        .QN(n508) );
  DFND1 \buffer_0_rd_ptr_reg[1]  ( .D(n299), .CPN(clk), .Q(buffer_0_rd_ptr[1]), 
        .QN(n507) );
  DFND1 \buffer_0_rd_ptr_reg[2]  ( .D(n298), .CPN(clk), .Q(buffer_0_rd_ptr[2])
         );
  DFND1 \router_port_0_reg[19]  ( .D(n301), .CPN(clk), .Q(router_port_0[19])
         );
  DFND1 \router_port_0_reg[18]  ( .D(n302), .CPN(clk), .Q(router_port_0[18])
         );
  DFND1 \router_port_0_reg[17]  ( .D(n303), .CPN(clk), .Q(router_port_0[17])
         );
  DFND1 \router_port_0_reg[16]  ( .D(n304), .CPN(clk), .Q(router_port_0[16])
         );
  DFND1 \router_port_0_reg[15]  ( .D(n305), .CPN(clk), .Q(router_port_0[15])
         );
  DFND1 \router_port_0_reg[14]  ( .D(n306), .CPN(clk), .Q(router_port_0[14])
         );
  DFND1 \router_port_0_reg[13]  ( .D(n307), .CPN(clk), .Q(router_port_0[13])
         );
  DFND1 \router_port_0_reg[12]  ( .D(n308), .CPN(clk), .Q(router_port_0[12])
         );
  DFND1 \router_port_0_reg[11]  ( .D(n309), .CPN(clk), .Q(router_port_0[11])
         );
  DFND1 \router_port_0_reg[10]  ( .D(n310), .CPN(clk), .Q(router_port_0[10])
         );
  DFND1 \router_port_0_reg[9]  ( .D(n311), .CPN(clk), .Q(router_port_0[9]) );
  DFND1 \router_port_0_reg[8]  ( .D(n312), .CPN(clk), .Q(router_port_0[8]) );
  DFND1 \router_port_0_reg[7]  ( .D(n313), .CPN(clk), .Q(router_port_0[7]) );
  DFND1 \router_port_0_reg[6]  ( .D(n314), .CPN(clk), .Q(router_port_0[6]) );
  DFND1 \router_port_0_reg[5]  ( .D(n315), .CPN(clk), .Q(router_port_0[5]) );
  DFND1 \router_port_0_reg[4]  ( .D(n316), .CPN(clk), .Q(router_port_0[4]) );
  DFND1 \router_port_0_reg[3]  ( .D(n317), .CPN(clk), .Q(router_port_0[3]) );
  DFND1 \router_port_0_reg[2]  ( .D(n318), .CPN(clk), .Q(router_port_0[2]) );
  DFND1 \router_port_0_reg[1]  ( .D(n319), .CPN(clk), .Q(router_port_0[1]) );
  DFND1 \router_port_0_reg[0]  ( .D(n320), .CPN(clk), .Q(router_port_0[0]) );
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
  TIEL U532 ( .ZN(\buffer_7_data_in[19] ) );
  INR2XD0 U533 ( .A1(buffer_7_rd_en), .B1(rst), .ZN(n483) );
  INR2XD0 U534 ( .A1(buffer_6_rd_en), .B1(rst), .ZN(n486) );
  INR2XD0 U535 ( .A1(buffer_5_rd_en), .B1(rst), .ZN(n489) );
  INR2XD0 U536 ( .A1(buffer_4_rd_en), .B1(rst), .ZN(n492) );
  INR2XD0 U537 ( .A1(buffer_3_rd_en), .B1(rst), .ZN(n495) );
  INR2XD0 U538 ( .A1(buffer_2_rd_en), .B1(rst), .ZN(n498) );
  INR2XD0 U539 ( .A1(buffer_1_rd_en), .B1(rst), .ZN(n501) );
  INR2XD0 U540 ( .A1(buffer_0_rd_en), .B1(rst), .ZN(n504) );
  TIEH U541 ( .Z(\buffer_1_data_in[16] ) );
  MUX2D0 U542 ( .I0(router_port_7[0]), .I1(buffer_7_data_out[0]), .S(n483), 
        .Z(n481) );
  MUX2D0 U543 ( .I0(router_port_7[1]), .I1(buffer_7_data_out[1]), .S(n483), 
        .Z(n480) );
  MUX2D0 U544 ( .I0(router_port_7[2]), .I1(buffer_7_data_out[2]), .S(n483), 
        .Z(n479) );
  MUX2D0 U545 ( .I0(router_port_7[3]), .I1(buffer_7_data_out[3]), .S(n483), 
        .Z(n478) );
  MUX2D0 U546 ( .I0(router_port_7[4]), .I1(buffer_7_data_out[4]), .S(n483), 
        .Z(n477) );
  MUX2D0 U547 ( .I0(router_port_7[5]), .I1(buffer_7_data_out[5]), .S(n483), 
        .Z(n476) );
  MUX2D0 U548 ( .I0(router_port_7[6]), .I1(buffer_7_data_out[6]), .S(n483), 
        .Z(n475) );
  MUX2D0 U549 ( .I0(router_port_7[7]), .I1(buffer_7_data_out[7]), .S(n483), 
        .Z(n474) );
  MUX2D0 U550 ( .I0(router_port_7[8]), .I1(buffer_7_data_out[8]), .S(n483), 
        .Z(n473) );
  MUX2D0 U551 ( .I0(router_port_7[9]), .I1(buffer_7_data_out[9]), .S(n483), 
        .Z(n472) );
  MUX2D0 U552 ( .I0(router_port_7[10]), .I1(buffer_7_data_out[10]), .S(n483), 
        .Z(n471) );
  MUX2D0 U553 ( .I0(router_port_7[11]), .I1(buffer_7_data_out[11]), .S(n483), 
        .Z(n470) );
  MUX2D0 U554 ( .I0(router_port_7[12]), .I1(buffer_7_data_out[12]), .S(n483), 
        .Z(n469) );
  MUX2D0 U555 ( .I0(router_port_7[13]), .I1(buffer_7_data_out[13]), .S(n483), 
        .Z(n468) );
  MUX2D0 U556 ( .I0(router_port_7[14]), .I1(buffer_7_data_out[14]), .S(n483), 
        .Z(n467) );
  MUX2D0 U557 ( .I0(router_port_7[15]), .I1(buffer_7_data_out[15]), .S(n483), 
        .Z(n466) );
  MUX2D0 U558 ( .I0(router_port_7[16]), .I1(buffer_7_data_out[16]), .S(n483), 
        .Z(n465) );
  MUX2D0 U559 ( .I0(router_port_7[17]), .I1(buffer_7_data_out[17]), .S(n483), 
        .Z(n464) );
  MUX2D0 U560 ( .I0(router_port_7[18]), .I1(buffer_7_data_out[18]), .S(n483), 
        .Z(n463) );
  MUX2D0 U561 ( .I0(router_port_7[19]), .I1(buffer_7_data_out[19]), .S(n483), 
        .Z(n462) );
  XNR2D0 U562 ( .A1(n483), .A2(n522), .ZN(n461) );
  CKXOR2D0 U563 ( .A1(n521), .A2(n484), .Z(n460) );
  CKXOR2D0 U564 ( .A1(n485), .A2(buffer_7_rd_ptr[2]), .Z(n459) );
  NR2D0 U565 ( .A1(n521), .A2(n484), .ZN(n485) );
  IND2D0 U566 ( .A1(n522), .B1(n483), .ZN(n484) );
  MUX2D0 U567 ( .I0(router_port_6[0]), .I1(buffer_6_data_out[0]), .S(n486), 
        .Z(n458) );
  MUX2D0 U568 ( .I0(router_port_6[1]), .I1(buffer_6_data_out[1]), .S(n486), 
        .Z(n457) );
  MUX2D0 U569 ( .I0(router_port_6[2]), .I1(buffer_6_data_out[2]), .S(n486), 
        .Z(n456) );
  MUX2D0 U570 ( .I0(router_port_6[3]), .I1(buffer_6_data_out[3]), .S(n486), 
        .Z(n455) );
  MUX2D0 U571 ( .I0(router_port_6[4]), .I1(buffer_6_data_out[4]), .S(n486), 
        .Z(n454) );
  MUX2D0 U572 ( .I0(router_port_6[5]), .I1(buffer_6_data_out[5]), .S(n486), 
        .Z(n453) );
  MUX2D0 U573 ( .I0(router_port_6[6]), .I1(buffer_6_data_out[6]), .S(n486), 
        .Z(n452) );
  MUX2D0 U574 ( .I0(router_port_6[7]), .I1(buffer_6_data_out[7]), .S(n486), 
        .Z(n451) );
  MUX2D0 U575 ( .I0(router_port_6[8]), .I1(buffer_6_data_out[8]), .S(n486), 
        .Z(n450) );
  MUX2D0 U576 ( .I0(router_port_6[9]), .I1(buffer_6_data_out[9]), .S(n486), 
        .Z(n449) );
  MUX2D0 U577 ( .I0(router_port_6[10]), .I1(buffer_6_data_out[10]), .S(n486), 
        .Z(n448) );
  MUX2D0 U578 ( .I0(router_port_6[11]), .I1(buffer_6_data_out[11]), .S(n486), 
        .Z(n447) );
  MUX2D0 U579 ( .I0(router_port_6[12]), .I1(buffer_6_data_out[12]), .S(n486), 
        .Z(n446) );
  MUX2D0 U580 ( .I0(router_port_6[13]), .I1(buffer_6_data_out[13]), .S(n486), 
        .Z(n445) );
  MUX2D0 U581 ( .I0(router_port_6[14]), .I1(buffer_6_data_out[14]), .S(n486), 
        .Z(n444) );
  MUX2D0 U582 ( .I0(router_port_6[15]), .I1(buffer_6_data_out[15]), .S(n486), 
        .Z(n443) );
  MUX2D0 U583 ( .I0(router_port_6[16]), .I1(buffer_6_data_out[16]), .S(n486), 
        .Z(n442) );
  MUX2D0 U584 ( .I0(router_port_6[17]), .I1(buffer_6_data_out[17]), .S(n486), 
        .Z(n441) );
  MUX2D0 U585 ( .I0(router_port_6[18]), .I1(buffer_6_data_out[18]), .S(n486), 
        .Z(n440) );
  MUX2D0 U586 ( .I0(router_port_6[19]), .I1(buffer_6_data_out[19]), .S(n486), 
        .Z(n439) );
  XNR2D0 U587 ( .A1(n486), .A2(n520), .ZN(n438) );
  CKXOR2D0 U588 ( .A1(n519), .A2(n487), .Z(n437) );
  CKXOR2D0 U589 ( .A1(n488), .A2(buffer_6_rd_ptr[2]), .Z(n436) );
  NR2D0 U590 ( .A1(n519), .A2(n487), .ZN(n488) );
  IND2D0 U591 ( .A1(n520), .B1(n486), .ZN(n487) );
  MUX2D0 U592 ( .I0(router_port_5[0]), .I1(buffer_5_data_out[0]), .S(n489), 
        .Z(n435) );
  MUX2D0 U593 ( .I0(router_port_5[1]), .I1(buffer_5_data_out[1]), .S(n489), 
        .Z(n434) );
  MUX2D0 U594 ( .I0(router_port_5[2]), .I1(buffer_5_data_out[2]), .S(n489), 
        .Z(n433) );
  MUX2D0 U595 ( .I0(router_port_5[3]), .I1(buffer_5_data_out[3]), .S(n489), 
        .Z(n432) );
  MUX2D0 U596 ( .I0(router_port_5[4]), .I1(buffer_5_data_out[4]), .S(n489), 
        .Z(n431) );
  MUX2D0 U597 ( .I0(router_port_5[5]), .I1(buffer_5_data_out[5]), .S(n489), 
        .Z(n430) );
  MUX2D0 U598 ( .I0(router_port_5[6]), .I1(buffer_5_data_out[6]), .S(n489), 
        .Z(n429) );
  MUX2D0 U599 ( .I0(router_port_5[7]), .I1(buffer_5_data_out[7]), .S(n489), 
        .Z(n428) );
  MUX2D0 U600 ( .I0(router_port_5[8]), .I1(buffer_5_data_out[8]), .S(n489), 
        .Z(n427) );
  MUX2D0 U601 ( .I0(router_port_5[9]), .I1(buffer_5_data_out[9]), .S(n489), 
        .Z(n426) );
  MUX2D0 U602 ( .I0(router_port_5[10]), .I1(buffer_5_data_out[10]), .S(n489), 
        .Z(n425) );
  MUX2D0 U603 ( .I0(router_port_5[11]), .I1(buffer_5_data_out[11]), .S(n489), 
        .Z(n424) );
  MUX2D0 U604 ( .I0(router_port_5[12]), .I1(buffer_5_data_out[12]), .S(n489), 
        .Z(n423) );
  MUX2D0 U605 ( .I0(router_port_5[13]), .I1(buffer_5_data_out[13]), .S(n489), 
        .Z(n422) );
  MUX2D0 U606 ( .I0(router_port_5[14]), .I1(buffer_5_data_out[14]), .S(n489), 
        .Z(n421) );
  MUX2D0 U607 ( .I0(router_port_5[15]), .I1(buffer_5_data_out[15]), .S(n489), 
        .Z(n420) );
  MUX2D0 U608 ( .I0(router_port_5[16]), .I1(buffer_5_data_out[16]), .S(n489), 
        .Z(n419) );
  MUX2D0 U609 ( .I0(router_port_5[17]), .I1(buffer_5_data_out[17]), .S(n489), 
        .Z(n418) );
  MUX2D0 U610 ( .I0(router_port_5[18]), .I1(buffer_5_data_out[18]), .S(n489), 
        .Z(n417) );
  MUX2D0 U611 ( .I0(router_port_5[19]), .I1(buffer_5_data_out[19]), .S(n489), 
        .Z(n416) );
  XNR2D0 U612 ( .A1(n489), .A2(n518), .ZN(n415) );
  CKXOR2D0 U613 ( .A1(n517), .A2(n490), .Z(n414) );
  CKXOR2D0 U614 ( .A1(n491), .A2(buffer_5_rd_ptr[2]), .Z(n413) );
  NR2D0 U615 ( .A1(n517), .A2(n490), .ZN(n491) );
  IND2D0 U616 ( .A1(n518), .B1(n489), .ZN(n490) );
  MUX2D0 U617 ( .I0(router_port_4[0]), .I1(buffer_4_data_out[0]), .S(n492), 
        .Z(n412) );
  MUX2D0 U618 ( .I0(router_port_4[1]), .I1(buffer_4_data_out[1]), .S(n492), 
        .Z(n411) );
  MUX2D0 U619 ( .I0(router_port_4[2]), .I1(buffer_4_data_out[2]), .S(n492), 
        .Z(n410) );
  MUX2D0 U620 ( .I0(router_port_4[3]), .I1(buffer_4_data_out[3]), .S(n492), 
        .Z(n409) );
  MUX2D0 U621 ( .I0(router_port_4[4]), .I1(buffer_4_data_out[4]), .S(n492), 
        .Z(n408) );
  MUX2D0 U622 ( .I0(router_port_4[5]), .I1(buffer_4_data_out[5]), .S(n492), 
        .Z(n407) );
  MUX2D0 U623 ( .I0(router_port_4[6]), .I1(buffer_4_data_out[6]), .S(n492), 
        .Z(n406) );
  MUX2D0 U624 ( .I0(router_port_4[7]), .I1(buffer_4_data_out[7]), .S(n492), 
        .Z(n405) );
  MUX2D0 U625 ( .I0(router_port_4[8]), .I1(buffer_4_data_out[8]), .S(n492), 
        .Z(n404) );
  MUX2D0 U626 ( .I0(router_port_4[9]), .I1(buffer_4_data_out[9]), .S(n492), 
        .Z(n403) );
  MUX2D0 U627 ( .I0(router_port_4[10]), .I1(buffer_4_data_out[10]), .S(n492), 
        .Z(n402) );
  MUX2D0 U628 ( .I0(router_port_4[11]), .I1(buffer_4_data_out[11]), .S(n492), 
        .Z(n401) );
  MUX2D0 U629 ( .I0(router_port_4[12]), .I1(buffer_4_data_out[12]), .S(n492), 
        .Z(n400) );
  MUX2D0 U630 ( .I0(router_port_4[13]), .I1(buffer_4_data_out[13]), .S(n492), 
        .Z(n399) );
  MUX2D0 U631 ( .I0(router_port_4[14]), .I1(buffer_4_data_out[14]), .S(n492), 
        .Z(n398) );
  MUX2D0 U632 ( .I0(router_port_4[15]), .I1(buffer_4_data_out[15]), .S(n492), 
        .Z(n397) );
  MUX2D0 U633 ( .I0(router_port_4[16]), .I1(buffer_4_data_out[16]), .S(n492), 
        .Z(n396) );
  MUX2D0 U634 ( .I0(router_port_4[17]), .I1(buffer_4_data_out[17]), .S(n492), 
        .Z(n395) );
  MUX2D0 U635 ( .I0(router_port_4[18]), .I1(buffer_4_data_out[18]), .S(n492), 
        .Z(n394) );
  MUX2D0 U636 ( .I0(router_port_4[19]), .I1(buffer_4_data_out[19]), .S(n492), 
        .Z(n393) );
  XNR2D0 U637 ( .A1(n492), .A2(n516), .ZN(n392) );
  CKXOR2D0 U638 ( .A1(n515), .A2(n493), .Z(n391) );
  CKXOR2D0 U639 ( .A1(n494), .A2(buffer_4_rd_ptr[2]), .Z(n390) );
  NR2D0 U640 ( .A1(n515), .A2(n493), .ZN(n494) );
  IND2D0 U641 ( .A1(n516), .B1(n492), .ZN(n493) );
  MUX2D0 U642 ( .I0(router_port_3[0]), .I1(buffer_3_data_out[0]), .S(n495), 
        .Z(n389) );
  MUX2D0 U643 ( .I0(router_port_3[1]), .I1(buffer_3_data_out[1]), .S(n495), 
        .Z(n388) );
  MUX2D0 U644 ( .I0(router_port_3[2]), .I1(buffer_3_data_out[2]), .S(n495), 
        .Z(n387) );
  MUX2D0 U645 ( .I0(router_port_3[3]), .I1(buffer_3_data_out[3]), .S(n495), 
        .Z(n386) );
  MUX2D0 U646 ( .I0(router_port_3[4]), .I1(buffer_3_data_out[4]), .S(n495), 
        .Z(n385) );
  MUX2D0 U647 ( .I0(router_port_3[5]), .I1(buffer_3_data_out[5]), .S(n495), 
        .Z(n384) );
  MUX2D0 U648 ( .I0(router_port_3[6]), .I1(buffer_3_data_out[6]), .S(n495), 
        .Z(n383) );
  MUX2D0 U649 ( .I0(router_port_3[7]), .I1(buffer_3_data_out[7]), .S(n495), 
        .Z(n382) );
  MUX2D0 U650 ( .I0(router_port_3[8]), .I1(buffer_3_data_out[8]), .S(n495), 
        .Z(n381) );
  MUX2D0 U651 ( .I0(router_port_3[9]), .I1(buffer_3_data_out[9]), .S(n495), 
        .Z(n380) );
  MUX2D0 U652 ( .I0(router_port_3[10]), .I1(buffer_3_data_out[10]), .S(n495), 
        .Z(n379) );
  MUX2D0 U653 ( .I0(router_port_3[11]), .I1(buffer_3_data_out[11]), .S(n495), 
        .Z(n378) );
  MUX2D0 U654 ( .I0(router_port_3[12]), .I1(buffer_3_data_out[12]), .S(n495), 
        .Z(n377) );
  MUX2D0 U655 ( .I0(router_port_3[13]), .I1(buffer_3_data_out[13]), .S(n495), 
        .Z(n376) );
  MUX2D0 U656 ( .I0(router_port_3[14]), .I1(buffer_3_data_out[14]), .S(n495), 
        .Z(n375) );
  MUX2D0 U657 ( .I0(router_port_3[15]), .I1(buffer_3_data_out[15]), .S(n495), 
        .Z(n374) );
  MUX2D0 U658 ( .I0(router_port_3[16]), .I1(buffer_3_data_out[16]), .S(n495), 
        .Z(n373) );
  MUX2D0 U659 ( .I0(router_port_3[17]), .I1(buffer_3_data_out[17]), .S(n495), 
        .Z(n372) );
  MUX2D0 U660 ( .I0(router_port_3[18]), .I1(buffer_3_data_out[18]), .S(n495), 
        .Z(n371) );
  MUX2D0 U661 ( .I0(router_port_3[19]), .I1(buffer_3_data_out[19]), .S(n495), 
        .Z(n370) );
  XNR2D0 U662 ( .A1(n495), .A2(n514), .ZN(n369) );
  CKXOR2D0 U663 ( .A1(n513), .A2(n496), .Z(n368) );
  CKXOR2D0 U664 ( .A1(n497), .A2(buffer_3_rd_ptr[2]), .Z(n367) );
  NR2D0 U665 ( .A1(n513), .A2(n496), .ZN(n497) );
  IND2D0 U666 ( .A1(n514), .B1(n495), .ZN(n496) );
  MUX2D0 U667 ( .I0(router_port_2[0]), .I1(buffer_2_data_out[0]), .S(n498), 
        .Z(n366) );
  MUX2D0 U668 ( .I0(router_port_2[1]), .I1(buffer_2_data_out[1]), .S(n498), 
        .Z(n365) );
  MUX2D0 U669 ( .I0(router_port_2[2]), .I1(buffer_2_data_out[2]), .S(n498), 
        .Z(n364) );
  MUX2D0 U670 ( .I0(router_port_2[3]), .I1(buffer_2_data_out[3]), .S(n498), 
        .Z(n363) );
  MUX2D0 U671 ( .I0(router_port_2[4]), .I1(buffer_2_data_out[4]), .S(n498), 
        .Z(n362) );
  MUX2D0 U672 ( .I0(router_port_2[5]), .I1(buffer_2_data_out[5]), .S(n498), 
        .Z(n361) );
  MUX2D0 U673 ( .I0(router_port_2[6]), .I1(buffer_2_data_out[6]), .S(n498), 
        .Z(n360) );
  MUX2D0 U674 ( .I0(router_port_2[7]), .I1(buffer_2_data_out[7]), .S(n498), 
        .Z(n359) );
  MUX2D0 U675 ( .I0(router_port_2[8]), .I1(buffer_2_data_out[8]), .S(n498), 
        .Z(n358) );
  MUX2D0 U676 ( .I0(router_port_2[9]), .I1(buffer_2_data_out[9]), .S(n498), 
        .Z(n357) );
  MUX2D0 U677 ( .I0(router_port_2[10]), .I1(buffer_2_data_out[10]), .S(n498), 
        .Z(n356) );
  MUX2D0 U678 ( .I0(router_port_2[11]), .I1(buffer_2_data_out[11]), .S(n498), 
        .Z(n355) );
  MUX2D0 U679 ( .I0(router_port_2[12]), .I1(buffer_2_data_out[12]), .S(n498), 
        .Z(n354) );
  MUX2D0 U680 ( .I0(router_port_2[13]), .I1(buffer_2_data_out[13]), .S(n498), 
        .Z(n353) );
  MUX2D0 U681 ( .I0(router_port_2[14]), .I1(buffer_2_data_out[14]), .S(n498), 
        .Z(n352) );
  MUX2D0 U682 ( .I0(router_port_2[15]), .I1(buffer_2_data_out[15]), .S(n498), 
        .Z(n351) );
  MUX2D0 U683 ( .I0(router_port_2[16]), .I1(buffer_2_data_out[16]), .S(n498), 
        .Z(n350) );
  MUX2D0 U684 ( .I0(router_port_2[17]), .I1(buffer_2_data_out[17]), .S(n498), 
        .Z(n349) );
  MUX2D0 U685 ( .I0(router_port_2[18]), .I1(buffer_2_data_out[18]), .S(n498), 
        .Z(n348) );
  MUX2D0 U686 ( .I0(router_port_2[19]), .I1(buffer_2_data_out[19]), .S(n498), 
        .Z(n347) );
  XNR2D0 U687 ( .A1(n498), .A2(n512), .ZN(n346) );
  CKXOR2D0 U688 ( .A1(n511), .A2(n499), .Z(n345) );
  CKXOR2D0 U689 ( .A1(n500), .A2(buffer_2_rd_ptr[2]), .Z(n344) );
  NR2D0 U690 ( .A1(n511), .A2(n499), .ZN(n500) );
  IND2D0 U691 ( .A1(n512), .B1(n498), .ZN(n499) );
  MUX2D0 U692 ( .I0(router_port_1[0]), .I1(buffer_1_data_out[0]), .S(n501), 
        .Z(n343) );
  MUX2D0 U693 ( .I0(router_port_1[1]), .I1(buffer_1_data_out[1]), .S(n501), 
        .Z(n342) );
  MUX2D0 U694 ( .I0(router_port_1[2]), .I1(buffer_1_data_out[2]), .S(n501), 
        .Z(n341) );
  MUX2D0 U695 ( .I0(router_port_1[3]), .I1(buffer_1_data_out[3]), .S(n501), 
        .Z(n340) );
  MUX2D0 U696 ( .I0(router_port_1[4]), .I1(buffer_1_data_out[4]), .S(n501), 
        .Z(n339) );
  MUX2D0 U697 ( .I0(router_port_1[5]), .I1(buffer_1_data_out[5]), .S(n501), 
        .Z(n338) );
  MUX2D0 U698 ( .I0(router_port_1[6]), .I1(buffer_1_data_out[6]), .S(n501), 
        .Z(n337) );
  MUX2D0 U699 ( .I0(router_port_1[7]), .I1(buffer_1_data_out[7]), .S(n501), 
        .Z(n336) );
  MUX2D0 U700 ( .I0(router_port_1[8]), .I1(buffer_1_data_out[8]), .S(n501), 
        .Z(n335) );
  MUX2D0 U701 ( .I0(router_port_1[9]), .I1(buffer_1_data_out[9]), .S(n501), 
        .Z(n334) );
  MUX2D0 U702 ( .I0(router_port_1[10]), .I1(buffer_1_data_out[10]), .S(n501), 
        .Z(n333) );
  MUX2D0 U703 ( .I0(router_port_1[11]), .I1(buffer_1_data_out[11]), .S(n501), 
        .Z(n332) );
  MUX2D0 U704 ( .I0(router_port_1[12]), .I1(buffer_1_data_out[12]), .S(n501), 
        .Z(n331) );
  MUX2D0 U705 ( .I0(router_port_1[13]), .I1(buffer_1_data_out[13]), .S(n501), 
        .Z(n330) );
  CKND0 U706 ( .I(buffer_7_empty), .ZN(n33) );
  MUX2D0 U707 ( .I0(router_port_1[14]), .I1(buffer_1_data_out[14]), .S(n501), 
        .Z(n329) );
  MUX2D0 U708 ( .I0(router_port_1[15]), .I1(buffer_1_data_out[15]), .S(n501), 
        .Z(n328) );
  MUX2D0 U709 ( .I0(router_port_1[16]), .I1(buffer_1_data_out[16]), .S(n501), 
        .Z(n327) );
  MUX2D0 U710 ( .I0(router_port_1[17]), .I1(buffer_1_data_out[17]), .S(n501), 
        .Z(n326) );
  MUX2D0 U711 ( .I0(router_port_1[18]), .I1(buffer_1_data_out[18]), .S(n501), 
        .Z(n325) );
  MUX2D0 U712 ( .I0(router_port_1[19]), .I1(buffer_1_data_out[19]), .S(n501), 
        .Z(n324) );
  XNR2D0 U713 ( .A1(n501), .A2(n510), .ZN(n323) );
  CKXOR2D0 U714 ( .A1(n509), .A2(n502), .Z(n322) );
  CKXOR2D0 U715 ( .A1(n503), .A2(buffer_1_rd_ptr[2]), .Z(n321) );
  NR2D0 U716 ( .A1(n509), .A2(n502), .ZN(n503) );
  IND2D0 U717 ( .A1(n510), .B1(n501), .ZN(n502) );
  MUX2D0 U718 ( .I0(router_port_0[0]), .I1(buffer_0_data_out[0]), .S(n504), 
        .Z(n320) );
  CKND0 U719 ( .I(buffer_6_empty), .ZN(n32) );
  MUX2D0 U720 ( .I0(router_port_0[1]), .I1(buffer_0_data_out[1]), .S(n504), 
        .Z(n319) );
  MUX2D0 U721 ( .I0(router_port_0[2]), .I1(buffer_0_data_out[2]), .S(n504), 
        .Z(n318) );
  MUX2D0 U722 ( .I0(router_port_0[3]), .I1(buffer_0_data_out[3]), .S(n504), 
        .Z(n317) );
  MUX2D0 U723 ( .I0(router_port_0[4]), .I1(buffer_0_data_out[4]), .S(n504), 
        .Z(n316) );
  MUX2D0 U724 ( .I0(router_port_0[5]), .I1(buffer_0_data_out[5]), .S(n504), 
        .Z(n315) );
  MUX2D0 U725 ( .I0(router_port_0[6]), .I1(buffer_0_data_out[6]), .S(n504), 
        .Z(n314) );
  MUX2D0 U726 ( .I0(router_port_0[7]), .I1(buffer_0_data_out[7]), .S(n504), 
        .Z(n313) );
  MUX2D0 U727 ( .I0(router_port_0[8]), .I1(buffer_0_data_out[8]), .S(n504), 
        .Z(n312) );
  MUX2D0 U728 ( .I0(router_port_0[9]), .I1(buffer_0_data_out[9]), .S(n504), 
        .Z(n311) );
  MUX2D0 U729 ( .I0(router_port_0[10]), .I1(buffer_0_data_out[10]), .S(n504), 
        .Z(n310) );
  CKND0 U730 ( .I(buffer_5_empty), .ZN(n31) );
  MUX2D0 U731 ( .I0(router_port_0[11]), .I1(buffer_0_data_out[11]), .S(n504), 
        .Z(n309) );
  MUX2D0 U732 ( .I0(router_port_0[12]), .I1(buffer_0_data_out[12]), .S(n504), 
        .Z(n308) );
  MUX2D0 U733 ( .I0(router_port_0[13]), .I1(buffer_0_data_out[13]), .S(n504), 
        .Z(n307) );
  MUX2D0 U734 ( .I0(router_port_0[14]), .I1(buffer_0_data_out[14]), .S(n504), 
        .Z(n306) );
  MUX2D0 U735 ( .I0(router_port_0[15]), .I1(buffer_0_data_out[15]), .S(n504), 
        .Z(n305) );
  MUX2D0 U736 ( .I0(router_port_0[16]), .I1(buffer_0_data_out[16]), .S(n504), 
        .Z(n304) );
  MUX2D0 U737 ( .I0(router_port_0[17]), .I1(buffer_0_data_out[17]), .S(n504), 
        .Z(n303) );
  MUX2D0 U738 ( .I0(router_port_0[18]), .I1(buffer_0_data_out[18]), .S(n504), 
        .Z(n302) );
  MUX2D0 U739 ( .I0(router_port_0[19]), .I1(buffer_0_data_out[19]), .S(n504), 
        .Z(n301) );
  XNR2D0 U740 ( .A1(n504), .A2(n508), .ZN(n300) );
  CKND0 U741 ( .I(buffer_4_empty), .ZN(n30) );
  CKXOR2D0 U742 ( .A1(n507), .A2(n505), .Z(n299) );
  CKXOR2D0 U743 ( .A1(n506), .A2(buffer_0_rd_ptr[2]), .Z(n298) );
  NR2D0 U744 ( .A1(n507), .A2(n505), .ZN(n506) );
  IND2D0 U745 ( .A1(n508), .B1(n504), .ZN(n505) );
  CKND0 U746 ( .I(buffer_3_empty), .ZN(n29) );
  CKND0 U747 ( .I(buffer_2_empty), .ZN(n28) );
  CKND0 U748 ( .I(buffer_1_empty), .ZN(n27) );
  CKND0 U749 ( .I(buffer_0_empty), .ZN(n26) );
endmodule


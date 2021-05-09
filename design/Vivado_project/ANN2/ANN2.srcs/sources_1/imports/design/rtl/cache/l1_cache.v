// Module: l1_cache.v
// Project: Artificial Neural Network Co-processor
// Description: 400 Byte Addressable Memory
// Authors: Vladimir Milicevic
// Date: October 20 2019

/* Guidelines: 
 
 WE Write enable
 RE Read Enable
 Byte Addressable memory - addr is byte address 
 rd/wr is mutually exclusive

 Masking for both data_in and data_out bus is similar:

 BUS:  [ Byte0 | Byte1 | Byte2 | ......... | Byte13 | Byte14 | Byte15 ]
 BIT:  127     119     111                 23       15       7
 MASK: len0    len1    len2                len13    len14    len15

 */

 `include "memory_map.vh"
`timescale 1ns / 1ps

module l1_cache (

		 output reg [127:0] master_data_out,
		 input [127:0] 	master_data_in,
		 input [15:0] 	master_addr,
		 input [3:0] 	master_len,
		 input 		master_WE, 
		 input 		master_RE,
		 output reg	master_op_done,

		 output reg [127:0] layer_0_data_out,
		 input [127:0] 	layer_0_data_in,
		 input [15:0] 	layer_0_addr,
		 input [3:0] 	layer_0_len,
		 input 		layer_0_WE, 
		 input 		layer_0_RE,
		 output reg	layer_0_op_done,

		 output reg [127:0] layer_1_data_out,
		 input [127:0] 	layer_1_data_in,
		 input [15:0] 	layer_1_addr,
		 input [3:0] 	layer_1_len,
		 input 		layer_1_WE, 
		 input 		layer_1_RE,
		 output reg	layer_1_op_done,

		 output reg [127:0] layer_2_data_out,
		 input [127:0] 	layer_2_data_in,
		 input [15:0] 	layer_2_addr,
		 input [3:0] 	layer_2_len,
		 input 		layer_2_WE, 
		 input 		layer_2_RE,
		 output reg	layer_2_op_done,

		 output reg [127:0] layer_3_data_out,
		 input [127:0] 	layer_3_data_in,
		 input [15:0] 	layer_3_addr,
		 input [3:0] 	layer_3_len,
		 input 		layer_3_WE, 
		 input 		layer_3_RE,
		 output reg	layer_3_op_done,


		 output reg [127:0] layer_4_data_out,
		 input [127:0] 	layer_4_data_in,
		 input [15:0] 	layer_4_addr,
		 input [3:0] 	layer_4_len,
		 input 		layer_4_WE, 
		 input 		layer_4_RE,
		 output reg	layer_4_op_done,

		 output reg [127:0] layer_5_data_out,
		 input [127:0] 	layer_5_data_in,
		 input [15:0] 	layer_5_addr,
		 input [3:0] 	layer_5_len,
		 input 		layer_5_WE, 
		 input 		layer_5_RE,
		 output reg	layer_5_op_done,

		 output reg [127:0] layer_6_data_out,
		 input [127:0] 	layer_6_data_in,
		 input [15:0] 	layer_6_addr,
		 input [3:0] 	layer_6_len,
		 input 		layer_6_WE, 
		 input 		layer_6_RE,
		 output reg	layer_6_op_done,

		 output reg [127:0] layer_7_data_out,
		 input [127:0] 	layer_7_data_in,
		 input [15:0] 	layer_7_addr,
		 input [3:0] 	layer_7_len,
		 input 		layer_7_WE, 
		 input 		layer_7_RE,
		 output reg	layer_7_op_done
		 );
/*
   reg [127:0] 			master_data_out;
   reg [127:0] 			layer_0_data_out;
   reg [127:0] 			layer_1_data_out;
   reg [127:0] 			layer_2_data_out;
   reg [127:0] 			layer_3_data_out;
   reg [127:0] 			layer_4_data_out;
   reg [127:0] 			layer_5_data_out;
   reg [127:0] 			layer_6_data_out;
   reg [127:0] 			layer_7_data_out;
   reg 				master_op_done;
   reg 				layer_0_op_done;
   reg 				layer_1_op_done;
   reg 				layer_2_op_done;
   reg 				layer_3_op_done;
   reg 				layer_4_op_done;
   reg 				layer_5_op_done;
   reg 				layer_6_op_done;
   reg 				layer_7_op_done;
   */
   
   reg [7:0] 			Mem [`LAYER_0_END_ADDRESS:0]; //byte addressable Memory 


   //de-assert handshake when complete
   always @(negedge master_WE or master_RE) master_op_done = 0;
   always @(negedge layer_0_WE or layer_0_RE) layer_0_op_done = 0;
   always @(negedge layer_1_WE or layer_1_RE) layer_1_op_done = 0;
   always @(negedge layer_2_WE or layer_2_RE) layer_2_op_done = 0;
   always @(negedge layer_3_WE or layer_3_RE) layer_3_op_done = 0;
   always @(negedge layer_4_WE or layer_4_RE) layer_4_op_done = 0;
   always @(negedge layer_5_WE or layer_5_RE) layer_5_op_done = 0;
   always @(negedge layer_6_WE or layer_6_RE) layer_6_op_done = 0;
   always @(negedge layer_7_WE or layer_7_RE) layer_7_op_done = 0;
   

   
   always @(posedge (!master_WE & master_RE)) begin //master read
      	 master_data_out = 128'hdead_face_dead_face_dead_face_dead_face;
      if ((master_addr + (master_len)) <= `MASTER_END_ADDRESS)begin //make sure you're within the allocated address space 
	 master_data_out [127:120] <= Mem[master_addr];
	 if (master_len>4'b0000)      master_data_out [119:112] <= Mem[master_addr+1];
	 if (master_len>4'b0001)      master_data_out [111:104] <= Mem[master_addr+2];
	 if (master_len>4'b0010)      master_data_out [103:96] <= Mem[master_addr+3];
	 if (master_len>4'b0011)      master_data_out [95:88] <= Mem[master_addr+4];
	 if (master_len>4'b0100)      master_data_out [87:80] <= Mem[master_addr+5];
	 if (master_len>4'b0101)      master_data_out [79:72] <= Mem[master_addr+6];
	 if (master_len>4'b0110)      master_data_out [71:64] <= Mem[master_addr+7];
	 if (master_len>4'b0111)      master_data_out [63:56] <= Mem[master_addr+8];
	 if (master_len>4'b1000)      master_data_out [55:48] <= Mem[master_addr+9];
	 if (master_len>4'b1001)      master_data_out [47:40] <= Mem[master_addr+10];
	 if (master_len>4'b1010)      master_data_out [39:32] <= Mem[master_addr+11];
	 if (master_len>4'b1011)      master_data_out [31:24] <= Mem[master_addr+12];
	 if (master_len>4'b1100)      master_data_out [23:16] <= Mem[master_addr+13];
	 if (master_len>4'b1101)      master_data_out [15:8] <= Mem[master_addr+14];
	 if (master_len>4'b1110)      master_data_out [7:0] <= Mem[master_addr+15];
      end // if ((master_addr + (master_len)) < 400)
      master_op_done = 1;  
      
   end // always @ (posedge (!master_WE & master_RE))
   
   
   always @(posedge (master_WE & !master_RE)) begin //master write
      if ((master_addr + (master_len)) <= `MASTER_END_ADDRESS)begin //make sure you're within the allocated address space 
	 Mem[master_addr] <= master_data_in [128-1:120];
	 if (master_len>4'b0000)Mem[master_addr+1] <= master_data_in [119:112];
	 if (master_len>4'b0001)Mem[master_addr+2] <= master_data_in [111:104];
	 if (master_len>4'b0010)Mem[master_addr+3] <= master_data_in [103:96];
	 if (master_len>4'b0011)Mem[master_addr+4] <= master_data_in [95:88];
	 if (master_len>4'b0100)Mem[master_addr+5] <= master_data_in [87:80];
	 if (master_len>4'b0101)Mem[master_addr+6] <= master_data_in [79:72];
	 if (master_len>4'b0110)Mem[master_addr+7] <= master_data_in [71:64];
	 if (master_len>4'b0111)Mem[master_addr+8] <= master_data_in [63:56];
	 if (master_len>4'b1000)Mem[master_addr+9] <= master_data_in [55:48];
	 if (master_len>4'b1001)Mem[master_addr+10] <= master_data_in [47:40];
	 if (master_len>4'b1010)Mem[master_addr+11] <= master_data_in [39:32];
	 if (master_len>4'b1011)Mem[master_addr+12] <= master_data_in [31:24];
	 if (master_len>4'b1100)Mem[master_addr+13] <= master_data_in [23:16];
	 if (master_len>4'b1101)Mem[master_addr+14] <= master_data_in [15:8];
	 if (master_len>4'b1110)Mem[master_addr+15] <= master_data_in [7:0]; 
      end // if ((master_addr + (master_len)) < `MASTER_END_ADDRESS)
      master_op_done = 1;
   end // always @ (posedge (master_WE & !master_RE))

   
   always @(posedge (!layer_0_WE & layer_0_RE)) begin //slave 0 read
      	    layer_0_data_out = 128'hdead_face_dead_face_dead_face_dead_face;

	    layer_0_data_out [127:120] <= Mem[layer_0_addr];
	    if (layer_0_len>4'b0000)      layer_0_data_out [119:112] <= Mem[layer_0_addr+1];
	    if (layer_0_len>4'b0001)      layer_0_data_out [111:104] <= Mem[layer_0_addr+2];
	    if (layer_0_len>4'b0010)      layer_0_data_out [103:96] <= Mem[layer_0_addr+3];
	    if (layer_0_len>4'b0011)      layer_0_data_out [95:88] <= Mem[layer_0_addr+4];
	    if (layer_0_len>4'b0100)      layer_0_data_out [87:80] <= Mem[layer_0_addr+5];
	    if (layer_0_len>4'b0101)      layer_0_data_out [79:72] <= Mem[layer_0_addr+6];
	    if (layer_0_len>4'b0110)      layer_0_data_out [71:64] <= Mem[layer_0_addr+7];
	    if (layer_0_len>4'b0111)      layer_0_data_out [63:56] <= Mem[layer_0_addr+8];
	    if (layer_0_len>4'b1000)      layer_0_data_out [55:48] <= Mem[layer_0_addr+9];
	    if (layer_0_len>4'b1001)      layer_0_data_out [47:40] <= Mem[layer_0_addr+10];
	    if (layer_0_len>4'b1010)      layer_0_data_out [39:32] <= Mem[layer_0_addr+11];
	    if (layer_0_len>4'b1011)      layer_0_data_out [31:24] <= Mem[layer_0_addr+12];
	    if (layer_0_len>4'b1100)      layer_0_data_out [23:16] <= Mem[layer_0_addr+13];
	    if (layer_0_len>4'b1101)      layer_0_data_out [15:8] <= Mem[layer_0_addr+14];
	    if (layer_0_len>4'b1110)      layer_0_data_out [7:0] <= Mem[layer_0_addr+15];
      layer_0_op_done = 1;  
   end // always @ (posedge (!layer_0_WE & layer_0_RE))

   always @(posedge (layer_0_WE & !layer_0_RE)) begin //slave 0 write

	    Mem[layer_0_addr] <= layer_0_data_in [128-1:120];
	    if (layer_0_len>4'b0000)Mem[layer_0_addr+1] <= layer_0_data_in [119:112];
	    if (layer_0_len>4'b0001)Mem[layer_0_addr+2] <= layer_0_data_in [111:104];
	    if (layer_0_len>4'b0010)Mem[layer_0_addr+3] <= layer_0_data_in [103:96];
	    if (layer_0_len>4'b0011)Mem[layer_0_addr+4] <= layer_0_data_in [95:88];
	    if (layer_0_len>4'b0100)Mem[layer_0_addr+5] <= layer_0_data_in [87:80];
	    if (layer_0_len>4'b0101)Mem[layer_0_addr+6] <= layer_0_data_in [79:72];
	    if (layer_0_len>4'b0110)Mem[layer_0_addr+7] <= layer_0_data_in [71:64];
	    if (layer_0_len>4'b0111)Mem[layer_0_addr+8] <= layer_0_data_in [63:56];
	    if (layer_0_len>4'b1000)Mem[layer_0_addr+9] <= layer_0_data_in [55:48];
	    if (layer_0_len>4'b1001)Mem[layer_0_addr+10] <= layer_0_data_in [47:40];
	    if (layer_0_len>4'b1010)Mem[layer_0_addr+11] <= layer_0_data_in [39:32];
	    if (layer_0_len>4'b1011)Mem[layer_0_addr+12] <= layer_0_data_in [31:24];
	    if (layer_0_len>4'b1100)Mem[layer_0_addr+13] <= layer_0_data_in [23:16];
	    if (layer_0_len>4'b1101)Mem[layer_0_addr+14] <= layer_0_data_in [15:8];
	    if (layer_0_len>4'b1110)Mem[layer_0_addr+15] <= layer_0_data_in [7:0]; 

      layer_0_op_done = 1;      
end // always @ (posedge (layer_0_WE & !layer_0_RE))



   always @(posedge (!layer_1_WE & layer_1_RE)) begin //slave 0 read
      
      layer_1_data_out = 128'hdead_face_dead_face_dead_face_dead_face;
      layer_1_data_out [127:120] <= Mem[layer_1_addr];
	    if (layer_1_len>4'b0000)      layer_1_data_out [119:112] <= Mem[layer_1_addr+1];
	    if (layer_1_len>4'b0001)      layer_1_data_out [111:104] <= Mem[layer_1_addr+2];
	    if (layer_1_len>4'b0010)      layer_1_data_out [103:96] <= Mem[layer_1_addr+3];
	    if (layer_1_len>4'b0011)      layer_1_data_out [95:88] <= Mem[layer_1_addr+4];
	    if (layer_1_len>4'b0100)      layer_1_data_out [87:80] <= Mem[layer_1_addr+5];
	    if (layer_1_len>4'b0101)      layer_1_data_out [79:72] <= Mem[layer_1_addr+6];
	    if (layer_1_len>4'b0110)      layer_1_data_out [71:64] <= Mem[layer_1_addr+7];
	    if (layer_1_len>4'b0111)      layer_1_data_out [63:56] <= Mem[layer_1_addr+8];
	    if (layer_1_len>4'b1000)      layer_1_data_out [55:48] <= Mem[layer_1_addr+9];
	    if (layer_1_len>4'b1001)      layer_1_data_out [47:40] <= Mem[layer_1_addr+10];
	    if (layer_1_len>4'b1010)      layer_1_data_out [39:32] <= Mem[layer_1_addr+11];
	    if (layer_1_len>4'b1011)      layer_1_data_out [31:24] <= Mem[layer_1_addr+12];
	    if (layer_1_len>4'b1100)      layer_1_data_out [23:16] <= Mem[layer_1_addr+13];
	    if (layer_1_len>4'b1101)      layer_1_data_out [15:8] <= Mem[layer_1_addr+14];
	    if (layer_1_len>4'b1110)      layer_1_data_out [7:0] <= Mem[layer_1_addr+15];

      layer_1_op_done = 1;
   end // always @ (posedge (!layer_1_WE & layer_1_RE))

   always @(posedge (layer_1_WE & !layer_1_RE)) begin //slave 0 write

	    Mem[layer_1_addr] <= layer_1_data_in [128-1:120];
	    if (layer_1_len>4'b0000)Mem[layer_1_addr+1] <= layer_1_data_in [119:112];
	    if (layer_1_len>4'b0001)Mem[layer_1_addr+2] <= layer_1_data_in [111:104];
	    if (layer_1_len>4'b0010)Mem[layer_1_addr+3] <= layer_1_data_in [103:96];
	    if (layer_1_len>4'b0011)Mem[layer_1_addr+4] <= layer_1_data_in [95:88];
	    if (layer_1_len>4'b0100)Mem[layer_1_addr+5] <= layer_1_data_in [87:80];
	    if (layer_1_len>4'b0101)Mem[layer_1_addr+6] <= layer_1_data_in [79:72];
	    if (layer_1_len>4'b0110)Mem[layer_1_addr+7] <= layer_1_data_in [71:64];
	    if (layer_1_len>4'b0111)Mem[layer_1_addr+8] <= layer_1_data_in [63:56];
	    if (layer_1_len>4'b1000)Mem[layer_1_addr+9] <= layer_1_data_in [55:48];
	    if (layer_1_len>4'b1001)Mem[layer_1_addr+10] <= layer_1_data_in [47:40];
	    if (layer_1_len>4'b1010)Mem[layer_1_addr+11] <= layer_1_data_in [39:32];
	    if (layer_1_len>4'b1011)Mem[layer_1_addr+12] <= layer_1_data_in [31:24];
	    if (layer_1_len>4'b1100)Mem[layer_1_addr+13] <= layer_1_data_in [23:16];
	    if (layer_1_len>4'b1101)Mem[layer_1_addr+14] <= layer_1_data_in [15:8];
	    if (layer_1_len>4'b1110)Mem[layer_1_addr+15] <= layer_1_data_in [7:0]; 

      layer_1_op_done = 1;
   end // always @ (posedge (layer_1_WE & !layer_1_RE))


 
   always @(posedge (!layer_2_WE & layer_2_RE)) begin //slave 0 read
      layer_2_data_out = 128'hdead_face_dead_face_dead_face_dead_face;

	    layer_2_data_out [127:120] <= Mem[layer_2_addr];
	    if (layer_2_len>4'b0000)      layer_2_data_out [119:112] <= Mem[layer_2_addr+1];
	    if (layer_2_len>4'b0001)      layer_2_data_out [111:104] <= Mem[layer_2_addr+2];
	    if (layer_2_len>4'b0010)      layer_2_data_out [103:96] <= Mem[layer_2_addr+3];
	    if (layer_2_len>4'b0011)      layer_2_data_out [95:88] <= Mem[layer_2_addr+4];
	    if (layer_2_len>4'b0100)      layer_2_data_out [87:80] <= Mem[layer_2_addr+5];
	    if (layer_2_len>4'b0101)      layer_2_data_out [79:72] <= Mem[layer_2_addr+6];
	    if (layer_2_len>4'b0110)      layer_2_data_out [71:64] <= Mem[layer_2_addr+7];
	    if (layer_2_len>4'b0111)      layer_2_data_out [63:56] <= Mem[layer_2_addr+8];
	    if (layer_2_len>4'b1000)      layer_2_data_out [55:48] <= Mem[layer_2_addr+9];
	    if (layer_2_len>4'b1001)      layer_2_data_out [47:40] <= Mem[layer_2_addr+10];
	    if (layer_2_len>4'b1010)      layer_2_data_out [39:32] <= Mem[layer_2_addr+11];
	    if (layer_2_len>4'b1011)      layer_2_data_out [31:24] <= Mem[layer_2_addr+12];
	    if (layer_2_len>4'b1100)      layer_2_data_out [23:16] <= Mem[layer_2_addr+13];
	    if (layer_2_len>4'b1101)      layer_2_data_out [15:8] <= Mem[layer_2_addr+14];
	    if (layer_2_len>4'b1110)      layer_2_data_out [7:0] <= Mem[layer_2_addr+15];

      layer_2_op_done = 1;
   end // always @ (posedge (!layer_2_WE & layer_2_RE))

   always @(posedge (layer_2_WE & !layer_2_RE)) begin //slave 0 write

	    Mem[layer_2_addr] <= layer_2_data_in [128-1:120];
	    if (layer_2_len>4'b0000)Mem[layer_2_addr+1] <= layer_2_data_in [119:112];
	    if (layer_2_len>4'b0001)Mem[layer_2_addr+2] <= layer_2_data_in [111:104];
	    if (layer_2_len>4'b0010)Mem[layer_2_addr+3] <= layer_2_data_in [103:96];
	    if (layer_2_len>4'b0011)Mem[layer_2_addr+4] <= layer_2_data_in [95:88];
	    if (layer_2_len>4'b0100)Mem[layer_2_addr+5] <= layer_2_data_in [87:80];
	    if (layer_2_len>4'b0101)Mem[layer_2_addr+6] <= layer_2_data_in [79:72];
	    if (layer_2_len>4'b0110)Mem[layer_2_addr+7] <= layer_2_data_in [71:64];
	    if (layer_2_len>4'b0111)Mem[layer_2_addr+8] <= layer_2_data_in [63:56];
	    if (layer_2_len>4'b1000)Mem[layer_2_addr+9] <= layer_2_data_in [55:48];
	    if (layer_2_len>4'b1001)Mem[layer_2_addr+10] <= layer_2_data_in [47:40];
	    if (layer_2_len>4'b1010)Mem[layer_2_addr+11] <= layer_2_data_in [39:32];
	    if (layer_2_len>4'b1011)Mem[layer_2_addr+12] <= layer_2_data_in [31:24];
	    if (layer_2_len>4'b1100)Mem[layer_2_addr+13] <= layer_2_data_in [23:16];
	    if (layer_2_len>4'b1101)Mem[layer_2_addr+14] <= layer_2_data_in [15:8];
	    if (layer_2_len>4'b1110)Mem[layer_2_addr+15] <= layer_2_data_in [7:0]; 

      layer_2_op_done = 1;
   end // always @ (posedge (layer_2_WE & !layer_2_RE))




   always @(posedge (!layer_3_WE & layer_3_RE)) begin //slave 0 read
      layer_3_data_out = 128'hdead_face_dead_face_dead_face_dead_face;

	    layer_3_data_out [127:120] <= Mem[layer_3_addr];
	    if (layer_3_len>4'b0000)      layer_3_data_out [119:112] <= Mem[layer_3_addr+1];
	    if (layer_3_len>4'b0001)      layer_3_data_out [111:104] <= Mem[layer_3_addr+2];
	    if (layer_3_len>4'b0010)      layer_3_data_out [103:96] <= Mem[layer_3_addr+3];
	    if (layer_3_len>4'b0011)      layer_3_data_out [95:88] <= Mem[layer_3_addr+4];
	    if (layer_3_len>4'b0100)      layer_3_data_out [87:80] <= Mem[layer_3_addr+5];
	    if (layer_3_len>4'b0101)      layer_3_data_out [79:72] <= Mem[layer_3_addr+6];
	    if (layer_3_len>4'b0110)      layer_3_data_out [71:64] <= Mem[layer_3_addr+7];
	    if (layer_3_len>4'b0111)      layer_3_data_out [63:56] <= Mem[layer_3_addr+8];
	    if (layer_3_len>4'b1000)      layer_3_data_out [55:48] <= Mem[layer_3_addr+9];
	    if (layer_3_len>4'b1001)      layer_3_data_out [47:40] <= Mem[layer_3_addr+10];
	    if (layer_3_len>4'b1010)      layer_3_data_out [39:32] <= Mem[layer_3_addr+11];
	    if (layer_3_len>4'b1011)      layer_3_data_out [31:24] <= Mem[layer_3_addr+12];
	    if (layer_3_len>4'b1100)      layer_3_data_out [23:16] <= Mem[layer_3_addr+13];
	    if (layer_3_len>4'b1101)      layer_3_data_out [15:8] <= Mem[layer_3_addr+14];
	    if (layer_3_len>4'b1110)      layer_3_data_out [7:0] <= Mem[layer_3_addr+15];

      layer_3_op_done = 1;
   end // always @ (posedge (!layer_3_WE & layer_3_RE))

   always @(posedge (layer_3_WE & !layer_3_RE)) begin //slave 0 write

	    Mem[layer_3_addr] <= layer_3_data_in [128-1:120];
	    if (layer_3_len>4'b0000)Mem[layer_3_addr+1] <= layer_3_data_in [119:112];
	    if (layer_3_len>4'b0001)Mem[layer_3_addr+2] <= layer_3_data_in [111:104];
	    if (layer_3_len>4'b0010)Mem[layer_3_addr+3] <= layer_3_data_in [103:96];
	    if (layer_3_len>4'b0011)Mem[layer_3_addr+4] <= layer_3_data_in [95:88];
	    if (layer_3_len>4'b0100)Mem[layer_3_addr+5] <= layer_3_data_in [87:80];
	    if (layer_3_len>4'b0101)Mem[layer_3_addr+6] <= layer_3_data_in [79:72];
	    if (layer_3_len>4'b0110)Mem[layer_3_addr+7] <= layer_3_data_in [71:64];
	    if (layer_3_len>4'b0111)Mem[layer_3_addr+8] <= layer_3_data_in [63:56];
	    if (layer_3_len>4'b1000)Mem[layer_3_addr+9] <= layer_3_data_in [55:48];
	    if (layer_3_len>4'b1001)Mem[layer_3_addr+10] <= layer_3_data_in [47:40];
	    if (layer_3_len>4'b1010)Mem[layer_3_addr+11] <= layer_3_data_in [39:32];
	    if (layer_3_len>4'b1011)Mem[layer_3_addr+12] <= layer_3_data_in [31:24];
	    if (layer_3_len>4'b1100)Mem[layer_3_addr+13] <= layer_3_data_in [23:16];
	    if (layer_3_len>4'b1101)Mem[layer_3_addr+14] <= layer_3_data_in [15:8];
	    if (layer_3_len>4'b1110)Mem[layer_3_addr+15] <= layer_3_data_in [7:0]; 

      layer_3_op_done = 1;
   end // always @ (posedge (layer_3_WE & !layer_3_RE))




   always @(posedge (!layer_4_WE & layer_4_RE)) begin //slave 0 read
      layer_4_data_out = 128'hdead_face_dead_face_dead_face_dead_face;

	    layer_4_data_out [127:120] <= Mem[layer_4_addr];
	    if (layer_4_len>4'b0000)      layer_4_data_out [119:112] <= Mem[layer_4_addr+1];
	    if (layer_4_len>4'b0001)      layer_4_data_out [111:104] <= Mem[layer_4_addr+2];
	    if (layer_4_len>4'b0010)      layer_4_data_out [103:96] <= Mem[layer_4_addr+3];
	    if (layer_4_len>4'b0011)      layer_4_data_out [95:88] <= Mem[layer_4_addr+4];
	    if (layer_4_len>4'b0100)      layer_4_data_out [87:80] <= Mem[layer_4_addr+5];
	    if (layer_4_len>4'b0101)      layer_4_data_out [79:72] <= Mem[layer_4_addr+6];
	    if (layer_4_len>4'b0110)      layer_4_data_out [71:64] <= Mem[layer_4_addr+7];
	    if (layer_4_len>4'b0111)      layer_4_data_out [63:56] <= Mem[layer_4_addr+8];
	    if (layer_4_len>4'b1000)      layer_4_data_out [55:48] <= Mem[layer_4_addr+9];
	    if (layer_4_len>4'b1001)      layer_4_data_out [47:40] <= Mem[layer_4_addr+10];
	    if (layer_4_len>4'b1010)      layer_4_data_out [39:32] <= Mem[layer_4_addr+11];
	    if (layer_4_len>4'b1011)      layer_4_data_out [31:24] <= Mem[layer_4_addr+12];
	    if (layer_4_len>4'b1100)      layer_4_data_out [23:16] <= Mem[layer_4_addr+13];
	    if (layer_4_len>4'b1101)      layer_4_data_out [15:8] <= Mem[layer_4_addr+14];
	    if (layer_4_len>4'b1110)      layer_4_data_out [7:0] <= Mem[layer_4_addr+15];

      layer_4_op_done = 1;
   end // always @ (posedge (!layer_4_WE & layer_4_RE))

   always @(posedge (layer_4_WE & !layer_4_RE)) begin //slave 0 write

	    Mem[layer_4_addr] <= layer_4_data_in [128-1:120];
	    if (layer_4_len>4'b0000)Mem[layer_4_addr+1] <= layer_4_data_in [119:112];
	    if (layer_4_len>4'b0001)Mem[layer_4_addr+2] <= layer_4_data_in [111:104];
	    if (layer_4_len>4'b0010)Mem[layer_4_addr+3] <= layer_4_data_in [103:96];
	    if (layer_4_len>4'b0011)Mem[layer_4_addr+4] <= layer_4_data_in [95:88];
	    if (layer_4_len>4'b0100)Mem[layer_4_addr+5] <= layer_4_data_in [87:80];
	    if (layer_4_len>4'b0101)Mem[layer_4_addr+6] <= layer_4_data_in [79:72];
	    if (layer_4_len>4'b0110)Mem[layer_4_addr+7] <= layer_4_data_in [71:64];
	    if (layer_4_len>4'b0111)Mem[layer_4_addr+8] <= layer_4_data_in [63:56];
	    if (layer_4_len>4'b1000)Mem[layer_4_addr+9] <= layer_4_data_in [55:48];
	    if (layer_4_len>4'b1001)Mem[layer_4_addr+10] <= layer_4_data_in [47:40];
	    if (layer_4_len>4'b1010)Mem[layer_4_addr+11] <= layer_4_data_in [39:32];
	    if (layer_4_len>4'b1011)Mem[layer_4_addr+12] <= layer_4_data_in [31:24];
	    if (layer_4_len>4'b1100)Mem[layer_4_addr+13] <= layer_4_data_in [23:16];
	    if (layer_4_len>4'b1101)Mem[layer_4_addr+14] <= layer_4_data_in [15:8];
	    if (layer_4_len>4'b1110)Mem[layer_4_addr+15] <= layer_4_data_in [7:0]; 

      layer_4_op_done = 1;
   end // always @ (posedge (layer_4_WE & !layer_4_RE))


   


   always @(posedge (!layer_5_WE & layer_5_RE)) begin //slave 0 read
      layer_5_data_out = 128'hdead_face_dead_face_dead_face_dead_face;

	    layer_5_data_out [127:120] <= Mem[layer_5_addr];
	    if (layer_5_len>4'b0000)      layer_5_data_out [119:112] <= Mem[layer_5_addr+1];
	    if (layer_5_len>4'b0001)      layer_5_data_out [111:104] <= Mem[layer_5_addr+2];
	    if (layer_5_len>4'b0010)      layer_5_data_out [103:96] <= Mem[layer_5_addr+3];
	    if (layer_5_len>4'b0011)      layer_5_data_out [95:88] <= Mem[layer_5_addr+4];
	    if (layer_5_len>4'b0100)      layer_5_data_out [87:80] <= Mem[layer_5_addr+5];
	    if (layer_5_len>4'b0101)      layer_5_data_out [79:72] <= Mem[layer_5_addr+6];
	    if (layer_5_len>4'b0110)      layer_5_data_out [71:64] <= Mem[layer_5_addr+7];
	    if (layer_5_len>4'b0111)      layer_5_data_out [63:56] <= Mem[layer_5_addr+8];
	    if (layer_5_len>4'b1000)      layer_5_data_out [55:48] <= Mem[layer_5_addr+9];
	    if (layer_5_len>4'b1001)      layer_5_data_out [47:40] <= Mem[layer_5_addr+10];
	    if (layer_5_len>4'b1010)      layer_5_data_out [39:32] <= Mem[layer_5_addr+11];
	    if (layer_5_len>4'b1011)      layer_5_data_out [31:24] <= Mem[layer_5_addr+12];
	    if (layer_5_len>4'b1100)      layer_5_data_out [23:16] <= Mem[layer_5_addr+13];
	    if (layer_5_len>4'b1101)      layer_5_data_out [15:8] <= Mem[layer_5_addr+14];
	    if (layer_5_len>4'b1110)      layer_5_data_out [7:0] <= Mem[layer_5_addr+15];

      layer_5_op_done = 1;
   end // always @ (posedge (!layer_5_WE & layer_5_RE))

   always @(posedge (layer_5_WE & !layer_5_RE)) begin //slave 0 write

	    Mem[layer_5_addr] <= layer_5_data_in [128-1:120];
	    if (layer_5_len>4'b0000)Mem[layer_5_addr+1] <= layer_5_data_in [119:112];
	    if (layer_5_len>4'b0001)Mem[layer_5_addr+2] <= layer_5_data_in [111:104];
	    if (layer_5_len>4'b0010)Mem[layer_5_addr+3] <= layer_5_data_in [103:96];
	    if (layer_5_len>4'b0011)Mem[layer_5_addr+4] <= layer_5_data_in [95:88];
	    if (layer_5_len>4'b0100)Mem[layer_5_addr+5] <= layer_5_data_in [87:80];
	    if (layer_5_len>4'b0101)Mem[layer_5_addr+6] <= layer_5_data_in [79:72];
	    if (layer_5_len>4'b0110)Mem[layer_5_addr+7] <= layer_5_data_in [71:64];
	    if (layer_5_len>4'b0111)Mem[layer_5_addr+8] <= layer_5_data_in [63:56];
	    if (layer_5_len>4'b1000)Mem[layer_5_addr+9] <= layer_5_data_in [55:48];
	    if (layer_5_len>4'b1001)Mem[layer_5_addr+10] <= layer_5_data_in [47:40];
	    if (layer_5_len>4'b1010)Mem[layer_5_addr+11] <= layer_5_data_in [39:32];
	    if (layer_5_len>4'b1011)Mem[layer_5_addr+12] <= layer_5_data_in [31:24];
	    if (layer_5_len>4'b1100)Mem[layer_5_addr+13] <= layer_5_data_in [23:16];
	    if (layer_5_len>4'b1101)Mem[layer_5_addr+14] <= layer_5_data_in [15:8];
	    if (layer_5_len>4'b1110)Mem[layer_5_addr+15] <= layer_5_data_in [7:0]; 

      layer_5_op_done = 1;
   end // always @ (posedge (layer_5_WE & !layer_5_RE))


   

   always @(posedge (!layer_6_WE & layer_6_RE)) begin //slave 0 read
      layer_6_data_out = 128'hdead_face_dead_face_dead_face_dead_face;

	    layer_6_data_out [127:120] <= Mem[layer_6_addr];
	    if (layer_6_len>4'b0000)      layer_6_data_out [119:112] <= Mem[layer_6_addr+1];
	    if (layer_6_len>4'b0001)      layer_6_data_out [111:104] <= Mem[layer_6_addr+2];
	    if (layer_6_len>4'b0010)      layer_6_data_out [103:96] <= Mem[layer_6_addr+3];
	    if (layer_6_len>4'b0011)      layer_6_data_out [95:88] <= Mem[layer_6_addr+4];
	    if (layer_6_len>4'b0100)      layer_6_data_out [87:80] <= Mem[layer_6_addr+5];
	    if (layer_6_len>4'b0101)      layer_6_data_out [79:72] <= Mem[layer_6_addr+6];
	    if (layer_6_len>4'b0110)      layer_6_data_out [71:64] <= Mem[layer_6_addr+7];
	    if (layer_6_len>4'b0111)      layer_6_data_out [63:56] <= Mem[layer_6_addr+8];
	    if (layer_6_len>4'b1000)      layer_6_data_out [55:48] <= Mem[layer_6_addr+9];
	    if (layer_6_len>4'b1001)      layer_6_data_out [47:40] <= Mem[layer_6_addr+10];
	    if (layer_6_len>4'b1010)      layer_6_data_out [39:32] <= Mem[layer_6_addr+11];
	    if (layer_6_len>4'b1011)      layer_6_data_out [31:24] <= Mem[layer_6_addr+12];
	    if (layer_6_len>4'b1100)      layer_6_data_out [23:16] <= Mem[layer_6_addr+13];
	    if (layer_6_len>4'b1101)      layer_6_data_out [15:8] <= Mem[layer_6_addr+14];
	    if (layer_6_len>4'b1110)      layer_6_data_out [7:0] <= Mem[layer_6_addr+15];

      layer_6_op_done = 1;
   end // always @ (posedge (!layer_6_WE & layer_6_RE))

   always @(posedge (layer_6_WE & !layer_6_RE)) begin //slave 0 write

	    Mem[layer_6_addr] <= layer_6_data_in [128-1:120];
	    if (layer_6_len>4'b0000)Mem[layer_6_addr+1] <= layer_6_data_in [119:112];
	    if (layer_6_len>4'b0001)Mem[layer_6_addr+2] <= layer_6_data_in [111:104];
	    if (layer_6_len>4'b0010)Mem[layer_6_addr+3] <= layer_6_data_in [103:96];
	    if (layer_6_len>4'b0011)Mem[layer_6_addr+4] <= layer_6_data_in [95:88];
	    if (layer_6_len>4'b0100)Mem[layer_6_addr+5] <= layer_6_data_in [87:80];
	    if (layer_6_len>4'b0101)Mem[layer_6_addr+6] <= layer_6_data_in [79:72];
	    if (layer_6_len>4'b0110)Mem[layer_6_addr+7] <= layer_6_data_in [71:64];
	    if (layer_6_len>4'b0111)Mem[layer_6_addr+8] <= layer_6_data_in [63:56];
	    if (layer_6_len>4'b1000)Mem[layer_6_addr+9] <= layer_6_data_in [55:48];
	    if (layer_6_len>4'b1001)Mem[layer_6_addr+10] <= layer_6_data_in [47:40];
	    if (layer_6_len>4'b1010)Mem[layer_6_addr+11] <= layer_6_data_in [39:32];
	    if (layer_6_len>4'b1011)Mem[layer_6_addr+12] <= layer_6_data_in [31:24];
	    if (layer_6_len>4'b1100)Mem[layer_6_addr+13] <= layer_6_data_in [23:16];
	    if (layer_6_len>4'b1101)Mem[layer_6_addr+14] <= layer_6_data_in [15:8];
	    if (layer_6_len>4'b1110)Mem[layer_6_addr+15] <= layer_6_data_in [7:0]; 

      layer_6_op_done = 1;
   end // always @ (posedge (layer_6_WE & !layer_6_RE))



   always @(posedge (!layer_7_WE & layer_7_RE)) begin //slave 0 read
      layer_7_data_out = 128'hdead_face_dead_face_dead_face_dead_face;

	    layer_7_data_out [127:120] <= Mem[layer_7_addr];
	    if (layer_7_len>4'b0000)      layer_7_data_out [119:112] <= Mem[layer_7_addr+1];
	    if (layer_7_len>4'b0001)      layer_7_data_out [111:104] <= Mem[layer_7_addr+2];
	    if (layer_7_len>4'b0010)      layer_7_data_out [103:96] <= Mem[layer_7_addr+3];
	    if (layer_7_len>4'b0011)      layer_7_data_out [95:88] <= Mem[layer_7_addr+4];
	    if (layer_7_len>4'b0100)      layer_7_data_out [87:80] <= Mem[layer_7_addr+5];
	    if (layer_7_len>4'b0101)      layer_7_data_out [79:72] <= Mem[layer_7_addr+6];
	    if (layer_7_len>4'b0110)      layer_7_data_out [71:64] <= Mem[layer_7_addr+7];
	    if (layer_7_len>4'b0111)      layer_7_data_out [63:56] <= Mem[layer_7_addr+8];
	    if (layer_7_len>4'b1000)      layer_7_data_out [55:48] <= Mem[layer_7_addr+9];
	    if (layer_7_len>4'b1001)      layer_7_data_out [47:40] <= Mem[layer_7_addr+10];
	    if (layer_7_len>4'b1010)      layer_7_data_out [39:32] <= Mem[layer_7_addr+11];
	    if (layer_7_len>4'b1011)      layer_7_data_out [31:24] <= Mem[layer_7_addr+12];
	    if (layer_7_len>4'b1100)      layer_7_data_out [23:16] <= Mem[layer_7_addr+13];
	    if (layer_7_len>4'b1101)      layer_7_data_out [15:8] <= Mem[layer_7_addr+14];
	    if (layer_7_len>4'b1110)      layer_7_data_out [7:0] <= Mem[layer_7_addr+15];

      layer_7_op_done = 1;
   end // always @ (posedge (!layer_7_WE & layer_7_RE))

   always @(posedge (layer_7_WE & !layer_7_RE)) begin //slave 0 write

	    Mem[layer_7_addr] <= layer_7_data_in [128-1:120];
	    if (layer_7_len>4'b0000)Mem[layer_7_addr+1] <= layer_7_data_in [119:112];
	    if (layer_7_len>4'b0001)Mem[layer_7_addr+2] <= layer_7_data_in [111:104];
	    if (layer_7_len>4'b0010)Mem[layer_7_addr+3] <= layer_7_data_in [103:96];
	    if (layer_7_len>4'b0011)Mem[layer_7_addr+4] <= layer_7_data_in [95:88];
	    if (layer_7_len>4'b0100)Mem[layer_7_addr+5] <= layer_7_data_in [87:80];
	    if (layer_7_len>4'b0101)Mem[layer_7_addr+6] <= layer_7_data_in [79:72];
	    if (layer_7_len>4'b0110)Mem[layer_7_addr+7] <= layer_7_data_in [71:64];
	    if (layer_7_len>4'b0111)Mem[layer_7_addr+8] <= layer_7_data_in [63:56];
	    if (layer_7_len>4'b1000)Mem[layer_7_addr+9] <= layer_7_data_in [55:48];
	    if (layer_7_len>4'b1001)Mem[layer_7_addr+10] <= layer_7_data_in [47:40];
	    if (layer_7_len>4'b1010)Mem[layer_7_addr+11] <= layer_7_data_in [39:32];
	    if (layer_7_len>4'b1011)Mem[layer_7_addr+12] <= layer_7_data_in [31:24];
	    if (layer_7_len>4'b1100)Mem[layer_7_addr+13] <= layer_7_data_in [23:16];
	    if (layer_7_len>4'b1101)Mem[layer_7_addr+14] <= layer_7_data_in [15:8];
	    if (layer_7_len>4'b1110)Mem[layer_7_addr+15] <= layer_7_data_in [7:0]; 

      layer_7_op_done = 1;
   end // always @ (posedge (layer_7_WE & !layer_7_RE))
   
   
endmodule

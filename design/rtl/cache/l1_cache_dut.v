`include "l1_cache.v"
`timescale 1ns / 1ns

module dut;

   reg [16-1:0] master_addr;
   reg [128-1:0] master_data_in;
   wire [128-1:0] master_data_out;
   reg 		  master_WE;
   reg 		  master_RE;
   reg [4-1:0] 	  master_len;

   reg [16-1:0] 	  layer_0_addr;
   reg [128-1:0]  layer_0_data_in;
   wire [128-1:0] layer_0_data_out;
   reg 		  layer_0_WE;
   reg 		  layer_0_RE;
   reg [4-1:0] 	  layer_0_len;


   reg [16-1:0] 	  layer_1_addr;
   reg [128-1:0]  layer_1_data_in;
   wire [128-1:0] layer_1_data_out;
   reg 		  layer_1_WE;
   reg 		  layer_1_RE;
   reg [4-1:0] 	  layer_1_len;



   reg [16-1:0] 	  layer_2_addr;
   reg [128-1:0]  layer_2_data_in;
   wire [128-1:0] layer_2_data_out;
   reg 		  layer_2_WE;
   reg 		  layer_2_RE;
   reg [4-1:0] 	  layer_2_len;


   reg [16-1:0] 	  layer_3_addr;
   reg [128-1:0]  layer_3_data_in;
   wire [128-1:0] layer_3_data_out;
   reg 		  layer_3_WE;
   reg 		  layer_3_RE;
   reg [4-1:0] 	  layer_3_len;

   reg [16-1:0] 	  layer_4_addr;
   reg [128-1:0]  layer_4_data_in;
   wire [128-1:0] layer_4_data_out;
   reg 		  layer_4_WE;
   reg 		  layer_4_RE;
   reg [4-1:0] 	  layer_4_len;

   reg [16-1:0] 	  layer_5_addr;
   reg [128-1:0]  layer_5_data_in;
   wire [128-1:0] layer_5_data_out;
   reg 		  layer_5_WE;
   reg 		  layer_5_RE;
   reg [4-1:0] 	  layer_5_len;


   reg [16-1:0] 	  layer_6_addr;
   reg [128-1:0]  layer_6_data_in;
   wire [128-1:0] layer_6_data_out;
   reg 		  layer_6_WE;
   reg 		  layer_6_RE;
   reg [4-1:0] 	  layer_6_len;

   reg [16-1:0] 	  layer_7_addr;
   reg [128-1:0]  layer_7_data_in;
   wire [128-1:0] layer_7_data_out;
   reg 		  layer_7_WE;
   reg 		  layer_7_RE;
   reg [4-1:0] 	  layer_7_len;


   wire 	  master_op_done;
   wire 	  layer_0_op_done;
   wire 	  layer_1_op_done;
   wire 	  layer_2_op_done;
   wire 	  layer_3_op_done;
   wire 	  layer_4_op_done;
   wire 	  layer_5_op_done;
   wire 	  layer_6_op_done;
   wire 	  layer_7_op_done;

   

   l1_cache dut (
		 );
   
   
   initial begin
      $dumpfile("l1_cache_dut.vcd");
      $dumpvars(0, dut);

      master_addr = 0;
      master_data_in = 128'd0;
      master_WE = 0;
      master_RE = 0;
      master_len = 0;


      //do a master write to layer_0 memory
      master_addr = 0;
      master_data_in = {24'hFFFFFF, 104'd0};
      master_WE = 1;
      master_RE = 0;
      master_len = 2;
      wait(master_op_done==1);
      #1;
      master_WE = 0;
      master_RE = 0;
      #1;
      


      //do a master read on that address
      master_data_in = 128'd0;
      master_WE = 0;
      master_RE = 1;
      master_len = 1;
      wait(master_op_done==1);
      #1;
      master_WE = 0;
      master_RE = 0; 
      #1;
      
      //do a layer_0 read on the master data
      layer_0_RE = 1;
      layer_0_WE = 0;
      layer_0_len = 2;
      layer_0_addr = 0;
      wait(layer_0_op_done==1);
      #1;
      layer_0_RE = 0;
      layer_0_WE = 0;
      #1;
      
      //do a layer_0 read on data which is out of bounds
      layer_0_RE = 1;
      layer_0_WE = 0;
      layer_0_len = 2;
      layer_0_addr = 9'h100;
      wait(layer_0_op_done==1);
      #1;
      layer_0_RE = 0;
      layer_0_WE = 0;
      #1;
      
      //do a layer_0 write
      layer_0_RE = 0;
      layer_0_WE = 1;
      layer_0_len = 2;
      layer_0_addr = 3;
      layer_0_data_in = {24'hFF0FFF, 104'd0};
      wait(layer_0_op_done==1);
      #1;
      layer_0_RE = 0;
      layer_0_WE = 0;
      #1;
      

      //do a layer_0 read from that address
      layer_0_RE = 1;
      layer_0_WE = 0;
      layer_0_len = 2;
      layer_0_addr = 3;
      layer_0_data_in = {24'hFF0FFF, 104'd0};
      wait(layer_0_op_done==1);
      #1;
      layer_0_RE = 0;
      layer_0_WE = 0;
      #1;
      
      //do a master read on that address
      master_addr = 3;
      master_data_in = 128'd0;
      master_WE = 0;
      master_RE = 1;
      master_len = 2;
      wait(master_op_done==1);
      #1; 
      master_WE = 0;
      master_RE = 0;
      #1;
      


      //do a layer_0 config space write
      layer_0_RE = 0;
      layer_0_WE = 1;
      layer_0_len = 4'h8;
      layer_0_addr = 9'h118;
      layer_0_data_in = 128'hFFFF_FFFF_FFFF_FFFF_FFFF_FFFF_FFFF_FFFF;
      wait (layer_0_op_done == 1);
      #1;
      layer_0_RE = 0;
      layer_0_WE = 0;
      #1;
      
      
      //do a layer_0 config space read
      layer_0_RE = 1;
      layer_0_WE = 0;
      layer_0_len = 4'h8;
      layer_0_addr = 9'h118;
      layer_0_data_in = 128'hFFFF_FFFF_FFFF_FFFF_FFFF_FFFF_FFFF_FFFF;
      wait (layer_0_op_done == 1);
      #1;
      layer_0_RE = 0;
      layer_0_WE = 0;
      #1;
      
      
      //do a layer_0 training space write
      layer_0_RE = 0;
      layer_0_WE = 1;
      layer_0_len = 4'hF;
      layer_0_addr = 9'h129;
      layer_0_data_in = 128'hFFFF_FFFF_FFFF_FFFF_FFFF_FFFF_FFFF_FFFF;
      wait (layer_0_op_done == 1);
      #1;
      layer_0_RE = 0;
      layer_0_WE = 0;
      #1;
      

      //do a layer_0 training space read
      layer_0_RE = 1;
      layer_0_WE = 0;
      layer_0_len = 4'hF;
      layer_0_addr = 9'h129;
      layer_0_data_in = 128'hFFFF_FFFF_FFFF_FFFF_FFFF_FFFF_FFFF_FFFF;
      wait (layer_0_op_done == 1);
      #1;
      layer_0_RE = 0;
      layer_0_WE = 0;
      #1;


      //do a layer_0 write on the last byte
      layer_0_RE = 0;
      layer_0_WE = 1;
      layer_0_len = 4'h0;
      layer_0_addr = 9'h147;
      layer_0_data_in = 128'hFFFF_FFFF_FFFF_FFFF_FFFF_FFFF_FFFF_FFFF;
      wait (layer_0_op_done == 1);
      #1;
      layer_0_RE = 0;
      layer_0_WE = 0;
      #1;
      
      
      //do a layer_0 write over the last byte boundary
      layer_0_RE = 0;
      layer_0_WE = 1;
      layer_0_len = 4'h1;
      layer_0_addr = 9'h148;
      layer_0_data_in = 128'hFFFF_FFFF_FFFF_FFFF_FFFF_FFFF_FFFF_FFFF;
      wait (layer_0_op_done == 1);
      #1;
      layer_0_RE = 0;
      layer_0_WE = 0;
      #1;
      
      //do a layer_0 write on the last byte with a length of 2 bytes, causing the total read value to go over the boundary
      layer_0_RE = 0;
      layer_0_WE = 1;
      layer_0_len = 4'h1;
      layer_0_addr = 9'h147;
      layer_0_data_in = 128'hFFFF_FFFF_FFFF_FFFF_FFFF_FFFF_FFFF_FFFF;
      wait (layer_0_op_done == 1);
      #1;
      layer_0_RE = 0;
      layer_0_WE = 0;
      #1;
      
      //do a layer_0 read on the last byte
      layer_0_RE = 1;
      layer_0_WE = 0;
      layer_0_len = 4'h0;
      layer_0_addr = 9'h147;
      layer_0_data_in = 128'hFFFF_FFFF_FFFF_FFFF_FFFF_FFFF_FFFF_FFFF;
      wait (layer_0_op_done == 1);
      #1;
      layer_0_RE = 0;
      layer_0_WE = 0;
      #1;
      

      //do a layer_0 read over the last byte boundary
      layer_0_RE = 1;
      layer_0_WE = 0;
      layer_0_len = 4'h1;
      layer_0_addr = 9'h148;
      layer_0_data_in = 128'hFFFF_FFFF_FFFF_FFFF_FFFF_FFFF_FFFF_FFFF;
      wait (layer_0_op_done == 1);
      #1;
      layer_0_RE = 0;
      layer_0_WE = 0;
      #1;
      
      //do a layer_0 read on the last byte with a length of 2 bytes, causing the total read value to go over the boundary
         layer_0_RE = 1;
      layer_0_WE = 0;
      layer_0_len = 4'h1;
      layer_0_addr = 9'h147;
      layer_0_data_in = 128'hFFFF_FFFF_FFFF_FFFF_FFFF_FFFF_FFFF_FFFF;
      wait (layer_0_op_done == 1);
      #1;
      layer_0_RE = 0;
      layer_0_WE = 0;
      #1;
      
       //do a master write on the last addressable memory location
      master_RE = 0;
      master_WE = 1;
      master_len = 0;
      master_addr = 9'd399;
      master_data_in = 128'hFFFF_FFFF_FFFF_FFFF_FFFF_FFFF_FFFF_FFFF;
      wait (master_op_done == 1);
      #1;
      master_RE = 0;
      master_WE = 0;
      #1;
      
      
      //do a master write over the last addressable memory location
      master_RE = 0;
      master_WE = 1;
      master_len = 1;
      master_addr = 9'd401;
      master_data_in = 128'hFFFF_FFFF_FFFF_FFFF_FFFF_FFFF_FFFF_FFFF;
      wait (master_op_done == 1);
      #1;
      master_RE = 0;
      master_WE = 0;
      #1;
      
      //do a master write on the last addressable memory locationon the last byte with a length of 2 bytes, causing the total read value to go over the boundary
      master_RE = 0;
      master_WE = 1;
      master_len = 1;
      master_addr = 9'd399;
      master_data_in = 128'hFFFF_FFFF_FFFF_FFFF_FFFF_FFFF_FFFF_FFFF;
      wait (master_op_done == 1);
      #1;
      master_RE = 0;
      master_WE = 0;
      #1;
      
      //do a master read on the last addressable memory location
      master_RE = 1;
      master_WE = 0;
      master_len = 0;
      master_addr = 9'd399;
      master_data_in = 128'hFFFF_FFFF_FFFF_FFFF_FFFF_FFFF_FFFF_FFFF;
      wait (master_op_done == 1);
      #1;
      master_RE = 0;
      master_WE = 0;
      #1;
      
      
      //do a master read over the last addressable memory location
      master_RE = 1;
      master_WE = 0;
      master_len = 1;
      master_addr = 9'd401;
      master_data_in = 128'hFFFF_FFFF_FFFF_FFFF_FFFF_FFFF_FFFF_FFFF;
      wait (master_op_done == 1);
      #1;
      master_RE = 0;
      master_WE = 0;
      #1;
      

      //do a master read on the last addressable memory locationon the last byte with a length of 2 bytes, causing the total read value to go over the boundary
      master_RE = 1;
      master_WE = 0;
      master_len = 1;
      master_addr = 9'd399;
      master_data_in = 128'hFFFF_FFFF_FFFF_FFFF_FFFF_FFFF_FFFF_FFFF;
      wait (master_op_done == 1);
      #1;
      master_RE = 0;
      master_WE = 0;
      #1;
      
     
      
   end    

endmodule // dut

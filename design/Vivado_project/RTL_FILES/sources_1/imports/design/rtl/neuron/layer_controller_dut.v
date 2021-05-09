`timescale 1ns/1ns
`include "layer_controller.v"

module layer_controller_dut;


   reg [127:0]  data_in;
   wire [127:0] data_out;
   wire [15:0]  addr;
   wire [3:0]   len;
   wire 	  WE;
   wire 	  RE;
   reg 	  op_done;
   reg 	  rst;
   reg 	  layer_en;
   wire 	  layer_done;
   
   layer_controller dut (
			 .data_in(data_in),
			 .data_out(data_out),
			 .addr(addr),
			 

);


   initial begin
      $dumpfile("layer_controller_dut.vcd");
      $dumpvars(0, dut);
   end
   
endmodule // layer_controller_dut

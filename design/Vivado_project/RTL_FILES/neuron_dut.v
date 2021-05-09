`include "neuron.v"
`timescale 1ns/1ns
module neuron_dut;

   reg 		    rst;
   reg [(16*8)-1:0] input_value;
   reg [(16*8)-1:0] input_weight;
   reg [16-1:0]     input_bias;
   reg 		    srdy;
   reg 		    en;
   reg [8-1:0]      input_enable;
   
   wire [16-1:0]    output_value;
   wire 	    drdy;
   wire 	    done;
   
   
   neuron dut (
	       .en (en),
	       .rst(rst),
	       .input_value(input_value),
	       .input_weight(input_weight),
	       .input_bias(input_bias),
	       .output_value(output_value),
	       .srdy(srdy),
	       .drdy(drdy),
	       .done(done)
	       );


   initial begin
      $dumpfile("neuron_dut.vcd");
      $dumpvars(0, dut);

      input_value = 0;
      input_weight = 0;
      input_bias = 0;
      input_enable = 0;
      en = 0;
      srdy = 0;
      rst = 1;
      #1;
      
      wait(drdy);
      
      rst = 0;
      

      #1;

      input_value = {{16'h0001}, {16'h0002}, {16'h0003}, {16'h0004},
		     {16'h0005}, {16'h0006}, {16'h0007}, {16'h0008}};
      input_weight = {{16'h0001}, {16'h0001}, {16'h0001}, {16'h0001}, 
		      {16'h0001}, {16'h0001}, {16'h0001}, {16'h0001}};
      input_bias = 16'hCD;
      
      srdy = 1;
      
      
      wait (!drdy);
      #1;
      srdy = 0;
      wait (done);
      #1;
      
      

   end
   

   

endmodule // neuron_dut



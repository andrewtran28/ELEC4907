// Module: crossbar.v
// Project: Artificial Neural Network Co-processor
// Description: crossbar switch with parametrized datapath width.
// Authors: Vladimir Milicevic
// Date: Sep 7 2019
`timescale 1ns/1ns
module crossbar (
		 input [19:0] 	   in_upper, 
		 input [19:0] 	   in_lower, 
		 input  		   in_control,
		 output [19:0] out_upper, 
		 output [19:0] out_lower
		 );
   
   /* 
    Control Signal:
    0 = Straight 
    1 = XBAR (swaps upper and lower inputs on the output)
    */

   assign out_upper = ~in_control ? in_upper : in_lower;
   assign out_lower = ~in_control ? in_lower : in_upper;
   
endmodule // crossbar

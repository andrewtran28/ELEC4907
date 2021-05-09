`timescale 1ns/1ns

module neuron_fma (
		   input 	   en,
		   input [16-1:0]  a,
		   input [16-1:0]  b,
		   input [16-1:0]  c,
		   output reg [16-1:0] z,
		   output reg	   done,
		   input rst
		   );


   
   
   //Waiting for FMA to have an en input signal which is rising-edge triggered 'start' button
   //done output to siganl the FMA operation is complete
   //For now, this placeholder FMA will be implemeneted, its just an XOR of the inputs 'a' ^ 'b' ^  'c'
   //operation begins when en is pulsed high
   //done is asserted when it is complete, stays asserted until another operation begins (i.e. en is triggered)

   always @(posedge rst) begin
      done <= 0;
      z <= 0;
   end
   

   always @(posedge en)begin
      done = 0;
      #1;
      z = (a*b)+c;
      done = 1;
      #1;
   end

endmodule // neuron_fma

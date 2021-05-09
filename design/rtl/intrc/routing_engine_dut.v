`include "../intrc/routing_engine.v"
`include "../intrc/benes.v"
`timescale 1ns/1ns

module routing_engine_dut;

   wire [20-1:0] control;

   reg [23:0] dest_address;
   reg [7:0]  input_en;
   wire       done;
   
   
   routing_engine dut (
		       // Outputs
		       .control(control),
		       .done (done),
		       // Inputs
		       .dest_address	(dest_address),
		       .input_en (input_en)
		       );
   

   wire [152-1:0] out_output;
   reg [(16*4*2)-1:0]  in_input;
   
   
   benes u_benes (
		  // Outputs
		  .out_output		(out_output),
		  // Inputs
		  .in_input		({16'd0, 16'd0, 16'd0, 16'd0, 16'd0, 16'd0, 16'd0, 16'hFFFF}),
		  .in_control		(control));
   

   
   initial begin
      $dumpfile("routing_engine_dut.vcd");
      $dumpvars(0, dut, u_benes);

      
      
      #1;

      input_en = 8'hFF;
      
      dest_address = {3'd6, 3'd7, 3'd5, 3'd4, 3'd3, 3'd2, 3'd1, 3'd0};

      wait (done);

      #1;

      input_en = 8'h0F;
      
      dest_address = {3'd7, 3'd6, 3'd5, 3'd4, 3'd3, 3'd2, 3'd1, 3'd0};

      wait (done);

      #1;


      input_en = 8'h01;
      
      dest_address = {3'd0, 3'd0, 3'd0, 3'd0, 3'd0, 3'd0, 3'd0, 3'd4};

      wait (done);

      #1;
      
      
      
   end
   
endmodule // routing_engine_dut


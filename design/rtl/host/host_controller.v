`include "../neuron/layer_controller.v"
`include "../cache/l1_cache.v"
`ifndef _memory_map_vh
 `define _memory_map_vh
 `include "memory_map.vh"
`endif

module host_controller(
		       input 	      rst,
		       input [127:0]  master_data_in,
		       input [15:0]   master_addr,
		       input 	      master_WE,
		       input 	      master_RE,
		       input [4-1:0]  master_len,
		       output [127:0] master_data_out,
		       output 	      master_op_done
		       );
   

   wire [128-1:0] 		      layer_mem_data_out [8-1:0];
   wire [16-1:0] 		      layer_mem_addr [8-1:0];
   wire [4-1:0] 		      layer_mem_len [8-1:0];
   wire [8-1:0] 		      layer_mem_WE ;
   wire [8-1:0] 		      layer_mem_RE ;
   wire [8-1:0] 		      layer_done ;

   reg [128-1:0] 		      mem_layer_data_out [8-1:0];
   reg [8-1:0] 			      mem_layer_op_done ;
   reg [8-1:0] 			      layer_en;
   reg [8-1:0] 			      layer_rst ;


   /*
    genvar 			      i;
    
    generate
    
    for(i=0;i>=0;i=i-1) begin : generate_layer_controllers
    layer_controller u_layer_controller (
    // Outputs
    .data_out		(layer_mem_data_out[i]),
    .addr		(layer_mem_addr[i]),
    .len		(layer_mem_len[i]),
    .WE		(layer_mem_WE[i]),
    .RE		(layer_mem_RE[i]),
    .layer_done	(layer_done[i]),
    // Inputs
    .data_in		(mem_layer_data_out[i]),
    .op_done		(mem_layer_op_done[i]),
    .rst		(layer_rst[i]),
    .layer_en		(layer_en[i])
    );
      end // block: generate_layer_controllers



    
   endgenerate
    */


   layer_controller dut (
			 // Outputs
			 .data_out		(layer_mem_data_out[0]),
			 .addr		(layer_mem_addr[0]),
			 .len		(layer_mem_len[0]),
			 .WE		(layer_mem_WE[0]),
			 .RE		(layer_mem_RE[0]),
			 .layer_done	(layer_done[0]),
			 // Inputs
			 .data_in		(mem_layer_data_out[0]),
			 .op_done		(mem_layer_op_done[0]),
			 .rst		(layer_rst[0]),
			 .layer_en		(layer_en[0])
			 );


   integer 			      i;
   
   initial begin
      $dumpfile("host_controller_dut.vcd");
      $dumpvars(0, dut);

      mem_layer_data_out[0] <= 0;
      mem_layer_op_done[0] <= 0;
      layer_en <= 0;
      layer_rst <= 1;
      #1;
      layer_rst <= 0;
      #1;

      for(i=0;i<64;i=i+1)begin
	 
	 mem_layer_data_out[0] <= i+1;
	 
	 wait (layer_mem_RE[0]);
	 mem_layer_op_done <= 1;
	 wait (!layer_mem_RE[0]);
	 mem_layer_op_done <= 0;
	 	 if(layer_done[0] & (i>10)) i=64;

      end
      
   end


   
   /*
    
    l1_cache u_l1_cache(
    // Outputs
    .master_data_out	(master_data_out[127:0]),
    .master_op_done	(master_op_done),
    .master_data_in	(master_data_in[127:0]),
    .master_addr	(master_addr[15:0]),
    .master_len	(master_len[3:0]),
    .master_WE	(master_WE),
    .master_RE	(master_RE),
    .layer_0_data_out(mem_layer_data_out[7]),
    .layer_0_op_done	(mem_layer_op_done[7]),
    .layer_0_data_in	(layer_mem_data_out[7]),
    .layer_0_addr	(layer_mem_addr[7]),
    .layer_0_len	(layer_mem_len[7]),
    .layer_0_WE	(layer_mem_WE[7]),
    .layer_0_RE	(layer_mem_RE[7]),
    .layer_1_data_out(mem_layer_data_out[6]),
    .layer_1_op_done	(mem_layer_op_done[6]),
    .layer_1_data_in	(layer_mem_data_out[6]),
    .layer_1_addr	(layer_mem_addr[6]),
    .layer_1_len	(layer_mem_len[6]),
    .layer_1_WE	(layer_mem_WE[6]),
    .layer_1_RE	(layer_mem_RE[6]),
    .layer_2_data_out(mem_layer_data_out[5]),
    .layer_2_op_done	(mem_layer_op_done[5]),
    .layer_2_data_in	(layer_mem_data_out[5]),
    .layer_2_addr	(layer_mem_addr[5]),
    .layer_2_len	(layer_mem_len[5]),
    .layer_2_WE	(layer_mem_WE[5]),
    .layer_2_RE	(layer_mem_RE[5]),
    .layer_3_data_out(mem_layer_data_out[4]),
    .layer_3_op_done	(mem_layer_op_done[4]),
    .layer_3_data_in	(layer_mem_data_out[4]),
    .layer_3_addr	(layer_mem_addr[4]),
    .layer_3_len	(layer_mem_len[4]),
    .layer_3_WE	(layer_mem_WE[4]),
    .layer_3_RE	(layer_mem_RE[4]),
    .layer_4_data_out(mem_layer_data_out[3]),
    .layer_4_op_done	(mem_layer_op_done[3]),
    .layer_4_data_in	(layer_mem_data_out[3]),
    .layer_4_addr	(layer_mem_addr[3]),
    .layer_4_len	(layer_mem_len[3]),
    .layer_4_WE	(layer_mem_WE[3]),
    .layer_4_RE	(layer_mem_RE[3]),
    .layer_5_data_out(mem_layer_data_out[2]),
    .layer_5_op_done	(mem_layer_op_done[2]),
    .layer_5_data_in	(layer_mem_data_out[2]),
    .layer_5_addr	(layer_mem_addr[2]),
    .layer_5_len	(layer_mem_len[2]),
    .layer_5_WE	(layer_mem_WE[2]),
    .layer_5_RE	(layer_mem_RE[2]),
    .layer_6_data_out(mem_layer_data_out[1]),
    .layer_6_op_done	(mem_layer_op_done[1]),
    .layer_6_data_in	(layer_mem_data_out[1]),
    .layer_6_addr	(layer_mem_addr[1]),
    .layer_6_len	(layer_mem_len[1]),
    .layer_6_WE	(layer_mem_WE[1]),
    .layer_6_RE	(layer_mem_RE[1]),
    .layer_7_data_out(mem_layer_data_out[0]),
    .layer_7_op_done	(mem_layer_op_done[0]),
    .layer_7_data_in	(layer_mem_data_out[0]),
    .layer_7_addr	(layer_mem_addr[0]),
    .layer_7_len	(layer_mem_len[0]),
    .layer_7_WE	(layer_mem_WE[0]),
    .layer_7_RE	(layer_mem_RE[0])
    );

    */


   
   
   
endmodule // host_controller


// Local Variables:
// verilog-library-directories:("../*")
// verilog-library-files:("")
// verilog-library-extensions:(".v" ".h")
// End:

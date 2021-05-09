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


// Module: benes.v
// Project: Artificial Neural Network Co-processor
// Description: 8x8 Benes network with parametrized datapath width.
// Authors: Vladimir Milicevic
// Date: Sep 7 2019
module benes( 
	      input [128-1:0]  in_input ,
	      input [20-1:0]   in_control ,
	      input [8-1:0]    port_en_n,
	      output [160-1:0] out_output 
	      );
   
   wire [19:0] 		    in_upper_00;
   wire [19:0] 		    in_lower_00;
   wire [19:0] 		    in_upper_01;
   wire [19:0] 		    in_lower_01;
   wire [19:0] 		    in_upper_02;
   wire [19:0] 		    in_lower_02;
   wire [19:0] 		    in_upper_03;
   wire [19:0] 		    in_lower_03;
   wire [19:0] 		    in_upper_10;
   wire [19:0] 		    in_lower_10;
   wire [19:0] 		    in_upper_11;
   wire [19:0] 		    in_lower_11;
   wire [19:0] 		    in_upper_12;
   wire [19:0] 		    in_lower_12;
   wire [19:0] 		    in_upper_13;
   wire [19:0] 		    in_lower_13;
   wire [19:0] 		    in_upper_20;
   wire [19:0] 		    in_lower_20;
   wire [19:0] 		    in_upper_21;
   wire [19:0] 		    in_lower_21;
   wire [19:0] 		    in_upper_22;
   wire [19:0] 		    in_lower_22;
   wire [19:0] 		    in_upper_23;
   wire [19:0] 		    in_lower_23;
   wire [19:0] 		    in_upper_30;
   wire [19:0] 		    in_lower_30;
   wire [19:0] 		    in_upper_31;
   wire [19:0] 		    in_lower_31;
   wire [19:0] 		    in_upper_32;
   wire [19:0] 		    in_lower_32;
   wire [19:0] 		    in_upper_33;
   wire [19:0] 		    in_lower_33;
   wire [19:0] 		    in_upper_40;
   wire [19:0] 		    in_lower_40;
   wire [19:0] 		    in_upper_41;
   wire [19:0] 		    in_lower_41;
   wire [19:0] 		    in_upper_42;
   wire [19:0] 		    in_lower_42;
   wire [19:0] 		    in_upper_43;
   wire [19:0] 		    in_lower_43;
   wire [19:0] 		    out_upper_40;
   wire [19:0] 		    out_lower_40;
   wire [19:0] 		    out_upper_41;
   wire [19:0] 		    out_lower_41;
   wire [19:0] 		    out_upper_42;
   wire [19:0] 		    out_lower_42;
   wire [19:0] 		    out_upper_43;
   wire [19:0] 		    out_lower_43;
   wire  		    in_control_00;
   wire  		    in_control_01;
   wire  		    in_control_02;
   wire  		    in_control_03;
   wire  		    in_control_10;
   wire  		    in_control_11;
   wire  		    in_control_12;
   wire  		    in_control_13;
   wire  		    in_control_20;
   wire  		    in_control_21;
   wire  		    in_control_22;
   wire  		    in_control_23;
   wire  		    in_control_30;
   wire  		    in_control_31;
   wire  		    in_control_32;
   wire  		    in_control_33;
   wire  		    in_control_40;
   wire  		    in_control_41;
   wire  		    in_control_42;
   wire  		    in_control_43;
   assign in_control_00 = in_control[19];
   assign in_control_01 = in_control[18];
   assign in_control_02 = in_control[17];
   assign in_control_03 = in_control[16];
   assign in_control_10 = in_control[15];
   assign in_control_11 = in_control[14];
   assign in_control_12 = in_control[13];
   assign in_control_13 = in_control[12];
   assign in_control_20 = in_control[11];
   assign in_control_21 = in_control[10];
   assign in_control_22 = in_control[9];
   assign in_control_23 = in_control[8];
   assign in_control_30 = in_control[7];
   assign in_control_31 = in_control[6];
   assign in_control_32 = in_control[5];
   assign in_control_33 = in_control[4];
   assign in_control_40 = in_control[3];
   assign in_control_41 = in_control[2];
   assign in_control_42 = in_control[1];
   assign in_control_43 = in_control[0];
   assign in_upper_00 = port_en_n[0] ? {in_input[(16*8)-1:(16*7)], 4'hF} : {in_input[(16*8)-1:(16*7)], 4'h0};		
   assign in_lower_00 = port_en_n[1] ? {in_input[(16*7)-1:(16*6)], 4'hF} : {in_input[(16*7)-1:(16*6)], 4'h1};
   assign in_upper_01 = port_en_n[2] ? {in_input[(16*6)-1:(16*5)], 4'hF} : {in_input[(16*6)-1:(16*5)], 4'h2};		
   assign in_lower_01 = port_en_n[3] ? {in_input[(16*5)-1:(16*4)], 4'hF} : {in_input[(16*5)-1:(16*4)], 4'h3};
   assign in_upper_02 = port_en_n[4] ? {in_input[(16*4)-1:(16*3)], 4'hF} : {in_input[(16*4)-1:(16*3)], 4'h4};		
   assign in_lower_02 = port_en_n[5] ? {in_input[(16*3)-1:(16*2)], 4'hF} : {in_input[(16*3)-1:(16*2)], 4'h5};
   assign in_upper_03 = port_en_n[6] ? {in_input[(16*2)-1:(16*1)], 4'hF} : {in_input[(16*2)-1:(16*1)], 4'h6};		
   assign in_lower_03 = port_en_n[7] ? {in_input[(16*1)-1:(16*0)], 4'hF} : {in_input[(16*1)-1:(16*0)], 4'h7};
   
   assign out_output = {out_upper_40, out_lower_40, out_upper_41, out_lower_41, out_upper_42, out_lower_42, out_upper_43, out_lower_43};

 
   //Stage 0
   crossbar u_00_crossbar(
			  .out_upper	   (in_upper_10),
			  .out_lower		(in_upper_12),
			  .in_upper		(in_upper_00),
			  .in_lower		(in_lower_00),
			  .in_control 	(in_control_00)
			  );
   crossbar u_01_crossbar(
			  .out_upper	   (in_lower_10),
			  .out_lower		(in_lower_12),
			  .in_upper		(in_upper_01),
			  .in_lower		(in_lower_01),
			  .in_control 	(in_control_01)
			  );
   crossbar u_02_crossbar(
			  .out_upper	   (in_upper_11),
			  .out_lower		(in_upper_13),
			  .in_upper		(in_upper_02),
			  .in_lower		(in_lower_02),
			  .in_control 	(in_control_02)
			  );
   crossbar u_03_crossbar(
			  .out_upper	   (in_lower_11),
			  .out_lower		(in_lower_13),
			  .in_upper		(in_upper_03),
			  .in_lower		(in_lower_03),
			  .in_control 	(in_control_03)
			  );	
   
   //Stage 1
   crossbar u_10_crossbar(
			  .out_upper	   (in_upper_20),
			  .out_lower		(in_upper_21),
			  .in_upper		(in_upper_10),
			  .in_lower		(in_lower_10),
			  .in_control 	(in_control_10)
			  );
   crossbar u_11_crossbar(
			  .out_upper	   (in_lower_20),
			  .out_lower		(in_lower_21),
			  .in_upper		(in_upper_11),
			  .in_lower		(in_lower_11),
			  .in_control 	(in_control_11)
			  );
   crossbar u_12_crossbar(
			  .out_upper	   (in_upper_22),
			  .out_lower		(in_upper_23),
			  .in_upper		(in_upper_12),
			  .in_lower		(in_lower_12),
			  .in_control 	(in_control_12)
			  );
   crossbar u_13_crossbar(
			  .out_upper	   (in_lower_22),
			  .out_lower		(in_lower_23),
			  .in_upper		(in_upper_13),
			  .in_lower		(in_lower_13),
			  .in_control 	(in_control_13)
			  );

 
   //Stage 2
   crossbar u_20_crossbar(
			  .out_upper	   (in_upper_30),
			  .out_lower		(in_upper_31),
			  .in_upper		(in_upper_20),
			  .in_lower		(in_lower_20),
			  .in_control 	(in_control_20)
			  );
   crossbar u_21_crossbar(
			  .out_upper	   (in_lower_30),
			  .out_lower		(in_lower_31),
			  .in_upper		(in_upper_21),
			  .in_lower		(in_lower_21),
			  .in_control 	(in_control_21)
			  );
   crossbar u_22_crossbar(
			  .out_upper	   (in_upper_32),
			  .out_lower		(in_upper_33),
			  .in_upper		(in_upper_22),
			  .in_lower		(in_lower_22),
			  .in_control 	(in_control_22)
			  );
   crossbar u_23_crossbar(
			  .out_upper	   (in_lower_32),
			  .out_lower		(in_lower_33),
			  .in_upper		(in_upper_23),
			  .in_lower		(in_lower_23),
			  .in_control 	(in_control_23)
			  );

 
   //Stage 3
   crossbar u_30_crossbar(
			  .out_upper	   (in_upper_40),
			  .out_lower		(in_upper_41),
			  .in_upper		(in_upper_30),
			  .in_lower		(in_lower_30),
			  .in_control 	(in_control_30)
			  );
   crossbar u_31_crossbar(
			  .out_upper	   (in_upper_42),
			  .out_lower		(in_upper_43),
			  .in_upper		(in_upper_31),
			  .in_lower		(in_lower_31),
			  .in_control 	(in_control_31)
			  );
   crossbar u_32_crossbar(
			  .out_upper	   (in_lower_40),
			  .out_lower		(in_lower_41),
			  .in_upper		(in_upper_32),
			  .in_lower		(in_lower_32),
			  .in_control 	(in_control_32)
			  );
   crossbar u_33_crossbar(
			  .out_upper	   (in_lower_42),
			  .out_lower		(in_lower_43),
			  .in_upper		(in_upper_33),
			  .in_lower		(in_lower_33),
			  .in_control 	(in_control_33)
			  );

 
   //Stage 4
   crossbar u_40_crossbar(
			  .out_upper	   (out_upper_40),
			  .out_lower		(out_lower_40),
			  .in_upper		(in_upper_40),
			  .in_lower		(in_lower_40),
			  .in_control 	(in_control_40)
			  );
   crossbar u_41_crossbar(
			  .out_upper	   (out_upper_41),
			  .out_lower		(out_lower_41),
			  .in_upper		(in_upper_41),
			  .in_lower		(in_lower_41),
			  .in_control 	(in_control_41)
			  );
   crossbar u_42_crossbar(
			  .out_upper	   (out_upper_42),
			  .out_lower		(out_lower_42),
			  .in_upper		(in_upper_42),
			  .in_lower		(in_lower_42),
			  .in_control 	(in_control_42)
			  );
   crossbar u_43_crossbar(
			  .out_upper	   (out_upper_43),
			  .out_lower		(out_lower_43),
			  .in_upper		(in_upper_43),
			  .in_lower		(in_lower_43),
			  .in_control 	(in_control_43)
			  );				 
endmodule // benes

// Module: routing_engine.v
// Project: Artificial Neural Network Co-processor
// Description: 8x8 Benes NB switch routing engine
// Authors: Vladimir Milicevic
// Date: Sep 11 2019
`timescale 1ns/1ns

module routing_engine_CLOCKED(
		      input [32-1:0] port_dest,
		      input clk,
		      input rst,
		      output [20-1:0]   control,
		      output reg done
		      );

   wire [24-1:0] dest_address;
   assign  dest_address [24-1-3*0:24-3*1] = port_dest[32-1-1-4*0:32-4*1];
   assign  dest_address [24-1-3*1:24-3*2] = port_dest[32-1-1-4*1:32-4*2];
   assign  dest_address [24-1-3*2:24-3*3] = port_dest[32-1-1-4*2:32-4*3];
   assign  dest_address [24-1-3*3:24-3*4] = port_dest[32-1-1-4*3:32-4*4];
   assign  dest_address [24-1-3*4:24-3*5] = port_dest[32-1-1-4*4:32-4*5];
   assign  dest_address [24-1-3*5:24-3*6] = port_dest[32-1-1-4*5:32-4*6];
   assign  dest_address [24-1-3*6:24-3*7] = port_dest[32-1-1-4*6:32-4*7];
   assign  dest_address [24-1-3*7:24-3*8] = port_dest[32-1-1-4*7:32-4*8];

   wire [8-1:0] input_en;
    assign input_en [0] = port_dest[32-1-4*0];
    assign input_en [1] = port_dest[32-1-4*1];
    assign input_en [2] = port_dest[32-1-4*2];
    assign input_en [3] = port_dest[32-1-4*3];
    assign input_en [4] = port_dest[32-1-4*4];
    assign input_en [5] = port_dest[32-1-4*5];
    assign input_en [6] = port_dest[32-1-4*6];
    assign input_en [7] = port_dest[32-1-4*7];

   reg 				     en [7:0];
   reg [3-1:0] 			     dst [0:8-1]; 
   reg [0:3-1] 			     loc_dst;
   reg [0:3-1] 			     stage_0_output[0:8-1], stage_1_output[0:8-1];
   reg [0:3-1] 			     stage_1_input[0:8-1];
   reg [0:4-1] 			     stage_0_sw_ctl, stage_1_sw_ctl;
   wire [0:3-1] 		     stage_2_output[0:8-1], stage_3_output[0:8-1], stage_4_output[0:8-1];
   wire [0:3-1] 		     stage_2_input[0:8-1], stage_3_input[0:8-1], stage_4_input[0:8-1];
   wire [0:4-1] 		     stage_2_sw_ctl, stage_3_sw_ctl, stage_4_sw_ctl;
   reg 				     flag, flag0;
   integer 			     i, j;

   reg [7:0] 			     input_reserved;
   reg [7:0] 			     output_reserved;
   reg port_found;
   
   
   always @(posedge clk) begin
    port_found = 0;
      done = 0;
      flag = 0;
      flag0 = 0;
      loc_dst = 0;
      input_reserved[0] = 0;
      input_reserved[1] = 0;
      input_reserved[2] = 0;
      input_reserved[3] = 0;
      input_reserved[4] = 0;
      input_reserved[5] = 0;
      input_reserved[6] = 0;
      input_reserved[7] = 0;
      output_reserved[0] = 0;
      output_reserved[1] = 0;
      output_reserved[2] = 0;
      output_reserved[3] = 0;
      output_reserved[4] = 0;
      output_reserved[5] = 0;
      output_reserved[6] = 0;
      output_reserved[7] = 0;

      if (input_en[0]) begin
	 input_reserved[0] = 1;
	 dst[0] = dest_address[24-1-(3*0):24-(3*1)];
	 output_reserved [dst[0]] = 1;
      end

      if (input_en[1]) begin
	 input_reserved[1] = 1;
	 dst[1] = dest_address[24-1-(3*1):24-(3*2)];
	 output_reserved [dst[1]] = 1;
      end

      if (input_en[2]) begin
	 input_reserved[2] = 1;
	 dst[2] = dest_address[24-1-(3*2):24-(3*3)];
	 output_reserved [dst[2]] = 1;
      end

      if (input_en[3]) begin
	 input_reserved[3] = 1;
	 dst[3] = dest_address[24-1-(3*3):24-(3*4)];
	 output_reserved [dst[3]] = 1;
      end

      if (input_en[4]) begin
	 input_reserved[4] = 1;
	 dst[4] = dest_address[24-1-(3*4):24-(3*5)];
	 output_reserved [dst[4]] = 1;
      end

      if (input_en[5]) begin
	 input_reserved[5] = 1;
	 dst[5] = dest_address[24-1-(3*5):24-(3*6)];
	 output_reserved [dst[5]] = 1;
      end

      if (input_en[6]) begin
	 input_reserved[6] = 1;
	 dst[6] = dest_address[24-1-(3*6):24-(3*7)];
	 output_reserved [dst[6]] = 1;
      end

      if (input_en[7]) begin
	 input_reserved[7] = 1;
	 dst[7] = dest_address[24-1-(3*7):24-(3*8)];
	 output_reserved [dst[7]] = 1;
      end

      
      for(i=0;i<8;i=i+1)begin
          
          port_found = 0;

                 if (~input_reserved[i])begin //no connection is made
                    for(j=0;j<8;j=j+1)begin //find an empty output port and assign
                    if (~port_found)begin
                           if (~output_reserved[j]) begin
                                  output_reserved[j] = 1;
                                  dst[i] = j;
                                  port_found = 1;
                                  input_reserved[i]=1;
                          end
                       end
                    end
                 end
                 
      end         

      // Set all stage 0 switches to XBAR
      stage_0_sw_ctl[0] = 1;
      stage_0_sw_ctl[1] = 1;
      stage_0_sw_ctl[2] = 1;
      stage_0_sw_ctl[3] = 1;
      

      /* Algorithm-controlled SW1 stage: */
      
      for(i=0;i<=3;i=i+1) begin //for each mod in the set
	 
 	 for(j=0;j<=3;j=j+1) begin //for each destination ports
	    
	    if(!flag) begin
	       
	       loc_dst = dst[j*2];
	       
	       if ((loc_dst[0:2-1] == i) && (!flag)) begin
		  
		  stage_0_sw_ctl[j] = 0;
		  flag = 1;
		  
	       end      
	       
	    end // if (!flag)

	 end // for (j=0;j<=3;j=j+1)

	 flag = 0;
	 
      end // for (i=0;i<4;i=i+1)

      // Stage 0 Address Switch
      stage_0_output[0] = stage_0_sw_ctl[0] ? dst[1] : dst[0];
      stage_0_output[1] = stage_0_sw_ctl[0] ? dst[0] : dst[1];
      stage_0_output[2] = stage_0_sw_ctl[1] ? dst[3] : dst[2];
      stage_0_output[3] = stage_0_sw_ctl[1] ? dst[2] : dst[3];
      stage_0_output[4] = stage_0_sw_ctl[2] ? dst[5] : dst[4];
      stage_0_output[5] = stage_0_sw_ctl[2] ? dst[4] : dst[5];
      stage_0_output[6] = stage_0_sw_ctl[3] ? dst[7] : dst[6];
      stage_0_output[7] = stage_0_sw_ctl[3] ? dst[6] : dst[7];

      // Stage 1 Address Swizzle
      stage_1_input [0] = stage_0_output[0];
      stage_1_input [1] = stage_0_output[2];
      stage_1_input [2] = stage_0_output[4];
      stage_1_input [3] = stage_0_output[6];
      stage_1_input [4] = stage_0_output[1];
      stage_1_input [5] = stage_0_output[3];
      stage_1_input [6] = stage_0_output[5];
      stage_1_input [7] = stage_0_output[7];

      // XBAR every switch
      stage_1_sw_ctl[0] = 1;
      stage_1_sw_ctl[1] = 1;
      stage_1_sw_ctl[2] = 1;
      stage_1_sw_ctl[3] = 1;
      
      for (i=0;i<2;i=i+1)begin // %0 %1
	 
	 for (j=0; j<2; j=j+1) begin // each switch port

	    if((stage_1_input[j*2][0] == i) && (!flag)) begin // upper half switches

	       stage_1_sw_ctl[j] = 0;
	       flag = 1;
	       
	    end

	    if((stage_1_input[j*2+4][0] == i) && (!flag0)) begin //lower half switches

	       stage_1_sw_ctl[j+2] = 0;
	       flag0 = 1;
	       	       
	    end

	 end // for (j=0; j<2; j=j+1)

	 flag = 0;
	 flag0 = 0;
	 if (i==1) #1 done = 1;
	 
	 
      end // for (i=0;i<2;i=i+1)

      // XBAR Switch outputs
      stage_1_output[0] = stage_1_sw_ctl[0] ? stage_1_input[1] : stage_1_input[0];
      stage_1_output[1] = stage_1_sw_ctl[0] ? stage_1_input[0] : stage_1_input[1];
      stage_1_output[2] = stage_1_sw_ctl[1] ? stage_1_input[3] : stage_1_input[2];
      stage_1_output[3] = stage_1_sw_ctl[1] ? stage_1_input[2] : stage_1_input[3];
      stage_1_output[4] = stage_1_sw_ctl[2] ? stage_1_input[5] : stage_1_input[4];
      stage_1_output[5] = stage_1_sw_ctl[2] ? stage_1_input[4] : stage_1_input[5];
      stage_1_output[6] = stage_1_sw_ctl[3] ? stage_1_input[7] : stage_1_input[6];
      stage_1_output[7] = stage_1_sw_ctl[3] ? stage_1_input[6] : stage_1_input[7];

      
      
   end // always @ (dest_address)

   /* Bit-controlled SW2 stage: */

   // Stage 2 address swizzle
   assign stage_2_input[0] = stage_1_output[0];
   assign stage_2_input[1] = stage_1_output[2];
   assign stage_2_input[2] = stage_1_output[1];
   assign stage_2_input[3] = stage_1_output[3];
   assign stage_2_input[4] = stage_1_output[4];
   assign stage_2_input[5] = stage_1_output[6];
   assign stage_2_input[6] = stage_1_output[5];
   assign stage_2_input[7] = stage_1_output[7];

   // stage 2 bit control 
   assign stage_2_sw_ctl = {stage_2_input[0][0], stage_2_input[2][0], stage_2_input[4][0], stage_2_input[6][0]};

   // stage 2 switching
   assign stage_2_output[0] = stage_2_sw_ctl[0] ? stage_2_input[1] : stage_2_input[0];
   assign stage_2_output[1] = stage_2_sw_ctl[0] ? stage_2_input[0] : stage_2_input[1];
   assign stage_2_output[2] = stage_2_sw_ctl[1] ? stage_2_input[3] : stage_2_input[2];
   assign stage_2_output[3] = stage_2_sw_ctl[1] ? stage_2_input[2] : stage_2_input[3];
   assign stage_2_output[4] = stage_2_sw_ctl[2] ? stage_2_input[5] : stage_2_input[4];
   assign stage_2_output[5] = stage_2_sw_ctl[2] ? stage_2_input[4] : stage_2_input[5];
   assign stage_2_output[6] = stage_2_sw_ctl[3] ? stage_2_input[7] : stage_2_input[6];
   assign stage_2_output[7] = stage_2_sw_ctl[3] ? stage_2_input[6] : stage_2_input[7];

   // stage 3 swizzle
   assign stage_3_input[0] = stage_2_output[0];
   assign stage_3_input[1] = stage_2_output[2];
   assign stage_3_input[2] = stage_2_output[1];
   assign stage_3_input[3] = stage_2_output[3];
   assign stage_3_input[4] = stage_2_output[4];
   assign stage_3_input[5] = stage_2_output[6];
   assign stage_3_input[6] = stage_2_output[5];
   assign stage_3_input[7] = stage_2_output[7];

   //stage 3 bit control
   assign stage_3_sw_ctl = {stage_3_input[0][1], stage_3_input[2][1], stage_3_input[4][1], stage_3_input[6][1]};

   //stage 3 switching
   assign stage_3_output[0] = stage_3_sw_ctl[0] ? stage_3_input[1] : stage_3_input[0];
   assign stage_3_output[1] = stage_3_sw_ctl[0] ? stage_3_input[0] : stage_3_input[1];
   assign stage_3_output[2] = stage_3_sw_ctl[1] ? stage_3_input[3] : stage_3_input[2];
   assign stage_3_output[3] = stage_3_sw_ctl[1] ? stage_3_input[2] : stage_3_input[3];
   assign stage_3_output[4] = stage_3_sw_ctl[2] ? stage_3_input[5] : stage_3_input[4];
   assign stage_3_output[5] = stage_3_sw_ctl[2] ? stage_3_input[4] : stage_3_input[5];
   assign stage_3_output[6] = stage_3_sw_ctl[3] ? stage_3_input[7] : stage_3_input[6];
   assign stage_3_output[7] = stage_3_sw_ctl[3] ? stage_3_input[6] : stage_3_input[7];

   //stage 4 swizzle
   assign stage_4_input[0] = stage_3_output[0];
   assign stage_4_input[1] = stage_3_output[4];
   assign stage_4_input[2] = stage_3_output[1];
   assign stage_4_input[3] = stage_3_output[5];
   assign stage_4_input[4] = stage_3_output[2];
   assign stage_4_input[5] = stage_3_output[6];
   assign stage_4_input[6] = stage_3_output[3];
   assign stage_4_input[7] = stage_3_output[7];
   
   //stage 4 bit control
   assign stage_4_sw_ctl = {stage_4_input[0][2], stage_4_input[2][2], stage_4_input[4][2], stage_4_input[6][2]};
   
   //stage 4 switching
   assign stage_4_output[0] = stage_4_sw_ctl[0] ? stage_4_input[1] : stage_4_input[0];
   assign stage_4_output[1] = stage_4_sw_ctl[0] ? stage_4_input[0] : stage_4_input[1];
   assign stage_4_output[2] = stage_4_sw_ctl[1] ? stage_4_input[3] : stage_4_input[2];
   assign stage_4_output[3] = stage_4_sw_ctl[1] ? stage_4_input[2] : stage_4_input[3];
   assign stage_4_output[4] = stage_4_sw_ctl[2] ? stage_4_input[5] : stage_4_input[4];
   assign stage_4_output[5] = stage_4_sw_ctl[2] ? stage_4_input[4] : stage_4_input[5];
   assign stage_4_output[6] = stage_4_sw_ctl[3] ? stage_4_input[7] : stage_4_input[6];
   assign stage_4_output[7] = stage_4_sw_ctl[3] ? stage_4_input[6] : stage_4_input[7];

   // output
   assign control[20-1-(4*0):20-(4*1)] = stage_0_sw_ctl;
   assign control[20-1-(4*1):20-(4*2)] = stage_1_sw_ctl;
   assign control[20-1-(4*2):20-(4*3)] = stage_2_sw_ctl;
   assign control[20-1-(4*3):20-(4*4)] = stage_3_sw_ctl;
   assign control[20-1-(4*4):20-(4*5)] = stage_4_sw_ctl;
   
endmodule // routing_engine

module router(
    input clk,
    input rst,
    input [32-1:0] fwd_routing_engine_port_dest,
    output [160-1:0] fwd_benes_out_output,
    output fwd_routing_engine_done
    );

reg [16-1:0] output_value[8-1:0];
     wire [20-1:0] fwd_routing_engine_control;


      routing_engine_CLOCKED u_fwd_routing_engine (/*AUTOINST*/
                    //input
                    .port_dest(fwd_routing_engine_port_dest), //32b input [8neuron x 4b] 
                    .clk(clk),
                    .rst(rst),
                    //output
                    .control(fwd_routing_engine_control), //20b output; switch matrix control    
                    .done(fwd_routing_engine_done) //1b output
    );
   
     wire [8-1:0] fwd_benes_port_en_n;
     assign fwd_benes_port_en_n [0] = fwd_routing_engine_port_dest[32-1-4*0];
     assign fwd_benes_port_en_n [1] = fwd_routing_engine_port_dest[32-1-4*1];
     assign fwd_benes_port_en_n [2] = fwd_routing_engine_port_dest[32-1-4*2];
     assign fwd_benes_port_en_n [3] = fwd_routing_engine_port_dest[32-1-4*3];
     assign fwd_benes_port_en_n [4] = fwd_routing_engine_port_dest[32-1-4*4];
     assign fwd_benes_port_en_n [5] = fwd_routing_engine_port_dest[32-1-4*5];
     assign fwd_benes_port_en_n [6] = fwd_routing_engine_port_dest[32-1-4*6];
     assign fwd_benes_port_en_n [7] = fwd_routing_engine_port_dest[32-1-4*7];
     
    benes u_fwd_benes (/*AUTOINST*/
           // Outputs
           .out_output         (fwd_benes_out_output), //160 bit output, 
           // Inputs
           .in_input             ({output_value[0], output_value[1], output_value[2], output_value[3], 
                                output_value[4], output_value[5], output_value[6], output_value[7]}), //128 bit data (8 neuron x 16b data)
           .in_control         (fwd_routing_engine_control), // 20b switch matrix control
           .port_en_n         (fwd_benes_port_en_n)
    );

    assign benes_out = fwd_benes_out_output;

endmodule//router
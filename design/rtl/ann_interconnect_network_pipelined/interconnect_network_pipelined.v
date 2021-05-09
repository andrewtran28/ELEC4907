// Module: benes.v
// Project: Artificial Neural Network Co-processor
// Description: 8x8 Benes network with parametrized datapath width.
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

module benes( 
	      input [128-1:0]  in_input ,
	      input [20-1:0]   in_control ,
	      input [8-1:0]    port_en_n,
	      output [160-1:0] out_output,
	      input clk, rst
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
   wire [19:0] stage_0_output [7:0];
   reg [19:0] stage_0_retimer[7:0];
   always@(posedge clk)begin
		stage_0_retimer[0] <= stage_0_output[0];
		stage_0_retimer[1] <= stage_0_output[1];
		stage_0_retimer[2] <= stage_0_output[2];
		stage_0_retimer[3] <= stage_0_output[3];
		stage_0_retimer[4] <= stage_0_output[4];
		stage_0_retimer[5] <= stage_0_output[5];
		stage_0_retimer[6] <= stage_0_output[6];
		stage_0_retimer[7] <= stage_0_output[7];
   end
   assign in_upper_10 = stage_0_retimer[0];
   assign in_upper_12 = stage_0_retimer[1];
   assign in_lower_10 = stage_0_retimer[2];
   assign in_lower_12 = stage_0_retimer[3];
   assign in_upper_11 = stage_0_retimer[4];
   assign in_upper_13 = stage_0_retimer[5];
   assign in_lower_11 = stage_0_retimer[6];
   assign in_lower_13 = stage_0_retimer[7];
   crossbar u_00_crossbar(
			  .out_upper	   (stage_0_output[0]),
			  .out_lower		(stage_0_output[1]),
			  .in_upper		(in_upper_00),
			  .in_lower		(in_lower_00),
			  .in_control 	(in_control_00)
			  );
   crossbar u_01_crossbar(
			  .out_upper	   (stage_0_output[2]),
			  .out_lower		(stage_0_output[3]),
			  .in_upper		(in_upper_01),
			  .in_lower		(in_lower_01),
			  .in_control 	(in_control_01)
			  );
   crossbar u_02_crossbar(
			  .out_upper	   (stage_0_output[4]),
			  .out_lower		(stage_0_output[5]),
			  .in_upper		(in_upper_02),
			  .in_lower		(in_lower_02),
			  .in_control 	(in_control_02)
			  );
   crossbar u_03_crossbar(
			  .out_upper	   (stage_0_output[6]),
			  .out_lower		(stage_0_output[7]),
			  .in_upper		(in_upper_03),
			  .in_lower		(in_lower_03),
			  .in_control 	(in_control_03)
			  );	
   
   //Stage 1
   wire [19:0] stage_1_output [7:0];
   reg [19:0] stage_1_retimer[7:0];
   always@(posedge clk)begin
		stage_1_retimer[0] <= stage_1_output[0];
		stage_1_retimer[1] <= stage_1_output[1];
		stage_1_retimer[2] <= stage_1_output[2];
		stage_1_retimer[3] <= stage_1_output[3];
		stage_1_retimer[4] <= stage_1_output[4];
		stage_1_retimer[5] <= stage_1_output[5];
		stage_1_retimer[6] <= stage_1_output[6];
		stage_1_retimer[7] <= stage_1_output[7];
   end
   assign in_upper_20 = stage_1_retimer[0];
   assign in_upper_21 = stage_1_retimer[1];
   assign in_lower_20 = stage_1_retimer[2];
   assign in_lower_21 = stage_1_retimer[3];
   assign in_upper_22 = stage_1_retimer[4];
   assign in_upper_23 = stage_1_retimer[5];
   assign in_lower_22 = stage_1_retimer[6];
   assign in_lower_23 = stage_1_retimer[7];
   crossbar u_10_crossbar(
			  .out_upper	   (stage_1_output[0]),
			  .out_lower		(stage_1_output[1]),
			  .in_upper		(in_upper_10),
			  .in_lower		(in_lower_10),
			  .in_control 	(in_control_10)
			  );
   crossbar u_11_crossbar(
			  .out_upper	   (stage_1_output[2]),
			  .out_lower		(stage_1_output[3]),
			  .in_upper		(in_upper_11),
			  .in_lower		(in_lower_11),
			  .in_control 	(in_control_11)
			  );
   crossbar u_12_crossbar(
			  .out_upper	   (stage_1_output[4]),
			  .out_lower		(stage_1_output[5]),
			  .in_upper		(in_upper_12),
			  .in_lower		(in_lower_12),
			  .in_control 	(in_control_12)
			  );
   crossbar u_13_crossbar(
			  .out_upper	   (stage_1_output[6]),
			  .out_lower		(stage_1_output[7]),
			  .in_upper		(in_upper_13),
			  .in_lower		(in_lower_13),
			  .in_control 	(in_control_13)
			  );

 
   //Stage 2
   wire [19:0] stage_2_output [7:0];
   reg [19:0] stage_2_retimer[7:0];
   always@(posedge clk)begin
		stage_2_retimer[0] <= stage_2_output[0];
		stage_2_retimer[1] <= stage_2_output[1];
		stage_2_retimer[2] <= stage_2_output[2];
		stage_2_retimer[3] <= stage_2_output[3];
		stage_2_retimer[4] <= stage_2_output[4];
		stage_2_retimer[5] <= stage_2_output[5];
		stage_2_retimer[6] <= stage_2_output[6];
		stage_2_retimer[7] <= stage_2_output[7];
   end
   assign in_upper_30 = stage_2_retimer[0];
   assign in_upper_31 = stage_2_retimer[1];
   assign in_lower_30 = stage_2_retimer[2];
   assign in_lower_31 = stage_2_retimer[3];
   assign in_upper_32 = stage_2_retimer[4];
   assign in_upper_33 = stage_2_retimer[5];
   assign in_lower_32 = stage_2_retimer[6];
   assign in_lower_33 = stage_2_retimer[7];
   crossbar u_20_crossbar(
			  .out_upper	   (stage_2_output[0]),
			  .out_lower		(stage_2_output[1]),
			  .in_upper		(in_upper_20),
			  .in_lower		(in_lower_20),
			  .in_control 	(in_control_20)
			  );
   crossbar u_21_crossbar(
			  .out_upper	   (stage_2_output[2]),
			  .out_lower		(stage_2_output[3]),
			  .in_upper		(in_upper_21),
			  .in_lower		(in_lower_21),
			  .in_control 	(in_control_21)
			  );
   crossbar u_22_crossbar(
			  .out_upper	   (stage_2_output[4]),
			  .out_lower		(stage_2_output[5]),
			  .in_upper		(in_upper_22),
			  .in_lower		(in_lower_22),
			  .in_control 	(in_control_22)
			  );
   crossbar u_23_crossbar(
			  .out_upper	   (stage_2_output[6]),
			  .out_lower		(stage_2_output[7]),
			  .in_upper		(in_upper_23),
			  .in_lower		(in_lower_23),
			  .in_control 	(in_control_23)
			  );

 
   //Stage 3
   wire [19:0] stage_3_output [7:0];
   reg [19:0] stage_3_retimer[7:0];
   always@(posedge clk)begin
		stage_3_retimer[0] <= stage_3_output[0];
		stage_3_retimer[1] <= stage_3_output[1];
		stage_3_retimer[2] <= stage_3_output[2];
		stage_3_retimer[3] <= stage_3_output[3];
		stage_3_retimer[4] <= stage_3_output[4];
		stage_3_retimer[5] <= stage_3_output[5];
		stage_3_retimer[6] <= stage_3_output[6];
		stage_3_retimer[7] <= stage_3_output[7];
   end
   assign in_upper_40 = stage_3_retimer[0];
   assign in_upper_41 = stage_3_retimer[1];
   assign in_upper_42 = stage_3_retimer[2];
   assign in_upper_43 = stage_3_retimer[3];
   assign in_lower_40 = stage_3_retimer[4];
   assign in_lower_41 = stage_3_retimer[5];
   assign in_lower_42 = stage_3_retimer[6];
   assign in_lower_43 = stage_3_retimer[7];
   crossbar u_30_crossbar(
			  .out_upper	   (stage_3_output[0]),
			  .out_lower		(stage_3_output[1]),
			  .in_upper		(in_upper_30),
			  .in_lower		(in_lower_30),
			  .in_control 	(in_control_30)
			  );
   crossbar u_31_crossbar(
			  .out_upper	   (stage_3_output[2]),
			  .out_lower		(stage_3_output[3]),
			  .in_upper		(in_upper_31),
			  .in_lower		(in_lower_31),
			  .in_control 	(in_control_31)
			  );
   crossbar u_32_crossbar(
			  .out_upper	   (stage_3_output[4]),
			  .out_lower		(stage_3_output[5]),
			  .in_upper		(in_upper_32),
			  .in_lower		(in_lower_32),
			  .in_control 	(in_control_32)
			  );
   crossbar u_33_crossbar(
			  .out_upper	   (stage_3_output[6]),
			  .out_lower		(stage_3_output[7]),
			  .in_upper		(in_upper_33),
			  .in_lower		(in_lower_33),
			  .in_control 	(in_control_33)
			  );

 
   //Stage 4
   wire [19:0] stage_4_output [7:0];
   reg [19:0] stage_4_retimer[7:0];
   always@(posedge clk)begin
		stage_4_retimer[0] <= stage_4_output[0];
		stage_4_retimer[1] <= stage_4_output[1];
		stage_4_retimer[2] <= stage_4_output[2];
		stage_4_retimer[3] <= stage_4_output[3];
		stage_4_retimer[4] <= stage_4_output[4];
		stage_4_retimer[5] <= stage_4_output[5];
		stage_4_retimer[6] <= stage_4_output[6];
		stage_4_retimer[7] <= stage_4_output[7];
   end
   assign out_upper_40 = stage_4_retimer[0];
   assign out_lower_40 = stage_4_retimer[1];
   assign out_upper_41 = stage_4_retimer[2];
   assign out_lower_41 = stage_4_retimer[3];
   assign out_upper_42 = stage_4_retimer[4];
   assign out_lower_42 = stage_4_retimer[5];
   assign out_upper_43 = stage_4_retimer[6];
   assign out_lower_43 = stage_4_retimer[7];
   crossbar u_40_crossbar(
			  .out_upper	   (stage_4_output[0]),
			  .out_lower		(stage_4_output[1]),
			  .in_upper		(in_upper_40),
			  .in_lower		(in_lower_40),
			  .in_control 	(in_control_40)
			  );
   crossbar u_41_crossbar(
			  .out_upper	   (stage_4_output[2]),
			  .out_lower		(stage_4_output[3]),
			  .in_upper		(in_upper_41),
			  .in_lower		(in_lower_41),
			  .in_control 	(in_control_41)
			  );
   crossbar u_42_crossbar(
			  .out_upper	   (stage_4_output[4]),
			  .out_lower		(stage_4_output[5]),
			  .in_upper		(in_upper_42),
			  .in_lower		(in_lower_42),
			  .in_control 	(in_control_42)
			  );
   crossbar u_43_crossbar(
			  .out_upper	   (stage_4_output[6]),
			  .out_lower		(stage_4_output[7]),
			  .in_upper		(in_upper_43),
			  .in_lower		(in_lower_43),
			  .in_control 	(in_control_43)
			  );				 
endmodule // benes

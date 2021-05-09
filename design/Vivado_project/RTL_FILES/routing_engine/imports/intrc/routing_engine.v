// Module: routing_engine.v
// Project: Artificial Neural Network Co-processor
// Description: 8x8 Benes NB switch routing engine
// Authors: Vladimir Milicevic
// Date: Sep 11 2019
`timescale 1ns/1ns

module routing_engine(
		      input [32-1:0] port_dest,
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
   
   
   always @(dest_address) begin
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

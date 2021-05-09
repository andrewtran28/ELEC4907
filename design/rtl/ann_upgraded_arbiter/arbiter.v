module arbiter (clk, rst, voq0, voq1, voq2, voq3, 
				voq4, voq5, voq6, voq7, out0, out1, 
				out2, out3, out4, out5, out6, out7,
				en0, en1, en2, en3, en4, en5, en6, 
				en7);

	input clk, rst;
	input [7:0] en0, en1, en2, en3, en4, en5, en6, en7;
	input [127:0] voq0, voq1, voq2, voq3, voq4, voq5, voq6, voq7;
	output reg [19:0] out0, out1, out2, out3, out4, out5, out6, out7;

	reg [6:0] port_map [7:0];
	reg [6:0] voq0_map [7:0];
	reg [6:0] voq1_map [7:0];
	reg [6:0] voq2_map [7:0];
	reg [6:0] voq3_map [7:0];
	reg [6:0] voq4_map [7:0];
	reg [6:0] voq5_map [7:0];
	reg [6:0] voq6_map [7:0];
	reg [6:0] voq7_map [7:0];

	reg [2:0] voq_sel, pre_voq_sel;

	wire [7:0] voq_0 [15:0];
	assign voq_0[7] = voq0[16*7 +: 16];
	assign voq_0[6] = voq0[16*6 +: 16];
	assign voq_0[5] = voq0[16*5 +: 16];
	assign voq_0[4] = voq0[16*4 +: 16];
	assign voq_0[3] = voq0[16*3 +: 16];
	assign voq_0[2] = voq0[16*2 +: 16];
	assign voq_0[1] = voq0[16*1 +: 16];
	assign voq_0[0] = voq0[16*0 +: 16];
	wire [7:0] voq_1 [15:0];
	assign voq_1[7] = voq1[16*7 +: 16];
	assign voq_1[6] = voq1[16*6 +: 16];
	assign voq_1[5] = voq1[16*5 +: 16];
	assign voq_1[4] = voq1[16*4 +: 16];
	assign voq_1[3] = voq1[16*3 +: 16];
	assign voq_1[2] = voq1[16*2 +: 16];
	assign voq_1[1] = voq1[16*1 +: 16];
	assign voq_1[0] = voq1[16*0 +: 16];
	wire [7:0] voq_2 [15:0];
	assign voq_2[7] = voq2[16*7 +: 16];
	assign voq_2[6] = voq2[16*6 +: 16];
	assign voq_2[5] = voq2[16*5 +: 16];
	assign voq_2[4] = voq2[16*4 +: 16];
	assign voq_2[3] = voq2[16*3 +: 16];
	assign voq_2[2] = voq2[16*2 +: 16];
	assign voq_2[1] = voq2[16*1 +: 16];
	assign voq_2[0] = voq2[16*0 +: 16];
	wire [7:0] voq_3 [15:0];
	assign voq_3[7] = voq3[16*7 +: 16];
	assign voq_3[6] = voq3[16*6 +: 16];
	assign voq_3[5] = voq3[16*5 +: 16];
	assign voq_3[4] = voq3[16*4 +: 16];
	assign voq_3[3] = voq3[16*3 +: 16];
	assign voq_3[2] = voq3[16*2 +: 16];
	assign voq_3[1] = voq3[16*1 +: 16];
	assign voq_3[0] = voq3[16*0 +: 16];
	wire [7:0] voq_4 [15:0];
	assign voq_4[7] = voq4[16*7 +: 16];
	assign voq_4[6] = voq4[16*6 +: 16];
	assign voq_4[5] = voq4[16*5 +: 16];
	assign voq_4[4] = voq4[16*4 +: 16];
	assign voq_4[3] = voq4[16*3 +: 16];
	assign voq_4[2] = voq4[16*2 +: 16];
	assign voq_4[1] = voq4[16*1 +: 16];
	assign voq_4[0] = voq4[16*0 +: 16];
	wire [7:0] voq_5 [15:0];
	assign voq_5[7] = voq5[16*7 +: 16];
	assign voq_5[6] = voq5[16*6 +: 16];
	assign voq_5[5] = voq5[16*5 +: 16];
	assign voq_5[4] = voq5[16*4 +: 16];
	assign voq_5[3] = voq5[16*3 +: 16];
	assign voq_5[2] = voq5[16*2 +: 16];
	assign voq_5[1] = voq5[16*1 +: 16];
	assign voq_5[0] = voq5[16*0 +: 16];
	wire [7:0] voq_6 [15:0];
	assign voq_6[7] = voq6[16*7 +: 16];
	assign voq_6[6] = voq6[16*6 +: 16];
	assign voq_6[5] = voq6[16*5 +: 16];
	assign voq_6[4] = voq6[16*4 +: 16];
	assign voq_6[3] = voq6[16*3 +: 16];
	assign voq_6[2] = voq6[16*2 +: 16];
	assign voq_6[1] = voq6[16*1 +: 16];
	assign voq_6[0] = voq6[16*0 +: 16];
	wire [7:0] voq_7 [15:0];
	assign voq_7[7] = voq7[16*7 +: 16];
	assign voq_7[6] = voq7[16*6 +: 16];
	assign voq_7[5] = voq7[16*5 +: 16];
	assign voq_7[4] = voq7[16*4 +: 16];
	assign voq_7[3] = voq7[16*3 +: 16];
	assign voq_7[2] = voq7[16*2 +: 16];
	assign voq_7[1] = voq7[16*1 +: 16];
	assign voq_7[0] = voq7[16*0 +: 16];

	integer i, j, i7, i6, i5, i4, i3, i2, i1, i0, j7, j6, j5, j4, j3, j2, j1, j0;
    reg port_map_flag, voq0_flag, voq1_flag, voq2_flag, voq3_flag, voq4_flag, voq5_flag, voq6_flag, voq7_flag;
	always @(negedge clk)begin //compute next starting VOQ
           port_map_flag = 0; //reset break flag
           
			for(i = 0 ; i < 8 ; i = i + 1)begin
				if(&port_map[i] & ~port_map_flag)begin
					pre_voq_sel = i;
					for (j = 0 ; j < 8 ; j = j + 1)begin
					   if(j<i)begin
					       port_map[j][i-1] = 1'b1;
					   end else if (j > i) begin
					       port_map[j][i] = 1'b1;
					   end//if j<i
					end// for j
					port_map[0][i] = 1'b1;
					port_map[1][i] = 1'b1;
					port_map[2][i] = 1'b1;
					port_map[3][i] = 1'b1;
					port_map[4][i] = 1'b1;
					port_map[5][i] = 1'b1;
					port_map[6][i] = 1'b1;
					port_map[7][i] = 1'b1;
					port_map[i] = 7'd0;		
					port_map_flag = 1;
				end//if
			end//for i		

	end

	always @(posedge clk)begin
	voq0_flag = 0;
           voq1_flag = 0;
           voq2_flag = 0;
           voq3_flag = 0;
           voq4_flag = 0;
           voq5_flag = 0;
           voq6_flag = 0;
           voq7_flag = 0;
		for(j = 0 ; j < 8 ; j = j + 1) begin
			voq_sel = (pre_voq_sel + 1)%8; 
				case (voq_sel)
				0: 	begin
						for (i0 = 0 ; i0 < 8 ; i0 = i0 + 1)begin
							if (&voq0_map[i0] & en0[i0] & ~voq0_flag) begin
								out0 = {4'd0, voq_0[i0]};
                                for (j0 = 0 ; j0 < 8 ; j0 = j0 + 1)begin
                                   if(j0<i0)begin
                                       voq0_map[j0][i0-1] = 1'b1;
                                   end else if (j0 > i0) begin
                                       voq0_map[j0][i0] = 1'b1;
                                   end//if j<i
                                end// for j
								voq0_map[i0] = 7'd0;
								voq0_flag = 1;
							end//if voq0_map row
						end//for
					end//case
				1: begin
					for (i1 = 0 ; i1 < 8 ; i1 = i1 + 1)begin
							if (&voq1_map[i1] & en1[i1] & ~voq1_flag) begin
								out1 = {4'd1, voq_1[i1]};
                                for (j1 = 0 ; j1 < 8 ; j1 = j1 + 1)begin
                                   if(j1<i1)begin
                                       voq1_map[j1][i1-1] = 1'b1;
                                   end else if (j1 > i1) begin
                                       voq1_map[j1][i1] = 1'b1;
                                   end//if j<i
                                end// for j
								voq1_map[i1] = 7'd0;
								voq1_flag = 1;
							end//if voq1_map row
						end//for
					end//case
				2: 	begin
					for (i2 = 0 ; i2 < 8 ; i2 = i2 + 1)begin
							if (&voq2_map[i2] & en2[i2] & ~voq2_flag) begin
								out2 = {4'd2, voq_2[i2]};
                                for (j2 = 0 ; j2 < 8 ; j2 = j2 + 1)begin
                                   if(j2<i2)begin
                                       voq2_map[j2][i2-1] = 1'b1;
                                   end else if (j2 > i2) begin
                                       voq2_map[j2][i2] = 1'b1;
                                   end//if j<i
                                end// for j
								voq2_map[i2] = 7'd0;
								voq2_flag = 1;
							end//if voq2_map row
						end//for
					end//case
				3: 	begin
					for (i3 = 0 ; i3 < 8 ; i3 = i3 + 1)begin
							if (&voq3_map[i3] & en3[i3] & ~voq3_flag) begin
								out3 = {4'd3, voq_3[i3]};
                                for (j3 = 0 ; j3 < 8 ; j3 = j3 + 1)begin
                                   if(j3<i3)begin
                                       voq3_map[j3][i3-1] = 1'b1;
                                   end else if (j3 > i3) begin
                                       voq3_map[j3][i3] = 1'b1;
                                   end//if j<i
                                end// for j
								voq3_map[i3] = 7'd0;
								voq3_flag = 1;
							end//if voq3_map row
						end//for
					end//case
				4: 	begin
					for (i4 = 0 ; i4 < 8 ; i4 = i4 + 1)begin
							if (&voq4_map[i4] & en4[i4] & ~voq4_flag) begin
								out4 = {4'd4, voq_4[i4]};
                                for (j4 = 0 ; j4 < 8 ; j4 = j4 + 1)begin
                                   if(j4<i4)begin
                                       voq4_map[j4][i4-1] = 1'b1;
                                   end else if (j4 > i4) begin
                                       voq4_map[j4][i4] = 1'b1;
                                   end//if j<i
                                end// for j
								voq4_map[i4] = 7'd0;
								voq4_flag = 1;
							end//if voq4_map row
						end//for
					end//case
				5: begin
					for (i5 = 0 ; i5 < 8 ; i5 = i5 + 1)begin
							if (&voq5_map[i5] & en5[i5] & ~voq5_flag) begin
								out5 = {4'd5, voq_5[i5]};
                                for (j5 = 0 ; j5 < 8 ; j5 = j5 + 1)begin
                                   if(j5<i5)begin
                                       voq5_map[j5][i5-1] = 1'b1;
                                   end else if (j5 > i5) begin
                                       voq5_map[j5][i5] = 1'b1;
                                   end//if j<i
                                end// for j
								voq5_map[i5] = 7'd0;
								voq5_flag = 1;
							end//if voq5_map row
						end//for
					end//case
				6: begin
					for (i6 = 0 ; i6 < 8 ; i6 = i6 + 1)begin
							if (&voq6_map[i6] & en6[i6] & ~voq6_flag) begin
								out6 = {4'd6, voq_6[i6]};
                                for (j6 = 0 ; j6 < 8 ; j6 = j6 + 1)begin
                                   if(j6<i6)begin
                                       voq6_map[j6][i6-1] = 1'b1;
                                   end else if (j6 > i6) begin
                                       voq6_map[j6][i6] = 1'b1;
                                   end//if j<i
                                end// for j
								voq6_map[i6] = 7'd0;		
								voq6_flag = 1;
							end//if voq6_map row
						end//for
					end
				7: begin
					for (i7 = 0 ; i7 < 8 ; i7 = i7 + 1)begin
							if (&voq7_map[i7] & en7[i7] & ~voq7_flag) begin
								out7 = {4'd7, voq_7[i7]};
                                for (j7 = 0 ; j7 < 8 ; j7 = j7 + 1)begin
                                   if(j7<i7)begin
                                       voq7_map[j7][i7-1] = 1'b1;
                                   end else if (j7 > i7) begin
                                       voq7_map[j7][i7] = 1'b1;
                                   end//if j<i
                                end// for j
								voq7_map[i7] = 7'd0;
								voq7_flag = 1;
							end//if voq7_map row
						end//for
					end
				endcase//voq_sel
			end//for j
		
	end//posedge clk

endmodule//arbiter

module fma_aligner_adder
	(
		mantissa_ab,
		exp_ab,
		sign_ab,
		c,
		exp_diff,
		exp_ab_greater,
		exp_ab_less,

		mantissa_ab_c,
		exp_ab_c,
		sign_ab_c,
		mantissa_shift
	);

	// Input port declarations
	input [19:0] mantissa_ab;
	input [4:0]  exp_ab;
	input        sign_ab;
	input [15:0] c;
	input [4:0]  exp_diff;
	input        exp_ab_greater;
	input        exp_ab_less;

	// Output port declarations
	output     [21:0] mantissa_ab_c;
	output reg [4:0]  exp_ab_c;
	output reg        sign_ab_c;
	output     [4:0]  mantissa_shift;

	reg [21:0] full_mantissa_ab;
	reg [21:0] full_mantissa_c;
	reg [21:0] comp_mantissa_ab;
    reg [21:0] comp_mantissa_c;
	reg [21:0] sum_mantissa_ab_c;

	assign mantissa_ab_c = sum_mantissa_ab_c;
   
	always @(*) begin
		full_mantissa_ab = (exp_ab == 5'b0) ? {2'b00, mantissa_ab} : {2'b01, mantissa_ab};
		full_mantissa_c  = (c[14:10] == 5'b0) ? {2'b00, c[9:0], {10{1'b0}}} : {2'b01, c[9:0], {10{1'b0}}};
		comp_mantissa_ab = (exp_ab == 5'b0) ? {2'b00, mantissa_ab} : {2'b01, mantissa_ab};
		comp_mantissa_c  = (c[14:10] == 5'b0) ? {2'b00, c[9:0], {10{1'b0}}} : {2'b01, c[9:0], {10{1'b0}}};

		if (exp_ab_greater) begin
			exp_ab_c        = exp_ab;
			full_mantissa_c = full_mantissa_c >> exp_diff;
		end
		else if (exp_ab_less) begin
			exp_ab_c         = c[14:10];
			full_mantissa_ab = full_mantissa_ab >> exp_diff;
		end
		else begin
			exp_ab_c = exp_ab;
		end

		case ({sign_ab, c[15]})
			2'b00: begin
				comp_mantissa_ab = full_mantissa_ab;
				comp_mantissa_c  = full_mantissa_c;
				sign_ab_c        = 1'b0;
			end
			2'b10: begin
				comp_mantissa_ab = kogge_stone_adder((~full_mantissa_ab), 22'h1);
				comp_mantissa_c  = full_mantissa_c;
				if (exp_ab_greater) begin
					sign_ab_c = 1'b1;
				end
				else if (exp_ab_less) begin
					sign_ab_c = 1'b0;
				end
				else begin
					if (mantissa_ab[9:0] > c[9:0]) begin
						sign_ab_c = 1'b1;
					end
					else begin
						sign_ab_c = 1'b0;
					end
				end
			end
			2'b01: begin
				comp_mantissa_ab = full_mantissa_ab;
				comp_mantissa_c  = kogge_stone_adder((~full_mantissa_c), 22'h1);
				if (exp_ab_greater) begin
					sign_ab_c = 1'b0;
				end
				else if (exp_ab_less) begin
					sign_ab_c = 1'b1;
				end
				else begin
					if (mantissa_ab[9:0] > c[9:0]) begin
						sign_ab_c = 1'b0;
					end
					else begin
						sign_ab_c = 1'b1;
					end
				end
			end
			2'b11: begin
				comp_mantissa_ab = kogge_stone_adder((~full_mantissa_ab), 22'h1);
				comp_mantissa_c  = kogge_stone_adder((~full_mantissa_c), 22'h1);
				sign_ab_c        = 1'b1;
			end
			default: begin
				comp_mantissa_ab = full_mantissa_ab;
				comp_mantissa_c  = full_mantissa_c;
				sign_ab_c        = 1'b0;
			end
		endcase // case ({sign_ab, c[15]})

		sum_mantissa_ab_c = kogge_stone_adder(comp_mantissa_ab, comp_mantissa_c);

		if (sum_mantissa_ab_c[21]) begin
			sum_mantissa_ab_c = kogge_stone_adder((~sum_mantissa_ab_c), 22'h1);
		end     
	end

	fma_lza fma_lza_i
     (
      // Output
      .mantissa_shift (mantissa_shift),
      // Inputs
      .mantissa_ab    (comp_mantissa_ab),
      .mantissa_c     (comp_mantissa_c),
      .exp_ab_greater (exp_ab_greater),
      .exp_ab_less    (exp_ab_less),
      .sign_ab        (sign_ab),
      .sign_c         (c[15]));
   
   function automatic [21:0] kogge_stone_adder;
		input [21:0]      a,b;
		reg   [4:0][21:0] gp;
		reg   [3:0][21:0] pp;
		reg   [21:0]      c, p, g;
		integer           i;
		
		begin
			// 22-bit Kogge-Stone Adder
			for (i=0; i<22; i=i+1) begin
				p[i] = a[i]^b[i];
				g[i] = a[i]&b[i];
			end

			pp[0][0] = p[0];
			gp[0][0] = g[0];
			for (i=1; i<22; i=i+1) begin
				pp[0][i] = p[i]&p[i-1];
				gp[0][i] = (p[i]&g[i-1])|g[i];
			end

			pp[1][0] = pp[0][0];
			pp[1][1] = pp[0][1];
			gp[1][0] = gp[0][0];
			gp[1][1] = gp[0][1];
			for (i=2; i<22; i=i+1) begin
				pp[1][i] = pp[0][i]&pp[0][i-2];
				gp[1][i] = (pp[0][i]&gp[0][i-2])|gp[0][i];
			end

			pp[2][0] = gp[1][0];
			pp[2][1] = gp[1][1];
			pp[2][2] = gp[1][2];
			pp[2][3] = gp[1][3];
			gp[2][0] = gp[1][0];
			gp[2][1] = gp[1][1];
			gp[2][2] = gp[1][2];
			gp[2][3] = gp[1][3];
			for (i=4; i<22; i=i+1) begin
				pp[2][i] = pp[1][i]&pp[1][i-4];
				gp[2][i] = (pp[1][i]&gp[1][i-4])|gp[1][i];
			end

			pp[3][0] = pp[2][0];
			pp[3][1] = pp[2][1];
			pp[3][2] = pp[2][2];
			pp[3][3] = pp[2][3];
			pp[3][4] = pp[2][4];
			pp[3][5] = pp[2][5];
			pp[3][6] = pp[2][6];
			pp[3][7] = pp[2][7];
			gp[3][0] = gp[2][0];
			gp[3][1] = gp[2][1];
			gp[3][2] = gp[2][2];
			gp[3][3] = gp[2][3];
			gp[3][4] = gp[2][4];
			gp[3][5] = gp[2][5];
			gp[3][6] = gp[2][6];
			gp[3][7] = gp[2][7];
			for (i=8; i<22; i=i+1) begin
				pp[3][i] = pp[2][i]&pp[2][i-8];
				gp[3][i] = (pp[2][i]&gp[2][i-8])|gp[2][i];
			end

			gp[4][0]  = gp[3][0];
			gp[4][1]  = gp[3][1];
			gp[4][2]  = gp[3][2];
			gp[4][3]  = gp[3][3];
			gp[4][4]  = gp[3][4];
			gp[4][5]  = gp[3][5];
			gp[4][6]  = gp[3][6];
			gp[4][7]  = gp[3][7];
			gp[4][8]  = gp[3][8];
			gp[4][9]  = gp[3][9];
			gp[4][10] = gp[3][10];
			gp[4][11] = gp[3][11];
			gp[4][12] = gp[3][12];
			gp[4][13] = gp[3][13];
			gp[4][14] = gp[3][14];
			gp[4][15] = gp[3][15];
			for (i=16; i<22; i=i+1) begin
				gp[4][i] = (pp[3][i]&gp[3][i-16])|gp[3][i];
			end

			kogge_stone_adder[0] = p[0];
			c[0]                 = gp[4][0];
			for (i=1; i<22; i=i+1) begin
				kogge_stone_adder[i] = p[i]^c[i-1];
				c[i]                 = gp[4][i];
			end
		end
   endfunction // kogge_stone_adder

endmodule // fma_aligner_adder
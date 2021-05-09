module fma_normalizer_rounder
  (
	   mantissa_ab_c_in,
	   exp_ab_c_in,
	   mantissa_shift,

	   mantissa_ab_c_out,
	   exp_ab_c_out
   );

	// Input port declarations
	input [21:0] mantissa_ab_c_in;
	input [4:0]  exp_ab_c_in;
	input [4:0]  mantissa_shift;

	// Output port declarations
	output [9:0] mantissa_ab_c_out;
	output [4:0] exp_ab_c_out;

	// Wire declarations
	wire [21:0] mantissa_ab_c_in;
	wire [4:0]  exp_ab_c_in;
	wire [4:0]  mantissa_shift;
	wire [9:0]  mantissa_ab_c_out;
	wire [4:0]  exp_ab_c_out;

	reg [21:0] mantissa_ab_c;
	reg [10:0] mantissa_ab_c_rnd;
	reg [4:0]  exp_ab_c;
	reg [4:0]  true_shift;
	reg        ones_found;
	integer    i;

	assign mantissa_ab_c_out = mantissa_ab_c_rnd[9:0];
	assign exp_ab_c_out      = exp_ab_c + mantissa_ab_c_rnd[10];
   
	always @(*) begin
		mantissa_ab_c = mantissa_ab_c_in;
		exp_ab_c      = exp_ab_c_in;

		true_shift = (~exp_ab_c_in) ? 5'b0 : mantissa_shift;
      
		if (mantissa_ab_c_in[21]) begin
			mantissa_ab_c = mantissa_ab_c_in >> 1'd1;
			exp_ab_c      = exp_ab_c_in + 1'd1;
		end
		else if (~mantissa_ab_c_in[21] & ~mantissa_ab_c_in[20]) begin
			mantissa_ab_c = mantissa_ab_c_in << true_shift;
			exp_ab_c      = exp_ab_c_in - true_shift;
		end
		else begin
			mantissa_ab_c = mantissa_ab_c_in;
			exp_ab_c      = exp_ab_c_in;
		end

		for (i=8; i>=0; i=i-1) begin
			ones_found = |mantissa_ab_c[i];
		end

		if (mantissa_ab_c[10] & mantissa_ab_c[9] & ~ones_found) begin
			mantissa_ab_c_rnd = kogge_stone_adder(mantissa_ab_c[19:10], 1'b1);
		end
		else if (mantissa_ab_c[9] & ones_found) begin
			mantissa_ab_c_rnd = kogge_stone_adder(mantissa_ab_c[19:10], 1'b1);
		end
		else begin
			mantissa_ab_c_rnd = {1'b0, mantissa_ab_c[19:10]};
		end
	end

	function automatic [10:0] kogge_stone_adder;
		input [9:0] a, b;
		reg [3:0][9:0] gp;
		reg [2:0][9:0] pp;
		reg [9:0]      c, p, g;
		integer        i;
		
		begin
			// 10-bit Kogge-Stone Adder
			for (i=0; i<10; i=i+1) begin
				p[i] = a[i]^b[i];
				g[i] = a[i]&b[i];
			end
      
			pp[0][0] = p[0];
			gp[0][0] = g[0];
			for (i=1; i<10; i=i+1) begin
				pp[0][i] = p[i]&p[i-1];
				gp[0][i] = (p[i]&g[i-1])|g[i];
			end

			pp[1][0] = pp[0][0];
			pp[1][1] = pp[0][1];
			gp[1][0] = gp[0][0];
			gp[1][1] = gp[0][1];
			for (i=2; i<10; i=i+1) begin
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
			for (i=4; i<10; i=i+1) begin
				pp[2][i] = pp[1][i]&pp[1][i-4];
				gp[2][i] = (pp[1][i]&gp[1][i-4])|gp[1][i];
			end

			gp[3][0] = gp[2][0];
			gp[3][1] = gp[2][1];
			gp[3][2] = gp[2][2];
			gp[3][3] = gp[2][3];
			gp[3][4] = gp[2][4];
			gp[3][5] = gp[2][5];
			gp[3][6] = gp[2][6];
			gp[3][7] = gp[2][7];
			for (i=8; i<10; i=i+1) begin
				gp[3][i] = (pp[2][i]&gp[2][i-8])|gp[2][i];
			end

			kogge_stone_adder[0] = p[0];
			c[0]                 = gp[3][0];
			for (i=1; i<10; i=i+1) begin
				kogge_stone_adder[i] = p[i]^c[i-1];
				c[i]                 = gp[3][i];
			end
			kogge_stone_adder[10] = c[9];
		end
	endfunction // kogge_stone_adder

endmodule // fma_normalizer_rounder
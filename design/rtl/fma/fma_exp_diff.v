module fma_exp_diff
  (
	   exp_a,
	   exp_b,
	   exp_c,
	   exp_diff_start,
	   fma_byp,

	   exp_diff,
	   exp_ab,
	   exp_ab_greater,
	   exp_ab_less,
	   exp_diff_done
   );

	// Input port declarations
	input [4:0] exp_a;
	input [4:0] exp_b;
	input [4:0] exp_c;
	input       exp_diff_start;
	input       fma_byp;

	// Output port declarations
	output reg [4:0] exp_diff;
	output reg [4:0] exp_ab;
	output reg       exp_ab_greater;
	output reg       exp_ab_less;
	output reg       exp_diff_done;

	reg [4:0] x;
	reg [5:0] sum_exp_ab;
	integer   i;

	always @(*) begin
	    if (~fma_byp) begin
			sum_exp_ab = kogge_stone_adder(exp_a, exp_b);
			exp_ab     = (sum_exp_ab > 'd30) ? 5'b11111 : sum_exp_ab[4:0];

			for (i=0; i<5; i=i+1) begin
				x[i] = (exp_ab[i] & exp_c[i]) | (~exp_ab[i] & ~exp_c[i]);
			end

			exp_ab_greater = exp_ab[4]&~exp_c[4] | x[4]&exp_ab[3]&~exp_c[3] | x[4]&x[3]&exp_ab[2]&~exp_c[2] | x[4]&x[3]&x[2]&exp_ab[1]&~exp_c[1] | x[4]&x[3]&x[2]&x[1]&exp_ab[0]&~exp_c[0];
			exp_ab_less    = ~exp_ab[4]&exp_c[4] | x[4]&~exp_ab[3]&exp_c[3] | x[4]&x[3]&~exp_ab[2]&exp_c[2] | x[4]&x[3]&x[2]&~exp_ab[1]&exp_c[1] | x[4]&x[3]&x[2]&x[1]&~exp_ab[0]&exp_c[0];

			if (exp_ab_greater) begin
				exp_diff = kogge_stone_adder(exp_ab, (~exp_c+1));
			end
			else if (exp_ab_less) begin
				exp_diff = kogge_stone_adder(exp_c, (~exp_ab+1));
			end
			else begin
				exp_diff = 5'b0;
			end
			exp_diff_done = (exp_diff_start) ? 1'b1 : 1'b0;
	    end
		else begin
		    exp_diff = 4'b0;
			exp_ab   = 4'b0;
			exp_ab_greater = 1'b0;
			exp_ab_less    = 1'b0;
			exp_diff_done = (exp_diff_start) ? 1'b1 : 1'b0;
		end
	end

   function automatic reg [5:0] kogge_stone_adder;
		input [4:0]     a, b;
	 	reg [4:0][21:0] gp;
		reg [3:0][21:0] pp;
		reg [21:0]      c, p, g;
		integer         i;
			
		begin
			for (i=0; i<5; i=i+1) begin
				p[i] = a[i]^b[i];
				g[i] = a[i]&b[i];
			end

			pp[0][0] = p[0];
			gp[0][0] = g[0];
			for (i=1; i<5; i=i+1) begin
				pp[0][i] = p[i]&p[i-1];
				gp[0][i] = (p[i]&g[i-1])|g[i];
			end

			pp[1][0] = pp[0][0];
			pp[1][1] = pp[0][1];
			gp[1][0] = gp[0][0];
			gp[1][1] = gp[0][1];
			for (i=2; i<5; i=i+1) begin
			   pp[1][i] = pp[0][i]&pp[0][i-2];
			   gp[1][i] = (pp[0][i]&gp[0][i-2])|gp[0][i];
			end

			gp[2][0] = gp[1][0];
			gp[2][1] = gp[1][1];
			gp[2][2] = gp[1][2];
			gp[2][3] = gp[1][3];
			gp[2][4] = (pp[1][4]&gp[1][0])|gp[1][4]; 

			kogge_stone_adder[0] = p[0];
			c[0]                 = gp[2][0];
			for (i=1; i<5; i=i+1) begin
				kogge_stone_adder[i] = p[i]^c[i-1];
				c[i]                 = gp[2][i];
			end
			kogge_stone_adder[5] = c[4];
		end
   endfunction // kogge_stone_adder

endmodule // fma_exp_diff
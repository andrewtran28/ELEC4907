`ifndef __FMA_EXP_DIFF_SV__
 `define __FMA_EXP_DIFF_SV__

module fma_exp_diff
  (
   input logic [4:0] exp_a,
   input logic [4:0] exp_b,
   input logic [4:0] exp_c,

   output logic [4:0] exp_diff,
   output logic [4:0] exp_ab,
   output logic       exp_ab_greater,
   output logic       exp_ab_less
   );

   logic [4:0] x;
   logic [5:0] sum_exp_ab;

   always_comb begin
      sum_exp_ab = kogge_stone_adder(.a(exp_a), .b(exp_b));
      exp_ab     = (sum_exp_ab > 'd30) ? 5'b11111 : sum_exp_ab[4:0];

      for (int i=0; i<5; i++) begin
	 x[i] = (exp_ab[i] & exp_c[i]) | (~exp_ab[i] & ~exp_c[i]);
      end

      exp_ab_greater = exp_ab[4]&~exp_c[4] | x[4]&exp_ab[3]&~exp_c[3] | x[4]&x[3]&exp_ab[2]&~exp_c[2] | x[4]&x[3]&x[2]&exp_ab[1]&~exp_c[1] | x[4]&x[3]&x[2]&x[1]&exp_ab[0]&~exp_c[0];
      exp_ab_less    = ~exp_ab[4]&exp_c[4] | x[4]&~exp_ab[3]&exp_c[3] | x[4]&x[3]&~exp_ab[2]&exp_c[2] | x[4]&x[3]&x[2]&~exp_ab[1]&exp_c[1] | x[4]&x[3]&x[2]&x[1]&~exp_ab[0]&exp_c[0];

      if (exp_ab_greater) begin
	 exp_diff = kogge_stone_adder(.a(exp_ab), .b(~exp_c+1));
      end
      else if (exp_ab_less) begin
	 exp_diff = kogge_stone_adder(.a(exp_c), .b(~exp_ab+1));
      end
      else begin
	 exp_diff = '0;
      end
   end // always_comb

   function automatic logic [5:0] kogge_stone_adder
     (
      logic [4:0] a,
      logic [4:0] b
      );

      logic [2:0][4:0] gp;
      logic [1:0][4:0] pp;
      logic [4:0]      c, p, g;

      for (int i=0; i<5; i++) begin
	 p[i] = a[i]^b[i];
	 g[i] = a[i]&b[i];
      end

      pp[0][0] = p[0];
      gp[0][0] = g[0];
      for (int i=1; i<5; i++) begin
	 pp[0][i] = p[i]&p[i-1];
	 gp[0][i] = (p[i]&g[i-1])|g[i];
      end

      pp[1][0] = pp[0][0];
      pp[1][1] = pp[0][1];
      gp[1][0] = gp[0][0];
      gp[1][1] = gp[0][1];
      for (int i=2; i<5; i++) begin
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
      for (int i=1; i<5; i++) begin
	 kogge_stone_adder[i] = p[i]^c[i-1];
	 c[i]                 = gp[2][i];
      end
      kogge_stone_adder[5] = c[4];
   endfunction // kogge_stone_adder

endmodule // fma_exp_diff

`endif //  `ifndef __FMA_EXP_DIFF_SV__
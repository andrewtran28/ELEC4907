module fma_normalizer_rounder
  (
   input logic [21:0] mantissa_ab_c_in,
   input logic [4:0]  exp_ab_c_in,
   input logic [4:0]  mantissa_shift,

   output logic [9:0] mantissa_ab_c_out,
   output logic [4:0] exp_ab_c_out
   );

   logic [21:0]       mantissa_ab_c;
   logic [10:0]       mantissa_ab_c_rnd;
   logic [4:0] 	      exp_ab_c;
   logic [4:0] 	      true_shift;
   logic              ones_found;

   assign mantissa_ab_c_out = mantissa_ab_c_rnd[9:0];
   assign exp_ab_c_out      = exp_ab_c + mantissa_ab_c_rnd[10];
   
   always_comb begin
      mantissa_ab_c = mantissa_ab_c_in;
      exp_ab_c      = exp_ab_c_in;

      true_shift = (~exp_ab_c_in) ? '0 : mantissa_shift;
      
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

      for (int i=8; i>=0; i--) begin
	 ones_found = |mantissa_ab_c[i];
      end

      if (mantissa_ab_c[10] & mantissa_ab_c[9] & ~ones_found) begin
	 mantissa_ab_c_rnd = kogge_stone_adder(.a(mantissa_ab_c[19:10]), .b(1'b1));
      end
      else if (mantissa_ab_c[9] & ones_found) begin
	 mantissa_ab_c_rnd = kogge_stone_adder(.a(mantissa_ab_c[19:10]), .b(1'b1));
      end
      else begin
	 mantissa_ab_c_rnd = {1'b0, mantissa_ab_c[19:10]};
      end
   end // always_comb

   function automatic logic [10:0] kogge_stone_adder
     (
      logic [9:0] a,
      logic [9:0] b
      );

      logic [3:0][9:0] gp;
      logic [2:0][9:0] pp;
      logic [9:0]      c, p, g;

      // 10-bit Kogge-Stone Adder
      for (int i=0; i<10; i++) begin
         p[i] = a[i]^b[i];
         g[i] = a[i]&b[i];
      end
      
      pp[0][0] = p[0];
      gp[0][0] = g[0];
      for (int i=1; i<10; i++) begin
         pp[0][i] = p[i]&p[i-1];
         gp[0][i] = (p[i]&g[i-1])|g[i];
      end

      pp[1][0] = pp[0][0];
      pp[1][1] = pp[0][1];
      gp[1][0] = gp[0][0];
      gp[1][1] = gp[0][1];
      for (int i=2; i<10; i++) begin
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
      for (int i=4; i<10; i++) begin
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
      for (int i=8; i<10; i++) begin
         gp[3][i] = (pp[2][i]&gp[2][i-8])|gp[2][i];
      end

      kogge_stone_adder[0] = p[0];
      c[0]                 = gp[3][0];
      for (int i=1; i<10; i++) begin
         kogge_stone_adder[i] = p[i]^c[i-1];
         c[i]                 = gp[3][i];
      end
      kogge_stone_adder[10] = c[9];
   endfunction // kogge_stone_adder

endmodule // fma_normalizer_rounder
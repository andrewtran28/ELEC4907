module fma_top
  (
   input logic [15:0] a, // Multiplicand
   input logic [15:0] b, // Multiplier
   input logic [15:0] c, // Value to be added

   output logic [15:0] result
   );

   logic [4:0] 	 exp_diff;
   logic [4:0] 	 exp_ab;
   logic         exp_ab_greater;
   logic         exp_ab_less;

   logic [19:0]  mantissa_ab;
   logic         sign_ab;

   logic [21:0]  mantissa_ab_c;
   logic [4:0] 	 exp_ab_c;

   logic [4:0] 	 exp_ab_c_out;
   logic [4:0] 	 mantissa_shift;

   fma_exp_diff fma_exp_diff_i
     (
      // Outputs
      .exp_diff       (exp_diff),
      .exp_ab         (exp_ab),
      .exp_ab_greater (exp_ab_greater),
      .exp_ab_less    (exp_ab_less),
      // Inputs
      .exp_a (a[14:10]),
      .exp_b (b[14:10]),
      .exp_c (c[14:10]));

   fma_mult_tree fma_mult_tree_i
     (
      // Outputs
      .mantissa_ab (mantissa_ab),
      .sign_ab     (sign_ab),
      // Inputs
      .mantissa_a  (a[9:0]),
      .mantissa_b  (b[9:0]),
      .sign_a      (a[15]),
      .sign_b      (b[15]));

   fma_aligner_adder fma_aligner_adder_i
     (
      // Outputs
      .mantissa_ab_c  (mantissa_ab_c),
      .exp_ab_c       (exp_ab_c),
      .sign_ab_c      (result[15]),
      .mantissa_shift (mantissa_shift),
      // Inputs
      .mantissa_ab    (mantissa_ab),
      .exp_ab         (exp_ab),
      .sign_ab        (sign_ab),
      .c              (c),
      .exp_diff       (exp_diff),
      .exp_ab_greater (exp_ab_greater),
      .exp_ab_less    (exp_ab_less));

   fma_normalizer_rounder fma_normalizer_rounder_i
     (
      // Outputs
      .mantissa_ab_c_out (result[9:0]),
      .exp_ab_c_out      (exp_ab_c_out),
      // Inputs
      .mantissa_ab_c_in  (mantissa_ab_c),
      .exp_ab_c_in       (exp_ab_c),
      .mantissa_shift    (mantissa_shift));

   assign result[14:10] = ((exp_ab == 5'b11111) || (c[14:10] == 5'b11111)) ? 5'b11111 : exp_ab_c_out;

endmodule // fma_top
module fma_top
   (
    a, // Multiplicand
    b, // Multiplier
    c, // Value to be added
    fma_en,
	clk,
	rst,
	
    z,
	fma_vld
    );

    // Input port declarations
    input [15:0] a;
    input [15:0] b;
    input [15:0] c;
	input        fma_en;
	input        clk;
	input        rst;

    // Output port declaration
    output [15:0] z;
	output        fma_vld;

    // Wire declarations
    wire [15:0] a;
    wire [15:0] b;
    wire [15:0] c;
    wire [15:0] result;
	
	// Flopped inputs
	reg  [15:0] a_ff;
	reg  [15:0] b_ff;
	reg  [15:0] c_ff;
	reg         fma_en_ff;
	
	wire        exp_diff_done;
	wire        mult_done;
	wire        adder_done;
	wire        rounder_done;
	
	wire        fma_byp;
	wire        add_byp;
	wire        a_equals_one;
	wire        b_equals_one;

    wire [4:0]  exp_diff;
    wire [4:0]  exp_ab;
	wire [4:0]  exp_ab_corr;
    wire        exp_ab_greater;
    wire        exp_ab_less;

    wire [19:0] mantissa_ab;
    wire        sign_ab;

    wire [21:0] mantissa_ab_c;
    wire [4:0]  exp_ab_c;

    wire [4:0]  exp_ab_c_out;
    wire [4:0]  mantissa_shift;
	
	assign fma_byp = ((~|a_ff) || (~|b_ff)) ? 1'b1 : 1'b0;
	assign add_byp = (~|c_ff[14:0]) ? 1'b1 : 1'b0;
	assign a_equals_one = ~a_ff[14]&a_ff[13]&a_ff[12]&a_ff[11]&a_ff[10]&(~|a_ff[9:0]);
	assign b_equals_one = ~b_ff[14]&b_ff[13]&b_ff[12]&b_ff[11]&b_ff[10]&(~|b_ff[9:0]);
	
	always @(posedge clk) begin
		if (rst) begin
			a_ff      <= 16'b0;
			b_ff      <= 16'b0;
			c_ff      <= 16'b0;
			fma_en_ff <= 1'b0;
	    end else begin
			a_ff      <= a;
			b_ff      <= b;
			c_ff      <= c;
			fma_en_ff <= fma_en;
		end
	end

    fma_exp_diff fma_exp_diff_i
      (
       // Outputs
       .exp_diff       (exp_diff),
       .exp_ab         (exp_ab),
       .exp_ab_greater (exp_ab_greater),
       .exp_ab_less    (exp_ab_less),
	   .exp_diff_done  (exp_diff_done),
       // Inputs
       .exp_a          (a_ff[14:10]),
       .exp_b          (b_ff[14:10]),
       .exp_c          (c_ff[14:10]),
	   .exp_diff_start (fma_en_ff),
	   .fma_byp        (fma_byp));

    fma_mult_tree fma_mult_tree_i
      (
       // Outputs
       .mantissa_ab  (mantissa_ab),
       .sign_ab      (sign_ab),
	   .mult_done    (mult_done),
       // Inputs
       .mantissa_a   (a_ff[9:0]),
       .mantissa_b   (b_ff[9:0]),
       .sign_a       (a_ff[15]),
       .sign_b       (b_ff[15]),
	   .mult_start   (fma_en_ff),
	   .fma_byp      (fma_byp),
	   .a_equals_one (a_equals_one),
	   .b_equals_one (b_equals_one));
	  
	//assign exp_ab_corr = ((a[14:10] == 5'b0) || (b[14:10] == 5'b0)) ? 5'b0 : exp_ab;

    fma_aligner_adder fma_aligner_adder_i
      (
       // Outputs
       .mantissa_ab_c  (mantissa_ab_c),
       .exp_ab_c       (exp_ab_c),
       .sign_ab_c      (result[15]),
       .mantissa_shift (mantissa_shift),
	   .adder_done     (adder_done),
       // Inputs
       .mantissa_ab    (mantissa_ab),
       .exp_ab         (exp_ab),
       .sign_ab        (sign_ab),
       .c              (c_ff),
       .exp_diff       (exp_diff),
       .exp_ab_greater (exp_ab_greater),
       .exp_ab_less    (exp_ab_less),
	   .adder_start    (exp_diff_done & mult_done),
	   .fma_byp        (fma_byp),
	   .add_byp        (add_byp));

    fma_normalizer_rounder fma_normalizer_rounder_i
      (
       // Outputs
       .mantissa_ab_c_out (result[9:0]),
       .exp_ab_c_out      (exp_ab_c_out),
	   .rounder_done      (rounder_done),
       // Inputs
       .mantissa_ab_c_in  (mantissa_ab_c),
       .exp_ab_c_in       (exp_ab_c),
       .mantissa_shift    (mantissa_shift),
	   .rounder_start     (adder_done),
	   .fma_byp           (fma_byp));

	assign result[14:10] = ((exp_ab == 5'b11111) || (c_ff[14:10] == 5'b11111)) ? 5'b11111 : exp_ab_c_out;
	
	assign z = (|result[14:0] && ~result[15]) ? result : 16'b0; // Re-LU activation function
	
	assign fma_vld = (rounder_done) ? 1'b1 : 1'b0;

endmodule // fma_top
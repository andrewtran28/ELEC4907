// Verilog test bench for fma_top.v

module fma_top_tb();
	reg         clk, reset;
	reg  [15:0] a, b, c, expected;
	wire [15:0] result;
	reg  [3:0]  vectornum, errors;
	reg  [63:0] testvectors[0:15];

	// Instantiate device under test
	fma_top dut(.a(a), .b(b), .c(c), .result(result));

	// Generate clock
	always begin
		clk = 1; 
		#5; 
		clk = 0; 
		#5;
	end

	// At start of test, dump file, load vectors, and pulse reset
	initial begin
		$dumpfile("fma_top.vcd");
        $dumpvars(0, fma_top_tb);
		$readmemb("fma_top.tv", testvectors);
		vectornum = 0; 
		errors = 0;
		reset = 1; 
		#10; 
		reset = 0;
	end

	// Apply test vectors at rising edge of clock
	always @(posedge clk) begin
		#1; 
		{a, b, c, expected} = testvectors[vectornum];
	end

	// Check results at falling edge of clock
	always @ (negedge clk)
		if (~reset) begin
			if (result !== expected) begin
				$display ("Error: Inputs = %h,", {a, b, c});
				$display (" Output = %h (%h expected)", result, expected);
				errors = errors + 1;
			end
			vectornum = vectornum + 1;
			if (testvectors[vectornum] === 64'bx) begin
				$display ("%d tests completed with %d errors.", vectornum, errors);
				$finish;
			end
		end
endmodule 
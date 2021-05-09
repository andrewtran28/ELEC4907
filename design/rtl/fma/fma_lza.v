module fma_lza
  (
   mantissa_ab,
   mantissa_c,
   exp_ab_greater,
   exp_ab_less,
   sign_ab,
   sign_c,
   fma_byp,
   adder_start,

   mantissa_shift,
   lza_done
   );

   // Input port declarations
   input [21:0] mantissa_ab;
   input [21:0] mantissa_c;
   input        exp_ab_greater;
   input        exp_ab_less;
   input        sign_ab;
   input        sign_c;
   input        fma_byp;
   input        adder_start;

   // Output port declaration
   output reg [4:0] mantissa_shift;
   output reg       lza_done;

   reg [4:0] count;
   reg [1:0] ad;
   reg 	     stop, leave;
   reg       p_found;
   reg       z_found, z_next;
   reg       g_found, g_next;
   integer   i;
   
	always @(*) begin
	    mantissa_shift = 5'b0;
		count          = 5'b0;
		ad             = 2'b0;
		stop           = 1'b0;
		leave          = 1'b0;
		p_found        = 1'b0;
		z_found        = 1'b0;
		z_next         = 1'b0;
		g_found        = 1'b0;
		g_next         = 1'b0;
      
		case({sign_ab, sign_c, fma_byp})
			2'b000: begin
				for (i=21; i>=0; i=i-1) begin
					if (~(mantissa_ab[i] | mantissa_c[i]) & ~stop) begin
						count = count + 'd1;
					end
					else if (~stop) begin
						ad   = mantissa_ab[i] + mantissa_c[i];
						stop = 1'b1;
					end
				end
				mantissa_shift = count - ad[1] - 1'd1;
			end
			2'b110: begin
				for (i=21; i>=0; i=i-1) begin
					if (mantissa_ab[i] & mantissa_c[i] & ~stop) begin
						count = count + 'd1;
					end
					else if (~stop) begin
						ad = mantissa_ab[i] + mantissa_c[i];
						stop = 1'b1;
					end
				end
				mantissa_shift = count - ad[1] - 1'd1;
			end
			2'b100: begin
				if (exp_ab_greater) begin
					for (i=21; i>=0; i=i-1) begin
						if ((mantissa_ab[i] ^ mantissa_c[i]) & ~stop) begin
							count   = count + 'd1;
							p_found = 1'b1;
							z_next  = 1'b1;
						end
						else if (~(mantissa_ab[i] | mantissa_c[i]) & p_found & z_next & ~stop) begin
							count   = count + 'd1;
							z_found = 1'b1;
							g_next  = 1'b1;
						end
						else if ((mantissa_ab[i] & mantissa_c[i]) & p_found & z_found & g_next & ~stop) begin
							count   = count + 'd1;
							g_found = 1'b1;
							stop    = 1'b1;
						end
						else if (~leave & stop) begin
							ad    = mantissa_ab[i] + mantissa_c[i];
							leave = 1'b1;
						end
					end
					mantissa_shift = count - ad[1] - 1'd1;
				end // if (exp_ab_greater)
				else if (exp_ab_less) begin
					for (i=21; i>=0; i=i-1) begin
						if ((mantissa_ab[i] ^ mantissa_c[i]) & ~stop) begin
							count   = count + 'd1;
							p_found = 1'b1;
							g_next  = 1'b1;
						end
						else if (~(mantissa_ab[i] | mantissa_c[i]) & p_found & g_next & ~stop) begin
							count   = count + 'd1;
							g_found = 1'b1;
							z_next  = 1'b1;
						end
						else if ((mantissa_ab[i] & mantissa_c[i]) & p_found & g_found & z_next & ~stop) begin
							count   = count + 'd1;
							z_found = 1'b1;
							stop    = 1'b1;
						end
						else if (~leave & stop) begin
							ad    = mantissa_ab[i] + mantissa_c[i];
							leave = 1'b1;
						end
					end
					mantissa_shift = count - ad[1] - 1'd1;
				end // if (exp_ab_less)
				else if (mantissa_ab[19:0] > mantissa_c[19:0]) begin
					for (i=21; i>=0; i=i-1) begin
						if ((mantissa_ab[i] ^ mantissa_c[i]) & ~stop) begin
							count   = count + 'd1;
							p_found = 1'b1;
							z_next  = 1'b1;
						end
						else if (~(mantissa_ab[i] | mantissa_c[i]) & p_found & z_next & ~stop) begin
							count   = count + 'd1;
							z_found = 1'b1;
							g_next  = 1'b1;
						end
						else if ((mantissa_ab[i] & mantissa_c[i]) & p_found & z_found & g_next & ~stop) begin
							count   = count + 'd1;
							g_found = 1'b1;
							stop    = 1'b1;
						end
						else if (~leave & stop) begin
							ad    = mantissa_ab[i] + mantissa_c[i];
							leave = 1'b1;
						end
					end
					mantissa_shift = count - ad[1] - 1'd1;
				end // if (mantissa_ab[19:0] > mantissa_c[19:0])
				else if (mantissa_ab[19:0] < mantissa_c[19:0]) begin
					for (i=21; i>=0; i=i-1) begin
						if ((mantissa_ab[i] ^ mantissa_c[i]) & ~stop) begin
							count   = count + 'd1;
							p_found = 1'b1;
							g_next  = 1'b1;
						end
						else if (~(mantissa_ab[i] | mantissa_c[i]) & p_found & g_next & ~stop) begin
							count   = count + 'd1;
							g_found = 1'b1;
							z_next  = 1'b1;
						end
						else if ((mantissa_ab[i] & mantissa_c[i]) & p_found & g_found & z_next & ~stop) begin
							count   = count + 'd1;
							z_found = 1'b1;
							stop    = 1'b1;
						end
						else if (~leave & stop) begin
							ad    = mantissa_ab[i] + mantissa_c[i];
							leave = 1'b1;
						end
					end
					mantissa_shift = count - ad[1] - 1'd1;
				end // if (mantissa_ab[19:0] < mantissa_c[19:0])
				else begin
					mantissa_shift = 5'b0;
				end // else: !if(mantissa_ab[19:0] < mantissa_c[19:0])
			end
			2'b010: begin
				if (exp_ab_greater) begin
					for (i=21; i>=0; i=i-1) begin
						if ((mantissa_ab[i] ^ mantissa_c[i]) & ~stop) begin
							count   = count + 'd1;
							p_found = 1'b1;
							g_next  = 1'b1;
						end
						else if (~(mantissa_ab[i] | mantissa_c[i]) & p_found & g_next & ~stop) begin
							count   = count + 'd1;
							g_found = 1'b1;
							z_next  = 1'b1;
						end
						else if ((mantissa_ab[i] & mantissa_c[i]) & p_found & g_found & z_next & ~stop) begin
							count   = count + 'd1;
							z_found = 1'b1;
							stop    = 1'b1;
						end
						else if (~leave & stop) begin
							ad    = mantissa_ab[i] + mantissa_c[i];
							leave = 1'b1;
						end
					end
					mantissa_shift = count - ad[1] - 1'd1;
				end // if (exp_ab_greater)
				else if (exp_ab_less) begin
					for (i=21; i>=0; i=i-1) begin
						if ((mantissa_ab[i] ^ mantissa_c[i]) & ~stop) begin
							count   = count + 'd1;
							p_found = 1'b1;
							z_next  = 1'b1;
						end
						else if (~(mantissa_ab[i] | mantissa_c[i]) & p_found & g_next & ~stop) begin
							count   = count + 'd1;
							g_found = 1'b1;
							z_next  = 1'b1;
						end
						else if ((mantissa_ab[i] & mantissa_c[i]) & p_found & g_found & z_next & ~stop) begin
							count   = count + 'd1;
							z_found = 1'b1;
							stop    = 1'b1;
						end
						else if (~leave & stop) begin
							ad    = mantissa_ab[i] + mantissa_c[i];
							leave = 1'b1;
						end
					end
					mantissa_shift = count - ad[1] - 1'd1;
				end // if (exp_ab_less)
				else if (mantissa_ab[19:0] > mantissa_c[19:0]) begin
					for (i=21; i>=0; i=i-1) begin
						if ((mantissa_ab[i] ^ mantissa_c[i]) & ~stop) begin
							count   = count + 'd1;
							p_found = 1'b1;
							z_next  = 1'b1;
						end
						else if (~(mantissa_ab[i] | mantissa_c[i]) & p_found & z_next & ~stop) begin
							count   = count + 'd1;
							z_found = 1'b1;
							g_next  = 1'b1;
						end
						else if ((mantissa_ab[i] & mantissa_c[i]) & p_found & z_found & g_next & ~stop) begin
							count   = count + 'd1;
							g_found = 1'b1;
							stop    = 1'b1;
						end
						else if (~leave & stop) begin
							ad    = mantissa_ab[i] + mantissa_c[i];
							leave = 1'b1;
						end
					end
					mantissa_shift = count - ad[1] - 1'd1;
				end // if (mantissa_ab[19:0] > mantissa_c[19:0])
				else if (mantissa_ab[19:0] < mantissa_c[19:0]) begin
					for (i=21; i>=0; i=i-1) begin
						if ((mantissa_ab[i] ^ mantissa_c[i]) & ~stop) begin
							count   = count + 'd1;
							p_found = 1'b1;
							z_next  = 1'b1;
						end
						else if (~(mantissa_ab[i] | mantissa_c[i]) & p_found & g_next & ~stop) begin
							count   = count + 'd1;
							g_found = 1'b1;
							z_next  = 1'b1;
						end
						else if ((mantissa_ab[i] & mantissa_c[i]) & p_found & g_found & z_next & ~stop) begin
							count   = count + 'd1;
							z_found = 1'b1;
							stop    = 1'b1;
						end
						else if (~leave & stop) begin
							ad    = mantissa_ab[i] + mantissa_c[i];
							leave = 1'b1;
						end
					end
					mantissa_shift = count - ad[1] - 1'd1;
				end // if (mantissa_ab[19:0] < mantissa_c[19:0])
				else begin
					mantissa_shift = 5'b0;
				end // else: !if(mantissa_ab[19:0] < mantissa_c[19:0])
			end
			default: begin
				mantissa_shift = 5'b0;
			end
		endcase // case ({sign_ab, sign_c})
        lza_done = (adder_start) ? 1'b1 : 1'b0;
   end

endmodule // fma_lza
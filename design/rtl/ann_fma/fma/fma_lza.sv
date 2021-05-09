module fma_lza
  (
   input logic [21:0] mantissa_ab,
   input logic [21:0] mantissa_c,
   input logic        exp_ab_greater,
   input logic        exp_ab_less,
   input logic        sign_ab,
   input logic        sign_c,

   output logic [4:0] mantissa_shift
   );

   logic [4:0] 	      count;
   logic [1:0] 	      ad;
   logic 	      stop;
   logic              p_found;
   logic              z_found, z_next;
   logic              g_found, g_next;
   
   always_comb begin
      count   = '0;
      ad      = '0;
      stop    = 1'b0;
      p_found = 1'b0;
      z_found = 1'b0;
      z_next  = 1'b0;
      g_found = 1'b0;
      g_next  = 1'b0;
      
      case({sign_ab, sign_c})
	{1'b0, 1'b0}: begin
	   for (int i=21; i>=0; i--) begin
	      if (~(mantissa_ab[i] | mantissa_c[i])) begin
		 count = count + 'd1;
	      end
	      else begin
		 ad = mantissa_ab[i] + mantissa_c[i];
		 break;
	      end
	   end
	   mantissa_shift = count - ad[1] - 1'd1;
	end // case: {1'b0, 1'b0}
	{1'b1, 1'b1}: begin
	   for (int i=21; i>=0; i--) begin
	      if (mantissa_ab[i] & mantissa_c[i]) begin
		 count = count + 'd1;
	      end
	      else begin
		 ad = mantissa_ab[i] + mantissa_c[i];
		 break;
	      end
	   end
	   mantissa_shift = count - ad[1] - 1'd1;
	end // case: {1'b1, 1'b1}
	{1'b1, 1'b0}: begin
	   if (exp_ab_greater) begin
	      for (int i=21; i>=0; i--) begin
		 if ((mantissa_ab[i] ^ mantissa_c[i]) & ~stop) begin
		    count   = count + 'd1;
		    p_found = 1'b1;
		    z_next  = 1'b1;
		 end
		 else if (~(mantissa_ab[i] | mantissa_c[i]) & p_found & z_next) begin
		    count   = count + 'd1;
		    z_found = 1'b1;
		    g_next  = 1'b1;
		 end
		 else if ((mantissa_ab[i] & mantissa_c[i]) & p_found & z_found & g_next) begin
		    count   = count + 'd1;
		    g_found = 1'b1;
		    stop    = 1'b1;
		 end
		 else begin
		    ad = mantissa_ab[i] + mantissa_c[i];
		    break;
		 end
	      end
	      mantissa_shift = count - ad[1] - 1'd1;
	   end // if (exp_ab_greater)
	   else if (exp_ab_less) begin
	      for (int i=21; i>=0; i--) begin
		 if ((mantissa_ab[i] ^ mantissa_c[i]) & ~stop) begin
		    count   = count + 'd1;
		    p_found = 1'b1;
		    g_next  = 1'b1;
		 end
		 else if (~(mantissa_ab[i] | mantissa_c[i]) & p_found & g_next) begin
		    count   = count + 'd1;
		    g_found = 1'b1;
		    z_next  = 1'b1;
		 end
		 else if ((mantissa_ab[i] & mantissa_c[i]) & p_found & g_found & z_next) begin
		    count   = count + 'd1;
		    z_found = 1'b1;
		    stop    = 1'b1;
		 end
		 else begin
		    ad = mantissa_ab[i] + mantissa_c[i];
		    break;
		 end
	      end
	      mantissa_shift = count - ad[1] - 1'd1;
	   end // if (exp_ab_less)
	   else if (mantissa_ab[19:0] > mantissa_c[19:0]) begin
	      for (int i=21; i>=0; i--) begin
		 if ((mantissa_ab[i] ^ mantissa_c[i]) & ~stop) begin
		    count   = count + 'd1;
		    p_found = 1'b1;
		    z_next  = 1'b1;
		 end
		 else if (~(mantissa_ab[i] | mantissa_c[i]) & p_found & z_next) begin
		    count   = count + 'd1;
		    z_found = 1'b1;
		    g_next  = 1'b1;
		 end
		 else if ((mantissa_ab[i] & mantissa_c[i]) & p_found & z_found & g_next) begin
		    count   = count + 'd1;
		    g_found = 1'b1;
		    stop    = 1'b1;
		 end
		 else begin
		    ad = mantissa_ab[i] + mantissa_c[i];
		    break;
		 end
	      end
	      mantissa_shift = count - ad[1] - 1'd1;
	   end // if (mantissa_ab[19:0] > mantissa_c[19:0])
	   else if (mantissa_ab[19:0] < mantissa_c[19:0]) begin
	      for (int i=21; i>=0; i--) begin
		 if ((mantissa_ab[i] ^ mantissa_c[i]) & ~stop) begin
		    count   = count + 'd1;
		    p_found = 1'b1;
		    g_next  = 1'b1;
		 end
		 else if (~(mantissa_ab[i] | mantissa_c[i]) & p_found & g_next) begin
		    count   = count + 'd1;
		    g_found = 1'b1;
		    z_next  = 1'b1;
		 end
		 else if ((mantissa_ab[i] & mantissa_c[i]) & p_found & g_found & z_next) begin
		    count   = count + 'd1;
		    z_found = 1'b1;
		    stop    = 1'b1;
		 end
		 else begin
		    ad = mantissa_ab[i] + mantissa_c[i];
		    break;
		 end
	      end
	      mantissa_shift = count - ad[1] - 1'd1;
	   end // if (mantissa_ab[19:0] < mantissa_c[19:0])
	   else begin
	      mantissa_shift = '0;
	   end // else: !if(mantissa_ab[19:0] < mantissa_c[19:0])
	end // case: {1'b1, 1'b0}
	{1'b0, 1'b1}: begin
	   if (exp_ab_greater) begin
	      for (int i=21; i>=0; i--) begin
		 if ((mantissa_ab[i] ^ mantissa_c[i]) & ~stop) begin
		    count   = count + 'd1;
		    p_found = 1'b1;
		    g_next  = 1'b1;
		 end
		 else if (~(mantissa_ab[i] | mantissa_c[i]) & p_found & g_next) begin
		    count   = count + 'd1;
		    g_found = 1'b1;
		    z_next  = 1'b1;
		 end
		 else if ((mantissa_ab[i] & mantissa_c[i]) & p_found & g_found & z_next) begin
		    count   = count + 'd1;
		    z_found = 1'b1;
		    stop    = 1'b1;
		 end
		 else begin
		    ad = mantissa_ab[i] + mantissa_c[i];
		    break;
		 end
	      end
	      mantissa_shift = count - ad[1] - 1'd1;
	   end // if (exp_ab_greater)
	   else if (exp_ab_less) begin
	      for (int i=21; i>=0; i--) begin
		 if ((mantissa_ab[i] ^ mantissa_c[i]) & ~stop) begin
		    count   = count + 'd1;
		    p_found = 1'b1;
		    z_next  = 1'b1;
		 end
		 else if (~(mantissa_ab[i] | mantissa_c[i]) & p_found & g_next) begin
		    count   = count + 'd1;
		    g_found = 1'b1;
		    z_next  = 1'b1;
		 end
		 else if ((mantissa_ab[i] & mantissa_c[i]) & p_found & g_found & z_next) begin
		    count   = count + 'd1;
		    z_found = 1'b1;
		    stop    = 1'b1;
		 end
		 else begin
		    ad = mantissa_ab[i] + mantissa_c[i];
		    break;
		 end
	      end
	      mantissa_shift = count - ad[1] - 1'd1;
	   end // if (exp_ab_less)
	   else if (mantissa_ab[19:0] > mantissa_c[19:0]) begin
	      for (int i=21; i>=0; i--) begin
		 if ((mantissa_ab[i] ^ mantissa_c[i]) & ~stop) begin
		    count   = count + 'd1;
		    p_found = 1'b1;
		    z_next  = 1'b1;
		 end
		 else if (~(mantissa_ab[i] | mantissa_c[i]) & p_found & z_next) begin
		    count   = count + 'd1;
		    z_found = 1'b1;
		    g_next  = 1'b1;
		 end
		 else if ((mantissa_ab[i] & mantissa_c[i]) & p_found & z_found & g_next) begin
		    count   = count + 'd1;
		    g_found = 1'b1;
		    stop    = 1'b1;
		 end
		 else begin
		    ad = mantissa_ab[i] + mantissa_c[i];
		    break;
		 end
	      end
	      mantissa_shift = count - ad[1] - 1'd1;
	   end // if (mantissa_ab[19:0] > mantissa_c[19:0])
	   else if (mantissa_ab[19:0] < mantissa_c[19:0]) begin
	      for (int i=21; i>=0; i--) begin
		 if ((mantissa_ab[i] ^ mantissa_c[i]) & ~stop) begin
		    count   = count + 'd1;
		    p_found = 1'b1;
		    z_next  = 1'b1;
		 end
		 else if (~(mantissa_ab[i] | mantissa_c[i]) & p_found & g_next) begin
		    count   = count + 'd1;
		    g_found = 1'b1;
		    z_next  = 1'b1;
		 end
		 else if ((mantissa_ab[i] & mantissa_c[i]) & p_found & g_found & z_next) begin
		    count   = count + 'd1;
		    z_found = 1'b1;
		    stop    = 1'b1;
		 end
		 else begin
		    ad = mantissa_ab[i] + mantissa_c[i];
		    break;
		 end
	      end
	      mantissa_shift = count - ad[1] - 1'd1;
	   end // if (mantissa_ab[19:0] < mantissa_c[19:0])
	   else begin
	      mantissa_shift = '0;
	   end // else: !if(mantissa_ab[19:0] < mantissa_c[19:0])
	end // case: {1'b1, 1'b0}
	default: begin
	   mantissa_shift = '0;
	end
      endcase // case ({sign_ab, sign_c})

   end // always_comb

endmodule // fma_lza
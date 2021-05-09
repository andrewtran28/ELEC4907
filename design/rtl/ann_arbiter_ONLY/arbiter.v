
module arbiter (
		 clk,
		 rst,
		neuron_0_port,	
		neuron_1_port,
		neuron_2_port,
		neuron_3_port,
		neuron_4_port,
		neuron_5_port,
		neuron_6_port,
		neuron_7_port,
		 neuron_0_done,
		 neuron_1_done,	
		 neuron_2_done,
		 neuron_3_done,
		 neuron_4_done,
		 neuron_5_done,
		 neuron_6_done,
		 neuron_7_done,
		neuron_0_connection,
		neuron_1_connection,	
		neuron_2_connection,
		neuron_3_connection,
		neuron_4_connection,
		neuron_5_connection,
		neuron_6_connection,
		neuron_7_connection,
		router_port_0,
		router_port_1,
		router_port_2,
		router_port_3,
		router_port_4,
		router_port_5,
		router_port_6,
		router_port_7,
	  buffer_0_data_in,
	  buffer_1_data_in,
	  buffer_2_data_in,
	  buffer_3_data_in,
	  buffer_4_data_in,
	  buffer_5_data_in,
	  buffer_6_data_in,
	  buffer_7_data_in,	

	  buffer_0_data_out,
	  buffer_1_data_out,
	  buffer_2_data_out,
	  buffer_3_data_out,
	  buffer_4_data_out,
	  buffer_5_data_out,
	  buffer_6_data_out,
	  buffer_7_data_out,	

	  buffer_0_rd_ptr,
	  buffer_1_rd_ptr,
	  buffer_2_rd_ptr,
	  buffer_3_rd_ptr,
	  buffer_4_rd_ptr,
	  buffer_5_rd_ptr,
	  buffer_6_rd_ptr,
	  buffer_7_rd_ptr, 

	 buffer_0_wr_en,
	 buffer_1_wr_en,
	 buffer_2_wr_en,
	 buffer_3_wr_en,
	 buffer_4_wr_en,
	 buffer_5_wr_en,
	 buffer_6_wr_en,
	 buffer_7_wr_en,

	 buffer_0_rd_en,
	 buffer_1_rd_en,
	 buffer_2_rd_en,
	 buffer_3_rd_en,
	 buffer_4_rd_en,
	 buffer_5_rd_en,
	 buffer_6_rd_en,
	 buffer_7_rd_en,

	 buffer_0_empty,
	 buffer_1_empty,
	 buffer_2_empty,
	 buffer_3_empty,
	 buffer_4_empty,
	 buffer_5_empty,
	 buffer_6_empty,
	 buffer_7_empty
	);

input clk;
input rst;
input [15:0] neuron_0_port;	
input [15:0] neuron_1_port;
input [15:0] neuron_2_port;
input [15:0] neuron_3_port;
input [15:0] neuron_4_port;
input [15:0] neuron_5_port;
input [15:0] neuron_6_port;
input [15:0] neuron_7_port;
input neuron_0_done;
input neuron_1_done;	
input neuron_2_done;
input neuron_3_done;
input neuron_4_done;
input neuron_5_done;
input neuron_6_done;
input neuron_7_done;
input [7:0] neuron_0_connection;
input [7:0] neuron_1_connection;	
input [7:0] neuron_2_connection;
input [7:0] neuron_3_connection;
input [7:0] neuron_4_connection;
input [7:0] neuron_5_connection;
input [7:0] neuron_6_connection;
input [7:0] neuron_7_connection;
output reg[19:0] router_port_0;
output reg[19:0] router_port_1;
output reg[19:0] router_port_2;
output reg[19:0] router_port_3;
output reg[19:0] router_port_4;
output reg[19:0] router_port_5;
output reg[19:0] router_port_6;
output reg[19:0] router_port_7;




output reg	 [19:0] buffer_0_data_in;
output reg	 [19:0] buffer_1_data_in;
output reg	 [19:0] buffer_2_data_in;
output reg	 [19:0] buffer_3_data_in;
output reg	 [19:0] buffer_4_data_in;
output reg	 [19:0] buffer_5_data_in;
output reg	 [19:0] buffer_6_data_in;
output reg	 [19:0] buffer_7_data_in;	

input	 [19:0] buffer_0_data_out;
input	 [19:0] buffer_1_data_out;
input	 [19:0] buffer_2_data_out;
input	 [19:0] buffer_3_data_out;
input	 [19:0] buffer_4_data_out;
input	 [19:0] buffer_5_data_out;
input	 [19:0] buffer_6_data_out;
input	 [19:0] buffer_7_data_out;	

output	reg [2:0] buffer_0_rd_ptr;
output	reg [2:0] buffer_1_rd_ptr;
output	reg [2:0] buffer_2_rd_ptr;
output	reg [2:0] buffer_3_rd_ptr;
output	reg [2:0] buffer_4_rd_ptr;
output	reg [2:0] buffer_5_rd_ptr;
output	reg [2:0] buffer_6_rd_ptr;
output	reg [2:0] buffer_7_rd_ptr; 

output	reg buffer_0_wr_en;
output	reg buffer_1_wr_en;
output	reg buffer_2_wr_en;
output	reg buffer_3_wr_en;
output	reg buffer_4_wr_en;
output	reg buffer_5_wr_en;
output	reg buffer_6_wr_en;
output	reg buffer_7_wr_en;

output	reg buffer_0_rd_en;
output	reg buffer_1_rd_en;
output	reg buffer_2_rd_en;
output	reg buffer_3_rd_en;
output	reg buffer_4_rd_en;
output	reg buffer_5_rd_en;
output	reg buffer_6_rd_en;
output	reg buffer_7_rd_en;

input	 buffer_0_empty;
input	 buffer_1_empty;
input	 buffer_2_empty;
input	 buffer_3_empty;
input	 buffer_4_empty;
input	 buffer_5_empty;
input	 buffer_6_empty;
input	 buffer_7_empty;


	reg [7:0] neuron_serviced;

	

	parameter 	load_0 = 3'b000, load_1 = 3'b001, load_2 = 3'b010, 
				load_3 = 3'b011, load_4 = 3'b100, load_5 = 3'b101,
				load_6 = 3'b110, load_7 = 3'b111;

	reg [2:0] cur_state; //current port loading
	reg [2:0] rr_bias;	//round-robin bias 
	reg [2:0] cur_port;

	always @(negedge clk) begin
		if(~rst)begin // else no reset
			if (buffer_0_rd_en)begin
				router_port_0 <= buffer_0_data_out;
				buffer_0_rd_ptr <= buffer_0_rd_ptr + 1;
			end
			if (buffer_1_rd_en)begin
				router_port_1 <= buffer_1_data_out;
				buffer_1_rd_ptr <= buffer_1_rd_ptr + 1;
			end
			if (buffer_2_rd_en)begin
				router_port_2 <= buffer_2_data_out;
				buffer_2_rd_ptr <= buffer_2_rd_ptr + 1;
			end
			if (buffer_3_rd_en)begin
				router_port_3 <= buffer_3_data_out;
				buffer_3_rd_ptr <= buffer_3_rd_ptr + 1;
			end
			if (buffer_4_rd_en)begin
				router_port_4 <= buffer_4_data_out;
				buffer_4_rd_ptr <= buffer_4_rd_ptr + 1;
			end
			if (buffer_5_rd_en)begin
				router_port_5 <= buffer_5_data_out;
				buffer_5_rd_ptr <= buffer_5_rd_ptr + 1;
			end
			if (buffer_6_rd_en)begin
				router_port_6 <= buffer_6_data_out;
				buffer_6_rd_ptr <= buffer_6_rd_ptr + 1;
			end
			if (buffer_7_rd_en)begin
				router_port_7 <= buffer_7_data_out;
				buffer_7_rd_ptr <= buffer_7_rd_ptr + 1;
			end //read enables
		end //no reset
	end //negedge clk

	always @(posedge clk) begin
			buffer_0_rd_en <= buffer_0_empty ? 0 : 1;
			buffer_1_rd_en <= buffer_1_empty ? 0 : 1;
			buffer_2_rd_en <= buffer_2_empty ? 0 : 1;
			buffer_3_rd_en <= buffer_3_empty ? 0 : 1;
			buffer_4_rd_en <= buffer_4_empty ? 0 : 1;
			buffer_5_rd_en <= buffer_5_empty ? 0 : 1;
			buffer_6_rd_en <= buffer_6_empty ? 0 : 1;
			buffer_7_rd_en <= buffer_7_empty ? 0 : 1;
	end //posedge clk

	//load buffers
	always @(posedge clk)begin
		case (cur_state)
			3'd0: begin
				cur_state <= ~neuron_serviced[1] ? 3'd1 :
				~neuron_serviced[2] ? 3'd2 :
				~neuron_serviced[3] ? 3'd3 : 
				~neuron_serviced[4] ? 3'd4 :
				~neuron_serviced[5] ? 3'd5 :
				~neuron_serviced[6] ? 3'd6 :
				~neuron_serviced[7] ? 3'd7 : 3'd0;
			end
			3'd1: begin
				cur_state <= ~neuron_serviced[2] ? 3'd2 :
				~neuron_serviced[3] ? 3'd3 :
				~neuron_serviced[4] ? 3'd4 : 
				~neuron_serviced[5] ? 3'd5 :
				~neuron_serviced[6] ? 3'd6 :
				~neuron_serviced[7] ? 3'd7 :
				~neuron_serviced[0] ? 3'd0 : 3'd0;
			end
			3'd2: begin
				cur_state <= ~neuron_serviced[3] ? 3'd3 :
				~neuron_serviced[4] ? 3'd4 : 
				~neuron_serviced[5] ? 3'd5 :
				~neuron_serviced[6] ? 3'd6 :
				~neuron_serviced[7] ? 3'd7 :
				~neuron_serviced[0] ? 3'd0 : 
				~neuron_serviced[1] ? 3'd1 : 3'd0;
			end
			3'd3: begin
				cur_state <= ~neuron_serviced[4] ? 3'd4 : 
				~neuron_serviced[5] ? 3'd5 :
				~neuron_serviced[6] ? 3'd6 :
				~neuron_serviced[7] ? 3'd7 :
				~neuron_serviced[0] ? 3'd0 : 
				~neuron_serviced[1] ? 3'd1 : 
				~neuron_serviced[2] ? 3'd2 : 3'd0;
			end
			3'd4: begin
				cur_state <= ~neuron_serviced[5] ? 3'd5 :
				~neuron_serviced[6] ? 3'd6 :
				~neuron_serviced[7] ? 3'd7 :
				~neuron_serviced[0] ? 3'd0 : 
				~neuron_serviced[1] ? 3'd1 : 
				~neuron_serviced[2] ? 3'd2 : 
				~neuron_serviced[3] ? 3'd3 : 3'd0;
			end
			3'd5: begin
				cur_state <= ~neuron_serviced[6] ? 3'd6 :
				~neuron_serviced[7] ? 3'd7 :
				~neuron_serviced[0] ? 3'd0 : 
				~neuron_serviced[1] ? 3'd1 : 
				~neuron_serviced[2] ? 3'd2 : 
				~neuron_serviced[3] ? 3'd3 : 
				~neuron_serviced[4] ? 3'd4 : 3'd0;
			end
			3'd6: begin
				cur_state <= ~neuron_serviced[7] ? 3'd7 :
				~neuron_serviced[0] ? 3'd0 : 
				~neuron_serviced[1] ? 3'd1 : 
				~neuron_serviced[2] ? 3'd2 : 
				~neuron_serviced[3] ? 3'd3 : 
				~neuron_serviced[4] ? 3'd4 : 
				~neuron_serviced[5] ? 3'd5 : 3'd0;
			end
			3'd7: begin
				cur_state <= ~neuron_serviced[0] ? 3'd0 : 
				~neuron_serviced[1] ? 3'd1 : 
				~neuron_serviced[2] ? 3'd2 : 
				~neuron_serviced[3] ? 3'd3 : 
				~neuron_serviced[4] ? 3'd4 : 
				~neuron_serviced[5] ? 3'd5 : 
				~neuron_serviced[6] ? 3'd6 : 3'd0;
			end
		endcase //curstate

	end // posedge clk

	always @(negedge clk)begin
	if(~rst)begin
		if (neuron_0_done & ~neuron_serviced[0] & cur_state == 3'd0) begin
			if (neuron_0_connection[0]) begin
				buffer_0_wr_en <= 1;
				buffer_0_data_in <= {{4'b0000},neuron_0_port};
			end //neuron_0_connection
			if (neuron_0_connection[1]) begin
				buffer_1_wr_en <= 1;
				buffer_1_data_in <= {{4'b0001},neuron_0_port};
			end //neuron_0_connection
			if (neuron_0_connection[2]) begin
				buffer_2_wr_en <= 1;
				buffer_2_data_in <= {{4'b0010},neuron_0_port};
			end //neuron_0_connection
			if (neuron_0_connection[3]) begin
				buffer_3_wr_en <= 1;
				buffer_3_data_in <= {{4'b0011},neuron_0_port};
			end //neuron_0_connection
			if (neuron_0_connection[4]) begin
				buffer_4_wr_en <= 1;
				buffer_4_data_in <= {{4'b0100},neuron_0_port};
			end //neuron_0_connection
			if (neuron_0_connection[5]) begin
				buffer_5_wr_en <= 1;
				buffer_5_data_in <= {{4'b0101},neuron_0_port};
			end //neuron_0_connection
			if (neuron_0_connection[6]) begin
				buffer_6_wr_en <= 1;
				buffer_6_data_in <= {{4'b0110},neuron_0_port};
			end //neuron_0_connection
			if (neuron_0_connection[7]) begin
				buffer_7_wr_en <= 1;
				buffer_7_data_in <= {{4'b0111},neuron_0_port};
			end //neuron_0_connection
			neuron_serviced[0] <= 1;
		end //neuron_0_done
		else
		if (neuron_1_done & ~neuron_serviced[1] & cur_state == 3'd1) begin
			if (neuron_1_connection[0]) begin
				buffer_0_wr_en <= 1;
				buffer_0_data_in <= {{4'b0000},neuron_1_port};
			end //neuron_0_connection
			if (neuron_1_connection[1]) begin
				buffer_1_wr_en <= 1;
				buffer_1_data_in <= {{4'b0001},neuron_1_port};
			end //neuron_0_connection
			if (neuron_1_connection[2]) begin
				buffer_2_wr_en <= 1;
				buffer_2_data_in <= {{4'b0010},neuron_1_port};
			end //neuron_0_connection
			if (neuron_1_connection[3]) begin
				buffer_3_wr_en <= 1;
				buffer_3_data_in <= {{4'b0011},neuron_1_port};
			end //neuron_0_connection
			if (neuron_1_connection[4]) begin
				buffer_4_wr_en <= 1;
				buffer_4_data_in <= {{4'b0100},neuron_1_port};
			end //neuron_0_connection
			if (neuron_1_connection[5]) begin
				buffer_5_wr_en <= 1;
				buffer_5_data_in <= {{4'b0101},neuron_1_port};
			end //neuron_0_connection
			if (neuron_1_connection[6]) begin
				buffer_6_wr_en <= 1;
				buffer_6_data_in <= {{4'b0110},neuron_1_port};
			end //neuron_0_connection
			if (neuron_1_connection[7]) begin
				buffer_7_wr_en <= 1;
				buffer_7_data_in <= {{4'b0111},neuron_1_port};
			end //neuron_0_connection
			neuron_serviced[1] <= 1;
		end //neuron_1_done
		else
		if (neuron_2_done & ~neuron_serviced[2] & cur_state == 3'd2) begin
			if (neuron_2_connection[0]) begin
				buffer_0_wr_en <= 1;
				buffer_0_data_in <= {{4'b0000},neuron_2_port};
			end //neuron_0_connection
			if (neuron_2_connection[1]) begin
				buffer_1_wr_en <= 1;
				buffer_1_data_in <= {{4'b0001},neuron_2_port};
			end //neuron_0_connection
			if (neuron_2_connection[2]) begin
				buffer_2_wr_en <= 1;
				buffer_2_data_in <= {{4'b0010},neuron_2_port};
			end //neuron_0_connection
			if (neuron_2_connection[3]) begin
				buffer_3_wr_en <= 1;
				buffer_3_data_in <= {{4'b0011},neuron_2_port};
			end //neuron_0_connection
			if (neuron_2_connection[4]) begin
				buffer_4_wr_en <= 1;
				buffer_4_data_in <= {{4'b0100},neuron_2_port};
			end //neuron_0_connection
			if (neuron_2_connection[5]) begin
				buffer_5_wr_en <= 1;
				buffer_5_data_in <= {{4'b0101},neuron_2_port};
			end //neuron_0_connection
			if (neuron_2_connection[6]) begin
				buffer_6_wr_en <= 1;
				buffer_6_data_in <= {{4'b0110},neuron_2_port};
			end //neuron_0_connection
			if (neuron_2_connection[7]) begin
				buffer_7_wr_en <= 1;
				buffer_7_data_in <= {{4'b0111},neuron_2_port};
			end //neuron_0_connection
			neuron_serviced[2] <= 1;
		end //neuron_0_done
		else
		if (neuron_3_done & ~neuron_serviced[3] & cur_state == 3'd3) begin
			if (neuron_3_connection[0]) begin
				buffer_0_wr_en <= 1;
				buffer_0_data_in <= {{4'b0000},neuron_3_port};
			end //neuron_0_connection
			if (neuron_3_connection[1]) begin
				buffer_1_wr_en <= 1;
				buffer_1_data_in <= {{4'b0001},neuron_3_port};
			end //neuron_0_connection
			if (neuron_3_connection[2]) begin
				buffer_2_wr_en <= 1;
				buffer_2_data_in <= {{4'b0010},neuron_3_port};
			end //neuron_0_connection
			if (neuron_3_connection[3]) begin
				buffer_3_wr_en <= 1;
				buffer_3_data_in <= {{4'b0011},neuron_3_port};
			end //neuron_0_connection
			if (neuron_3_connection[4]) begin
				buffer_4_wr_en <= 1;
				buffer_4_data_in <= {{4'b0100},neuron_3_port};
			end //neuron_0_connection
			if (neuron_3_connection[5]) begin
				buffer_5_wr_en <= 1;
				buffer_5_data_in <= {{4'b0101},neuron_3_port};
			end //neuron_0_connection
			if (neuron_3_connection[6]) begin
				buffer_6_wr_en <= 1;
				buffer_6_data_in <= {{4'b0110},neuron_3_port};
			end //neuron_0_connection
			if (neuron_3_connection[7]) begin
				buffer_7_wr_en <= 1;
				buffer_7_data_in <= {{4'b0111},neuron_3_port};
			end //neuron_0_connection
			neuron_serviced[3] <= 1;
		end //neuron_0_done
		else
		if (neuron_4_done & ~neuron_serviced[4] & cur_state == 3'd4) begin
			if (neuron_4_connection[0]) begin
				buffer_0_wr_en <= 1;
				buffer_0_data_in <= {{4'b0000},neuron_4_port};
			end //neuron_0_connection
			if (neuron_4_connection[1]) begin
				buffer_1_wr_en <= 1;
				buffer_1_data_in <= {{4'b0001},neuron_4_port};
			end //neuron_0_connection
			if (neuron_4_connection[2]) begin
				buffer_2_wr_en <= 1;
				buffer_2_data_in <= {{4'b0010},neuron_4_port};
			end //neuron_0_connection
			if (neuron_4_connection[3]) begin
				buffer_3_wr_en <= 1;
				buffer_3_data_in <= {{4'b0011},neuron_4_port};
			end //neuron_0_connection
			if (neuron_4_connection[4]) begin
				buffer_4_wr_en <= 1;
				buffer_4_data_in <= {{4'b0100},neuron_4_port};
			end //neuron_0_connection
			if (neuron_4_connection[5]) begin
				buffer_5_wr_en <= 1;
				buffer_5_data_in <= {{4'b0101},neuron_4_port};
			end //neuron_0_connection
			if (neuron_4_connection[6]) begin
				buffer_6_wr_en <= 1;
				buffer_6_data_in <= {{4'b0110},neuron_4_port};
			end //neuron_0_connection
			if (neuron_4_connection[7]) begin
				buffer_7_wr_en <= 1;
				buffer_7_data_in <= {{4'b0111},neuron_4_port};
			end //neuron_0_connection
			neuron_serviced[4] <= 1;
		end //neuron_0_done
		else
		if (neuron_5_done & ~neuron_serviced[5] & cur_state == 3'd5) begin
			if (neuron_5_connection[0]) begin
				buffer_0_wr_en <= 1;
				buffer_0_data_in <= {{4'b0000},neuron_5_port};
			end //neuron_0_connection
			if (neuron_5_connection[1]) begin
				buffer_1_wr_en <= 1;
				buffer_1_data_in <= {{4'b0001},neuron_5_port};
			end //neuron_0_connection
			if (neuron_5_connection[2]) begin
				buffer_2_wr_en <= 1;
				buffer_2_data_in <= {{4'b0010},neuron_5_port};
			end //neuron_0_connection
			if (neuron_5_connection[3]) begin
				buffer_3_wr_en <= 1;
				buffer_3_data_in <= {{4'b0011},neuron_5_port};
			end //neuron_0_connection
			if (neuron_5_connection[4]) begin
				buffer_4_wr_en <= 1;
				buffer_4_data_in <= {{4'b0100},neuron_5_port};
			end //neuron_0_connection
			if (neuron_5_connection[5]) begin
				buffer_5_wr_en <= 1;
				buffer_5_data_in <= {{4'b0101},neuron_5_port};
			end //neuron_0_connection
			if (neuron_5_connection[6]) begin
				buffer_6_wr_en <= 1;
				buffer_6_data_in <= {{4'b0110},neuron_5_port};
			end //neuron_0_connection
			if (neuron_5_connection[7]) begin
				buffer_7_wr_en <= 1;
				buffer_7_data_in <= {{4'b0111},neuron_5_port};
			end //neuron_0_connection
			neuron_serviced[5] <= 1;				
		end //neuron_0_done
		else
		if (neuron_6_done & ~neuron_serviced[6] & cur_state == 3'd6) begin
			if (neuron_6_connection[0]) begin
				buffer_0_wr_en <= 1;
				buffer_0_data_in <= {{4'b0000},neuron_6_port};
			end //neuron_0_connection
			if (neuron_6_connection[1]) begin
				buffer_1_wr_en <= 1;
				buffer_1_data_in <= {{4'b0001},neuron_6_port};
			end //neuron_0_connection
			if (neuron_6_connection[2]) begin
				buffer_2_wr_en <= 1;
				buffer_2_data_in <= {{4'b0010},neuron_6_port};
			end //neuron_0_connection
			if (neuron_6_connection[3]) begin
				buffer_3_wr_en <= 1;
				buffer_3_data_in <= {{4'b0011},neuron_6_port};
			end //neuron_0_connection
			if (neuron_6_connection[4]) begin
				buffer_4_wr_en <= 1;
				buffer_4_data_in <= {{4'b0100},neuron_6_port};
			end //neuron_0_connection
			if (neuron_6_connection[5]) begin
				buffer_5_wr_en <= 1;
				buffer_5_data_in <= {{4'b0101},neuron_6_port};
			end //neuron_0_connection
			if (neuron_6_connection[6]) begin
				buffer_6_wr_en <= 1;
				buffer_6_data_in <= {{4'b0110},neuron_6_port};
			end //neuron_0_connection
			if (neuron_6_connection[7]) begin
				buffer_7_wr_en <= 1;
				buffer_7_data_in <= {{4'b0111},neuron_6_port};
			end //neuron_0_connection
			neuron_serviced[6] <= 1;		
		end //neuron_0_done
		else
		if (neuron_7_done & ~neuron_serviced[7] & cur_state == 3'd7) begin
			if (neuron_7_connection[0]) begin
				buffer_0_wr_en <= 1;
				buffer_0_data_in <= {{4'b0000},neuron_7_port};
			end //neuron_0_connection
			if (neuron_7_connection[1]) begin
				buffer_1_wr_en <= 1;
				buffer_1_data_in <= {{4'b0001},neuron_7_port};
			end //neuron_0_connection
			if (neuron_7_connection[2]) begin
				buffer_2_wr_en <= 1;
				buffer_2_data_in <= {{4'b0010},neuron_7_port};
			end //neuron_0_connection
			if (neuron_7_connection[3]) begin
				buffer_3_wr_en <= 1;
				buffer_3_data_in <= {{4'b0011},neuron_7_port};
			end //neuron_0_connection
			if (neuron_7_connection[4]) begin
				buffer_4_wr_en <= 1;
				buffer_4_data_in <= {{4'b0100},neuron_7_port};
			end //neuron_0_connection
			if (neuron_7_connection[5]) begin
				buffer_5_wr_en <= 1;
				buffer_5_data_in <= {{4'b0101},neuron_7_port};
			end //neuron_0_connection
			if (neuron_7_connection[6]) begin
				buffer_6_wr_en <= 1;
				buffer_6_data_in <= {{4'b0110},neuron_7_port};
			end //neuron_0_connection
			if (neuron_7_connection[7]) begin
				buffer_7_wr_en <= 1;
				buffer_7_data_in <= {{4'b0111},neuron_7_port};
			end //neuron_0_connection
			neuron_serviced[7] <= 1;
		end //neuron_0_done
	end
	end //negedge clk

endmodule

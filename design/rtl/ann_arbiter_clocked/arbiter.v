//this file has the allocatoin buffer and the arbiter all-in-1
//Vladimir Milicevic

module allocation_buffer (
	clk, rst, data_in, data_out, full, empty, rd_ptr, wr_en, rd_en
	);

	input clk;
	input rst;
	input [19:0] data_in;
	output reg[19:0] data_out; 
	output full;
	output empty;
	input [2:0] rd_ptr;
	input wr_en;
	input rd_en;


	reg [7:0] buffer [19:0];
	reg [2:0] wr_ptr;
	reg [2:0] count;

	assign full = (&wr_ptr) ? 1 : 0;
	assign empty = (~|count) ? 1 : 0;

always @(posedge clk)begin
	if(rst)begin
		data_out <= 16'd0;
		wr_ptr <= 3'd0;
		count <= 3'b000;
	end else begin //reset
		if(rd_en & wr_en & (rd_ptr & wr_ptr))begin
			data_out <= data_in;
		end else begin
			if(rd_en)begin
				case (rd_ptr)
					3'b000: data_out <= buffer[0];
					3'b001: data_out <= buffer[1];
					3'b010: data_out <= buffer[2];
					3'b011: data_out <= buffer[3];
					3'b100: data_out <= buffer[4];
					3'b101: data_out <= buffer[5];
					3'b110: data_out <= buffer[6];
					3'b111: data_out <= buffer[7];
				endcase //rd_ptr
			end //rd_en
			if(wr_en)begin
				case(wr_ptr)
					3'b000: buffer[0] <= data_in;
					3'b001: buffer[1] <= data_in;
					3'b010: buffer[2] <= data_in;
					3'b011: buffer[3] <= data_in;
					3'b100: buffer[4] <= data_in;
					3'b101: buffer[5] <= data_in;
					3'b110: buffer[6] <= data_in;
					3'b111: buffer[7] <= data_in;
				endcase //wr_ptr
				wr_ptr <= wr_ptr + 1;
			end //wr_en
			if(wr_en & ~rd_en) begin 
				count <= count + 1; 
			end  if(~wr_en & rd_en) begin
				count <= count - 1;
			end//count incremend else if 
		end	//else
	end //reset
end //posedge clk

endmodule //allocation buffer

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
		router_port_7
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




	reg [19:0] buffer_0_data_in;
	reg [19:0] buffer_1_data_in;
	reg [19:0] buffer_2_data_in;
	reg [19:0] buffer_3_data_in;
	reg [19:0] buffer_4_data_in;
	reg [19:0] buffer_5_data_in;
	reg [19:0] buffer_6_data_in;
	reg [19:0] buffer_7_data_in;	

	wire [19:0] buffer_0_data_out;
	wire [19:0] buffer_1_data_out;
	wire [19:0] buffer_2_data_out;
	wire [19:0] buffer_3_data_out;
	wire [19:0] buffer_4_data_out;
	wire [19:0] buffer_5_data_out;
	wire [19:0] buffer_6_data_out;
	wire [19:0] buffer_7_data_out;	

	reg [2:0] buffer_0_rd_ptr;
	reg [2:0] buffer_1_rd_ptr;
	reg [2:0] buffer_2_rd_ptr;
	reg [2:0] buffer_3_rd_ptr;
	reg [2:0] buffer_4_rd_ptr;
	reg [2:0] buffer_5_rd_ptr;
	reg [2:0] buffer_6_rd_ptr;
	reg [2:0] buffer_7_rd_ptr; 

	reg buffer_0_wr_en;
	reg buffer_1_wr_en;
	reg buffer_2_wr_en;
	reg buffer_3_wr_en;
	reg buffer_4_wr_en;
	reg buffer_5_wr_en;
	reg buffer_6_wr_en;
	reg buffer_7_wr_en;

	reg buffer_0_rd_en;
	reg buffer_1_rd_en;
	reg buffer_2_rd_en;
	reg buffer_3_rd_en;
	reg buffer_4_rd_en;
	reg buffer_5_rd_en;
	reg buffer_6_rd_en;
	reg buffer_7_rd_en;

	wire buffer_0_empty;
	wire buffer_1_empty;
	wire buffer_2_empty;
	wire buffer_3_empty;
	wire buffer_4_empty;
	wire buffer_5_empty;
	wire buffer_6_empty;
	wire buffer_7_empty;


	reg [7:0] neuron_serviced;

	allocation_buffer u0_allocation_buffer (
		.clk(clk), 
		.rst(rst), 
		.data_in(buffer_0_data_in), 
		.data_out(buffer_0_data_out), 
		.full(), 
		.empty(buffer_0_empty), 
		.rd_ptr(buffer_0_rd_ptr), 
		.wr_en(buffer_0_wr_en), 
		.rd_en(buffer_0_rd_en)
		);

	allocation_buffer u1_allocation_buffer (
		.clk(clk), 
		.rst(rst), 
		.data_in(buffer_1_data_in), 
		.data_out(buffer_1_data_out), 
		.full(), 
		.empty(buffer_1_empty), 
		.rd_ptr(buffer_1_rd_ptr), 
		.wr_en(buffer_1_wr_en), 
		.rd_en(buffer_1_rd_en)
		);
 
	allocation_buffer u2_allocation_buffer (
		.clk(clk), 
		.rst(rst), 
		.data_in(buffer_2_data_in), 
		.data_out(buffer_2_data_out), 
		.full(), 
		.empty(buffer_2_empty), 
		.rd_ptr(buffer_2_rd_ptr), 
		.wr_en(buffer_2_wr_en), 
		.rd_en(buffer_2_rd_en)
		);

	allocation_buffer u3_allocation_buffer (
		.clk(clk), 
		.rst(rst), 
		.data_in(buffer_3_data_in), 
		.data_out(buffer_3_data_out), 
		.full(), 
		.empty(buffer_3_empty), 
		.rd_ptr(buffer_3_rd_ptr), 
		.wr_en(buffer_3_wr_en), 
		.rd_en(buffer_3_rd_en)
		);

	allocation_buffer u4_allocation_buffer (
		.clk(clk), 
		.rst(rst), 
		.data_in(buffer_4_data_in), 
		.data_out(buffer_4_data_out), 
		.full(), 
		.empty(buffer_4_empty), 
		.rd_ptr(buffer_4_rd_ptr), 
		.wr_en(buffer_4_wr_en), 
		.rd_en(buffer_4_rd_en)
		);

	allocation_buffer u5_allocation_buffer (
		.clk(clk), 
		.rst(rst), 
		.data_in(buffer_5_data_in), 
		.data_out(buffer_5_data_out), 
		.full(), 
		.empty(buffer_5_empty), 
		.rd_ptr(buffer_5_rd_ptr), 
		.wr_en(buffer_5_wr_en), 
		.rd_en(buffer_5_rd_en)
		);

	allocation_buffer u6_allocation_buffer (
		.clk(clk), 
		.rst(rst), 
		.data_in(buffer_6_data_in), 
		.data_out(buffer_6_data_out), 
		.full(), 
		.empty(buffer_6_empty), 
		.rd_ptr(buffer_6_rd_ptr), 
		.wr_en(buffer_6_wr_en), 
		.rd_en(buffer_6_rd_en)
		);

	allocation_buffer u7_allocation_buffer (
		.clk(clk), 
		.rst(rst), 
		.data_in(buffer_7_data_in), 
		.data_out(buffer_7_data_out), 
		.full(), 
		.empty(buffer_7_empty), 
		.rd_ptr(buffer_7_rd_ptr), 
		.wr_en(buffer_7_wr_en), 
		.rd_en(buffer_7_rd_en)
		);

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

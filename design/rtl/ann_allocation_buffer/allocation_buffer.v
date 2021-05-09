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

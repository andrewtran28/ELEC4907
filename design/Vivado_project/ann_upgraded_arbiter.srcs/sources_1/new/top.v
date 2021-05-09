`timescale 1ns/1ns
module top;

reg clk, rst;
reg [127:0] voq0, voq1, voq2, voq3, voq4, voq5, voq6, voq7;
reg [7:0] en0, en1, en2, en3, en4, en5, en6, en7;
wire [19:0] out0, out1, out2, out3, out4, out5, out6, out7;

arbiter u_arbiter (
	.clk(clk), .rst(rst), .voq0(voq0), .voq1(voq1), .voq2(voq2), .voq3(voq3), 
	.voq4(voq4), .voq5(voq5), .voq6(voq6), .voq7(voq7), .out0(out0), .out1(out1), 
	.out2(out2), .out3(out3), .out4(out4), .out5(out5), .out6(out6), .out7(out7),
	.en0(en0), .en1(en1), .en2(en2), .en3(en3), .en4(en4), .en5(en5), .en6(en6), 
	.en7(en7)
	);


always @(negedge clk)begin
   
end

initial begin
    clk = 1;
	rst = 1;
	#1;
	#1 clk = 0;
	#1 clk = 1;
	en0 = 8'hFF;
	en1 = 8'hFF;
	en2 = 8'hFF;
	en3 = 8'hFF;
	en4 = 8'hFF;
	en5 = 8'hFF;
	en6 = 8'hFF;
	en7 = 8'hFF;
	voq0 = {{16'd7}, {16'd6}, {16'd5}, {16'd4}, {16'd3}, {16'd2}, {16'd1}, {16'd0}};
	voq1 = {{16'd7}, {16'd6}, {16'd5}, {16'd4}, {16'd3}, {16'd2}, {16'd1}, {16'd0}};
	voq2 = {{16'd7}, {16'd6}, {16'd5}, {16'd4}, {16'd3}, {16'd2}, {16'd1}, {16'd0}};
	voq3 = {{16'd7}, {16'd6}, {16'd5}, {16'd4}, {16'd3}, {16'd2}, {16'd1}, {16'd0}};
	voq4 = {{16'd7}, {16'd6}, {16'd5}, {16'd4}, {16'd3}, {16'd2}, {16'd1}, {16'd0}};
	voq5 = {{16'd7}, {16'd6}, {16'd5}, {16'd4}, {16'd3}, {16'd2}, {16'd1}, {16'd0}};
	voq6 = {{16'd7}, {16'd6}, {16'd5}, {16'd4}, {16'd3}, {16'd2}, {16'd1}, {16'd0}};
	voq7 = {{16'd7}, {16'd6}, {16'd5}, {16'd4}, {16'd3}, {16'd2}, {16'd1}, {16'd0}};
	#1;
	rst = 0;
    #1 clk  = 0;
    #1 clk  = 1;
    #1 clk  = 0;
    #1 clk  = 1;
    #1 clk  = 0;
    #1 clk  = 1;
    #1 clk  = 0;
    #1 clk  = 1;
    #1 clk  = 0;
    #1 clk  = 1;
    #1 clk  = 0;
    #1 clk  = 1;	
     #1 clk  = 0;
       #1 clk  = 1;
       #1 clk  = 0;
       #1 clk  = 1;
       #1 clk  = 0;
       #1 clk  = 1;
       #1 clk  = 0;
       #1 clk  = 1;
       #1 clk  = 0;
       #1 clk  = 1;
       #1 clk  = 0;
       #1 clk  = 1;
        #1 clk  = 0;
          #1 clk  = 1;
          #1 clk  = 0;
          #1 clk  = 1;
          #1 clk  = 0;
          #1 clk  = 1;
          #1 clk  = 0;
          #1 clk  = 1;
          #1 clk  = 0;
          #1 clk  = 1;
          #1 clk  = 0;
          #1 clk  = 1;
end//initial

endmodule
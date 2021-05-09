`timescale 1ns / 1ps
`define TAG0 30:28
`define TAG1 26:24
`define TAG2 22:20
`define TAG3 18:16
`define TAG4 14:12
`define TAG5 10:8
`define TAG6 6:4
`define TAG7 2:0
`define EN0 31
`define EN1 27
`define EN2 23
`define EN3 19
`define EN4 15
`define EN5 11
`define EN6 7
`define EN7 3
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/11/2020 02:32:34 AM
// Design Name: 
// Module Name: arbiter
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module arbiter(
    clk, rst, fifo_empty, fifo_0_snoop,  fifo_1_snoop,  fifo_2_snoop,  fifo_3_snoop,  fifo_4_snoop,  fifo_5_snoop,  fifo_6_snoop,  fifo_7_snoop, router_ready,
    ready, fifo_rd, fifo_0_ptr, fifo_1_ptr, fifo_2_ptr, fifo_3_ptr, fifo_4_ptr, fifo_5_ptr, fifo_6_ptr, fifo_7_ptr  
    );
    
    output reg[2:0] fifo_0_ptr;
    output reg[2:0] fifo_1_ptr;
    output reg[2:0] fifo_2_ptr;
    output reg[2:0] fifo_3_ptr;
    output reg[2:0] fifo_4_ptr;
    output reg[2:0] fifo_5_ptr;
    output reg[2:0] fifo_6_ptr;
    output reg[2:0] fifo_7_ptr;
    output reg fifo_rd;
    input clk;
    input rst;
    input [7:0] fifo_empty;
    input router_ready;
    input [31:0] fifo_0_snoop; //snoops the destination tags, the bus is split into 4 bit segmeents (tag) for eacch fifo index [7:0]
    input [31:0] fifo_1_snoop;
    input [31:0] fifo_2_snoop;
    input [31:0] fifo_3_snoop;
    input [31:0] fifo_4_snoop;
    input [31:0] fifo_5_snoop;
    input [31:0] fifo_6_snoop;
    input [31:0] fifo_7_snoop;
    output reg ready;
    
    integer i;
    integer j;
    reg [13:0] tmp;
    reg [7:0] port_mask;
    
    always @(posedge clk)begin
    
        if (~(&fifo_empty)) begin //data present
            port_mask = 14'd0;
            for(j = 0 ; j < 8 ; j = j + 1)begin
                tmp = anti_holb(j, port_mask, fifo_0_snoop, fifo_1_snoop, fifo_2_snoop, fifo_3_snoop, fifo_4_snoop, fifo_5_snoop, fifo_6_snoop, fifo_7_snoop);
                port_mask = tmp[7:0];
                case (tmp[10:8])
                    3'd0: fifo_0_ptr = tmp[13:11];
                    3'd1: fifo_1_ptr = tmp[13:11];
                    3'd2: fifo_2_ptr = tmp[13:11];
                    3'd3: fifo_3_ptr = tmp[13:11];
                    3'd4: fifo_4_ptr = tmp[13:11];
                    3'd5: fifo_5_ptr = tmp[13:11];
                    3'd6: fifo_6_ptr = tmp[13:11];
                    3'd7: fifo_7_ptr = tmp[13:11];
                endcase
            end//for
            ready = 1;
        end//rst
    end//posedge clk
    
    function automatic [13:0] anti_holb; //[13:11] is the fifo index, [10:8] is the fifo to select, [7:0] is the NEW mask
        input [2:0] port;
        input [7:0] mask;
        input [31:0] snoop_0, snoop_1, snoop_2, snoop_3, snoop_4, snoop_5, snoop_6, snoop_7;
        reg hit_0, hit_1, hit_2, hit_3, hit_4, hit_5, hit_6, hit_7;
        reg flag;
        begin
        flag = 0;
            for(i = 0 ; i < 8 ; i = i + 1)begin
                case (i)
                0: begin
                    if ((snoop_0[`TAG0] && port) && ~mask[0] && ~snoop_0[`EN0] && ~flag) begin
                        anti_holb = {i, 3'd0, (mask | 8'b0000_0000)}; 
                        flag = 1;
                    end else if ((snoop_1[`TAG0] && port) && ~mask[1] && ~snoop_1[`EN0] && ~flag) begin
                        anti_holb = {i, 3'd1, (mask | 8'b0000_0010)}; 
                        flag = 1;
                    end else if ((snoop_2[`TAG0] && port) && ~mask[2] && ~snoop_2[`EN0] && ~flag) begin
                        anti_holb = {i, 3'd2, (mask | 8'b0000_0100)}; 
                        flag = 1;
                    end else if ((snoop_3[`TAG0] && port) && ~mask[3] && ~snoop_3[`EN0] && ~flag) begin
                        anti_holb = {i, 3'd3, (mask | 8'b0000_1000)}; 
                        flag = 1;
                    end else if ((snoop_4[`TAG0] && port) && ~mask[4] && ~snoop_4[`EN0] && ~flag) begin
                        anti_holb = {i, 3'd4, (mask | 8'b0001_0000)}; 
                        flag = 1;
                    end else if ((snoop_5[`TAG0] && port) && ~mask[5] && ~snoop_5[`EN0] && ~flag) begin
                        anti_holb = {i, 3'd5, (mask | 8'b0010_0000)}; 
                        flag = 1;
                    end else if ((snoop_6[`TAG0] && port) && ~mask[6] && ~snoop_6[`EN0] && ~flag) begin
                        anti_holb = {i, 3'd6, (mask | 8'b0100_0000)}; 
                        flag = 1;
                    end else if ((snoop_7[`TAG0] && port) && ~mask[7] && ~snoop_7[`EN0] && ~flag) begin
                        anti_holb = {i, 3'd7, (mask | 8'b1000_0000)}; 
                        flag = 1;
                    end //if 
                   end //case begin
               1:  begin
                    if ((snoop_0[`TAG1] && port) && ~mask[0] && ~snoop_0[`EN1] && ~flag) begin
                        anti_holb = {i, 3'd0, (mask | 8'b0000_0000)}; 
                        flag = 1;
                    end else if ((snoop_1[`TAG1] && port) && ~mask[1] && ~snoop_1[`EN1] && ~flag) begin
                        anti_holb = {i, 3'd1, (mask | 8'b0000_0010)}; 
                        flag = 1;
                    end else if ((snoop_2[`TAG1] && port) && ~mask[2] && ~snoop_2[`EN1] && ~flag) begin
                        anti_holb = {i, 3'd2, (mask | 8'b0000_0100)}; 
                        flag = 1;
                    end else if ((snoop_3[`TAG1] && port) && ~mask[3] && ~snoop_3[`EN1] && ~flag) begin
                        anti_holb = {i, 3'd3, (mask | 8'b0000_1000)}; 
                        flag = 1;
                    end else if ((snoop_4[`TAG1] && port) && ~mask[4] && ~snoop_4[`EN1] && ~flag) begin
                        anti_holb = {i, 3'd4, (mask | 8'b0001_0000)}; 
                        flag = 1;
                    end else if ((snoop_5[`TAG1] && port) && ~mask[5] && ~snoop_5[`EN1] && ~flag) begin
                        anti_holb = {i, 3'd5, (mask | 8'b0010_0000)}; 
                        flag = 1;
                    end else if ((snoop_6[`TAG1] && port) && ~mask[6] && ~snoop_6[`EN1] && ~flag) begin
                        anti_holb = {i, 3'd6, (mask | 8'b0100_0000)}; 
                        flag = 1;
                    end else if ((snoop_7[`TAG1] && port) && ~mask[7] && ~snoop_7[`EN1] && ~flag) begin
                        anti_holb = {i, 3'd7, (mask | 8'b1000_0000)}; 
                        flag = 1;
                    end //if 
                   end //case begin
               2:  begin
                    if ((snoop_0[`TAG2] && port) && ~mask[0] && ~snoop_0[`EN2] && ~flag) begin
                        anti_holb = {i, 3'd0, (mask | 8'b0000_0000)}; 
                        flag = 1;
                    end else if ((snoop_1[`TAG2] && port) && ~mask[1] && ~snoop_1[`EN2] && ~flag) begin
                        anti_holb = {i, 3'd1, (mask | 8'b0000_0010)}; 
                        flag = 1;
                    end else if ((snoop_2[`TAG2] && port) && ~mask[2] && ~snoop_2[`EN2] && ~flag) begin
                        anti_holb = {i, 3'd2, (mask | 8'b0000_0100)}; 
                        flag = 1;
                    end else if ((snoop_3[`TAG2] && port) && ~mask[3] && ~snoop_3[`EN2] && ~flag) begin
                        anti_holb = {i, 3'd3, (mask | 8'b0000_1000)}; 
                        flag = 1;
                    end else if ((snoop_4[`TAG2] && port) && ~mask[4] && ~snoop_4[`EN2] && ~flag) begin
                        anti_holb = {i, 3'd4, (mask | 8'b0001_0000)}; 
                        flag = 1;
                    end else if ((snoop_5[`TAG2] && port) && ~mask[5] && ~snoop_5[`EN2] && ~flag) begin
                        anti_holb = {i, 3'd5, (mask | 8'b0010_0000)}; 
                        flag = 1;
                    end else if ((snoop_6[`TAG2] && port) && ~mask[6] && ~snoop_6[`EN2] && ~flag) begin
                        anti_holb = {i, 3'd6, (mask | 8'b0100_0000)}; 
                        flag = 1;
                    end else if ((snoop_7[`TAG2] && port) && ~mask[7] && ~snoop_7[`EN2] && ~flag) begin
                        anti_holb = {i, 3'd7, (mask | 8'b1000_0000)}; 
                        flag = 1;
                    end //if 
                   end //case begin
               3: begin
                    if ((snoop_0[`TAG3] && port) && ~mask[0] && ~snoop_0[`EN3] && ~flag) begin
                        anti_holb = {i, 3'd0, (mask | 8'b0000_0000)}; 
                        flag = 1;
                    end else if ((snoop_1[`TAG3] && port) && ~mask[1] && ~snoop_1[`EN3] && ~flag) begin
                        anti_holb = {i, 3'd1, (mask | 8'b0000_0010)}; 
                        flag = 1;
                    end else if ((snoop_2[`TAG3] && port) && ~mask[2] && ~snoop_2[`EN3] && ~flag) begin
                        anti_holb = {i, 3'd2, (mask | 8'b0000_0100)}; 
                        flag = 1;
                    end else if ((snoop_3[`TAG3] && port) && ~mask[3] && ~snoop_3[`EN3] && ~flag) begin
                        anti_holb = {i, 3'd3, (mask | 8'b0000_1000)}; 
                        flag = 1;
                    end else if ((snoop_4[`TAG3] && port) && ~mask[4] && ~snoop_4[`EN3] && ~flag) begin
                        anti_holb = {i, 3'd4, (mask | 8'b0001_0000)}; 
                        flag = 1;
                    end else if ((snoop_5[`TAG3] && port) && ~mask[5] && ~snoop_5[`EN3] && ~flag) begin
                        anti_holb = {i, 3'd5, (mask | 8'b0010_0000)}; 
                        flag = 1;
                    end else if ((snoop_6[`TAG3] && port) && ~mask[6] && ~snoop_6[`EN3] && ~flag) begin
                        anti_holb = {i, 3'd6, (mask | 8'b0100_0000)}; 
                        flag = 1;
                    end else if ((snoop_7[`TAG3] && port) && ~mask[7] && ~snoop_7[`EN3] && ~flag) begin
                        anti_holb = {i, 3'd7, (mask | 8'b1000_0000)}; 
                        flag = 1;
                    end //if 
                   end //case begin
               4: begin
                    if ((snoop_0[`TAG4] && port) && ~mask[0] && ~snoop_0[`EN4] && ~flag) begin
                        anti_holb = {i, 3'd0, (mask | 8'b0000_0000)}; 
                        flag = 1;
                    end else if ((snoop_1[`TAG4] && port) && ~mask[1] && ~snoop_1[`EN4] && ~flag) begin
                        anti_holb = {i, 3'd1, (mask | 8'b0000_0010)}; 
                        flag = 1;
                    end else if ((snoop_2[`TAG4] && port) && ~mask[2] && ~snoop_2[`EN4] && ~flag) begin
                        anti_holb = {i, 3'd2, (mask | 8'b0000_0100)}; 
                        flag = 1;
                    end else if ((snoop_3[`TAG4] && port) && ~mask[3] && ~snoop_3[`EN4] && ~flag) begin
                        anti_holb = {i, 3'd3, (mask | 8'b0000_1000)}; 
                        flag = 1;
                    end else if ((snoop_4[`TAG4] && port) && ~mask[4] && ~snoop_4[`EN4] && ~flag) begin
                        anti_holb = {i, 3'd4, (mask | 8'b0001_0000)}; 
                        flag = 1;
                    end else if ((snoop_5[`TAG4] && port) && ~mask[5] && ~snoop_5[`EN4] && ~flag) begin
                        anti_holb = {i, 3'd5, (mask | 8'b0010_0000)}; 
                        flag = 1;
                    end else if ((snoop_6[`TAG4] && port) && ~mask[6] && ~snoop_6[`EN4] && ~flag) begin
                        anti_holb = {i, 3'd6, (mask | 8'b0100_0000)}; 
                        flag = 1;
                    end else if ((snoop_7[`TAG4] && port) && ~mask[7] && ~snoop_7[`EN4] && ~flag) begin
                        anti_holb = {i, 3'd7, (mask | 8'b1000_0000)}; 
                        flag = 1;
                    end //if 
                   end //case begin
               5: begin
                    if ((snoop_0[`TAG5] && port) && ~mask[0] && ~snoop_0[`EN5] && ~flag) begin
                        anti_holb = {i, 3'd0, (mask | 8'b0000_0000)}; 
                        flag = 1;
                    end else if ((snoop_1[`TAG5] && port) && ~mask[1] && ~snoop_1[`EN5] && ~flag) begin
                        anti_holb = {i, 3'd1, (mask | 8'b0000_0010)}; 
                        flag = 1;
                    end else if ((snoop_2[`TAG5] && port) && ~mask[2] && ~snoop_2[`EN5] && ~flag) begin
                        anti_holb = {i, 3'd2, (mask | 8'b0000_0100)}; 
                        flag = 1;
                    end else if ((snoop_3[`TAG5] && port) && ~mask[3] && ~snoop_3[`EN5] && ~flag) begin
                        anti_holb = {i, 3'd3, (mask | 8'b0000_1000)}; 
                        flag = 1;
                    end else if ((snoop_4[`TAG5] && port) && ~mask[4] && ~snoop_4[`EN5] && ~flag) begin
                        anti_holb = {i, 3'd4, (mask | 8'b0001_0000)}; 
                        flag = 1;
                    end else if ((snoop_5[`TAG5] && port) && ~mask[5] && ~snoop_5[`EN5] && ~flag) begin
                        anti_holb = {i, 3'd5, (mask | 8'b0010_0000)}; 
                        flag = 1;
                    end else if ((snoop_6[`TAG5] && port) && ~mask[6] && ~snoop_6[`EN5] && ~flag) begin
                        anti_holb = {i, 3'd6, (mask | 8'b0100_0000)}; 
                        flag = 1;
                    end else if ((snoop_7[`TAG5] && port) && ~mask[7] && ~snoop_7[`EN5] && ~flag) begin
                        anti_holb = {i, 3'd7, (mask | 8'b1000_0000)}; 
                        flag = 1;
                    end //if 
                   end //case begin
               6: begin
                    if ((snoop_0[`TAG6] && port) && ~mask[0] && ~snoop_0[`EN6] && ~flag) begin
                        anti_holb = {i, 3'd0, (mask | 8'b0000_0000)}; 
                        flag = 1;
                    end else if ((snoop_1[`TAG6] && port) && ~mask[1] && ~snoop_1[`EN6] && ~flag) begin
                        anti_holb = {i, 3'd1, (mask | 8'b0000_0010)}; 
                        flag = 1;
                    end else if ((snoop_2[`TAG6] && port) && ~mask[2] && ~snoop_2[`EN6] && ~flag) begin
                        anti_holb = {i, 3'd2, (mask | 8'b0000_0100)}; 
                        flag = 1;
                    end else if ((snoop_3[`TAG6] && port) && ~mask[3] && ~snoop_3[`EN6] && ~flag) begin
                        anti_holb = {i, 3'd3, (mask | 8'b0000_1000)}; 
                        flag = 1;
                    end else if ((snoop_4[`TAG6] && port) && ~mask[4] && ~snoop_4[`EN6] && ~flag) begin
                        anti_holb = {i, 3'd4, (mask | 8'b0001_0000)}; 
                        flag = 1;
                    end else if ((snoop_5[`TAG6] && port) && ~mask[5] && ~snoop_5[`EN6] && ~flag) begin
                        anti_holb = {i, 3'd5, (mask | 8'b0010_0000)}; 
                        flag = 1;
                    end else if ((snoop_6[`TAG6] && port) && ~mask[6] && ~snoop_6[`EN6] && ~flag) begin
                        anti_holb = {i, 3'd6, (mask | 8'b0100_0000)}; 
                        flag = 1;
                    end else if ((snoop_7[`TAG6] && port) && ~mask[7] && ~snoop_7[`EN6] && ~flag) begin
                        anti_holb = {i, 3'd7, (mask | 8'b1000_0000)}; 
                        flag = 1;
                    end //if 
                   end //case begin
               7: begin
                    if ((snoop_0[`TAG7] && port) && ~mask[0] && ~snoop_0[`EN7] && ~flag) begin
                        anti_holb = {i, 3'd0, (mask | 8'b0000_0000)}; 
                        flag = 1;
                    end else if ((snoop_1[`TAG7] && port) && ~mask[1] && ~snoop_1[`EN7] && ~flag) begin
                        anti_holb = {i, 3'd1, (mask | 8'b0000_0010)}; 
                        flag = 1;
                    end else if ((snoop_2[`TAG7] && port) && ~mask[2] && ~snoop_2[`EN7] && ~flag) begin
                        anti_holb = {i, 3'd2, (mask | 8'b0000_0100)}; 
                        flag = 1;
                    end else if ((snoop_3[`TAG7] && port) && ~mask[3] && ~snoop_3[`EN7] && ~flag) begin
                        anti_holb = {i, 3'd3, (mask | 8'b0000_1000)}; 
                        flag = 1;
                    end else if ((snoop_4[`TAG7] && port) && ~mask[4] && ~snoop_4[`EN7] && ~flag) begin
                        anti_holb = {i, 3'd4, (mask | 8'b0001_0000)}; 
                        flag = 1;
                    end else if ((snoop_5[`TAG7] && port) && ~mask[5] && ~snoop_5[`EN7] && ~flag) begin
                        anti_holb = {i, 3'd5, (mask | 8'b0010_0000)}; 
                        flag = 1;
                    end else if ((snoop_6[`TAG7] && port) && ~mask[6] && ~snoop_6[`EN7] && ~flag) begin
                        anti_holb = {i, 3'd6, (mask | 8'b0100_0000)}; 
                        flag = 1;
                    end else if ((snoop_7[`TAG7] && port) && ~mask[7] && ~snoop_7[`EN7] && ~flag) begin
                        anti_holb = {i, 3'd7, (mask | 8'b1000_0000)}; 
                        flag = 1;
                    end //if 
                   end //case begin
               endcase
            end//for
        end
    endfunction //anti holb
    
    
    
    
    
endmodule

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/09/2020 10:00:04 PM
// Design Name: 
// Module Name: routingCache
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: you having a brain 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////
module routingCache(
    clk, rst, wr, val, tag,
    vld, cfg
    );
    
    input clk;
    input rst;
    input wr;
    input [19:0] val; //switch cfg
    input [23:0] tag; //requested cfg
    
    output vld;
    output reg [19:0] cfg;
    
    //[43:20]tag [19:0]cfg_entry
    reg [43:0] entry [7:0];
    reg [2:0] count;
    integer i;
    
    always @(posedge clk)begin
        if(rst)begin //sync reset
            for(i = 0 ; i < 8 ; i = i + 1) begin
                entry[i] <= 44'd0;
                count <= 3'd0;
            end//for
        end else begin //rst not asserted
            if (wr) begin //write
                case (count)
                    3'd0: entry[0] <= {tag, val};
                    3'd1: entry[1] <= {tag, val};
                    3'd2: entry[2] <= {tag, val};
                    3'd3: entry[3] <= {tag, val};
                    3'd4: entry[4] <= {tag, val};
                    3'd5: entry[5] <= {tag, val};
                    3'd6: entry[6] <= {tag, val};
                    3'd7: entry[7] <= {tag, val};
                endcase
                count <= (count + 1) % 8;
            end else begin //read
                if (tag & entry[0][43:20]) begin
                    cfg <= entry[0][19:0];
                end else if (tag & entry[1][43:20]) begin
                    cfg <= entry[1][19:0];
                end else if (tag & entry[2][43:20]) begin
                    cfg <= entry[2][19:0];
                end else if (tag & entry[3][43:20]) begin
                    cfg <= entry[3][19:0];
                end else if (tag & entry[4][43:20]) begin
                    cfg <= entry[4][19:0];
                end else if (tag & entry[5][43:20]) begin
                    cfg <= entry[5][19:0];
                end else if (tag & entry[6][43:20]) begin
                    cfg <= entry[6][19:0];
                end else if (tag & entry[7][43:20]) begin
                    cfg <= entry[7][19:0];
                end//entry lookup 
            end //if wr
        end//if rst
    end//clk
endmodule

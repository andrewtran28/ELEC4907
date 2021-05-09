`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/09/2020 10:00:04 PM
// Design Name: 
// Module Name: activationFunction
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

module activationFunction(
        clk, rst, wr, index, val, store_val, boundary_val, en, 
        out_coef, out_bias
    );
    
    input clk;
    input rst;
    input wr;
    input [3:0] index;
    input [15:0] val;
    //32b input when loading in the entries (16b for coef., 16b for bias)
    input [31:0] store_val;
    input [15:0] boundary_val;
    input en;
    output reg [15:0] out_coef;
    output reg [15:0] out_bias;
    
    //entry is 2 16b floating point values, 1 is the coeficient to multiply by, 1 is the bias to add to
    reg [31:0] entry [15:0];
    //holds boundary values 
    reg [15:0] boundary [15:0]; 
    wire sign;
    wire [4:0] exponent;
    wire [9:0] fraction;
    assign sign = val[15];
    assign exponent = val[14:10];
    assign fraction = val[9:0];
    integer i;
    integer ii;
    integer iii;
    
    //bit1 is if the exponent is larger, bit0 is if the fraction is larger
    reg [1:0]boundary_flags [15:0];
    always @(*)begin
        for (ii = 0; ii < 16; ii = ii + 1)begin
            boundary_flags[i] <= 2'd0;
            if(exponent > entry[i][30:26]) boundary_flags[i][1] <= 1;
            if(fraction > entry[i][25:16]) boundary_flags[i][0] <= 1;
        end//for
    end//always comb
    
    always @(posedge clk) begin
        if(rst) begin
            entry [i] <= 32'd0;        
        end else begin //reset not asserted
            if (en) begin
               if (wr) begin    
                    for(i = 0 ; i < 16 ; i = i + 1)begin
                        if(i == index)begin
                            entry[i] <= store_val;
                            boundary[i] <= boundary_val;
                        end//if
                    end//for
               end else begin //read
                    if(sign)begin //negative val
                        out_coef <= entry[0][31:16];
                        out_bias <= entry[0][15:0];
                        for (iii = 1; iii < 16 ; iii = iii + 1)begin
                            if(boundary_flags[iii])begin
                                out_coef <= entry[iii][31:16];
                                out_bias <= entry[iii][15:0];
                            end//if
                        end//for
                    end else begin //positive val
                        out_coef <= entry[15][31:16];
                        out_bias <= entry[15][15:0];
                        for (iii = 14; iii >= 0 ; iii = iii - 1)begin
                            if(boundary_flags[iii])begin
                                out_coef <= entry[iii][31:16];
                                out_bias <= entry[iii][15:0];
                            end//if
                        end//for
                    end//if  sign
               end //wr
            end//en
        end //rst
    end //posedge clk
    
endmodule

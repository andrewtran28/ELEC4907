module fma_normalizer_rounder
(
mantissa_ab_c_in,
exp_ab_c_in,
mantissa_shift,
mantissa_ab_c_out,
exp_ab_c_out
);
// Input port declarations
input [21:0] mantissa_ab_c_in;
input [4:0]  exp_ab_c_in;
input [4:0]  mantissa_shift;
// Output port declarations
output [9:0] mantissa_ab_c_out;
output [4:0] exp_ab_c_out;
// Wire declarations
wire [21:0] mantissa_ab_c_in;
wire [4:0]  exp_ab_c_in;
wire [4:0]  mantissa_shift;
wire [9:0]  mantissa_ab_c_out;
wire [4:0]  exp_ab_c_out;
reg [21:0] mantissa_ab_c;
reg [10:0] mantissa_ab_c_rnd;
reg [4:0]  exp_ab_c;
reg [4:0]  true_shift;
reg        ones_found;
integer    i;
assign mantissa_ab_c_out = mantissa_ab_c_rnd[9:0];
assign exp_ab_c_out      = exp_ab_c + mantissa_ab_c_rnd[10];
always @(*) begin
mantissa_ab_c = mantissa_ab_c_in;
exp_ab_c      = exp_ab_c_in;
true_shift = (~exp_ab_c_in) ? 5'b0 : mantissa_shift;
if (mantissa_ab_c_in[21]) begin
mantissa_ab_c = mantissa_ab_c_in >> 1'd1;
exp_ab_c      = exp_ab_c_in + 1'd1;
end
else if (~mantissa_ab_c_in[21] & ~mantissa_ab_c_in[20]) begin
mantissa_ab_c = mantissa_ab_c_in << true_shift;
exp_ab_c      = exp_ab_c_in - true_shift;
end
else begin
mantissa_ab_c = mantissa_ab_c_in;
exp_ab_c      = exp_ab_c_in;
end
for (i=8; i>=0; i=i-1) begin
ones_found = |mantissa_ab_c[i];
end
if (mantissa_ab_c[10] & mantissa_ab_c[9] & ~ones_found) begin
mantissa_ab_c_rnd = kogge_stone_adder(mantissa_ab_c[19:10], 1'b1);
end
else if (mantissa_ab_c[9] & ones_found) begin
mantissa_ab_c_rnd = kogge_stone_adder(mantissa_ab_c[19:10], 1'b1);
end
else begin
mantissa_ab_c_rnd = {1'b0, mantissa_ab_c[19:10]};
end
end
function automatic [10:0] kogge_stone_adder;
input [9:0] a, b;
reg [3:0][9:0] gp;
reg [2:0][9:0] pp;
reg [9:0]      c, p, g;
integer        i;
begin
// 10-bit Kogge-Stone Adder
for (i=0; i<10; i=i+1) begin
p[i] = a[i]^b[i];
g[i] = a[i]&b[i];
end
pp[0][0] = p[0];
gp[0][0] = g[0];
for (i=1; i<10; i=i+1) begin
pp[0][i] = p[i]&p[i-1];
gp[0][i] = (p[i]&g[i-1])|g[i];
end
pp[1][0] = pp[0][0];
pp[1][1] = pp[0][1];
gp[1][0] = gp[0][0];
gp[1][1] = gp[0][1];
for (i=2; i<10; i=i+1) begin
pp[1][i] = pp[0][i]&pp[0][i-2];
gp[1][i] = (pp[0][i]&gp[0][i-2])|gp[0][i];
end
pp[2][0] = gp[1][0];
pp[2][1] = gp[1][1];
pp[2][2] = gp[1][2];
pp[2][3] = gp[1][3];
gp[2][0] = gp[1][0];
gp[2][1] = gp[1][1];
gp[2][2] = gp[1][2];
gp[2][3] = gp[1][3];
for (i=4; i<10; i=i+1) begin
pp[2][i] = pp[1][i]&pp[1][i-4];
gp[2][i] = (pp[1][i]&gp[1][i-4])|gp[1][i];
end
gp[3][0] = gp[2][0];
gp[3][1] = gp[2][1];
gp[3][2] = gp[2][2];
gp[3][3] = gp[2][3];
gp[3][4] = gp[2][4];
gp[3][5] = gp[2][5];
gp[3][6] = gp[2][6];
gp[3][7] = gp[2][7];
for (i=8; i<10; i=i+1) begin
gp[3][i] = (pp[2][i]&gp[2][i-8])|gp[2][i];
end
kogge_stone_adder[0] = p[0];
c[0]                 = gp[3][0];
for (i=1; i<10; i=i+1) begin
kogge_stone_adder[i] = p[i]^c[i-1];
c[i]                 = gp[3][i];
end
kogge_stone_adder[10] = c[9];
end
endfunction // kogge_stone_adder
endmodule // fma_normalizer_rounder
module fma_aligner_adder
(
mantissa_ab,
exp_ab,
sign_ab,
c,
exp_diff,
exp_ab_greater,
exp_ab_less,
mantissa_ab_c,
exp_ab_c,
sign_ab_c,
mantissa_shift
);
// Input port declarations
input [19:0] mantissa_ab;
input [4:0]  exp_ab;
input        sign_ab;
input [15:0] c;
input [4:0]  exp_diff;
input        exp_ab_greater;
input        exp_ab_less;
// Output port declarations
output     [21:0] mantissa_ab_c;
output reg [4:0]  exp_ab_c;
output reg        sign_ab_c;
output     [4:0]  mantissa_shift;
reg [21:0] full_mantissa_ab;
reg [21:0] full_mantissa_c;
reg [21:0] comp_mantissa_ab;
reg [21:0] comp_mantissa_c;
reg [21:0] sum_mantissa_ab_c;
assign mantissa_ab_c = sum_mantissa_ab_c;
always @(*) begin
full_mantissa_ab = (exp_ab == 5'b0) ? {2'b00, mantissa_ab} : {2'b01, mantissa_ab};
full_mantissa_c  = (c[14:10] == 5'b0) ? {2'b00, c[9:0], {10{1'b0}}} : {2'b01, c[9:0], {10{1'b0}}};
comp_mantissa_ab = (exp_ab == 5'b0) ? {2'b00, mantissa_ab} : {2'b01, mantissa_ab};
comp_mantissa_c  = (c[14:10] == 5'b0) ? {2'b00, c[9:0], {10{1'b0}}} : {2'b01, c[9:0], {10{1'b0}}};
if (exp_ab_greater) begin
exp_ab_c        = exp_ab;
full_mantissa_c = full_mantissa_c >> exp_diff;
end
else if (exp_ab_less) begin
exp_ab_c         = c[14:10];
full_mantissa_ab = full_mantissa_ab >> exp_diff;
end
else begin
exp_ab_c = exp_ab;
end
case ({sign_ab, c[15]})
2'b00: begin
comp_mantissa_ab = full_mantissa_ab;
comp_mantissa_c  = full_mantissa_c;
sign_ab_c        = 1'b0;
end
2'b10: begin
comp_mantissa_ab = kogge_stone_adder((~full_mantissa_ab), 22'h1);
comp_mantissa_c  = full_mantissa_c;
if (exp_ab_greater) begin
sign_ab_c = 1'b1;
end
else if (exp_ab_less) begin
sign_ab_c = 1'b0;
end
else begin
if (mantissa_ab[9:0] > c[9:0]) begin
sign_ab_c = 1'b1;
end
else begin
sign_ab_c = 1'b0;
end
end
end
2'b01: begin
comp_mantissa_ab = full_mantissa_ab;
comp_mantissa_c  = kogge_stone_adder((~full_mantissa_c), 22'h1);
if (exp_ab_greater) begin
sign_ab_c = 1'b0;
end
else if (exp_ab_less) begin
sign_ab_c = 1'b1;
end
else begin
if (mantissa_ab[9:0] > c[9:0]) begin
sign_ab_c = 1'b0;
end
else begin
sign_ab_c = 1'b1;
end
end
end
2'b11: begin
comp_mantissa_ab = kogge_stone_adder((~full_mantissa_ab), 22'h1);
comp_mantissa_c  = kogge_stone_adder((~full_mantissa_c), 22'h1);
sign_ab_c        = 1'b1;
end
default: begin
comp_mantissa_ab = full_mantissa_ab;
comp_mantissa_c  = full_mantissa_c;
sign_ab_c        = 1'b0;
end
endcase // case ({sign_ab, c[15]})
sum_mantissa_ab_c = kogge_stone_adder(comp_mantissa_ab, comp_mantissa_c);
if (sum_mantissa_ab_c[21]) begin
sum_mantissa_ab_c = kogge_stone_adder((~sum_mantissa_ab_c), 22'h1);
end
end
fma_lza fma_lza_i
(
// Output
.mantissa_shift (mantissa_shift),
// Inputs
.mantissa_ab    (comp_mantissa_ab),
.mantissa_c     (comp_mantissa_c),
.exp_ab_greater (exp_ab_greater),
.exp_ab_less    (exp_ab_less),
.sign_ab        (sign_ab),
.sign_c         (c[15]));
function automatic [21:0] kogge_stone_adder;
input [21:0]      a,b;
reg   [4:0][21:0] gp;
reg   [3:0][21:0] pp;
reg   [21:0]      c, p, g;
integer           i;
begin
// 22-bit Kogge-Stone Adder
for (i=0; i<22; i=i+1) begin
p[i] = a[i]^b[i];
g[i] = a[i]&b[i];
end
pp[0][0] = p[0];
gp[0][0] = g[0];
for (i=1; i<22; i=i+1) begin
pp[0][i] = p[i]&p[i-1];
gp[0][i] = (p[i]&g[i-1])|g[i];
end
pp[1][0] = pp[0][0];
pp[1][1] = pp[0][1];
gp[1][0] = gp[0][0];
gp[1][1] = gp[0][1];
for (i=2; i<22; i=i+1) begin
pp[1][i] = pp[0][i]&pp[0][i-2];
gp[1][i] = (pp[0][i]&gp[0][i-2])|gp[0][i];
end
pp[2][0] = gp[1][0];
pp[2][1] = gp[1][1];
pp[2][2] = gp[1][2];
pp[2][3] = gp[1][3];
gp[2][0] = gp[1][0];
gp[2][1] = gp[1][1];
gp[2][2] = gp[1][2];
gp[2][3] = gp[1][3];
for (i=4; i<22; i=i+1) begin
pp[2][i] = pp[1][i]&pp[1][i-4];
gp[2][i] = (pp[1][i]&gp[1][i-4])|gp[1][i];
end
pp[3][0] = pp[2][0];
pp[3][1] = pp[2][1];
pp[3][2] = pp[2][2];
pp[3][3] = pp[2][3];
pp[3][4] = pp[2][4];
pp[3][5] = pp[2][5];
pp[3][6] = pp[2][6];
pp[3][7] = pp[2][7];
gp[3][0] = gp[2][0];
gp[3][1] = gp[2][1];
gp[3][2] = gp[2][2];
gp[3][3] = gp[2][3];
gp[3][4] = gp[2][4];
gp[3][5] = gp[2][5];
gp[3][6] = gp[2][6];
gp[3][7] = gp[2][7];
for (i=8; i<22; i=i+1) begin
pp[3][i] = pp[2][i]&pp[2][i-8];
gp[3][i] = (pp[2][i]&gp[2][i-8])|gp[2][i];
end
gp[4][0]  = gp[3][0];
gp[4][1]  = gp[3][1];
gp[4][2]  = gp[3][2];
gp[4][3]  = gp[3][3];
gp[4][4]  = gp[3][4];
gp[4][5]  = gp[3][5];
gp[4][6]  = gp[3][6];
gp[4][7]  = gp[3][7];
gp[4][8]  = gp[3][8];
gp[4][9]  = gp[3][9];
gp[4][10] = gp[3][10];
gp[4][11] = gp[3][11];
gp[4][12] = gp[3][12];
gp[4][13] = gp[3][13];
gp[4][14] = gp[3][14];
gp[4][15] = gp[3][15];
for (i=16; i<22; i=i+1) begin
gp[4][i] = (pp[3][i]&gp[3][i-16])|gp[3][i];
end
kogge_stone_adder[0] = p[0];
c[0]                 = gp[4][0];
for (i=1; i<22; i=i+1) begin
kogge_stone_adder[i] = p[i]^c[i-1];
c[i]                 = gp[4][i];
end
end
endfunction // kogge_stone_adder
endmodule // fma_aligner_adder
module fma_mult_tree
(
mantissa_a,
mantissa_b,
sign_a,
sign_b,
mantissa_ab,
sign_ab
);
// Input port declarations
input [9:0] mantissa_a;
input [9:0] mantissa_b;
input       sign_a;
input       sign_b;
// Output port declarations
output reg [19:0] mantissa_ab;
output            sign_ab;
reg [19:0]      x;
reg [9:0]       y;
reg [19:0]      pp0;
reg [17:0]      pp1;
reg [15:0]      pp2;
reg [13:0]      pp3;
reg [11:0]      pp4;
reg [9:0]       pp5;
reg [19:0]      int1, int2, p, g, c;
reg [4:0][19:0] gp;
reg [3:0][19:0] pp;
reg [62:0][1:0] s;
integer         i;
assign sign_ab = sign_a ^ sign_b;
always @(*) begin
x = {{10{1'b0}}, mantissa_a};
y = mantissa_b;
// Partial products
pp0 = ((({20{y[0]^1'b0}} & x) | ({20{y[1]&~y[0]}} & {x[18:0],1'b0})) ^ {20{y[1]}}) + y[1];
pp1 = ((({18{y[2]^y[1]}} & x[17:0]) | ({18{(~y[3]&y[2]&y[1])|(y[3]&~y[2]&~y[1])}} & {x[16:0],1'b0})) ^ {18{y[3]}}) + y[3];
pp2 = ((({16{y[4]^y[3]}} & x[15:0]) | ({16{(~y[5]&y[4]&y[3])|(y[5]&~y[4]&~y[3])}} & {x[14:0],1'b0})) ^ {16{y[5]}}) + y[5];
pp3 = ((({14{y[6]^y[5]}} & x[13:0]) | ({14{(~y[7]&y[6]&y[5])|(y[7]&~y[6]&~y[5])}} & {x[12:0],1'b0})) ^ {14{y[7]}}) + y[7];
pp4 = ((({12{y[8]^y[7]}} & x[11:0]) | ({12{(~y[9]&y[8]&y[7])|(y[9]&~y[8]&~y[7])}} & {x[10:0],1'b0})) ^ {12{y[9]}}) + y[9];
pp5 = {10{y[9]}} & x[9:0];
// Wallace tree reduction layer 1
s[0]  = pp0[2]+pp1[0];
s[1]  = pp0[3]+pp1[1];
s[2]  = pp0[4]+pp1[2]+pp2[0];
s[3]  = pp0[5]+pp1[3]+pp2[1];
s[4]  = pp0[6]+pp1[4]+pp2[2];
s[5]  = pp0[7]+pp1[5]+pp2[3];
s[6]  = pp0[8]+pp1[6]+pp2[4];
s[7]  = pp3[2]+pp4[0];
s[8]  = pp0[9]+pp1[7]+pp2[5];
s[9]  = pp3[3]+pp4[1];
s[10] = pp0[10]+pp1[8]+pp2[6];
s[11] = pp3[4]+pp4[2]+pp5[0];
s[12] = pp0[11]+pp1[9]+pp2[7];
s[13] = pp3[5]+pp4[3]+pp5[1];
s[14] = pp0[12]+pp1[10]+pp2[8];
s[15] = pp3[6]+pp4[4]+pp5[2];
s[16] = pp0[13]+pp1[11]+pp2[9];
s[17] = pp3[7]+pp4[5]+pp5[3];
s[18] = pp0[14]+pp1[12]+pp2[10];
s[19] = pp3[8]+pp4[6]+pp5[4];
s[20] = pp0[15]+pp1[13]+pp2[11];
s[21] = pp3[9]+pp4[7]+pp5[5];
s[22] = pp0[16]+pp1[14]+pp2[12];
s[23] = pp3[10]+pp4[8]+pp5[6];
s[24] = pp0[17]+pp1[15]+pp2[13];
s[25] = pp3[11]+pp4[9]+pp5[7];
s[26] = pp0[18]+pp1[16]+pp2[14];
s[27] = pp3[12]+pp4[10]+pp5[8];
s[28] = pp0[19]+pp1[17]+pp2[15];
s[29] = pp3[13]+pp4[11]+pp5[9];
// Wallace tree reduction layer 2
s[30] = s[1][0]+s[0][1];
s[31] = s[2][0]+s[1][1];
s[32] = s[3][0]+s[2][1];
s[33] = s[4][0]+s[3][1]+pp3[0];
s[34] = s[5][0]+s[4][1]+pp3[1];
s[35] = s[6][0]+s[7][0]+s[5][1];
s[36] = s[8][0]+s[9][0]+s[6][1];
s[37] = s[10][0]+s[11][0]+s[8][1];
s[38] = s[12][0]+s[13][0]+s[10][1];
s[39] = s[14][0]+s[15][0]+s[12][1];
s[40] = s[16][0]+s[17][0]+s[14][1];
s[41] = s[18][0]+s[19][0]+s[16][1];
s[42] = s[20][0]+s[21][0]+s[18][1];
s[43] = s[22][0]+s[23][0]+s[20][1];
s[44] = s[24][0]+s[25][0]+s[22][1];
s[45] = s[26][0]+s[27][0]+s[24][1];
s[46] = s[28][0]+s[29][0]+s[26][1];
// Wallace tree reduction layer 3
s[47] = s[31][0]+s[30][1];
s[48] = s[32][0]+s[31][1];
s[49] = s[33][0]+s[32][1];
s[50] = s[34][0]+s[33][1];
s[51] = s[35][0]+s[34][1];
s[52] = s[36][0]+s[35][1]+s[7][1];
s[53] = s[37][0]+s[36][1]+s[9][1];
s[54] = s[38][0]+s[37][1]+s[11][1];
s[55] = s[39][0]+s[38][1]+s[13][1];
s[56] = s[40][0]+s[39][1]+s[15][1];
s[57] = s[41][0]+s[40][1]+s[17][1];
s[58] = s[42][0]+s[41][1]+s[19][1];
s[59] = s[43][0]+s[42][1]+s[21][1];
s[60] = s[44][0]+s[43][1]+s[23][1];
s[61] = s[45][0]+s[44][1]+s[25][1];
s[62] = s[46][0]+s[45][1]+s[27][1];
int1 = {s[62][0],s[61][0],s[60][0],s[59][0],s[58][0],s[57][0],s[56][0],s[55][0],s[54][0],s[53][0],s[52][0],s[51][0],s[50][0],s[49][0],s[48][0],s[47][0],s[30][0],s[0][0],pp0[1],pp0[0]};
int2 = {s[61][1],s[60][1],s[59][1],s[58][1],s[57][1],s[56][1],s[55][1],s[54][1],s[53][1],s[52][1],s[51][1],s[50][1],s[49][1],s[48][1],s[47][1],1'b0,1'b0,1'b0,1'b0,1'b0};
// 20-bit Kogge-Stone Adder
for (i=0; i<20; i=i+1) begin
p[i] = int1[i]^int2[i];
g[i] = int1[i]&int2[i];
end
pp[0][0] = p[0];
gp[0][0] = g[0];
for (i=1; i<20; i=i+1) begin
pp[0][i] = p[i]&p[i-1];
gp[0][i] = (p[i]&g[i-1])|g[i];
end
pp[1][0] = pp[0][0];
pp[1][1] = pp[0][1];
gp[1][0] = gp[0][0];
gp[1][1] = gp[0][1];
for (i=2; i<20; i=i+1) begin
pp[1][i] = pp[0][i]&pp[0][i-2];
gp[1][i] = (pp[0][i]&gp[0][i-2])|gp[0][i];
end
pp[2][0] = gp[1][0];
pp[2][1] = gp[1][1];
pp[2][2] = gp[1][2];
pp[2][3] = gp[1][3];
gp[2][0] = gp[1][0];
gp[2][1] = gp[1][1];
gp[2][2] = gp[1][2];
gp[2][3] = gp[1][3];
for (i=4; i<20; i=i+1) begin
pp[2][i] = pp[1][i]&pp[1][i-4];
gp[2][i] = (pp[1][i]&gp[1][i-4])|gp[1][i];
end
pp[3][0] = pp[2][0];
pp[3][1] = pp[2][1];
pp[3][2] = pp[2][2];
pp[3][3] = pp[2][3];
pp[3][4] = pp[2][4];
pp[3][5] = pp[2][5];
pp[3][6] = pp[2][6];
pp[3][7] = pp[2][7];
gp[3][0] = gp[2][0];
gp[3][1] = gp[2][1];
gp[3][2] = gp[2][2];
gp[3][3] = gp[2][3];
gp[3][4] = gp[2][4];
gp[3][5] = gp[2][5];
gp[3][6] = gp[2][6];
gp[3][7] = gp[2][7];
for (i=8; i<20; i=i+1) begin
pp[3][i] = pp[2][i]&pp[2][i-8];
gp[3][i] = (pp[2][i]&gp[2][i-8])|gp[2][i];
end
gp[4][0]  = gp[3][0];
gp[4][1]  = gp[3][1];
gp[4][2]  = gp[3][2];
gp[4][3]  = gp[3][3];
gp[4][4]  = gp[3][4];
gp[4][5]  = gp[3][5];
gp[4][6]  = gp[3][6];
gp[4][7]  = gp[3][7];
gp[4][8]  = gp[3][8];
gp[4][9]  = gp[3][9];
gp[4][10] = gp[3][10];
gp[4][11] = gp[3][11];
gp[4][12] = gp[3][12];
gp[4][13] = gp[3][13];
gp[4][14] = gp[3][14];
gp[4][15] = gp[3][15];
for (i=16; i<20; i=i+1) begin
gp[4][i] = (pp[3][i]&gp[3][i-16])|gp[3][i];
end
mantissa_ab[0] = p[0];
c[0]           = gp[4][0];
for (i=1; i<20; i=i+1) begin
mantissa_ab[i] = p[i]^c[i-1];
c[i]           = gp[4][i];
end
end
endmodule // fma_mult_tree
module fma_exp_diff
(
exp_a,
exp_b,
exp_c,
exp_diff,
exp_ab,
exp_ab_greater,
exp_ab_less
);
// Input port declarations
input [4:0] exp_a;
input [4:0] exp_b;
input [4:0] exp_c;
// Output port declarations
output reg [4:0] exp_diff;
output reg [4:0] exp_ab;
output reg       exp_ab_greater;
output reg       exp_ab_less;
reg [4:0] x;
reg [5:0] sum_exp_ab;
integer   i;
always @(*) begin
sum_exp_ab = kogge_stone_adder(exp_a, exp_b);
exp_ab     = (sum_exp_ab > 'd30) ? 5'b11111 : sum_exp_ab[4:0];
for (i=0; i<5; i=i+1) begin
x[i] = (exp_ab[i] & exp_c[i]) | (~exp_ab[i] & ~exp_c[i]);
end
exp_ab_greater = exp_ab[4]&~exp_c[4] | x[4]&exp_ab[3]&~exp_c[3] | x[4]&x[3]&exp_ab[2]&~exp_c[2] | x[4]&x[3]&x[2]&exp_ab[1]&~exp_c[1] | x[4]&x[3]&x[2]&x[1]&exp_ab[0]&~exp_c[0];
exp_ab_less    = ~exp_ab[4]&exp_c[4] | x[4]&~exp_ab[3]&exp_c[3] | x[4]&x[3]&~exp_ab[2]&exp_c[2] | x[4]&x[3]&x[2]&~exp_ab[1]&exp_c[1] | x[4]&x[3]&x[2]&x[1]&~exp_ab[0]&exp_c[0];
if (exp_ab_greater) begin
exp_diff = kogge_stone_adder(exp_ab, (~exp_c+1));
end
else if (exp_ab_less) begin
exp_diff = kogge_stone_adder(exp_c, (~exp_ab+1));
end
else begin
exp_diff = 5'b0;
end
end
function automatic [5:0] kogge_stone_adder;
input [4:0]     a, b;
reg [4:0][21:0] gp;
reg [3:0][21:0] pp;
reg [21:0]      c, p, g;
integer         i;
begin
for (i=0; i<5; i=i+1) begin
p[i] = a[i]^b[i];
g[i] = a[i]&b[i];
end
pp[0][0] = p[0];
gp[0][0] = g[0];
for (i=1; i<5; i=i+1) begin
pp[0][i] = p[i]&p[i-1];
gp[0][i] = (p[i]&g[i-1])|g[i];
end
pp[1][0] = pp[0][0];
pp[1][1] = pp[0][1];
gp[1][0] = gp[0][0];
gp[1][1] = gp[0][1];
for (i=2; i<5; i=i+1) begin
pp[1][i] = pp[0][i]&pp[0][i-2];
gp[1][i] = (pp[0][i]&gp[0][i-2])|gp[0][i];
end
gp[2][0] = gp[1][0];
gp[2][1] = gp[1][1];
gp[2][2] = gp[1][2];
gp[2][3] = gp[1][3];
gp[2][4] = (pp[1][4]&gp[1][0])|gp[1][4];
kogge_stone_adder[0] = p[0];
c[0]                 = gp[2][0];
for (i=1; i<5; i=i+1) begin
kogge_stone_adder[i] = p[i]^c[i-1];
c[i]                 = gp[2][i];
end
kogge_stone_adder[5] = c[4];
end
endfunction // kogge_stone_adder
endmodule // fma_exp_diff
module fma_top
(
a, // Multiplicand
b, // Multiplier
c, // Value to be added
result
);
// Input port declarations
input [15:0] a;
input [15:0] b;
input [15:0] c;
// Output port declaration
output [15:0] result;
// Wire declarations
wire [15:0] a;
wire [15:0] b;
wire [15:0] c;
wire [15:0] result;
wire [4:0]  exp_diff;
wire [4:0]  exp_ab;
wire        exp_ab_greater;
wire        exp_ab_less;
wire [19:0] mantissa_ab;
wire        sign_ab;
wire [21:0] mantissa_ab_c;
wire [4:0]  exp_ab_c;
wire [4:0]  exp_ab_c_out;
wire [4:0]  mantissa_shift;
fma_exp_diff fma_exp_diff_i
(
// Outputs
.exp_diff       (exp_diff),
.exp_ab         (exp_ab),
.exp_ab_greater (exp_ab_greater),
.exp_ab_less    (exp_ab_less),
// Inputs
.exp_a          (a[14:10]),
.exp_b          (b[14:10]),
.exp_c          (c[14:10]));
fma_mult_tree fma_mult_tree_i
(
// Outputs
.mantissa_ab (mantissa_ab),
.sign_ab     (sign_ab),
// Inputs
.mantissa_a  (a[9:0]),
.mantissa_b  (b[9:0]),
.sign_a      (a[15]),
.sign_b      (b[15]));
fma_aligner_adder fma_aligner_adder_i
(
// Outputs
.mantissa_ab_c  (mantissa_ab_c),
.exp_ab_c       (exp_ab_c),
.sign_ab_c      (result[15]),
.mantissa_shift (mantissa_shift),
// Inputs
.mantissa_ab    (mantissa_ab),
.exp_ab         (exp_ab),
.sign_ab        (sign_ab),
.c              (c),
.exp_diff       (exp_diff),
.exp_ab_greater (exp_ab_greater),
.exp_ab_less    (exp_ab_less));
fma_normalizer_rounder fma_normalizer_rounder_i
(
// Outputs
.mantissa_ab_c_out (result[9:0]),
.exp_ab_c_out      (exp_ab_c_out),
// Inputs
.mantissa_ab_c_in  (mantissa_ab_c),
.exp_ab_c_in       (exp_ab_c),
.mantissa_shift    (mantissa_shift));
assign result[14:10] = ((exp_ab == 5'b11111) || (c[14:10] == 5'b11111)) ? 5'b11111 : exp_ab_c_out;
endmodule // fma_top
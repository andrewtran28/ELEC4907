// RAM Model
//
// +-----------------------------+
// |    Copyright 1996 DOULOS    |
// |       Library: Memory       |
// |   designer : John Aynsley   |
// +-----------------------------+

module RamChip (Address, Data, CS, WE, OE, clk, rst);

parameter memory_locations = 88;
parameter AddressSize = 7; //4912 addresses
parameter WordSize = 48; //16byte

input clk;
input rst;
input [AddressSize-1:0] Address;
inout [WordSize-1:0] Data;
input CS, WE, OE;

reg [WordSize-1:0] Mem [0:memory_locations];

assign Data = (!CS && !OE) ? Mem[Address] : {WordSize{1'bz}};

always @(posedge clk)begin
  if (!CS && !WE)
    Mem[Address] = Data;
end

always @(WE or OE)
  if (!WE && !OE)
    $display("Operational error in RamChip: OE and WE both active");

endmodule

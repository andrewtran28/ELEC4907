`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/09/2019 02:06:49 PM
// Design Name: 
// Module Name: top
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


module top(
    
    );
    
    
     reg en;
      reg [7:0] neuron_done;
      reg           rst;
      reg [255:0] network;
          reg drdy;
    
    
      wire [31:0] port_dst;
      wire        srdy;
   
   
  
      arb_v2 dut (
           // Outputs
           .dst        (port_dst[31:0]),
           .srdy            (srdy),
           // Inputs
           .drdy(drdy),
           .en            (en),
           .neuron_done        (neuron_done[7:0]),
           .rst            (rst),
           .network        (network[255:0])
      );
      
    integer i;
    initial begin
    
        network = {32'h0123_4567 , 32'h0123_4567, 32'h0123_4567, 32'h0123_4567, 32'h0123_4567 , 32'h0123_4567, 32'h0123_4567, 32'h0123_4567 };
         neuron_done = 8'b0000_0000;
         en = 0;
         drdy = 1;
         rst = 1;
         #1;
         rst = 0;
         en = 1;
         #1;
         neuron_done = 8'b1000_0000;
    
    for (i = 0 ; i < 64 ; i = i + 1) begin
            
            wait (srdy);
                  #1;
                  drdy = 0;
                  wait (~srdy);
                  #1;
                  drdy = 1;  
                  
                  if (i == 2) begin
                  
                    #0.2; 
                    neuron_done = 8'b1001_0001;
                    
                  
                  end
                  
                  end
                  
            end

                
    
    
    
endmodule

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/10/2019 03:44:29 AM
// Design Name: 
// Module Name: host_controller
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

module host_controller(
 
    );
   
   
   
  /*
 output [127:0] master_data_out,
            input [127:0]     master_data_in,
            input [15:0]     master_addr,
            input [3:0]     master_len,
            input         master_WE, 
            input         master_RE,
            output     master_op_done,
   
            output [127:0] layer_0_data_out,
            input [127:0]     layer_0_data_in,
            input [15:0]     layer_0_addr,
            input [3:0]     layer_0_len,
            input         layer_0_WE, 
            input         layer_0_RE,
            output     layer_0_op_done,
   
            output [127:0] layer_1_data_out,
            input [127:0]     layer_1_data_in,
            input [15:0]     layer_1_addr,
            input [3:0]     layer_1_len,
            input         layer_1_WE, 
            input         layer_1_RE,
            output     layer_1_op_done  
  */
   
   reg [128-1:0] l2_cache_master_data_out;
   reg [16-1:0] l2_cache_master_addr;
   reg [4-1:0] l2_cache_master_len;
   reg l2_cache_master_WE;
   reg l2_cache_master_RE;
   wire l2_cache_master_op_done;
   
   
   l1_cache u_l2_cache(
        .master_data_in (l2_cache_master_data_out),
        .master_addr (l2_cache_master_addr),
        .master_len (l2_cache_master_len),
        .master_WE (l2_cache_master_WE),
        .master_RE (l2_cache_master_RE),
        .master_op_done (l2_cache_master_op_done),
        .layer_0_data_out (layer_controller_data_out[0]),
        .layer_0_data_in (layer_controller_data_in[0]),
        .layer_0_addr (layer_controller_addr[0]),
        .layer_0_len (layer_controller_len[0]),
        .layer_0_WE (layer_controller_WE[0]),
        .layer_0_RE (layer_controller_RE[0]),
        .layer_0_op_done (layer_controller_layer_done[0]),
        .layer_1_data_out (layer_controller_data_out[1]),
        .layer_1_data_in (layer_controller_data_in[1]),
        .layer_1_addr (layer_controller_addr[1]),
        .layer_1_len (layer_controller_len[1]),
        .layer_1_WE (layer_controller_WE[1]),
        .layer_1_RE (layer_controller_RE[1]),
        .layer_1_op_done (layer_controller_layer_done[1]),
        .layer_2_data_out (layer_controller_data_out[2]),
        .layer_2_data_in (layer_controller_data_in[2]),
        .layer_2_addr (layer_controller_addr[2]),
        .layer_2_len (layer_controller_len[2]),
        .layer_2_WE (layer_controller_WE[2]),
        .layer_2_RE (layer_controller_RE[2]),
        .layer_2_op_done (layer_controller_layer_done[2]),
        .layer_3_data_out (layer_controller_data_out[3]),
        .layer_3_data_in (layer_controller_data_in[3]),
        .layer_3_addr (layer_controller_addr[3]),
        .layer_3_len (layer_controller_len[3]),
        .layer_3_WE (layer_controller_WE[3]),
        .layer_3_RE (layer_controller_RE[3]),
        .layer_3_op_done (layer_controller_layer_done[3]),
        .layer_4_data_out (layer_controller_data_out[4]),
        .layer_4_data_in (layer_controller_data_in[4]),
        .layer_4_addr (layer_controller_addr[4]),
        .layer_4_len (layer_controller_len[4]),
        .layer_4_WE (layer_controller_WE[4]),
        .layer_4_RE (layer_controller_RE[4]),
        .layer_4_op_done (layer_controller_layer_done[4]),
        .layer_5_data_out (layer_controller_data_out[5]),
        .layer_5_data_in (layer_controller_data_in[5]),
        .layer_5_addr (layer_controller_addr[5]),
        .layer_5_len (layer_controller_len[5]),
        .layer_5_WE (layer_controller_WE[5]),
        .layer_5_RE (layer_controller_RE[5]),
        .layer_5_op_done (layer_controller_layer_done[5]),
        .layer_6_data_out (layer_controller_data_out[6]),
        .layer_6_data_in (layer_controller_data_in[6]),
        .layer_6_addr (layer_controller_addr[6]),
        .layer_6_len (layer_controller_len[6]),
        .layer_6_WE (layer_controller_WE[6]),
        .layer_6_RE (layer_controller_RE[6]),
        .layer_6_op_done (layer_controller_layer_done[6]),
        .layer_7_data_out (layer_controller_data_out[7]),
        .layer_7_data_in (layer_controller_data_in[7]),
        .layer_7_addr (layer_controller_addr[7]),
        .layer_7_len (layer_controller_len[7]),
        .layer_7_WE (layer_controller_WE[7]),
        .layer_7_RE (layer_controller_RE[7]),
        .layer_7_op_done (layer_controller_layer_done[7])
   );
   
   
   
   reg layer_controller_op_done [7:0]; //input to layer controller
   reg layer_controller_rst [7:0]; //input to layer controller
   reg layer_controller_layer_en [7:0]; //input to layer controller
   reg [128-1:0] layer_controller_data_in [7:0]; //input to layer controller
   reg [128-1:0] layer_controller_data_out [7:0]; //input to layer controller 
   reg [160-1:0] layer_controller_layer_data_in [7:0]; //input to layer controller
   wire [160-1:0] layer_controller_layer_data_out [7:0]; //output from layer controller
   wire [16-1:0] layer_controller_addr [7:0]; //output from layer controller
   wire [4-1:0] layer_controller_len [7:0]; //output from layer controller
   wire layer_controller_WE [7:0]; //output from layer controller
   wire layer_controller_RE [7:0]; //output from layer controller
   wire layer_controller_layer_done [7:0]; //output from layer controller
    
    
    genvar i;
    
       generate
          for(i=0;i<8;i=i+1) begin : generate_layer_controllers
             layer_controller u_layer_controller(
                    //input
                    .op_done(layer_controller_op_done[i]),   //host-layer controller operation done bit 
                    .rst(layer_controller_rst[i]),  //layer controller reset
                    .layer_en(layer_controller_layer_en[i]), //layer controller enable
                    .data_in(layer_controller_data_in[i]), //128b host-layer controller data interface
                    .layer_data_in(layer_controller_layer_data_in[i]), //160b layer-layer data interface
                    //output
                    .layer_data_out(layer_controller_layer_data_out[i]), //160b layer-layer data interface
                    .addr(layer_controller_addr[i]), //16b layer-host controller byte address 
                    .len(layer_controller_len[i]), //4b layer-host controller data byte length **SPECIAL ENCODING
                    .WE(layer_controller_WE[i]), //layer-host controller write enable
                    .RE(layer_controller_RE[i]), //layer-host controller read enable
                    .layer_done(layer_controller_layer_done[i]) //layer-host controller Layer Done 
                  );
              end 
       endgenerate
       
       
       initial begin
       #1;
       
       
       
       
       end
    
    
endmodule

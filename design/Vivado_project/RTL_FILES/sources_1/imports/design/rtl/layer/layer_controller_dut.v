`timescale 1ns/1ns

module layer_controller_dut;

   reg [127:0]  data_in;
   wire [127:0] data_out;
   reg [159:0]  layer_data_in;
   wire [159:0] layer_data_out;
   wire [15:0]  addr;
   wire [3:0]   len;
   wire 	  WE;
   wire 	  RE;
   reg 	  op_done;
   reg 	  rst;
   reg 	  layer_en;
   wire 	  layer_done;
   
    wire [127:0] layer_0_data_out;
     wire layer_0_op_done;
     wire [127:0] 	layer_0_data_in;
     wire [15:0] 	layer_0_addr; 
     wire [3:0] 	layer_0_len; 
     wire		layer_0_WE;            
     wire		layer_0_RE; 
     
     wire [127:0] master_data_out;
     wire master_op_done;
     reg [127:0] 	master_data_in;
     reg [15:0] 	master_addr; 
     reg [3:0] 	master_len; 
     reg		master_WE;            
     reg		master_RE;  
     
   layer_controller dut_layer_controller (
			 .data_in(layer_0_data_in),
			 .data_out(layer_0_data_out),
			 .layer_data_in(0),
			 .layer_data_out(),
			 .addr(layer_0_addr),
			 .len(layer_0_len),
			 .WE(layer_0_WE),
			 .RE(layer_0_RE),
			 .op_done(layer_0_op_done),
			 .rst(rst),
			 .layer_en(layer_en),
			 .layer_done(layer_done)
    );

     l1_cache dut_cache(
        .layer_0_data_out (layer_0_data_in),
        .layer_0_op_done(layer_0_op_done),
        .layer_0_data_in(layer_0_data_out),
        .layer_0_addr(layer_0_addr),
        .layer_0_len(layer_0_len),
        .layer_0_WE(layer_0_WE),
        .layer_0_RE(layer_0_RE),
        .master_data_out (master_data_out),
        .master_op_done(master_op_done),
        .master_data_in(master_data_in),
        .master_addr(master_addr),
        .master_len(master_len),
        .master_WE(master_WE),
        .master_RE(master_RE)
    );

   initial begin
      #1;
      rst = 0;
      layer_en = 0;
      #1;
      master_RE = 0;
      
      
      
      /////////
      master_data_in = 16'h0;
      master_addr = `LAYER_0_START_ADDRESS + `OFFSET_NEURON_0 + `OFFSET_INPUT_VALUE;
      master_len = 4'h1;
      master_WE = 1;
      #1;
      wait (master_op_done);
      master_WE = 0;
      #1; 
      
      /////////
      master_data_in = 16'h1;
      master_addr = `LAYER_0_START_ADDRESS + `OFFSET_NEURON_1 + `OFFSET_INPUT_VALUE;
      master_len = 4'h1;
      master_WE = 1;
      #1;
      wait (master_op_done);
      master_WE = 0;
      #1; 
      
      /////////
      master_data_in = 16'h2;
      master_addr = `LAYER_0_START_ADDRESS + `OFFSET_NEURON_2 + `OFFSET_INPUT_VALUE;
      master_len = 4'h1;
      master_WE = 1;
      #1;
      wait (master_op_done);
      master_WE = 0;
      #1; 
      
      /////////
      master_data_in = 16'h3;
      master_addr = `LAYER_0_START_ADDRESS + `OFFSET_NEURON_3 + `OFFSET_INPUT_VALUE;
      master_len = 4'h1;
      master_WE = 1;
      #1;
      wait (master_op_done);
      master_WE = 0;
      #1; 
      
      /////////
      master_data_in = 16'h4;
      master_addr = `LAYER_0_START_ADDRESS + `OFFSET_NEURON_4 + `OFFSET_INPUT_VALUE;
      master_len = 4'h1;
      master_WE = 1;
      #1;
      wait (master_op_done);
      master_WE = 0;
      #1; 
      
      /////////
      master_data_in = 16'h5;
      master_addr = `LAYER_0_START_ADDRESS + `OFFSET_NEURON_5 + `OFFSET_INPUT_VALUE;
      master_len = 4'h1;
      master_WE = 1;
      #1;
      wait (master_op_done);
      master_WE = 0;
      #1; 
      
      /////////
      master_data_in = 16'h6;
      master_addr = `LAYER_0_START_ADDRESS + `OFFSET_NEURON_6 + `OFFSET_INPUT_VALUE;
      master_len = 4'h1;
      master_WE = 1;
      #1;
      wait (master_op_done);
      master_WE = 0;
      #1; 
      
      /////////
      master_data_in = 16'h7;
      master_addr = `LAYER_0_START_ADDRESS + `OFFSET_NEURON_7 + `OFFSET_INPUT_VALUE;
      master_len = 4'h1;
      master_WE = 1;
      #1;
      wait (master_op_done);
      master_WE = 0;
      #1; 
    
      
      /////////
      master_data_in = 16'hf0;
      master_addr = `LAYER_0_START_ADDRESS + `OFFSET_NEURON_0 + `OFFSET_WEIGHT_VALUE;
      master_len = 4'h1;
      master_WE = 1;
      #1;
      wait (master_op_done);
      master_WE = 0;
      #1; 
      
      /////////
      master_data_in = 16'hf1;
      master_addr = `LAYER_0_START_ADDRESS + `OFFSET_NEURON_1 + `OFFSET_WEIGHT_VALUE;
      master_len = 4'h1;
      master_WE = 1;
      #1;
      wait (master_op_done);
      master_WE = 0;
      #1; 
      
      /////////
      master_data_in = 16'hf2;
      master_addr = `LAYER_0_START_ADDRESS + `OFFSET_NEURON_2 + `OFFSET_WEIGHT_VALUE;
      master_len = 4'h1;
      master_WE = 1;
      #1;
      wait (master_op_done);
      master_WE = 0;
      #1; 
      
      /////////
      master_data_in = 16'hf3;
      master_addr = `LAYER_0_START_ADDRESS + `OFFSET_NEURON_3 + `OFFSET_WEIGHT_VALUE;
      master_len = 4'h1;
      master_WE = 1;
      #1;
      wait (master_op_done);
      master_WE = 0;
      #1; 
      
      /////////
      master_data_in = 16'hf4;
      master_addr = `LAYER_0_START_ADDRESS + `OFFSET_NEURON_4 + `OFFSET_WEIGHT_VALUE;
      master_len = 4'h1;
      master_WE = 1;
      #1;
      wait (master_op_done);
      master_WE = 0;
      #1; 
      
      /////////
      master_data_in = 16'hf5;
      master_addr = `LAYER_0_START_ADDRESS + `OFFSET_NEURON_5 + `OFFSET_WEIGHT_VALUE;
      master_len = 4'h1;
      master_WE = 1;
      #1;
      wait (master_op_done);
      master_WE = 0;
      #1; 
      
      /////////
      master_data_in = 16'hf6;
      master_addr = `LAYER_0_START_ADDRESS + `OFFSET_NEURON_6 + `OFFSET_WEIGHT_VALUE;
      master_len = 4'h1;
      master_WE = 1;
      #1;
      wait (master_op_done);
      master_WE = 0;
      #1; 
      
      /////////
      master_data_in = 16'hf7;
      master_addr = `LAYER_0_START_ADDRESS + `OFFSET_NEURON_7 + `OFFSET_WEIGHT_VALUE;
      master_len = 4'h1;
      master_WE = 1;
      #1;
      wait (master_op_done);
      master_WE = 0;
      #1; 
      
     /////////
      master_data_in = 16'h10;
      master_addr = `LAYER_0_START_ADDRESS + `OFFSET_NEURON_0 + `OFFSET_BIAS_VALUE;
      master_len = 4'h1;
      master_WE = 1;
      #1;
      wait (master_op_done);
      master_WE = 0;
      #1; 
      
      /////////
      master_data_in = 16'h11;
      master_addr = `LAYER_0_START_ADDRESS + `OFFSET_NEURON_1 + `OFFSET_BIAS_VALUE;
      master_len = 4'h1;
      master_WE = 1;
      #1;
      wait (master_op_done);
      master_WE = 0;
      #1; 
      
      /////////
      master_data_in = 16'h12;
      master_addr = `LAYER_0_START_ADDRESS + `OFFSET_NEURON_2 + `OFFSET_BIAS_VALUE;
      master_len = 4'h1;
      master_WE = 1;
      #1;
      wait (master_op_done);
      master_WE = 0;
      #1; 
      
      /////////
      master_data_in = 16'h13;
      master_addr = `LAYER_0_START_ADDRESS + `OFFSET_NEURON_3 + `OFFSET_BIAS_VALUE;
      master_len = 4'h1;
      master_WE = 1;
      #1;
      wait (master_op_done);
      master_WE = 0;
      #1; 
      
      /////////
      master_data_in = 16'h14;
      master_addr = `LAYER_0_START_ADDRESS + `OFFSET_NEURON_4 + `OFFSET_BIAS_VALUE;
      master_len = 4'h1;
      master_WE = 1;
      #1;
      wait (master_op_done);
      master_WE = 0;
      #1; 
      
      /////////
      master_data_in = 16'h15;
      master_addr = `LAYER_0_START_ADDRESS + `OFFSET_NEURON_5 + `OFFSET_BIAS_VALUE;
      master_len = 4'h1;
      master_WE = 1;
      #1;
      wait (master_op_done);
      master_WE = 0;
      #1; 
      
      /////////
      master_data_in = 16'h16;
      master_addr = `LAYER_0_START_ADDRESS + `OFFSET_NEURON_6 + `OFFSET_BIAS_VALUE;
      master_len = 4'h1;
      master_WE = 1;
      #1;
      wait (master_op_done);
      master_WE = 0;
      #1; 
      
      /////////
      master_data_in = 16'h17;
      master_addr = `LAYER_0_START_ADDRESS + `OFFSET_NEURON_7 + `OFFSET_BIAS_VALUE;
      master_len = 4'h1;
      master_WE = 1;
      #1;
      wait (master_op_done);
      master_WE = 0;
      #1; 
      
      /////////
      master_data_in = 128'hFF_FF_FF_FF_FF_FF_FF_FF_FF_FF_FF_FF_FF_FF_FF_FF;
      master_addr = `LAYER_0_START_ADDRESS + `OFFSET_NEURON_7 + `OFFSET_FORWARD_NETWORK;
      master_len = 4'b1110;
      master_WE = 1;
      #1;
      wait (master_op_done);
      master_WE = 0;
      #1; 
      
    
    
    
      rst = 1;
      #1;
      rst = 0;
      layer_en = 1;
    #1;
   end
   
endmodule // layer_controller_dut

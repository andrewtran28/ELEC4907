`include "memory_map.vh"
`timescale 1ns/1ns

module layer_controller(
			input [127:0]  data_in,
			output reg[127:0] data_out,
			input [160-1:0] layer_data_in,
			output [160-1:0] layer_data_out,
			output reg[15:0]  addr,
			output reg[3:0]   len,
			output 	reg       WE, 
			output reg	       RE,
			input 	       op_done,
			input 	       rst,
			input 	       layer_en,
			output layer_done
			);
 
   parameter BAR = 0; // default Layer 0
   
   reg [(16*8)-1:0] 		       input_value [8-1:0];
   reg [(16*8)-1:0] 		       input_weight[8-1:0];
   reg [16-1:0] 		       input_bias [8-1:0];
   reg [32-1:0] 		       forward_network [8-1:0];
   reg [32-1:0] 		       reverse_network [8-1:0];
   reg 				       en [8-1:0];
   reg 				      [8-1:0] srdy ;
   reg 				       cycle_done;
   reg 				       mem_cycle_done;
   wire [16-1:0] 		       output_value [8-1:0];
   wire 		[8-1:0]	       drdy ;
   wire 			       done [8-1:0];
   assign layer_done = done[0] & done[1] & done[2] &
               done[3] & done[4] & done[5] &
               done[6] & done[7];

   genvar 			       i;
   
   generate
      for(i=0;i<8;i=i+1) begin : generate_neurons
	 neuron u_neuron (
			  .input_value(input_value[i]),
			  .input_weight(input_weight[i]),
			  .input_bias(input_bias[i]),
			  .rst(rst),
			  .en(en[i]),
			  .srdy(srdy[i]),
			  .output_value(output_value[i]),
			  .drdy(drdy[i]),
			  .done(done[i])
			  );
      end // block: generate_neurons
   endgenerate

   reg [4-1:0] cur_state;
   reg [4-1:0] nxt_state;

   reg [4-1:0] mem_cur_state;
   reg [4-1:0] mem_nxt_state;

   reg [15:0]  layer_BAR; //layer base address register
   reg [15:0]  neuron_BAR; //neuron BAR
   
   parameter DONE = 4'd0, 
     LOAD_0 = 4'd1, LOAD_1 = 4'd2, LOAD_2 = 4'd3, LOAD_3 = 4'd4, 
     LOAD_4 = 4'd5, LOAD_5 = 4'd6, LOAD_6 = 4'd7, LOAD_7 = 4'd8,
     PROCESSING = 4'd9;

   parameter LOAD_WEIGHT = 4'd9, LOAD_VALUES = 4'd10, LOAD_BIAS = 4'd11, 
     LOAD_FORWARD_NETWORK_0 = 4'd12, LOAD_FORWARD_NETWORK_1 = 4'd13,
     LOAD_REVERSE_NETWORK_0 = 4'd14, LOAD_REVERSE_NETWORK_1 = 4'd15;
   wire [31:0] fwd_arbiter_port_dst;
     wire fwd_arbiter_srdy;
     reg fwd_arbiter_en;
     reg fwd_arbiter_drdy;
     reg [32-1:0] fwd_routing_engine_port_dest;
     wire [20-1:0] fwd_routing_engine_control;
     wire fwd_routing_engine_done;
       
     reg [20-1:0] fwd_benes_in_control;
     wire [160-1:0] fwd_benes_out_output;   


   //next state calculation
   always @(cur_state)begin
      case (cur_state)
      
                LOAD_0: begin
                   mem_cycle_done <= 0;
                   neuron_BAR <= `OFFSET_NEURON_0;
                   nxt_state <= LOAD_1;
                end
                    LOAD_1: begin
                   mem_cycle_done <= 0;
                   neuron_BAR <= `OFFSET_NEURON_1;
                   nxt_state <= LOAD_2;
                end
                LOAD_2: begin
                   mem_cycle_done <= 0;
                   neuron_BAR <= `OFFSET_NEURON_2;
                   nxt_state <= LOAD_3;
                end
                LOAD_3: begin
                   mem_cycle_done <= 0;
                   neuron_BAR <= `OFFSET_NEURON_3;
                   nxt_state <= LOAD_4;
                end
                LOAD_4: begin
                   mem_cycle_done <= 0;
                   neuron_BAR <= `OFFSET_NEURON_4;
                   nxt_state <= LOAD_5;
                end
                LOAD_5: begin
                   mem_cycle_done <= 0;
                   neuron_BAR <= `OFFSET_NEURON_5;
                   nxt_state <= LOAD_6;
                end
                LOAD_6: begin
                   mem_cycle_done <= 0;
                   neuron_BAR <= `OFFSET_NEURON_6;
                   nxt_state <= LOAD_7;
                end
                LOAD_7: begin
                   mem_cycle_done <= 0;
                   neuron_BAR <= `OFFSET_NEURON_7;
                   nxt_state <= DONE;
                end	
                DONE: begin
                   nxt_state <= LOAD_0;
                end
                
                default: begin end
                
      endcase // case (cur_state)
   end // always @ (cur_state)


   always @(negedge drdy[0]) begin
      #1;
      srdy[0] <= 0;
   end

   always @(negedge drdy[1]) begin
      #1;
      srdy[1] <= 0;
   end

   always @(negedge drdy[2]) begin
      #1;
      srdy[2] <= 0;
   end

   always @(negedge drdy[3]) begin
      #1;
      srdy[3] <= 0;
   end

   always @(negedge drdy[4]) begin
      #1;
      srdy[4] <= 0;
   end

   always @(negedge drdy[5]) begin
      #1;
      srdy[5] <= 0;
   end
   always @(negedge drdy[6]) begin
      #1;
      srdy[6] <= 0;
   end

   always @(negedge drdy[7]) begin
      #1;
      srdy[7] <= 0;
   end
   
   always @(posedge rst) begin
    fwd_arbiter_en <= 0;
    fwd_arbiter_drdy <= 0;
    fwd_routing_engine_port_dest <= 0;
    fwd_benes_in_control <= 0;
      cycle_done <= 0;
      mem_cycle_done <= 0;
      case (BAR)
                0:      layer_BAR <= `LAYER_0_START_ADDRESS;
                1:      layer_BAR <= `LAYER_1_START_ADDRESS;
                2:      layer_BAR <= `LAYER_2_START_ADDRESS;
                3:      layer_BAR <= `LAYER_3_START_ADDRESS;
                4:      layer_BAR <= `LAYER_4_START_ADDRESS;
                5:      layer_BAR <= `LAYER_5_START_ADDRESS;
                6:      layer_BAR <= `LAYER_6_START_ADDRESS;
                7:      layer_BAR <= `LAYER_7_START_ADDRESS;
      endcase // case (BAR)
      neuron_BAR <= `OFFSET_NEURON_0;
      input_value [7] <= 0;
      input_value [6] <= 0;
      input_value [5] <= 0;
      input_value [4] <= 0;
      input_value [3] <= 0;
      input_value [2] <= 0;
      input_value [1] <= 0;
      input_value [0] <= 0;
      input_weight[7] <= 0;
      input_weight[6] <= 0;
      input_weight[5] <= 0;
      input_weight[4] <= 0;
      input_weight[3] <= 0;
      input_weight[2] <= 0;
      input_weight[1] <= 0;
      input_weight[0] <= 0;
      input_bias [7] <= 0;
      input_bias [6] <= 0;
      input_bias [5] <= 0;
      input_bias [4] <= 0;
      input_bias [3] <= 0;
      input_bias [2] <= 0;
      input_bias [1] <= 0;
      input_bias [0] <= 0;
      en [7] <= 0;
      en [6] <= 0;
      en [5] <= 0;
      en [4] <= 0;
      en [3] <= 0;
      en [2] <= 0;
      en [1] <= 0;
      en [0] <= 0;
      srdy [7] <= 0;
      srdy [6] <= 0;
      srdy [5] <= 0;
      srdy [4] <= 0;
      srdy [3] <= 0;
      srdy [2] <= 0;
      srdy [1] <= 0;
      srdy [0] <= 0;
      addr <= 0;
      RE <= 0;
      WE <= 0;
      len <= 0;
      cur_state <= LOAD_0;
      nxt_state <= LOAD_1;
      mem_cur_state <= LOAD_WEIGHT;
      mem_nxt_state <= LOAD_VALUES;
   end

   //memory access next state calculation and mem interface signals 
   always @(mem_cur_state or (~mem_cycle_done))begin // *** REVIEW THIS!!!! IT USED TO BE "or negedge mem_cycle_done"
      case (mem_cur_state)
                LOAD_WEIGHT: begin
                   if(!mem_cycle_done) begin
                      mem_nxt_state <= LOAD_VALUES;
                      addr <= layer_BAR + neuron_BAR + `OFFSET_WEIGHT_VALUE; 
                      RE <= 1;
                      WE <= 0;
                      len <= 4'b1110;
                   end
                end
                LOAD_VALUES: begin
                   mem_nxt_state <= LOAD_BIAS;
                   addr <= layer_BAR + neuron_BAR + `OFFSET_INPUT_VALUE;
                   RE <= 1;
                   WE <= 0;
                   len <= 4'b1110;  
                end
                LOAD_BIAS: begin
                   mem_nxt_state <= LOAD_FORWARD_NETWORK_0;
                   addr <= layer_BAR + neuron_BAR + `OFFSET_BIAS_VALUE;
                   RE <= 1;
                   WE <= 0;
                   len <= 4'b0001;     
                end
                LOAD_FORWARD_NETWORK_0: begin
                   mem_nxt_state <= LOAD_FORWARD_NETWORK_1;
                   addr <= layer_BAR + neuron_BAR + `OFFSET_FORWARD_NETWORK;  
                   RE <= 1;
                   WE <= 0;
                   len <= 4'b1110;
                end
                LOAD_FORWARD_NETWORK_1: begin
                   mem_nxt_state <= LOAD_REVERSE_NETWORK_0;
                   addr <= layer_BAR + neuron_BAR + `OFFSET_FORWARD_NETWORK + 16'h0010;
                   RE <= 1;
                   WE <= 0;
                   len <= 4'b1110;
                end
                LOAD_REVERSE_NETWORK_0: begin
                   mem_nxt_state <= LOAD_REVERSE_NETWORK_1;
                   addr <= layer_BAR + neuron_BAR + `OFFSET_REVERSE_NETWORK;  
                   RE <= 1;
                   WE <= 0;
                   len <= 4'b1110;
                end
                LOAD_REVERSE_NETWORK_1: begin
                   mem_nxt_state <= DONE;
                   addr <= layer_BAR + neuron_BAR + `OFFSET_REVERSE_NETWORK + 16'h0010;
                   RE <= 1;
                   WE <= 0;
                   len <= 4'b1110;
                end
                DONE: begin
                   mem_cur_state <= LOAD_WEIGHT;
                   mem_cycle_done <= 1;
                   cur_state <= nxt_state;
                end
                
                default: begin end
                
      endcase // case (mem_cur_state)
      
   end // always @ (mem_cur_state)



   
   always @(posedge op_done)begin
      #1;
      
      RE <= 0;
      WE <= 0;
      #1;
      
      case(mem_cur_state)
	LOAD_WEIGHT: begin
	   input_weight[8-cur_state] <= data_in;
	   mem_cur_state <= mem_nxt_state;
	end
	LOAD_VALUES: begin
	   input_value[8-cur_state] <= data_in;
	   mem_cur_state <= mem_nxt_state;
	end
	LOAD_BIAS: begin
	   input_bias[8-cur_state] <= data_in;
	   mem_cur_state <= mem_nxt_state;
	   en[8-cur_state] <= 1;
	   srdy[8-cur_state] <= 1;
	end
	LOAD_FORWARD_NETWORK_0: begin
	   forward_network[7] <= data_in[128-1-(8*0):128-1-(8*1)];
	   forward_network[6] <= data_in[128-1-(8*1):128-1-(8*2)];
	   forward_network[5] <= data_in[128-1-(8*2):128-1-(8*3)];
	   forward_network[4] <= data_in[128-1-(8*3):128-1-(8*4)];
	   mem_cur_state <= mem_nxt_state;
	end
	LOAD_FORWARD_NETWORK_1: begin
	   forward_network[3] <= data_in[128-1-(8*0):128-1-(8*1)];
	   forward_network[2] <= data_in[128-1-(8*1):128-1-(8*2)];
	   forward_network[1] <= data_in[128-1-(8*2):128-1-(8*3)];
	   forward_network[0] <= data_in[128-1-(8*3):128-1-(8*4)];
	   mem_cur_state <= mem_nxt_state;
	end
	LOAD_REVERSE_NETWORK_0: begin
	   reverse_network[7] <= data_in[128-1-(8*0):128-1-(8*1)];
	   reverse_network[6] <= data_in[128-1-(8*1):128-1-(8*2)];
	   reverse_network[5] <= data_in[128-1-(8*2):128-1-(8*3)];
	   reverse_network[4] <= data_in[128-1-(8*3):128-1-(8*4)];
	   mem_cur_state <= mem_nxt_state;
	end
	LOAD_REVERSE_NETWORK_1: begin
	   reverse_network[3] <= data_in[128-1-(8*0):128-1-(8*1)];
	   reverse_network[2] <= data_in[128-1-(8*1):128-1-(8*2)];
	   reverse_network[1] <= data_in[128-1-(8*2):128-1-(8*3)];
	   reverse_network[0] <= data_in[128-1-(8*3):128-1-(8*4)];
	   mem_cur_state <= mem_nxt_state;
	end
	DONE: begin
	end
	default: begin 
	end
      endcase // case (cur_state)
   end // always @ (posedge op_done)


 arb_v2 u_fwd_arbiter(
    //output
    .dst(fwd_arbiter_port_dst), // output 32b destination port 
    .srdy(fwd_arbiter_srdy), // output srdy 
    //input
    .en(fwd_arbiter_en), // input enable
    .neuron_done({done[0], done[1], done[2], done[3], done[4], done[5], done[6], done[7]}), // input 8b neuron done
    .rst(rst), // input rst
    .network({forward_network[7], forward_network[6], forward_network[5], forward_network[4],
                                   forward_network[3], forward_network[2], forward_network[1], forward_network[0]}), // input 256b network data
    .drdy(fwd_arbiter_drdy) // input drdy
 );


//retiming to handshake
always @(posedge srdy) begin
    fwd_routing_engine_port_dest <= fwd_arbiter_port_dst;
end


   routing_engine u_fwd_routing_engine (/*AUTOINST*/
				    //input
				    .port_dest(fwd_routing_engine_port_dest), //32b input [8neuron x 4b] 
				    //output
				    .control(fwd_routing_engine_control), //20b output; switch matrix control    
				    .done(fwd_routing_engine_done) //1b output
    );
   
   
   
//retimer
always @(posedge fwd_routing_engine_done) begin
    fwd_benes_in_control <= fwd_routing_engine_control;
end

   wire [8-1:0] fwd_benes_port_en_n;
    assign fwd_benes_port_en_n [0] = fwd_arbiter_port_dst[32-1-4*0];
    assign fwd_benes_port_en_n [1] = fwd_arbiter_port_dst[32-1-4*1];
    assign fwd_benes_port_en_n [2] = fwd_arbiter_port_dst[32-1-4*2];
    assign fwd_benes_port_en_n [3] = fwd_arbiter_port_dst[32-1-4*3];
    assign fwd_benes_port_en_n [4] = fwd_arbiter_port_dst[32-1-4*4];
    assign fwd_benes_port_en_n [5] = fwd_arbiter_port_dst[32-1-4*5];
    assign fwd_benes_port_en_n [6] = fwd_arbiter_port_dst[32-1-4*6];
    assign fwd_benes_port_en_n [7] = fwd_arbiter_port_dst[32-1-4*7];
    
   benes u_fwd_benes (/*AUTOINST*/
		  // Outputs
		  .out_output		 (fwd_benes_out_output), //160 bit output, 
		  // Inputs
		  .in_input		     ({output_value[0], output_value[1], output_value[2], output_value[3], 
                               output_value[4], output_value[5], output_value[6], output_value[7]}), //128 bit data (8 neuron x 16b data)
		  .in_control		 (fwd_benes_in_control), // 20b switch matrix control
		  .port_en_n         (fwd_benes_port_en_n)
   );
   
   assign layer_data_out = fwd_benes_out_output;


endmodule // layer_controller


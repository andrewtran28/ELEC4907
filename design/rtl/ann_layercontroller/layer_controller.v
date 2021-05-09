
`include "/home/vladimirmilicevic/ann_neuron/neuron.v"
`include "/home/vladimirmilicevic/ann_layercontroller/memory_map.vh"
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
			input clk,
			output layer_done
			);
 
   reg [3:0] BAR; // default Layer 0 

   
   
   
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

   wire [31:0] fwd_arbiter_port_dst;
     wire fwd_arbiter_srdy;
     reg fwd_arbiter_en;
     reg fwd_arbiter_drdy;
     reg [32-1:0] fwd_routing_engine_port_dest;
     wire [20-1:0] fwd_routing_engine_control;
     wire fwd_routing_engine_done;
       


   //next state calculation
   always @(posedge clk)begin
      case (cur_state)
      
                4'b0001: begin
                   mem_cycle_done <= 0;
                   neuron_BAR <= `OFFSET_NEURON_0;
                   nxt_state <= 4'b0010;
                end
                    4'b0010: begin
                   mem_cycle_done <= 0;
                   neuron_BAR <= `OFFSET_NEURON_1;
                   nxt_state <= 4'b0011;
                end
                4'b0011: begin
                   mem_cycle_done <= 0;
                   neuron_BAR <= `OFFSET_NEURON_2;
                   nxt_state <= 4'b0100;
                end
                4'b0100: begin
                   mem_cycle_done <= 0;
                   neuron_BAR <= `OFFSET_NEURON_3;
                   nxt_state <= 4'b0101;
                end
                4'b0101: begin
                   mem_cycle_done <= 0;
                   neuron_BAR <= `OFFSET_NEURON_4;
                   nxt_state <= 4'b0110;
                end
                4'b0110: begin
                   mem_cycle_done <= 0;
                   neuron_BAR <= `OFFSET_NEURON_5;
                   nxt_state <= 4'b0111;
                end
                4'b0111: begin
                   mem_cycle_done <= 0;
                   neuron_BAR <= `OFFSET_NEURON_6;
                   nxt_state <= 4'b1000;
                end
                4'b1000: begin
                   mem_cycle_done <= 0;
                   neuron_BAR <= `OFFSET_NEURON_7;
                   nxt_state <= 4'b0000;
                end	
                4'b0000: begin
                   nxt_state <= 4'b0001;
                end
                
                default: begin end
                
      endcase // case (cur_state)
   end // always @ (cur_state)


   //memory access next state calculation and mem interface signals 
   always @(posedge clk )begin // *** REVIEW THIS!!!! IT USED TO BE "or negedge mem_cycle_done"
      case (mem_cur_state)
                4'b1001: begin
                   if(!mem_cycle_done) begin
                      mem_nxt_state <= 4'b1010;
                      addr <= layer_BAR + neuron_BAR + `OFFSET_WEIGHT_VALUE; 
                      RE <= 1;
                      WE <= 0;
                      len <= 4'b1110;
                   end
                end
                4'b1010: begin
                   mem_nxt_state <= 4'b1011;
                   addr <= layer_BAR + neuron_BAR + `OFFSET_INPUT_VALUE;
                   RE <= 1;
                   WE <= 0;
                   len <= 4'b1110;  
                end
                4'b1011: begin
                   mem_nxt_state <= 4'b1100;
                   addr <= layer_BAR + neuron_BAR + `OFFSET_BIAS_VALUE;
                   RE <= 1;
                   WE <= 0;
                   len <= 4'b0001;     
                end
                4'b1100: begin
                   mem_nxt_state <= 4'b1101;
                   addr <= layer_BAR + neuron_BAR + `OFFSET_FORWARD_NETWORK;  
                   RE <= 1;
                   WE <= 0;
                   len <= 4'b1110;
                end
                4'b1101: begin
                   mem_nxt_state <= 4'b1101;
                   addr <= layer_BAR + neuron_BAR + `OFFSET_FORWARD_NETWORK + 16'h0010;
                   RE <= 1;
                   WE <= 0;
                   len <= 4'b1110;
                end
                4'b1101: begin
                   mem_nxt_state <= 4'b1110;
                   addr <= layer_BAR + neuron_BAR + `OFFSET_REVERSE_NETWORK;  
                   RE <= 1;
                   WE <= 0;
                   len <= 4'b1110;
                end
                4'b1110: begin
                   mem_nxt_state <= 4'b0000;
                   addr <= layer_BAR + neuron_BAR + `OFFSET_REVERSE_NETWORK + 16'h0010;
                   RE <= 1;
                   WE <= 0;
                   len <= 4'b1110;
                end
                4'b0000: begin
                   cur_state <= nxt_state;
                end
                
                default: begin end
                
      endcase // case (mem_cur_state)
   end // always @ (mem_cur_state)



   
   always @(posedge clk )begin
   if (op_done) begin
      #1;
      
      
      case(mem_cur_state)
            4'b1001: begin
               input_weight[8-cur_state] <= data_in;
               mem_cur_state <= mem_nxt_state;
            end
            4'b1010: begin
               input_value[8-cur_state] <= data_in;
               mem_cur_state <= mem_nxt_state;
            end
            4'b1011: begin
               input_bias[8-cur_state] <= data_in;
               mem_cur_state <= mem_nxt_state;
               en[8-cur_state] <= 1;
               srdy[8-cur_state] <= 1;
            end
            4'b1100: begin
               forward_network[7] <= data_in[128-1-(8*0):128-1-(8*1)];
               forward_network[6] <= data_in[128-1-(8*1):128-1-(8*2)];
               forward_network[5] <= data_in[128-1-(8*2):128-1-(8*3)];
               forward_network[4] <= data_in[128-1-(8*3):128-1-(8*4)];
               mem_cur_state <= mem_nxt_state;
            end
            4'b1101: begin
               forward_network[3] <= data_in[128-1-(8*0):128-1-(8*1)];
               forward_network[2] <= data_in[128-1-(8*1):128-1-(8*2)];
               forward_network[1] <= data_in[128-1-(8*2):128-1-(8*3)];
               forward_network[0] <= data_in[128-1-(8*3):128-1-(8*4)];
               mem_cur_state <= mem_nxt_state;
            end
            4'b1101: begin
               reverse_network[7] <= data_in[128-1-(8*0):128-1-(8*1)];
               reverse_network[6] <= data_in[128-1-(8*1):128-1-(8*2)];
               reverse_network[5] <= data_in[128-1-(8*2):128-1-(8*3)];
               reverse_network[4] <= data_in[128-1-(8*3):128-1-(8*4)];
               mem_cur_state <= mem_nxt_state;
            end
            4'b1110: begin
               reverse_network[3] <= data_in[128-1-(8*0):128-1-(8*1)];
               reverse_network[2] <= data_in[128-1-(8*1):128-1-(8*2)];
               reverse_network[1] <= data_in[128-1-(8*2):128-1-(8*3)];
               reverse_network[0] <= data_in[128-1-(8*3):128-1-(8*4)];
               mem_cur_state <= mem_nxt_state;
            end
            4'b0000: begin
            end
            default: begin 
            end
      endcase // case (cur_state)
      end
   end // always @ (posedge op_done)


 arbiter u_fwd_arbiter(
    //output
    .port_dst(fwd_arbiter_port_dst), // output 32b destination port 
    .srdy(fwd_arbiter_srdy), // output srdy 
    //input
    .en(fwd_arbiter_en), // input enable
    .neuron_done({done[0], done[1], done[2], done[3], done[4], done[5], done[6], done[7]}), // input 8b neuron done
    .rst(rst), // input rst
    .network({forward_network[7], forward_network[6], forward_network[5], forward_network[4],
                                   forward_network[3], forward_network[2], forward_network[1], forward_network[0]}), // input 256b network data
    .drdy(fwd_arbiter_drdy) // input drdy
 );


   routing_engine u_fwd_routing_engine (/*AUTOINST*/
				    //input
				    .port_dest(fwd_routing_engine_port_dest), //32b input [8neuron x 4b] 
				    //output
				    .control(fwd_routing_engine_control), //20b output; switch matrix control    
				    .done(fwd_routing_engine_done) //1b output
    );
   
   
  
    
   benes u_fwd_benes (/*AUTOINST*/
		  // Outputs
		  .out_output		 (layer_data_out), //160 bit output, 
		  // Inputs
		  .in_input		     ({output_value[0], output_value[1], output_value[2], output_value[3], 
                               output_value[4], output_value[5], output_value[6], output_value[7]}), //128 bit data (8 neuron x 16b data)
		  .in_control		 (fwd_routing_engine_control), // 20b switch matrix control
		  .port_en_n         (fwd_routing_engine_done)
   );
   


endmodule // layer_controller


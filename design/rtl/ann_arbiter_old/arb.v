`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/09/2019 02:06:49 PM
// Design Name: 
// Module Name: logic
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


`timescale 1ns/1ns
module arbiter(
clk,
	       en,
	       srdy,
	       rst,
	       network,
	       port_dst,
	       neuron_done,
	       drdy
	       );
   
   input clk;
   output reg [31:0] port_dst;
   output reg 	     srdy;

   input 	     en;
   input [7:0] 	  neuron_done;
   input 	  rst;
   input [255:0]  network;// 8 neurons x 8 x 4b reg representing the BED destination ports, F = no connection 
   input drdy;
   
   reg [2:0] 	  counter_bias; //round robin counter
   reg [3:0] 	  port_0_buffer [7:0];
   reg [3:0] 	  port_1_buffer [7:0];
   reg [3:0] 	  port_2_buffer [7:0];
   reg [3:0] 	  port_3_buffer [7:0];
   reg [3:0] 	  port_4_buffer [7:0];
   reg [3:0] 	  port_5_buffer [7:0];
   reg [3:0] 	  port_6_buffer [7:0];
   reg [3:0] 	  port_7_buffer [7:0];
   reg [3:0] 	  port_0_ptr;
   reg [3:0] 	  port_1_ptr;
   reg [3:0] 	  port_2_ptr;
   reg [3:0] 	  port_3_ptr;
   reg [3:0] 	  port_4_ptr;
   reg [3:0] 	  port_5_ptr;
   reg [3:0] 	  port_6_ptr;
   reg [3:0] 	  port_7_ptr;
   wire [31:0] 	  port_0_network;
   wire [31:0] 	  port_1_network;
   wire [31:0] 	  port_2_network;
   wire [31:0] 	  port_3_network;
   wire [31:0] 	  port_4_network;
   wire [31:0] 	  port_5_network;
   wire [31:0] 	  port_6_network;
   wire [31:0] 	  port_7_network;
   assign port_0_network = network [255:255-31];
   assign port_1_network = network [223:223-31];
   assign port_2_network = network [191:191-31];
   assign port_3_network = network [159:159-31];
   assign port_4_network = network [127:127-31];
   assign port_5_network = network [95:95-31];
   assign port_6_network = network [63:63-31];
   assign port_7_network = network [31:0];
   reg [3:0] 	  port_0_dest;
   reg [3:0] 	  port_1_dest;
   reg [3:0] 	  port_2_dest;
   reg [3:0] 	  port_3_dest;
   reg [3:0] 	  port_4_dest;
   reg [3:0] 	  port_5_dest;
   reg [3:0] 	  port_6_dest;
   reg [3:0] 	  port_7_dest;
   
   parameter IDLE = 0, SCANNING = 1, LOADING = 2, TRANSMITTING = 3;
   reg [2:0] cur_state;
   reg [2:0] nxt_state;
   reg [7:0] neuron_serviced_n;
   integer   rst_index;     
   reg dest_found;
   integer dst_port, src_port, buffer_bias;  
   
   always @(posedge clk)begin
            neuron_serviced_n = neuron_serviced_n | neuron_done;
            #1;
            nxt_state = SCANNING; // we have neuron data to send, this is used to not jump back into IDLE after TRANSMISSION, instead jumping back into scanning
            if (cur_state == IDLE) begin  // if we're idling
                cur_state = SCANNING; // start buffering the ports 
                nxt_state = IDLE; // next state is IDLE
            end
   end   
       
    always @(posedge clk) begin

                               if (neuron_serviced_n[7]) begin
                                  neuron_serviced_n[7] = 0; //clear the pending bit  
                                  port_0_buffer[0] = port_0_network [31:31-3];
                                  port_0_buffer[1] = port_0_network [27:27-3];
                                  port_0_buffer[2] = port_0_network [23:23-3];
                                  port_0_buffer[3] = port_0_network [19:19-3];
                                  port_0_buffer[4] = port_0_network [15:15-3];
                                  port_0_buffer[5] = port_0_network [11:11-3];
                                  port_0_buffer[6] = port_0_network [7:7-3];
                                  port_0_buffer[7] = port_0_network [3:0];
                               end
                     
                               if (neuron_serviced_n[6]) begin
                                  neuron_serviced_n[6] = 0; //clear the pending bit 
                                  port_1_buffer[0] = port_1_network [31:31-3];
                                  port_1_buffer[1] = port_1_network [27:27-3];
                                  port_1_buffer[2] = port_1_network [23:23-3];
                                  port_1_buffer[3] = port_1_network [19:19-3];
                                  port_1_buffer[4] = port_1_network [15:15-3];
                                  port_1_buffer[5] = port_1_network [11:11-3];
                                  port_1_buffer[6] = port_1_network [7:7-3];
                                  port_1_buffer[7] = port_1_network [3:0];
                               end
                     
                               if (neuron_serviced_n[5]) begin
                                  neuron_serviced_n[5] = 0; //clear the pending bit 
                                  port_2_buffer[0] = port_2_network [31:31-3];
                                  port_2_buffer[1] = port_2_network [27:27-3];
                                  port_2_buffer[2] = port_2_network [23:23-3];
                                  port_2_buffer[3] = port_2_network [19:19-3];
                                  port_2_buffer[4] = port_2_network [15:15-3];
                                  port_2_buffer[5] = port_2_network [11:11-3];
                                  port_2_buffer[6] = port_2_network [7:7-3];
                                  port_2_buffer[7] = port_2_network [3:0];
                               end
                     
                               if (neuron_serviced_n[4]) begin
                                  neuron_serviced_n[4] = 0; //clear the pending bit 
                                  port_3_buffer[0] = port_3_network [31:31-3];
                                  port_3_buffer[1] = port_3_network [27:27-3];
                                  port_3_buffer[2] = port_3_network [23:23-3];
                                  port_3_buffer[3] = port_3_network [19:19-3];
                                  port_3_buffer[4] = port_3_network [15:15-3];
                                  port_3_buffer[5] = port_3_network [11:11-3];
                                  port_3_buffer[6] = port_3_network [7:7-3];
                                  port_3_buffer[7] = port_3_network [3:0];
                               end
                     
                               if (neuron_serviced_n[3]) begin
                                  neuron_serviced_n[3] = 0; //clear the pending bit 
                                  port_4_buffer[0] = port_4_network [31:31-3];
                                  port_4_buffer[1] = port_4_network [27:27-3];
                                  port_4_buffer[2] = port_4_network [23:23-3];
                                  port_4_buffer[3] = port_4_network [19:19-3];
                                  port_4_buffer[4] = port_4_network [15:15-3];
                                  port_4_buffer[5] = port_4_network [11:11-3];
                                  port_4_buffer[6] = port_4_network [7:7-3];
                                  port_4_buffer[7] = port_4_network [3:0];
                               end
                     
                               if (neuron_serviced_n[2]) begin
                                  neuron_serviced_n[2] = 0; //clear the pending bit 
                                  port_5_buffer[0] = port_5_network [31:31-3];
                                  port_5_buffer[1] = port_5_network [27:27-3];
                                  port_5_buffer[2] = port_5_network [23:23-3];
                                  port_5_buffer[3] = port_5_network [19:19-3];
                                  port_5_buffer[4] = port_5_network [15:15-3];
                                  port_5_buffer[5] = port_5_network [11:11-3];
                                  port_5_buffer[6] = port_5_network [7:7-3];
                                  port_5_buffer[7] = port_5_network [3:0];
                               end
                     
                               if (neuron_serviced_n[1]) begin
                                  neuron_serviced_n[1] = 0; //clear the pending bit 
                                  port_6_buffer[0] = port_6_network [31:31-3];
                                  port_6_buffer[1] = port_6_network [27:27-3];
                                  port_6_buffer[2] = port_6_network [23:23-3];
                                  port_6_buffer[3] = port_6_network [19:19-3];
                                  port_6_buffer[4] = port_6_network [15:15-3];
                                  port_6_buffer[5] = port_6_network [11:11-3];
                                  port_6_buffer[6] = port_6_network [7:7-3];
                                  port_6_buffer[7] = port_6_network [3:0];
                               end
                     
                               if (neuron_serviced_n[0]) begin
                                  neuron_serviced_n[0] = 0; //clear the pending bit 
                                  port_7_buffer[0] = port_7_network [31:31-3];
                                  port_7_buffer[1] = port_7_network [27:27-3];
                                  port_7_buffer[2] = port_7_network [23:23-3];
                                  port_7_buffer[3] = port_7_network [19:19-3];
                                  port_7_buffer[4] = port_7_network [15:15-3];
                                  port_7_buffer[5] = port_7_network [11:11-3];
                                  port_7_buffer[6] = port_7_network [7:7-3];
                                  port_7_buffer[7] = port_7_network [3:0];
                               end
                               
                         #1;
                        
                         cur_state = LOADING;
                 
        end //always
        
    reg [7:0] port_locked; 

   always @(posedge clk) begin
    if (en)begin
      /* 
       1. Go through each port buffer in round-robin fashion using the port pointer 
       2. If the destination at the front of the queue is for the current port 
       being searched for, set that port to connect to that destination, clear 
       the queue entry by setting it to 0xF (no connection). Increment the port pointer, 
       loop if necessary. This is to avoid head-of-line blocking in the switch network.
       3. If you go through each port buffer and the front-most connection is not for the
       desired destination, start checking the next entries. 
       4. If you still do not find the desired connection, set the destination to F (NC).
       */

      //first we disconnect each port on the output
      port_0_dest = 4'hF;
      port_1_dest = 4'hF;
      port_2_dest = 4'hF;
      port_3_dest = 4'hF;
      port_4_dest = 4'hF;
      port_5_dest = 4'hF;
      port_6_dest = 4'hF;
      port_7_dest = 4'hF;
      port_dst = 32'hFFFF_FFFF; //reset retimer flops 
      port_locked = 0; //all ports are not connected yet
      
      for (dst_port = 0 ;dst_port  < 8 ;dst_port  = dst_port  + 1) begin //check for a connection to the destination <i>
            #1; 
         dest_found = 0;
         for (src_port = 0 ; src_port < 8 ; src_port = src_port + 1) begin
         
            if (!dest_found)begin
                #1;
               for (buffer_bias = 0 ; buffer_bias < 8 ; buffer_bias = buffer_bias + 1) begin	  
                    if (!dest_found)begin
                        #1;
                                      case ((src_port+counter_bias)%8)
                    
                                        4'd0: begin
                                        if (~port_locked[0])begin
                                          if (port_0_buffer [(port_0_ptr + buffer_bias) % 8] == dst_port) begin
                                                 dest_found = 1; //found a destination
                                                 port_locked [0] = 1;
                                                 port_0_dest = dst_port; //assign this src port to the dst port
                                                 port_0_buffer [(port_0_ptr + buffer_bias) % 8] = 4'hF; //clear the entry
                                                 port_0_ptr = (port_0_ptr + buffer_bias + 1) % 8; //move the pointer
                                              end else begin
                                                 port_0_dest = 4'hF; //not connected
                                              end
                                          end
                                        end
    
    
                                        4'd1: begin
                                        if (~port_locked[1])begin
                                          if (port_1_buffer [(port_1_ptr + buffer_bias) % 8] == dst_port) begin
                                                 dest_found = 1; //found a destination
                                                 port_locked[1] = 1;
                                                 port_1_dest = dst_port; //assign this src port to the dst port
                                                 port_1_buffer [(port_1_ptr + buffer_bias) % 8] = 4'hF; //clear the entry
                                                 port_1_ptr = (port_1_ptr + buffer_bias + 1) % 8; //move the pointer
                                              end else begin
                                                 port_1_dest = 4'hF; //not connected
                                              end
                                          end
                                        end 
                           
                                          
                                        4'd2: begin
                                        if (~port_locked[2])begin
                                            if (port_2_buffer [(port_2_ptr + buffer_bias) % 8] == dst_port) begin
                                                   dest_found = 1; //found a destination
                                                   port_locked[2] = 1;
                                                   port_2_dest = dst_port; //assign this src port to the dst port
                                                   port_2_buffer [(port_2_ptr + buffer_bias) % 8] = 4'hF; //clear the entry
                                                   port_2_ptr = (port_2_ptr + buffer_bias + 1) % 8; //move the pointer
                                                end else begin
                                                   port_2_dest = 4'hF; //not connected
                                                end
                                            end
                                        end
                                        
                                        
                                        4'd3: begin
                                        if (~port_locked[3])begin
                                              if (port_3_buffer [(port_3_ptr + buffer_bias) % 8] == dst_port) begin
                                                     dest_found = 1; //found a destination
                                                     port_locked[3] = 1;
                                                     port_3_dest = dst_port; //assign this src port to the dst port
                                                     port_3_buffer [(port_3_ptr + buffer_bias) % 8] = 4'hF; //clear the entry
                                                     port_3_ptr = (port_3_ptr + buffer_bias + 1) % 8; //move the pointer
                                                  end else begin
                                                     port_3_dest = 4'hF; //not connected
                                                  end
                                              end
                                        end
                                        
                                        
                                        4'd4: begin
                                        if (~port_locked[4])begin
                                                if (port_4_buffer [(port_4_ptr + buffer_bias) % 8] == dst_port) begin
                                                       dest_found = 1; //found a destination
                                                       port_locked[4] = 1;
                                                       port_4_dest = dst_port; //assign this src port to the dst port
                                                       port_4_buffer [(port_4_ptr + buffer_bias) % 8] = 4'hF; //clear the entry
                                                       port_4_ptr = (port_4_ptr + buffer_bias + 1) % 8; //move the pointer
                                                    end else begin
                                                       port_4_dest = 4'hF; //not connected
                                                    end
                                                end
                                           end
          
          
                                        4'd5: begin
                                        if (~port_locked[5])begin
                                                if (port_5_buffer [(port_5_ptr + buffer_bias) % 8] == dst_port) begin
                                                       dest_found = 1; //found a destination
                                                       port_locked[5] = 1;
                                                       port_5_dest = dst_port; //assign this src port to the dst port
                                                       port_5_buffer [(port_5_ptr + buffer_bias) % 8] = 4'hF; //clear the entry
                                                       port_5_ptr = (port_5_ptr + buffer_bias + 1) % 8; //move the pointer
                                                    end else begin
                                                       port_5_dest = 4'hF; //not connected
                                                    end
                                                end
                                          end
                                                
                                        4'd6: begin
                                        if (~port_locked[6])begin
                                                  if (port_6_buffer [(port_6_ptr + buffer_bias) % 8] == dst_port) begin
                                                         dest_found = 1; //found a destination
                                                         port_6_dest = dst_port; //assign this src port to the dst port
                                                         port_locked [6] = 1;
                                                         port_6_buffer [(port_6_ptr + buffer_bias) % 8] = 4'hF; //clear the entry
                                                         port_6_ptr = (port_6_ptr + buffer_bias + 1) % 8; //move the pointer
                                                      end else begin
                                                         port_6_dest = 4'hF; //not connected
                                                      end
                                                  end
                                         end
                                                  
                                        4'd7: begin
                                         if (~port_locked[7])begin
                                                    if (port_7_buffer [(port_7_ptr + buffer_bias) % 8] == dst_port) begin
                                                           dest_found = 1; //found a destination
                                                           port_locked[7] = 1;
                                                           port_7_dest = dst_port; //assign this src port to the dst port
                                                           port_7_buffer [(port_7_ptr + buffer_bias) % 8] = 4'hF; //clear the entry
                                                           port_7_ptr = (port_7_ptr + buffer_bias + 1) % 8; //move the pointer
                                                        end else begin
                                                           port_7_dest = 4'hF; //not connected
                                                        end
                                                    end                       
                                            end                                                                                                                                     
                            
                                        default: begin end
                                        
                                      endcase // case (i)	
                        end //if ~dest_found
        
               end // for (k = 0 ; j < 8 ; k = k + 1)
               
            end // if (!dest_found) 
            
         end // for (j = 0 ; j < 8 ; j = j + 1)
    
       end // for (i = 0 ; i < 8 ; i = i + 1)


   #1;
   port_dst = {port_0_dest, port_1_dest, port_2_dest, port_3_dest, port_4_dest, port_5_dest, port_6_dest, port_7_dest};   
   cur_state = TRANSMITTING;
   counter_bias = (counter_bias + 1)%8 ;
  end
end // always @ (cur_state == LOADING)


   reg AND_of_buffers; //when buffers are empty, this will 
   integer and_i, and_j, and_k;
   
   always @(posedge clk)begin
      
     AND_of_buffers =   &port_0_buffer[0] & &port_0_buffer[1] & &port_0_buffer[2] & &port_0_buffer[3] & &port_0_buffer[4] & &port_0_buffer[5] & &port_0_buffer[6] & &port_0_buffer[7] &
                        &port_1_buffer[0] & &port_1_buffer[1] & &port_1_buffer[2] & &port_1_buffer[3] & &port_1_buffer[4] & &port_1_buffer[5] & &port_1_buffer[6] & &port_1_buffer[7] &
                        &port_2_buffer[0] & &port_2_buffer[1] & &port_2_buffer[2] & &port_2_buffer[3] & &port_2_buffer[4] & &port_2_buffer[5] & &port_2_buffer[6] & &port_2_buffer[7] &
                        &port_3_buffer[0] & &port_3_buffer[1] & &port_3_buffer[2] & &port_3_buffer[3] & &port_3_buffer[4] & &port_3_buffer[5] & &port_3_buffer[6] & &port_3_buffer[7] &
                        &port_4_buffer[0] & &port_4_buffer[1] & &port_4_buffer[2] & &port_4_buffer[3] & &port_4_buffer[4] & &port_4_buffer[5] & &port_4_buffer[6] & &port_4_buffer[7] &
                        &port_5_buffer[0] & &port_5_buffer[1] & &port_5_buffer[2] & &port_5_buffer[3] & &port_5_buffer[4] & &port_5_buffer[5] & &port_5_buffer[6] & &port_5_buffer[7] &
                        &port_6_buffer[0] & &port_6_buffer[1] & &port_6_buffer[2] & &port_6_buffer[3] & &port_6_buffer[4] & &port_6_buffer[5] & &port_6_buffer[6] & &port_6_buffer[7] &
                        &port_7_buffer[0] & &port_7_buffer[1] & &port_7_buffer[2] & &port_7_buffer[3] & &port_7_buffer[4] & &port_7_buffer[5] & &port_7_buffer[6] & &port_7_buffer[7];
     srdy = 1;

      
   end // always @ (cur_state == TRANSMITTING)
   
   
   
   always @(posedge clk)begin
   
        
        if (cur_state == TRANSMITTING) begin
        
                srdy = 0;
    
                    if (AND_of_buffers) begin
                        cur_state = IDLE;
                        nxt_state = IDLE;
                    end else begin
                        cur_state = SCANNING;    
                    end
        
        end
 
    end
   
      always @(posedge rst) begin
        
              nxt_state <= SCANNING;
              port_dst <= 32'hFFFF_FFFF;
              srdy <= 0;
              counter_bias <= 0;
              cur_state <= IDLE;
              port_0_dest <= 4'hF;
              port_1_dest <= 4'hF;
              port_2_dest <= 4'hF;
              port_3_dest <= 4'hF;
              port_4_dest <= 4'hF;
              port_5_dest <= 4'hF;
              port_6_dest <= 4'hF;
              port_7_dest <= 4'hF;
              neuron_serviced_n <= 0;
              for (rst_index = 0 ; rst_index < 8 ; rst_index = rst_index + 1)begin
                    port_0_buffer [rst_index] <= 4'hF;
                    port_1_buffer [rst_index] <= 4'hF;
                    port_2_buffer [rst_index] <= 4'hF;
                    port_3_buffer [rst_index] <= 4'hF;
                    port_4_buffer [rst_index] <= 4'hF;
                    port_5_buffer [rst_index] <= 4'hF;
                    port_6_buffer [rst_index] <= 4'hF;
                    port_7_buffer [rst_index] <= 4'hF;
              end
              port_0_ptr <= 0;
              port_1_ptr <= 0;
              port_2_ptr <= 0;
              port_3_ptr <= 0;
              port_4_ptr <= 0;
              port_5_ptr <= 0;
              port_6_ptr <= 0;
              port_7_ptr <= 0;
              
              #1;
              
   end // always @ (posedge rst)

   
endmodule // arbiter

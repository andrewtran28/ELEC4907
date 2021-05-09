`timescale 1ns/1ns

module neuron
  (
   input_value,
   input_weight,
   input_bias,
   rst,
   en,
   srdy,
   output_value,
   drdy,
   done
   );
   
   input [(16*8)-1:0] input_value;
   input [(16*8)-1:0] input_weight;
   input [16-1:0]     input_bias;
   input           rst;
   input           en;
   input           srdy;

   reg [16-1:0]       input_value_loc [8-1:0];
   reg [16-1:0]       input_weight_loc [8-1:0];
   reg [16-1:0]       input_bias_loc;
   output reg [16-1:0]       output_value;
   reg [16-1:0]       output_value_loc;
   output reg 		      drdy;
   output reg 		      done;
   reg [8-1:0] 	      proc_flag_loc;
   reg [4-1:0] 	      cur_state;
   reg [4-1:0] 	      nxt_state;
    reg fma_mul_flag;

    reg            fma_en;
    reg [16-1:0] fma_a;
    reg [16-1:0] fma_b;
    reg [16-1:0] fma_c;
    wire [16-1:0] fma_z;
    wire      fma_done;
assign fma_done = 1;
   
   parameter IDLE = 4'd0, 
     PROC_0 = 4'd1, PROC_1 = 4'd2, PROC_2 = 4'd3, 
     PROC_3 = 4'd4, PROC_4 = 4'd5, PROC_5 = 4'd6, 
     PROC_6 = 4'd7, PROC_7 = 4'd8, PROC_SUM = 4'd9;
   

   //always @(posedge done) output_value <= output_value_loc;
   
   
   always @(posedge rst)begin
      output_value <= 0;
      output_value_loc <= 0;
      //done <= 0;
      input_value_loc [0] <= 0;
      input_weight_loc[0] <= 0;
      input_value_loc [1] <= 0;
      input_weight_loc[1] <= 0;
      input_value_loc [2] <= 0;
      input_weight_loc[2] <= 0;
      input_value_loc [3] <= 0;
      input_weight_loc[3] <= 0;
      input_value_loc [4] <= 0;
      input_weight_loc[4] <= 0;
      input_value_loc [5] <= 0;
      input_weight_loc[5] <= 0;
      input_value_loc [6] <= 0;
      input_weight_loc[6] <= 0;
      input_value_loc [7] <= 0;
      input_weight_loc[7] <= 0;      
      input_bias_loc <= 0;
      proc_flag_loc <= 0;
      //cur_state <= IDLE;
      fma_a <= 0;
      fma_b <= 0;
      fma_c <= 0;
      fma_en <= 0;
      //drdy <= 1;
      #1; //line delay 
   end

   always @(posedge srdy)begin
      input_value_loc [0] <= input_value[128-1-(16*0): 128-(16*1)];
      input_value_loc [1] <= input_value[128-1-(16*1): 128-(16*2)];
      input_value_loc [2] <= input_value[128-1-(16*2): 128-(16*3)];
      input_value_loc [3] <= input_value[128-1-(16*3): 128-(16*4)];
      input_value_loc [4] <= input_value[128-1-(16*4): 128-(16*5)];
      input_value_loc [5] <= input_value[128-1-(16*5): 128-(16*6)];
      input_value_loc [6] <= input_value[128-1-(16*6): 128-(16*7)];
      input_value_loc [7] <= input_value[128-1-(16*7): 128-(16*8)];

      input_weight_loc [0] <= input_weight[128-1-(16*0): 128-(16*1)];
      input_weight_loc [1] <= input_weight[128-1-(16*1): 128-(16*2)];
      input_weight_loc [2] <= input_weight[128-1-(16*2): 128-(16*3)];
      input_weight_loc [3] <= input_weight[128-1-(16*3): 128-(16*4)];
      input_weight_loc [4] <= input_weight[128-1-(16*4): 128-(16*5)];
      input_weight_loc [5] <= input_weight[128-1-(16*5): 128-(16*6)];
      input_weight_loc [6] <= input_weight[128-1-(16*6): 128-(16*7)];
      input_weight_loc [7] <= input_weight[128-1-(16*7): 128-(16*8)];

      input_bias_loc <= input_bias;
      proc_flag_loc <= 8'hFF;
      
      //done <= 0;
      
      //cur_state <= PROC_0;
      
      //drdy = 0; 
      #1;//line delay
   end


   always @(negedge srdy) begin 
      drdy = 1; 
      #1;//line delay
   end
   
   
   //next state calculation
   always @(cur_state )begin
      case (cur_state)
                IDLE: begin
                   nxt_state <= IDLE;
                   done <= 1;
                end // case: IDLE
                PROC_0: nxt_state <= PROC_1;
                PROC_1: nxt_state <= PROC_2;
                PROC_2: nxt_state <= PROC_3;
                PROC_3: nxt_state <= PROC_4;
                PROC_4: nxt_state <= PROC_5;
                PROC_5: nxt_state <= PROC_6;
                PROC_6: nxt_state <= PROC_7;
                PROC_7: nxt_state <= PROC_SUM;
                PROC_SUM: nxt_state <= IDLE;
                default: nxt_state <= IDLE;	
      endcase // case (cur_state)
   end


   //multiply logic 
   always @(proc_flag_loc) begin
                  //fma_mul_flag <= 1;
                  fma_c <= 0;
                  
                  case (cur_state)
                                IDLE: begin
                                   fma_a <= 0;
                                   fma_b <= 0;
                                   fma_en <= 0;
                                end
                                
                                PROC_0: begin
                                   fma_a <= input_value_loc[0];
                                   fma_b <= input_weight_loc[0];
                                   fma_en <= 1;
                                end
                            
                                PROC_1: begin
                                   fma_a <= input_value_loc[1];
                                   fma_b <= input_weight_loc[1];
                                   fma_en <= 1;
                                end
                            
                                PROC_2: begin
                                   fma_a <= input_value_loc[2];
                                   fma_b <= input_weight_loc[2];
                                   fma_en <= 1;
                                end
                            
                                PROC_3: begin
                                   fma_a <= input_value_loc[3];
                                   fma_b <= input_weight_loc[3];
                                   fma_en <= 1;
                                end
                            
                                PROC_4: begin
                                   fma_a <= input_value_loc[4];
                                   fma_b <= input_weight_loc[4];
                                   fma_en <= 1;
                                end
                            
                                PROC_5: begin
                                   fma_a <= input_value_loc[5];
                                   fma_b <= input_weight_loc[5];
                                   fma_en <= 1;
                                end
                            
                                PROC_6: begin
                                   fma_a <= input_value_loc[6];
                                   fma_b <= input_weight_loc[6];
                                   fma_en <= 1;
                                end
                            
                                PROC_7: begin
                                   fma_a <= input_value_loc[7];
                                   fma_b <= input_weight_loc[7];
                                   fma_en <= 1;
                                end
                            
                                PROC_SUM: begin
                                   fma_a <= 1;
                                   fma_b <= output_value_loc;
                                   fma_c <= input_bias;
                                   fma_en <= 1;
                                   //fma_mul_flag <= 0;
                                end
                                
                                default : begin
                                end
                                
                  endcase // case (cur_state)
      
   end // always @ (proc_flag_loc)


   
   always @(posedge fma_done ) begin      
//      fma_en = 0;
      #1;
      
      if (fma_mul_flag) begin //just finished multiplying fma_a fma_b, so begin adding output
             fma_a <= 1;
             fma_b <= fma_z;
             fma_c <= output_value_loc;
             //fma_mul_flag <= 0;
             fma_en <= 1;
             
              end else begin //just finished adding the product to the output, next.
                         output_value_loc <= fma_z;
                         //fma_mul_flag <= 1;
                         case (cur_state) 
                               PROC_0: proc_flag_loc[7] <= 0;
                               PROC_1: proc_flag_loc[6] <= 0;
                               PROC_2: proc_flag_loc[5] <= 0;
                               PROC_3: proc_flag_loc[4] <= 0;
                               PROC_4: proc_flag_loc[3] <= 0;
                               PROC_5: proc_flag_loc[2] <= 0;
                               PROC_6: proc_flag_loc[1] <= 0;
                               PROC_7: proc_flag_loc[0] <= 0;
                               default: begin end
                         endcase // case (cur_state)
                         
                         cur_state <= nxt_state;
                         
      end
   end // always @ (posedge fma_done )


   
   
   

endmodule // neuron

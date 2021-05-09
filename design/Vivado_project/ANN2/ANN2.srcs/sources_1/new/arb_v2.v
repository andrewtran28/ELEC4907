`timescale 1ns / 1ps

module arb_v2(
    network,
    neuron_done,
    rst,
    drdy,
    srdy,
    dst,
    en
    );
    
    input en; //enable
    input [7:0] neuron_done; //output coming from the neurons, signals they are finished 
    input [255:0] network; //network settigns for this layer
    input rst; //reset
    input drdy; //destination ready (handshake signal)
    output reg srdy; //source ready (handshake signal)
    output reg [31:0] dst; //curent  network setting to be sent to routing engine
    
    reg [3:0] port_buffer [7:0][7:0]; //8x8 array of 4b 
    reg [3:0] port_buffer_pipeline_0 [7:0][7:0]; //8x8 array of 4b 
    reg [3:0] port_buffer_pipeline_1 [7:0][7:0]; //8x8 array of 4b 
    reg [3:0] port_pointer [7:0]; //8 4b pointers, one for each port buffer
    reg [3:0] port_destination [7:0]; //8 4b destination port values, one for each port
    wire [3:0] port_network [7:0][7:0]; //4b 8x8 wire array describing the port connections required for each network
    reg [2:0] cur_state; parameter IDLE = 0, LOADING = 1, ARBITRATION = 2, HANDSHAKING = 3, TRANSMITTING = 4;
    reg [7:0] neuron_serviced; //neurons which have already buffered their outputs
    reg [7:0] neuron_current;  //neurons which are currently waiting to be transmitted
    reg neuron_pending;
    integer i, j, k;
    integer print_i, print_j, print_k;
    
    assign port_network [0][0] = network [255-(4*0) -: 4]; assign port_network [0][1] = network [255-(4*1) -: 4]; assign port_network [0][2] = network [255-(4*2) -: 4]; assign port_network [0][3] = network [255-(4*3) -: 4];
    assign port_network [0][4] = network [255-(4*4) -: 4]; assign port_network [0][5] = network [255-(4*5) -: 4]; assign port_network [0][6] = network [255-(4*6) -: 4]; assign port_network [0][7] = network [255-(4*7) -: 4];
    
    assign port_network [1][0] = network [255-(4*8) -: 4];
    assign port_network [1][1] = network [255-(4*9) -: 4];
    assign port_network [1][2] = network [255-(4*10) -: 4];
    assign port_network [1][3] = network [255-(4*11) -: 4];
    assign port_network [1][4] = network [255-(4*12) -: 4];
    assign port_network [1][5] = network [255-(4*13) -: 4];
    assign port_network [1][6] = network [255-(4*14) -: 4];
    assign port_network [1][7] = network [255-(4*15) -: 4];
    
    assign port_network [2][0] = network [255-(4*16) -: 4];
    assign port_network [2][1] = network [255-(4*17) -: 4];
    assign port_network [2][2] = network [255-(4*18) -: 4];
    assign port_network [2][3] = network [255-(4*19) -: 4];
    assign port_network [2][4] = network [255-(4*20) -: 4];
    assign port_network [2][5] = network [255-(4*21) -: 4];
    assign port_network [2][6] = network [255-(4*22) -: 4];
    assign port_network [2][7] = network [255-(4*23) -: 4];
    
    assign port_network [3][0] = network [255-(4*24) -: 4];
    assign port_network [3][1] = network [255-(4*25) -: 4];
    assign port_network [3][2] = network [255-(4*26) -: 4];
    assign port_network [3][3] = network [255-(4*27) -: 4];
    assign port_network [3][4] = network [255-(4*28) -: 4];
    assign port_network [3][5] = network [255-(4*29) -: 4];
    assign port_network [3][6] = network [255-(4*30) -: 4];
    assign port_network [3][7] = network [255-(4*31) -: 4];
    
    assign port_network [4][0] = network [255-(4*32) -: 4];
    assign port_network [4][1] = network [255-(4*33) -: 4];
    assign port_network [4][2] = network [255-(4*34) -: 4];
    assign port_network [4][3] = network [255-(4*35) -: 4];
    assign port_network [4][4] = network [255-(4*36) -: 4];
    assign port_network [4][5] = network [255-(4*37) -: 4];
    assign port_network [4][6] = network [255-(4*38) -: 4];
    assign port_network [4][7] = network [255-(4*39) -: 4];
    
    assign port_network [5][0] = network [255-(4*40) -: 4];
    assign port_network [5][1] = network [255-(4*41) -: 4];
    assign port_network [5][2] = network [255-(4*42) -: 4];
    assign port_network [5][3] = network [255-(4*43) -: 4];
    assign port_network [5][4] = network [255-(4*44) -: 4];
    assign port_network [5][5] = network [255-(4*45) -: 4];
    assign port_network [5][6] = network [255-(4*46) -: 4];
    assign port_network [5][7] = network [255-(4*47) -: 4];
    
    assign port_network [6][0] = network [255-(4*48) -: 4];
    assign port_network [6][1] = network [255-(4*49) -: 4];
    assign port_network [6][2] = network [255-(4*50) -: 4];
    assign port_network [6][3] = network [255-(4*51) -: 4];
    assign port_network [6][4] = network [255-(4*52) -: 4];
    assign port_network [6][5] = network [255-(4*53) -: 4];
    assign port_network [6][6] = network [255-(4*54) -: 4];
    assign port_network [6][7] = network [255-(4*55) -: 4];
    
    assign port_network [7][0] = network [255-(4*56) -: 4];
    assign port_network [7][1] = network [255-(4*57) -: 4];
    assign port_network [7][2] = network [255-(4*58) -: 4];
    assign port_network [7][3] = network [255-(4*59) -: 4];
    assign port_network [7][4] = network [255-(4*60) -: 4];
    assign port_network [7][5] = network [255-(4*61) -: 4];
    assign port_network [7][6] = network [255-(4*62) -: 4];
    assign port_network [7][7] = network [255-(4*63) -: 4];

     wire [7:0] BUFFER_AND;
          assign BUFFER_AND[0] = (&port_buffer[0][0]) & (&port_buffer[0][1]) & (&port_buffer[0][2]) & (&port_buffer[0][3]) & 
                                   (&port_buffer[0][4]) & (&port_buffer[0][5]) & (&port_buffer[0][6]) & (&port_buffer[0][7]);
          assign BUFFER_AND[1] = (&port_buffer[1][0]) & (&port_buffer[1][1]) & (&port_buffer[1][2]) & (&port_buffer[1][3]) & 
                                   (&port_buffer[1][4]) & (&port_buffer[1][5]) & (&port_buffer[1][6]) & (&port_buffer[1][7]); 
          assign BUFFER_AND[2] = (&port_buffer[2][0]) & (&port_buffer[2][1]) & (&port_buffer[2][2]) & (&port_buffer[2][3]) & 
                                   (&port_buffer[2][4]) & (&port_buffer[2][5]) & (&port_buffer[2][6]) & (&port_buffer[2][7]); 
          assign BUFFER_AND[3] = (&port_buffer[3][0]) & (&port_buffer[3][1]) & (&port_buffer[3][2]) & (&port_buffer[3][3]) & 
                                   (&port_buffer[3][4]) & (&port_buffer[3][5]) & (&port_buffer[3][6]) & (&port_buffer[3][7]); 
          assign BUFFER_AND[4] = (&port_buffer[4][0]) & (&port_buffer[4][1]) & (&port_buffer[4][2]) & (&port_buffer[4][3]) & 
                                   (&port_buffer[4][4]) & (&port_buffer[4][5]) & (&port_buffer[4][6]) & (&port_buffer[4][7]); 
          assign BUFFER_AND[5] = (&port_buffer[5][0]) & (&port_buffer[5][1]) & (&port_buffer[5][2]) & (&port_buffer[5][3]) & 
                                   (&port_buffer[5][4]) & (&port_buffer[5][5]) & (&port_buffer[5][6]) & (&port_buffer[5][7]);
          assign BUFFER_AND[6] = (&port_buffer[6][0]) & (&port_buffer[6][1]) & (&port_buffer[6][2]) & (&port_buffer[6][3]) & 
                                   (&port_buffer[6][4]) & (&port_buffer[6][5]) & (&port_buffer[6][6]) & (&port_buffer[6][7]);
          assign BUFFER_AND[7] = (&port_buffer[7][0]) & (&port_buffer[7][1]) & (&port_buffer[7][2]) & (&port_buffer[7][3]) & 
                                   (&port_buffer[7][4]) & (&port_buffer[7][5]) & (&port_buffer[7][6]) & (&port_buffer[7][7]);
          
    /*
        >> This module implements a 3-state FSM.
            1. IDLE 
            2. LOADING
            3. ARBITRATION
            4. HANDSHAKING 
            5. TRANSMITTING

                                     v--------else--\
        IDLE --(|neuron_done)--> LOADING --(|neuron_current==0)--> ARBITRATION --> HANDSHAKING --(srdy & drdy)--> TRANSMITTING
         ^                          ^----(|neuron_current==1)---------(!srdy)<-----------------------------------------/ 
         --------------------------------(|neuron_current==0)------/
         
    */
    
    /*
        >> Whenever any of the neurons finish, we will begin to put their destination address into the 
            port queue to await transmission.
    */
    always @ (neuron_done) begin
              
              if (en & ~rst) begin
                  
                  /*
                    >> We have 3 register sets that matter in this scenario:
                        neuron_Serviced, neuron_Current, and neuron_Done.
                    >> The neurons which need to be added into the queue are toggled in the neuron_Current register.
                    >> The neurons which have already been transmitted and require no attention are in the 
                        neuron_Serviced regsiter.
                    >> neuron_Done is a bus concatinated from all of the neuron's <done> signal outputs.
                  */
                  
                  /*
                    >> <neuron_current> will hold the neurons which have not been serviced yet, but need to 
                        be pushed through the network to the next layer
                  */ 
                    neuron_current = neuron_done ^ neuron_serviced; 
                    neuron_pending = 1;
                    $display("neuron_curent = %b\tneuron_done = %b\tneuron_serviced = %b", neuron_current, neuron_done, neuron_serviced);
                    $display("***");
                    #1;
                    //WE USE BLOCKING ASSIGNMENT TO AVOID <neuron_current> GOING METASTABLE ACROSS LOGIC.
                    if(cur_state == IDLE) cur_state = LOADING; //next state
                    
               end //if enable
               
      end  
            
            
      integer LOADING_i, LOADING_j;
      /*
        >> During LOADING state we will push the destination addresses of each finished neuron onto the port buffer
            dedicated to that neuron. Neuron 0 is tied to Port 0 thus Port Buffer 0 and so on...
      */  
      always @ (posedge cur_state == LOADING) begin
      
        if (en & ~rst) begin
        
                neuron_pending = 0;
        
                for (LOADING_i = 7; LOADING_i >= 0; LOADING_i = LOADING_i-1) begin //for each port
                
                        if(neuron_current [LOADING_i]) begin //if that neuron is done and has not pushed data through yet 
                        
                            for(LOADING_j = 7; LOADING_j >= 0; LOADING_j = LOADING_j-1) begin
                            
                                port_buffer[LOADING_i][LOADING_j] = port_network[LOADING_i][LOADING_j]; //load all destinations into the port buffer
                                
                            end//for j
                            
                            neuron_serviced[LOADING_i] = 1; //this neuron has been serviced, its data will be pushed to next layer
                            #1;
                       
                        end//if neuron_current
                        
                end//for i
                
               cur_state = ARBITRATION; //next state
               
        end //if enable
        
      end
      
      /*
          >> We now go through each buffer in round-robin fashion. We use the buffer pointer to know where to start reading each buffer from. 
          >> When we finishing making a particular connection in the network, we set that element IN THE BUFFER to hF (no connection) and we 
            lock the port from further modificaitons.
          >> If the first element in the buffer is not for the destired port, we check all elements behind the first entry. This is to avoid 
            head-of-line blocking. We attempt to service each port once during each network configuration cycle.
          >> If there is no connection to be made for that particular port, we set that port destination to hF (no connection).
      */
      reg destination_found;
      reg [7:0] port_locked;
      reg [3:0] pointer_initial_value;
      integer ARBITRATION_i;
      always @(posedge cur_state == ARBITRATION) begin
      
      if(en & ~rst) begin
      
        for(ARBITRATION_i = 7 ; ARBITRATION_i >= 0; ARBITRATION_i = ARBITRATION_i - 1) begin
            //reset local registers
            port_destination[ARBITRATION_i] = 4'hF; //No connection (NC)
            port_locked[ARBITRATION_i] = 0;    
        end
        
        for(i = 0 ; i < 8 ; i = i + 1) begin //we are looking to make a connection to destination <i>
        
            destination_found = 0;//reset destination found register
            
            for(j = 0 ; j < 8 ; j = j + 1) begin //we go through each port <j> to find a destination to <i>
    
                    if ((~port_locked[j]) & (~BUFFER_AND[j])) begin //if this port does not have a connection already
                    
                        $display ("Finding connectino to output port %d", j);
                    
                        for(k = 7; k >= 0 ; k = k - 1) begin //go through the port buffer, starting from the location of the pointer 
                                                    
                            if (~destination_found)begin //if we haven't gone through the whole buffer and have not found the destination port yet
                        
                                if(port_buffer[j][k] == i) begin
                                                                    
                                    destination_found = 1;
                                    port_locked[j] = 1;
                                    port_destination[j] = i;
                                    port_buffer[j][k] = 4'hF; //clear this buffer element by setting no connection
                                    #1;
                                         
                                end//if port_buffer[j][port_pointer[i]] == i
     
                            end//if ~destination_found
                            #1;
                        
                        end//for k
                    
                   end//~port_locked
                    
             end//for j
            
        end//for i
        
        $display ("*{PTR}[BUFFER CONTENTS]:[SRC]-->[DST]");
        for(i = 7 ; i >= 0; i = i - 1) begin
            $display("*{%d}[%H,%H,%H,%H,%H,%H,%H,%H]:[%H]-->[%H]", port_pointer[i], port_buffer[i][0], port_buffer[i][1], port_buffer[i][2], port_buffer[i][3], port_buffer[i][4], port_buffer[i][5], port_buffer[i][6], port_buffer[i][7], i, port_destination[i]);
        
        end
                $display ("###");

        cur_state = HANDSHAKING;
        #1;
        
       end //if enable
      
      end//always
      
      
      // >> As we begin handshaking, by setting Source Ready <srdy> HIGH, we re-time the port destinations on the dst output using flops
      always @(posedge cur_state == HANDSHAKING) begin
        
        if(en & ~rst) begin
        
          //flop the destination addresses
          dst <= {port_destination[0], port_destination[1], port_destination[2], port_destination[3], 
                  port_destination[4], port_destination[5], port_destination[6], port_destination[7]};
          
          srdy <= 1;
          
          #1;
        
        end //if enable
                    
      end
      
      
      // >> Upon successful handshake, we wait in TRANSMITTING state for the destination to finish receiving data
      always @(posedge (srdy & drdy)) begin
      
        if (en  & ~rst) begin
        
          if(cur_state == HANDSHAKING) begin
          
                cur_state = TRANSMITTING;
                #1;
                
          end
        
        end // if enable
          
      end
      
      
      /* 
        >> When the destination de-asserts the handshaking signal, so do we.
        >> We also begin our next-state analysis. 
      */
      always @(negedge drdy) begin
      
      $display ("Network Transmission SUCCESS\t~~~");
      
          if (en) begin
          
              if (cur_state == TRANSMITTING) begin
              
                srdy = 0;
                
                if(&BUFFER_AND) begin
                    cur_state = IDLE;
                end else if (neuron_pending) begin
                    cur_state = LOADING;
                end else begin
                    cur_state = ARBITRATION;
                end
                
                #1;
    
              end
          
          end //if enable
          
      end
              
              
      /* 
        >> RESETS 
      */
      integer rst_i, rst_j;
      always @ (posedge rst) begin
      
        destination_found <= 0;
        port_locked <= 0;
        pointer_initial_value <= 0;
        srdy <= 0;
        dst <= 0;
        cur_state <= 0;
        neuron_pending <= 0;
        for(rst_i = 0 ; rst_i < 8; rst_i = rst_i + 1) begin
            port_pointer [rst_i] <= 7;
            port_destination [rst_i] <= 0;
            neuron_serviced [rst_i] <= 0;
            neuron_current [rst_i] <= 0;
            for(rst_j = 0 ; rst_j < 8; rst_j = rst_j + 1) begin
                port_buffer [rst_i][rst_j] <= 4'hF; //no connection
            end
        end
      
        #1;
        
      end
    
    
endmodule

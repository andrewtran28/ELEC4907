//Refer to the Memory Map spreadsheet for more info...:
`define LAYER_0_START_ADDRESS 16'h0000
`define OFFSET_NEURON_0 16'h0000
`define OFFSET_INPUT_VALUE 16'h0000
`define OFFSET_WEIGHT_VALUE 16'h0010
`define OFFSET_BIAS_VALUE 16'h0020
`define OFFSET_OUTPUT_VALUE 16'h0022
`define OFFSET_FORWARD_NETWORK 16'h0024
`define OFFSET_REVERSE_NETWORK 16'h0044
`define OFFSET_NEURON_1 16'h0064
`define OFFSET_NEURON_2 16'h00C8
`define OFFSET_NEURON_3 16'h012C
`define OFFSET_NEURON_4 16'h0190
`define OFFSET_NEURON_5 16'h01F4
`define OFFSET_NEURON_6 16'h0258
`define OFFSET_NEURON_7 16'h02BC
`define LAYER_0_END_ADDRESS   16'h032F
`define LAYER_1_START_ADDRESS 16'h0330
`define LAYER_1_END_ADDRESS   16'h065F
`define LAYER_2_START_ADDRESS 16'h0660
`define LAYER_2_END_ADDRESS   16'h098F
`define LAYER_3_START_ADDRESS 16'h0990
`define LAYER_3_END_ADDRESS   16'h0CBF
`define LAYER_4_START_ADDRESS 16'h0CC0
`define LAYER_4_END_ADDRESS   16'h0FEF
`define LAYER_5_START_ADDRESS 16'h0FF0
`define LAYER_5_END_ADDRESS   16'h131F
`define LAYER_6_START_ADDRESS 16'h1320
`define LAYER_6_END_ADDRESS   16'h164F
`define LAYER_7_START_ADDRESS 16'h1650
`define LAYER_7_END_ADDRESS   16'h197F
`define OFFSET_LAYER_PROCESSING_FLAGS 16'h0320
`define TRAINING_START_ADDRESS     16'h1980
`define OFFSET_FINAL_OUTPUT_VALUE 16'h0000
`define OFFSET_FINAL_ERROR_VALUE 16'h0080
`define OFFSET_TRAINING_FLAGS 16'h0100
`define TRAINING_END_ADDRESS       16'h1A81
`define MASTER_END_ADDRESS    16'hFFFF

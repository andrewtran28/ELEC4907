###############################################################
#  Generated by:      Cadence Encounter 11.12-s136_1
#  OS:                Linux x86_64(Host ID thor.doe.carleton.ca)
#  Generated on:      Thu Jan 30 22:01:09 2020
#  Design:            routing_engine
#  Command:           saveDesign ../../ann_routing_engine_clocked/synthesized/routing_engine.enc
###############################################################
set sdc_version 1.4
current_design routing_engine
create_clock [get_ports {clk}]  -name clk -period 10.000000 -waveform {0.000000 5.000000}
set_propagated_clock  [get_ports {clk}]
set_false_path  -from [get_ports {rst}] 
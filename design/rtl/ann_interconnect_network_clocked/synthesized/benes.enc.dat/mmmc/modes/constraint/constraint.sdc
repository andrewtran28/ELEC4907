###############################################################
#  Generated by:      Cadence Encounter 11.12-s136_1
#  OS:                Linux x86_64(Host ID thor.doe.carleton.ca)
#  Generated on:      Thu Jan 30 23:29:02 2020
#  Design:            benes
#  Command:           saveDesign benes.enc
###############################################################
set sdc_version 1.4
current_design benes
create_clock [get_ports {clk}]  -name clk -period 10.000000 -waveform {0.000000 5.000000}
set_propagated_clock  [get_ports {clk}]
set_false_path  -from [get_ports {rst}] 

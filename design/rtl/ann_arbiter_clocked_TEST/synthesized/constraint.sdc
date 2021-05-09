-e set_time_unit –nanoseconds
create_clock -name {clk} -period 1.0 -waveform {0.0 5.0} [get_ports {clk}]
set_false_path -from [get_ports {rst}]

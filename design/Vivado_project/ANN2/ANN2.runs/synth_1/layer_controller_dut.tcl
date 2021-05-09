# 
# Synthesis run script generated by Vivado
# 

set TIME_start [clock seconds] 
proc create_report { reportName command } {
  set status "."
  append status $reportName ".fail"
  if { [file exists $status] } {
    eval file delete [glob $status]
  }
  send_msg_id runtcl-4 info "Executing : $command"
  set retval [eval catch { $command } msg]
  if { $retval != 0 } {
    set fp [open $status w]
    close $fp
    send_msg_id runtcl-5 warning "$msg"
  }
}
create_project -in_memory -part xc7a100tcsg324-2L

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_property webtalk.parent_dir C:/Users/vladimirmilicevic/Desktop/ANN2/ANN2.cache/wt [current_project]
set_property parent.project_path C:/Users/vladimirmilicevic/Desktop/ANN2/ANN2.xpr [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language Verilog [current_project]
set_property ip_output_repo c:/Users/vladimirmilicevic/Desktop/ANN2/ANN2.cache/ip [current_project]
set_property ip_cache_permissions {read write} [current_project]
add_files -quiet C:/Users/vladimirmilicevic/Desktop/ANN2/ANN2.runs/benes_synth_1/benes.dcp
set_property used_in_implementation false [get_files C:/Users/vladimirmilicevic/Desktop/ANN2/ANN2.runs/benes_synth_1/benes.dcp]
add_files -quiet C:/Users/vladimirmilicevic/Desktop/ANN2/ANN2.runs/routing_engine_synth_1/routing_engine.dcp
set_property used_in_implementation false [get_files C:/Users/vladimirmilicevic/Desktop/ANN2/ANN2.runs/routing_engine_synth_1/routing_engine.dcp]
add_files -quiet C:/Users/vladimirmilicevic/Desktop/ANN2/ANN2.runs/neuron_synth_1/neuron.dcp
set_property used_in_implementation false [get_files C:/Users/vladimirmilicevic/Desktop/ANN2/ANN2.runs/neuron_synth_1/neuron.dcp]
add_files -quiet C:/Users/vladimirmilicevic/Desktop/ANN2/ANN2.runs/arb_v2_synth_1/arb_v2.dcp
set_property used_in_implementation false [get_files C:/Users/vladimirmilicevic/Desktop/ANN2/ANN2.runs/arb_v2_synth_1/arb_v2.dcp]
add_files -quiet C:/Users/vladimirmilicevic/Desktop/ANN2/ANN2.runs/l1_cache_synth_1/l1_cache.dcp
set_property used_in_implementation false [get_files C:/Users/vladimirmilicevic/Desktop/ANN2/ANN2.runs/l1_cache_synth_1/l1_cache.dcp]
read_verilog C:/Users/vladimirmilicevic/Desktop/ANN2/ANN2.srcs/sources_1/imports/design/rtl/cache/memory_map.vh
read_verilog -library xil_defaultlib {
  C:/Users/vladimirmilicevic/Desktop/ANN2/ANN2.srcs/sources_1/imports/design/rtl/neuron/layer_controller.v
  C:/Users/vladimirmilicevic/Desktop/ANN2/ANN2.srcs/sources_1/imports/design/rtl/layer/layer_controller_dut.v
}
# Mark all dcp files as not used in implementation to prevent them from being
# stitched into the results of this synthesis run. Any black boxes in the
# design are intentionally left as such for best results. Dcp files will be
# stitched into the design at a later time, either when this synthesis run is
# opened, or when it is stitched into a dependent implementation run.
foreach dcp [get_files -quiet -all -filter file_type=="Design\ Checkpoint"] {
  set_property used_in_implementation false $dcp
}
read_xdc -mode out_of_context C:/Users/vladimirmilicevic/Desktop/ANN2/ANN2.srcs/sources_1/imports/design/ANN/ANN/ANN.srcs/arbiter/new/arbiter_ooc.xdc
set_property used_in_implementation false [get_files C:/Users/vladimirmilicevic/Desktop/ANN2/ANN2.srcs/sources_1/imports/design/ANN/ANN/ANN.srcs/arbiter/new/arbiter_ooc.xdc]

set_param ips.enableIPCacheLiteLoad 1
close [open __synthesis_is_running__ w]

synth_design -top layer_controller_dut -part xc7a100tcsg324-2L


# disable binary constraint mode for synth run checkpoints
set_param constraints.enableBinaryConstraints false
write_checkpoint -force -noxdef layer_controller_dut.dcp
create_report "synth_1_synth_report_utilization_0" "report_utilization -file layer_controller_dut_utilization_synth.rpt -pb layer_controller_dut_utilization_synth.pb"
file delete __synthesis_is_running__
close [open __synthesis_is_complete__ w]

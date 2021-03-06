#######################################################
#                                                     #
#  Encounter Command Logging File                     #
#  Created on Thu Jan 30 23:19:48 2020                #
#                                                     #
#######################################################

#@(#)CDS: Encounter v11.12-s136_1 (64bit) 09/24/2012 19:26 (Linux 2.6)
#@(#)CDS: NanoRoute v11.12-s009 NR120919-1551/11_10_USR2-UB (database version 2.30, 165.4.1) {superthreading v1.16}
#@(#)CDS: CeltIC v11.12-s025_1 (64bit) 09/20/2012 05:47:24 (Linux 2.6.18-194.el5)
#@(#)CDS: AAE 11.12-s002 (64bit) 09/24/2012 (Linux 2.6.18-194.el5)
#@(#)CDS: CTE 11.12-s098_1 (64bit) Sep 12 2012 04:29:44 (Linux 2.6.18-194.el5)
#@(#)CDS: CPE v11.12-s026
#@(#)CDS: IQRC/TQRC 11.1.1-s334 (64bit) Sun May  6 19:52:51 PDT 2012 (Linux 2.6.18-194.el5)

set_global _enable_mmmc_by_default_flow      $CTE::mmmc_default
suppressMessage ENCEXT-2799
win
set init_gnd_net VSS
set init_lef_file {/CMC/kits/tsmc_65nm_libs/tcbn65gplus_200a/TSMCHOME/digital/Back_End/le
f/tcbn65gplus_200a/lef/tcbn65gplus_9lmT2.lef}
set init_design_settop 0
set init_verilog interconnect_network_clocked.v
set init_pwr_net VDD
init_design
fit
fit
fit
create_rc_corner -name rc -T {25} -preRoute_res {1.0} -preRoute_cap {1.0} -preRoute_clkres {0.0} -preRoute_clkcap {0.0} -postRoute_res {1.0} -postRoute_cap {1.0} -postRoute_xcap {1.0} -postRoute_clkres {0.0} -postRoute_clkcap {0.0}
create_library_set -name worst_case -timing {/CMC/kits/tsmc_65nm_libs/tcbn65gplus_200a/TSMCHOME/digital/Front_End/t iming_power_noise/NLDM/tcbn65gplus_140b/tcbn65gpluswc.lib}
create_constraint_mode -name constraint -sdc_files {constraint.sdc}
create_delay_corner -name worst_delay -library_set {worst_case} -rc_corner {rc}
create_analysis_view -name worst_analysis -constraint_mode {constraint} -delay_corner {worst_delay}
set_analysis_view -setup {worst_analysis} -hold {worst_analysis}
getIoFlowFlag
setIoFlowFlag 0
floorPlan -r 1.0 1.79769313486e+308 10 10 10 10
uiSetTool select
getIoFlowFlag
fit

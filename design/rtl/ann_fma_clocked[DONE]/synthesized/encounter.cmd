#######################################################
#                                                     #
#  Encounter Command Logging File                     #
#  Created on Sat Jan 11 21:41:42 2020                #
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
set init_lef_file /CMC/kits/tsmc_65nm_libs/tcbn65gplus_200a/TSMCHOME/digital/Back_End/lef/tcbn65gplus_200a/lef/tcbn65gplus_9lmT2.lef
set init_design_settop 0
set init_verilog fma_clocked.v
set init_pwr_net VDD
init_design
set init_gnd_net VSS
set init_lef_file /CMC/kits/tsmc_65nm_libs/tcbn65gplus_200a/TSMCHOME/digital/Back_End/lef/tcbn65gplus_200a/lef/tcbn65gplus_9lmT2.lef
set init_design_settop 0
set init_verilog fma_clocked.v
set init_pwr_net VDD
init_design
set init_gnd_net VSS
set init_verilog fma_clocked.v
set init_pwr_net VDD
init_design
set init_gnd_net VSS
set init_verilog fma_clocked.v
set init_pwr_net VDD
init_design
create_rc_corner -name rc -T {25} -preRoute_res {1.0} -preRoute_cap {1.0} -preRoute_clkres {0.0} -preRoute_clkcap {0.0} -postRoute_res {1.0} -postRoute_cap {1.0} -postRoute_xcap {1.0} -postRoute_clkres {0.0} -postRoute_clkcap {0.0}
create_library_set -name worst_case -timing {/CMC/kits/tsmc_65nm_libs/tcbn65gplus_200a/TSMCHOME/digital/Front_End/timing_power_noise/NLDM/tcbn65gplus_140b/tcbn65gpluswc.lib}
create_constraint_mode -name constraint -sdc_files {constraint.sdc}
create_delay_corner -name worst_corner -library_set {worst_case} -rc_corner {rc}
create_analysis_view -name worst_analysis -constraint_mode {constraint} -delay_corner {worst_corner}
set_analysis_view -setup {worst_analysis} -hold {worst_analysis}
fit
getIoFlowFlag
setIoFlowFlag 0
floorPlan -site core -r 0.979823679072 0.699984 20 20 20 20
uiSetTool select
getIoFlowFlag
fit
saveDesign fma_top.enc
set sprCreateIeRingNets {}
set sprCreateIeRingLayers {}
set sprCreateIeRingWidth 1.0
set sprCreateIeRingSpacing 1.0
set sprCreateIeRingOffset 1.0
set sprCreateIeRingThreshold 1.0
set sprCreateIeRingJogDistance 1.0
addRing -stacked_via_top_layer AP -around core -jog_distance 0.1 -threshold 0.1 -nets {VDD VSS} -stacked_via_bottom_layer M1 -layer {bottom M1 top M1 right M2 left M2} -width 5 -spacing 1.5
sroute -connect { blockPin padPin padRing corePin } -layerChangeRange { M1 AP } -blockPinTarget { nearestRingStripe nearestTarget } -padPinPortConnect { allPort oneGeom } -checkAlignedSecondaryPin 1 -blockPin useLef -allowJogging 1 -crossoverViaBottomLayer M1 -allowLayerChange 1 -targetViaTopLayer AP -crossoverViaTopLayer AP -targetViaBottomLayer M1 -nets { VDD VSS }
clearGlobalNets
globalNetConnect VDD -type pgpin -pin VDD -inst *
globalNetConnect VSS -type pgpin -pin VSS -inst *
globalNetConnect VDD -type tiehi -inst *
globalNetConnect VSS -type tielo -inst *
setPlaceMode -fp false
placeDesign -prePlaceOpt
setLayerPreference pinObj -isVisible 1
setLayerPreference cellBlkgObj -isVisible 1
setLayerPreference layoutObj -isVisible 1
clockDesign -specFile Clock.ctstch -outDir clock_report -fixedInstBeforeCTS
report_timing
clockDesign -specFile Clock.ctstch -outDir clock_report -fixedInstBeforeCTS
setNanoRouteMode -quiet -drouteStartIteration default
setNanoRouteMode -quiet -routeTopRoutingLayer default
setNanoRouteMode -quiet -routeBottomRoutingLayer default
setNanoRouteMode -quiet -drouteEndIteration default
setNanoRouteMode -quiet -routeWithTimingDriven false
setNanoRouteMode -quiet -routeWithSiDriven false
routeDesign -globalDetail
setOptMode -fixCap true -fixTran true -fixFanoutLoad false
optDesign -postRoute
getFillerMode -quiet
addFiller -cell FILL1 DCAP -prefix FILLER -markFixed
setVerifyGeometryMode -area { 0 0 0 0 } -minWidth true -minSpacing true -minArea true -sameNet true -short true -overlap true -offRGrid false -offMGrid true -mergedMGridCheck true -minHole true -implantCheck true -minimumCut true -minStep true -viaEnclosure true -antenna false -insuffMetalOverlap true -pinInBlkg false -diffCellViol true -sameCellViol false -padFillerCellsOverlap true -routingBlkgPinOverlap true -routingCellBlkgOverlap true -regRoutingOnly false -stackedViasOnRegNet false -wireExt true -useNonDefaultSpacing false -maxWidth true -maxNonPrefLength -1 -error 1000 -warning 50
verifyGeometry
summaryReport -outdir .
reportGateCount -level 5 -limit 100 -outfile fma_top.gateCount
reportYield -outfile fma_top.yld.rpt
saveDesign fma_top.enc
redirect -quiet {set honorDomain [getAnalysisMode -honorClockDomains]} > /dev/null
timeDesign -reportOnly -idealClock -pathReports -drvReports -slackReports -numPaths 50 -prefix fma_top -outDir timingReports
set_power_analysis_mode -reset
set_power_analysis_mode -method static -corner max -create_binary_db true -write_static_currents true -honor_negative_energy true -ignore_control_signals true
set_power_output_dir -reset
set_power_output_dir ./
set_default_switching_activity -reset
set_default_switching_activity -input_activity 0.2 -period 10.0
read_activity_file -reset
set_power -reset
set_powerup_analysis -reset
set_powerup_analysis -mode accurate -ultrasim_simulation_mode ms
set_dynamic_power_simulation -reset
report_power -rail_analysis_format VS -outfile .//fma_top.rpt
fit
zoomIn
zoomIn
zoomIn
zoomOut
zoomOut
fit
fit
fit
fit
zoomIn
zoomIn
zoomIn
zoomIn
zoomIn
zoomIn
zoomIn
zoomIn
zoomIn
zoomOut
zoomOut
zoomOut
zoomOut
zoomOut
zoomOut
zoomOut
zoomOut
zoomOut
zoomIn
set init_verilog ../../ann_layercontroller/synthesized/layer_controller.v
init_design
deleteAllFPObjects

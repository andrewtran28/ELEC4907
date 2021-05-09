#######################################################
#                                                     #
#  Encounter Command Logging File                     #
#  Created on Tue Mar 10 01:02:37 2020                #
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
set init_verilog synthesized/routerCache.v
set init_pwr_net VDD
init_design
create_rc_corner -name rc -T {25} -preRoute_res {1.0} -preRoute_cap {1.0} -preRoute_clkres {0.0} -preRoute_clkcap {0.0} -postRoute_res {1.0} -postRoute_cap {1.0} -postRoute_xcap {1.0} -postRoute_clkres {0.0} -postRoute_clkcap {0.0}
create_library_set -name worst_case -timing {/CMC/kits/tsmc_65nm_libs/tcbn65gplus_200a/TSMCHOME/digital/Front_End/timing_power_noise/NLDM/tcbn65gplus_140b/tcbn65gpluswc.lib}
create_constraint_mode -name cosntraint -sdc_files {synthesized/constraint.sdc}
create_delay_corner -name worst_corner -library_set {worst_case} -rc_corner {rc}
create_analysis_view -name worst_analysis -constraint_mode {cosntraint} -delay_corner {worst_corner}
set_analysis_view -setup {worst_analysis} -hold {worst_analysis}
fit
fit
getIoFlowFlag
setIoFlowFlag 0
floorPlan -site core -r 0.987181939927 0.700003 3 3 3 3
uiSetTool select
getIoFlowFlag
fit
saveDesign routingCache.enc
set sprCreateIeRingNets {}
set sprCreateIeRingLayers {}
set sprCreateIeRingWidth 1.0
set sprCreateIeRingSpacing 1.0
set sprCreateIeRingOffset 1.0
set sprCreateIeRingThreshold 1.0
set sprCreateIeRingJogDistance 1.0
addRing -stacked_via_top_layer AP -around core -jog_distance 0.1 -threshold 0.1 -stacked_via_bottom_layer M1 -layer {bottom M1 top M1 right M2 left M2} -width .5 -spacing 0.16 -offset 0.1
saveDesign routingCache.enc
sroute -connect { blockPin padPin padRing corePin } -layerChangeRange { M1 AP } -blockPinTarget { nearestRingStripe nearestTarget } -padPinPortConnect { allPort oneGeom } -checkAlignedSecondaryPin 1 -blockPin useLef -allowJogging 1 -crossoverViaBottomLayer M1 -allowLayerChange 1 -targetViaTopLayer AP -crossoverViaTopLayer AP -targetViaBottomLayer M1 -nets { VDD VSS }
setLayerPreference pinObj -isVisible 1
setLayerPreference cellBlkgObj -isVisible 1
setLayerPreference layoutObj -isVisible 1
clearGlobalNets
globalNetConnect VDD -type tiehi -pin VDD -inst *
globalNetConnect VSS -type tielo -pin VSS -inst *
globalNetConnect VSS -type pgpin -pin VSS -inst *
globalNetConnect VDD -type pgpin -pin VDD -inst *
setPlaceMode -fp false
placeDesign -prePlaceOpt
clockDesign -specFile synthesized/Clock.ctstch -outDir clock_report -fixedInstBeforeCTS
setNanoRouteMode -quiet -routeTopRoutingLayer default
setNanoRouteMode -quiet -routeBottomRoutingLayer default
setNanoRouteMode -quiet -drouteEndIteration default
setNanoRouteMode -quiet -routeWithTimingDriven false
setNanoRouteMode -quiet -routeWithSiDriven false
routeDesign -globalDetail
setOptMode -fixCap true -fixTran true -fixFanoutLoad false
optDesign -postRoute
getFillerMode -quiet
addFiller -cell DCAP FILL1 -prefix FILLER -markFixed
saveDesign routingCache.enc
reportGateCount -level 5 -limit 100 -outfile routingCache.gateCount
redirect -quiet {set honorDomain [getAnalysisMode -honorClockDomains]} > /dev/null
timeDesign -preCTS -idealClock -pathReports -drvReports -slackReports -numPaths 50 -prefix routingCache_preCTS -outDir timingReports
saveDesign routingCache.enc

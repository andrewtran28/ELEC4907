#######################################################
#                                                     #
#  Encounter Command Logging File                     #
#  Created on Sat Jan 18 19:03:35 2020                #
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
set init_verilog layer_controller.v
set init_pwr_net VDD
init_design
selectObject IO_Pin {data_out[127]}
fit
create_rc_corner -name rc -T {25} -preRoute_res {1.0} -preRoute_cap {1.0} -preRoute_clkres {0.0} -preRoute_clkcap {0.0} -postRoute_res {1.0} -postRoute_cap {1.0} -postRoute_xcap {1.0} -postRoute_clkres {0.0} -postRoute_clkcap {0.0}
create_library_set -name worst_case -timing {/CMC/kits/tsmc_65nm_libs/tcbn65gplus_200a/TSMCHOME/digital/Front_End/timing_power_noise/NLDM/tcbn65gplus_140b/tcbn65gpluswc.lib}
create_constraint_mode -name constraint -sdc_files {constraint.sdc}
create_delay_corner -name worst_corner -library_set {worst_case} -rc_corner {rc}
create_analysis_view -name worst_analysis -constraint_mode {constraint} -delay_corner {worst_corner}
set_analysis_view -setup {worst_analysis} -hold {worst_analysis}
getIoFlowFlag
setIoFlowFlag 0
floorPlan -site core -r 0.992193474842 0.699995 10 10 10 10
uiSetTool select
getIoFlowFlag
fit
getIoFlowFlag
setIoFlowFlag 0
floorPlan -site core -r 0.992193474842 0.699995 0 0 0 0
uiSetTool select
getIoFlowFlag
fit
saveDesign layer_controller.enc
set sprCreateIeRingNets {}
set sprCreateIeRingLayers {}
set sprCreateIeRingWidth 1.0
set sprCreateIeRingSpacing 1.0
set sprCreateIeRingOffset 1.0
set sprCreateIeRingThreshold 1.0
set sprCreateIeRingJogDistance 1.0
addRing -stacked_via_top_layer AP -around core -jog_distance 0.1 -threshold 0.1 -nets {VDD VSS} -stacked_via_bottom_layer M1 -layer {bottom M1 top M1 right M2 left M2} -width 3 -spacing 2 -offset 0.1
deselectAll
getIoFlowFlag
setIoFlowFlag 0
floorPlan -site core -r 0.992193474842 0.699995 5 5 5 5
uiSetTool select
getIoFlowFlag
fit
addRing -stacked_via_top_layer AP -around core -jog_distance 0.1 -threshold 0.1 -nets {VDD VSS} -stacked_via_bottom_layer M1 -layer {bottom M1 top M1 right M2 left M2} -width 3 -spacing 2 -offset 0.1
addRing -stacked_via_top_layer AP -around core -jog_distance 0.1 -threshold 0.1 -nets {VDD VSS} -stacked_via_bottom_layer M1 -layer {bottom M1 top M1 right M2 left M2} -width 2 -spacing 0.5 -offset 0.1
sroute -connect { blockPin padPin padRing corePin } -layerChangeRange { M1 AP } -blockPinTarget { nearestRingStripe nearestTarget } -padPinPortConnect { allPort oneGeom } -checkAlignedSecondaryPin 1 -blockPin useLef -allowJogging 1 -crossoverViaBottomLayer M1 -allowLayerChange 1 -targetViaTopLayer AP -crossoverViaTopLayer AP -targetViaBottomLayer M1 -nets { VSS VDD }
clearGlobalNets
globalNetConnect VDD -type pgpin -pin VDD -inst * -module {}
globalNetConnect VSS -type pgpin -pin VSS -inst * -module {}
globalNetConnect VSS -type tielo -inst * -module {}
globalNetConnect VDD -type tiehi -inst * -module {}
setPlaceMode -fp false
placeDesign -prePlaceOpt
fit
fit
fit
clockDesign -specFile Clock.ctstch -outDir clock_report -fixedInstBeforeCTS
setNanoRouteMode -quiet -routeTopRoutingLayer default
setNanoRouteMode -quiet -routeBottomRoutingLayer default
setNanoRouteMode -quiet -drouteEndIteration default
setNanoRouteMode -quiet -routeWithTimingDriven false
setNanoRouteMode -quiet -routeWithSiDriven false
routeDesign -globalDetail
saveDesign layer_controller.enc
setOptMode -fixCap true -fixTran true -fixFanoutLoad false
optDesign -postRoute
getFillerMode -quiet
addFiller -cell FILL1 DCAP -prefix FILLER -markFixed
setVerifyGeometryMode -area { 0 0 0 0 } -minWidth true -minSpacing true -minArea true -sameNet true -short true -overlap true -offRGrid false -offMGrid true -mergedMGridCheck true -minHole true -implantCheck true -minimumCut true -minStep true -viaEnclosure true -antenna false -insuffMetalOverlap true -pinInBlkg false -diffCellViol true -sameCellViol false -padFillerCellsOverlap true -routingBlkgPinOverlap true -routingCellBlkgOverlap true -regRoutingOnly false -stackedViasOnRegNet false -wireExt true -useNonDefaultSpacing false -maxWidth true -maxNonPrefLength -1 -error 1000 -warning 50
verifyGeometry
saveDesign layer_controller.enc
reportGateCount -level 5 -limit 100 -outfile layer_controller.gateCount
summaryReport -noHtml -outfile summaryReport.rpt
zoomOut
fit
windowSelect 250.426 361.522 359.285 243.093
zoomSelected
zoomIn
deselectAll
setLayerPreference pinObj -isVisible 1
setLayerPreference cellBlkgObj -isVisible 1
setLayerPreference layoutObj -isVisible 1
setLayerPreference pinObj -isVisible 0
setLayerPreference cellBlkgObj -isVisible 0
setLayerPreference layoutObj -isVisible 0
setLayerPreference pinObj -isVisible 1
setLayerPreference cellBlkgObj -isVisible 1
setLayerPreference layoutObj -isVisible 1
fit
fit
fit
fit
saveDesign layer_controller.enc
deselectAll
selectInst FILLER_36968
analyzeFloorplan -cong -effort medium -outfile analyzeFP.rpt
redraw
fit
fit
fit
fit
fit
fit
setLayerPreference mGrid -isVisible 1
setLayerPreference pGrid -isVisible 1
setLayerPreference userGrid -isVisible 1
setLayerPreference gcell -isVisible 1
setLayerPreference trackObj -isVisible 1
setLayerPreference nonPrefTrackObj -isVisible 1
setLayerPreference trackObj -isVisible 0
setLayerPreference nonPrefTrackObj -isVisible 0
setLayerPreference mGrid -isVisible 0
setLayerPreference pGrid -isVisible 0
setLayerPreference userGrid -isVisible 0
setLayerPreference gcell -isVisible 0
setLayerPreference pwrdm -isVisible 0
setLayerPreference netRect -isVisible 0
setLayerPreference substrateNoise -isVisible 0
setLayerPreference powerNet -isVisible 0
setLayerPreference pwrdm -isVisible 1
setLayerPreference netRect -isVisible 1
setLayerPreference substrateNoise -isVisible 1
setLayerPreference powerNet -isVisible 1
setLayerPreference bump -isVisible 0
setLayerPreference bumpBack -isVisible 0
setLayerPreference bumpConnect -isVisible 0
setLayerPreference bump -isVisible 1
setLayerPreference bumpBack -isVisible 1
setLayerPreference bumpConnect -isVisible 1
setLayerPreference relFPlan -isVisible 0
setLayerPreference sdpGroup -isVisible 0
setLayerPreference sdpConnect -isVisible 0
setLayerPreference sizeBlkg -isVisible 0
setLayerPreference resizeFPLine1 -isVisible 0
setLayerPreference resizeFPLine2 -isVisible 0
setLayerPreference congTag -isVisible 0
setLayerPreference ioSlot -isVisible 0
setLayerPreference overlapMacro -isVisible 0
setLayerPreference overlapGuide -isVisible 0
setLayerPreference overlapBlk -isVisible 0
setLayerPreference datapath -isVisible 0
setLayerPreference relFPlan -isVisible 1
setLayerPreference sdpGroup -isVisible 1
setLayerPreference sdpConnect -isVisible 1
setLayerPreference sizeBlkg -isVisible 1
setLayerPreference resizeFPLine1 -isVisible 1
setLayerPreference resizeFPLine2 -isVisible 1
setLayerPreference congTag -isVisible 1
setLayerPreference ioSlot -isVisible 1
setLayerPreference overlapMacro -isVisible 1
setLayerPreference overlapGuide -isVisible 1
setLayerPreference overlapBlk -isVisible 1
setLayerPreference datapath -isVisible 1
setLayerPreference allM1Cont -isVisible 0
setLayerPreference allM1Cont -isVisible 1
encMessage warning 0
encMessage debug 0
encMessage info 0
restoreDesign layer_controller.enc.dat layer_controller
setDrawView fplan
encMessage warning 1
encMessage debug 0
encMessage info 1
selectObject Module {generate_neurons[3].u_neuron}
deselectAll
selectObject Module {generate_neurons[2].u_neuron}
deselectAll
selectObject Module {generate_neurons[7].u_neuron}
deselectAll
selectObject Module {generate_neurons[6].u_neuron}
deselectAll
selectObject Module {generate_neurons[1].u_neuron}
deselectAll
selectObject Module u_fwd_routing_engine
setPlaceMode -fp false
placeDesign -prePlaceOpt
deselectAll
loadWorkspace -name Floorplan
uiSetTool flightline
setDrawView ameba
setDrawView place
setDrawView ameba
fit
fit
zoomOut
zoomOut
zoomOut
zoomOut
zoomOut
zoomIn
zoomIn
zoomIn
fit
zoomSelected
zoomSelected
zoomSelected
setDrawView fplan
setDrawView ameba
setDrawView place
setDrawView ameba
uiSetTool util
uiSetTool flightline
setDrawView place
setDrawView ameba
setDrawView fplan
fit
fit
zoomOut
zoomIn
setDrawView ameba
setDrawView place
setDrawView ameba
set init_verilog ../../ann_host_controller/synthesized/host_controller.v
set init_top_cell host_controller
create_library_set -name worst_case\
   -timing\
    [list /CMC/kits/tsmc_65nm_libs/tcbn65gplus_200a/TSMCHOME/digital/Front_End/timing_power_noise/NLDM/tcbn65gplus_140b/tcbn65gpluswc.lib]
create_rc_corner -name rc\
   -preRoute_res 1\
   -postRoute_res 1\
   -preRoute_cap 1\
   -postRoute_cap 1\
   -postRoute_xcap 1\
   -preRoute_clkres 0\
   -preRoute_clkcap 0\
   -T 25
create_delay_corner -name worst_corner\
   -library_set worst_case\
   -rc_corner rc
create_constraint_mode -name constraint\
   -sdc_files\
    [list layer_controller.enc.dat/mmmc/modes/constraint/constraint.sdc]
create_analysis_view -name worst_analysis -constraint_mode constraint -delay_corner worst_corner
set_analysis_view -setup [list worst_analysis] -hold [list worst_analysis]
init_design

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
    [list router.enc.dat/mmmc/modes/constraint/constraint.sdc]
create_analysis_view -name worst_analysis -constraint_mode constraint -delay_corner worst_corner
set_analysis_view -setup [list worst_analysis] -hold [list worst_analysis]

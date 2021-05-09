create_library_set -name worst_Case\
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
   -library_set worst_Case\
   -rc_corner rc
create_constraint_mode -name cosntraint\
   -sdc_files\
    [list constraint.sdc]
create_analysis_view -name worst_analysis -constraint_mode cosntraint -delay_corner worst_corner
set_analysis_view -setup [list worst_analysis] -hold [list worst_analysis]

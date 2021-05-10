# Reading C:/intelFPGA_lite/18.1/modelsim_ase/tcl/vsim/pref.tcl
# Loading project tp78
# Compile of clock_divider-entity.vhd was successful.
# Compile of clock_divider-rtl.vhd was successful.
# 2 compiles, 0 failed with no errors.
vsim -t ps -gticks_per_second=10#10# clock_divider
# vsim -t ps clock_divider -gticks_per_second=10#10# 
# Start time: 11:47:51 on May 10,2021
# Loading std.standard
# Loading std.textio(body)
# Loading ieee.std_logic_1164(body)
# Loading ieee.numeric_std(body)
# Loading work.clock_divider(rtl)
# WARNING: No extended dataflow license exists
add wave -unsigned *
force clk 0 0, 1 1 -repeat 2
force reset 1 0, 0 3
run 500ps
# ** Warning: NUMERIC_STD.">=": metavalue detected, returning FALSE
#    Time: 0 ps  Iteration: 0  Instance: /clock_divider
# ** Warning: NUMERIC_STD."=": metavalue detected, returning FALSE
#    Time: 0 ps  Iteration: 0  Instance: /clock_divider
# ** Warning: NUMERIC_STD."=": metavalue detected, returning FALSE
#    Time: 0 ps  Iteration: 0  Instance: /clock_divider
# ** Warning: NUMERIC_STD.">=": metavalue detected, returning FALSE
#    Time: 0 ps  Iteration: 1  Instance: /clock_divider

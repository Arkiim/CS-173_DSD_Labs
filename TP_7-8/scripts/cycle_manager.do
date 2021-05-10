# Reading C:/intelFPGA_lite/18.1/modelsim_ase/tcl/vsim/pref.tcl
# Loading project TP78_4-2_Simulation
# Compile of cycle_manager-entity.vhd was successful.
# Compile of cycle_manager-rtl.vhd was successful.
# 2 compiles, 0 failed with no errors.
# reading C:/intelFPGA_lite/18.1/modelsim_ase/win32aloem/../modelsim.ini
# Loading project TP78-4.3_Simulation
# Load canceled
# Compile of light_manager_normal-entity.vhd was successful.
# Compile of light_manager_normal-rtl.vhd was successful.
# 2 compiles, 0 failed with no errors.
vsim -t ms light_manager
# vsim -t ms light_manager 
# Start time: 22:53:14 on May 10,2021
# ** Error: (vsim-3170) Could not find 'light_manager'.
#         Searched libraries:
#             C:/Users/noahm/OneDrive/Documents/BA2/DSD-CS173/TPs/TP_7-8/modelsim/work
# Error loading design
# End time: 22:53:14 on May 10,2021, Elapsed time: 0:00:00
# Errors: 1, Warnings: 0
vsim -t ms light_manager_normal
# vsim -t ms light_manager_normal 
# Start time: 22:53:28 on May 10,2021
# Loading std.standard
# Loading std.textio(body)
# Loading ieee.std_logic_1164(body)
# Loading ieee.numeric_std(body)
# Loading work.light_manager_normal(rtl)
add wave -unsigned *
# Compile of light_manager_normal-entity.vhd was successful.
# Compile of light_manager_normal-rtl.vhd was successful.
# 2 compiles, 0 failed with no errors.
vsim -t ms light_manager_normal
# End time: 22:56:46 on May 10,2021, Elapsed time: 0:03:18
# Errors: 0, Warnings: 0
# vsim -t ms light_manager_normal 
# Start time: 22:56:46 on May 10,2021
# Loading std.standard
# Loading std.textio(body)
# Loading ieee.std_logic_1164(body)
# Loading ieee.numeric_std(body)
# Loading work.light_manager_normal(rtl)
add wave -unsigned *
force clk 0 0, 1 1 -repeat 2
force reset 1 0, 0 2
run 500ms
# ** Warning: NUMERIC_STD."<": metavalue detected, returning FALSE
#    Time: 0 ms  Iteration: 0  Instance: /light_manager_normal
# ** Warning: NUMERIC_STD.">=": metavalue detected, returning FALSE
#    Time: 0 ms  Iteration: 0  Instance: /light_manager_normal
# ** Warning: NUMERIC_STD.">=": metavalue detected, returning FALSE
#    Time: 0 ms  Iteration: 0  Instance: /light_manager_normal
# ** Warning: NUMERIC_STD.">=": metavalue detected, returning FALSE
#    Time: 0 ms  Iteration: 0  Instance: /light_manager_normal
# ** Warning: NUMERIC_STD."=": metavalue detected, returning FALSE
#    Time: 0 ms  Iteration: 0  Instance: /light_manager_normal
# ** Warning: NUMERIC_STD."=": metavalue detected, returning FALSE
#    Time: 0 ms  Iteration: 0  Instance: /light_manager_normal
# ** Warning: NUMERIC_STD.">=": metavalue detected, returning FALSE
#    Time: 0 ms  Iteration: 0  Instance: /light_manager_normal
# ** Warning: NUMERIC_STD."<": metavalue detected, returning FALSE
#    Time: 0 ms  Iteration: 1  Instance: /light_manager_normal
# ** Warning: NUMERIC_STD.">=": metavalue detected, returning FALSE
#    Time: 0 ms  Iteration: 1  Instance: /light_manager_normal
# ** Warning: NUMERIC_STD.">=": metavalue detected, returning FALSE
#    Time: 0 ms  Iteration: 1  Instance: /light_manager_normal
# ** Warning: NUMERIC_STD.">=": metavalue detected, returning FALSE
#    Time: 0 ms  Iteration: 1  Instance: /light_manager_normal
# ** Warning: NUMERIC_STD."=": metavalue detected, returning FALSE
#    Time: 0 ms  Iteration: 1  Instance: /light_manager_normal
# ** Warning: NUMERIC_STD."=": metavalue detected, returning FALSE
#    Time: 0 ms  Iteration: 1  Instance: /light_manager_normal
# ** Warning: NUMERIC_STD."=": metavalue detected, returning FALSE
#    Time: 0 ms  Iteration: 2  Instance: /light_manager_normal
# ** Warning: NUMERIC_STD."=": metavalue detected, returning FALSE
#    Time: 0 ms  Iteration: 2  Instance: /light_manager_normal
# ** Warning: NUMERIC_STD."<": metavalue detected, returning FALSE
#    Time: 0 ms  Iteration: 2  Instance: /light_manager_normal
# ** Warning: NUMERIC_STD.">=": metavalue detected, returning FALSE
#    Time: 0 ms  Iteration: 2  Instance: /light_manager_normal
# ** Warning: NUMERIC_STD.">=": metavalue detected, returning FALSE
#    Time: 0 ms  Iteration: 2  Instance: /light_manager_normal
# ** Warning: NUMERIC_STD.">=": metavalue detected, returning FALSE
#    Time: 0 ms  Iteration: 2  Instance: /light_manager_normal

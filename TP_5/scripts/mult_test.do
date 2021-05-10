# Reading C:/intelFPGA_lite/18.1/modelsim_ase/tcl/vsim/pref.tcl
# Loading project tp78
# Compile of mult-entity.vhd was successful.
# Compile of mult-rtl.vhd was successful.
# 2 compiles, 0 failed with no errors.
vsim -t ns mult
# vsim -t ns mult 
# Start time: 22:31:33 on May 07,2021
# Loading std.standard
# Loading std.textio(body)
# Loading ieee.std_logic_1164(body)
# Loading ieee.numeric_std(body)
# Loading work.mult(rtl)
add wave *
force reset 1 0, 0 20
force clock 1 0, 0 10 -repeat 30
# ** Error (suppressible): (vsim-4008) Object 'clock' not found.
# 
force clk 1 0, 0 10 -repeat 30
force A 0 0, 2 20
force B 0 0, 4 20
run -all

# Reading C:/intelFPGA_lite/18.1/modelsim_ase/tcl/vsim/pref.tcl
# Loading project tp78
vsim -t ns mult
add wave *
force reset 1 0, 0 30
force clk 1 0, 0 10 -repeat 20
force A 0 0, 5 20, 0 500
force B 0 0, 7 20, 0 500
run -all

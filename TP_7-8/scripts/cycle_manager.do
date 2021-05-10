vsim -t ms cycle_manager
add wave -unsigned *
force clk 0 0, 1 1 -repeat 2
force pulse 0 0, 1 1 -repeat 2
force reset 1 0, 0 2
run 1000ms

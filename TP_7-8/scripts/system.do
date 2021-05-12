vsim -t ms system
add wave -unsigned *
force reset 1 0, 0 2
force clk 0 0, 1 1 -repeat 2
run 5000ms

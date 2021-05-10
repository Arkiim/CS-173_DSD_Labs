vsim -t ms light_manager_normal
add wave -unsigned *
add wave -unsigned *
force clk 0 0, 1 1 -repeat 2
force reset 1 0, 0 2
run 500ms

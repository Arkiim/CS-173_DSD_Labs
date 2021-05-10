vsim -t ps tff_sr
add wave *
force clock 1 0, 0 10 -repeat 20
force reset 0 0, 1 15, 0 25
force T 0 0, 1 30, 0 40, 1 45, 0 50, 1 60
run

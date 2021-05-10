vsim -t ds clock_divider
add wave *
force reset 1 0, 0 300

force clk 1 0, 0 10 -repeat 20

run -all

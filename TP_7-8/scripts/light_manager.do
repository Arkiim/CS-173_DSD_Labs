vsim -t ms -gt1=10#4# -gt2=10#6# -gt3=10#4# -gt4=10#4# -gt5=10#5# -gty=10#2# light_manager 
add wave -unsigned * 
force cycle_time 000000000 0
force cycle_time 000000001 1
force cycle_time 000000010 2
force cycle_time 000000011 3
force cycle_time 000000100 4
force cycle_time 000000101 5
force cycle_time 000000101 6
force cycle_time 000000111 7
force cycle_time 000001000 8
force cycle_time 000001001 9
force cycle_time 000001010 10
force cycle_time 000001011 11
force cycle_time 000001100 12
force cycle_time 000001101 13
force is_rush_hour 0 0
run 50ms

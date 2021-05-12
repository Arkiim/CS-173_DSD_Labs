vsim -t ms bcd_to_7seg
add wave *
force en 1 0
force bcd 0001 0
force bcd 0010 10
force bcd 0011 20
force bcd 0100 30 
run 100 ms

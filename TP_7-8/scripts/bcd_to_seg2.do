vsim -t ms bcd_to_7seg
add wave *
force en 1 0
force bcd 0001 0, 0010 10
force bcd 0011 20, 0100 30 
force bcd 0101 40, 0110 50
force bcd 0111 60, 1000 70
force bcd 1001 80, 1010 90, 1011 100 
force bcd 1100 110, 1101 120
force bcd 1110 130, 1111 140 
run 200 ms

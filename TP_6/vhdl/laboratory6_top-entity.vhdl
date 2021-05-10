LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY laboratory6_top IS
   PORT ( clock   : IN  std_logic;
          n_reset : IN  std_logic;
          LED     : OUT std_logic );
END laboratory6_top;

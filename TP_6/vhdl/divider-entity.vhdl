LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY clock_divider IS
   PORT ( clock : IN STD_LOGIC;
      reset : IN STD_LOGIC;
      enable : OUT STD_LOGIC);
END clock_divider;
--Top-level wrapper for TP78.
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY tp78 IS
     PORT (
          clock_50MHz : IN STD_LOGIC;
          led_array   : OUT STD_LOGIC_VECTOR(0 TO 107);
          seg1        : OUT STD_LOGIC_VECTOR(0 TO 7);
          seg2        : OUT STD_LOGIC_VECTOR(0 TO 7);
          seg3        : OUT STD_LOGIC_VECTOR(0 TO 7);
          seg4        : OUT STD_LOGIC_VECTOR(0 TO 7));
END ENTITY tp78;
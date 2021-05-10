--The clocking module.
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY clock_divider IS
     GENERIC (ticks_per_second : unsigned(31 DOWNTO 0) := to_unsigned(50000000, 32));
     --use random test value, remove it after, to assign at compilation 
     PORT (
          clk : IN STD_LOGIC;
          -- System clock.
          reset : IN STD_LOGIC;
          -- System reset.
          pulse : OUT STD_LOGIC;
          -- A pulse signal that is 1 for one cycle at the end of each second.
          blink : OUT STD_LOGIC);
     -- A blinking signal that is 1 for the first half of each second and 0 for the second half.
END ENTITY clock_divider;
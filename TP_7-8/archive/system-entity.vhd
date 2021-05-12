--The traffic light system.
LIBRARY ieee;
LIBRARY work;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
USE work.parameters.ALL;

ENTITY system IS
     PORT (
          clk : IN STD_LOGIC;
          --System clock.
          reset : IN STD_LOGIC;
          --System reset. <
          leds : OUT STD_LOGIC_VECTOR(0 TO 107);
          --LEDs.
          disp_tens : OUT STD_LOGIC_VECTOR(0 TO 7);
          --Seven-segment display for the tens digit of cycle elapsed time.
          disp_ones : OUT STD_LOGIC_VECTOR(0 TO 7);
          --Seven-segment display for the ones digit of cycle elapsed time.
          disp_L3 : OUT STD_LOGIC_VECTOR(0 TO 7);
          --Seven-segment display for L3.
          disp_L4 : OUT STD_LOGIC_VECTOR(0 TO 7));
     --Seven-segment display for L4.
END ENTITY system;
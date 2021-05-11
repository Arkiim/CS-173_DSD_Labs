LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY light_manager_rush IS
        GENERIC (
                t3 : unsigned(8 DOWNTO 0) := to_unsigned(4, 9);
                t4 : unsigned(8 DOWNTO 0) := to_unsigned(4, 9);
                t5 : unsigned(8 DOWNTO 0) := to_unsigned(5, 9);
                ty : unsigned(8 DOWNTO 0) := to_unsigned(2, 9));
        PORT (
                cycle_time : IN unsigned(8 DOWNTO 0);
                clk, rst : IN std_logic;
                -- Elapsed time (in seconds) in the current traffic cycle.
                L1_red, L1_yellow, L1_green, L2_red, L2_yellow, L2_green, L3_red, L3_green, L4_red, L4_green : OUT STD_LOGIC;
                -- Whether each lamp is bright or dim.
                L3_countdown, L4_countdown : OUT unsigned(3 DOWNTO 0));
        -- Countdown values for L3 and L4.
END ENTITY light_manager_rush;
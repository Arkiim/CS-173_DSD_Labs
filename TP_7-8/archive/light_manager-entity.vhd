LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY light_manager IS
        GENERIC (
                t1 : unsigned(8 DOWNTO 0);
                t2 : unsigned(8 DOWNTO 0);
                t3 : unsigned(8 DOWNTO 0);
                t4 : unsigned(8 DOWNTO 0);
                t5 : unsigned(8 DOWNTO 0);
                ty : unsigned(8 DOWNTO 0));
        PORT (
                is_rush_hour : IN STD_LOGIC;
                -- Is it rush hour currently?
                cycle_time : IN unsigned(8 DOWNTO 0);
                -- Elapsed time (in seconds) in the current traffic cycle.
                L1_red, L1_yellow, L1_green, L2_red, L2_yellow, L2_green, L3_red, L3_green, L4_red, L4_green : OUT STD_LOGIC;
                -- Whether each lamp is bright or dim.
                L3_countdown, L4_countdown : OUT unsigned(3 DOWNTO 0));
        -- Countdown values for L3 and L4.
END ENTITY light_manager;
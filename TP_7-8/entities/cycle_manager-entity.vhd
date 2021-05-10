LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY cycle_manager IS
        GENERIC (
                r1 : unsigned(8 DOWNTO 0);
                r2 : unsigned(8 DOWNTO 0);
                r3 : unsigned(8 DOWNTO 0);
                r4 : unsigned(8 DOWNTO 0);
                cn : unsigned(8 DOWNTO 0);
                cr : unsigned(8 DOWNTO 0);
                d : unsigned(8 DOWNTO 0)
        );

        PORT (
                clk : IN STD_LOGIC;
                -- System clock.
                reset : IN STD_LOGIC;
                -- System reset.
                pulse : IN STD_LOGIC;
                -- A pulse signal that is 1 for one cycle at the end of each second.
                is_rush_hour : OUT STD_LOGIC;
                -- Is it rush hour currently?
                cycle_time : OUT unsigned(8 DOWNTO 0));
        -- Elapsed time (in seconds) in the current traffic cycle.
END ENTITY cycle_manager;
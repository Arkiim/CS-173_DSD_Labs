LIBRARY ieee;

USE ieee.numeric_std.ALL;

ENTITY clock_divider IS
    PORT (
        clock_50Mhz : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        res : IN STD_LOGIC_VECTOR;
        clock_1Mhz : OUT STD_LOGIC;
    );
END clock_divider;
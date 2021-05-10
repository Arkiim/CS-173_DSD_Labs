LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY mult IS
    PORT (
        A, B : IN INTEGER;
        clk, reset : IN std_logic;
        Q    : OUT INTEGER);
END mult;
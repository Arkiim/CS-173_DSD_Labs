ARCHITECTURE rtl OF tp78 IS
    CONSTANT por_cycles : unsigned(31 DOWNTO 0) := to_unsigned(5, 32);
    SIGNAL por : STD_LOGIC; -- Power-on reset signal which will be 1 for the first `por_cycles` cycles, and then stays at 0
    SIGNAL por_counter : unsigned(31 DOWNTO 0);
BEGIN
    sys : ENTITY work.system(rtl)
        PORT MAP(
            clk       => clock_50MHz,
            reset     => por,
            leds      => led_array,
            disp_tens => seg1,
            disp_ones => seg2,
            disp_L3   => seg3,
            disp_L4   => seg4
        );

    por <= '1' WHEN por_counter < por_cycles ELSE
        '0';
    counter : PROCESS (clock_50MHz, por_counter) IS
    BEGIN
        por_counter <= por_counter;
        IF rising_edge(clock_50MHz) THEN
            IF por_counter < por_cycles THEN
                por_counter <= por_counter + 1;
            END IF;
        END IF;
    END PROCESS counter;
END ARCHITECTURE rtl;
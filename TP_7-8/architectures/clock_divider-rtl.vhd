ARCHITECTURE rtl OF clock_divider IS
    SIGNAL s_current_state : unsigned(31 DOWNTO 0);
    SIGNAL s_next_state : unsigned(31 DOWNTO 0);
BEGIN
    -- Transition Logic :
    s_next_state <= ticks_per_second WHEN s_current_state = to_unsigned(0, 31) ELSE
        s_current_state - 1;
    -- synchronous reset DFF :
    dff_sync : PROCESS (clk)
    BEGIN
        IF rising_edge(clk) THEN
            IF (reset = '1') THEN
                s_current_state <= (OTHERS => '0');
            ELSE
                s_current_state <= s_next_state;
            END IF;
        END IF;
    END PROCESS dff_sync;

    -- Output Logic : 
    pulse <= '1' WHEN s_current_state = to_unsigned(1, 32) ELSE
        '0';
    blink <= '1' WHEN (s_current_state + s_current_state) < ticks_per_second ELSE
        '0';
END ARCHITECTURE rtl;
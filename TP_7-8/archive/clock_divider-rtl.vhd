ARCHITECTURE rtl OF clock_divider IS

    SIGNAL s_current_state : unsigned(31 DOWNTO 0);
    SIGNAL s_next_state : unsigned(31 DOWNTO 0);
    CONSTANT c_pulse_enable : unsigned(31 DOWNTO 0) := to_unsigned(1, 32);

BEGIN
    -- Transition Logic :
    s_next_state <= ticks_per_second WHEN s_current_state = to_unsigned(1, 32) ELSE
        s_current_state - 1;

    -- asynchronous reset DFF :
    dff_async : PROCESS (clk, reset)
    BEGIN
        IF (reset = '1') THEN
            s_current_state <= ticks_per_second;
        ELSIF rising_edge(clk) THEN
            s_current_state <= s_next_state;
        END IF;
    END PROCESS dff_async;

    -- Output Logic : 
    pulse <= '1' WHEN s_current_state = c_pulse_enable ELSE
        '0';
    blink <= '1' WHEN (s_current_state + s_current_state) > ticks_per_second ELSE
        '0';
END ARCHITECTURE rtl;
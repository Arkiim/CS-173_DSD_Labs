ARCHITECTURE rtl OF clock_divider IS

    SIGNAL s_current_state : unsigned(31 DOWNTO 0);
    SIGNAL s_next_state : unsigned(31 DOWNTO 0);
    CONSTANT c_pulse_enable : unsigned(31 DOWNTO 0) := to_unsigned(1, 32);
BEGIN
    -- Transition Logic :
    s_next_state <= ticks_per_second WHEN s_current_state = to_unsigned(0, 32) ELSE
        s_current_state - 1;

    -- asynchronous reset DFF :
    dff_async : PROCESS (clk, reset)
    BEGIN
        IF (reset = '1') THEN
            s_current_state <= (OTHERS => '0');
        ELSIF rising_edge(clk) THEN
            s_current_state <= s_next_state;
        END IF;
    END PROCESS dff_async;

    -- dff_sync : PROCESS (clk)
    -- BEGIN
    --  IF rising_edge(clk) THEN
    --    IF (reset = '1') THEN
    --      s_current_state <= (OTHERS => '0');
    -- ELSE
    --    s_current_state <= s_next_state;
    --END IF;
    --   END IF;
    --END PROCESS dff_sync;

    -- Output Logic : 
    pulse <= '1' WHEN s_current_state = c_pulse_enable ELSE
        '0';
    blink <= '1' WHEN (s_next_state  + s_next_state ) > ticks_per_second ELSE
        '0';
END ARCHITECTURE rtl;

--demander estce que c'est grave que au debut 1er cycle pendant que le reset initiliase les valeurs
-- que blink soit pas high. i.e. si on peut avoir un clock cycle d'adaptation. ou si tout doit marcher dès t=0.
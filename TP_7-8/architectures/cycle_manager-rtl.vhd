ARCHITECTURE rtl OF cycle_manager IS

    SIGNAL s_current_time : unsigned(8 DOWNTO 0);
    SIGNAL s_next_time : unsigned(8 DOWNTO 0);
    SIGNAL s_current_sec_passed : unsigned(8 DOWNTO 0);
    SIGNAL s_next_sec_passed : unsigned(8 DOWNTO 0);

BEGIN
    s_next_time <= to_unsigned(0, 9) WHEN (s_current_time + 1) >= d ELSE
        (s_current_time + 1);
    s_next_sec_passed <= to_unsigned(0, 9) WHEN (s_next_time = r1 OR s_next_time = r2 OR s_next_time = r3 OR s_next_time = r4) ELSE
        s_current_sec_passed + 1;
    --s_next_sec_passed <=
    --  r1 WHEN s_next_time = r1 ELSE
    --(r3-r2) WHEN s_next_time = r3 ELSE
    -- s_current_sec_passed - 1;

    counter_async : PROCESS (clk, pulse, reset, s_current_time, s_current_sec_passed)
    BEGIN
        IF (reset = '1') THEN
            s_current_time <= r1;
            s_current_sec_passed <= to_unsigned(0, 9);
        ELSIF rising_edge(clk) THEN
            IF (pulse = '1') THEN
                s_current_time <= s_next_time;
                s_current_sec_passed <= s_next_sec_passed;
            END IF;
        END IF;
    END PROCESS counter_async;

    is_rush_hour <= '1' WHEN (s_current_time >= r1 AND s_current_time < r2)
        OR (s_current_time >= r3 AND s_current_time < r4) ELSE
        '0';
    cycle_time <= s_current_sec_passed;

END ARCHITECTURE rtl;
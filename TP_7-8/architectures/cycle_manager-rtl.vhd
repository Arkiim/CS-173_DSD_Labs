ARCHITECTURE rtl OF cycle_manager IS
    -- SIGNAL blink : STD_LOGIC;
    SIGNAL s_rush_hour : STD_LOGIC;
    --   SIGNAL s_next_rush_hour : STD_LOGIC;
    SIGNAL s_current_time : unsigned(8 DOWNTO 0); --max(d) = 500, which takes 9 bits max
    SIGNAL s_next_time : unsigned(8 DOWNTO 0);
    --  SIGNAL s_current_sec_passed : unsigned(8 DOWNTO 0);
    --    SIGNAL s_next_sec_passed : unsigned(8 DOWNTO 0);
BEGIN

    s_next_time <= to_unsigned(0, 9) WHEN (s_current_time + 1) >= d else
        (s_current_time + 1);

    -- s_next_rush_hour <= '1' WHEN (s_current_time >= r1 AND s_current_time < r2)
    --   OR (s_current_time >= r3 AND s_current_time < r4) ELSE
    -- '0';

    counter_async : PROCESS (clk, pulse, reset, s_current_time)
    BEGIN
        IF (reset = '1') THEN
            s_current_time <= r1;
            s_rush_hour <= '1';
            --   s_current_sec_passed <= to_unsigned(0, 9);
        ELSIF rising_edge(clk) THEN
            if (pulse = '1') then
                s_current_time <= s_next_time;
            end if ;
        END IF;
    END PROCESS counter_async;    
    --s_next_sec_passed <= to_unsigned(0, 9) WHEN (s_current_time = r1 OR s_current_time = r3)  ELSE
    --  s_current_sec_passed + 1;

    --implement this with switch

    --  counter_async_rst : PROCESS (clk, reset, s_rush_hour, s_current_sec_passed)
    --BEGIN
    --  IF (reset = '1') THEN
    --    s_rush_hour <= '1';
    --  s_current_time <= r1;
    --s_current_sec_passed <= to_unsigned(0, 9);
    --   ELSIF rising_edge(pulse) THEN
    --     s_current_time <= s_next_time;
    --   s_rush_hour <= s_next_rush_hour;
    -- s_current_sec_passed <= s_next_sec_passed;
    --   END IF;
    -- END PROCESS counter_async_rst;

    is_rush_hour <= '1' WHEN (s_current_time >= r1 AND s_current_time < r2)
        OR (s_current_time >= r3 AND s_current_time < r4) ELSE
        '0';
    cycle_time <= s_current_time;
    --div : clock_divider port map (clk, reset, pulse, blink);

END ARCHITECTURE rtl;
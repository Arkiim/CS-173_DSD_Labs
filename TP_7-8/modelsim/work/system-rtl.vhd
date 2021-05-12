ARCHITECTURE rtl OF system IS

    SIGNAL cycle_time : unsigned(8 DOWNTO 0);
    SIGNAL blink, is_rush_hour, pulse : STD_LOGIC;
    SIGNAL L1_red, L1_yellow, L1_green, L2_red, L2_yellow, L2_green, L3_red, L3_green, L4_red, L4_green : STD_LOGIC;
    SIGNAL cycle_tens, cycle_ones : unsigned(3 DOWNTO 0);
    SIGNAL L3_countdown, L4_countdown : unsigned(3 DOWNTO 0);
BEGIN

    -- TODO: Instantiate the other modules to provide signals cycle_time, blink, is_rush_hour,
    --       L1_red, ... L4_green, etc.

    cd : ENTITY work.clock_divider(rtl)
        GENERIC MAP(
            ticks_per_second => 50
        )
        PORT MAP(
            clk => clk,
            -- System clock.
            reset => reset,
            -- System reset.
            pulse => pulse,
            -- A pulse signal that is 1 for one cycle at the end of each second.
            blink => blink
        );


    -- A blinking signal that is 1 for the first half of each second and 0 for the second half.
    cycle_mngr : ENTITY work.cycle_manager(rtl)
        GENERIC MAP(
            r1 => 10,
            r2 => 28,
            r3 => 47,
            r4 => 64,
            cn => 19,
            cr => 18,
            d => 73
        )
        PORT MAP(
            clk          => clk,
            reset        => reset,
            pulse        => pulse,
            is_rush_hour => is_rush_hour,
            cycle_time   => cycle_time
        );

    -- Map to the LEDs on the board.
    leddrv : ENTITY work.led_driver(rtl)
        PORT MAP(
            blink        => blink,
            is_rush_hour => is_rush_hour,
            L1_red       => L1_red,
            L1_yellow    => L1_yellow,
            L1_green     => L1_green,
            L2_red       => L2_red,
            L2_yellow    => L2_yellow,
            L2_green     => L2_green,
            L3_red       => L3_red,
            L3_green     => L3_green,
            L4_red       => L4_red,
            L4_green     => L4_green,
            leds         => leds
        );

    -- Transform cycle_time to two decimal digits
    bcd : ENTITY work.bin_to_bcd(rtl)
        PORT MAP(
            bin   => cycle_time(7 DOWNTO 0),
            l_bcd => cycle_ones,
            u_bcd => cycle_tens
        );
    --u_bcd => cycle_tens);

    -- Decode the countdown value to drive the seven-segment displays.
    decode1 : ENTITY work.bcd_to_7seg(rtl)
        PORT MAP(
            en   => '1',
            bcd  => cycle_tens,
            disp => disp_tens
        );
    -- disp => disp_tens);
    decode2 : ENTITY work.bcd_to_7seg(rtl)
        PORT MAP(
            en   => '1',
            bcd  => cycle_ones,
            disp => disp_ones
        );
    --disp => disp_ones);

    -- TODO: Instantiate the other two 7seg decoders and connect them to the countdowns for L3 and L4

    ledMgmt : ENTITY work.light_manager(rtl)
        GENERIC MAP(
            t1 => 9,
            t2 => 6,
            t3 => 3,
            t4 => 3,
            t5 => 6,
            ty => 2)
        PORT MAP(
            is_rush_hour => is_rush_hour,
            L1_red       => L1_red,
            L1_yellow    => L1_yellow,
            L1_green     => L1_green,
            L2_red       => L2_red,
            L2_yellow    => L2_yellow,
            L2_green     => L2_green,
            L3_red       => L3_red,
            L3_green     => L3_green,
            L4_red       => L4_red,
            L4_green     => L4_green,

            L3_countdown => L3_countdown,
            L4_countdown => L4_countdown
        );

    decode3 : ENTITY work.bcd_to_7seg(rtl)
        PORT MAP(
            en   => L3_green,
            bcd  => L3_countdown,
            disp => disp_L3
        );

    decode4 : ENTITY work.bcd_to_7seg(rtl)
        PORT MAP(
            en   => L4_green,
            bcd  => L4_countdown,
            disp => disp_L4
        );

END ARCHITECTURE rtl;
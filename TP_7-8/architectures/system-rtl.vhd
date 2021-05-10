architecture rtl of system is
    signal cycle_time : unsigned(8 downto 0);
    signal blink, is_rush_hour : std_logic;
    signal L1_red, L1_yellow, L1_green, L2_red, L2_yellow, L2_green, L3_red, L3_green, L4_red, L4_green : std_logic;
    signal cycle_tens, cycle_ones : unsigned(3 downto 0);
begin

    -- TODO: Instantiate the other modules to provide signals cycle_time, blink, is_rush_hour,
    --       L1_red, ... L4_green, etc.

    -- Map to the LEDs on the board.
    leddrv:entity work.led_driver(rtl)
    port map(blink        => blink,
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
             leds         => leds);

    -- Transform cycle_time to two decimal digits
    bcd:entity work.bin_to_bcd(rtl)
    port map(bin   => cycle_time(7 downto 0),
             l_bcd => cycle_ones,
             u_bcd => cycle_tens);

    -- Decode the countdown value to drive the seven-segment displays.
    decode1:entity work.bcd_to_7seg(rtl)
    port map(en   => '1',
             bcd  => cycle_tens,
             disp => disp_tens);
    decode2:entity work.bcd_to_7seg(rtl)
    port map(en   => '1',
             bcd  => cycle_ones,
             disp => disp_ones);

    -- TODO: Instantiate the other two 7seg decoders and connect them to the countdowns for L3 and L4

end architecture rtl;

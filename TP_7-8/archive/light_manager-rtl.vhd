ARCHITECTURE rtl OF light_manager IS

    SIGNAL lights : STD_LOGIC_VECTOR(9 DOWNTO 0);
    SIGNAL countdown : unsigned(7 DOWNTO 0);
    SIGNAL s_lights_normal : STD_LOGIC_VECTOR(9 DOWNTO 0);
    SIGNAL s_lights_rush : STD_LOGIC_VECTOR(9 DOWNTO 0);
    --order : L1_red, L1_yellow, L1_green, L2_red, L2_yellow, L2_green, L3_red, L3_green, L4_red, L4_green

    SIGNAL s_countdown_normal : unsigned(7 DOWNTO 0);
    SIGNAL s_countdown_rush : unsigned(7 DOWNTO 0);
    --order : 3 downto 0 == L3_countdown ; 8 downto 4 == L4_countdown;
    --Component Declarations
    COMPONENT light_manager_rush
        GENERIC (
            t3 : unsigned(8 DOWNTO 0);
            t4 : unsigned(8 DOWNTO 0);
            t5 : unsigned(8 DOWNTO 0);
            ty : unsigned(8 DOWNTO 0)
        );
        PORT (
            cycle_time : IN unsigned(8 DOWNTO 0);
            L1_red, L1_yellow, L1_green,
            L2_red, L2_yellow, L2_green,
            L3_red, L3_green, L4_red, L4_green : OUT STD_LOGIC;
            -- Whether each lamp is bright or dim.
            L3_countdown, L4_countdown : OUT unsigned(3 DOWNTO 0));
    END COMPONENT;

    COMPONENT light_manager_normal
        GENERIC (
            t1 : unsigned(8 DOWNTO 0);
            t2 : unsigned(8 DOWNTO 0);
            ty : unsigned(8 DOWNTO 0));
        PORT (
            cycle_time : IN unsigned(8 DOWNTO 0);
            -- Elapsed time (in seconds) in the current traffic cycle.
            L1_red, L1_yellow, L1_green,
            L2_red, L2_yellow, L2_green,
            L3_red, L3_green,
            L4_red, L4_green : OUT STD_LOGIC;
            -- Whether each lamp is bright or dim.
            L3_countdown, L4_countdown : OUT unsigned(3 DOWNTO 0)
            -- Countdown values for L3 and L4.
        );
    END COMPONENT;

BEGIN
    -- Port Instantiation
    x1 : light_manager_rush GENERIC MAP(
        t3 => t3,
        t4 => t4,
        t5 => t5,
        ty => ty
    )
    PORT MAP(
        cycle_time => cycle_time,
        L1_red     => s_lights_rush(0),
        L1_yellow  => s_lights_rush(1),
        L1_green   => s_lights_rush(2),

        L2_red    => s_lights_rush(3),
        L2_yellow => s_lights_rush(4),
        L2_green  => s_lights_rush(5),

        L3_red   => s_lights_rush(6),
        L3_green => s_lights_rush(7),

        L4_green => s_lights_rush(8),
        L4_red   => s_lights_rush(9),

        L3_countdown => s_countdown_rush(3 DOWNTO 0),
        L4_countdown => s_countdown_rush(7 DOWNTO 4));

    x2 : light_manager_normal GENERIC MAP(
        t1 => t1,
        t2 => t2,
        ty => ty
    )

    PORT MAP(
        cycle_time => cycle_time,
        L1_red     => s_lights_normal(0),
        L1_yellow  => s_lights_normal(1),
        L1_green   => s_lights_normal(2),

        L2_red    => s_lights_normal(3),
        L2_yellow => s_lights_normal(4),
        L2_green  => s_lights_normal(5),

        L3_red   => s_lights_normal(6),
        L3_green => s_lights_normal(7),

        L4_green => s_lights_normal(8),
        L4_red   => s_lights_normal(9),

        L3_countdown => s_countdown_normal(3 DOWNTO 0),
        L4_countdown => s_countdown_normal(7 DOWNTO 4));

    --Multiplexer choosing resulting light configuration
    mode_chooser : PROCESS (is_rush_hour, lights, countdown, s_lights_normal, s_lights_rush, s_countdown_normal, s_countdown_rush)
    BEGIN
        CASE is_rush_hour IS
            WHEN '1' =>
                lights <= s_lights_rush;
                countdown <= s_countdown_rush;
            WHEN OTHERS =>
                lights <= s_lights_normal;
                countdown <= s_countdown_normal;
        END CASE;
    END PROCESS mode_chooser;

    -- assignment for output
    -- Lights:
    L1_red <= lights(0);
    L1_yellow <= lights(1);
    L1_green <= lights(2);

    L2_red <= lights(3);
    L2_yellow <= lights(4);
    L2_green <= lights(5);

    L3_red <= lights(6);
    L3_green <= lights(7);

    L4_green <= lights(8);
    L4_red <= lights(9);

    --countdown
    L3_countdown <= countdown(3 DOWNTO 0);
    L4_countdown <= countdown(7 DOWNTO 4);

END ARCHITECTURE rtl;
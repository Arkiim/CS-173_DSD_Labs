ARCHITECTURE no_target_specific OF laboratory6_top IS

   -- Here we define the "components" we are going to use:
   COMPONENT TFF_SR
      PORT ( clock   : IN  std_logic;
             reset   : IN  std_logic;
             T       : IN  std_logic;
             LED     : OUT std_logic );
   END COMPONENT;

   COMPONENT clock_divider
      PORT ( clock   : IN  std_logic;
             reset   : IN  std_logic;
             enable  : OUT std_logic );
   END COMPONENT;
   
   -- Here we define the connecting wires
   SIGNAL s_50MHz_clock        : std_logic;
   SIGNAL s_reset              : std_logic;
   SIGNAL s_kick_ass           : std_logic;
   SIGNAL s_the_blinking_light : std_logic;

BEGIN

   -- We connect the input and output ports to wires:
   s_50MHz_clock <= clock; -- NOTE: clock is the one defined in the entity,
                           --       it has nothing to do with the two "clock"
                           --       ports of the components!
   s_reset       <= NOT(n_reset); -- The buttons are active low....
   LED           <= s_the_blinking_light;
   
   -- Now we do the "soldering work":
   blinker : TFF_SR
             PORT MAP ( clock   => s_50MHz_clock,
                        reset   => s_reset,
                        T       => s_kick_ass,
                        LED     => s_the_blinking_light );

   clock_div : clock_divider
               PORT MAP ( clock   => s_50MHz_clock,
                          reset   => s_reset,
                          enable  => s_kick_ass );

   -- Question: How does the hardware look like?
END no_target_specific;

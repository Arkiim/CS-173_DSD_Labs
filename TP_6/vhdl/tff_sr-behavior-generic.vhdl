ARCHITECTURE gate OF TFF_SR IS

   SIGNAL s_n_reset       : std_logic;
   SIGNAL s_current_state : std_logic;
   SIGNAL s_next_state    : std_logic;
   SIGNAL s_xor           : std_logic;

BEGIN

   LED <= s_current_state;
   
   make_dff : PROCESS( clock , s_next_state )
   BEGIN
      IF (rising_edge(clock)) THEN
         s_current_state <= s_next_state;
      END IF;
   END PROCESS make_dff;
   
   s_next_state <= s_n_reset AND s_xor;
   
   s_xor        <= T XOR s_current_state;
   
   s_n_reset    <= NOT( reset );
   
END gate;

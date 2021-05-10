ARCHITECTURE gate OF TFF_SR IS

   SIGNAL s_n_reset : STD_LOGIC; -- s_n_reset := R
   SIGNAL s_current_state : STD_LOGIC; -- s_current_state := Q_n-1
   SIGNAL s_next_state : STD_LOGIC; --  s_next_state := Q_n
   SIGNAL s_xor : STD_LOGIC; -- intermediary xor => don't we have to also define a signal for the AND gate ?

BEGIN
   LED <= s_current_state;

   make_dff : PROCESS (clock) -- only clock is in the sensitivity list
   BEGIN
      IF (rising_edge(clock)) THEN
         s_current_state <= s_next_state;
      END IF;
   END PROCESS make_dff;

   s_next_state <= s_n_reset AND s_xor;
   -- Hence why don't have to put AND in intermediary because its the last operation that defines the assignment
   s_xor <= T OR s_current_state;

   s_n_reset <= NOT(reset);

END gate;
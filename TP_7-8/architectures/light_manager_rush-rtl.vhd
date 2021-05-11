ARCHITECTURE rtl OF light_manager_rush IS
    SIGNAL s_temp : unsigned(8 DOWNTO 0);
BEGIN
    manager : PROCESS (cycle_time, s_temp)
    BEGIN
        IF (cycle_time < t3) THEN
            L1_green <= '1';
            L2_green <= '0';
            L3_green <= '0';
            L4_green <= '0';

            L1_yellow <= '0';
            L2_yellow <= '0';

            L1_red <= '0';
            L2_red <= '1';
            L3_red <= '1';
            L4_red <= '1';

        ELSIF (cycle_time >= t3 AND cycle_time < (t3 + ty)) THEN

            L1_green <= '0';
            L2_green <= '0';
            L3_green <= '0';
            L4_green <= '0';

            L1_yellow <= '1';
            L2_yellow <= '1';

            L1_red <= '0';
            L2_red <= '1';
            L3_red <= '1';
            L4_red <= '1';

        ELSIF (cycle_time >= (t3 + ty) AND (cycle_time < (t3 + ty + t4))) THEN

            L1_green <= '0';
            L2_green <= '1';
            L3_green <= '0'; --L4 is green not L3, written schema is wrong 
            L4_green <= '0';

            L1_yellow <= '0';
            L2_yellow <= '0';

            L1_red <= '1';
            L2_red <= '0';
            L3_red <= '1'; --L3 just red, written schema is wrong 
            L4_red <= '1';

        ELSIF (cycle_time >= (t3 + ty + t4) AND cycle_time < (t3 + t4 + ty + ty)) THEN

            L1_green <= '0';
            L2_green <= '0';
            L3_green <= '0';
            L4_green <= '0';

            L1_yellow <= '0';
            L2_yellow <= '1';

            L1_red <= '1';
            L2_red <= '0';
            L3_red <= '1';
            L4_red <= '1';

        ELSIF (cycle_time >= (t3 + t4 + ty + ty) AND cycle_time < (t3 + t4 + ty + ty + t5)) THEN

            s_temp <= (t3 + t4 + ty + ty + t5) - cycle_time;

            L1_green <= '0';
            L2_green <= '0';
            L3_green <= '1';
            L4_green <= '1';

            L1_yellow <= '0';
            L2_yellow <= '0';

            L1_red <= '1';
            L2_red <= '1';
            L3_red <= '0';
            L4_red <= '0';

            L3_countdown <= s_temp(3 DOWNTO 0);
            L4_countdown <= s_temp(3 DOWNTO 0);

        ELSIF (cycle_time >= (t3 + t4 + ty + ty + t5) AND cycle_time < (t3 + t4 + ty + ty + t5 + ty)) THEN

            L1_green <= '0';
            L2_green <= '0';
            L3_green <= '0';
            L4_green <= '0';

            L1_yellow <= '1';
            L2_yellow <= '0';

            L1_red <= '1';
            L2_red <= '1';
            L3_red <= '1';
            L4_red <= '1';

        END IF;
    END PROCESS manager; -- manager

END ARCHITECTURE rtl;
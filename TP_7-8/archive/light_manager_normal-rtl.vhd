ARCHITECTURE rtl OF light_manager_normal IS
    SIGNAL L3_count : unsigned(3 DOWNTO 0);
    SIGNAL L4_count : unsigned(3 DOWNTO 0);
    SIGNAL temp : unsigned(8 DOWNTO 0);
BEGIN

    manager : PROCESS (cycle_time, L3_count, L4_count, temp)
    BEGIN
        IF (cycle_time < t1) THEN
            temp <= t1 - cycle_time;
            L1_green <= '1';
            L2_green <= '0';
            L3_green <= '1';
            L4_green <= '0';

            L1_yellow <= '0';
            L2_yellow <= '0';

            L1_red <= '0';
            L2_red <= '1';
            L3_red <= '0';
            L4_red <= '1';

            L3_count <= temp(3 DOWNTO 0);

        ELSIF (cycle_time >= t1 AND cycle_time < (t1 + ty)) THEN

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

        ELSIF (cycle_time >= (t1 + ty) AND (cycle_time < (t1 + ty + t2))) THEN

            temp <= (t1 + ty + t2) - cycle_time;

            L1_green <= '0';
            L2_green <= '1';
            L3_green <= '0'; --L4 is green not L3, written schema is wrong 
            L4_green <= '1';

            L1_yellow <= '0';
            L2_yellow <= '0';

            L1_red <= '1';
            L2_red <= '0';
            L3_red <= '1'; --L3 just red, written schema is wrong 
            L4_red <= '0';
            
            L4_count <= temp(3 DOWNTO 0);

        ELSIF (cycle_time >= (t1 + ty + t2) AND cycle_time < (t1 + t2 + ty + ty)) THEN

            L1_green <= '0';
            L2_green <= '0';
            L3_green <= '0';
            L4_green <= '0';

            L1_yellow <= '1';
            L2_yellow <= '1';

            L1_red <= '1';
            L2_red <= '0';
            L3_red <= '1';
            L4_red <= '1';

        END IF;

    END PROCESS manager; -- manager
    L3_countdown <= L3_count;
    L4_countdown <= L4_count;

END ARCHITECTURE rtl;
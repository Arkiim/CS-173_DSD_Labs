ARCHITECTURE rtl OF mult IS
    SIGNAL s_current_state, s_next_state : INTEGER;
    SIGNAL s_iter_nb : INTEGER := 0;

BEGIN
    product : PROCESS (clk, s_next_state )
    BEGIN
        IF rising_edge(clk) THEN
            IF (reset = '1') THEN
                --s_current_state <= 0;
                s_next_state <= 0;
                s_iter_nb <= 0;
            ELSIF (s_iter_nb < B) THEN
                s_iter_nb <= s_iter_nb + 1; -- ca ca s'execute
                s_next_state <= s_current_state + A; -- execute 1 fois sur 2 
                 -- execute 1 fois sur 2
            END IF;
        END IF;
    END PROCESS product;
    s_current_state <= s_next_state;
    Q <= s_current_state;
END ARCHITECTURE rtl;
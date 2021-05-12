ARCHITECTURE rtl OF bcd_to_7seg IS
    SIGNAL s_bcd_temp : unsigned(0 TO 7);
BEGIN
    bcd_translator : PROCESS (en, bcd, s_bcd_temp)
    BEGIN
        IF (en = '0') THEN
            s_bcd_temp <= to_unsigned(0, 8);
        ELSE
            CASE(bcd) IS
                WHEN "0001" => s_bcd_temp <= "01100000";
                WHEN "0010" => s_bcd_temp <= "11011010";
                WHEN "0011" => s_bcd_temp <= "11110010";
                WHEN "0100" => s_bcd_temp <= "01100110";
                WHEN "0101" => s_bcd_temp <= "10110110";
                WHEN "0110" => s_bcd_temp <= "10111110";
                WHEN "0111" => s_bcd_temp <= "11100000";
                WHEN "1000" => s_bcd_temp <= "11111110";
                WHEN "1001" => s_bcd_temp <= "11110110";
                WHEN "1010" => s_bcd_temp <= "11101110";
                WHEN "1011" => s_bcd_temp <= "00111110";
                WHEN "1100" => s_bcd_temp <= "10011100";
                WHEN "1101" => s_bcd_temp <= "01111010";
                WHEN "1110" => s_bcd_temp <= "10011110";
                WHEN "1111" => s_bcd_temp <= "10001110";
                WHEN OTHERS => s_bcd_temp <= "11111100"; --represent 0
            END CASE;
        END IF;

    END PROCESS bcd_translator;
    disp <= STD_LOGIC_VECTOR(s_bcd_temp);

END ARCHITECTURE rtl;
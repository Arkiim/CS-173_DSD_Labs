ARCHITECTURE rtl OF bin_to_bcd IS
    --It is guaranteed that bin never exceeds two digits, i.e., 99.
    TYPE conv_t IS ARRAY(99 DOWNTO 0) OF STD_LOGIC_VECTOR(7 DOWNTO 0);
    FUNCTION populate_conv_table RETURN conv_t IS
        VARIABLE table : conv_t;
        VARIABLE u_digit, l_digit : INTEGER;
        VARIABLE u_digit_vec, l_digit_vec : STD_LOGIC_VECTOR(3 DOWNTO 0);
    BEGIN
        FOR i IN 0 TO 99 LOOP
            l_digit := i MOD 10;
            u_digit := i / 10;
            l_digit_vec := STD_LOGIC_VECTOR(to_unsigned(l_digit, 4));
            u_digit_vec := STD_LOGIC_VECTOR(to_unsigned(u_digit, 4));
            table(i) := u_digit_vec & l_digit_vec;
        END LOOP;
        RETURN table;
    END FUNCTION populate_conv_table;
    CONSTANT conv_table : conv_t := populate_conv_table;
    SIGNAL converted : STD_LOGIC_VECTOR(7 DOWNTO 0);
BEGIN
    converted <= conv_table(to_integer(bin));
    l_bcd <= unsigned(converted(3 DOWNTO 0));
    u_bcd <= unsigned(converted(7 DOWNTO 4));
END ARCHITECTURE rtl;
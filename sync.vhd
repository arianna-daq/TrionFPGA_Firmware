----------------------------------------------------------------------------------
--	sync.vhd
--
-- 	Created By:	Manuel Pasqual Paul
----------------------------------------------------------------------------------

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY sync IS
    PORT ( 
        clk_1   : IN STD_LOGIC;
        clk_20  : IN STD_LOGIC;
        clk_80  : IN STD_LOGIC;
        clk_160 : IN STD_LOGIC;

        clk1M  : OUT STD_LOGIC;
        clk20M : OUT STD_LOGIC

    );

END sync;

ARCHITECTURE Behavioral OF sync IS

SIGNAL temp_80M, temp_20M : STD_LOGIC_VECTOR(1 DOWNTO 0);
SIGNAL temp_1M : STD_LOGIC_VECTOR(2 DOWNTO 0);

BEGIN 

    SC1 : PROCESS (clk_160)
        BEGIN
            IF (rising_edge(clk_160)) THEN
                temp_80M <= temp_80M(0) & clk_80;

            END IF;

        END PROCESS;

    SC2 : PROCESS (temp_80M(1))
        BEGIN
            IF (rising_edge(temp_80M(1))) THEN
                temp_20M <= temp_20M(0) & clk_20;

            END IF;

        END PROCESS;

    SC3 : PROCESS (temp_20M(1))
        BEGIN
            IF (rising_edge(temp_20M(1))) THEN
                temp_1M <= temp_1M(1 DOWNTO 0) & clk_1;

            END IF;

        END PROCESS;

    clk1M  <= temp_1M(2);
    clk20M <= temp_20M(1);

END Behavioral;
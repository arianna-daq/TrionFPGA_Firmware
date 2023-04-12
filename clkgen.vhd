----------------------------------------------------------------------------------
--	clkgen.vhd
--
-- 	Created By:	Manuel Pasqual Paul
----------------------------------------------------------------------------------

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

ENTITY clkgen IS
    PORT ( 
        pll_clk_20M  : IN STD_LOGIC;
        pll_clk_80M  : IN STD_LOGIC;   
        pll_clk_160M : IN STD_LOGIC;

        clk_1M   : OUT STD_LOGIC;
        clk_20M  : OUT STD_LOGIC;
        clk_80M  : OUT STD_LOGIC;
        clk_160M : OUT STD_LOGIC
    
    );

END clkgen;

ARCHITECTURE Behavioral OF clkgen IS

SIGNAL temp_clk : STD_LOGIC := '0';
SIGNAL count    : INTEGER RANGE 1 TO 10 := 1;

BEGIN 

CG1 : PROCESS (pll_clk_20M) BEGIN
    IF rising_edge(pll_clk_20M) THEN
        IF (count = 10) THEN
            temp_clk <= NOT(temp_clk);
            count <= 1;
        ELSE
            count <= count + 1;
        END IF;
    END IF;
END PROCESS;

   clk_1M <= temp_clk;
   clk_20M  <= pll_clk_20M;
   clk_80M  <= pll_clk_80M;
   clk_160M <= pll_clk_160M;

END Behavioral;


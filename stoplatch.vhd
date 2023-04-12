----------------------------------------------------------------------------------
--	File Name :     stoplatch.vhd
--  Module Name :   
-- 	Created By:	    Manuel Pasqual Paul
--
--	Description: ]
--
--  Last Date Edited: 3-15-2023 [M. Paul]
----------------------------------------------------------------------------------

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY stoplatch IS
    PORT (
        trigger : IN STD_LOGIC;
        clk     : IN STD_LOGIC;
        reset   : IN STD_LOGIC;

        stp    : OUT STD_LOGIC
    );

END stoplatch;

ARCHITECTURE Behavioral OF stoplatch IS

SIGNAL tempFF1 : STD_LOGIC_VECTOR(1 DOWNTO 0);
SIGNAL tempFF2, temp_stop : STD_LOGIC;
SIGNAL enable_stop : STD_LOGIC := '0';

BEGIN 

    SL1 : PROCESS (clk)
    BEGIN
        IF (rising_edge(clk)) THEN
            tempFF1 <= tempFF1(0) & reset;

        END IF;

    END PROCESS;

    SL2 : PROCESS (clk)
    BEGIN 
        IF (falling_edge(clk)) THEN
            tempFF2 <= tempFF1(1);
        
        END IF;

    END PROCESS;

    SL3 : PROCESS (tempFF2, trigger) 
    BEGIN 
        IF tempFF2 = '1' THEN
            enable_stop <= '0';
        ELSE
            IF rising_edge (trigger) THEN
                enable_stop <= '1';
    
            END IF;
    
        END IF;
    
    END PROCESS;

    SL4 : PROCESS (enable_stop) 
    BEGIN 
        temp_stop <= enable_stop;
    
    END PROCESS;

    stp <= reset OR tempFF1(0) OR tempFF1(1) OR tempFF2 OR temp_stop;  

END Behavioral;
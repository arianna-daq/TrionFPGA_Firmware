----------------------------------------------------------------------------------
--	File Name :     SRL16.vhd
--  Module Name :   16 Bit Shift Register LUT
-- 	Created By:	    Manuel Pasqual Paul
--
--	Description: Module performs a 16 Bit Shift Register LUT (SRL16). Takes 
--      in a single bit data every clock while shifting the previous data down the 
--      16 bit register. Output bit of the register can be adjusted based on input
--      address to module resulting in an adjustable 16 bit shift register. 

--  Last Date Edited: 3-15-2023 [M. Paul]
----------------------------------------------------------------------------------

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY SRL16 IS
    PORT (
        D   : IN STD_LOGIC;
        clk : IN STD_LOGIC;
        A0  : IN STD_LOGIC;
        A1  : IN STD_LOGIC;
        A2  : IN STD_LOGIC;
        A3  : IN STD_LOGIC;

        Q   : OUT STD_LOGIC
    );

END SRL16;

ARCHITECTURE Behavioral OF SRL16 IS

SIGNAL temp_Q : STD_LOGIC_VECTOR(15 DOWNTO 0);

BEGIN

    SRL16 : PROCESS (clk)
    BEGIN
        IF (rising_edge(clk)) THEN
            temp_Q <= temp_Q(14 DOWNTO 0) & D;

        END IF;

    END PROCESS;

    Q <= temp_Q(0)  WHEN (NOT(A3) AND NOT(A2) AND NOT(A1) AND NOT(A0)) ELSE -- 0000
         temp_Q(1)  WHEN (NOT(A3) AND NOT(A2) AND NOT(A1) AND    (A0)) ELSE -- 0001
         temp_Q(2)  WHEN (NOT(A3) AND NOT(A2) AND    (A1) AND NOT(A0)) ELSE -- 0010
         temp_Q(3)  WHEN (NOT(A3) AND NOT(A2) AND    (A1) AND    (A0)) ELSE -- 0011
         temp_Q(4)  WHEN (NOT(A3) AND    (A2) AND NOT(A1) AND NOT(A0)) ELSE -- 0100
         temp_Q(5)  WHEN (NOT(A3) AND    (A2) AND NOT(A1) AND    (A0)) ELSE -- 0101
         temp_Q(6)  WHEN (NOT(A3) AND    (A2) AND    (A1) AND NOT(A0)) ELSE -- 0110
         temp_Q(7)  WHEN (NOT(A3) AND    (A2) AND    (A1) AND    (A0)) ELSE -- 0111
         temp_Q(8)  WHEN (   (A3) AND NOT(A2) AND NOT(A1) AND NOT(A0)) ELSE -- 1000
         temp_Q(9)  WHEN (   (A3) AND NOT(A2) AND NOT(A1) AND    (A0)) ELSE -- 1001
         temp_Q(10) WHEN (   (A3) AND NOT(A2) AND    (A1) AND NOT(A0)) ELSE -- 1010
         temp_Q(11) WHEN (   (A3) AND NOT(A2) AND    (A1) AND    (A0)) ELSE -- 1011
         temp_Q(12) WHEN (   (A3) AND    (A2) AND NOT(A1) AND NOT(A0)) ELSE -- 1100
         temp_Q(13) WHEN (   (A3) AND    (A2) AND NOT(A1) AND    (A0)) ELSE -- 1101
         temp_Q(14) WHEN (   (A3) AND    (A2) AND    (A1) AND NOT(A0)) ELSE -- 1110
         temp_Q(15);                                                        -- 1111

END Behavioral;
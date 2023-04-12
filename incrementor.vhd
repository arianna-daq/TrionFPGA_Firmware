----------------------------------------------------------------------------------
--	incrementor.vhd
--
-- 	Created By:	Manuel Pasqual Paul
--
--	Original Design By:	Tarun Prakash
----------------------------------------------------------------------------------

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY incrementor IS
    PORT ( 
        A : IN  STD_LOGIC;
        B : IN  STD_LOGIC;
        C : IN  STD_LOGIC;
        D : IN  STD_LOGIC;

        sum : OUT  STD_LOGIC_VECTOR (3 DOWNTO 0)
    );

END incrementor;

ARCHITECTURE Behavioral OF incrementor IS

SIGNAL sum_temp: std_logic_vector(3 DOWNTO 0);

BEGIN

    sum_temp(0) <= (NOT(A) AND D) OR (A AND (NOT(D)));
    sum_temp(1) <= (NOT(A) AND C) OR (NOT(D) AND C) OR (NOT(c) AND A AND D);
    sum_temp(2) <= (NOT(A) AND B) OR (NOT(C) AND B) OR (NOT(D) AND B) OR (NOT(B) AND A AND C AND D);
    sum_temp(3) <= A AND B AND C AND D;

    sum <= sum_temp;

END Behavioral;
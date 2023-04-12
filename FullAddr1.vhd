----------------------------------------------------------------------------------
--	FullAddr1.vhd
--
-- 	Created By:	Manuel Pasqual Paul
--
--	Original Design By:	Tarun Prakash
----------------------------------------------------------------------------------

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY FullAdder1 IS
    PORT ( 
        in1  : IN  STD_LOGIC;
        in2  : IN  STD_LOGIC;
        cin  : IN  STD_LOGIC;

        sum  : OUT  STD_LOGIC;
        cout : OUT  STD_LOGIC
    );

END FullAdder1;

ARCHITECTURE Behavioral OF FullAdder1 IS
BEGIN
    
    sum  <= in1 XOR in2 XOR cin;
    cout <= (in1 AND in2) OR (in1 AND cin) OR (in2 AND cin);

END Behavioral;
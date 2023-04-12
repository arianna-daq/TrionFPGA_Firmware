----------------------------------------------------------------------------------
--	FullAddr2.vhd
--
-- 	Created By:	Manuel Pasqual Paul
--
--	Original Design By:	Tarun Prakash
----------------------------------------------------------------------------------

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY FullAdder2 IS
    PORT ( 
        A1  : IN  STD_LOGIC;
        A2  : IN  STD_LOGIC;
        B1  : IN  STD_LOGIC;
        B2  : IN  STD_LOGIC;
        Cin : IN  STD_LOGIC;

        sum0 : OUT  STD_LOGIC;
		sum1 : OUT  STD_LOGIC;
        cout : OUT  STD_LOGIC
    );

END FullAdder2;

ARCHITECTURE Behavioral OF FullAdder2 IS

COMPONENT FullAdder1
    PORT (   
        in1 : IN  STD_LOGIC;
        in2 : IN  STD_LOGIC;
        cin : IN  STD_LOGIC;

        sum  : OUT  STD_LOGIC;
        cout : OUT  STD_LOGIC
    );

END COMPONENT;

SIGNAL temp0 : std_logic;

BEGIN

    FA1: FullAdder1 PORT MAP (
        in1  => A1,
        in2  => B1,
        cin  => Cin,
        sum  => sum0,
        cout => temp0
	);

    FA2: FullAdder1 PORT MAP (
		in1  => A2,
        in2  => B2,
        cin  => temp0,
        sum  => sum1,
        cout => cout
	);

END Behavioral;
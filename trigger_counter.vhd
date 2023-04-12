----------------------------------------------------------------------------------
--	trigger_counter.vhd
--
-- 	Created By:	Manuel Pasqual Paul
--
--	Original Design By:	Tarun Prakash
----------------------------------------------------------------------------------

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY trigger_counter IS
    PORT ( 
        trig_0	    : IN STD_LOGIC; 
        trig_1	    : IN STD_LOGIC;
        trig_2	    : IN STD_LOGIC;
        trig_3	    : IN STD_LOGIC;
        trig_4	    : IN STD_LOGIC;
        trig_5	    : IN STD_LOGIC;
        trig_6	    : IN STD_LOGIC;
        trig_7	    : IN STD_LOGIC;

        trig_count  : OUT STD_LOGIC_VECTOR(3 downto 0)
    );

END trigger_counter;

ARCHITECTURE Behavioral OF trigger_counter IS

COMPONENT FullAdder1
    PORT (   
        in1 : IN  STD_LOGIC;
        in2 : IN  STD_LOGIC;
        cin : IN  STD_LOGIC;

        sum  : OUT  STD_LOGIC;
        cout : OUT  STD_LOGIC
    );

END COMPONENT;

COMPONENT FullAdder2
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

END COMPONENT;

COMPONENT incrementor
    PORT (   
        A : IN  STD_LOGIC;
        B : IN  STD_LOGIC;
        C : IN  STD_LOGIC;
        D : IN  STD_LOGIC;

        sum : OUT  STD_LOGIC_VECTOR (3 DOWNTO 0)
    );

END COMPONENT;

SIGNAL temp0, temp1, temp2, temp3 : std_logic;
SIGNAL temp4, temp5, temp6        : std_logic;

BEGIN

    TC1 : FullAdder1 PORT MAP (
        in1  => trig_0,
        in2  => trig_1,
        cin  => trig_2,
        sum  => temp0,
        cout => temp1
	);

    TC2 : FullAdder1  PORT MAP (
		in1  => trig_3,
        in2  => trig_4,
        cin  => trig_5,
        sum  => temp2,
        cout => temp3
	);

    TC3 : FullAdder2 PORT MAP (
        A1   => temp0,
        A2   => temp1,
        B1   => temp2,
        B2   => temp3,
        Cin  => trig_6,
        cout => temp4,
        sum0 => temp5,
        sum1 => temp6
    );  

    TC4 : incrementor PORT MAP (
        A   => trig_7,
        B   => temp4,
        C   => temp6,
        D   => temp5,
        sum => trig_count
    );

END Behavioral;
----------------------------------------------------------------------------------
--	majority_8_logic.vhd
--
-- 	Created By:	Manuel Pasqual Paul
--
--	Original Design By:	Tarun Prakash
--To change majority logic, uncomment the corresponding majority logic equation and define the signal and update the signal in the internal_trigger equation.
--Also assign the correct demux_x value to the corresponding majority logic.
----------------------------------------------------------------------------------

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY majority_8_logic IS
    PORT ( 
        trig_0              : IN STD_LOGIC;
        trig_1              : IN STD_LOGIC;
        trig_2              : IN STD_LOGIC;
        trig_3              : IN STD_LOGIC;
        trig_4              : IN STD_LOGIC;
        trig_5              : IN STD_LOGIC;
        trig_6              : IN STD_LOGIC;
        trig_7              : IN STD_LOGIC;
        clk                 : IN STD_LOGIC;
        RPi_sel0            : IN STD_LOGIC;
        RPi_sel1            : IN STD_LOGIC;
        enable_thermal_trig : IN STD_LOGIC;
        ext_trig            : IN STD_LOGIC;
        force_trig          : IN STD_LOGIC;

        internal_trigger    : OUT STD_LOGIC
    );

END majority_8_logic;

ARCHITECTURE Behavioral OF majority_8_logic IS

COMPONENT trigger_counter
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

END COMPONENT;

COMPONENT demux
	PORT (	
        clk     : IN STD_LOGIC; 
        sel0    : IN STD_LOGIC; 
        sel1    : IN STD_LOGIC; 

        cout0   : OUT  STD_LOGIC; 
        cout1   : OUT  STD_LOGIC;
        cout2   : OUT  STD_LOGIC;		
        cout3   : OUT  STD_LOGIC
    );

END COMPONENT;

SIGNAL trig_count_sig : STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL demux_0, demux_1, demux_2, demux_3 : STD_LOGIC;
SIGNAL majority1, majority2, majority4, majority3 : STD_LOGIC; 

BEGIN

    ML1: trigger_counter PORT MAP (
        trig_0     => trig_0, 
		trig_1     => trig_1, 
		trig_2     => trig_2, 
		trig_3     => trig_3,
		trig_4     => trig_4,
		trig_5     => trig_5, 
		trig_6     => trig_6,
		trig_7     => trig_7,
		trig_count => trig_count_sig
    );

    ML2: demux PORT MAP (	
        clk     => clk,
        sel0    => RPi_sel0,
        sel1    => RPi_sel1,
        cout0   => demux_0,
        cout1   => demux_1,
        cout2   => demux_2,
        cout3   => demux_3
   );

    majority1 <= (((not(trig_count_sig(3)) and not(trig_count_sig(2)) and not(trig_count_sig(1)) and    (trig_count_sig(0))) or --0001
				   (not(trig_count_sig(3)) and not(trig_count_sig(2)) and    (trig_count_sig(1)) and not(trig_count_sig(0))) or --0010
                   (not(trig_count_sig(3)) and not(trig_count_sig(2)) and    (trig_count_sig(1)) and    (trig_count_sig(0))) or --0011
				   (not(trig_count_sig(3)) and    (trig_count_sig(2)) and not(trig_count_sig(1)) and not(trig_count_sig(0))) or --0100
				   (not(trig_count_sig(3)) and    (trig_count_sig(2)) and not(trig_count_sig(1)) and    (trig_count_sig(0))) or --0101
				   (not(trig_count_sig(3)) and    (trig_count_sig(2)) and    (trig_count_sig(1)) and not(trig_count_sig(0))) or --0110
				   (not(trig_count_sig(3)) and    (trig_count_sig(2)) and    (trig_count_sig(1)) and    (trig_count_sig(0))) or --0111
				   (   (trig_count_sig(3)) and not(trig_count_sig(2)) and not(trig_count_sig(1)) and not(trig_count_sig(0))))   --1000
                   and demux_0 and enable_thermal_trig);  

    majority2 <= (((not(trig_count_sig(3)) and not(trig_count_sig(2)) and    (trig_count_sig(1)) and not(trig_count_sig(0))) or --0010
                   (not(trig_count_sig(3)) and not(trig_count_sig(2)) and    (trig_count_sig(1)) and    (trig_count_sig(0))) or --0011
				   (not(trig_count_sig(3)) and    (trig_count_sig(2)) and not(trig_count_sig(1)) and not(trig_count_sig(0))) or --0100
				   (not(trig_count_sig(3)) and    (trig_count_sig(2)) and not(trig_count_sig(1)) and    (trig_count_sig(0))) or --0101
				   (not(trig_count_sig(3)) and    (trig_count_sig(2)) and    (trig_count_sig(1)) and not(trig_count_sig(0))) or --0110
				   (not(trig_count_sig(3)) and    (trig_count_sig(2)) and    (trig_count_sig(1)) and    (trig_count_sig(0))) or --0111
				   (   (trig_count_sig(3)) and not(trig_count_sig(2)) and not(trig_count_sig(1)) and not(trig_count_sig(0))))   --1000
                   and demux_1 and enable_thermal_trig); 

	majority3 <= (((not(trig_count_sig(3)) and not(trig_count_sig(2)) and    (trig_count_sig(1)) and    (trig_count_sig(0))) or --0011
				   (not(trig_count_sig(3)) and    (trig_count_sig(2)) and not(trig_count_sig(1)) and not(trig_count_sig(0))) or --0100
				   (not(trig_count_sig(3)) and    (trig_count_sig(2)) and not(trig_count_sig(1)) and    (trig_count_sig(0))) or --0101
				   (not(trig_count_sig(3)) and    (trig_count_sig(2)) and    (trig_count_sig(1)) and not(trig_count_sig(0))) or --0110
				   (not(trig_count_sig(3)) and    (trig_count_sig(2)) and    (trig_count_sig(1)) and    (trig_count_sig(0))) or --0111
				   (   (trig_count_sig(3)) and not(trig_count_sig(2)) and not(trig_count_sig(1)) and not(trig_count_sig(0))))   --1000
                   and demux_2 and enable_thermal_trig);  

	majority4 <= (((not(trig_count_sig(3)) and    (trig_count_sig(2)) and not(trig_count_sig(1)) and not(trig_count_sig(0))) or --0100
				   (not(trig_count_sig(3)) and    (trig_count_sig(2)) and not(trig_count_sig(1)) and    (trig_count_sig(0))) or --0101
				   (not(trig_count_sig(3)) and    (trig_count_sig(2)) and    (trig_count_sig(1)) and not(trig_count_sig(0))) or --0110
				   (not(trig_count_sig(3)) and    (trig_count_sig(2)) and    (trig_count_sig(1)) and    (trig_count_sig(0))) or --0111
				   (   (trig_count_sig(3)) and not(trig_count_sig(2)) and not(trig_count_sig(1)) and not(trig_count_sig(0))))   --1000
                   and demux_3 and enable_thermal_trig); 

--    majority5 <= (((not(trig_count_sig(3)) and    (trig_count_sig(2)) and not(trig_count_sig(1)) and    (trig_count_sig(0))) or --0101
--				   (not(trig_count_sig(3)) and    (trig_count_sig(2)) and    (trig_count_sig(1)) and not(trig_count_sig(0))) or --0110
--				   (not(trig_count_sig(3)) and    (trig_count_sig(2)) and    (trig_count_sig(1)) and    (trig_count_sig(0))) or --0111
--				   (   (trig_count_sig(3)) and not(trig_count_sig(2)) and not(trig_count_sig(1)) and not(trig_count_sig(0))))   --1000
--                   and demux_x and enable_thermal_trig); 

--    majority6 <= (((not(trig_count_sig(3)) and    (trig_count_sig(2)) and    (trig_count_sig(1)) and not(trig_count_sig(0))) or --0110
--				   (not(trig_count_sig(3)) and    (trig_count_sig(2)) and    (trig_count_sig(1)) and    (trig_count_sig(0))) or --0111
--				   (   (trig_count_sig(3)) and not(trig_count_sig(2)) and not(trig_count_sig(1)) and not(trig_count_sig(0))))   --1000
--                   and demux_x and enable_thermal_trig); 

--    majority7 <= (((not(trig_count_sig(3)) and    (trig_count_sig(2)) and    (trig_count_sig(1)) and    (trig_count_sig(0))) or --0111
--				   (   (trig_count_sig(3)) and not(trig_count_sig(2)) and not(trig_count_sig(1)) and not(trig_count_sig(0))))   --1000
--                   and demux_x and enable_thermal_trig); 				

--    majority8 <= (((  (trig_count_sig(3)) and not(trig_count_sig(2)) and not(trig_count_sig(1)) and not(trig_count_sig(0))))   --1000 
--                   and demux_x and enable_thermal_trig; 

    internal_trigger <= majority1 or majority2 or majority4 or majority3 or ext_trig or force_trig;

END Behavioral;
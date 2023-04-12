----------------------------------------------------------------------------------
--	demux.vhd
--
-- 	Created By:	Manuel Pasqual Paul
--
--	Original Design By:	Tarun Prakash
----------------------------------------------------------------------------------

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY demux IS
    PORT (
        clk   : IN std_logic; 
        sel0  : IN std_logic; 
        sel1  : IN std_logic; 
        
        cout0 : OUT std_logic; 
        cout1 : OUT std_logic;
        cout2 : OUT std_logic;	
        cout3 : OUT std_logic
    );
    
END demux;
    
ARCHITECTURE Behavioral OF demux IS
BEGIN
    
    demux : PROCESS (clk)
    BEGIN
        IF rising_edge(clk) THEN
            cout0 <= (NOT sel0) AND (NOT sel1);	-- any one
            cout1 <= sel0 AND (NOT sel1);		-- any two
            cout2 <= (NOT sel0) AND sel1;		-- any three
            cout3 <= sel0 AND sel1;				-- any four

        END IF;

    END PROCESS; 

 END Behavioral;
----------------------------------------------------------------------------------
---	sync.vhd
---
--- Created By:	Manuel Pasqual Paul
---
---	Original Design By:	Tarun Prakash
---
--- Description:
----------------------------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY outmux21 IS
    PORT ( 
        data_in : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
		sel     : IN STD_LOGIC;
		clk     : IN STD_LOGIC;

        data_out : OUT STD_LOGIC
        
    );

END outmux21;

ARCHITECTURE Behavioral OF outmux21 IS
BEGIN 

    O21 : PROCESS ( clk,data_in) 
        BEGIN  
            CASE sel IS
                WHEN '0' => data_out <= data_in(0);
                WHEN '1' => data_out <= data_in(1);
                WHEN OTHERS => NULL;

            END CASE;

        END PROCESS;

END Behavioral;
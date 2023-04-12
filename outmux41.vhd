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

ENTITY outmux41 IS
    PORT ( 
        data_in : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		sel     : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
		clk     : IN STD_LOGIC;

        data_out : OUT STD_LOGIC
      
    );

END outmux41;

ARCHITECTURE Behavioral OF outmux41 IS
BEGIN

    O41 : PROCESS ( clk,data_in) 
        BEGIN 
            CASE sel IS
                WHEN "00" => data_out <= data_in(0);
                WHEN "01" => data_out <= data_in(1);
                WHEN "10" => data_out <= data_in(2);
                WHEN "11" => data_out <= data_in(3);
                WHEN OTHERS => NULL;

            END CASE;
        END PROCESS;

END Behavioral;
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

ENTITY stop_concatenation IS
    PORT ( 
        d0 : IN STD_LOGIC;
        d1 : IN STD_LOGIC;

        data_out : OUT STD_LOGIC_VECTOR(1 DOWNTO 0)
        
    );

END stop_concatenation;

ARCHITECTURE Behavioral OF stop_concatenation IS
BEGIN

data_out <= d1 & d0;

END Behavioral;
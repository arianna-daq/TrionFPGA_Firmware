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

ENTITY concatenation IS
    PORT ( 
        d0 : IN STD_LOGIC;
        d1 : IN STD_LOGIC;
        d2 : IN STD_LOGIC;
        d3 : IN STD_LOGIC;

        data_out : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)

    );

END concatenation;

ARCHITECTURE Behavioral OF concatenation IS
BEGIN

    data_out <= d3 & d2 & d1 & d0;

END Behavioral;
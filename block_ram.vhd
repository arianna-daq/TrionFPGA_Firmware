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
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;

ENTITY block_ram IS
    PORT ( 
        clk  : IN STD_LOGIC;
        we   : IN STD_LOGIC;
        en   : IN STD_LOGIC;
        di   : IN STD_LOGIC_VECTOR(3 downto 0);
        addr : IN STD_LOGIC_VECTOR(11 downto 0);

        do : OUT STD_LOGIC_VECTOR(3 downto 0)

    );

END block_ram;

ARCHITECTURE Behavioral OF block_ram IS

TYPE RAM_TYPE IS ARRAY (0 TO 4095) OF STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL RAM: RAM_TYPE;
ATTRIBUTE ram_style: STRING;
ATTRIBUTE ram_style OF RAM: SIGNAL IS "block";

BEGIN

	BR1 : PROCESS (clk)
	BEGIN
		IF rising_edge(clk) THEN
			IF en = '1' THEN
				do <= RAM(conv_integer(addr));
				IF we = '1' THEN
					RAM(conv_integer(addr)) <= di;						

				END IF;

			ELSE
				do <= "0000";

			END IF;
		END IF;
	END PROCESS;

END Behavioral;
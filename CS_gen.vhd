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

ENTITY CS_gen IS
    PORT ( 
		en      : IN STD_LOGIC;			-- Enable Chip Signal
        clk_1M  : IN STD_LOGIC;			--  1 MHz Clock 
        clk_20M : IN STD_LOGIC;			-- 20 MHz Clock
        rst     : IN STD_LOGIC;			-- Reset Signal from RPi

		ADC_clk   : OUT STD_LOGIC;		-- ADC Read Clock Output to ADCs
		SST_rck   : OUT STD_LOGIC;		-- SST Read Clock Output to SSTs
        CS_n      : OUT STD_LOGIC;		-- Active Low Chip Select to ADC
        RAM_sync  : OUT STD_LOGIC		-- Memory Synchronizing Signal
	);

END CS_gen;

ARCHITECTURE Behavioral OF CS_gen IS

SIGNAL enable1 : STD_LOGIC := '0';
SIGNAL enable2 : STD_LOGIC := '0';

BEGIN

	CS1 : PROCESS (clk_1M, en, rst) 
		BEGIN
			IF rst = '1' THEN
				enable1 <= '0';

			ELSE
				IF en = '1' THEN
					IF rising_edge(clk_1M) THEN
						enable1 <= '1';

					END IF;

				ELSE
					enable1 <= '0';

				END IF;
			END IF;
		END PROCESS;
	
	CS2 : PROCESS (clk_1M, enable1, rst) 
		BEGIN
			IF rst = '1' THEN
				enable2 <= '0';

			ELSE
				IF enable1 = '1' THEN
					IF rising_edge(clk_1M) THEN
						enable2 <= '1';

					END IF;

				ELSE
					enable2 <= '0';

				END IF;
			END IF;
		END PROCESS;

	CS3 : process (enable1, rst) 
		BEGIN
			IF rst = '1' THEN
				CS_n	  <= '1';
				SST_rck   <= '1';
				ADC_clk   <= '0';

			ELSE
				IF enable1 = '0' THEN
					CS_n		<= '1';
					SST_rck 	<= '1';
					ADC_clk 	<= '0';

				ELSE
					SST_rck 	<= clk_1M;
					CS_n		<= clk_1M;
					ADC_clk 	<= clk_20M;

				END IF;
			END IF;
		END PROCESS;

	CS4 : PROCESS (enable2, rst) 
		BEGIN
			IF rst = '1' THEN
				RAM_sync <= '0';

			ELSE
				IF enable2 = '0' THEN
					RAM_sync <= '0';

				ELSE
					RAM_sync <= NOT clk_1M;

				END IF;
			END IF;
		END PROCESS;
	
END Behavioral;
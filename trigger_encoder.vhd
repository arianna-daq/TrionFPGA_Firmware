----------------------------------------------------------------------------------
--	trigger_encoder.vhd
--
-- 	Created By:	Manuel Pasqual Paul
--
--	Original Design By:	Tarun Prakash
----------------------------------------------------------------------------------

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY trigger_encoder IS
    PORT ( 
		trigger_0L	: IN  STD_LOGIC;
		trigger_0H 	: IN  STD_LOGIC;
		trigger_1L 	: IN  STD_LOGIC;
		trigger_1H 	: IN  STD_LOGIC;
		trigger_2L 	: IN  STD_LOGIC;
		trigger_2H 	: IN  STD_LOGIC;
		trigger_3L 	: IN  STD_LOGIC;
		trigger_3H 	: IN  STD_LOGIC;
		trigger_4L 	: IN  STD_LOGIC;
		trigger_4H 	: IN  STD_LOGIC;
		trigger_5L 	: IN  STD_LOGIC;
		trigger_5H 	: IN  STD_LOGIC;
		trigger_6L 	: IN  STD_LOGIC;
		trigger_6H 	: IN  STD_LOGIC;
		trigger_7L 	: IN  STD_LOGIC;
		trigger_7H 	: IN  STD_LOGIC;
		and_or_sel 	: IN  STD_LOGIC;
		diff_sel   	: IN  STD_LOGIC;

		ch_0       	: OUT STD_LOGIC;
		ch_1       	: OUT STD_LOGIC;
		ch_2       	: OUT STD_LOGIC;
		ch_3       	: OUT STD_LOGIC;
		ch_4       	: OUT STD_LOGIC;
		ch_5       	: OUT STD_LOGIC;
		ch_6       	: OUT STD_LOGIC;
		ch_7       	: OUT STD_LOGIC
	);

END trigger_encoder;

ARCHITECTURE Behavioral OF trigger_encoder IS
BEGIN

	ch_0 <= trigger_0L WHEN diff_sel = '1' ELSE
			(trigger_0L AND trigger_0H) WHEN and_or_sel = '1' ELSE
			(trigger_0L OR trigger_0H)  WHEN and_or_sel = '0' ELSE
			'0';

	ch_1 <= trigger_1L WHEN diff_sel = '1' ELSE
			(trigger_1L AND trigger_1H) WHEN and_or_sel = '1' ELSE
			(trigger_1L OR trigger_1H)  WHEN and_or_sel = '0' ELSE
			'0';

	ch_2 <= trigger_2L WHEN diff_sel = '1' ELSE
			(trigger_2L AND trigger_2H) WHEN and_or_sel = '1' ELSE
			(trigger_2L OR trigger_2H)  WHEN and_or_sel = '0' ELSE
			'0';

	ch_3 <= trigger_3L WHEN diff_sel = '1' ELSE
			(trigger_3L AND trigger_3H) WHEN and_or_sel = '1' ELSE
			(trigger_3L OR trigger_3H)  WHEN and_or_sel = '0' ELSE
			'0';

	ch_4 <= trigger_4L WHEN diff_sel = '1' ELSE
			(trigger_4L AND trigger_4H) WHEN and_or_sel = '1' ELSE
			(trigger_4L OR trigger_4H)  WHEN and_or_sel = '0' ELSE
			'0';

	ch_5 <= trigger_5L WHEN diff_sel = '1' ELSE
			(trigger_5L AND trigger_5H) WHEN and_or_sel = '1' ELSE
			(trigger_5L OR trigger_5H)  WHEN and_or_sel = '0' ELSE
			'0';

	ch_6 <= trigger_6L WHEN diff_sel = '1' ELSE
			(trigger_6L AND trigger_6H) WHEN and_or_sel = '1' ELSE
			(trigger_6L OR trigger_6H)  WHEN and_or_sel = '0' ELSE
			'0';

	ch_7 <= trigger_7L WHEN diff_sel = '1' ELSE
			(trigger_7L AND trigger_7H) WHEN and_or_sel = '1' ELSE
			(trigger_7L OR trigger_7H)  WHEN and_or_sel = '0' ELSE
			'0';

END Behavioral;
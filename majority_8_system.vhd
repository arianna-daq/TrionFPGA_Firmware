----------------------------------------------------------------------------------
--	incrementor.vhd
--
-- 	Created By:	Manuel Pasqual Paul
--
--	Original Design By:	Tarun Prakash
----------------------------------------------------------------------------------

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY majority_8_system is
    PORT (
        and_or_sel_RPi      : IN STD_LOGIC;
        diff_sel_RPi        : IN STD_LOGIC;
        Trigger_0_L         : IN STD_LOGIC;
        Trigger_0_H         : IN STD_LOGIC;
        Trigger_1_L         : IN STD_LOGIC;
        Trigger_1_H         : IN STD_LOGIC;
        Trigger_2_L         : IN STD_LOGIC;
        Trigger_2_H         : IN STD_LOGIC;
        Trigger_3_L         : IN STD_LOGIC;
        Trigger_3_H         : IN STD_LOGIC;
        Trigger_4_L         : IN STD_LOGIC;
        Trigger_4_H         : IN STD_LOGIC;
        Trigger_5_L         : IN STD_LOGIC;
        Trigger_5_H         : IN STD_LOGIC;
        Trigger_6_L         : IN STD_LOGIC;
        Trigger_6_H         : IN STD_LOGIC;
        Trigger_7_L         : IN STD_LOGIC;
        Trigger_7_H         : IN STD_LOGIC;
        clk                 : IN STD_LOGIC;
        RPi_sel_0           : IN STD_LOGIC;
        RPi_sel_1           : IN STD_LOGIC;
        enable_Thermal_trig : IN STD_LOGIC;
        Ext_trig            : IN STD_LOGIC;
        Force_trig          : IN STD_LOGIC;

        and_or_sel_SST1 : OUT STD_LOGIC;
        and_or_sel_SST2 : OUT STD_LOGIC;
        diff_sel_SST1   : OUT STD_LOGIC;
        diff_sel_SST2   : OUT STD_LOGIC;
        trigger_out     : OUT STD_LOGIC
    );

END majority_8_system;

ARCHITECTURE Behavioral OF majority_8_system is

COMPONENT trigger_encoder 
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

		ch_0 : OUT STD_LOGIC;
		ch_1 : OUT STD_LOGIC;
		ch_2 : OUT STD_LOGIC;
		ch_3 : OUT STD_LOGIC;
		ch_4 : OUT STD_LOGIC;
		ch_5 : OUT STD_LOGIC;
		ch_6 : OUT STD_LOGIC;
		ch_7 : OUT STD_LOGIC
    );

END COMPONENT;

COMPONENT majority_8_logic 
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

END COMPONENT;

SIGNAL temp_ch0, temp_ch1, temp_ch2, temp_ch3 : STD_LOGIC;
SIGNAL temp_ch4, temp_ch5, temp_ch6, temp_ch7 : STD_LOGIC;

BEGIN

    MS1 : trigger_encoder PORT MAP (
        trigger_0L => Trigger_0_L, 	
		trigger_0H => Trigger_0_H, 	 	
		trigger_1L => Trigger_1_L, 		
		trigger_1H => Trigger_1_H, 		
		trigger_2L => Trigger_2_L, 		
		trigger_2H => Trigger_2_H, 		
		trigger_3L => Trigger_3_L, 		
		trigger_3H => Trigger_3_H, 	 
		trigger_4L => Trigger_4_L, 		
		trigger_4H => Trigger_4_H, 		
		trigger_5L => Trigger_5_L, 		
		trigger_5H => Trigger_5_H, 		
		trigger_6L => Trigger_6_L, 		
		trigger_6H => Trigger_6_H, 		
		trigger_7L => Trigger_7_L, 		
		trigger_7H => Trigger_7_H, 		
		and_or_sel => and_or_sel_RPi, 		
		diff_sel   => diff_sel_RPi, 	
		ch_0       => temp_ch0,
		ch_1       => temp_ch1, 
		ch_2       => temp_ch2, 
		ch_3       => temp_ch3, 
		ch_4       => temp_ch4, 
		ch_5       => temp_ch5, 
		ch_6       => temp_ch6, 
		ch_7       => temp_ch7

    );

    MS2 : majority_8_logic PORT MAP (
        trig_0              => temp_ch0,
        trig_1              => temp_ch1,
        trig_2              => temp_ch2,
        trig_3              => temp_ch3,
        trig_4              => temp_ch4,
        trig_5              => temp_ch5,
        trig_6              => temp_ch6,
        trig_7              => temp_ch7,
        clk                 => clk,                 
        RPi_sel0            => RPi_sel_0,           
        RPi_sel1            => RPi_sel_1,         
        enable_thermal_trig => enable_Thermal_trig,
        ext_trig            => Ext_trig,           
        force_trig          => Force_trig,         
        internal_trigger    => trigger_out   

    );

    and_or_sel_SST1 <= and_or_sel_RPi;
    and_or_sel_SST2 <= and_or_sel_RPi;
    diff_sel_SST1   <= diff_sel_RPi;  
    diff_sel_SST2   <= diff_sel_RPi;  

END Behavioral;
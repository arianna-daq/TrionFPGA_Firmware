----------------------------------------------------------------------------------
--	incrementor.vhd
--
-- 	Created By:	Manuel Pasqual Paul
--
--	Original Design By:	Tarun Prakash
----------------------------------------------------------------------------------

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY stop_gen_8_block IS
    PORT (
        trig_0L             : IN STD_LOGIC;
        trig_0H             : IN STD_LOGIC;
        trig_1L             : IN STD_LOGIC;
        trig_1H             : IN STD_LOGIC;
        trig_2L             : IN STD_LOGIC;
        trig_2H             : IN STD_LOGIC;
        trig_3L             : IN STD_LOGIC;
        trig_3H             : IN STD_LOGIC;
        trig_4L             : IN STD_LOGIC;
        trig_4H             : IN STD_LOGIC;
        trig_5L             : IN STD_LOGIC;
        trig_5H             : IN STD_LOGIC;
        trig_6L             : IN STD_LOGIC;
        trig_6H             : IN STD_LOGIC;
        trig_7L             : IN STD_LOGIC;
        trig_7H             : IN STD_LOGIC;
        clk                 : IN STD_LOGIC;
        rst                 : IN STD_LOGIC;
        RPi_sel0            : IN STD_LOGIC;
        RPi_sel1            : IN STD_LOGIC;
        enable_thermal_trig : IN STD_LOGIC;
        ext_trig            : IN STD_LOGIC;
        force_trig          : IN STD_LOGIC;
        and_or_sel_RPi      : IN STD_LOGIC;
        diff_sel_RPi        : IN STD_LOGIC;
        clk_160M            : IN STD_LOGIC;

        and_or_sel_SST1 : OUT STD_LOGIC;
        and_or_sel_SST2 : OUT STD_LOGIC;
        diff_sel_SST1   : OUT STD_LOGIC;
        diff_sel_SST2   : OUT STD_LOGIC;
        reset_SST1      : OUT STD_LOGIC;
        reset_SST2      : OUT STD_LOGIC;
        stop_SST1       : OUT STD_LOGIC;
        stop_SST2       : OUT STD_LOGIC;
        trigger_out     : OUT STD_LOGIC
        
    );

END stop_gen_8_block;

ARCHITECTURE Behavioral OF stop_gen_8_block is

COMPONENT majority_8_system 
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

END COMPONENT;

COMPONENT SRL16
    PORT (
        D   : IN STD_LOGIC;
        clk : IN STD_LOGIC;
        A0  : IN STD_LOGIC;
        A1  : IN STD_LOGIC;
        A2  : IN STD_LOGIC;
        A3  : IN STD_LOGIC;

        Q   : OUT STD_LOGIC
    );
END COMPONENT;

COMPONENT stoplatch
    PORT (
        trigger : IN STD_LOGIC;
        clk     : IN STD_LOGIC;
        reset   : IN STD_LOGIC;

        stp    : OUT STD_LOGIC
    );
END COMPONENT;

SIGNAL temp_trig_out, temp_FF, temp_slTrig : STD_LOGIC;
SIGNAL temp_stp : STD_LOGIC;
CONSTANT VCC : STD_LOGIC := '1';
CONSTANT GND : STD_LOGIC := '0';

BEGIN

    SG1: majority_8_system PORT MAP (
        and_or_sel_RPi      => and_or_sel_RPi,
        diff_sel_RPi        => diff_sel_RPi,
        Trigger_0_L         => trig_0L,
        Trigger_0_H         => trig_0H,
        Trigger_1_L         => trig_1L,
        Trigger_1_H         => trig_1H,
        Trigger_2_L         => trig_2L,
        Trigger_2_H         => trig_2H,
        Trigger_3_L         => trig_3L,
        Trigger_3_H         => trig_3H,
        Trigger_4_L         => trig_4L,
        Trigger_4_H         => trig_4H,
        Trigger_5_L         => trig_5L,
        Trigger_5_H         => trig_5H,
        Trigger_6_L         => trig_6L,
        Trigger_6_H         => trig_6H,
        Trigger_7_L         => trig_7L,
        Trigger_7_H         => trig_7H,
        clk                 => clk,
        RPi_sel_0           => RPi_sel0,
        RPi_sel_1           => RPi_sel1,
        enable_Thermal_trig => enable_thermal_trig,
        Ext_trig            => ext_trig,
        Force_trig          => force_trig,
        and_or_sel_SST1     => and_or_sel_SST1,
        and_or_sel_SST2     => and_or_sel_SST2,
        diff_sel_SST1       => diff_sel_SST1,
        diff_sel_SST2       => diff_sel_SST2,
        trigger_out         => temp_trig_out

    );

    SG2 : SRL16 PORT MAP (
        D   => temp_trig_out,
        clk => clk_160M,
        A0  => GND,
        A1  => VCC,
        A2  => VCC,
        A3  => VCC,
        Q   => temp_FF

    );

    SG3 : SRL16 PORT MAP (
        D   => temp_FF,
        clk => clk_160M,
        A0  => GND,
        A1  => VCC,
        A2  => VCC,
        A3  => VCC,
        Q   => temp_slTrig

    );

    SG4 : stoplatch PORT MAP (
        trigger => temp_slTrig,
        clk     => clk,
        reset   => rst,
        stp     => temp_stp

    );

    reset_SST1  <= rst;
    reset_SST2  <= rst;
    stop_SST1   <= temp_stp;       
    stop_SST2   <= temp_stp;
    trigger_out <= temp_trig_out;

END Behavioral;

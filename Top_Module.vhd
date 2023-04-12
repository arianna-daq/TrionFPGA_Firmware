----------------------------------------------------------------------------------
--	Top_Module.vhd
--
-- 	Created By:	Manuel Pasqual Paul
----------------------------------------------------------------------------------

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

ENTITY Top_Module IS
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
        re                  : IN STD_LOGIC;
        pll160M             : IN STD_LOGIC;
        pll80M              : IN STD_LOGIC;
        pll20M              : IN STD_LOGIC;
        di_ch0              : IN STD_LOGIC;
        di_ch1              : IN STD_LOGIC;
        di_ch2              : IN STD_LOGIC;
        di_ch3              : IN STD_LOGIC;
        di_ch4              : IN STD_LOGIC;
        di_ch5              : IN STD_LOGIC;
        di_ch6              : IN STD_LOGIC;
        di_ch7              : IN STD_LOGIC;
        stop_data_in0       : IN STD_LOGIC;
        stop_data_in1       : IN STD_LOGIC;
        SPI_CLK             : IN STD_LOGIC;

        CS_n_SST1       : OUT STD_LOGIC;
        CS_n_SST2       : OUT STD_LOGIC;
        SST1_read_clk   : OUT STD_LOGIC;
        SST2_read_clk   : OUT STD_LOGIC;
        ADC_clk_SST1    : OUT STD_LOGIC;
        ADC_clk_SST2    : OUT STD_LOGIC;
        HSCLK_ctrl      : OUT STD_LOGIC;
        and_or_sel_SST1 : OUT STD_LOGIC;
        and_or_sel_SST2 : OUT STD_LOGIC;
        diff_sel_SST1   : OUT STD_LOGIC;
        diff_sel_SST2   : OUT STD_LOGIC;
        reset_SST1      : OUT STD_LOGIC;
        reset_SST2      : OUT STD_LOGIC;
        stop_SST1       : OUT STD_LOGIC; 
        stop_SST2       : OUT STD_LOGIC; 
        int_trigger_out : OUT STD_LOGIC;
        SPI_MISO        : OUT STD_LOGIC;
        full            : OUT STD_LOGIC 
    );

END Top_Module;

ARCHITECTURE Behavioral OF Top_Module IS

COMPONENT clkgen 
    PORT ( 
        pll_clk_20M  : IN STD_LOGIC;
        pll_clk_80M  : IN STD_LOGIC;   
        pll_clk_160M : IN STD_LOGIC;

        clk_1M   : OUT STD_LOGIC;
        clk_20M  : OUT STD_LOGIC;
        clk_80M  : OUT STD_LOGIC;
        clk_160M : OUT STD_LOGIC
    );

END COMPONENT;

COMPONENT stop_gen_8_block
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
END COMPONENT;

COMPONENT sync
    PORT (
        clk_1   : IN STD_LOGIC;
        clk_20  : IN STD_LOGIC;
        clk_80  : IN STD_LOGIC;
        clk_160 : IN STD_LOGIC;

        clk1M  : OUT STD_LOGIC;
        clk20M : OUT STD_LOGIC

    );
END COMPONENT;

COMPONENT CS_gen
    PORT (
        en      : IN STD_LOGIC;	
        clk_1M  : IN STD_LOGIC;		
        clk_20M : IN STD_LOGIC;		
        rst     : IN STD_LOGIC;		

		ADC_clk   : OUT STD_LOGIC;		
		SST_rck   : OUT STD_LOGIC;	
        CS_n      : OUT STD_LOGIC;
        RAM_sync  : OUT STD_LOGIC
    );
END COMPONENT;

COMPONENT block_ram_mem_module
    PORT (
        en            : IN STD_LOGIC;
		rst           : IN STD_LOGIC;
        re            : IN STD_LOGIC;
        clk           : IN STD_LOGIC;
        d0            : IN STD_LOGIC;
        d1            : IN STD_LOGIC;
        d2            : IN STD_LOGIC;
        d3            : IN STD_LOGIC;
        d4            : IN STD_LOGIC;
        d5            : IN STD_LOGIC;
        d6            : IN STD_LOGIC;
        d7            : IN STD_LOGIC;
        stop_clk      : IN STD_LOGIC;
        stop_data_in0 : IN STD_LOGIC;
        stop_data_in1 : IN STD_LOGIC;

        data_out1     : OUT STD_LOGIC;
        data_out2     : OUT STD_LOGIC;
        stop_data_out : OUT STD_LOGIC;
        data_full2    : OUT STD_LOGIC;
        stop_full     : OUT STD_LOGIC;
        stop_done     : OUT STD_LOGIC
    );
END COMPONENT;

SIGNAL temp_clk1M, temp_clk20M, temp_clk80M  : STD_LOGIC;
SIGNAL temp_clk160M, clk_1M, clk_20M         : STD_LOGIC;
SIGNAL temp_CS, temp_RAM, temp_SST, temp_ADC : STD_LOGIC;
SIGNAL temp_dataFull2, BR_clk, temp_stopFull : STD_LOGIC;
SIGNAL STP_clk, temp_stopDone, temp_rst      : STD_LOGIC;
SIGNAL tempD02, tempD0S, BUFF_T, tempD01     : STD_LOGIC;
CONSTANT VCC : STD_LOGIC := '1';
CONSTANT GND : STD_LOGIC := '0';

BEGIN

    temp_rst   <= rst;
    HSCLK_ctrl <= VCC;

    TM1 : clkgen PORT MAP ( 
        pll_clk_20M  => pll20M,
        pll_clk_80M  => pll80M,
        pll_clk_160M => pll160M,
        clk_1M       => temp_clk1M,
        clk_20M      => temp_clk20M,
        clk_80M      => temp_clk80M,
        clk_160M     => temp_clk160M
    );

    TM2 : stop_gen_8_block PORT MAP (
        trig_0L             => trig_0L,
        trig_0H             => trig_0H,
        trig_1L             => trig_1L,
        trig_1H             => trig_1H,
        trig_2L             => trig_2L,
        trig_2H             => trig_2H,
        trig_3L             => trig_3L,
        trig_3H             => trig_3H,
        trig_4L             => trig_4L,
        trig_4H             => trig_4H,
        trig_5L             => trig_5L,
        trig_5H             => trig_5H,
        trig_6L             => trig_6L,
        trig_6H             => trig_6H,
        trig_7L             => trig_7L,
        trig_7H             => trig_7H,
        clk                 => temp_clk80M,     
        rst                 => temp_rst,    
        RPi_sel0            => RPi_sel0,
        RPi_sel1            => RPi_sel1,
        enable_thermal_trig => enable_thermal_trig,
        ext_trig            => ext_trig,
        force_trig          => force_trig,
        and_or_sel_RPi      => and_or_sel_RPi,
        diff_sel_RPi        => diff_sel_RPi,
        clk_160M            => temp_clk160M,
        and_or_sel_SST1     => and_or_sel_SST1,
        and_or_sel_SST2     => and_or_sel_SST2,
        diff_sel_SST1       => diff_sel_SST1,
        diff_sel_SST2       => diff_sel_SST2,
        reset_SST1          => reset_SST1,
        reset_SST2          => reset_SST2,
        stop_SST1           => stop_SST1,
        stop_SST2           => stop_SST2,
        trigger_out         => int_trigger_out
	);

    TM3 : sync PORT MAP (
        clk_1   => temp_clk1M,
        clk_20  => temp_clk20M,
        clk_80  => temp_clk80M,
        clk_160 => temp_clk160M,
        clk1M   => clk_1M,
        clk20M  => clk_20M
    );

    TM4: CS_gen PORT MAP (
        en       => stop_SST1,
        clk_1M   =>	clk_1M,
        clk_20M  =>	clk_20M,
        rst      =>	temp_rst,
		ADC_clk  => temp_ADC, 	
		SST_rck  => temp_SST, 	
        CS_n     => temp_CS, 
        RAM_sync => temp_RAM
    );

     BR_clk  <= SPI_CLK WHEN (re = '1') ELSE NOT temp_dataFull2 AND temp_RAM AND temp_ADC;
     STP_clk <= SPI_CLK WHEN (re = '1') ELSE NOT temp_stopFull AND temp_RAM;

    TM5 : block_ram_mem_module PORT MAP (
        en            => stop_SST1,
		rst           => temp_rst,
        re            => re,
        clk           => BR_clk,
        d0            => di_ch0,
        d1            => di_ch1,
        d2            => di_ch2,
        d3            => di_ch3,
        d4            => di_ch4,
        d5            => di_ch5,
        d6            => di_ch6,
        d7            => di_ch7,
        stop_clk      => STP_clk,
        stop_data_in0 => stop_data_in0,
        stop_data_in1 => stop_data_in1,
        data_out1     => tempD01,
        data_out2     => tempD02,
        stop_data_out => tempD0S,
        data_full2    => temp_dataFull2,
        stop_full     => temp_stopFull,
        stop_done     => temp_stopDone
    );

    CS_n_SST1     <= temp_CS;
    CS_n_SST2     <= temp_CS;
    SST1_read_clk <= temp_SST;
    SST2_read_clk <= temp_SST;
    ADC_clk_SST1  <= temp_ADC;
    ADC_clk_SST2  <= temp_ADC;

    BUFF_T    <= (NOT re) OR temp_stopDone;
    full      <= temp_dataFull2 AND temp_stopFull;
    
    TM6 : PROCESS (BUFF_T) 
        BEGIN 
            CASE BUFF_T IS
                WHEN '1' => SPI_MISO <= '0';
                WHEN OTHERS => SPI_MISO <= (tempD01 OR tempD02 OR tempD0S);

            END CASE;
        END PROCESS;
    
END Behavioral;
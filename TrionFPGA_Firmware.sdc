
# Efinity Interface Designer SDC
# Version: 2022.1.226
# Date: 2023-04-11 23:06

# Copyright (C) 2017 - 2022 Efinix Inc. All rights reserved.

# Device: T20Q144
# Project: TrionFPGA_Firmware
# Timing Model: I4 (final)

# PLL Constraints
#################
create_clock -period 6.2500 pll160M
create_clock -period 12.5000 pll80M
create_clock -period 50.0000 pll20M

# GPIO Constraints
####################
create_clock -period <USER_PERIOD> [get_ports {clk}]
# set_input_delay -clock <CLOCK> -max <MAX CALCULATION> [get_ports {di_ch0}]
# set_input_delay -clock <CLOCK> -min <MIN CALCULATION> [get_ports {di_ch0}]
# set_input_delay -clock <CLOCK> -max <MAX CALCULATION> [get_ports {di_ch1}]
# set_input_delay -clock <CLOCK> -min <MIN CALCULATION> [get_ports {di_ch1}]
# set_input_delay -clock <CLOCK> -max <MAX CALCULATION> [get_ports {di_ch2}]
# set_input_delay -clock <CLOCK> -min <MIN CALCULATION> [get_ports {di_ch2}]
# set_input_delay -clock <CLOCK> -max <MAX CALCULATION> [get_ports {di_ch3}]
# set_input_delay -clock <CLOCK> -min <MIN CALCULATION> [get_ports {di_ch3}]
# set_input_delay -clock <CLOCK> -max <MAX CALCULATION> [get_ports {di_ch4}]
# set_input_delay -clock <CLOCK> -min <MIN CALCULATION> [get_ports {di_ch4}]
# set_input_delay -clock <CLOCK> -max <MAX CALCULATION> [get_ports {di_ch5}]
# set_input_delay -clock <CLOCK> -min <MIN CALCULATION> [get_ports {di_ch5}]
# set_input_delay -clock <CLOCK> -max <MAX CALCULATION> [get_ports {di_ch6}]
# set_input_delay -clock <CLOCK> -min <MIN CALCULATION> [get_ports {di_ch6}]
# set_input_delay -clock <CLOCK> -max <MAX CALCULATION> [get_ports {di_ch7}]
# set_input_delay -clock <CLOCK> -min <MIN CALCULATION> [get_ports {di_ch7}]
# set_input_delay -clock <CLOCK> -max <MAX CALCULATION> [get_ports {stop_data_in0}]
# set_input_delay -clock <CLOCK> -min <MIN CALCULATION> [get_ports {stop_data_in0}]
# set_input_delay -clock <CLOCK> -max <MAX CALCULATION> [get_ports {stop_data_in1}]
# set_input_delay -clock <CLOCK> -min <MIN CALCULATION> [get_ports {stop_data_in1}]
# set_input_delay -clock <CLOCK> -max <MAX CALCULATION> [get_ports {trig_0H}]
# set_input_delay -clock <CLOCK> -min <MIN CALCULATION> [get_ports {trig_0H}]
# set_input_delay -clock <CLOCK> -max <MAX CALCULATION> [get_ports {trig_0L}]
# set_input_delay -clock <CLOCK> -min <MIN CALCULATION> [get_ports {trig_0L}]
# set_input_delay -clock <CLOCK> -max <MAX CALCULATION> [get_ports {trig_1H}]
# set_input_delay -clock <CLOCK> -min <MIN CALCULATION> [get_ports {trig_1H}]
# set_input_delay -clock <CLOCK> -max <MAX CALCULATION> [get_ports {trig_1L}]
# set_input_delay -clock <CLOCK> -min <MIN CALCULATION> [get_ports {trig_1L}]
# set_input_delay -clock <CLOCK> -max <MAX CALCULATION> [get_ports {trig_2H}]
# set_input_delay -clock <CLOCK> -min <MIN CALCULATION> [get_ports {trig_2H}]
# set_input_delay -clock <CLOCK> -max <MAX CALCULATION> [get_ports {trig_2L}]
# set_input_delay -clock <CLOCK> -min <MIN CALCULATION> [get_ports {trig_2L}]
# set_input_delay -clock <CLOCK> -max <MAX CALCULATION> [get_ports {trig_3H}]
# set_input_delay -clock <CLOCK> -min <MIN CALCULATION> [get_ports {trig_3H}]
# set_input_delay -clock <CLOCK> -max <MAX CALCULATION> [get_ports {trig_3L}]
# set_input_delay -clock <CLOCK> -min <MIN CALCULATION> [get_ports {trig_3L}]
# set_input_delay -clock <CLOCK> -max <MAX CALCULATION> [get_ports {trig_4H}]
# set_input_delay -clock <CLOCK> -min <MIN CALCULATION> [get_ports {trig_4H}]
# set_input_delay -clock <CLOCK> -max <MAX CALCULATION> [get_ports {trig_4L}]
# set_input_delay -clock <CLOCK> -min <MIN CALCULATION> [get_ports {trig_4L}]
# set_input_delay -clock <CLOCK> -max <MAX CALCULATION> [get_ports {trig_5H}]
# set_input_delay -clock <CLOCK> -min <MIN CALCULATION> [get_ports {trig_5H}]
# set_input_delay -clock <CLOCK> -max <MAX CALCULATION> [get_ports {trig_5L}]
# set_input_delay -clock <CLOCK> -min <MIN CALCULATION> [get_ports {trig_5L}]
# set_input_delay -clock <CLOCK> -max <MAX CALCULATION> [get_ports {trig_6H}]
# set_input_delay -clock <CLOCK> -min <MIN CALCULATION> [get_ports {trig_6H}]
# set_input_delay -clock <CLOCK> -max <MAX CALCULATION> [get_ports {trig_6L}]
# set_input_delay -clock <CLOCK> -min <MIN CALCULATION> [get_ports {trig_6L}]
# set_input_delay -clock <CLOCK> -max <MAX CALCULATION> [get_ports {trig_7H}]
# set_input_delay -clock <CLOCK> -min <MIN CALCULATION> [get_ports {trig_7H}]
# set_input_delay -clock <CLOCK> -max <MAX CALCULATION> [get_ports {trig_7L}]
# set_input_delay -clock <CLOCK> -min <MIN CALCULATION> [get_ports {trig_7L}]
# set_output_delay -clock <CLOCK> -max <MAX CALCULATION> [get_ports {ADC_clk_SST1}]
# set_output_delay -clock <CLOCK> -min <MIN CALCULATION> [get_ports {ADC_clk_SST1}]
# set_output_delay -clock <CLOCK> -max <MAX CALCULATION> [get_ports {ADC_clk_SST2}]
# set_output_delay -clock <CLOCK> -min <MIN CALCULATION> [get_ports {ADC_clk_SST2}]
# set_output_delay -clock <CLOCK> -max <MAX CALCULATION> [get_ports {and_or_sel_SST1}]
# set_output_delay -clock <CLOCK> -min <MIN CALCULATION> [get_ports {and_or_sel_SST1}]
# set_output_delay -clock <CLOCK> -max <MAX CALCULATION> [get_ports {and_or_sel_SST2}]
# set_output_delay -clock <CLOCK> -min <MIN CALCULATION> [get_ports {and_or_sel_SST2}]
# set_output_delay -clock <CLOCK> -max <MAX CALCULATION> [get_ports {CS_n_SST1}]
# set_output_delay -clock <CLOCK> -min <MIN CALCULATION> [get_ports {CS_n_SST1}]
# set_output_delay -clock <CLOCK> -max <MAX CALCULATION> [get_ports {CS_n_SST2}]
# set_output_delay -clock <CLOCK> -min <MIN CALCULATION> [get_ports {CS_n_SST2}]
# set_output_delay -clock <CLOCK> -max <MAX CALCULATION> [get_ports {diff_sel_SST1}]
# set_output_delay -clock <CLOCK> -min <MIN CALCULATION> [get_ports {diff_sel_SST1}]
# set_output_delay -clock <CLOCK> -max <MAX CALCULATION> [get_ports {diff_sel_SST2}]
# set_output_delay -clock <CLOCK> -min <MIN CALCULATION> [get_ports {diff_sel_SST2}]
# set_output_delay -clock <CLOCK> -max <MAX CALCULATION> [get_ports {HSCLK_ctrl}]
# set_output_delay -clock <CLOCK> -min <MIN CALCULATION> [get_ports {HSCLK_ctrl}]
# set_output_delay -clock <CLOCK> -max <MAX CALCULATION> [get_ports {int_trigger_out}]
# set_output_delay -clock <CLOCK> -min <MIN CALCULATION> [get_ports {int_trigger_out}]
# set_output_delay -clock <CLOCK> -max <MAX CALCULATION> [get_ports {reset_SST1}]
# set_output_delay -clock <CLOCK> -min <MIN CALCULATION> [get_ports {reset_SST1}]
# set_output_delay -clock <CLOCK> -max <MAX CALCULATION> [get_ports {reset_SST2}]
# set_output_delay -clock <CLOCK> -min <MIN CALCULATION> [get_ports {reset_SST2}]
# set_output_delay -clock <CLOCK> -max <MAX CALCULATION> [get_ports {SST1_read_clk}]
# set_output_delay -clock <CLOCK> -min <MIN CALCULATION> [get_ports {SST1_read_clk}]
# set_output_delay -clock <CLOCK> -max <MAX CALCULATION> [get_ports {SST2_read_clk}]
# set_output_delay -clock <CLOCK> -min <MIN CALCULATION> [get_ports {SST2_read_clk}]
# set_output_delay -clock <CLOCK> -max <MAX CALCULATION> [get_ports {stop_SST1}]
# set_output_delay -clock <CLOCK> -min <MIN CALCULATION> [get_ports {stop_SST1}]
# set_output_delay -clock <CLOCK> -max <MAX CALCULATION> [get_ports {stop_SST2}]
# set_output_delay -clock <CLOCK> -min <MIN CALCULATION> [get_ports {stop_SST2}]

# LVDS RX GPIO Constraints
############################
# set_input_delay -clock <CLOCK> -max <MAX CALCULATION> [get_ports {diff_sel_RPi}]
# set_input_delay -clock <CLOCK> -min <MIN CALCULATION> [get_ports {diff_sel_RPi}]
# set_input_delay -clock <CLOCK> -max <MAX CALCULATION> [get_ports {ext_trig}]
# set_input_delay -clock <CLOCK> -min <MIN CALCULATION> [get_ports {ext_trig}]
# set_input_delay -clock <CLOCK> -max <MAX CALCULATION> [get_ports {re}]
# set_input_delay -clock <CLOCK> -min <MIN CALCULATION> [get_ports {re}]
# set_input_delay -clock <CLOCK> -max <MAX CALCULATION> [get_ports {RPi_sel0}]
# set_input_delay -clock <CLOCK> -min <MIN CALCULATION> [get_ports {RPi_sel0}]
# set_input_delay -clock <CLOCK> -max <MAX CALCULATION> [get_ports {RPi_sel1}]
# set_input_delay -clock <CLOCK> -min <MIN CALCULATION> [get_ports {RPi_sel1}]
# set_input_delay -clock <CLOCK> -max <MAX CALCULATION> [get_ports {SPI_CLK}]
# set_input_delay -clock <CLOCK> -min <MIN CALCULATION> [get_ports {SPI_CLK}]
# set_output_delay -clock <CLOCK> -max <MAX CALCULATION> [get_ports {SPI_MISO}]
# set_output_delay -clock <CLOCK> -min <MIN CALCULATION> [get_ports {SPI_MISO}]

# LVDS Rx Constraints
####################

# LVDS TX GPIO Constraints
############################
# set_input_delay -clock <CLOCK> -max <MAX CALCULATION> [get_ports {and_or_sel_RPi}]
# set_input_delay -clock <CLOCK> -min <MIN CALCULATION> [get_ports {and_or_sel_RPi}]
# set_input_delay -clock <CLOCK> -max <MAX CALCULATION> [get_ports {enable_thermal_trig}]
# set_input_delay -clock <CLOCK> -min <MIN CALCULATION> [get_ports {enable_thermal_trig}]
# set_input_delay -clock <CLOCK> -max <MAX CALCULATION> [get_ports {force_trig}]
# set_input_delay -clock <CLOCK> -min <MIN CALCULATION> [get_ports {force_trig}]
# set_input_delay -clock <CLOCK> -max <MAX CALCULATION> [get_ports {rst}]
# set_input_delay -clock <CLOCK> -min <MIN CALCULATION> [get_ports {rst}]
# set_output_delay -clock <CLOCK> -max <MAX CALCULATION> [get_ports {full}]
# set_output_delay -clock <CLOCK> -min <MIN CALCULATION> [get_ports {full}]

# LVDS Tx Constraints
####################
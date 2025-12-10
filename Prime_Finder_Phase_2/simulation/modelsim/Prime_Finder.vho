-- Copyright (C) 2018  Intel Corporation. All rights reserved.
-- Your use of Intel Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Intel Program License 
-- Subscription Agreement, the Intel Quartus Prime License Agreement,
-- the Intel FPGA IP License Agreement, or other applicable license
-- agreement, including, without limitation, that your use is for
-- the sole purpose of programming logic devices manufactured by
-- Intel and sold by Intel or its authorized distributors.  Please
-- refer to the applicable agreement for further details.

-- VENDOR "Altera"
-- PROGRAM "Quartus Prime"
-- VERSION "Version 18.1.0 Build 625 09/12/2018 SJ Lite Edition"

-- DATE "12/11/2025 01:26:53"

-- 
-- Device: Altera 10M50DAF484C7G Package FBGA484
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY FIFTYFIVENM;
LIBRARY IEEE;
USE FIFTYFIVENM.FIFTYFIVENM_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	hard_block IS
    PORT (
	devoe : IN std_logic;
	devclrn : IN std_logic;
	devpor : IN std_logic
	);
END hard_block;

-- Design Ports Information
-- ~ALTERA_TMS~	=>  Location: PIN_H2,	 I/O Standard: 2.5 V Schmitt Trigger,	 Current Strength: Default
-- ~ALTERA_TCK~	=>  Location: PIN_G2,	 I/O Standard: 2.5 V Schmitt Trigger,	 Current Strength: Default
-- ~ALTERA_TDI~	=>  Location: PIN_L4,	 I/O Standard: 2.5 V Schmitt Trigger,	 Current Strength: Default
-- ~ALTERA_TDO~	=>  Location: PIN_M5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_CONFIG_SEL~	=>  Location: PIN_H10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_nCONFIG~	=>  Location: PIN_H9,	 I/O Standard: 2.5 V Schmitt Trigger,	 Current Strength: Default
-- ~ALTERA_nSTATUS~	=>  Location: PIN_G9,	 I/O Standard: 2.5 V Schmitt Trigger,	 Current Strength: Default
-- ~ALTERA_CONF_DONE~	=>  Location: PIN_F8,	 I/O Standard: 2.5 V Schmitt Trigger,	 Current Strength: Default


ARCHITECTURE structure OF hard_block IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL \~ALTERA_TMS~~padout\ : std_logic;
SIGNAL \~ALTERA_TCK~~padout\ : std_logic;
SIGNAL \~ALTERA_TDI~~padout\ : std_logic;
SIGNAL \~ALTERA_CONFIG_SEL~~padout\ : std_logic;
SIGNAL \~ALTERA_nCONFIG~~padout\ : std_logic;
SIGNAL \~ALTERA_nSTATUS~~padout\ : std_logic;
SIGNAL \~ALTERA_CONF_DONE~~padout\ : std_logic;
SIGNAL \~ALTERA_TMS~~ibuf_o\ : std_logic;
SIGNAL \~ALTERA_TCK~~ibuf_o\ : std_logic;
SIGNAL \~ALTERA_TDI~~ibuf_o\ : std_logic;
SIGNAL \~ALTERA_CONFIG_SEL~~ibuf_o\ : std_logic;
SIGNAL \~ALTERA_nCONFIG~~ibuf_o\ : std_logic;
SIGNAL \~ALTERA_nSTATUS~~ibuf_o\ : std_logic;
SIGNAL \~ALTERA_CONF_DONE~~ibuf_o\ : std_logic;

BEGIN

ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
END structure;


LIBRARY ALTERA;
LIBRARY FIFTYFIVENM;
LIBRARY IEEE;
USE ALTERA.ALTERA_PRIMITIVES_COMPONENTS.ALL;
USE FIFTYFIVENM.FIFTYFIVENM_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	Prime_Finder_16bit_Top_Group55 IS
    PORT (
	MAX10_CLK1_50 : IN std_logic;
	SW : IN std_logic_vector(9 DOWNTO 0);
	KEY : IN std_logic_vector(1 DOWNTO 0);
	HEX0 : BUFFER std_logic_vector(6 DOWNTO 0);
	HEX1 : BUFFER std_logic_vector(6 DOWNTO 0);
	HEX2 : BUFFER std_logic_vector(6 DOWNTO 0);
	HEX3 : BUFFER std_logic_vector(6 DOWNTO 0);
	HEX4 : BUFFER std_logic_vector(6 DOWNTO 0);
	HEX5 : BUFFER std_logic_vector(6 DOWNTO 0);
	LEDR : BUFFER std_logic_vector(9 DOWNTO 0)
	);
END Prime_Finder_16bit_Top_Group55;

-- Design Ports Information
-- SW[8]	=>  Location: PIN_B14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- SW[9]	=>  Location: PIN_F15,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- HEX0[0]	=>  Location: PIN_C14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- HEX0[1]	=>  Location: PIN_E15,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- HEX0[2]	=>  Location: PIN_C15,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- HEX0[3]	=>  Location: PIN_C16,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- HEX0[4]	=>  Location: PIN_E16,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- HEX0[5]	=>  Location: PIN_D17,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- HEX0[6]	=>  Location: PIN_C17,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- HEX1[0]	=>  Location: PIN_C18,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- HEX1[1]	=>  Location: PIN_D18,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- HEX1[2]	=>  Location: PIN_E18,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- HEX1[3]	=>  Location: PIN_B16,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- HEX1[4]	=>  Location: PIN_A17,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- HEX1[5]	=>  Location: PIN_A18,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- HEX1[6]	=>  Location: PIN_B17,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- HEX2[0]	=>  Location: PIN_B20,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- HEX2[1]	=>  Location: PIN_A20,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- HEX2[2]	=>  Location: PIN_B19,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- HEX2[3]	=>  Location: PIN_A21,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- HEX2[4]	=>  Location: PIN_B21,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- HEX2[5]	=>  Location: PIN_C22,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- HEX2[6]	=>  Location: PIN_B22,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- HEX3[0]	=>  Location: PIN_F21,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- HEX3[1]	=>  Location: PIN_E22,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- HEX3[2]	=>  Location: PIN_E21,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- HEX3[3]	=>  Location: PIN_C19,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- HEX3[4]	=>  Location: PIN_C20,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- HEX3[5]	=>  Location: PIN_D19,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- HEX3[6]	=>  Location: PIN_E17,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- HEX4[0]	=>  Location: PIN_F18,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- HEX4[1]	=>  Location: PIN_E20,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- HEX4[2]	=>  Location: PIN_E19,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- HEX4[3]	=>  Location: PIN_J18,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- HEX4[4]	=>  Location: PIN_H19,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- HEX4[5]	=>  Location: PIN_F19,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- HEX4[6]	=>  Location: PIN_F20,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- HEX5[0]	=>  Location: PIN_J20,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- HEX5[1]	=>  Location: PIN_K20,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- HEX5[2]	=>  Location: PIN_L18,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- HEX5[3]	=>  Location: PIN_N18,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- HEX5[4]	=>  Location: PIN_M20,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- HEX5[5]	=>  Location: PIN_N19,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- HEX5[6]	=>  Location: PIN_N20,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- LEDR[0]	=>  Location: PIN_A8,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- LEDR[1]	=>  Location: PIN_A9,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- LEDR[2]	=>  Location: PIN_A10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- LEDR[3]	=>  Location: PIN_B10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- LEDR[4]	=>  Location: PIN_D13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- LEDR[5]	=>  Location: PIN_C13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- LEDR[6]	=>  Location: PIN_E14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- LEDR[7]	=>  Location: PIN_D14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- LEDR[8]	=>  Location: PIN_A11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- LEDR[9]	=>  Location: PIN_B11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- SW[0]	=>  Location: PIN_C10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- SW[1]	=>  Location: PIN_C11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- SW[2]	=>  Location: PIN_D12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- SW[3]	=>  Location: PIN_C12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- SW[4]	=>  Location: PIN_A12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- SW[5]	=>  Location: PIN_B12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- SW[6]	=>  Location: PIN_A13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- SW[7]	=>  Location: PIN_A14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- MAX10_CLK1_50	=>  Location: PIN_P11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- KEY[1]	=>  Location: PIN_A7,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- KEY[0]	=>  Location: PIN_B8,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default


ARCHITECTURE structure OF Prime_Finder_16bit_Top_Group55 IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_MAX10_CLK1_50 : std_logic;
SIGNAL ww_SW : std_logic_vector(9 DOWNTO 0);
SIGNAL ww_KEY : std_logic_vector(1 DOWNTO 0);
SIGNAL ww_HEX0 : std_logic_vector(6 DOWNTO 0);
SIGNAL ww_HEX1 : std_logic_vector(6 DOWNTO 0);
SIGNAL ww_HEX2 : std_logic_vector(6 DOWNTO 0);
SIGNAL ww_HEX3 : std_logic_vector(6 DOWNTO 0);
SIGNAL ww_HEX4 : std_logic_vector(6 DOWNTO 0);
SIGNAL ww_HEX5 : std_logic_vector(6 DOWNTO 0);
SIGNAL ww_LEDR : std_logic_vector(9 DOWNTO 0);
SIGNAL \~QUARTUS_CREATED_ADC1~_CHSEL_bus\ : std_logic_vector(4 DOWNTO 0);
SIGNAL \~QUARTUS_CREATED_ADC2~_CHSEL_bus\ : std_logic_vector(4 DOWNTO 0);
SIGNAL \MAX10_CLK1_50~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \SW[8]~input_o\ : std_logic;
SIGNAL \SW[9]~input_o\ : std_logic;
SIGNAL \~QUARTUS_CREATED_GND~I_combout\ : std_logic;
SIGNAL \~QUARTUS_CREATED_UNVM~~busy\ : std_logic;
SIGNAL \~QUARTUS_CREATED_ADC1~~eoc\ : std_logic;
SIGNAL \~QUARTUS_CREATED_ADC2~~eoc\ : std_logic;
SIGNAL \HEX0[0]~output_o\ : std_logic;
SIGNAL \HEX0[1]~output_o\ : std_logic;
SIGNAL \HEX0[2]~output_o\ : std_logic;
SIGNAL \HEX0[3]~output_o\ : std_logic;
SIGNAL \HEX0[4]~output_o\ : std_logic;
SIGNAL \HEX0[5]~output_o\ : std_logic;
SIGNAL \HEX0[6]~output_o\ : std_logic;
SIGNAL \HEX1[0]~output_o\ : std_logic;
SIGNAL \HEX1[1]~output_o\ : std_logic;
SIGNAL \HEX1[2]~output_o\ : std_logic;
SIGNAL \HEX1[3]~output_o\ : std_logic;
SIGNAL \HEX1[4]~output_o\ : std_logic;
SIGNAL \HEX1[5]~output_o\ : std_logic;
SIGNAL \HEX1[6]~output_o\ : std_logic;
SIGNAL \HEX2[0]~output_o\ : std_logic;
SIGNAL \HEX2[1]~output_o\ : std_logic;
SIGNAL \HEX2[2]~output_o\ : std_logic;
SIGNAL \HEX2[3]~output_o\ : std_logic;
SIGNAL \HEX2[4]~output_o\ : std_logic;
SIGNAL \HEX2[5]~output_o\ : std_logic;
SIGNAL \HEX2[6]~output_o\ : std_logic;
SIGNAL \HEX3[0]~output_o\ : std_logic;
SIGNAL \HEX3[1]~output_o\ : std_logic;
SIGNAL \HEX3[2]~output_o\ : std_logic;
SIGNAL \HEX3[3]~output_o\ : std_logic;
SIGNAL \HEX3[4]~output_o\ : std_logic;
SIGNAL \HEX3[5]~output_o\ : std_logic;
SIGNAL \HEX3[6]~output_o\ : std_logic;
SIGNAL \HEX4[0]~output_o\ : std_logic;
SIGNAL \HEX4[1]~output_o\ : std_logic;
SIGNAL \HEX4[2]~output_o\ : std_logic;
SIGNAL \HEX4[3]~output_o\ : std_logic;
SIGNAL \HEX4[4]~output_o\ : std_logic;
SIGNAL \HEX4[5]~output_o\ : std_logic;
SIGNAL \HEX4[6]~output_o\ : std_logic;
SIGNAL \HEX5[0]~output_o\ : std_logic;
SIGNAL \HEX5[1]~output_o\ : std_logic;
SIGNAL \HEX5[2]~output_o\ : std_logic;
SIGNAL \HEX5[3]~output_o\ : std_logic;
SIGNAL \HEX5[4]~output_o\ : std_logic;
SIGNAL \HEX5[5]~output_o\ : std_logic;
SIGNAL \HEX5[6]~output_o\ : std_logic;
SIGNAL \LEDR[0]~output_o\ : std_logic;
SIGNAL \LEDR[1]~output_o\ : std_logic;
SIGNAL \LEDR[2]~output_o\ : std_logic;
SIGNAL \LEDR[3]~output_o\ : std_logic;
SIGNAL \LEDR[4]~output_o\ : std_logic;
SIGNAL \LEDR[5]~output_o\ : std_logic;
SIGNAL \LEDR[6]~output_o\ : std_logic;
SIGNAL \LEDR[7]~output_o\ : std_logic;
SIGNAL \LEDR[8]~output_o\ : std_logic;
SIGNAL \LEDR[9]~output_o\ : std_logic;
SIGNAL \MAX10_CLK1_50~input_o\ : std_logic;
SIGNAL \MAX10_CLK1_50~inputclkctrl_outclk\ : std_logic;
SIGNAL \SW[1]~input_o\ : std_logic;
SIGNAL \data_full[1]~feeder_combout\ : std_logic;
SIGNAL \KEY[1]~input_o\ : std_logic;
SIGNAL \key1_sync1~0_combout\ : std_logic;
SIGNAL \key1_sync1~q\ : std_logic;
SIGNAL \key1_sync2~feeder_combout\ : std_logic;
SIGNAL \key1_sync2~q\ : std_logic;
SIGNAL \debounce_cnt1[0]~16_combout\ : std_logic;
SIGNAL \debounce_cnt1[13]~26_combout\ : std_logic;
SIGNAL \debounce_cnt1[0]~17\ : std_logic;
SIGNAL \debounce_cnt1[1]~18_combout\ : std_logic;
SIGNAL \debounce_cnt1[1]~19\ : std_logic;
SIGNAL \debounce_cnt1[2]~20_combout\ : std_logic;
SIGNAL \debounce_cnt1[2]~21\ : std_logic;
SIGNAL \debounce_cnt1[3]~22_combout\ : std_logic;
SIGNAL \debounce_cnt1[3]~23\ : std_logic;
SIGNAL \debounce_cnt1[4]~24_combout\ : std_logic;
SIGNAL \debounce_cnt1[4]~25\ : std_logic;
SIGNAL \debounce_cnt1[5]~27_combout\ : std_logic;
SIGNAL \debounce_cnt1[5]~28\ : std_logic;
SIGNAL \debounce_cnt1[6]~29_combout\ : std_logic;
SIGNAL \debounce_cnt1[6]~30\ : std_logic;
SIGNAL \debounce_cnt1[7]~31_combout\ : std_logic;
SIGNAL \debounce_cnt1[7]~32\ : std_logic;
SIGNAL \debounce_cnt1[8]~33_combout\ : std_logic;
SIGNAL \debounce_cnt1[8]~34\ : std_logic;
SIGNAL \debounce_cnt1[9]~35_combout\ : std_logic;
SIGNAL \debounce_cnt1[9]~36\ : std_logic;
SIGNAL \debounce_cnt1[10]~37_combout\ : std_logic;
SIGNAL \debounce_cnt1[10]~38\ : std_logic;
SIGNAL \debounce_cnt1[11]~39_combout\ : std_logic;
SIGNAL \debounce_cnt1[11]~40\ : std_logic;
SIGNAL \debounce_cnt1[12]~41_combout\ : std_logic;
SIGNAL \debounce_cnt1[12]~42\ : std_logic;
SIGNAL \debounce_cnt1[13]~43_combout\ : std_logic;
SIGNAL \LessThan1~2_combout\ : std_logic;
SIGNAL \LessThan1~0_combout\ : std_logic;
SIGNAL \LessThan1~1_combout\ : std_logic;
SIGNAL \debounce_cnt1[13]~44\ : std_logic;
SIGNAL \debounce_cnt1[14]~45_combout\ : std_logic;
SIGNAL \debounce_cnt1[14]~46\ : std_logic;
SIGNAL \debounce_cnt1[15]~47_combout\ : std_logic;
SIGNAL \LessThan1~3_combout\ : std_logic;
SIGNAL \key1_stable~0_combout\ : std_logic;
SIGNAL \key1_stable~q\ : std_logic;
SIGNAL \key1_prev~q\ : std_logic;
SIGNAL \KEY_DEBOUNCE~0_combout\ : std_logic;
SIGNAL \key1_pressed~q\ : std_logic;
SIGNAL \KEY[0]~input_o\ : std_logic;
SIGNAL \key0_sync1~0_combout\ : std_logic;
SIGNAL \key0_sync1~q\ : std_logic;
SIGNAL \key0_sync2~q\ : std_logic;
SIGNAL \debounce_cnt0[0]~16_combout\ : std_logic;
SIGNAL \debounce_cnt0[4]~26_combout\ : std_logic;
SIGNAL \debounce_cnt0[0]~17\ : std_logic;
SIGNAL \debounce_cnt0[1]~18_combout\ : std_logic;
SIGNAL \debounce_cnt0[1]~19\ : std_logic;
SIGNAL \debounce_cnt0[2]~20_combout\ : std_logic;
SIGNAL \debounce_cnt0[2]~21\ : std_logic;
SIGNAL \debounce_cnt0[3]~22_combout\ : std_logic;
SIGNAL \debounce_cnt0[3]~23\ : std_logic;
SIGNAL \debounce_cnt0[4]~24_combout\ : std_logic;
SIGNAL \debounce_cnt0[4]~25\ : std_logic;
SIGNAL \debounce_cnt0[5]~27_combout\ : std_logic;
SIGNAL \debounce_cnt0[5]~28\ : std_logic;
SIGNAL \debounce_cnt0[6]~29_combout\ : std_logic;
SIGNAL \debounce_cnt0[6]~30\ : std_logic;
SIGNAL \debounce_cnt0[7]~31_combout\ : std_logic;
SIGNAL \debounce_cnt0[7]~32\ : std_logic;
SIGNAL \debounce_cnt0[8]~33_combout\ : std_logic;
SIGNAL \debounce_cnt0[8]~34\ : std_logic;
SIGNAL \debounce_cnt0[9]~35_combout\ : std_logic;
SIGNAL \debounce_cnt0[9]~36\ : std_logic;
SIGNAL \debounce_cnt0[10]~37_combout\ : std_logic;
SIGNAL \debounce_cnt0[10]~38\ : std_logic;
SIGNAL \debounce_cnt0[11]~39_combout\ : std_logic;
SIGNAL \debounce_cnt0[11]~40\ : std_logic;
SIGNAL \debounce_cnt0[12]~41_combout\ : std_logic;
SIGNAL \debounce_cnt0[12]~42\ : std_logic;
SIGNAL \debounce_cnt0[13]~43_combout\ : std_logic;
SIGNAL \debounce_cnt0[13]~44\ : std_logic;
SIGNAL \debounce_cnt0[14]~45_combout\ : std_logic;
SIGNAL \debounce_cnt0[14]~46\ : std_logic;
SIGNAL \debounce_cnt0[15]~47_combout\ : std_logic;
SIGNAL \LessThan0~2_combout\ : std_logic;
SIGNAL \LessThan0~0_combout\ : std_logic;
SIGNAL \LessThan0~1_combout\ : std_logic;
SIGNAL \LessThan0~3_combout\ : std_logic;
SIGNAL \key0_stable~0_combout\ : std_logic;
SIGNAL \key0_stable~q\ : std_logic;
SIGNAL \key0_prev~feeder_combout\ : std_logic;
SIGNAL \key0_prev~q\ : std_logic;
SIGNAL \KEY_DEBOUNCE~1_combout\ : std_logic;
SIGNAL \key0_pressed~q\ : std_logic;
SIGNAL \Selector2~0_combout\ : std_logic;
SIGNAL \start_check~feeder_combout\ : std_logic;
SIGNAL \start_check~q\ : std_logic;
SIGNAL \SW[0]~input_o\ : std_logic;
SIGNAL \n_reg[0]~0_combout\ : std_logic;
SIGNAL \Add3~29\ : std_logic;
SIGNAL \Add3~31_combout\ : std_logic;
SIGNAL \Add3~33_combout\ : std_logic;
SIGNAL \current_divisor[15]~9_combout\ : std_logic;
SIGNAL \Equal1~5_combout\ : std_logic;
SIGNAL \check_counter[0]~10_combout\ : std_logic;
SIGNAL \check_counter[1]~22_combout\ : std_logic;
SIGNAL \check_counter[1]~23_combout\ : std_logic;
SIGNAL \check_counter[0]~11\ : std_logic;
SIGNAL \check_counter[1]~12_combout\ : std_logic;
SIGNAL \check_counter[1]~13\ : std_logic;
SIGNAL \check_counter[2]~14_combout\ : std_logic;
SIGNAL \check_counter[2]~15\ : std_logic;
SIGNAL \check_counter[3]~16_combout\ : std_logic;
SIGNAL \check_counter[3]~17\ : std_logic;
SIGNAL \check_counter[4]~18_combout\ : std_logic;
SIGNAL \check_counter[4]~19\ : std_logic;
SIGNAL \check_counter[5]~20_combout\ : std_logic;
SIGNAL \check_counter[5]~21\ : std_logic;
SIGNAL \check_counter[6]~24_combout\ : std_logic;
SIGNAL \check_counter[6]~25\ : std_logic;
SIGNAL \check_counter[7]~26_combout\ : std_logic;
SIGNAL \check_counter[7]~27\ : std_logic;
SIGNAL \check_counter[8]~28_combout\ : std_logic;
SIGNAL \check_counter[8]~29\ : std_logic;
SIGNAL \check_counter[9]~30_combout\ : std_logic;
SIGNAL \current_divisor[5]~5_combout\ : std_logic;
SIGNAL \current_divisor[5]~3_combout\ : std_logic;
SIGNAL \current_divisor[5]~4_combout\ : std_logic;
SIGNAL \current_divisor[5]~6_combout\ : std_logic;
SIGNAL \SW[4]~input_o\ : std_logic;
SIGNAL \data_full[4]~feeder_combout\ : std_logic;
SIGNAL \SW[7]~input_o\ : std_logic;
SIGNAL \n_reg[7]~feeder_combout\ : std_logic;
SIGNAL \SW[5]~input_o\ : std_logic;
SIGNAL \n_reg[5]~feeder_combout\ : std_logic;
SIGNAL \SW[6]~input_o\ : std_logic;
SIGNAL \n_reg[6]~feeder_combout\ : std_logic;
SIGNAL \Equal0~0_combout\ : std_logic;
SIGNAL \SW[2]~input_o\ : std_logic;
SIGNAL \SW[3]~input_o\ : std_logic;
SIGNAL \Equal0~3_combout\ : std_logic;
SIGNAL \Selector1~3_combout\ : std_logic;
SIGNAL \n_reg[8]~feeder_combout\ : std_logic;
SIGNAL \data_high[2]~feeder_combout\ : std_logic;
SIGNAL \n_reg[10]~feeder_combout\ : std_logic;
SIGNAL \n_reg[11]~feeder_combout\ : std_logic;
SIGNAL \Equal0~1_combout\ : std_logic;
SIGNAL \n_reg[15]~feeder_combout\ : std_logic;
SIGNAL \n_reg[12]~feeder_combout\ : std_logic;
SIGNAL \n_reg[14]~feeder_combout\ : std_logic;
SIGNAL \Equal0~2_combout\ : std_logic;
SIGNAL \Equal0~4_combout\ : std_logic;
SIGNAL \current_divisor[15]~7_combout\ : std_logic;
SIGNAL \current_divisor[15]~8_combout\ : std_logic;
SIGNAL \current_divisor[15]~10_combout\ : std_logic;
SIGNAL \Add3~32\ : std_logic;
SIGNAL \Add3~34_combout\ : std_logic;
SIGNAL \Add3~36_combout\ : std_logic;
SIGNAL \Add3~35\ : std_logic;
SIGNAL \Add3~37_combout\ : std_logic;
SIGNAL \Add3~39_combout\ : std_logic;
SIGNAL \Add3~38\ : std_logic;
SIGNAL \Add3~40_combout\ : std_logic;
SIGNAL \Add3~42_combout\ : std_logic;
SIGNAL \LessThan3~1_cout\ : std_logic;
SIGNAL \LessThan3~3_cout\ : std_logic;
SIGNAL \LessThan3~5_cout\ : std_logic;
SIGNAL \LessThan3~7_cout\ : std_logic;
SIGNAL \LessThan3~9_cout\ : std_logic;
SIGNAL \LessThan3~11_cout\ : std_logic;
SIGNAL \LessThan3~13_cout\ : std_logic;
SIGNAL \LessThan3~15_cout\ : std_logic;
SIGNAL \LessThan3~17_cout\ : std_logic;
SIGNAL \LessThan3~19_cout\ : std_logic;
SIGNAL \LessThan3~21_cout\ : std_logic;
SIGNAL \LessThan3~23_cout\ : std_logic;
SIGNAL \LessThan3~25_cout\ : std_logic;
SIGNAL \LessThan3~27_cout\ : std_logic;
SIGNAL \LessThan3~29_cout\ : std_logic;
SIGNAL \LessThan3~30_combout\ : std_logic;
SIGNAL \current_divisor~2_combout\ : std_logic;
SIGNAL \current_divisor~14_combout\ : std_logic;
SIGNAL \current_divisor~13_combout\ : std_logic;
SIGNAL \Add3~0_combout\ : std_logic;
SIGNAL \current_divisor~12_combout\ : std_logic;
SIGNAL \Add3~1\ : std_logic;
SIGNAL \Add3~2_combout\ : std_logic;
SIGNAL \current_divisor~11_combout\ : std_logic;
SIGNAL \Add3~3\ : std_logic;
SIGNAL \Add3~4_combout\ : std_logic;
SIGNAL \Add3~24_combout\ : std_logic;
SIGNAL \Add3~5\ : std_logic;
SIGNAL \Add3~6_combout\ : std_logic;
SIGNAL \Add3~23_combout\ : std_logic;
SIGNAL \Add3~7\ : std_logic;
SIGNAL \Add3~8_combout\ : std_logic;
SIGNAL \Add3~22_combout\ : std_logic;
SIGNAL \Add3~9\ : std_logic;
SIGNAL \Add3~10_combout\ : std_logic;
SIGNAL \Add3~21_combout\ : std_logic;
SIGNAL \Add3~11\ : std_logic;
SIGNAL \Add3~12_combout\ : std_logic;
SIGNAL \Add3~20_combout\ : std_logic;
SIGNAL \Add3~13\ : std_logic;
SIGNAL \Add3~14_combout\ : std_logic;
SIGNAL \Add3~19_combout\ : std_logic;
SIGNAL \Add3~15\ : std_logic;
SIGNAL \Add3~16_combout\ : std_logic;
SIGNAL \Add3~18_combout\ : std_logic;
SIGNAL \Add3~17\ : std_logic;
SIGNAL \Add3~25_combout\ : std_logic;
SIGNAL \Add3~27_combout\ : std_logic;
SIGNAL \Add3~26\ : std_logic;
SIGNAL \Add3~28_combout\ : std_logic;
SIGNAL \Add3~30_combout\ : std_logic;
SIGNAL \Equal1~2_combout\ : std_logic;
SIGNAL \Equal1~1_combout\ : std_logic;
SIGNAL \Equal1~0_combout\ : std_logic;
SIGNAL \Equal1~3_combout\ : std_logic;
SIGNAL \Equal1~4_combout\ : std_logic;
SIGNAL \check_done~0_combout\ : std_logic;
SIGNAL \is_prime~2_combout\ : std_logic;
SIGNAL \Equal0~5_combout\ : std_logic;
SIGNAL \is_prime~3_combout\ : std_logic;
SIGNAL \check_done~1_combout\ : std_logic;
SIGNAL \check_done~2_combout\ : std_logic;
SIGNAL \check_done~3_combout\ : std_logic;
SIGNAL \check_done~q\ : std_logic;
SIGNAL \Selector2~1_combout\ : std_logic;
SIGNAL \state.COMPUTING~q\ : std_logic;
SIGNAL \Selector3~2_combout\ : std_logic;
SIGNAL \state.SHOW_RESULT~q\ : std_logic;
SIGNAL \state.WAIT_HIGH~0_combout\ : std_logic;
SIGNAL \state.WAIT_HIGH~q\ : std_logic;
SIGNAL \Selector1~1_combout\ : std_logic;
SIGNAL \Selector1~2_combout\ : std_logic;
SIGNAL \state.WAIT_LOW~q\ : std_logic;
SIGNAL \Selector3~1_combout\ : std_logic;
SIGNAL \Mux55~0_combout\ : std_logic;
SIGNAL \Selector25~0_combout\ : std_logic;
SIGNAL \Mux13~0_combout\ : std_logic;
SIGNAL \Selector25~1_combout\ : std_logic;
SIGNAL \Mux12~0_combout\ : std_logic;
SIGNAL \Mux54~0_combout\ : std_logic;
SIGNAL \Selector24~0_combout\ : std_logic;
SIGNAL \Mux53~0_combout\ : std_logic;
SIGNAL \Mux11~0_combout\ : std_logic;
SIGNAL \Selector23~0_combout\ : std_logic;
SIGNAL \Mux10~0_combout\ : std_logic;
SIGNAL \Mux52~0_combout\ : std_logic;
SIGNAL \Selector22~0_combout\ : std_logic;
SIGNAL \Mux9~0_combout\ : std_logic;
SIGNAL \Mux51~0_combout\ : std_logic;
SIGNAL \Selector21~0_combout\ : std_logic;
SIGNAL \Mux8~0_combout\ : std_logic;
SIGNAL \Mux50~0_combout\ : std_logic;
SIGNAL \Selector20~0_combout\ : std_logic;
SIGNAL \Mux7~0_combout\ : std_logic;
SIGNAL \Mux49~0_combout\ : std_logic;
SIGNAL \Selector19~0_combout\ : std_logic;
SIGNAL \Mux48~0_combout\ : std_logic;
SIGNAL \Mux6~0_combout\ : std_logic;
SIGNAL \Mux27~0_combout\ : std_logic;
SIGNAL \Selector18~0_combout\ : std_logic;
SIGNAL \Selector18~1_combout\ : std_logic;
SIGNAL \Mux47~0_combout\ : std_logic;
SIGNAL \Mux5~0_combout\ : std_logic;
SIGNAL \Mux26~0_combout\ : std_logic;
SIGNAL \Selector17~0_combout\ : std_logic;
SIGNAL \Selector17~1_combout\ : std_logic;
SIGNAL \Mux46~0_combout\ : std_logic;
SIGNAL \Mux25~0_combout\ : std_logic;
SIGNAL \Mux4~0_combout\ : std_logic;
SIGNAL \Selector16~0_combout\ : std_logic;
SIGNAL \Selector16~1_combout\ : std_logic;
SIGNAL \Mux45~0_combout\ : std_logic;
SIGNAL \Mux24~0_combout\ : std_logic;
SIGNAL \Mux3~0_combout\ : std_logic;
SIGNAL \Selector15~0_combout\ : std_logic;
SIGNAL \Selector15~1_combout\ : std_logic;
SIGNAL \Mux44~0_combout\ : std_logic;
SIGNAL \Mux23~0_combout\ : std_logic;
SIGNAL \Mux2~0_combout\ : std_logic;
SIGNAL \Selector14~0_combout\ : std_logic;
SIGNAL \Selector14~1_combout\ : std_logic;
SIGNAL \Mux43~0_combout\ : std_logic;
SIGNAL \Mux22~0_combout\ : std_logic;
SIGNAL \Mux1~0_combout\ : std_logic;
SIGNAL \Selector13~0_combout\ : std_logic;
SIGNAL \Selector13~1_combout\ : std_logic;
SIGNAL \Mux42~0_combout\ : std_logic;
SIGNAL \Mux0~0_combout\ : std_logic;
SIGNAL \Mux21~0_combout\ : std_logic;
SIGNAL \Selector12~0_combout\ : std_logic;
SIGNAL \Selector12~1_combout\ : std_logic;
SIGNAL \Mux20~0_combout\ : std_logic;
SIGNAL \Mux41~0_combout\ : std_logic;
SIGNAL \Selector11~0_combout\ : std_logic;
SIGNAL \Mux40~0_combout\ : std_logic;
SIGNAL \Mux19~0_combout\ : std_logic;
SIGNAL \Selector10~0_combout\ : std_logic;
SIGNAL \Mux39~0_combout\ : std_logic;
SIGNAL \Mux18~0_combout\ : std_logic;
SIGNAL \Selector9~0_combout\ : std_logic;
SIGNAL \Mux38~0_combout\ : std_logic;
SIGNAL \Mux17~0_combout\ : std_logic;
SIGNAL \Selector8~0_combout\ : std_logic;
SIGNAL \Mux37~0_combout\ : std_logic;
SIGNAL \Mux16~0_combout\ : std_logic;
SIGNAL \Selector7~0_combout\ : std_logic;
SIGNAL \Mux15~0_combout\ : std_logic;
SIGNAL \Mux36~0_combout\ : std_logic;
SIGNAL \Selector6~0_combout\ : std_logic;
SIGNAL \Mux14~0_combout\ : std_logic;
SIGNAL \Mux35~0_combout\ : std_logic;
SIGNAL \Selector5~0_combout\ : std_logic;
SIGNAL \Selector5~1_combout\ : std_logic;
SIGNAL \Mux34~0_combout\ : std_logic;
SIGNAL \HEX3~0_combout\ : std_logic;
SIGNAL \Mux33~0_combout\ : std_logic;
SIGNAL \HEX3~1_combout\ : std_logic;
SIGNAL \Mux32~0_combout\ : std_logic;
SIGNAL \HEX3~2_combout\ : std_logic;
SIGNAL \Mux31~0_combout\ : std_logic;
SIGNAL \HEX3~3_combout\ : std_logic;
SIGNAL \Mux30~0_combout\ : std_logic;
SIGNAL \HEX3~4_combout\ : std_logic;
SIGNAL \Mux29~0_combout\ : std_logic;
SIGNAL \HEX3~5_combout\ : std_logic;
SIGNAL \Mux28~0_combout\ : std_logic;
SIGNAL \Selector4~0_combout\ : std_logic;
SIGNAL \HEX3~6_combout\ : std_logic;
SIGNAL \HEX2~0_combout\ : std_logic;
SIGNAL \is_prime~5_combout\ : std_logic;
SIGNAL \is_prime~0_combout\ : std_logic;
SIGNAL \is_prime~1_combout\ : std_logic;
SIGNAL \is_prime~4_combout\ : std_logic;
SIGNAL \is_prime~6_combout\ : std_logic;
SIGNAL \is_prime~q\ : std_logic;
SIGNAL \LEDR~0_combout\ : std_logic;
SIGNAL check_counter : std_logic_vector(9 DOWNTO 0);
SIGNAL debounce_cnt1 : std_logic_vector(15 DOWNTO 0);
SIGNAL debounce_cnt0 : std_logic_vector(15 DOWNTO 0);
SIGNAL data_full : std_logic_vector(15 DOWNTO 0);
SIGNAL data_high : std_logic_vector(7 DOWNTO 0);
SIGNAL n_reg : std_logic_vector(15 DOWNTO 0);
SIGNAL current_divisor : std_logic_vector(15 DOWNTO 0);
SIGNAL \ALT_INV_HEX2~0_combout\ : std_logic;
SIGNAL \ALT_INV_HEX3~6_combout\ : std_logic;
SIGNAL \ALT_INV_state.WAIT_HIGH~q\ : std_logic;
SIGNAL \ALT_INV_state.COMPUTING~q\ : std_logic;
SIGNAL \ALT_INV_state.WAIT_LOW~q\ : std_logic;

COMPONENT hard_block
    PORT (
	devoe : IN std_logic;
	devclrn : IN std_logic;
	devpor : IN std_logic);
END COMPONENT;

BEGIN

ww_MAX10_CLK1_50 <= MAX10_CLK1_50;
ww_SW <= SW;
ww_KEY <= KEY;
HEX0 <= ww_HEX0;
HEX1 <= ww_HEX1;
HEX2 <= ww_HEX2;
HEX3 <= ww_HEX3;
HEX4 <= ww_HEX4;
HEX5 <= ww_HEX5;
LEDR <= ww_LEDR;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\~QUARTUS_CREATED_ADC1~_CHSEL_bus\ <= (\~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\);

\~QUARTUS_CREATED_ADC2~_CHSEL_bus\ <= (\~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\);

\MAX10_CLK1_50~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \MAX10_CLK1_50~input_o\);
\ALT_INV_HEX2~0_combout\ <= NOT \HEX2~0_combout\;
\ALT_INV_HEX3~6_combout\ <= NOT \HEX3~6_combout\;
\ALT_INV_state.WAIT_HIGH~q\ <= NOT \state.WAIT_HIGH~q\;
\ALT_INV_state.COMPUTING~q\ <= NOT \state.COMPUTING~q\;
\ALT_INV_state.WAIT_LOW~q\ <= NOT \state.WAIT_LOW~q\;
auto_generated_inst : hard_block
PORT MAP (
	devoe => ww_devoe,
	devclrn => ww_devclrn,
	devpor => ww_devpor);

-- Location: LCCOMB_X44_Y42_N12
\~QUARTUS_CREATED_GND~I\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \~QUARTUS_CREATED_GND~I_combout\ = GND

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	combout => \~QUARTUS_CREATED_GND~I_combout\);

-- Location: IOOBUF_X58_Y54_N16
\HEX0[0]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Selector25~1_combout\,
	devoe => ww_devoe,
	o => \HEX0[0]~output_o\);

-- Location: IOOBUF_X74_Y54_N9
\HEX0[1]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Selector24~0_combout\,
	devoe => ww_devoe,
	o => \HEX0[1]~output_o\);

-- Location: IOOBUF_X60_Y54_N2
\HEX0[2]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Selector23~0_combout\,
	devoe => ww_devoe,
	o => \HEX0[2]~output_o\);

-- Location: IOOBUF_X62_Y54_N30
\HEX0[3]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Selector22~0_combout\,
	devoe => ww_devoe,
	o => \HEX0[3]~output_o\);

-- Location: IOOBUF_X74_Y54_N2
\HEX0[4]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Selector21~0_combout\,
	devoe => ww_devoe,
	o => \HEX0[4]~output_o\);

-- Location: IOOBUF_X74_Y54_N16
\HEX0[5]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Selector20~0_combout\,
	devoe => ww_devoe,
	o => \HEX0[5]~output_o\);

-- Location: IOOBUF_X74_Y54_N23
\HEX0[6]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Selector19~0_combout\,
	devoe => ww_devoe,
	o => \HEX0[6]~output_o\);

-- Location: IOOBUF_X69_Y54_N23
\HEX1[0]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Selector18~1_combout\,
	devoe => ww_devoe,
	o => \HEX1[0]~output_o\);

-- Location: IOOBUF_X78_Y49_N9
\HEX1[1]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Selector17~1_combout\,
	devoe => ww_devoe,
	o => \HEX1[1]~output_o\);

-- Location: IOOBUF_X78_Y49_N2
\HEX1[2]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Selector16~1_combout\,
	devoe => ww_devoe,
	o => \HEX1[2]~output_o\);

-- Location: IOOBUF_X60_Y54_N9
\HEX1[3]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Selector15~1_combout\,
	devoe => ww_devoe,
	o => \HEX1[3]~output_o\);

-- Location: IOOBUF_X64_Y54_N2
\HEX1[4]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Selector14~1_combout\,
	devoe => ww_devoe,
	o => \HEX1[4]~output_o\);

-- Location: IOOBUF_X66_Y54_N30
\HEX1[5]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Selector13~1_combout\,
	devoe => ww_devoe,
	o => \HEX1[5]~output_o\);

-- Location: IOOBUF_X69_Y54_N30
\HEX1[6]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Selector12~1_combout\,
	devoe => ww_devoe,
	o => \HEX1[6]~output_o\);

-- Location: IOOBUF_X78_Y44_N9
\HEX2[0]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Selector11~0_combout\,
	devoe => ww_devoe,
	o => \HEX2[0]~output_o\);

-- Location: IOOBUF_X66_Y54_N2
\HEX2[1]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Selector10~0_combout\,
	devoe => ww_devoe,
	o => \HEX2[1]~output_o\);

-- Location: IOOBUF_X69_Y54_N16
\HEX2[2]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Selector9~0_combout\,
	devoe => ww_devoe,
	o => \HEX2[2]~output_o\);

-- Location: IOOBUF_X78_Y44_N2
\HEX2[3]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Selector8~0_combout\,
	devoe => ww_devoe,
	o => \HEX2[3]~output_o\);

-- Location: IOOBUF_X78_Y43_N2
\HEX2[4]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Selector7~0_combout\,
	devoe => ww_devoe,
	o => \HEX2[4]~output_o\);

-- Location: IOOBUF_X78_Y35_N2
\HEX2[5]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Selector6~0_combout\,
	devoe => ww_devoe,
	o => \HEX2[5]~output_o\);

-- Location: IOOBUF_X78_Y43_N9
\HEX2[6]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Selector5~1_combout\,
	devoe => ww_devoe,
	o => \HEX2[6]~output_o\);

-- Location: IOOBUF_X78_Y35_N23
\HEX3[0]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \HEX3~0_combout\,
	devoe => ww_devoe,
	o => \HEX3[0]~output_o\);

-- Location: IOOBUF_X78_Y33_N9
\HEX3[1]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \HEX3~1_combout\,
	devoe => ww_devoe,
	o => \HEX3[1]~output_o\);

-- Location: IOOBUF_X78_Y33_N2
\HEX3[2]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \HEX3~2_combout\,
	devoe => ww_devoe,
	o => \HEX3[2]~output_o\);

-- Location: IOOBUF_X69_Y54_N9
\HEX3[3]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \HEX3~3_combout\,
	devoe => ww_devoe,
	o => \HEX3[3]~output_o\);

-- Location: IOOBUF_X78_Y41_N9
\HEX3[4]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \HEX3~4_combout\,
	devoe => ww_devoe,
	o => \HEX3[4]~output_o\);

-- Location: IOOBUF_X78_Y41_N2
\HEX3[5]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \HEX3~5_combout\,
	devoe => ww_devoe,
	o => \HEX3[5]~output_o\);

-- Location: IOOBUF_X78_Y43_N16
\HEX3[6]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Selector4~0_combout\,
	devoe => ww_devoe,
	o => \HEX3[6]~output_o\);

-- Location: IOOBUF_X78_Y40_N16
\HEX4[0]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ALT_INV_state.WAIT_LOW~q\,
	devoe => ww_devoe,
	o => \HEX4[0]~output_o\);

-- Location: IOOBUF_X78_Y40_N2
\HEX4[1]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ALT_INV_HEX3~6_combout\,
	devoe => ww_devoe,
	o => \HEX4[1]~output_o\);

-- Location: IOOBUF_X78_Y40_N23
\HEX4[2]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ALT_INV_HEX3~6_combout\,
	devoe => ww_devoe,
	o => \HEX4[2]~output_o\);

-- Location: IOOBUF_X78_Y42_N16
\HEX4[3]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ALT_INV_state.WAIT_LOW~q\,
	devoe => ww_devoe,
	o => \HEX4[3]~output_o\);

-- Location: IOOBUF_X78_Y45_N23
\HEX4[4]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ALT_INV_state.WAIT_LOW~q\,
	devoe => ww_devoe,
	o => \HEX4[4]~output_o\);

-- Location: IOOBUF_X78_Y40_N9
\HEX4[5]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ALT_INV_state.WAIT_LOW~q\,
	devoe => ww_devoe,
	o => \HEX4[5]~output_o\);

-- Location: IOOBUF_X78_Y35_N16
\HEX4[6]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ALT_INV_state.COMPUTING~q\,
	devoe => ww_devoe,
	o => \HEX4[6]~output_o\);

-- Location: IOOBUF_X78_Y45_N9
\HEX5[0]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \HEX5[0]~output_o\);

-- Location: IOOBUF_X78_Y42_N2
\HEX5[1]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \state.WAIT_HIGH~q\,
	devoe => ww_devoe,
	o => \HEX5[1]~output_o\);

-- Location: IOOBUF_X78_Y37_N16
\HEX5[2]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \state.WAIT_HIGH~q\,
	devoe => ww_devoe,
	o => \HEX5[2]~output_o\);

-- Location: IOOBUF_X78_Y34_N24
\HEX5[3]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ALT_INV_state.WAIT_LOW~q\,
	devoe => ww_devoe,
	o => \HEX5[3]~output_o\);

-- Location: IOOBUF_X78_Y34_N9
\HEX5[4]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ALT_INV_HEX3~6_combout\,
	devoe => ww_devoe,
	o => \HEX5[4]~output_o\);

-- Location: IOOBUF_X78_Y34_N16
\HEX5[5]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ALT_INV_HEX3~6_combout\,
	devoe => ww_devoe,
	o => \HEX5[5]~output_o\);

-- Location: IOOBUF_X78_Y34_N2
\HEX5[6]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ALT_INV_HEX2~0_combout\,
	devoe => ww_devoe,
	o => \HEX5[6]~output_o\);

-- Location: IOOBUF_X46_Y54_N2
\LEDR[0]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \LEDR[0]~output_o\);

-- Location: IOOBUF_X46_Y54_N23
\LEDR[1]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \LEDR[1]~output_o\);

-- Location: IOOBUF_X51_Y54_N16
\LEDR[2]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \LEDR[2]~output_o\);

-- Location: IOOBUF_X46_Y54_N9
\LEDR[3]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \LEDR[3]~output_o\);

-- Location: IOOBUF_X56_Y54_N30
\LEDR[4]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \LEDR[4]~output_o\);

-- Location: IOOBUF_X58_Y54_N23
\LEDR[5]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \state.SHOW_RESULT~q\,
	devoe => ww_devoe,
	o => \LEDR[5]~output_o\);

-- Location: IOOBUF_X66_Y54_N23
\LEDR[6]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \state.COMPUTING~q\,
	devoe => ww_devoe,
	o => \LEDR[6]~output_o\);

-- Location: IOOBUF_X56_Y54_N9
\LEDR[7]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \state.WAIT_LOW~q\,
	devoe => ww_devoe,
	o => \LEDR[7]~output_o\);

-- Location: IOOBUF_X51_Y54_N9
\LEDR[8]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ALT_INV_state.WAIT_HIGH~q\,
	devoe => ww_devoe,
	o => \LEDR[8]~output_o\);

-- Location: IOOBUF_X49_Y54_N9
\LEDR[9]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \LEDR~0_combout\,
	devoe => ww_devoe,
	o => \LEDR[9]~output_o\);

-- Location: IOIBUF_X34_Y0_N29
\MAX10_CLK1_50~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_MAX10_CLK1_50,
	o => \MAX10_CLK1_50~input_o\);

-- Location: CLKCTRL_G19
\MAX10_CLK1_50~inputclkctrl\ : fiftyfivenm_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \MAX10_CLK1_50~inputclkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \MAX10_CLK1_50~inputclkctrl_outclk\);

-- Location: IOIBUF_X51_Y54_N22
\SW[1]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(1),
	o => \SW[1]~input_o\);

-- Location: LCCOMB_X62_Y50_N26
\data_full[1]~feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \data_full[1]~feeder_combout\ = \SW[1]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \SW[1]~input_o\,
	combout => \data_full[1]~feeder_combout\);

-- Location: IOIBUF_X49_Y54_N29
\KEY[1]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_KEY(1),
	o => \KEY[1]~input_o\);

-- Location: LCCOMB_X67_Y50_N24
\key1_sync1~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \key1_sync1~0_combout\ = !\KEY[1]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \KEY[1]~input_o\,
	combout => \key1_sync1~0_combout\);

-- Location: FF_X67_Y50_N25
key1_sync1 : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \MAX10_CLK1_50~inputclkctrl_outclk\,
	d => \key1_sync1~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \key1_sync1~q\);

-- Location: LCCOMB_X67_Y50_N14
\key1_sync2~feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \key1_sync2~feeder_combout\ = \key1_sync1~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \key1_sync1~q\,
	combout => \key1_sync2~feeder_combout\);

-- Location: FF_X67_Y50_N15
key1_sync2 : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \MAX10_CLK1_50~inputclkctrl_outclk\,
	d => \key1_sync2~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \key1_sync2~q\);

-- Location: LCCOMB_X70_Y50_N0
\debounce_cnt1[0]~16\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \debounce_cnt1[0]~16_combout\ = debounce_cnt1(0) $ (VCC)
-- \debounce_cnt1[0]~17\ = CARRY(debounce_cnt1(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => debounce_cnt1(0),
	datad => VCC,
	combout => \debounce_cnt1[0]~16_combout\,
	cout => \debounce_cnt1[0]~17\);

-- Location: LCCOMB_X69_Y50_N18
\debounce_cnt1[13]~26\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \debounce_cnt1[13]~26_combout\ = (\key1_stable~q\ $ (!\key1_sync2~q\)) # (!\LessThan1~3_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \key1_stable~q\,
	datac => \key1_sync2~q\,
	datad => \LessThan1~3_combout\,
	combout => \debounce_cnt1[13]~26_combout\);

-- Location: FF_X70_Y50_N1
\debounce_cnt1[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \MAX10_CLK1_50~inputclkctrl_outclk\,
	d => \debounce_cnt1[0]~16_combout\,
	sclr => \debounce_cnt1[13]~26_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => debounce_cnt1(0));

-- Location: LCCOMB_X70_Y50_N2
\debounce_cnt1[1]~18\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \debounce_cnt1[1]~18_combout\ = (debounce_cnt1(1) & (!\debounce_cnt1[0]~17\)) # (!debounce_cnt1(1) & ((\debounce_cnt1[0]~17\) # (GND)))
-- \debounce_cnt1[1]~19\ = CARRY((!\debounce_cnt1[0]~17\) # (!debounce_cnt1(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => debounce_cnt1(1),
	datad => VCC,
	cin => \debounce_cnt1[0]~17\,
	combout => \debounce_cnt1[1]~18_combout\,
	cout => \debounce_cnt1[1]~19\);

-- Location: FF_X70_Y50_N3
\debounce_cnt1[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \MAX10_CLK1_50~inputclkctrl_outclk\,
	d => \debounce_cnt1[1]~18_combout\,
	sclr => \debounce_cnt1[13]~26_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => debounce_cnt1(1));

-- Location: LCCOMB_X70_Y50_N4
\debounce_cnt1[2]~20\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \debounce_cnt1[2]~20_combout\ = (debounce_cnt1(2) & (\debounce_cnt1[1]~19\ $ (GND))) # (!debounce_cnt1(2) & (!\debounce_cnt1[1]~19\ & VCC))
-- \debounce_cnt1[2]~21\ = CARRY((debounce_cnt1(2) & !\debounce_cnt1[1]~19\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => debounce_cnt1(2),
	datad => VCC,
	cin => \debounce_cnt1[1]~19\,
	combout => \debounce_cnt1[2]~20_combout\,
	cout => \debounce_cnt1[2]~21\);

-- Location: FF_X70_Y50_N5
\debounce_cnt1[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \MAX10_CLK1_50~inputclkctrl_outclk\,
	d => \debounce_cnt1[2]~20_combout\,
	sclr => \debounce_cnt1[13]~26_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => debounce_cnt1(2));

-- Location: LCCOMB_X70_Y50_N6
\debounce_cnt1[3]~22\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \debounce_cnt1[3]~22_combout\ = (debounce_cnt1(3) & (!\debounce_cnt1[2]~21\)) # (!debounce_cnt1(3) & ((\debounce_cnt1[2]~21\) # (GND)))
-- \debounce_cnt1[3]~23\ = CARRY((!\debounce_cnt1[2]~21\) # (!debounce_cnt1(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => debounce_cnt1(3),
	datad => VCC,
	cin => \debounce_cnt1[2]~21\,
	combout => \debounce_cnt1[3]~22_combout\,
	cout => \debounce_cnt1[3]~23\);

-- Location: FF_X70_Y50_N7
\debounce_cnt1[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \MAX10_CLK1_50~inputclkctrl_outclk\,
	d => \debounce_cnt1[3]~22_combout\,
	sclr => \debounce_cnt1[13]~26_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => debounce_cnt1(3));

-- Location: LCCOMB_X70_Y50_N8
\debounce_cnt1[4]~24\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \debounce_cnt1[4]~24_combout\ = (debounce_cnt1(4) & (\debounce_cnt1[3]~23\ $ (GND))) # (!debounce_cnt1(4) & (!\debounce_cnt1[3]~23\ & VCC))
-- \debounce_cnt1[4]~25\ = CARRY((debounce_cnt1(4) & !\debounce_cnt1[3]~23\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => debounce_cnt1(4),
	datad => VCC,
	cin => \debounce_cnt1[3]~23\,
	combout => \debounce_cnt1[4]~24_combout\,
	cout => \debounce_cnt1[4]~25\);

-- Location: FF_X70_Y50_N9
\debounce_cnt1[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \MAX10_CLK1_50~inputclkctrl_outclk\,
	d => \debounce_cnt1[4]~24_combout\,
	sclr => \debounce_cnt1[13]~26_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => debounce_cnt1(4));

-- Location: LCCOMB_X70_Y50_N10
\debounce_cnt1[5]~27\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \debounce_cnt1[5]~27_combout\ = (debounce_cnt1(5) & (!\debounce_cnt1[4]~25\)) # (!debounce_cnt1(5) & ((\debounce_cnt1[4]~25\) # (GND)))
-- \debounce_cnt1[5]~28\ = CARRY((!\debounce_cnt1[4]~25\) # (!debounce_cnt1(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => debounce_cnt1(5),
	datad => VCC,
	cin => \debounce_cnt1[4]~25\,
	combout => \debounce_cnt1[5]~27_combout\,
	cout => \debounce_cnt1[5]~28\);

-- Location: FF_X70_Y50_N11
\debounce_cnt1[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \MAX10_CLK1_50~inputclkctrl_outclk\,
	d => \debounce_cnt1[5]~27_combout\,
	sclr => \debounce_cnt1[13]~26_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => debounce_cnt1(5));

-- Location: LCCOMB_X70_Y50_N12
\debounce_cnt1[6]~29\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \debounce_cnt1[6]~29_combout\ = (debounce_cnt1(6) & (\debounce_cnt1[5]~28\ $ (GND))) # (!debounce_cnt1(6) & (!\debounce_cnt1[5]~28\ & VCC))
-- \debounce_cnt1[6]~30\ = CARRY((debounce_cnt1(6) & !\debounce_cnt1[5]~28\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => debounce_cnt1(6),
	datad => VCC,
	cin => \debounce_cnt1[5]~28\,
	combout => \debounce_cnt1[6]~29_combout\,
	cout => \debounce_cnt1[6]~30\);

-- Location: FF_X70_Y50_N13
\debounce_cnt1[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \MAX10_CLK1_50~inputclkctrl_outclk\,
	d => \debounce_cnt1[6]~29_combout\,
	sclr => \debounce_cnt1[13]~26_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => debounce_cnt1(6));

-- Location: LCCOMB_X70_Y50_N14
\debounce_cnt1[7]~31\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \debounce_cnt1[7]~31_combout\ = (debounce_cnt1(7) & (!\debounce_cnt1[6]~30\)) # (!debounce_cnt1(7) & ((\debounce_cnt1[6]~30\) # (GND)))
-- \debounce_cnt1[7]~32\ = CARRY((!\debounce_cnt1[6]~30\) # (!debounce_cnt1(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => debounce_cnt1(7),
	datad => VCC,
	cin => \debounce_cnt1[6]~30\,
	combout => \debounce_cnt1[7]~31_combout\,
	cout => \debounce_cnt1[7]~32\);

-- Location: FF_X70_Y50_N15
\debounce_cnt1[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \MAX10_CLK1_50~inputclkctrl_outclk\,
	d => \debounce_cnt1[7]~31_combout\,
	sclr => \debounce_cnt1[13]~26_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => debounce_cnt1(7));

-- Location: LCCOMB_X70_Y50_N16
\debounce_cnt1[8]~33\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \debounce_cnt1[8]~33_combout\ = (debounce_cnt1(8) & (\debounce_cnt1[7]~32\ $ (GND))) # (!debounce_cnt1(8) & (!\debounce_cnt1[7]~32\ & VCC))
-- \debounce_cnt1[8]~34\ = CARRY((debounce_cnt1(8) & !\debounce_cnt1[7]~32\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => debounce_cnt1(8),
	datad => VCC,
	cin => \debounce_cnt1[7]~32\,
	combout => \debounce_cnt1[8]~33_combout\,
	cout => \debounce_cnt1[8]~34\);

-- Location: FF_X70_Y50_N17
\debounce_cnt1[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \MAX10_CLK1_50~inputclkctrl_outclk\,
	d => \debounce_cnt1[8]~33_combout\,
	sclr => \debounce_cnt1[13]~26_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => debounce_cnt1(8));

-- Location: LCCOMB_X70_Y50_N18
\debounce_cnt1[9]~35\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \debounce_cnt1[9]~35_combout\ = (debounce_cnt1(9) & (!\debounce_cnt1[8]~34\)) # (!debounce_cnt1(9) & ((\debounce_cnt1[8]~34\) # (GND)))
-- \debounce_cnt1[9]~36\ = CARRY((!\debounce_cnt1[8]~34\) # (!debounce_cnt1(9)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => debounce_cnt1(9),
	datad => VCC,
	cin => \debounce_cnt1[8]~34\,
	combout => \debounce_cnt1[9]~35_combout\,
	cout => \debounce_cnt1[9]~36\);

-- Location: FF_X70_Y50_N19
\debounce_cnt1[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \MAX10_CLK1_50~inputclkctrl_outclk\,
	d => \debounce_cnt1[9]~35_combout\,
	sclr => \debounce_cnt1[13]~26_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => debounce_cnt1(9));

-- Location: LCCOMB_X70_Y50_N20
\debounce_cnt1[10]~37\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \debounce_cnt1[10]~37_combout\ = (debounce_cnt1(10) & (\debounce_cnt1[9]~36\ $ (GND))) # (!debounce_cnt1(10) & (!\debounce_cnt1[9]~36\ & VCC))
-- \debounce_cnt1[10]~38\ = CARRY((debounce_cnt1(10) & !\debounce_cnt1[9]~36\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => debounce_cnt1(10),
	datad => VCC,
	cin => \debounce_cnt1[9]~36\,
	combout => \debounce_cnt1[10]~37_combout\,
	cout => \debounce_cnt1[10]~38\);

-- Location: FF_X70_Y50_N21
\debounce_cnt1[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \MAX10_CLK1_50~inputclkctrl_outclk\,
	d => \debounce_cnt1[10]~37_combout\,
	sclr => \debounce_cnt1[13]~26_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => debounce_cnt1(10));

-- Location: LCCOMB_X70_Y50_N22
\debounce_cnt1[11]~39\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \debounce_cnt1[11]~39_combout\ = (debounce_cnt1(11) & (!\debounce_cnt1[10]~38\)) # (!debounce_cnt1(11) & ((\debounce_cnt1[10]~38\) # (GND)))
-- \debounce_cnt1[11]~40\ = CARRY((!\debounce_cnt1[10]~38\) # (!debounce_cnt1(11)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => debounce_cnt1(11),
	datad => VCC,
	cin => \debounce_cnt1[10]~38\,
	combout => \debounce_cnt1[11]~39_combout\,
	cout => \debounce_cnt1[11]~40\);

-- Location: FF_X70_Y50_N23
\debounce_cnt1[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \MAX10_CLK1_50~inputclkctrl_outclk\,
	d => \debounce_cnt1[11]~39_combout\,
	sclr => \debounce_cnt1[13]~26_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => debounce_cnt1(11));

-- Location: LCCOMB_X70_Y50_N24
\debounce_cnt1[12]~41\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \debounce_cnt1[12]~41_combout\ = (debounce_cnt1(12) & (\debounce_cnt1[11]~40\ $ (GND))) # (!debounce_cnt1(12) & (!\debounce_cnt1[11]~40\ & VCC))
-- \debounce_cnt1[12]~42\ = CARRY((debounce_cnt1(12) & !\debounce_cnt1[11]~40\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => debounce_cnt1(12),
	datad => VCC,
	cin => \debounce_cnt1[11]~40\,
	combout => \debounce_cnt1[12]~41_combout\,
	cout => \debounce_cnt1[12]~42\);

-- Location: FF_X70_Y50_N25
\debounce_cnt1[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \MAX10_CLK1_50~inputclkctrl_outclk\,
	d => \debounce_cnt1[12]~41_combout\,
	sclr => \debounce_cnt1[13]~26_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => debounce_cnt1(12));

-- Location: LCCOMB_X70_Y50_N26
\debounce_cnt1[13]~43\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \debounce_cnt1[13]~43_combout\ = (debounce_cnt1(13) & (!\debounce_cnt1[12]~42\)) # (!debounce_cnt1(13) & ((\debounce_cnt1[12]~42\) # (GND)))
-- \debounce_cnt1[13]~44\ = CARRY((!\debounce_cnt1[12]~42\) # (!debounce_cnt1(13)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => debounce_cnt1(13),
	datad => VCC,
	cin => \debounce_cnt1[12]~42\,
	combout => \debounce_cnt1[13]~43_combout\,
	cout => \debounce_cnt1[13]~44\);

-- Location: FF_X70_Y50_N27
\debounce_cnt1[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \MAX10_CLK1_50~inputclkctrl_outclk\,
	d => \debounce_cnt1[13]~43_combout\,
	sclr => \debounce_cnt1[13]~26_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => debounce_cnt1(13));

-- Location: LCCOMB_X69_Y50_N10
\LessThan1~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan1~2_combout\ = (!debounce_cnt1(12) & (!debounce_cnt1(13) & (!debounce_cnt1(10) & !debounce_cnt1(11))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => debounce_cnt1(12),
	datab => debounce_cnt1(13),
	datac => debounce_cnt1(10),
	datad => debounce_cnt1(11),
	combout => \LessThan1~2_combout\);

-- Location: LCCOMB_X69_Y50_N6
\LessThan1~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan1~0_combout\ = ((!debounce_cnt1(4) & (!debounce_cnt1(5) & !debounce_cnt1(7)))) # (!debounce_cnt1(8))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => debounce_cnt1(4),
	datab => debounce_cnt1(5),
	datac => debounce_cnt1(7),
	datad => debounce_cnt1(8),
	combout => \LessThan1~0_combout\);

-- Location: LCCOMB_X69_Y50_N4
\LessThan1~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan1~1_combout\ = (\LessThan1~0_combout\) # (((!debounce_cnt1(7) & !debounce_cnt1(6))) # (!debounce_cnt1(9)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan1~0_combout\,
	datab => debounce_cnt1(7),
	datac => debounce_cnt1(6),
	datad => debounce_cnt1(9),
	combout => \LessThan1~1_combout\);

-- Location: LCCOMB_X70_Y50_N28
\debounce_cnt1[14]~45\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \debounce_cnt1[14]~45_combout\ = (debounce_cnt1(14) & (\debounce_cnt1[13]~44\ $ (GND))) # (!debounce_cnt1(14) & (!\debounce_cnt1[13]~44\ & VCC))
-- \debounce_cnt1[14]~46\ = CARRY((debounce_cnt1(14) & !\debounce_cnt1[13]~44\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => debounce_cnt1(14),
	datad => VCC,
	cin => \debounce_cnt1[13]~44\,
	combout => \debounce_cnt1[14]~45_combout\,
	cout => \debounce_cnt1[14]~46\);

-- Location: FF_X70_Y50_N29
\debounce_cnt1[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \MAX10_CLK1_50~inputclkctrl_outclk\,
	d => \debounce_cnt1[14]~45_combout\,
	sclr => \debounce_cnt1[13]~26_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => debounce_cnt1(14));

-- Location: LCCOMB_X70_Y50_N30
\debounce_cnt1[15]~47\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \debounce_cnt1[15]~47_combout\ = debounce_cnt1(15) $ (\debounce_cnt1[14]~46\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => debounce_cnt1(15),
	cin => \debounce_cnt1[14]~46\,
	combout => \debounce_cnt1[15]~47_combout\);

-- Location: FF_X70_Y50_N31
\debounce_cnt1[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \MAX10_CLK1_50~inputclkctrl_outclk\,
	d => \debounce_cnt1[15]~47_combout\,
	sclr => \debounce_cnt1[13]~26_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => debounce_cnt1(15));

-- Location: LCCOMB_X69_Y50_N12
\LessThan1~3\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan1~3_combout\ = (((\LessThan1~2_combout\ & \LessThan1~1_combout\)) # (!debounce_cnt1(14))) # (!debounce_cnt1(15))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan1~2_combout\,
	datab => \LessThan1~1_combout\,
	datac => debounce_cnt1(15),
	datad => debounce_cnt1(14),
	combout => \LessThan1~3_combout\);

-- Location: LCCOMB_X69_Y50_N28
\key1_stable~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \key1_stable~0_combout\ = (\LessThan1~3_combout\ & ((\key1_stable~q\))) # (!\LessThan1~3_combout\ & (\key1_sync2~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \key1_sync2~q\,
	datac => \key1_stable~q\,
	datad => \LessThan1~3_combout\,
	combout => \key1_stable~0_combout\);

-- Location: FF_X69_Y50_N29
key1_stable : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \MAX10_CLK1_50~inputclkctrl_outclk\,
	d => \key1_stable~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \key1_stable~q\);

-- Location: FF_X67_Y50_N19
key1_prev : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \MAX10_CLK1_50~inputclkctrl_outclk\,
	asdata => \key1_stable~q\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \key1_prev~q\);

-- Location: LCCOMB_X67_Y50_N12
\KEY_DEBOUNCE~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \KEY_DEBOUNCE~0_combout\ = (\key1_stable~q\ & !\key1_prev~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \key1_stable~q\,
	datac => \key1_prev~q\,
	combout => \KEY_DEBOUNCE~0_combout\);

-- Location: FF_X67_Y50_N13
key1_pressed : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \MAX10_CLK1_50~inputclkctrl_outclk\,
	d => \KEY_DEBOUNCE~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \key1_pressed~q\);

-- Location: IOIBUF_X46_Y54_N29
\KEY[0]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_KEY(0),
	o => \KEY[0]~input_o\);

-- Location: LCCOMB_X50_Y48_N4
\key0_sync1~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \key0_sync1~0_combout\ = !\KEY[0]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \KEY[0]~input_o\,
	combout => \key0_sync1~0_combout\);

-- Location: FF_X50_Y48_N5
key0_sync1 : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \MAX10_CLK1_50~inputclkctrl_outclk\,
	d => \key0_sync1~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \key0_sync1~q\);

-- Location: FF_X50_Y48_N27
key0_sync2 : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \MAX10_CLK1_50~inputclkctrl_outclk\,
	asdata => \key0_sync1~q\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \key0_sync2~q\);

-- Location: LCCOMB_X49_Y48_N0
\debounce_cnt0[0]~16\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \debounce_cnt0[0]~16_combout\ = debounce_cnt0(0) $ (VCC)
-- \debounce_cnt0[0]~17\ = CARRY(debounce_cnt0(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => debounce_cnt0(0),
	datad => VCC,
	combout => \debounce_cnt0[0]~16_combout\,
	cout => \debounce_cnt0[0]~17\);

-- Location: LCCOMB_X50_Y48_N26
\debounce_cnt0[4]~26\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \debounce_cnt0[4]~26_combout\ = (\key0_stable~q\ $ (!\key0_sync2~q\)) # (!\LessThan0~3_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \key0_stable~q\,
	datac => \key0_sync2~q\,
	datad => \LessThan0~3_combout\,
	combout => \debounce_cnt0[4]~26_combout\);

-- Location: FF_X49_Y48_N1
\debounce_cnt0[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \MAX10_CLK1_50~inputclkctrl_outclk\,
	d => \debounce_cnt0[0]~16_combout\,
	sclr => \debounce_cnt0[4]~26_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => debounce_cnt0(0));

-- Location: LCCOMB_X49_Y48_N2
\debounce_cnt0[1]~18\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \debounce_cnt0[1]~18_combout\ = (debounce_cnt0(1) & (!\debounce_cnt0[0]~17\)) # (!debounce_cnt0(1) & ((\debounce_cnt0[0]~17\) # (GND)))
-- \debounce_cnt0[1]~19\ = CARRY((!\debounce_cnt0[0]~17\) # (!debounce_cnt0(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => debounce_cnt0(1),
	datad => VCC,
	cin => \debounce_cnt0[0]~17\,
	combout => \debounce_cnt0[1]~18_combout\,
	cout => \debounce_cnt0[1]~19\);

-- Location: FF_X49_Y48_N3
\debounce_cnt0[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \MAX10_CLK1_50~inputclkctrl_outclk\,
	d => \debounce_cnt0[1]~18_combout\,
	sclr => \debounce_cnt0[4]~26_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => debounce_cnt0(1));

-- Location: LCCOMB_X49_Y48_N4
\debounce_cnt0[2]~20\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \debounce_cnt0[2]~20_combout\ = (debounce_cnt0(2) & (\debounce_cnt0[1]~19\ $ (GND))) # (!debounce_cnt0(2) & (!\debounce_cnt0[1]~19\ & VCC))
-- \debounce_cnt0[2]~21\ = CARRY((debounce_cnt0(2) & !\debounce_cnt0[1]~19\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => debounce_cnt0(2),
	datad => VCC,
	cin => \debounce_cnt0[1]~19\,
	combout => \debounce_cnt0[2]~20_combout\,
	cout => \debounce_cnt0[2]~21\);

-- Location: FF_X49_Y48_N5
\debounce_cnt0[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \MAX10_CLK1_50~inputclkctrl_outclk\,
	d => \debounce_cnt0[2]~20_combout\,
	sclr => \debounce_cnt0[4]~26_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => debounce_cnt0(2));

-- Location: LCCOMB_X49_Y48_N6
\debounce_cnt0[3]~22\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \debounce_cnt0[3]~22_combout\ = (debounce_cnt0(3) & (!\debounce_cnt0[2]~21\)) # (!debounce_cnt0(3) & ((\debounce_cnt0[2]~21\) # (GND)))
-- \debounce_cnt0[3]~23\ = CARRY((!\debounce_cnt0[2]~21\) # (!debounce_cnt0(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => debounce_cnt0(3),
	datad => VCC,
	cin => \debounce_cnt0[2]~21\,
	combout => \debounce_cnt0[3]~22_combout\,
	cout => \debounce_cnt0[3]~23\);

-- Location: FF_X49_Y48_N7
\debounce_cnt0[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \MAX10_CLK1_50~inputclkctrl_outclk\,
	d => \debounce_cnt0[3]~22_combout\,
	sclr => \debounce_cnt0[4]~26_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => debounce_cnt0(3));

-- Location: LCCOMB_X49_Y48_N8
\debounce_cnt0[4]~24\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \debounce_cnt0[4]~24_combout\ = (debounce_cnt0(4) & (\debounce_cnt0[3]~23\ $ (GND))) # (!debounce_cnt0(4) & (!\debounce_cnt0[3]~23\ & VCC))
-- \debounce_cnt0[4]~25\ = CARRY((debounce_cnt0(4) & !\debounce_cnt0[3]~23\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => debounce_cnt0(4),
	datad => VCC,
	cin => \debounce_cnt0[3]~23\,
	combout => \debounce_cnt0[4]~24_combout\,
	cout => \debounce_cnt0[4]~25\);

-- Location: FF_X49_Y48_N9
\debounce_cnt0[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \MAX10_CLK1_50~inputclkctrl_outclk\,
	d => \debounce_cnt0[4]~24_combout\,
	sclr => \debounce_cnt0[4]~26_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => debounce_cnt0(4));

-- Location: LCCOMB_X49_Y48_N10
\debounce_cnt0[5]~27\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \debounce_cnt0[5]~27_combout\ = (debounce_cnt0(5) & (!\debounce_cnt0[4]~25\)) # (!debounce_cnt0(5) & ((\debounce_cnt0[4]~25\) # (GND)))
-- \debounce_cnt0[5]~28\ = CARRY((!\debounce_cnt0[4]~25\) # (!debounce_cnt0(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => debounce_cnt0(5),
	datad => VCC,
	cin => \debounce_cnt0[4]~25\,
	combout => \debounce_cnt0[5]~27_combout\,
	cout => \debounce_cnt0[5]~28\);

-- Location: FF_X49_Y48_N11
\debounce_cnt0[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \MAX10_CLK1_50~inputclkctrl_outclk\,
	d => \debounce_cnt0[5]~27_combout\,
	sclr => \debounce_cnt0[4]~26_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => debounce_cnt0(5));

-- Location: LCCOMB_X49_Y48_N12
\debounce_cnt0[6]~29\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \debounce_cnt0[6]~29_combout\ = (debounce_cnt0(6) & (\debounce_cnt0[5]~28\ $ (GND))) # (!debounce_cnt0(6) & (!\debounce_cnt0[5]~28\ & VCC))
-- \debounce_cnt0[6]~30\ = CARRY((debounce_cnt0(6) & !\debounce_cnt0[5]~28\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => debounce_cnt0(6),
	datad => VCC,
	cin => \debounce_cnt0[5]~28\,
	combout => \debounce_cnt0[6]~29_combout\,
	cout => \debounce_cnt0[6]~30\);

-- Location: FF_X49_Y48_N13
\debounce_cnt0[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \MAX10_CLK1_50~inputclkctrl_outclk\,
	d => \debounce_cnt0[6]~29_combout\,
	sclr => \debounce_cnt0[4]~26_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => debounce_cnt0(6));

-- Location: LCCOMB_X49_Y48_N14
\debounce_cnt0[7]~31\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \debounce_cnt0[7]~31_combout\ = (debounce_cnt0(7) & (!\debounce_cnt0[6]~30\)) # (!debounce_cnt0(7) & ((\debounce_cnt0[6]~30\) # (GND)))
-- \debounce_cnt0[7]~32\ = CARRY((!\debounce_cnt0[6]~30\) # (!debounce_cnt0(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => debounce_cnt0(7),
	datad => VCC,
	cin => \debounce_cnt0[6]~30\,
	combout => \debounce_cnt0[7]~31_combout\,
	cout => \debounce_cnt0[7]~32\);

-- Location: FF_X49_Y48_N15
\debounce_cnt0[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \MAX10_CLK1_50~inputclkctrl_outclk\,
	d => \debounce_cnt0[7]~31_combout\,
	sclr => \debounce_cnt0[4]~26_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => debounce_cnt0(7));

-- Location: LCCOMB_X49_Y48_N16
\debounce_cnt0[8]~33\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \debounce_cnt0[8]~33_combout\ = (debounce_cnt0(8) & (\debounce_cnt0[7]~32\ $ (GND))) # (!debounce_cnt0(8) & (!\debounce_cnt0[7]~32\ & VCC))
-- \debounce_cnt0[8]~34\ = CARRY((debounce_cnt0(8) & !\debounce_cnt0[7]~32\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => debounce_cnt0(8),
	datad => VCC,
	cin => \debounce_cnt0[7]~32\,
	combout => \debounce_cnt0[8]~33_combout\,
	cout => \debounce_cnt0[8]~34\);

-- Location: FF_X49_Y48_N17
\debounce_cnt0[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \MAX10_CLK1_50~inputclkctrl_outclk\,
	d => \debounce_cnt0[8]~33_combout\,
	sclr => \debounce_cnt0[4]~26_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => debounce_cnt0(8));

-- Location: LCCOMB_X49_Y48_N18
\debounce_cnt0[9]~35\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \debounce_cnt0[9]~35_combout\ = (debounce_cnt0(9) & (!\debounce_cnt0[8]~34\)) # (!debounce_cnt0(9) & ((\debounce_cnt0[8]~34\) # (GND)))
-- \debounce_cnt0[9]~36\ = CARRY((!\debounce_cnt0[8]~34\) # (!debounce_cnt0(9)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => debounce_cnt0(9),
	datad => VCC,
	cin => \debounce_cnt0[8]~34\,
	combout => \debounce_cnt0[9]~35_combout\,
	cout => \debounce_cnt0[9]~36\);

-- Location: FF_X49_Y48_N19
\debounce_cnt0[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \MAX10_CLK1_50~inputclkctrl_outclk\,
	d => \debounce_cnt0[9]~35_combout\,
	sclr => \debounce_cnt0[4]~26_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => debounce_cnt0(9));

-- Location: LCCOMB_X49_Y48_N20
\debounce_cnt0[10]~37\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \debounce_cnt0[10]~37_combout\ = (debounce_cnt0(10) & (\debounce_cnt0[9]~36\ $ (GND))) # (!debounce_cnt0(10) & (!\debounce_cnt0[9]~36\ & VCC))
-- \debounce_cnt0[10]~38\ = CARRY((debounce_cnt0(10) & !\debounce_cnt0[9]~36\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => debounce_cnt0(10),
	datad => VCC,
	cin => \debounce_cnt0[9]~36\,
	combout => \debounce_cnt0[10]~37_combout\,
	cout => \debounce_cnt0[10]~38\);

-- Location: FF_X49_Y48_N21
\debounce_cnt0[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \MAX10_CLK1_50~inputclkctrl_outclk\,
	d => \debounce_cnt0[10]~37_combout\,
	sclr => \debounce_cnt0[4]~26_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => debounce_cnt0(10));

-- Location: LCCOMB_X49_Y48_N22
\debounce_cnt0[11]~39\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \debounce_cnt0[11]~39_combout\ = (debounce_cnt0(11) & (!\debounce_cnt0[10]~38\)) # (!debounce_cnt0(11) & ((\debounce_cnt0[10]~38\) # (GND)))
-- \debounce_cnt0[11]~40\ = CARRY((!\debounce_cnt0[10]~38\) # (!debounce_cnt0(11)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => debounce_cnt0(11),
	datad => VCC,
	cin => \debounce_cnt0[10]~38\,
	combout => \debounce_cnt0[11]~39_combout\,
	cout => \debounce_cnt0[11]~40\);

-- Location: FF_X49_Y48_N23
\debounce_cnt0[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \MAX10_CLK1_50~inputclkctrl_outclk\,
	d => \debounce_cnt0[11]~39_combout\,
	sclr => \debounce_cnt0[4]~26_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => debounce_cnt0(11));

-- Location: LCCOMB_X49_Y48_N24
\debounce_cnt0[12]~41\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \debounce_cnt0[12]~41_combout\ = (debounce_cnt0(12) & (\debounce_cnt0[11]~40\ $ (GND))) # (!debounce_cnt0(12) & (!\debounce_cnt0[11]~40\ & VCC))
-- \debounce_cnt0[12]~42\ = CARRY((debounce_cnt0(12) & !\debounce_cnt0[11]~40\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => debounce_cnt0(12),
	datad => VCC,
	cin => \debounce_cnt0[11]~40\,
	combout => \debounce_cnt0[12]~41_combout\,
	cout => \debounce_cnt0[12]~42\);

-- Location: FF_X49_Y48_N25
\debounce_cnt0[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \MAX10_CLK1_50~inputclkctrl_outclk\,
	d => \debounce_cnt0[12]~41_combout\,
	sclr => \debounce_cnt0[4]~26_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => debounce_cnt0(12));

-- Location: LCCOMB_X49_Y48_N26
\debounce_cnt0[13]~43\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \debounce_cnt0[13]~43_combout\ = (debounce_cnt0(13) & (!\debounce_cnt0[12]~42\)) # (!debounce_cnt0(13) & ((\debounce_cnt0[12]~42\) # (GND)))
-- \debounce_cnt0[13]~44\ = CARRY((!\debounce_cnt0[12]~42\) # (!debounce_cnt0(13)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => debounce_cnt0(13),
	datad => VCC,
	cin => \debounce_cnt0[12]~42\,
	combout => \debounce_cnt0[13]~43_combout\,
	cout => \debounce_cnt0[13]~44\);

-- Location: FF_X49_Y48_N27
\debounce_cnt0[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \MAX10_CLK1_50~inputclkctrl_outclk\,
	d => \debounce_cnt0[13]~43_combout\,
	sclr => \debounce_cnt0[4]~26_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => debounce_cnt0(13));

-- Location: LCCOMB_X49_Y48_N28
\debounce_cnt0[14]~45\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \debounce_cnt0[14]~45_combout\ = (debounce_cnt0(14) & (\debounce_cnt0[13]~44\ $ (GND))) # (!debounce_cnt0(14) & (!\debounce_cnt0[13]~44\ & VCC))
-- \debounce_cnt0[14]~46\ = CARRY((debounce_cnt0(14) & !\debounce_cnt0[13]~44\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => debounce_cnt0(14),
	datad => VCC,
	cin => \debounce_cnt0[13]~44\,
	combout => \debounce_cnt0[14]~45_combout\,
	cout => \debounce_cnt0[14]~46\);

-- Location: FF_X49_Y48_N29
\debounce_cnt0[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \MAX10_CLK1_50~inputclkctrl_outclk\,
	d => \debounce_cnt0[14]~45_combout\,
	sclr => \debounce_cnt0[4]~26_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => debounce_cnt0(14));

-- Location: LCCOMB_X49_Y48_N30
\debounce_cnt0[15]~47\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \debounce_cnt0[15]~47_combout\ = debounce_cnt0(15) $ (\debounce_cnt0[14]~46\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => debounce_cnt0(15),
	cin => \debounce_cnt0[14]~46\,
	combout => \debounce_cnt0[15]~47_combout\);

-- Location: FF_X49_Y48_N31
\debounce_cnt0[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \MAX10_CLK1_50~inputclkctrl_outclk\,
	d => \debounce_cnt0[15]~47_combout\,
	sclr => \debounce_cnt0[4]~26_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => debounce_cnt0(15));

-- Location: LCCOMB_X50_Y48_N30
\LessThan0~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan0~2_combout\ = (!debounce_cnt0(10) & (!debounce_cnt0(12) & (!debounce_cnt0(13) & !debounce_cnt0(11))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => debounce_cnt0(10),
	datab => debounce_cnt0(12),
	datac => debounce_cnt0(13),
	datad => debounce_cnt0(11),
	combout => \LessThan0~2_combout\);

-- Location: LCCOMB_X50_Y48_N22
\LessThan0~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan0~0_combout\ = ((!debounce_cnt0(7) & (!debounce_cnt0(4) & !debounce_cnt0(5)))) # (!debounce_cnt0(8))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100011111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => debounce_cnt0(7),
	datab => debounce_cnt0(4),
	datac => debounce_cnt0(8),
	datad => debounce_cnt0(5),
	combout => \LessThan0~0_combout\);

-- Location: LCCOMB_X50_Y48_N28
\LessThan0~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan0~1_combout\ = ((\LessThan0~0_combout\) # ((!debounce_cnt0(6) & !debounce_cnt0(7)))) # (!debounce_cnt0(9))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001111110111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => debounce_cnt0(6),
	datab => debounce_cnt0(9),
	datac => \LessThan0~0_combout\,
	datad => debounce_cnt0(7),
	combout => \LessThan0~1_combout\);

-- Location: LCCOMB_X50_Y48_N12
\LessThan0~3\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan0~3_combout\ = (((\LessThan0~2_combout\ & \LessThan0~1_combout\)) # (!debounce_cnt0(14))) # (!debounce_cnt0(15))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111011101110111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => debounce_cnt0(15),
	datab => debounce_cnt0(14),
	datac => \LessThan0~2_combout\,
	datad => \LessThan0~1_combout\,
	combout => \LessThan0~3_combout\);

-- Location: LCCOMB_X50_Y48_N24
\key0_stable~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \key0_stable~0_combout\ = (\LessThan0~3_combout\ & ((\key0_stable~q\))) # (!\LessThan0~3_combout\ & (\key0_sync2~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \key0_sync2~q\,
	datac => \key0_stable~q\,
	datad => \LessThan0~3_combout\,
	combout => \key0_stable~0_combout\);

-- Location: FF_X50_Y48_N25
key0_stable : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \MAX10_CLK1_50~inputclkctrl_outclk\,
	d => \key0_stable~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \key0_stable~q\);

-- Location: LCCOMB_X51_Y48_N18
\key0_prev~feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \key0_prev~feeder_combout\ = \key0_stable~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \key0_stable~q\,
	combout => \key0_prev~feeder_combout\);

-- Location: FF_X51_Y48_N19
key0_prev : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \MAX10_CLK1_50~inputclkctrl_outclk\,
	d => \key0_prev~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \key0_prev~q\);

-- Location: LCCOMB_X51_Y48_N4
\KEY_DEBOUNCE~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \KEY_DEBOUNCE~1_combout\ = (\key0_stable~q\ & !\key0_prev~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \key0_stable~q\,
	datad => \key0_prev~q\,
	combout => \KEY_DEBOUNCE~1_combout\);

-- Location: FF_X51_Y48_N5
key0_pressed : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \MAX10_CLK1_50~inputclkctrl_outclk\,
	d => \KEY_DEBOUNCE~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \key0_pressed~q\);

-- Location: LCCOMB_X67_Y50_N26
\Selector2~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Selector2~0_combout\ = (\state.COMPUTING~q\ & (((\state.WAIT_HIGH~q\ & !\state.SHOW_RESULT~q\)) # (!\key0_pressed~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101010001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \state.COMPUTING~q\,
	datab => \state.WAIT_HIGH~q\,
	datac => \key0_pressed~q\,
	datad => \state.SHOW_RESULT~q\,
	combout => \Selector2~0_combout\);

-- Location: LCCOMB_X67_Y50_N16
\start_check~feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \start_check~feeder_combout\ = \Selector3~1_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \Selector3~1_combout\,
	combout => \start_check~feeder_combout\);

-- Location: FF_X67_Y50_N17
start_check : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \MAX10_CLK1_50~inputclkctrl_outclk\,
	d => \start_check~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \start_check~q\);

-- Location: IOIBUF_X51_Y54_N29
\SW[0]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(0),
	o => \SW[0]~input_o\);

-- Location: FF_X62_Y50_N5
\data_full[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \MAX10_CLK1_50~inputclkctrl_outclk\,
	asdata => \SW[0]~input_o\,
	sload => VCC,
	ena => \Selector3~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => data_full(0));

-- Location: LCCOMB_X65_Y50_N4
\n_reg[0]~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \n_reg[0]~0_combout\ = (\state.WAIT_HIGH~q\ & \start_check~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \state.WAIT_HIGH~q\,
	datad => \start_check~q\,
	combout => \n_reg[0]~0_combout\);

-- Location: FF_X63_Y50_N19
\n_reg[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \MAX10_CLK1_50~inputclkctrl_outclk\,
	asdata => data_full(0),
	sload => VCC,
	ena => \n_reg[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => n_reg(0));

-- Location: FF_X63_Y50_N9
\n_reg[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \MAX10_CLK1_50~inputclkctrl_outclk\,
	asdata => data_full(1),
	sload => VCC,
	ena => \n_reg[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => n_reg(1));

-- Location: LCCOMB_X61_Y50_N20
\Add3~28\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add3~28_combout\ = (current_divisor(11) & (\Add3~26\ $ (GND))) # (!current_divisor(11) & (!\Add3~26\ & VCC))
-- \Add3~29\ = CARRY((current_divisor(11) & !\Add3~26\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => current_divisor(11),
	datad => VCC,
	cin => \Add3~26\,
	combout => \Add3~28_combout\,
	cout => \Add3~29\);

-- Location: LCCOMB_X61_Y50_N22
\Add3~31\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add3~31_combout\ = (current_divisor(12) & (!\Add3~29\)) # (!current_divisor(12) & ((\Add3~29\) # (GND)))
-- \Add3~32\ = CARRY((!\Add3~29\) # (!current_divisor(12)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => current_divisor(12),
	datad => VCC,
	cin => \Add3~29\,
	combout => \Add3~31_combout\,
	cout => \Add3~32\);

-- Location: LCCOMB_X64_Y50_N26
\Add3~33\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add3~33_combout\ = (!\start_check~q\ & (!\Equal1~4_combout\ & \Add3~31_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \start_check~q\,
	datac => \Equal1~4_combout\,
	datad => \Add3~31_combout\,
	combout => \Add3~33_combout\);

-- Location: LCCOMB_X66_Y50_N28
\current_divisor[15]~9\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \current_divisor[15]~9_combout\ = ((\check_done~q\ & !\start_check~q\)) # (!\state.WAIT_HIGH~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \check_done~q\,
	datac => \state.WAIT_HIGH~q\,
	datad => \start_check~q\,
	combout => \current_divisor[15]~9_combout\);

-- Location: LCCOMB_X65_Y50_N26
\Equal1~5\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Equal1~5_combout\ = (!current_divisor(0) & \Equal1~4_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => current_divisor(0),
	datad => \Equal1~4_combout\,
	combout => \Equal1~5_combout\);

-- Location: LCCOMB_X66_Y49_N0
\check_counter[0]~10\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \check_counter[0]~10_combout\ = check_counter(0) $ (VCC)
-- \check_counter[0]~11\ = CARRY(check_counter(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => check_counter(0),
	datad => VCC,
	combout => \check_counter[0]~10_combout\,
	cout => \check_counter[0]~11\);

-- Location: LCCOMB_X66_Y50_N30
\check_counter[1]~22\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \check_counter[1]~22_combout\ = (\start_check~q\) # (!\state.WAIT_HIGH~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \state.WAIT_HIGH~q\,
	datad => \start_check~q\,
	combout => \check_counter[1]~22_combout\);

-- Location: LCCOMB_X66_Y50_N20
\check_counter[1]~23\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \check_counter[1]~23_combout\ = ((\start_check~q\) # ((!\check_done~q\ & \state.COMPUTING~q\))) # (!\state.WAIT_HIGH~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111101110101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \state.WAIT_HIGH~q\,
	datab => \check_done~q\,
	datac => \state.COMPUTING~q\,
	datad => \start_check~q\,
	combout => \check_counter[1]~23_combout\);

-- Location: FF_X66_Y49_N1
\check_counter[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \MAX10_CLK1_50~inputclkctrl_outclk\,
	d => \check_counter[0]~10_combout\,
	sclr => \check_counter[1]~22_combout\,
	ena => \check_counter[1]~23_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => check_counter(0));

-- Location: LCCOMB_X66_Y49_N2
\check_counter[1]~12\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \check_counter[1]~12_combout\ = (check_counter(1) & (!\check_counter[0]~11\)) # (!check_counter(1) & ((\check_counter[0]~11\) # (GND)))
-- \check_counter[1]~13\ = CARRY((!\check_counter[0]~11\) # (!check_counter(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => check_counter(1),
	datad => VCC,
	cin => \check_counter[0]~11\,
	combout => \check_counter[1]~12_combout\,
	cout => \check_counter[1]~13\);

-- Location: FF_X66_Y49_N3
\check_counter[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \MAX10_CLK1_50~inputclkctrl_outclk\,
	d => \check_counter[1]~12_combout\,
	sclr => \check_counter[1]~22_combout\,
	ena => \check_counter[1]~23_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => check_counter(1));

-- Location: LCCOMB_X66_Y49_N4
\check_counter[2]~14\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \check_counter[2]~14_combout\ = (check_counter(2) & (\check_counter[1]~13\ $ (GND))) # (!check_counter(2) & (!\check_counter[1]~13\ & VCC))
-- \check_counter[2]~15\ = CARRY((check_counter(2) & !\check_counter[1]~13\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => check_counter(2),
	datad => VCC,
	cin => \check_counter[1]~13\,
	combout => \check_counter[2]~14_combout\,
	cout => \check_counter[2]~15\);

-- Location: FF_X66_Y49_N5
\check_counter[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \MAX10_CLK1_50~inputclkctrl_outclk\,
	d => \check_counter[2]~14_combout\,
	sclr => \check_counter[1]~22_combout\,
	ena => \check_counter[1]~23_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => check_counter(2));

-- Location: LCCOMB_X66_Y49_N6
\check_counter[3]~16\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \check_counter[3]~16_combout\ = (check_counter(3) & (!\check_counter[2]~15\)) # (!check_counter(3) & ((\check_counter[2]~15\) # (GND)))
-- \check_counter[3]~17\ = CARRY((!\check_counter[2]~15\) # (!check_counter(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => check_counter(3),
	datad => VCC,
	cin => \check_counter[2]~15\,
	combout => \check_counter[3]~16_combout\,
	cout => \check_counter[3]~17\);

-- Location: FF_X66_Y49_N7
\check_counter[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \MAX10_CLK1_50~inputclkctrl_outclk\,
	d => \check_counter[3]~16_combout\,
	sclr => \check_counter[1]~22_combout\,
	ena => \check_counter[1]~23_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => check_counter(3));

-- Location: LCCOMB_X66_Y49_N8
\check_counter[4]~18\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \check_counter[4]~18_combout\ = (check_counter(4) & (\check_counter[3]~17\ $ (GND))) # (!check_counter(4) & (!\check_counter[3]~17\ & VCC))
-- \check_counter[4]~19\ = CARRY((check_counter(4) & !\check_counter[3]~17\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => check_counter(4),
	datad => VCC,
	cin => \check_counter[3]~17\,
	combout => \check_counter[4]~18_combout\,
	cout => \check_counter[4]~19\);

-- Location: FF_X66_Y49_N9
\check_counter[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \MAX10_CLK1_50~inputclkctrl_outclk\,
	d => \check_counter[4]~18_combout\,
	sclr => \check_counter[1]~22_combout\,
	ena => \check_counter[1]~23_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => check_counter(4));

-- Location: LCCOMB_X66_Y49_N10
\check_counter[5]~20\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \check_counter[5]~20_combout\ = (check_counter(5) & (!\check_counter[4]~19\)) # (!check_counter(5) & ((\check_counter[4]~19\) # (GND)))
-- \check_counter[5]~21\ = CARRY((!\check_counter[4]~19\) # (!check_counter(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => check_counter(5),
	datad => VCC,
	cin => \check_counter[4]~19\,
	combout => \check_counter[5]~20_combout\,
	cout => \check_counter[5]~21\);

-- Location: FF_X66_Y49_N11
\check_counter[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \MAX10_CLK1_50~inputclkctrl_outclk\,
	d => \check_counter[5]~20_combout\,
	sclr => \check_counter[1]~22_combout\,
	ena => \check_counter[1]~23_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => check_counter(5));

-- Location: LCCOMB_X66_Y49_N12
\check_counter[6]~24\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \check_counter[6]~24_combout\ = (check_counter(6) & (\check_counter[5]~21\ $ (GND))) # (!check_counter(6) & (!\check_counter[5]~21\ & VCC))
-- \check_counter[6]~25\ = CARRY((check_counter(6) & !\check_counter[5]~21\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => check_counter(6),
	datad => VCC,
	cin => \check_counter[5]~21\,
	combout => \check_counter[6]~24_combout\,
	cout => \check_counter[6]~25\);

-- Location: FF_X66_Y49_N13
\check_counter[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \MAX10_CLK1_50~inputclkctrl_outclk\,
	d => \check_counter[6]~24_combout\,
	sclr => \check_counter[1]~22_combout\,
	ena => \check_counter[1]~23_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => check_counter(6));

-- Location: LCCOMB_X66_Y49_N14
\check_counter[7]~26\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \check_counter[7]~26_combout\ = (check_counter(7) & (!\check_counter[6]~25\)) # (!check_counter(7) & ((\check_counter[6]~25\) # (GND)))
-- \check_counter[7]~27\ = CARRY((!\check_counter[6]~25\) # (!check_counter(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => check_counter(7),
	datad => VCC,
	cin => \check_counter[6]~25\,
	combout => \check_counter[7]~26_combout\,
	cout => \check_counter[7]~27\);

-- Location: FF_X66_Y49_N15
\check_counter[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \MAX10_CLK1_50~inputclkctrl_outclk\,
	d => \check_counter[7]~26_combout\,
	sclr => \check_counter[1]~22_combout\,
	ena => \check_counter[1]~23_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => check_counter(7));

-- Location: LCCOMB_X66_Y49_N16
\check_counter[8]~28\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \check_counter[8]~28_combout\ = (check_counter(8) & (\check_counter[7]~27\ $ (GND))) # (!check_counter(8) & (!\check_counter[7]~27\ & VCC))
-- \check_counter[8]~29\ = CARRY((check_counter(8) & !\check_counter[7]~27\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => check_counter(8),
	datad => VCC,
	cin => \check_counter[7]~27\,
	combout => \check_counter[8]~28_combout\,
	cout => \check_counter[8]~29\);

-- Location: FF_X66_Y49_N17
\check_counter[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \MAX10_CLK1_50~inputclkctrl_outclk\,
	d => \check_counter[8]~28_combout\,
	sclr => \check_counter[1]~22_combout\,
	ena => \check_counter[1]~23_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => check_counter(8));

-- Location: LCCOMB_X66_Y49_N18
\check_counter[9]~30\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \check_counter[9]~30_combout\ = \check_counter[8]~29\ $ (check_counter(9))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => check_counter(9),
	cin => \check_counter[8]~29\,
	combout => \check_counter[9]~30_combout\);

-- Location: FF_X66_Y49_N19
\check_counter[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \MAX10_CLK1_50~inputclkctrl_outclk\,
	d => \check_counter[9]~30_combout\,
	sclr => \check_counter[1]~22_combout\,
	ena => \check_counter[1]~23_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => check_counter(9));

-- Location: LCCOMB_X66_Y49_N28
\current_divisor[5]~5\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \current_divisor[5]~5_combout\ = (check_counter(8)) # ((check_counter(7)) # (check_counter(9)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => check_counter(8),
	datac => check_counter(7),
	datad => check_counter(9),
	combout => \current_divisor[5]~5_combout\);

-- Location: LCCOMB_X66_Y49_N20
\current_divisor[5]~3\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \current_divisor[5]~3_combout\ = (check_counter(3)) # ((check_counter(2) & ((check_counter(0)) # (check_counter(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101011101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => check_counter(3),
	datab => check_counter(0),
	datac => check_counter(2),
	datad => check_counter(1),
	combout => \current_divisor[5]~3_combout\);

-- Location: LCCOMB_X66_Y49_N22
\current_divisor[5]~4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \current_divisor[5]~4_combout\ = (check_counter(6) & (check_counter(5) & ((check_counter(4)) # (\current_divisor[5]~3_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => check_counter(6),
	datab => check_counter(4),
	datac => check_counter(5),
	datad => \current_divisor[5]~3_combout\,
	combout => \current_divisor[5]~4_combout\);

-- Location: LCCOMB_X65_Y50_N10
\current_divisor[5]~6\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \current_divisor[5]~6_combout\ = (\Equal1~4_combout\ & (!current_divisor(0) & ((\current_divisor[5]~5_combout\) # (\current_divisor[5]~4_combout\)))) # (!\Equal1~4_combout\ & (((\current_divisor[5]~5_combout\) # (\current_divisor[5]~4_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111011101110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal1~4_combout\,
	datab => current_divisor(0),
	datac => \current_divisor[5]~5_combout\,
	datad => \current_divisor[5]~4_combout\,
	combout => \current_divisor[5]~6_combout\);

-- Location: IOIBUF_X54_Y54_N22
\SW[4]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(4),
	o => \SW[4]~input_o\);

-- Location: LCCOMB_X63_Y52_N14
\data_full[4]~feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \data_full[4]~feeder_combout\ = \SW[4]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \SW[4]~input_o\,
	combout => \data_full[4]~feeder_combout\);

-- Location: FF_X63_Y52_N15
\data_full[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \MAX10_CLK1_50~inputclkctrl_outclk\,
	d => \data_full[4]~feeder_combout\,
	ena => \Selector3~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => data_full(4));

-- Location: FF_X63_Y52_N31
\n_reg[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \MAX10_CLK1_50~inputclkctrl_outclk\,
	asdata => data_full(4),
	sload => VCC,
	ena => \n_reg[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => n_reg(4));

-- Location: IOIBUF_X58_Y54_N29
\SW[7]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(7),
	o => \SW[7]~input_o\);

-- Location: FF_X63_Y52_N25
\data_full[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \MAX10_CLK1_50~inputclkctrl_outclk\,
	asdata => \SW[7]~input_o\,
	sload => VCC,
	ena => \Selector3~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => data_full(7));

-- Location: LCCOMB_X63_Y52_N4
\n_reg[7]~feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \n_reg[7]~feeder_combout\ = data_full(7)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => data_full(7),
	combout => \n_reg[7]~feeder_combout\);

-- Location: FF_X63_Y52_N5
\n_reg[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \MAX10_CLK1_50~inputclkctrl_outclk\,
	d => \n_reg[7]~feeder_combout\,
	ena => \n_reg[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => n_reg(7));

-- Location: IOIBUF_X49_Y54_N1
\SW[5]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(5),
	o => \SW[5]~input_o\);

-- Location: FF_X63_Y52_N29
\data_full[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \MAX10_CLK1_50~inputclkctrl_outclk\,
	asdata => \SW[5]~input_o\,
	sload => VCC,
	ena => \Selector3~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => data_full(5));

-- Location: LCCOMB_X63_Y52_N26
\n_reg[5]~feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \n_reg[5]~feeder_combout\ = data_full(5)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => data_full(5),
	combout => \n_reg[5]~feeder_combout\);

-- Location: FF_X63_Y52_N27
\n_reg[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \MAX10_CLK1_50~inputclkctrl_outclk\,
	d => \n_reg[5]~feeder_combout\,
	ena => \n_reg[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => n_reg(5));

-- Location: IOIBUF_X54_Y54_N15
\SW[6]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(6),
	o => \SW[6]~input_o\);

-- Location: FF_X63_Y52_N19
\data_full[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \MAX10_CLK1_50~inputclkctrl_outclk\,
	asdata => \SW[6]~input_o\,
	sload => VCC,
	ena => \Selector3~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => data_full(6));

-- Location: LCCOMB_X63_Y52_N6
\n_reg[6]~feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \n_reg[6]~feeder_combout\ = data_full(6)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => data_full(6),
	combout => \n_reg[6]~feeder_combout\);

-- Location: FF_X63_Y52_N7
\n_reg[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \MAX10_CLK1_50~inputclkctrl_outclk\,
	d => \n_reg[6]~feeder_combout\,
	ena => \n_reg[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => n_reg(6));

-- Location: LCCOMB_X63_Y52_N22
\Equal0~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Equal0~0_combout\ = (!n_reg(4) & (!n_reg(7) & (!n_reg(5) & !n_reg(6))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => n_reg(4),
	datab => n_reg(7),
	datac => n_reg(5),
	datad => n_reg(6),
	combout => \Equal0~0_combout\);

-- Location: IOIBUF_X51_Y54_N1
\SW[2]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(2),
	o => \SW[2]~input_o\);

-- Location: FF_X62_Y50_N17
\data_full[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \MAX10_CLK1_50~inputclkctrl_outclk\,
	asdata => \SW[2]~input_o\,
	sload => VCC,
	ena => \Selector3~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => data_full(2));

-- Location: FF_X63_Y50_N13
\n_reg[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \MAX10_CLK1_50~inputclkctrl_outclk\,
	asdata => data_full(2),
	sload => VCC,
	ena => \n_reg[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => n_reg(2));

-- Location: IOIBUF_X54_Y54_N29
\SW[3]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(3),
	o => \SW[3]~input_o\);

-- Location: FF_X62_Y50_N11
\data_full[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \MAX10_CLK1_50~inputclkctrl_outclk\,
	asdata => \SW[3]~input_o\,
	sload => VCC,
	ena => \Selector3~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => data_full(3));

-- Location: FF_X63_Y50_N7
\n_reg[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \MAX10_CLK1_50~inputclkctrl_outclk\,
	asdata => data_full(3),
	sload => VCC,
	ena => \n_reg[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => n_reg(3));

-- Location: LCCOMB_X64_Y50_N24
\Equal0~3\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Equal0~3_combout\ = (!n_reg(2) & !n_reg(3))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001010101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => n_reg(2),
	datad => n_reg(3),
	combout => \Equal0~3_combout\);

-- Location: LCCOMB_X62_Y52_N16
\Selector1~3\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Selector1~3_combout\ = (!\state.WAIT_HIGH~q\ & \key0_pressed~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \state.WAIT_HIGH~q\,
	datad => \key0_pressed~q\,
	combout => \Selector1~3_combout\);

-- Location: FF_X62_Y52_N15
\data_high[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \MAX10_CLK1_50~inputclkctrl_outclk\,
	asdata => \SW[0]~input_o\,
	sload => VCC,
	ena => \Selector1~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => data_high(0));

-- Location: FF_X63_Y49_N3
\data_full[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \MAX10_CLK1_50~inputclkctrl_outclk\,
	asdata => data_high(0),
	sload => VCC,
	ena => \Selector3~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => data_full(8));

-- Location: LCCOMB_X63_Y49_N12
\n_reg[8]~feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \n_reg[8]~feeder_combout\ = data_full(8)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => data_full(8),
	combout => \n_reg[8]~feeder_combout\);

-- Location: FF_X63_Y49_N13
\n_reg[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \MAX10_CLK1_50~inputclkctrl_outclk\,
	d => \n_reg[8]~feeder_combout\,
	ena => \n_reg[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => n_reg(8));

-- Location: LCCOMB_X62_Y52_N6
\data_high[2]~feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \data_high[2]~feeder_combout\ = \SW[2]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \SW[2]~input_o\,
	combout => \data_high[2]~feeder_combout\);

-- Location: FF_X62_Y52_N7
\data_high[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \MAX10_CLK1_50~inputclkctrl_outclk\,
	d => \data_high[2]~feeder_combout\,
	ena => \Selector1~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => data_high(2));

-- Location: FF_X63_Y49_N21
\data_full[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \MAX10_CLK1_50~inputclkctrl_outclk\,
	asdata => data_high(2),
	sload => VCC,
	ena => \Selector3~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => data_full(10));

-- Location: LCCOMB_X63_Y49_N0
\n_reg[10]~feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \n_reg[10]~feeder_combout\ = data_full(10)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => data_full(10),
	combout => \n_reg[10]~feeder_combout\);

-- Location: FF_X63_Y49_N1
\n_reg[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \MAX10_CLK1_50~inputclkctrl_outclk\,
	d => \n_reg[10]~feeder_combout\,
	ena => \n_reg[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => n_reg(10));

-- Location: FF_X62_Y52_N25
\data_high[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \MAX10_CLK1_50~inputclkctrl_outclk\,
	asdata => \SW[3]~input_o\,
	sload => VCC,
	ena => \Selector1~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => data_high(3));

-- Location: FF_X63_Y49_N7
\data_full[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \MAX10_CLK1_50~inputclkctrl_outclk\,
	asdata => data_high(3),
	sload => VCC,
	ena => \Selector3~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => data_full(11));

-- Location: LCCOMB_X63_Y49_N8
\n_reg[11]~feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \n_reg[11]~feeder_combout\ = data_full(11)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => data_full(11),
	combout => \n_reg[11]~feeder_combout\);

-- Location: FF_X63_Y49_N9
\n_reg[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \MAX10_CLK1_50~inputclkctrl_outclk\,
	d => \n_reg[11]~feeder_combout\,
	ena => \n_reg[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => n_reg(11));

-- Location: FF_X62_Y52_N17
\data_high[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \MAX10_CLK1_50~inputclkctrl_outclk\,
	asdata => \SW[1]~input_o\,
	sload => VCC,
	ena => \Selector1~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => data_high(1));

-- Location: FF_X63_Y49_N27
\data_full[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \MAX10_CLK1_50~inputclkctrl_outclk\,
	asdata => data_high(1),
	sload => VCC,
	ena => \Selector3~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => data_full(9));

-- Location: FF_X63_Y49_N11
\n_reg[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \MAX10_CLK1_50~inputclkctrl_outclk\,
	asdata => data_full(9),
	sload => VCC,
	ena => \n_reg[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => n_reg(9));

-- Location: LCCOMB_X63_Y49_N14
\Equal0~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Equal0~1_combout\ = (!n_reg(8) & (!n_reg(10) & (!n_reg(11) & !n_reg(9))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => n_reg(8),
	datab => n_reg(10),
	datac => n_reg(11),
	datad => n_reg(9),
	combout => \Equal0~1_combout\);

-- Location: FF_X64_Y52_N1
\data_high[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \MAX10_CLK1_50~inputclkctrl_outclk\,
	asdata => \SW[5]~input_o\,
	sload => VCC,
	ena => \Selector1~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => data_high(5));

-- Location: FF_X64_Y49_N27
\data_full[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \MAX10_CLK1_50~inputclkctrl_outclk\,
	asdata => data_high(5),
	sload => VCC,
	ena => \Selector3~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => data_full(13));

-- Location: FF_X64_Y49_N7
\n_reg[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \MAX10_CLK1_50~inputclkctrl_outclk\,
	asdata => data_full(13),
	sload => VCC,
	ena => \n_reg[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => n_reg(13));

-- Location: FF_X64_Y52_N13
\data_high[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \MAX10_CLK1_50~inputclkctrl_outclk\,
	asdata => \SW[7]~input_o\,
	sload => VCC,
	ena => \Selector1~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => data_high(7));

-- Location: FF_X64_Y49_N31
\data_full[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \MAX10_CLK1_50~inputclkctrl_outclk\,
	asdata => data_high(7),
	sload => VCC,
	ena => \Selector3~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => data_full(15));

-- Location: LCCOMB_X64_Y49_N18
\n_reg[15]~feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \n_reg[15]~feeder_combout\ = data_full(15)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => data_full(15),
	combout => \n_reg[15]~feeder_combout\);

-- Location: FF_X64_Y49_N19
\n_reg[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \MAX10_CLK1_50~inputclkctrl_outclk\,
	d => \n_reg[15]~feeder_combout\,
	ena => \n_reg[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => n_reg(15));

-- Location: FF_X64_Y52_N19
\data_high[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \MAX10_CLK1_50~inputclkctrl_outclk\,
	asdata => \SW[4]~input_o\,
	sload => VCC,
	ena => \Selector1~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => data_high(4));

-- Location: FF_X64_Y49_N5
\data_full[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \MAX10_CLK1_50~inputclkctrl_outclk\,
	asdata => data_high(4),
	sload => VCC,
	ena => \Selector3~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => data_full(12));

-- Location: LCCOMB_X64_Y49_N8
\n_reg[12]~feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \n_reg[12]~feeder_combout\ = data_full(12)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => data_full(12),
	combout => \n_reg[12]~feeder_combout\);

-- Location: FF_X64_Y49_N9
\n_reg[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \MAX10_CLK1_50~inputclkctrl_outclk\,
	d => \n_reg[12]~feeder_combout\,
	ena => \n_reg[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => n_reg(12));

-- Location: FF_X64_Y52_N11
\data_high[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \MAX10_CLK1_50~inputclkctrl_outclk\,
	asdata => \SW[6]~input_o\,
	sload => VCC,
	ena => \Selector1~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => data_high(6));

-- Location: FF_X64_Y49_N3
\data_full[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \MAX10_CLK1_50~inputclkctrl_outclk\,
	asdata => data_high(6),
	sload => VCC,
	ena => \Selector3~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => data_full(14));

-- Location: LCCOMB_X64_Y49_N0
\n_reg[14]~feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \n_reg[14]~feeder_combout\ = data_full(14)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => data_full(14),
	combout => \n_reg[14]~feeder_combout\);

-- Location: FF_X64_Y49_N1
\n_reg[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \MAX10_CLK1_50~inputclkctrl_outclk\,
	d => \n_reg[14]~feeder_combout\,
	ena => \n_reg[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => n_reg(14));

-- Location: LCCOMB_X64_Y49_N16
\Equal0~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Equal0~2_combout\ = (!n_reg(13) & (!n_reg(15) & (!n_reg(12) & !n_reg(14))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => n_reg(13),
	datab => n_reg(15),
	datac => n_reg(12),
	datad => n_reg(14),
	combout => \Equal0~2_combout\);

-- Location: LCCOMB_X64_Y50_N22
\Equal0~4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Equal0~4_combout\ = (\Equal0~0_combout\ & (\Equal0~3_combout\ & (\Equal0~1_combout\ & \Equal0~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal0~0_combout\,
	datab => \Equal0~3_combout\,
	datac => \Equal0~1_combout\,
	datad => \Equal0~2_combout\,
	combout => \Equal0~4_combout\);

-- Location: LCCOMB_X64_Y50_N2
\current_divisor[15]~7\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \current_divisor[15]~7_combout\ = (n_reg(0) & (!n_reg(1) & (\Equal0~4_combout\))) # (!n_reg(0) & (((\Equal0~4_combout\) # (\Equal1~5_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111010101110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => n_reg(0),
	datab => n_reg(1),
	datac => \Equal0~4_combout\,
	datad => \Equal1~5_combout\,
	combout => \current_divisor[15]~7_combout\);

-- Location: LCCOMB_X64_Y50_N0
\current_divisor[15]~8\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \current_divisor[15]~8_combout\ = ((\current_divisor[15]~7_combout\) # ((!\Equal1~5_combout\ & \current_divisor[5]~6_combout\))) # (!\state.COMPUTING~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111101110101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \state.COMPUTING~q\,
	datab => \Equal1~5_combout\,
	datac => \current_divisor[5]~6_combout\,
	datad => \current_divisor[15]~7_combout\,
	combout => \current_divisor[15]~8_combout\);

-- Location: LCCOMB_X64_Y50_N6
\current_divisor[15]~10\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \current_divisor[15]~10_combout\ = (!\current_divisor[15]~9_combout\ & ((\start_check~q\) # ((\LessThan3~30_combout\ & !\current_divisor[15]~8_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010001000110010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \start_check~q\,
	datab => \current_divisor[15]~9_combout\,
	datac => \LessThan3~30_combout\,
	datad => \current_divisor[15]~8_combout\,
	combout => \current_divisor[15]~10_combout\);

-- Location: FF_X64_Y50_N27
\current_divisor[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \MAX10_CLK1_50~inputclkctrl_outclk\,
	d => \Add3~33_combout\,
	ena => \current_divisor[15]~10_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => current_divisor(12));

-- Location: LCCOMB_X61_Y50_N24
\Add3~34\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add3~34_combout\ = (current_divisor(13) & (\Add3~32\ $ (GND))) # (!current_divisor(13) & (!\Add3~32\ & VCC))
-- \Add3~35\ = CARRY((current_divisor(13) & !\Add3~32\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => current_divisor(13),
	datad => VCC,
	cin => \Add3~32\,
	combout => \Add3~34_combout\,
	cout => \Add3~35\);

-- Location: LCCOMB_X64_Y50_N30
\Add3~36\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add3~36_combout\ = (!\start_check~q\ & (\Add3~34_combout\ & !\Equal1~4_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \start_check~q\,
	datab => \Add3~34_combout\,
	datad => \Equal1~4_combout\,
	combout => \Add3~36_combout\);

-- Location: FF_X64_Y50_N31
\current_divisor[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \MAX10_CLK1_50~inputclkctrl_outclk\,
	d => \Add3~36_combout\,
	ena => \current_divisor[15]~10_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => current_divisor(13));

-- Location: LCCOMB_X61_Y50_N26
\Add3~37\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add3~37_combout\ = (current_divisor(14) & (!\Add3~35\)) # (!current_divisor(14) & ((\Add3~35\) # (GND)))
-- \Add3~38\ = CARRY((!\Add3~35\) # (!current_divisor(14)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => current_divisor(14),
	datad => VCC,
	cin => \Add3~35\,
	combout => \Add3~37_combout\,
	cout => \Add3~38\);

-- Location: LCCOMB_X64_Y50_N4
\Add3~39\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add3~39_combout\ = (!\start_check~q\ & (\Add3~37_combout\ & !\Equal1~4_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \start_check~q\,
	datac => \Add3~37_combout\,
	datad => \Equal1~4_combout\,
	combout => \Add3~39_combout\);

-- Location: FF_X64_Y50_N5
\current_divisor[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \MAX10_CLK1_50~inputclkctrl_outclk\,
	d => \Add3~39_combout\,
	ena => \current_divisor[15]~10_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => current_divisor(14));

-- Location: LCCOMB_X61_Y50_N28
\Add3~40\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add3~40_combout\ = \Add3~38\ $ (!current_divisor(15))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => current_divisor(15),
	cin => \Add3~38\,
	combout => \Add3~40_combout\);

-- Location: LCCOMB_X65_Y50_N22
\Add3~42\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add3~42_combout\ = (!\Equal1~4_combout\ & (!\start_check~q\ & \Add3~40_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal1~4_combout\,
	datac => \start_check~q\,
	datad => \Add3~40_combout\,
	combout => \Add3~42_combout\);

-- Location: FF_X65_Y50_N23
\current_divisor[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \MAX10_CLK1_50~inputclkctrl_outclk\,
	d => \Add3~42_combout\,
	ena => \current_divisor[15]~10_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => current_divisor(15));

-- Location: LCCOMB_X63_Y50_N0
\LessThan3~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan3~1_cout\ = CARRY((!current_divisor(0) & n_reg(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001000100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => current_divisor(0),
	datab => n_reg(0),
	datad => VCC,
	cout => \LessThan3~1_cout\);

-- Location: LCCOMB_X63_Y50_N2
\LessThan3~3\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan3~3_cout\ = CARRY((n_reg(1) & (current_divisor(1) & !\LessThan3~1_cout\)) # (!n_reg(1) & ((current_divisor(1)) # (!\LessThan3~1_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => n_reg(1),
	datab => current_divisor(1),
	datad => VCC,
	cin => \LessThan3~1_cout\,
	cout => \LessThan3~3_cout\);

-- Location: LCCOMB_X63_Y50_N4
\LessThan3~5\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan3~5_cout\ = CARRY((n_reg(2) & ((!\LessThan3~3_cout\) # (!current_divisor(2)))) # (!n_reg(2) & (!current_divisor(2) & !\LessThan3~3_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => n_reg(2),
	datab => current_divisor(2),
	datad => VCC,
	cin => \LessThan3~3_cout\,
	cout => \LessThan3~5_cout\);

-- Location: LCCOMB_X63_Y50_N6
\LessThan3~7\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan3~7_cout\ = CARRY((n_reg(3) & (current_divisor(3) & !\LessThan3~5_cout\)) # (!n_reg(3) & ((current_divisor(3)) # (!\LessThan3~5_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => n_reg(3),
	datab => current_divisor(3),
	datad => VCC,
	cin => \LessThan3~5_cout\,
	cout => \LessThan3~7_cout\);

-- Location: LCCOMB_X63_Y50_N8
\LessThan3~9\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan3~9_cout\ = CARRY((n_reg(4) & ((!\LessThan3~7_cout\) # (!current_divisor(4)))) # (!n_reg(4) & (!current_divisor(4) & !\LessThan3~7_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => n_reg(4),
	datab => current_divisor(4),
	datad => VCC,
	cin => \LessThan3~7_cout\,
	cout => \LessThan3~9_cout\);

-- Location: LCCOMB_X63_Y50_N10
\LessThan3~11\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan3~11_cout\ = CARRY((current_divisor(5) & ((!\LessThan3~9_cout\) # (!n_reg(5)))) # (!current_divisor(5) & (!n_reg(5) & !\LessThan3~9_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => current_divisor(5),
	datab => n_reg(5),
	datad => VCC,
	cin => \LessThan3~9_cout\,
	cout => \LessThan3~11_cout\);

-- Location: LCCOMB_X63_Y50_N12
\LessThan3~13\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan3~13_cout\ = CARRY((n_reg(6) & ((!\LessThan3~11_cout\) # (!current_divisor(6)))) # (!n_reg(6) & (!current_divisor(6) & !\LessThan3~11_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => n_reg(6),
	datab => current_divisor(6),
	datad => VCC,
	cin => \LessThan3~11_cout\,
	cout => \LessThan3~13_cout\);

-- Location: LCCOMB_X63_Y50_N14
\LessThan3~15\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan3~15_cout\ = CARRY((current_divisor(7) & ((!\LessThan3~13_cout\) # (!n_reg(7)))) # (!current_divisor(7) & (!n_reg(7) & !\LessThan3~13_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => current_divisor(7),
	datab => n_reg(7),
	datad => VCC,
	cin => \LessThan3~13_cout\,
	cout => \LessThan3~15_cout\);

-- Location: LCCOMB_X63_Y50_N16
\LessThan3~17\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan3~17_cout\ = CARRY((n_reg(8) & ((!\LessThan3~15_cout\) # (!current_divisor(8)))) # (!n_reg(8) & (!current_divisor(8) & !\LessThan3~15_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => n_reg(8),
	datab => current_divisor(8),
	datad => VCC,
	cin => \LessThan3~15_cout\,
	cout => \LessThan3~17_cout\);

-- Location: LCCOMB_X63_Y50_N18
\LessThan3~19\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan3~19_cout\ = CARRY((n_reg(9) & (current_divisor(9) & !\LessThan3~17_cout\)) # (!n_reg(9) & ((current_divisor(9)) # (!\LessThan3~17_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => n_reg(9),
	datab => current_divisor(9),
	datad => VCC,
	cin => \LessThan3~17_cout\,
	cout => \LessThan3~19_cout\);

-- Location: LCCOMB_X63_Y50_N20
\LessThan3~21\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan3~21_cout\ = CARRY((current_divisor(10) & (n_reg(10) & !\LessThan3~19_cout\)) # (!current_divisor(10) & ((n_reg(10)) # (!\LessThan3~19_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => current_divisor(10),
	datab => n_reg(10),
	datad => VCC,
	cin => \LessThan3~19_cout\,
	cout => \LessThan3~21_cout\);

-- Location: LCCOMB_X63_Y50_N22
\LessThan3~23\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan3~23_cout\ = CARRY((n_reg(11) & (current_divisor(11) & !\LessThan3~21_cout\)) # (!n_reg(11) & ((current_divisor(11)) # (!\LessThan3~21_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => n_reg(11),
	datab => current_divisor(11),
	datad => VCC,
	cin => \LessThan3~21_cout\,
	cout => \LessThan3~23_cout\);

-- Location: LCCOMB_X63_Y50_N24
\LessThan3~25\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan3~25_cout\ = CARRY((current_divisor(12) & (n_reg(12) & !\LessThan3~23_cout\)) # (!current_divisor(12) & ((n_reg(12)) # (!\LessThan3~23_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => current_divisor(12),
	datab => n_reg(12),
	datad => VCC,
	cin => \LessThan3~23_cout\,
	cout => \LessThan3~25_cout\);

-- Location: LCCOMB_X63_Y50_N26
\LessThan3~27\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan3~27_cout\ = CARRY((current_divisor(13) & ((!\LessThan3~25_cout\) # (!n_reg(13)))) # (!current_divisor(13) & (!n_reg(13) & !\LessThan3~25_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => current_divisor(13),
	datab => n_reg(13),
	datad => VCC,
	cin => \LessThan3~25_cout\,
	cout => \LessThan3~27_cout\);

-- Location: LCCOMB_X63_Y50_N28
\LessThan3~29\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan3~29_cout\ = CARRY((current_divisor(14) & (n_reg(14) & !\LessThan3~27_cout\)) # (!current_divisor(14) & ((n_reg(14)) # (!\LessThan3~27_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => current_divisor(14),
	datab => n_reg(14),
	datad => VCC,
	cin => \LessThan3~27_cout\,
	cout => \LessThan3~29_cout\);

-- Location: LCCOMB_X63_Y50_N30
\LessThan3~30\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan3~30_combout\ = (current_divisor(15) & (\LessThan3~29_cout\ & n_reg(15))) # (!current_divisor(15) & ((\LessThan3~29_cout\) # (n_reg(15))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001100110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => current_divisor(15),
	datad => n_reg(15),
	cin => \LessThan3~29_cout\,
	combout => \LessThan3~30_combout\);

-- Location: LCCOMB_X66_Y50_N18
\current_divisor~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \current_divisor~2_combout\ = (\state.COMPUTING~q\ & (!\check_done~q\ & ((n_reg(1)) # (!\Equal0~4_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \state.COMPUTING~q\,
	datab => n_reg(1),
	datac => \Equal0~4_combout\,
	datad => \check_done~q\,
	combout => \current_divisor~2_combout\);

-- Location: LCCOMB_X66_Y50_N22
\current_divisor~14\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \current_divisor~14_combout\ = (n_reg(0) & (\Equal1~4_combout\ & (!current_divisor(0) & \current_divisor~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => n_reg(0),
	datab => \Equal1~4_combout\,
	datac => current_divisor(0),
	datad => \current_divisor~2_combout\,
	combout => \current_divisor~14_combout\);

-- Location: LCCOMB_X65_Y50_N20
\current_divisor~13\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \current_divisor~13_combout\ = (!\start_check~q\ & ((current_divisor(0)) # ((\LessThan3~30_combout\ & \current_divisor~14_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan3~30_combout\,
	datab => \start_check~q\,
	datac => current_divisor(0),
	datad => \current_divisor~14_combout\,
	combout => \current_divisor~13_combout\);

-- Location: FF_X65_Y50_N21
\current_divisor[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \MAX10_CLK1_50~inputclkctrl_outclk\,
	d => \current_divisor~13_combout\,
	ena => \state.WAIT_HIGH~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => current_divisor(0));

-- Location: LCCOMB_X61_Y50_N0
\Add3~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add3~0_combout\ = current_divisor(1) $ (VCC)
-- \Add3~1\ = CARRY(current_divisor(1))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => current_divisor(1),
	datad => VCC,
	combout => \Add3~0_combout\,
	cout => \Add3~1\);

-- Location: LCCOMB_X65_Y50_N2
\current_divisor~12\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \current_divisor~12_combout\ = (\start_check~q\) # ((\Equal1~4_combout\ & (!current_divisor(0))) # (!\Equal1~4_combout\ & ((\Add3~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110111111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => current_divisor(0),
	datab => \start_check~q\,
	datac => \Add3~0_combout\,
	datad => \Equal1~4_combout\,
	combout => \current_divisor~12_combout\);

-- Location: FF_X64_Y50_N25
\current_divisor[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \MAX10_CLK1_50~inputclkctrl_outclk\,
	asdata => \current_divisor~12_combout\,
	sload => VCC,
	ena => \current_divisor[15]~10_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => current_divisor(1));

-- Location: LCCOMB_X61_Y50_N2
\Add3~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add3~2_combout\ = (current_divisor(2) & (!\Add3~1\)) # (!current_divisor(2) & ((\Add3~1\) # (GND)))
-- \Add3~3\ = CARRY((!\Add3~1\) # (!current_divisor(2)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => current_divisor(2),
	datad => VCC,
	cin => \Add3~1\,
	combout => \Add3~2_combout\,
	cout => \Add3~3\);

-- Location: LCCOMB_X65_Y50_N18
\current_divisor~11\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \current_divisor~11_combout\ = (!\start_check~q\ & ((\Equal1~4_combout\ & ((current_divisor(0)))) # (!\Equal1~4_combout\ & (\Add3~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000001000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \start_check~q\,
	datab => \Add3~2_combout\,
	datac => current_divisor(0),
	datad => \Equal1~4_combout\,
	combout => \current_divisor~11_combout\);

-- Location: FF_X65_Y50_N19
\current_divisor[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \MAX10_CLK1_50~inputclkctrl_outclk\,
	d => \current_divisor~11_combout\,
	ena => \current_divisor[15]~10_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => current_divisor(2));

-- Location: LCCOMB_X61_Y50_N4
\Add3~4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add3~4_combout\ = (current_divisor(3) & (\Add3~3\ $ (GND))) # (!current_divisor(3) & (!\Add3~3\ & VCC))
-- \Add3~5\ = CARRY((current_divisor(3) & !\Add3~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => current_divisor(3),
	datad => VCC,
	cin => \Add3~3\,
	combout => \Add3~4_combout\,
	cout => \Add3~5\);

-- Location: LCCOMB_X65_Y50_N0
\Add3~24\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add3~24_combout\ = (!\start_check~q\ & (\Add3~4_combout\ & !\Equal1~4_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \start_check~q\,
	datac => \Add3~4_combout\,
	datad => \Equal1~4_combout\,
	combout => \Add3~24_combout\);

-- Location: FF_X65_Y50_N1
\current_divisor[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \MAX10_CLK1_50~inputclkctrl_outclk\,
	d => \Add3~24_combout\,
	ena => \current_divisor[15]~10_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => current_divisor(3));

-- Location: LCCOMB_X61_Y50_N6
\Add3~6\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add3~6_combout\ = (current_divisor(4) & (!\Add3~5\)) # (!current_divisor(4) & ((\Add3~5\) # (GND)))
-- \Add3~7\ = CARRY((!\Add3~5\) # (!current_divisor(4)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => current_divisor(4),
	datad => VCC,
	cin => \Add3~5\,
	combout => \Add3~6_combout\,
	cout => \Add3~7\);

-- Location: LCCOMB_X65_Y50_N30
\Add3~23\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add3~23_combout\ = (\Add3~6_combout\ & (!\start_check~q\ & !\Equal1~4_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add3~6_combout\,
	datac => \start_check~q\,
	datad => \Equal1~4_combout\,
	combout => \Add3~23_combout\);

-- Location: FF_X65_Y50_N31
\current_divisor[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \MAX10_CLK1_50~inputclkctrl_outclk\,
	d => \Add3~23_combout\,
	ena => \current_divisor[15]~10_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => current_divisor(4));

-- Location: LCCOMB_X61_Y50_N8
\Add3~8\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add3~8_combout\ = (current_divisor(5) & (\Add3~7\ $ (GND))) # (!current_divisor(5) & (!\Add3~7\ & VCC))
-- \Add3~9\ = CARRY((current_divisor(5) & !\Add3~7\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => current_divisor(5),
	datad => VCC,
	cin => \Add3~7\,
	combout => \Add3~8_combout\,
	cout => \Add3~9\);

-- Location: LCCOMB_X65_Y50_N12
\Add3~22\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add3~22_combout\ = (!\start_check~q\ & (\Add3~8_combout\ & !\Equal1~4_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \start_check~q\,
	datac => \Add3~8_combout\,
	datad => \Equal1~4_combout\,
	combout => \Add3~22_combout\);

-- Location: FF_X65_Y50_N13
\current_divisor[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \MAX10_CLK1_50~inputclkctrl_outclk\,
	d => \Add3~22_combout\,
	ena => \current_divisor[15]~10_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => current_divisor(5));

-- Location: LCCOMB_X61_Y50_N10
\Add3~10\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add3~10_combout\ = (current_divisor(6) & (!\Add3~9\)) # (!current_divisor(6) & ((\Add3~9\) # (GND)))
-- \Add3~11\ = CARRY((!\Add3~9\) # (!current_divisor(6)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => current_divisor(6),
	datad => VCC,
	cin => \Add3~9\,
	combout => \Add3~10_combout\,
	cout => \Add3~11\);

-- Location: LCCOMB_X64_Y50_N14
\Add3~21\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add3~21_combout\ = (!\start_check~q\ & (\Add3~10_combout\ & !\Equal1~4_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \start_check~q\,
	datac => \Add3~10_combout\,
	datad => \Equal1~4_combout\,
	combout => \Add3~21_combout\);

-- Location: FF_X64_Y50_N15
\current_divisor[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \MAX10_CLK1_50~inputclkctrl_outclk\,
	d => \Add3~21_combout\,
	ena => \current_divisor[15]~10_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => current_divisor(6));

-- Location: LCCOMB_X61_Y50_N12
\Add3~12\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add3~12_combout\ = (current_divisor(7) & (\Add3~11\ $ (GND))) # (!current_divisor(7) & (!\Add3~11\ & VCC))
-- \Add3~13\ = CARRY((current_divisor(7) & !\Add3~11\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => current_divisor(7),
	datad => VCC,
	cin => \Add3~11\,
	combout => \Add3~12_combout\,
	cout => \Add3~13\);

-- Location: LCCOMB_X64_Y50_N20
\Add3~20\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add3~20_combout\ = (!\start_check~q\ & (\Add3~12_combout\ & !\Equal1~4_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \start_check~q\,
	datac => \Add3~12_combout\,
	datad => \Equal1~4_combout\,
	combout => \Add3~20_combout\);

-- Location: FF_X64_Y50_N21
\current_divisor[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \MAX10_CLK1_50~inputclkctrl_outclk\,
	d => \Add3~20_combout\,
	ena => \current_divisor[15]~10_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => current_divisor(7));

-- Location: LCCOMB_X61_Y50_N14
\Add3~14\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add3~14_combout\ = (current_divisor(8) & (!\Add3~13\)) # (!current_divisor(8) & ((\Add3~13\) # (GND)))
-- \Add3~15\ = CARRY((!\Add3~13\) # (!current_divisor(8)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => current_divisor(8),
	datad => VCC,
	cin => \Add3~13\,
	combout => \Add3~14_combout\,
	cout => \Add3~15\);

-- Location: LCCOMB_X64_Y50_N10
\Add3~19\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add3~19_combout\ = (!\Equal1~4_combout\ & (\Add3~14_combout\ & !\start_check~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal1~4_combout\,
	datac => \Add3~14_combout\,
	datad => \start_check~q\,
	combout => \Add3~19_combout\);

-- Location: FF_X64_Y50_N11
\current_divisor[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \MAX10_CLK1_50~inputclkctrl_outclk\,
	d => \Add3~19_combout\,
	ena => \current_divisor[15]~10_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => current_divisor(8));

-- Location: LCCOMB_X61_Y50_N16
\Add3~16\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add3~16_combout\ = (current_divisor(9) & (\Add3~15\ $ (GND))) # (!current_divisor(9) & (!\Add3~15\ & VCC))
-- \Add3~17\ = CARRY((current_divisor(9) & !\Add3~15\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => current_divisor(9),
	datad => VCC,
	cin => \Add3~15\,
	combout => \Add3~16_combout\,
	cout => \Add3~17\);

-- Location: LCCOMB_X64_Y50_N28
\Add3~18\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add3~18_combout\ = (!\start_check~q\ & (!\Equal1~4_combout\ & \Add3~16_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \start_check~q\,
	datac => \Equal1~4_combout\,
	datad => \Add3~16_combout\,
	combout => \Add3~18_combout\);

-- Location: FF_X64_Y50_N29
\current_divisor[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \MAX10_CLK1_50~inputclkctrl_outclk\,
	d => \Add3~18_combout\,
	ena => \current_divisor[15]~10_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => current_divisor(9));

-- Location: LCCOMB_X61_Y50_N18
\Add3~25\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add3~25_combout\ = (current_divisor(10) & (!\Add3~17\)) # (!current_divisor(10) & ((\Add3~17\) # (GND)))
-- \Add3~26\ = CARRY((!\Add3~17\) # (!current_divisor(10)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => current_divisor(10),
	datad => VCC,
	cin => \Add3~17\,
	combout => \Add3~25_combout\,
	cout => \Add3~26\);

-- Location: LCCOMB_X64_Y50_N18
\Add3~27\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add3~27_combout\ = (!\start_check~q\ & (!\Equal1~4_combout\ & \Add3~25_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \start_check~q\,
	datac => \Equal1~4_combout\,
	datad => \Add3~25_combout\,
	combout => \Add3~27_combout\);

-- Location: FF_X64_Y50_N19
\current_divisor[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \MAX10_CLK1_50~inputclkctrl_outclk\,
	d => \Add3~27_combout\,
	ena => \current_divisor[15]~10_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => current_divisor(10));

-- Location: LCCOMB_X64_Y50_N12
\Add3~30\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add3~30_combout\ = (!\start_check~q\ & (\Add3~28_combout\ & !\Equal1~4_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \start_check~q\,
	datac => \Add3~28_combout\,
	datad => \Equal1~4_combout\,
	combout => \Add3~30_combout\);

-- Location: FF_X64_Y50_N13
\current_divisor[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \MAX10_CLK1_50~inputclkctrl_outclk\,
	d => \Add3~30_combout\,
	ena => \current_divisor[15]~10_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => current_divisor(11));

-- Location: LCCOMB_X64_Y50_N8
\Equal1~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Equal1~2_combout\ = (!current_divisor(11) & (current_divisor(1) & (!current_divisor(12) & !current_divisor(10))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => current_divisor(11),
	datab => current_divisor(1),
	datac => current_divisor(12),
	datad => current_divisor(10),
	combout => \Equal1~2_combout\);

-- Location: LCCOMB_X65_Y50_N16
\Equal1~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Equal1~1_combout\ = (!current_divisor(5) & (!current_divisor(2) & (!current_divisor(4) & !current_divisor(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => current_divisor(5),
	datab => current_divisor(2),
	datac => current_divisor(4),
	datad => current_divisor(3),
	combout => \Equal1~1_combout\);

-- Location: LCCOMB_X64_Y50_N16
\Equal1~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Equal1~0_combout\ = (!current_divisor(8) & (!current_divisor(9) & (!current_divisor(6) & !current_divisor(7))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => current_divisor(8),
	datab => current_divisor(9),
	datac => current_divisor(6),
	datad => current_divisor(7),
	combout => \Equal1~0_combout\);

-- Location: LCCOMB_X65_Y50_N24
\Equal1~3\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Equal1~3_combout\ = (!current_divisor(15) & (!current_divisor(14) & !current_divisor(13)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => current_divisor(15),
	datac => current_divisor(14),
	datad => current_divisor(13),
	combout => \Equal1~3_combout\);

-- Location: LCCOMB_X65_Y50_N6
\Equal1~4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Equal1~4_combout\ = (\Equal1~2_combout\ & (\Equal1~1_combout\ & (\Equal1~0_combout\ & \Equal1~3_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal1~2_combout\,
	datab => \Equal1~1_combout\,
	datac => \Equal1~0_combout\,
	datad => \Equal1~3_combout\,
	combout => \Equal1~4_combout\);

-- Location: LCCOMB_X66_Y50_N14
\check_done~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \check_done~0_combout\ = (\Equal0~4_combout\) # ((!n_reg(0) & (\Equal1~4_combout\ & !current_divisor(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => n_reg(0),
	datab => \Equal1~4_combout\,
	datac => \Equal0~4_combout\,
	datad => current_divisor(0),
	combout => \check_done~0_combout\);

-- Location: LCCOMB_X66_Y50_N26
\is_prime~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \is_prime~2_combout\ = (n_reg(0) & (n_reg(3) & (n_reg(1) $ (!n_reg(2))))) # (!n_reg(0) & (n_reg(2) & (n_reg(3) $ (n_reg(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001010000001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => n_reg(0),
	datab => n_reg(3),
	datac => n_reg(1),
	datad => n_reg(2),
	combout => \is_prime~2_combout\);

-- Location: LCCOMB_X65_Y50_N28
\Equal0~5\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Equal0~5_combout\ = (\Equal0~0_combout\ & (\Equal0~2_combout\ & \Equal0~1_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal0~0_combout\,
	datac => \Equal0~2_combout\,
	datad => \Equal0~1_combout\,
	combout => \Equal0~5_combout\);

-- Location: LCCOMB_X66_Y50_N4
\is_prime~3\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \is_prime~3_combout\ = (\is_prime~2_combout\ & (\Equal1~4_combout\ & (current_divisor(0) & \Equal0~5_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \is_prime~2_combout\,
	datab => \Equal1~4_combout\,
	datac => current_divisor(0),
	datad => \Equal0~5_combout\,
	combout => \is_prime~3_combout\);

-- Location: LCCOMB_X66_Y50_N16
\check_done~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \check_done~1_combout\ = (\LessThan3~30_combout\ & ((\Equal1~5_combout\) # ((!\current_divisor[5]~6_combout\ & !\is_prime~3_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \current_divisor[5]~6_combout\,
	datab => \is_prime~3_combout\,
	datac => \Equal1~5_combout\,
	datad => \LessThan3~30_combout\,
	combout => \check_done~1_combout\);

-- Location: LCCOMB_X66_Y50_N6
\check_done~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \check_done~2_combout\ = (\check_done~1_combout\ & (((n_reg(0) & n_reg(1))) # (!\check_done~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => n_reg(0),
	datab => n_reg(1),
	datac => \check_done~0_combout\,
	datad => \check_done~1_combout\,
	combout => \check_done~2_combout\);

-- Location: LCCOMB_X66_Y50_N24
\check_done~3\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \check_done~3_combout\ = (!\start_check~q\ & ((\check_done~q\) # ((\state.COMPUTING~q\ & !\check_done~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000001010100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \start_check~q\,
	datab => \state.COMPUTING~q\,
	datac => \check_done~q\,
	datad => \check_done~2_combout\,
	combout => \check_done~3_combout\);

-- Location: FF_X66_Y50_N25
check_done : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \MAX10_CLK1_50~inputclkctrl_outclk\,
	d => \check_done~3_combout\,
	sclr => \ALT_INV_state.WAIT_HIGH~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \check_done~q\);

-- Location: LCCOMB_X67_Y50_N22
\Selector2~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Selector2~1_combout\ = (\Selector2~0_combout\ & (((!\state.COMPUTING~q\)) # (!\check_done~q\))) # (!\Selector2~0_combout\ & (\Selector3~1_combout\ & ((!\state.COMPUTING~q\) # (!\check_done~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011111100101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Selector2~0_combout\,
	datab => \check_done~q\,
	datac => \state.COMPUTING~q\,
	datad => \Selector3~1_combout\,
	combout => \Selector2~1_combout\);

-- Location: FF_X67_Y50_N23
\state.COMPUTING\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \MAX10_CLK1_50~inputclkctrl_outclk\,
	d => \Selector2~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \state.COMPUTING~q\);

-- Location: LCCOMB_X67_Y50_N28
\Selector3~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Selector3~2_combout\ = (\state.COMPUTING~q\ & ((\check_done~q\) # ((!\key0_pressed~q\ & \state.SHOW_RESULT~q\)))) # (!\state.COMPUTING~q\ & (!\key0_pressed~q\ & (\state.SHOW_RESULT~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \state.COMPUTING~q\,
	datab => \key0_pressed~q\,
	datac => \state.SHOW_RESULT~q\,
	datad => \check_done~q\,
	combout => \Selector3~2_combout\);

-- Location: FF_X67_Y50_N29
\state.SHOW_RESULT\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \MAX10_CLK1_50~inputclkctrl_outclk\,
	d => \Selector3~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \state.SHOW_RESULT~q\);

-- Location: LCCOMB_X67_Y50_N30
\state.WAIT_HIGH~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \state.WAIT_HIGH~0_combout\ = (\key0_pressed~q\ & ((!\state.SHOW_RESULT~q\))) # (!\key0_pressed~q\ & (\state.WAIT_HIGH~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000011111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \key0_pressed~q\,
	datac => \state.WAIT_HIGH~q\,
	datad => \state.SHOW_RESULT~q\,
	combout => \state.WAIT_HIGH~0_combout\);

-- Location: FF_X67_Y50_N31
\state.WAIT_HIGH\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \MAX10_CLK1_50~inputclkctrl_outclk\,
	d => \state.WAIT_HIGH~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \state.WAIT_HIGH~q\);

-- Location: LCCOMB_X67_Y50_N4
\Selector1~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Selector1~1_combout\ = (\state.WAIT_LOW~q\ & ((\state.COMPUTING~q\ & ((!\check_done~q\))) # (!\state.COMPUTING~q\ & (!\key1_pressed~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011010100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \key1_pressed~q\,
	datab => \check_done~q\,
	datac => \state.COMPUTING~q\,
	datad => \state.WAIT_LOW~q\,
	combout => \Selector1~1_combout\);

-- Location: LCCOMB_X67_Y50_N20
\Selector1~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Selector1~2_combout\ = (\key0_pressed~q\ & (!\state.SHOW_RESULT~q\ & ((\Selector1~1_combout\) # (!\state.WAIT_HIGH~q\)))) # (!\key0_pressed~q\ & (((\Selector1~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000011110100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \state.WAIT_HIGH~q\,
	datab => \key0_pressed~q\,
	datac => \Selector1~1_combout\,
	datad => \state.SHOW_RESULT~q\,
	combout => \Selector1~2_combout\);

-- Location: FF_X67_Y50_N21
\state.WAIT_LOW\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \MAX10_CLK1_50~inputclkctrl_outclk\,
	d => \Selector1~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \state.WAIT_LOW~q\);

-- Location: LCCOMB_X67_Y50_N18
\Selector3~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Selector3~1_combout\ = (\key1_pressed~q\ & \state.WAIT_LOW~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \key1_pressed~q\,
	datad => \state.WAIT_LOW~q\,
	combout => \Selector3~1_combout\);

-- Location: FF_X62_Y50_N27
\data_full[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \MAX10_CLK1_50~inputclkctrl_outclk\,
	d => \data_full[1]~feeder_combout\,
	ena => \Selector3~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => data_full(1));

-- Location: LCCOMB_X62_Y50_N12
\Mux55~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux55~0_combout\ = (data_full(2) & (!data_full(1) & (data_full(3) $ (!data_full(0))))) # (!data_full(2) & (data_full(0) & (data_full(1) $ (!data_full(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110000100000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => data_full(1),
	datab => data_full(2),
	datac => data_full(3),
	datad => data_full(0),
	combout => \Mux55~0_combout\);

-- Location: LCCOMB_X65_Y52_N0
\Selector25~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Selector25~0_combout\ = (!\state.COMPUTING~q\ & !\state.WAIT_LOW~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \state.COMPUTING~q\,
	datad => \state.WAIT_LOW~q\,
	combout => \Selector25~0_combout\);

-- Location: LCCOMB_X62_Y52_N20
\Mux13~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux13~0_combout\ = (\SW[2]~input_o\ & (!\SW[1]~input_o\ & (\SW[0]~input_o\ $ (!\SW[3]~input_o\)))) # (!\SW[2]~input_o\ & (\SW[0]~input_o\ & (\SW[3]~input_o\ $ (!\SW[1]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010000010000110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW[0]~input_o\,
	datab => \SW[2]~input_o\,
	datac => \SW[3]~input_o\,
	datad => \SW[1]~input_o\,
	combout => \Mux13~0_combout\);

-- Location: LCCOMB_X62_Y50_N22
\Selector25~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Selector25~1_combout\ = (\state.SHOW_RESULT~q\ & (\Mux55~0_combout\)) # (!\state.SHOW_RESULT~q\ & (((\Mux13~0_combout\) # (!\Selector25~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101110001011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux55~0_combout\,
	datab => \state.SHOW_RESULT~q\,
	datac => \Selector25~0_combout\,
	datad => \Mux13~0_combout\,
	combout => \Selector25~1_combout\);

-- Location: LCCOMB_X62_Y50_N10
\Mux12~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux12~0_combout\ = (\SW[3]~input_o\ & ((\SW[0]~input_o\ & ((\SW[1]~input_o\))) # (!\SW[0]~input_o\ & (\SW[2]~input_o\)))) # (!\SW[3]~input_o\ & (\SW[2]~input_o\ & (\SW[0]~input_o\ $ (\SW[1]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110010001001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW[0]~input_o\,
	datab => \SW[2]~input_o\,
	datac => \SW[3]~input_o\,
	datad => \SW[1]~input_o\,
	combout => \Mux12~0_combout\);

-- Location: LCCOMB_X62_Y50_N8
\Mux54~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux54~0_combout\ = (data_full(1) & ((data_full(0) & ((data_full(3)))) # (!data_full(0) & (data_full(2))))) # (!data_full(1) & (data_full(2) & (data_full(3) $ (data_full(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010011001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => data_full(1),
	datab => data_full(2),
	datac => data_full(3),
	datad => data_full(0),
	combout => \Mux54~0_combout\);

-- Location: LCCOMB_X62_Y50_N18
\Selector24~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Selector24~0_combout\ = (\state.SHOW_RESULT~q\ & (((\Mux54~0_combout\)))) # (!\state.SHOW_RESULT~q\ & ((\Mux12~0_combout\) # ((!\Selector25~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110010101111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux12~0_combout\,
	datab => \Mux54~0_combout\,
	datac => \Selector25~0_combout\,
	datad => \state.SHOW_RESULT~q\,
	combout => \Selector24~0_combout\);

-- Location: LCCOMB_X62_Y50_N28
\Mux53~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux53~0_combout\ = (data_full(2) & (data_full(3) & ((data_full(1)) # (!data_full(0))))) # (!data_full(2) & (data_full(1) & (!data_full(3) & !data_full(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000011000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => data_full(1),
	datab => data_full(2),
	datac => data_full(3),
	datad => data_full(0),
	combout => \Mux53~0_combout\);

-- Location: LCCOMB_X62_Y50_N4
\Mux11~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux11~0_combout\ = (\SW[3]~input_o\ & (\SW[2]~input_o\ & ((\SW[1]~input_o\) # (!\SW[0]~input_o\)))) # (!\SW[3]~input_o\ & (!\SW[2]~input_o\ & (!\SW[0]~input_o\ & \SW[1]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100100001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW[3]~input_o\,
	datab => \SW[2]~input_o\,
	datac => \SW[0]~input_o\,
	datad => \SW[1]~input_o\,
	combout => \Mux11~0_combout\);

-- Location: LCCOMB_X62_Y50_N6
\Selector23~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Selector23~0_combout\ = (\state.SHOW_RESULT~q\ & (((\Mux53~0_combout\)))) # (!\state.SHOW_RESULT~q\ & (((\Mux11~0_combout\)) # (!\Selector25~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Selector25~0_combout\,
	datab => \Mux53~0_combout\,
	datac => \Mux11~0_combout\,
	datad => \state.SHOW_RESULT~q\,
	combout => \Selector23~0_combout\);

-- Location: LCCOMB_X62_Y52_N26
\Mux10~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux10~0_combout\ = (\SW[1]~input_o\ & ((\SW[0]~input_o\ & (\SW[2]~input_o\)) # (!\SW[0]~input_o\ & (!\SW[2]~input_o\ & \SW[3]~input_o\)))) # (!\SW[1]~input_o\ & (!\SW[3]~input_o\ & (\SW[0]~input_o\ $ (\SW[2]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001100000000110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW[0]~input_o\,
	datab => \SW[2]~input_o\,
	datac => \SW[3]~input_o\,
	datad => \SW[1]~input_o\,
	combout => \Mux10~0_combout\);

-- Location: LCCOMB_X62_Y50_N20
\Mux52~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux52~0_combout\ = (data_full(1) & ((data_full(2) & ((data_full(0)))) # (!data_full(2) & (data_full(3) & !data_full(0))))) # (!data_full(1) & (!data_full(3) & (data_full(2) $ (data_full(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100100100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => data_full(1),
	datab => data_full(2),
	datac => data_full(3),
	datad => data_full(0),
	combout => \Mux52~0_combout\);

-- Location: LCCOMB_X62_Y53_N24
\Selector22~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Selector22~0_combout\ = (\state.SHOW_RESULT~q\ & (((\Mux52~0_combout\)))) # (!\state.SHOW_RESULT~q\ & (((\Mux10~0_combout\)) # (!\Selector25~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011011101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Selector25~0_combout\,
	datab => \Mux10~0_combout\,
	datac => \Mux52~0_combout\,
	datad => \state.SHOW_RESULT~q\,
	combout => \Selector22~0_combout\);

-- Location: LCCOMB_X62_Y52_N28
\Mux9~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux9~0_combout\ = (\SW[1]~input_o\ & (\SW[0]~input_o\ & (!\SW[3]~input_o\))) # (!\SW[1]~input_o\ & ((\SW[2]~input_o\ & ((!\SW[3]~input_o\))) # (!\SW[2]~input_o\ & (\SW[0]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101100101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW[0]~input_o\,
	datab => \SW[1]~input_o\,
	datac => \SW[3]~input_o\,
	datad => \SW[2]~input_o\,
	combout => \Mux9~0_combout\);

-- Location: LCCOMB_X62_Y50_N2
\Mux51~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux51~0_combout\ = (data_full(1) & (((!data_full(3) & data_full(0))))) # (!data_full(1) & ((data_full(2) & (!data_full(3))) # (!data_full(2) & ((data_full(0))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001111100000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => data_full(1),
	datab => data_full(2),
	datac => data_full(3),
	datad => data_full(0),
	combout => \Mux51~0_combout\);

-- Location: LCCOMB_X62_Y50_N24
\Selector21~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Selector21~0_combout\ = (\state.SHOW_RESULT~q\ & (((\Mux51~0_combout\)))) # (!\state.SHOW_RESULT~q\ & ((\Mux9~0_combout\) # ((!\Selector25~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111100100011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux9~0_combout\,
	datab => \state.SHOW_RESULT~q\,
	datac => \Selector25~0_combout\,
	datad => \Mux51~0_combout\,
	combout => \Selector21~0_combout\);

-- Location: LCCOMB_X62_Y52_N18
\Mux8~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux8~0_combout\ = (\SW[0]~input_o\ & (\SW[3]~input_o\ $ (((\SW[1]~input_o\) # (!\SW[2]~input_o\))))) # (!\SW[0]~input_o\ & (\SW[1]~input_o\ & (!\SW[3]~input_o\ & !\SW[2]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010100000001110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW[0]~input_o\,
	datab => \SW[1]~input_o\,
	datac => \SW[3]~input_o\,
	datad => \SW[2]~input_o\,
	combout => \Mux8~0_combout\);

-- Location: LCCOMB_X62_Y50_N30
\Mux50~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux50~0_combout\ = (data_full(1) & (!data_full(3) & ((data_full(0)) # (!data_full(2))))) # (!data_full(1) & (data_full(0) & (data_full(2) $ (!data_full(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100101100000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => data_full(1),
	datab => data_full(2),
	datac => data_full(3),
	datad => data_full(0),
	combout => \Mux50~0_combout\);

-- Location: LCCOMB_X62_Y50_N0
\Selector20~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Selector20~0_combout\ = (\state.SHOW_RESULT~q\ & (((\Mux50~0_combout\)))) # (!\state.SHOW_RESULT~q\ & (((\Mux8~0_combout\)) # (!\Selector25~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011011101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Selector25~0_combout\,
	datab => \Mux8~0_combout\,
	datac => \Mux50~0_combout\,
	datad => \state.SHOW_RESULT~q\,
	combout => \Selector20~0_combout\);

-- Location: LCCOMB_X62_Y52_N4
\Mux7~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux7~0_combout\ = (\SW[0]~input_o\ & ((\SW[3]~input_o\) # (\SW[2]~input_o\ $ (\SW[1]~input_o\)))) # (!\SW[0]~input_o\ & ((\SW[1]~input_o\) # (\SW[2]~input_o\ $ (\SW[3]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111011110111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW[0]~input_o\,
	datab => \SW[2]~input_o\,
	datac => \SW[3]~input_o\,
	datad => \SW[1]~input_o\,
	combout => \Mux7~0_combout\);

-- Location: LCCOMB_X62_Y50_N14
\Mux49~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux49~0_combout\ = (data_full(0) & ((data_full(3)) # (data_full(1) $ (data_full(2))))) # (!data_full(0) & ((data_full(1)) # (data_full(2) $ (data_full(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111011010111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => data_full(1),
	datab => data_full(2),
	datac => data_full(3),
	datad => data_full(0),
	combout => \Mux49~0_combout\);

-- Location: LCCOMB_X65_Y52_N26
\Selector19~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Selector19~0_combout\ = (\state.SHOW_RESULT~q\ & (((!\Mux49~0_combout\)))) # (!\state.SHOW_RESULT~q\ & (((!\Mux7~0_combout\)) # (!\Selector25~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001010110111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \state.SHOW_RESULT~q\,
	datab => \Selector25~0_combout\,
	datac => \Mux7~0_combout\,
	datad => \Mux49~0_combout\,
	combout => \Selector19~0_combout\);

-- Location: LCCOMB_X65_Y52_N10
\Mux48~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux48~0_combout\ = (data_full(7) & (data_full(4) & (data_full(6) $ (data_full(5))))) # (!data_full(7) & (!data_full(5) & (data_full(6) $ (data_full(4)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010000010010100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => data_full(7),
	datab => data_full(6),
	datac => data_full(4),
	datad => data_full(5),
	combout => \Mux48~0_combout\);

-- Location: LCCOMB_X64_Y52_N20
\Mux6~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux6~0_combout\ = (\SW[6]~input_o\ & (!\SW[5]~input_o\ & (\SW[4]~input_o\ $ (!\SW[7]~input_o\)))) # (!\SW[6]~input_o\ & (\SW[4]~input_o\ & (\SW[5]~input_o\ $ (!\SW[7]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010100000000110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW[4]~input_o\,
	datab => \SW[6]~input_o\,
	datac => \SW[5]~input_o\,
	datad => \SW[7]~input_o\,
	combout => \Mux6~0_combout\);

-- Location: LCCOMB_X62_Y52_N22
\Mux27~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux27~0_combout\ = (data_high(2) & (!data_high(1) & (data_high(3) $ (!data_high(0))))) # (!data_high(2) & (data_high(0) & (data_high(3) $ (!data_high(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100000010010010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => data_high(2),
	datab => data_high(3),
	datac => data_high(0),
	datad => data_high(1),
	combout => \Mux27~0_combout\);

-- Location: LCCOMB_X65_Y52_N20
\Selector18~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Selector18~0_combout\ = (!\state.SHOW_RESULT~q\ & ((\state.WAIT_LOW~q\ & ((\Mux27~0_combout\))) # (!\state.WAIT_LOW~q\ & (\Mux6~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000001000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \state.SHOW_RESULT~q\,
	datab => \Mux6~0_combout\,
	datac => \Mux27~0_combout\,
	datad => \state.WAIT_LOW~q\,
	combout => \Selector18~0_combout\);

-- Location: LCCOMB_X65_Y52_N16
\Selector18~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Selector18~1_combout\ = (\Selector18~0_combout\) # ((\state.SHOW_RESULT~q\ & (\Mux48~0_combout\)) # (!\state.SHOW_RESULT~q\ & ((\state.COMPUTING~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111011111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux48~0_combout\,
	datab => \Selector18~0_combout\,
	datac => \state.COMPUTING~q\,
	datad => \state.SHOW_RESULT~q\,
	combout => \Selector18~1_combout\);

-- Location: LCCOMB_X65_Y52_N12
\Mux47~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux47~0_combout\ = (data_full(7) & ((data_full(4) & ((data_full(5)))) # (!data_full(4) & (data_full(6))))) # (!data_full(7) & (data_full(6) & (data_full(4) $ (data_full(5)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010110001001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => data_full(7),
	datab => data_full(6),
	datac => data_full(4),
	datad => data_full(5),
	combout => \Mux47~0_combout\);

-- Location: LCCOMB_X64_Y52_N6
\Mux5~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux5~0_combout\ = (\SW[5]~input_o\ & ((\SW[4]~input_o\ & ((\SW[7]~input_o\))) # (!\SW[4]~input_o\ & (\SW[6]~input_o\)))) # (!\SW[5]~input_o\ & (\SW[6]~input_o\ & (\SW[4]~input_o\ $ (\SW[7]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110010001001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW[4]~input_o\,
	datab => \SW[6]~input_o\,
	datac => \SW[5]~input_o\,
	datad => \SW[7]~input_o\,
	combout => \Mux5~0_combout\);

-- Location: LCCOMB_X62_Y52_N0
\Mux26~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux26~0_combout\ = (data_high(3) & ((data_high(0) & ((data_high(1)))) # (!data_high(0) & (data_high(2))))) # (!data_high(3) & (data_high(2) & (data_high(0) $ (data_high(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100101000101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => data_high(2),
	datab => data_high(3),
	datac => data_high(0),
	datad => data_high(1),
	combout => \Mux26~0_combout\);

-- Location: LCCOMB_X65_Y52_N18
\Selector17~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Selector17~0_combout\ = (!\state.SHOW_RESULT~q\ & ((\state.WAIT_LOW~q\ & ((\Mux26~0_combout\))) # (!\state.WAIT_LOW~q\ & (\Mux5~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \state.WAIT_LOW~q\,
	datab => \Mux5~0_combout\,
	datac => \Mux26~0_combout\,
	datad => \state.SHOW_RESULT~q\,
	combout => \Selector17~0_combout\);

-- Location: LCCOMB_X65_Y52_N6
\Selector17~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Selector17~1_combout\ = (\Selector17~0_combout\) # ((\state.SHOW_RESULT~q\ & (\Mux47~0_combout\)) # (!\state.SHOW_RESULT~q\ & ((\state.COMPUTING~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111011111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux47~0_combout\,
	datab => \Selector17~0_combout\,
	datac => \state.COMPUTING~q\,
	datad => \state.SHOW_RESULT~q\,
	combout => \Selector17~1_combout\);

-- Location: LCCOMB_X65_Y52_N22
\Mux46~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux46~0_combout\ = (data_full(7) & (data_full(6) & ((data_full(5)) # (!data_full(4))))) # (!data_full(7) & (!data_full(6) & (!data_full(4) & data_full(5))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100100001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => data_full(7),
	datab => data_full(6),
	datac => data_full(4),
	datad => data_full(5),
	combout => \Mux46~0_combout\);

-- Location: LCCOMB_X62_Y52_N30
\Mux25~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux25~0_combout\ = (data_high(2) & (data_high(3) & ((data_high(1)) # (!data_high(0))))) # (!data_high(2) & (!data_high(3) & (!data_high(0) & data_high(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100100001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => data_high(2),
	datab => data_high(3),
	datac => data_high(0),
	datad => data_high(1),
	combout => \Mux25~0_combout\);

-- Location: LCCOMB_X64_Y52_N16
\Mux4~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux4~0_combout\ = (\SW[6]~input_o\ & (\SW[7]~input_o\ & ((\SW[5]~input_o\) # (!\SW[4]~input_o\)))) # (!\SW[6]~input_o\ & (!\SW[4]~input_o\ & (!\SW[7]~input_o\ & \SW[5]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000101000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW[4]~input_o\,
	datab => \SW[6]~input_o\,
	datac => \SW[7]~input_o\,
	datad => \SW[5]~input_o\,
	combout => \Mux4~0_combout\);

-- Location: LCCOMB_X65_Y52_N24
\Selector16~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Selector16~0_combout\ = (!\state.SHOW_RESULT~q\ & ((\state.WAIT_LOW~q\ & (\Mux25~0_combout\)) # (!\state.WAIT_LOW~q\ & ((\Mux4~0_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \state.WAIT_LOW~q\,
	datab => \Mux25~0_combout\,
	datac => \Mux4~0_combout\,
	datad => \state.SHOW_RESULT~q\,
	combout => \Selector16~0_combout\);

-- Location: LCCOMB_X65_Y52_N28
\Selector16~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Selector16~1_combout\ = (\Selector16~0_combout\) # ((\state.SHOW_RESULT~q\ & (\Mux46~0_combout\)) # (!\state.SHOW_RESULT~q\ & ((\state.COMPUTING~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111011111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux46~0_combout\,
	datab => \Selector16~0_combout\,
	datac => \state.COMPUTING~q\,
	datad => \state.SHOW_RESULT~q\,
	combout => \Selector16~1_combout\);

-- Location: LCCOMB_X63_Y52_N30
\Mux45~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux45~0_combout\ = (data_full(5) & ((data_full(6) & ((data_full(4)))) # (!data_full(6) & (data_full(7) & !data_full(4))))) # (!data_full(5) & (!data_full(7) & (data_full(6) $ (data_full(4)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001000010100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => data_full(7),
	datab => data_full(6),
	datac => data_full(4),
	datad => data_full(5),
	combout => \Mux45~0_combout\);

-- Location: LCCOMB_X62_Y52_N12
\Mux24~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux24~0_combout\ = (data_high(1) & ((data_high(2) & ((data_high(0)))) # (!data_high(2) & (data_high(3) & !data_high(0))))) # (!data_high(1) & (!data_high(3) & (data_high(2) $ (data_high(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010000010010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => data_high(2),
	datab => data_high(3),
	datac => data_high(0),
	datad => data_high(1),
	combout => \Mux24~0_combout\);

-- Location: LCCOMB_X64_Y52_N26
\Mux3~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux3~0_combout\ = (\SW[5]~input_o\ & ((\SW[4]~input_o\ & (\SW[6]~input_o\)) # (!\SW[4]~input_o\ & (!\SW[6]~input_o\ & \SW[7]~input_o\)))) # (!\SW[5]~input_o\ & (!\SW[7]~input_o\ & (\SW[4]~input_o\ $ (\SW[6]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001000010000110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW[4]~input_o\,
	datab => \SW[6]~input_o\,
	datac => \SW[5]~input_o\,
	datad => \SW[7]~input_o\,
	combout => \Mux3~0_combout\);

-- Location: LCCOMB_X63_Y52_N12
\Selector15~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Selector15~0_combout\ = (!\state.SHOW_RESULT~q\ & ((\state.WAIT_LOW~q\ & (\Mux24~0_combout\)) # (!\state.WAIT_LOW~q\ & ((\Mux3~0_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101100001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux24~0_combout\,
	datab => \state.WAIT_LOW~q\,
	datac => \state.SHOW_RESULT~q\,
	datad => \Mux3~0_combout\,
	combout => \Selector15~0_combout\);

-- Location: LCCOMB_X63_Y52_N10
\Selector15~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Selector15~1_combout\ = (\Selector15~0_combout\) # ((\state.SHOW_RESULT~q\ & (\Mux45~0_combout\)) # (!\state.SHOW_RESULT~q\ & ((\state.COMPUTING~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111110111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux45~0_combout\,
	datab => \state.SHOW_RESULT~q\,
	datac => \state.COMPUTING~q\,
	datad => \Selector15~0_combout\,
	combout => \Selector15~1_combout\);

-- Location: LCCOMB_X63_Y52_N28
\Mux44~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux44~0_combout\ = (data_full(5) & (data_full(4) & (!data_full(7)))) # (!data_full(5) & ((data_full(6) & ((!data_full(7)))) # (!data_full(6) & (data_full(4)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010001100101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => data_full(4),
	datab => data_full(7),
	datac => data_full(5),
	datad => data_full(6),
	combout => \Mux44~0_combout\);

-- Location: LCCOMB_X62_Y52_N2
\Mux23~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux23~0_combout\ = (data_high(1) & (((!data_high(3) & data_high(0))))) # (!data_high(1) & ((data_high(2) & (!data_high(3))) # (!data_high(2) & ((data_high(0))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000001110010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => data_high(2),
	datab => data_high(3),
	datac => data_high(0),
	datad => data_high(1),
	combout => \Mux23~0_combout\);

-- Location: LCCOMB_X64_Y52_N4
\Mux2~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux2~0_combout\ = (\SW[5]~input_o\ & (\SW[4]~input_o\ & ((!\SW[7]~input_o\)))) # (!\SW[5]~input_o\ & ((\SW[6]~input_o\ & ((!\SW[7]~input_o\))) # (!\SW[6]~input_o\ & (\SW[4]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101000101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW[4]~input_o\,
	datab => \SW[6]~input_o\,
	datac => \SW[7]~input_o\,
	datad => \SW[5]~input_o\,
	combout => \Mux2~0_combout\);

-- Location: LCCOMB_X63_Y52_N20
\Selector14~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Selector14~0_combout\ = (!\state.SHOW_RESULT~q\ & ((\state.WAIT_LOW~q\ & (\Mux23~0_combout\)) # (!\state.WAIT_LOW~q\ & ((\Mux2~0_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101100001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux23~0_combout\,
	datab => \state.WAIT_LOW~q\,
	datac => \state.SHOW_RESULT~q\,
	datad => \Mux2~0_combout\,
	combout => \Selector14~0_combout\);

-- Location: LCCOMB_X63_Y52_N2
\Selector14~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Selector14~1_combout\ = (\Selector14~0_combout\) # ((\state.SHOW_RESULT~q\ & (\Mux44~0_combout\)) # (!\state.SHOW_RESULT~q\ & ((\state.COMPUTING~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111110111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux44~0_combout\,
	datab => \state.SHOW_RESULT~q\,
	datac => \state.COMPUTING~q\,
	datad => \Selector14~0_combout\,
	combout => \Selector14~1_combout\);

-- Location: LCCOMB_X64_Y52_N8
\Mux43~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux43~0_combout\ = (data_full(5) & (!data_full(7) & ((data_full(4)) # (!data_full(6))))) # (!data_full(5) & (data_full(4) & (data_full(6) $ (!data_full(7)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100101100000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => data_full(5),
	datab => data_full(6),
	datac => data_full(7),
	datad => data_full(4),
	combout => \Mux43~0_combout\);

-- Location: LCCOMB_X62_Y52_N8
\Mux22~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux22~0_combout\ = (data_high(2) & (data_high(0) & (data_high(3) $ (data_high(1))))) # (!data_high(2) & (!data_high(3) & ((data_high(0)) # (data_high(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000110010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => data_high(2),
	datab => data_high(3),
	datac => data_high(0),
	datad => data_high(1),
	combout => \Mux22~0_combout\);

-- Location: LCCOMB_X64_Y52_N2
\Mux1~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux1~0_combout\ = (\SW[4]~input_o\ & (\SW[7]~input_o\ $ (((\SW[5]~input_o\) # (!\SW[6]~input_o\))))) # (!\SW[4]~input_o\ & (!\SW[6]~input_o\ & (!\SW[7]~input_o\ & \SW[5]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101110000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW[4]~input_o\,
	datab => \SW[6]~input_o\,
	datac => \SW[7]~input_o\,
	datad => \SW[5]~input_o\,
	combout => \Mux1~0_combout\);

-- Location: LCCOMB_X63_Y52_N8
\Selector13~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Selector13~0_combout\ = (!\state.SHOW_RESULT~q\ & ((\state.WAIT_LOW~q\ & (\Mux22~0_combout\)) # (!\state.WAIT_LOW~q\ & ((\Mux1~0_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101100001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux22~0_combout\,
	datab => \state.WAIT_LOW~q\,
	datac => \state.SHOW_RESULT~q\,
	datad => \Mux1~0_combout\,
	combout => \Selector13~0_combout\);

-- Location: LCCOMB_X64_Y51_N0
\Selector13~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Selector13~1_combout\ = (\Selector13~0_combout\) # ((\state.SHOW_RESULT~q\ & ((\Mux43~0_combout\))) # (!\state.SHOW_RESULT~q\ & (\state.COMPUTING~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110011111010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \state.COMPUTING~q\,
	datab => \Mux43~0_combout\,
	datac => \Selector13~0_combout\,
	datad => \state.SHOW_RESULT~q\,
	combout => \Selector13~1_combout\);

-- Location: LCCOMB_X63_Y52_N24
\Mux42~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux42~0_combout\ = (data_full(4) & ((data_full(7)) # (data_full(5) $ (data_full(6))))) # (!data_full(4) & ((data_full(5)) # (data_full(7) $ (data_full(6)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110011111111010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => data_full(5),
	datab => data_full(4),
	datac => data_full(7),
	datad => data_full(6),
	combout => \Mux42~0_combout\);

-- Location: LCCOMB_X63_Y52_N18
\Mux0~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux0~0_combout\ = (\SW[4]~input_o\ & ((\SW[7]~input_o\) # (\SW[5]~input_o\ $ (\SW[6]~input_o\)))) # (!\SW[4]~input_o\ & ((\SW[5]~input_o\) # (\SW[7]~input_o\ $ (\SW[6]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011111011011110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW[7]~input_o\,
	datab => \SW[5]~input_o\,
	datac => \SW[6]~input_o\,
	datad => \SW[4]~input_o\,
	combout => \Mux0~0_combout\);

-- Location: LCCOMB_X62_Y52_N10
\Mux21~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux21~0_combout\ = (data_high(0) & ((data_high(3)) # (data_high(2) $ (data_high(1))))) # (!data_high(0) & ((data_high(1)) # (data_high(2) $ (data_high(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101111111100110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => data_high(2),
	datab => data_high(3),
	datac => data_high(0),
	datad => data_high(1),
	combout => \Mux21~0_combout\);

-- Location: LCCOMB_X63_Y52_N16
\Selector12~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Selector12~0_combout\ = (!\state.SHOW_RESULT~q\ & ((\state.WAIT_LOW~q\ & ((!\Mux21~0_combout\))) # (!\state.WAIT_LOW~q\ & (!\Mux0~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000100001101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux0~0_combout\,
	datab => \state.WAIT_LOW~q\,
	datac => \state.SHOW_RESULT~q\,
	datad => \Mux21~0_combout\,
	combout => \Selector12~0_combout\);

-- Location: LCCOMB_X63_Y52_N0
\Selector12~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Selector12~1_combout\ = (\Selector12~0_combout\) # ((\state.SHOW_RESULT~q\ & (!\Mux42~0_combout\)) # (!\state.SHOW_RESULT~q\ & ((\state.COMPUTING~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111101011100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux42~0_combout\,
	datab => \state.COMPUTING~q\,
	datac => \state.SHOW_RESULT~q\,
	datad => \Selector12~0_combout\,
	combout => \Selector12~1_combout\);

-- Location: LCCOMB_X64_Y52_N22
\Mux20~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux20~0_combout\ = (data_high(6) & (!data_high(5) & (data_high(7) $ (!data_high(4))))) # (!data_high(6) & (data_high(4) & (data_high(5) $ (!data_high(7)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110000100000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => data_high(6),
	datab => data_high(5),
	datac => data_high(7),
	datad => data_high(4),
	combout => \Mux20~0_combout\);

-- Location: LCCOMB_X63_Y49_N10
\Mux41~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux41~0_combout\ = (data_full(11) & (data_full(8) & (data_full(9) $ (data_full(10))))) # (!data_full(11) & (!data_full(9) & (data_full(8) $ (data_full(10)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000100110000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => data_full(11),
	datab => data_full(8),
	datac => data_full(9),
	datad => data_full(10),
	combout => \Mux41~0_combout\);

-- Location: LCCOMB_X63_Y49_N24
\Selector11~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Selector11~0_combout\ = (\state.SHOW_RESULT~q\ & (((\Mux41~0_combout\)))) # (!\state.SHOW_RESULT~q\ & (((\Mux20~0_combout\)) # (!\state.WAIT_LOW~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011011101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \state.WAIT_LOW~q\,
	datab => \Mux20~0_combout\,
	datac => \Mux41~0_combout\,
	datad => \state.SHOW_RESULT~q\,
	combout => \Selector11~0_combout\);

-- Location: LCCOMB_X63_Y49_N22
\Mux40~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux40~0_combout\ = (data_full(11) & ((data_full(8) & (data_full(9))) # (!data_full(8) & ((data_full(10)))))) # (!data_full(11) & (data_full(10) & (data_full(8) $ (data_full(9)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011011010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => data_full(11),
	datab => data_full(8),
	datac => data_full(9),
	datad => data_full(10),
	combout => \Mux40~0_combout\);

-- Location: LCCOMB_X64_Y52_N24
\Mux19~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux19~0_combout\ = (data_high(5) & ((data_high(4) & ((data_high(7)))) # (!data_high(4) & (data_high(6))))) # (!data_high(5) & (data_high(6) & (data_high(7) $ (data_high(4)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001010101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => data_high(6),
	datab => data_high(5),
	datac => data_high(7),
	datad => data_high(4),
	combout => \Mux19~0_combout\);

-- Location: LCCOMB_X64_Y52_N14
\Selector10~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Selector10~0_combout\ = (\state.SHOW_RESULT~q\ & (\Mux40~0_combout\)) # (!\state.SHOW_RESULT~q\ & (((\Mux19~0_combout\) # (!\state.WAIT_LOW~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux40~0_combout\,
	datab => \Mux19~0_combout\,
	datac => \state.WAIT_LOW~q\,
	datad => \state.SHOW_RESULT~q\,
	combout => \Selector10~0_combout\);

-- Location: LCCOMB_X63_Y49_N16
\Mux39~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux39~0_combout\ = (data_full(11) & (data_full(10) & ((data_full(9)) # (!data_full(8))))) # (!data_full(11) & (!data_full(8) & (data_full(9) & !data_full(10))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010001000010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => data_full(11),
	datab => data_full(8),
	datac => data_full(9),
	datad => data_full(10),
	combout => \Mux39~0_combout\);

-- Location: LCCOMB_X64_Y52_N28
\Mux18~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux18~0_combout\ = (data_high(6) & (data_high(7) & ((data_high(5)) # (!data_high(4))))) # (!data_high(6) & (data_high(5) & (!data_high(7) & !data_high(4))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000010100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => data_high(6),
	datab => data_high(5),
	datac => data_high(7),
	datad => data_high(4),
	combout => \Mux18~0_combout\);

-- Location: LCCOMB_X64_Y52_N30
\Selector9~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Selector9~0_combout\ = (\state.SHOW_RESULT~q\ & (\Mux39~0_combout\)) # (!\state.SHOW_RESULT~q\ & (((\Mux18~0_combout\) # (!\state.WAIT_LOW~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux39~0_combout\,
	datab => \Mux18~0_combout\,
	datac => \state.WAIT_LOW~q\,
	datad => \state.SHOW_RESULT~q\,
	combout => \Selector9~0_combout\);

-- Location: LCCOMB_X63_Y49_N2
\Mux38~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux38~0_combout\ = (data_full(9) & ((data_full(10) & (data_full(8))) # (!data_full(10) & (!data_full(8) & data_full(11))))) # (!data_full(9) & (!data_full(11) & (data_full(10) $ (data_full(8)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000001010010100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => data_full(9),
	datab => data_full(10),
	datac => data_full(8),
	datad => data_full(11),
	combout => \Mux38~0_combout\);

-- Location: LCCOMB_X64_Y52_N18
\Mux17~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux17~0_combout\ = (data_high(5) & ((data_high(6) & ((data_high(4)))) # (!data_high(6) & (data_high(7) & !data_high(4))))) # (!data_high(5) & (!data_high(7) & (data_high(6) $ (data_high(4)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010000010010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => data_high(6),
	datab => data_high(7),
	datac => data_high(4),
	datad => data_high(5),
	combout => \Mux17~0_combout\);

-- Location: LCCOMB_X63_Y49_N30
\Selector8~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Selector8~0_combout\ = (\state.SHOW_RESULT~q\ & (((\Mux38~0_combout\)))) # (!\state.SHOW_RESULT~q\ & (((\Mux17~0_combout\)) # (!\state.WAIT_LOW~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \state.WAIT_LOW~q\,
	datab => \Mux38~0_combout\,
	datac => \Mux17~0_combout\,
	datad => \state.SHOW_RESULT~q\,
	combout => \Selector8~0_combout\);

-- Location: LCCOMB_X63_Y49_N26
\Mux37~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux37~0_combout\ = (data_full(9) & (!data_full(11) & (data_full(8)))) # (!data_full(9) & ((data_full(10) & (!data_full(11))) # (!data_full(10) & ((data_full(8))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100010101001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => data_full(11),
	datab => data_full(8),
	datac => data_full(9),
	datad => data_full(10),
	combout => \Mux37~0_combout\);

-- Location: LCCOMB_X64_Y52_N0
\Mux16~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux16~0_combout\ = (data_high(5) & (((!data_high(7) & data_high(4))))) # (!data_high(5) & ((data_high(6) & (!data_high(7))) # (!data_high(6) & ((data_high(4))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011011100000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => data_high(6),
	datab => data_high(7),
	datac => data_high(5),
	datad => data_high(4),
	combout => \Mux16~0_combout\);

-- Location: LCCOMB_X63_Y49_N28
\Selector7~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Selector7~0_combout\ = (\state.SHOW_RESULT~q\ & (((\Mux37~0_combout\)))) # (!\state.SHOW_RESULT~q\ & (((\Mux16~0_combout\)) # (!\state.WAIT_LOW~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \state.WAIT_LOW~q\,
	datab => \Mux37~0_combout\,
	datac => \Mux16~0_combout\,
	datad => \state.SHOW_RESULT~q\,
	combout => \Selector7~0_combout\);

-- Location: LCCOMB_X64_Y52_N10
\Mux15~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux15~0_combout\ = (data_high(5) & (!data_high(7) & ((data_high(4)) # (!data_high(6))))) # (!data_high(5) & (data_high(4) & (data_high(7) $ (!data_high(6)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110010100000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => data_high(7),
	datab => data_high(5),
	datac => data_high(6),
	datad => data_high(4),
	combout => \Mux15~0_combout\);

-- Location: LCCOMB_X63_Y49_N20
\Mux36~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux36~0_combout\ = (data_full(9) & (!data_full(11) & ((data_full(8)) # (!data_full(10))))) # (!data_full(9) & (data_full(8) & (data_full(10) $ (!data_full(11)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100000010001110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => data_full(9),
	datab => data_full(8),
	datac => data_full(10),
	datad => data_full(11),
	combout => \Mux36~0_combout\);

-- Location: LCCOMB_X63_Y49_N4
\Selector6~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Selector6~0_combout\ = (\state.SHOW_RESULT~q\ & (((\Mux36~0_combout\)))) # (!\state.SHOW_RESULT~q\ & ((\Mux15~0_combout\) # ((!\state.WAIT_LOW~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110010011110101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \state.SHOW_RESULT~q\,
	datab => \Mux15~0_combout\,
	datac => \Mux36~0_combout\,
	datad => \state.WAIT_LOW~q\,
	combout => \Selector6~0_combout\);

-- Location: LCCOMB_X64_Y52_N12
\Mux14~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux14~0_combout\ = (data_high(4) & ((data_high(7)) # (data_high(6) $ (data_high(5))))) # (!data_high(4) & ((data_high(5)) # (data_high(6) $ (data_high(7)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111011011011110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => data_high(6),
	datab => data_high(5),
	datac => data_high(7),
	datad => data_high(4),
	combout => \Mux14~0_combout\);

-- Location: LCCOMB_X63_Y49_N6
\Mux35~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux35~0_combout\ = (data_full(8) & ((data_full(11)) # (data_full(9) $ (data_full(10))))) # (!data_full(8) & ((data_full(9)) # (data_full(10) $ (data_full(11)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111011010111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => data_full(9),
	datab => data_full(10),
	datac => data_full(11),
	datad => data_full(8),
	combout => \Mux35~0_combout\);

-- Location: LCCOMB_X65_Y50_N8
\Selector5~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Selector5~0_combout\ = (\state.SHOW_RESULT~q\ & (((!\Mux14~0_combout\ & \state.WAIT_LOW~q\)) # (!\Mux35~0_combout\))) # (!\state.SHOW_RESULT~q\ & (!\Mux14~0_combout\ & ((\state.WAIT_LOW~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011101100001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \state.SHOW_RESULT~q\,
	datab => \Mux14~0_combout\,
	datac => \Mux35~0_combout\,
	datad => \state.WAIT_LOW~q\,
	combout => \Selector5~0_combout\);

-- Location: LCCOMB_X65_Y50_N14
\Selector5~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Selector5~1_combout\ = (\Selector5~0_combout\) # (!\state.WAIT_HIGH~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111111001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Selector5~0_combout\,
	datac => \state.WAIT_HIGH~q\,
	combout => \Selector5~1_combout\);

-- Location: LCCOMB_X64_Y49_N6
\Mux34~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux34~0_combout\ = (data_full(15) & (data_full(12) & (data_full(13) $ (data_full(14))))) # (!data_full(15) & (!data_full(13) & (data_full(12) $ (data_full(14)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000100110000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => data_full(15),
	datab => data_full(12),
	datac => data_full(13),
	datad => data_full(14),
	combout => \Mux34~0_combout\);

-- Location: LCCOMB_X64_Y49_N28
\HEX3~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \HEX3~0_combout\ = (\Mux34~0_combout\) # (!\state.SHOW_RESULT~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \state.SHOW_RESULT~q\,
	datad => \Mux34~0_combout\,
	combout => \HEX3~0_combout\);

-- Location: LCCOMB_X64_Y49_N20
\Mux33~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux33~0_combout\ = (data_full(15) & ((data_full(12) & (data_full(13))) # (!data_full(12) & ((data_full(14)))))) # (!data_full(15) & (data_full(14) & (data_full(13) $ (data_full(12)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001111010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => data_full(15),
	datab => data_full(13),
	datac => data_full(12),
	datad => data_full(14),
	combout => \Mux33~0_combout\);

-- Location: LCCOMB_X64_Y49_N22
\HEX3~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \HEX3~1_combout\ = (\Mux33~0_combout\) # (!\state.SHOW_RESULT~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \state.SHOW_RESULT~q\,
	datad => \Mux33~0_combout\,
	combout => \HEX3~1_combout\);

-- Location: LCCOMB_X64_Y49_N12
\Mux32~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux32~0_combout\ = (data_full(15) & (data_full(14) & ((data_full(13)) # (!data_full(12))))) # (!data_full(15) & (data_full(13) & (!data_full(12) & !data_full(14))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000101000000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => data_full(15),
	datab => data_full(13),
	datac => data_full(12),
	datad => data_full(14),
	combout => \Mux32~0_combout\);

-- Location: LCCOMB_X64_Y49_N14
\HEX3~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \HEX3~2_combout\ = (\Mux32~0_combout\) # (!\state.SHOW_RESULT~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \state.SHOW_RESULT~q\,
	datad => \Mux32~0_combout\,
	combout => \HEX3~2_combout\);

-- Location: LCCOMB_X64_Y49_N4
\Mux31~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux31~0_combout\ = (data_full(13) & ((data_full(12) & ((data_full(14)))) # (!data_full(12) & (data_full(15) & !data_full(14))))) # (!data_full(13) & (!data_full(15) & (data_full(12) $ (data_full(14)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000100011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => data_full(15),
	datab => data_full(13),
	datac => data_full(12),
	datad => data_full(14),
	combout => \Mux31~0_combout\);

-- Location: LCCOMB_X64_Y49_N24
\HEX3~3\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \HEX3~3_combout\ = (\Mux31~0_combout\) # (!\state.SHOW_RESULT~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \state.SHOW_RESULT~q\,
	datad => \Mux31~0_combout\,
	combout => \HEX3~3_combout\);

-- Location: LCCOMB_X64_Y49_N26
\Mux30~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux30~0_combout\ = (data_full(13) & (!data_full(15) & (data_full(12)))) # (!data_full(13) & ((data_full(14) & (!data_full(15))) # (!data_full(14) & ((data_full(12))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100010101001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => data_full(15),
	datab => data_full(12),
	datac => data_full(13),
	datad => data_full(14),
	combout => \Mux30~0_combout\);

-- Location: LCCOMB_X63_Y49_N18
\HEX3~4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \HEX3~4_combout\ = (\Mux30~0_combout\) # (!\state.SHOW_RESULT~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Mux30~0_combout\,
	datad => \state.SHOW_RESULT~q\,
	combout => \HEX3~4_combout\);

-- Location: LCCOMB_X64_Y49_N2
\Mux29~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux29~0_combout\ = (data_full(13) & (!data_full(15) & ((data_full(12)) # (!data_full(14))))) # (!data_full(13) & (data_full(12) & (data_full(14) $ (!data_full(15)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100000010001110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => data_full(13),
	datab => data_full(12),
	datac => data_full(14),
	datad => data_full(15),
	combout => \Mux29~0_combout\);

-- Location: LCCOMB_X64_Y49_N10
\HEX3~5\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \HEX3~5_combout\ = (\Mux29~0_combout\) # (!\state.SHOW_RESULT~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \state.SHOW_RESULT~q\,
	datad => \Mux29~0_combout\,
	combout => \HEX3~5_combout\);

-- Location: LCCOMB_X64_Y49_N30
\Mux28~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux28~0_combout\ = (data_full(12) & ((data_full(15)) # (data_full(13) $ (data_full(14))))) # (!data_full(12) & ((data_full(13)) # (data_full(15) $ (data_full(14)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110011111111010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => data_full(13),
	datab => data_full(12),
	datac => data_full(15),
	datad => data_full(14),
	combout => \Mux28~0_combout\);

-- Location: LCCOMB_X63_Y51_N12
\Selector4~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Selector4~0_combout\ = ((\state.WAIT_LOW~q\) # ((!\Mux28~0_combout\ & \state.SHOW_RESULT~q\))) # (!\state.WAIT_HIGH~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111101110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux28~0_combout\,
	datab => \state.WAIT_HIGH~q\,
	datac => \state.SHOW_RESULT~q\,
	datad => \state.WAIT_LOW~q\,
	combout => \Selector4~0_combout\);

-- Location: LCCOMB_X77_Y37_N8
\HEX3~6\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \HEX3~6_combout\ = (\state.WAIT_LOW~q\) # (!\state.WAIT_HIGH~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001111110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \state.WAIT_HIGH~q\,
	datac => \state.WAIT_LOW~q\,
	combout => \HEX3~6_combout\);

-- Location: LCCOMB_X77_Y37_N14
\HEX2~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \HEX2~0_combout\ = (\state.COMPUTING~q\) # (!\state.WAIT_HIGH~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001111110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \state.WAIT_HIGH~q\,
	datac => \state.COMPUTING~q\,
	combout => \HEX2~0_combout\);

-- Location: LCCOMB_X66_Y50_N12
\is_prime~5\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \is_prime~5_combout\ = (\is_prime~q\ & ((n_reg(1)) # (!\Equal0~4_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => n_reg(1),
	datac => \Equal0~4_combout\,
	datad => \is_prime~q\,
	combout => \is_prime~5_combout\);

-- Location: LCCOMB_X66_Y50_N0
\is_prime~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \is_prime~0_combout\ = (\start_check~q\) # ((\is_prime~q\ & ((\check_done~q\) # (!\state.COMPUTING~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \start_check~q\,
	datab => \check_done~q\,
	datac => \state.COMPUTING~q\,
	datad => \is_prime~q\,
	combout => \is_prime~0_combout\);

-- Location: LCCOMB_X66_Y50_N8
\is_prime~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \is_prime~1_combout\ = (!n_reg(0) & (n_reg(1) & (\Equal0~4_combout\ & \current_divisor~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => n_reg(0),
	datab => n_reg(1),
	datac => \Equal0~4_combout\,
	datad => \current_divisor~2_combout\,
	combout => \is_prime~1_combout\);

-- Location: LCCOMB_X66_Y50_N10
\is_prime~4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \is_prime~4_combout\ = ((\Equal1~5_combout\ & ((n_reg(0)))) # (!\Equal1~5_combout\ & (!\is_prime~3_combout\))) # (!\LessThan3~30_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011000111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal1~5_combout\,
	datab => \is_prime~3_combout\,
	datac => n_reg(0),
	datad => \LessThan3~30_combout\,
	combout => \is_prime~4_combout\);

-- Location: LCCOMB_X66_Y50_N2
\is_prime~6\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \is_prime~6_combout\ = (\is_prime~0_combout\) # ((\is_prime~1_combout\) # ((\is_prime~5_combout\ & \is_prime~4_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111011111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \is_prime~5_combout\,
	datab => \is_prime~0_combout\,
	datac => \is_prime~1_combout\,
	datad => \is_prime~4_combout\,
	combout => \is_prime~6_combout\);

-- Location: FF_X66_Y50_N3
is_prime : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \MAX10_CLK1_50~inputclkctrl_outclk\,
	d => \is_prime~6_combout\,
	ena => \state.WAIT_HIGH~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \is_prime~q\);

-- Location: LCCOMB_X65_Y52_N30
\LEDR~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LEDR~0_combout\ = (\is_prime~q\ & \state.SHOW_RESULT~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \is_prime~q\,
	datad => \state.SHOW_RESULT~q\,
	combout => \LEDR~0_combout\);

-- Location: IOIBUF_X56_Y54_N1
\SW[8]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(8),
	o => \SW[8]~input_o\);

-- Location: IOIBUF_X69_Y54_N1
\SW[9]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(9),
	o => \SW[9]~input_o\);

-- Location: UNVM_X0_Y40_N40
\~QUARTUS_CREATED_UNVM~\ : fiftyfivenm_unvm
-- pragma translate_off
GENERIC MAP (
	addr_range1_end_addr => -1,
	addr_range1_offset => -1,
	addr_range2_offset => -1,
	is_compressed_image => "false",
	is_dual_boot => "false",
	is_eram_skip => "false",
	max_ufm_valid_addr => -1,
	max_valid_addr => -1,
	min_ufm_valid_addr => -1,
	min_valid_addr => -1,
	part_name => "quartus_created_unvm",
	reserve_block => "true")
-- pragma translate_on
PORT MAP (
	nosc_ena => \~QUARTUS_CREATED_GND~I_combout\,
	xe_ye => \~QUARTUS_CREATED_GND~I_combout\,
	se => \~QUARTUS_CREATED_GND~I_combout\,
	busy => \~QUARTUS_CREATED_UNVM~~busy\);

-- Location: ADCBLOCK_X43_Y52_N0
\~QUARTUS_CREATED_ADC1~\ : fiftyfivenm_adcblock
-- pragma translate_off
GENERIC MAP (
	analog_input_pin_mask => 0,
	clkdiv => 1,
	device_partname_fivechar_prefix => "none",
	is_this_first_or_second_adc => 1,
	prescalar => 0,
	pwd => 1,
	refsel => 0,
	reserve_block => "true",
	testbits => 66,
	tsclkdiv => 1,
	tsclksel => 0)
-- pragma translate_on
PORT MAP (
	soc => \~QUARTUS_CREATED_GND~I_combout\,
	usr_pwd => VCC,
	tsen => \~QUARTUS_CREATED_GND~I_combout\,
	chsel => \~QUARTUS_CREATED_ADC1~_CHSEL_bus\,
	eoc => \~QUARTUS_CREATED_ADC1~~eoc\);

-- Location: ADCBLOCK_X43_Y51_N0
\~QUARTUS_CREATED_ADC2~\ : fiftyfivenm_adcblock
-- pragma translate_off
GENERIC MAP (
	analog_input_pin_mask => 0,
	clkdiv => 1,
	device_partname_fivechar_prefix => "none",
	is_this_first_or_second_adc => 2,
	prescalar => 0,
	pwd => 1,
	refsel => 0,
	reserve_block => "true",
	testbits => 66,
	tsclkdiv => 1,
	tsclksel => 0)
-- pragma translate_on
PORT MAP (
	soc => \~QUARTUS_CREATED_GND~I_combout\,
	usr_pwd => VCC,
	tsen => \~QUARTUS_CREATED_GND~I_combout\,
	chsel => \~QUARTUS_CREATED_ADC2~_CHSEL_bus\,
	eoc => \~QUARTUS_CREATED_ADC2~~eoc\);

ww_HEX0(0) <= \HEX0[0]~output_o\;

ww_HEX0(1) <= \HEX0[1]~output_o\;

ww_HEX0(2) <= \HEX0[2]~output_o\;

ww_HEX0(3) <= \HEX0[3]~output_o\;

ww_HEX0(4) <= \HEX0[4]~output_o\;

ww_HEX0(5) <= \HEX0[5]~output_o\;

ww_HEX0(6) <= \HEX0[6]~output_o\;

ww_HEX1(0) <= \HEX1[0]~output_o\;

ww_HEX1(1) <= \HEX1[1]~output_o\;

ww_HEX1(2) <= \HEX1[2]~output_o\;

ww_HEX1(3) <= \HEX1[3]~output_o\;

ww_HEX1(4) <= \HEX1[4]~output_o\;

ww_HEX1(5) <= \HEX1[5]~output_o\;

ww_HEX1(6) <= \HEX1[6]~output_o\;

ww_HEX2(0) <= \HEX2[0]~output_o\;

ww_HEX2(1) <= \HEX2[1]~output_o\;

ww_HEX2(2) <= \HEX2[2]~output_o\;

ww_HEX2(3) <= \HEX2[3]~output_o\;

ww_HEX2(4) <= \HEX2[4]~output_o\;

ww_HEX2(5) <= \HEX2[5]~output_o\;

ww_HEX2(6) <= \HEX2[6]~output_o\;

ww_HEX3(0) <= \HEX3[0]~output_o\;

ww_HEX3(1) <= \HEX3[1]~output_o\;

ww_HEX3(2) <= \HEX3[2]~output_o\;

ww_HEX3(3) <= \HEX3[3]~output_o\;

ww_HEX3(4) <= \HEX3[4]~output_o\;

ww_HEX3(5) <= \HEX3[5]~output_o\;

ww_HEX3(6) <= \HEX3[6]~output_o\;

ww_HEX4(0) <= \HEX4[0]~output_o\;

ww_HEX4(1) <= \HEX4[1]~output_o\;

ww_HEX4(2) <= \HEX4[2]~output_o\;

ww_HEX4(3) <= \HEX4[3]~output_o\;

ww_HEX4(4) <= \HEX4[4]~output_o\;

ww_HEX4(5) <= \HEX4[5]~output_o\;

ww_HEX4(6) <= \HEX4[6]~output_o\;

ww_HEX5(0) <= \HEX5[0]~output_o\;

ww_HEX5(1) <= \HEX5[1]~output_o\;

ww_HEX5(2) <= \HEX5[2]~output_o\;

ww_HEX5(3) <= \HEX5[3]~output_o\;

ww_HEX5(4) <= \HEX5[4]~output_o\;

ww_HEX5(5) <= \HEX5[5]~output_o\;

ww_HEX5(6) <= \HEX5[6]~output_o\;

ww_LEDR(0) <= \LEDR[0]~output_o\;

ww_LEDR(1) <= \LEDR[1]~output_o\;

ww_LEDR(2) <= \LEDR[2]~output_o\;

ww_LEDR(3) <= \LEDR[3]~output_o\;

ww_LEDR(4) <= \LEDR[4]~output_o\;

ww_LEDR(5) <= \LEDR[5]~output_o\;

ww_LEDR(6) <= \LEDR[6]~output_o\;

ww_LEDR(7) <= \LEDR[7]~output_o\;

ww_LEDR(8) <= \LEDR[8]~output_o\;

ww_LEDR(9) <= \LEDR[9]~output_o\;
END structure;



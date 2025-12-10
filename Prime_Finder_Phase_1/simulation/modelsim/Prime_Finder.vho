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

-- DATE "12/11/2025 00:59:38"

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

ENTITY 	Prime_Finder_Top_Group55 IS
    PORT (
	MAX10_CLK1_50 : IN std_logic;
	SW : IN std_logic_vector(9 DOWNTO 0);
	HEX0 : OUT std_logic_vector(6 DOWNTO 0);
	HEX1 : OUT std_logic_vector(6 DOWNTO 0);
	HEX2 : OUT std_logic_vector(6 DOWNTO 0);
	HEX3 : OUT std_logic_vector(6 DOWNTO 0);
	HEX4 : OUT std_logic_vector(6 DOWNTO 0);
	HEX5 : OUT std_logic_vector(6 DOWNTO 0);
	LEDR : OUT std_logic_vector(9 DOWNTO 0)
	);
END Prime_Finder_Top_Group55;

-- Design Ports Information
-- SW[8]	=>  Location: PIN_B14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
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
-- SW[4]	=>  Location: PIN_A12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- SW[6]	=>  Location: PIN_A13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- SW[5]	=>  Location: PIN_B12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- SW[7]	=>  Location: PIN_A14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- SW[2]	=>  Location: PIN_D12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- SW[3]	=>  Location: PIN_C12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- SW[0]	=>  Location: PIN_C10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- SW[1]	=>  Location: PIN_C11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- MAX10_CLK1_50	=>  Location: PIN_P11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- SW[9]	=>  Location: PIN_F15,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default


ARCHITECTURE structure OF Prime_Finder_Top_Group55 IS
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
SIGNAL \SW[9]~input_o\ : std_logic;
SIGNAL \CORE|DIVIDER|reg_quotient~0_combout\ : std_logic;
SIGNAL \SW[1]~input_o\ : std_logic;
SIGNAL \SW[0]~input_o\ : std_logic;
SIGNAL \SW[2]~input_o\ : std_logic;
SIGNAL \SW[3]~input_o\ : std_logic;
SIGNAL \CORE|DIVIDER|Equal0~1_combout\ : std_logic;
SIGNAL \CORE|DIVIDER|div_by_zero~q\ : std_logic;
SIGNAL \SW[7]~input_o\ : std_logic;
SIGNAL \CORE|DIVIDER|reg_divisor[1]~feeder_combout\ : std_logic;
SIGNAL \CORE|DIVIDER|SUBTRACTOR|Diff~0_combout\ : std_logic;
SIGNAL \SW[4]~input_o\ : std_logic;
SIGNAL \CORE|DIVIDER|SUBTRACTOR|Diff[1]~1_combout\ : std_logic;
SIGNAL \SW[5]~input_o\ : std_logic;
SIGNAL \CORE|DIVIDER|SUBTRACTOR|C[2]~0_combout\ : std_logic;
SIGNAL \SW[6]~input_o\ : std_logic;
SIGNAL \CORE|DIVIDER|SUBTRACTOR|C[3]~1_combout\ : std_logic;
SIGNAL \CORE|DIVIDER|reg_dividend[3]~0_combout\ : std_logic;
SIGNAL \CORE|DIVIDER|reg_dividend[3]~1_combout\ : std_logic;
SIGNAL \CORE|DIVIDER|reg_dividend[3]~2_combout\ : std_logic;
SIGNAL \CORE|DIVIDER|SUBTRACTOR|COUT~0_combout\ : std_logic;
SIGNAL \CORE|DIVIDER|done~0_combout\ : std_logic;
SIGNAL \CORE|DIVIDER|done~q\ : std_logic;
SIGNAL \CORE|DIVIDER|reg_quotient[3]~1_combout\ : std_logic;
SIGNAL \CORE|DIVIDER|Add0~1_combout\ : std_logic;
SIGNAL \CORE|DIVIDER|Add0~0_combout\ : std_logic;
SIGNAL \CORE|DIVIDER|Add0~2_combout\ : std_logic;
SIGNAL \Mux6~2_combout\ : std_logic;
SIGNAL \Mux6~3_combout\ : std_logic;
SIGNAL \Mux5~3_combout\ : std_logic;
SIGNAL \Mux5~6_combout\ : std_logic;
SIGNAL \Mux4~3_combout\ : std_logic;
SIGNAL \Mux4~6_combout\ : std_logic;
SIGNAL \Mux3~2_combout\ : std_logic;
SIGNAL \Mux3~3_combout\ : std_logic;
SIGNAL \Mux2~4_combout\ : std_logic;
SIGNAL \Mux2~9_combout\ : std_logic;
SIGNAL \Mux1~2_combout\ : std_logic;
SIGNAL \Mux1~3_combout\ : std_logic;
SIGNAL \Mux0~2_combout\ : std_logic;
SIGNAL \Mux0~3_combout\ : std_logic;
SIGNAL \LessThan0~0_combout\ : std_logic;
SIGNAL \CORE|DIVIDER|Remainder[1]~2_combout\ : std_logic;
SIGNAL \r_ones[3]~2_combout\ : std_logic;
SIGNAL \r_ones[3]~3_combout\ : std_logic;
SIGNAL \CORE|DIVIDER|Remainder[3]~3_combout\ : std_logic;
SIGNAL \CORE|DIVIDER|Remainder[2]~1_combout\ : std_logic;
SIGNAL \r_ones[2]~1_combout\ : std_logic;
SIGNAL \r_ones[1]~0_combout\ : std_logic;
SIGNAL \CORE|DIVIDER|Remainder[0]~0_combout\ : std_logic;
SIGNAL \Mux20~0_combout\ : std_logic;
SIGNAL \Mux19~0_combout\ : std_logic;
SIGNAL \Mux18~0_combout\ : std_logic;
SIGNAL \Mux17~0_combout\ : std_logic;
SIGNAL \Mux16~0_combout\ : std_logic;
SIGNAL \Mux15~0_combout\ : std_logic;
SIGNAL \Mux14~0_combout\ : std_logic;
SIGNAL \LessThan1~0_combout\ : std_logic;
SIGNAL \CORE|DIVIDER|Quotient[0]~0_combout\ : std_logic;
SIGNAL \q_ones[3]~0_combout\ : std_logic;
SIGNAL \CORE|DIVIDER|Quotient[2]~1_combout\ : std_logic;
SIGNAL \CORE|DIVIDER|Quotient[3]~2_combout\ : std_logic;
SIGNAL \CORE|LessThan2~0_combout\ : std_logic;
SIGNAL \CORE|Is_Prime~4_combout\ : std_logic;
SIGNAL \CORE|Is_Prime~1_combout\ : std_logic;
SIGNAL \CORE|Is_Prime~5_combout\ : std_logic;
SIGNAL \CORE|Is_Prime~2_combout\ : std_logic;
SIGNAL \CORE|DIVIDER|Equal0~0_combout\ : std_logic;
SIGNAL \CORE|Is_Prime~0_combout\ : std_logic;
SIGNAL \CORE|Is_Prime~3_combout\ : std_logic;
SIGNAL \CORE|DIVIDER|reg_quotient\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \CORE|DIVIDER|SUBTRACTOR|Diff\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \CORE|DIVIDER|reg_dividend\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \CORE|DIVIDER|reg_divisor\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \ALT_INV_Mux0~3_combout\ : std_logic;
SIGNAL \CORE|ALT_INV_Is_Prime~3_combout\ : std_logic;
SIGNAL \ALT_INV_q_ones[3]~0_combout\ : std_logic;
SIGNAL \ALT_INV_Mux14~0_combout\ : std_logic;

COMPONENT hard_block
    PORT (
	devoe : IN std_logic;
	devclrn : IN std_logic;
	devpor : IN std_logic);
END COMPONENT;

BEGIN

ww_MAX10_CLK1_50 <= MAX10_CLK1_50;
ww_SW <= SW;
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
\ALT_INV_Mux0~3_combout\ <= NOT \Mux0~3_combout\;
\CORE|ALT_INV_Is_Prime~3_combout\ <= NOT \CORE|Is_Prime~3_combout\;
\ALT_INV_q_ones[3]~0_combout\ <= NOT \q_ones[3]~0_combout\;
\ALT_INV_Mux14~0_combout\ <= NOT \Mux14~0_combout\;
auto_generated_inst : hard_block
PORT MAP (
	devoe => ww_devoe,
	devclrn => ww_devclrn,
	devpor => ww_devpor);

-- Location: LCCOMB_X44_Y41_N24
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
	i => \Mux6~3_combout\,
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
	i => \Mux5~6_combout\,
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
	i => \Mux4~6_combout\,
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
	i => \Mux3~3_combout\,
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
	i => \Mux2~9_combout\,
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
	i => \Mux1~3_combout\,
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
	i => \ALT_INV_Mux0~3_combout\,
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
	i => \LessThan0~0_combout\,
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
	i => GND,
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
	i => GND,
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
	i => \LessThan0~0_combout\,
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
	i => \LessThan0~0_combout\,
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
	i => \LessThan0~0_combout\,
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
	i => VCC,
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
	i => VCC,
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
	i => VCC,
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
	i => VCC,
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
	i => VCC,
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
	i => VCC,
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
	i => VCC,
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
	i => VCC,
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
	i => VCC,
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
	i => VCC,
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
	i => VCC,
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
	i => VCC,
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
	i => VCC,
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
	i => VCC,
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
	i => VCC,
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
	i => \Mux20~0_combout\,
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
	i => \Mux19~0_combout\,
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
	i => \Mux18~0_combout\,
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
	i => \Mux17~0_combout\,
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
	i => \Mux16~0_combout\,
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
	i => \Mux15~0_combout\,
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
	i => \ALT_INV_Mux14~0_combout\,
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
	i => \LessThan1~0_combout\,
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
	i => GND,
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
	i => GND,
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
	i => \LessThan1~0_combout\,
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
	i => \LessThan1~0_combout\,
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
	i => \LessThan1~0_combout\,
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
	i => VCC,
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
	i => \CORE|DIVIDER|Quotient[0]~0_combout\,
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
	i => \ALT_INV_q_ones[3]~0_combout\,
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
	i => \CORE|DIVIDER|Quotient[2]~1_combout\,
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
	i => \CORE|DIVIDER|Quotient[3]~2_combout\,
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
	i => GND,
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
	i => GND,
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
	i => GND,
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
	i => GND,
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
	i => \CORE|ALT_INV_Is_Prime~3_combout\,
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

-- Location: LCCOMB_X59_Y53_N12
\CORE|DIVIDER|reg_quotient~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \CORE|DIVIDER|reg_quotient~0_combout\ = (!\CORE|DIVIDER|reg_quotient\(0) & !\SW[9]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \CORE|DIVIDER|reg_quotient\(0),
	datad => \SW[9]~input_o\,
	combout => \CORE|DIVIDER|reg_quotient~0_combout\);

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

-- Location: LCCOMB_X58_Y53_N8
\CORE|DIVIDER|Equal0~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \CORE|DIVIDER|Equal0~1_combout\ = (!\SW[1]~input_o\ & (!\SW[0]~input_o\ & (!\SW[2]~input_o\ & !\SW[3]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW[1]~input_o\,
	datab => \SW[0]~input_o\,
	datac => \SW[2]~input_o\,
	datad => \SW[3]~input_o\,
	combout => \CORE|DIVIDER|Equal0~1_combout\);

-- Location: FF_X58_Y53_N25
\CORE|DIVIDER|div_by_zero\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \MAX10_CLK1_50~inputclkctrl_outclk\,
	asdata => \CORE|DIVIDER|Equal0~1_combout\,
	sload => VCC,
	ena => \SW[9]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \CORE|DIVIDER|div_by_zero~q\);

-- Location: FF_X58_Y53_N1
\CORE|DIVIDER|reg_divisor[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \MAX10_CLK1_50~inputclkctrl_outclk\,
	asdata => \SW[3]~input_o\,
	sload => VCC,
	ena => \SW[9]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \CORE|DIVIDER|reg_divisor\(3));

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

-- Location: FF_X58_Y53_N9
\CORE|DIVIDER|reg_divisor[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \MAX10_CLK1_50~inputclkctrl_outclk\,
	asdata => \SW[2]~input_o\,
	sload => VCC,
	ena => \SW[9]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \CORE|DIVIDER|reg_divisor\(2));

-- Location: LCCOMB_X58_Y53_N26
\CORE|DIVIDER|reg_divisor[1]~feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \CORE|DIVIDER|reg_divisor[1]~feeder_combout\ = \SW[1]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \SW[1]~input_o\,
	combout => \CORE|DIVIDER|reg_divisor[1]~feeder_combout\);

-- Location: FF_X58_Y53_N27
\CORE|DIVIDER|reg_divisor[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \MAX10_CLK1_50~inputclkctrl_outclk\,
	d => \CORE|DIVIDER|reg_divisor[1]~feeder_combout\,
	ena => \SW[9]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \CORE|DIVIDER|reg_divisor\(1));

-- Location: FF_X58_Y53_N5
\CORE|DIVIDER|reg_divisor[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \MAX10_CLK1_50~inputclkctrl_outclk\,
	asdata => \SW[0]~input_o\,
	sload => VCC,
	ena => \SW[9]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \CORE|DIVIDER|reg_divisor\(0));

-- Location: LCCOMB_X57_Y53_N16
\CORE|DIVIDER|SUBTRACTOR|Diff~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \CORE|DIVIDER|SUBTRACTOR|Diff~0_combout\ = \CORE|DIVIDER|reg_dividend\(0) $ (\CORE|DIVIDER|reg_divisor\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \CORE|DIVIDER|reg_dividend\(0),
	datad => \CORE|DIVIDER|reg_divisor\(0),
	combout => \CORE|DIVIDER|SUBTRACTOR|Diff~0_combout\);

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

-- Location: FF_X57_Y53_N17
\CORE|DIVIDER|reg_dividend[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \MAX10_CLK1_50~inputclkctrl_outclk\,
	d => \CORE|DIVIDER|SUBTRACTOR|Diff~0_combout\,
	asdata => \SW[4]~input_o\,
	sload => \SW[9]~input_o\,
	ena => \CORE|DIVIDER|reg_quotient[3]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \CORE|DIVIDER|reg_dividend\(0));

-- Location: LCCOMB_X57_Y53_N20
\CORE|DIVIDER|SUBTRACTOR|Diff[1]~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \CORE|DIVIDER|SUBTRACTOR|Diff[1]~1_combout\ = \CORE|DIVIDER|reg_dividend\(1) $ (\CORE|DIVIDER|reg_divisor\(1) $ (((\CORE|DIVIDER|reg_divisor\(0) & !\CORE|DIVIDER|reg_dividend\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010110111010010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CORE|DIVIDER|reg_divisor\(0),
	datab => \CORE|DIVIDER|reg_dividend\(0),
	datac => \CORE|DIVIDER|reg_dividend\(1),
	datad => \CORE|DIVIDER|reg_divisor\(1),
	combout => \CORE|DIVIDER|SUBTRACTOR|Diff[1]~1_combout\);

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

-- Location: FF_X57_Y53_N21
\CORE|DIVIDER|reg_dividend[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \MAX10_CLK1_50~inputclkctrl_outclk\,
	d => \CORE|DIVIDER|SUBTRACTOR|Diff[1]~1_combout\,
	asdata => \SW[5]~input_o\,
	sload => \SW[9]~input_o\,
	ena => \CORE|DIVIDER|reg_quotient[3]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \CORE|DIVIDER|reg_dividend\(1));

-- Location: LCCOMB_X58_Y53_N16
\CORE|DIVIDER|SUBTRACTOR|C[2]~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \CORE|DIVIDER|SUBTRACTOR|C[2]~0_combout\ = (\CORE|DIVIDER|reg_divisor\(1) & (\CORE|DIVIDER|reg_dividend\(1) & ((\CORE|DIVIDER|reg_dividend\(0)) # (!\CORE|DIVIDER|reg_divisor\(0))))) # (!\CORE|DIVIDER|reg_divisor\(1) & (((\CORE|DIVIDER|reg_dividend\(0)) # 
-- (\CORE|DIVIDER|reg_dividend\(1))) # (!\CORE|DIVIDER|reg_divisor\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111011101010001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CORE|DIVIDER|reg_divisor\(1),
	datab => \CORE|DIVIDER|reg_divisor\(0),
	datac => \CORE|DIVIDER|reg_dividend\(0),
	datad => \CORE|DIVIDER|reg_dividend\(1),
	combout => \CORE|DIVIDER|SUBTRACTOR|C[2]~0_combout\);

-- Location: LCCOMB_X57_Y53_N14
\CORE|DIVIDER|SUBTRACTOR|Diff[2]\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \CORE|DIVIDER|SUBTRACTOR|Diff\(2) = \CORE|DIVIDER|reg_divisor\(2) $ (\CORE|DIVIDER|reg_dividend\(2) $ (!\CORE|DIVIDER|SUBTRACTOR|C[2]~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011000011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \CORE|DIVIDER|reg_divisor\(2),
	datac => \CORE|DIVIDER|reg_dividend\(2),
	datad => \CORE|DIVIDER|SUBTRACTOR|C[2]~0_combout\,
	combout => \CORE|DIVIDER|SUBTRACTOR|Diff\(2));

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

-- Location: FF_X57_Y53_N15
\CORE|DIVIDER|reg_dividend[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \MAX10_CLK1_50~inputclkctrl_outclk\,
	d => \CORE|DIVIDER|SUBTRACTOR|Diff\(2),
	asdata => \SW[6]~input_o\,
	sload => \SW[9]~input_o\,
	ena => \CORE|DIVIDER|reg_quotient[3]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \CORE|DIVIDER|reg_dividend\(2));

-- Location: LCCOMB_X58_Y53_N18
\CORE|DIVIDER|SUBTRACTOR|C[3]~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \CORE|DIVIDER|SUBTRACTOR|C[3]~1_combout\ = (\CORE|DIVIDER|reg_dividend\(2) & ((\CORE|DIVIDER|SUBTRACTOR|C[2]~0_combout\) # (!\CORE|DIVIDER|reg_divisor\(2)))) # (!\CORE|DIVIDER|reg_dividend\(2) & (!\CORE|DIVIDER|reg_divisor\(2) & 
-- \CORE|DIVIDER|SUBTRACTOR|C[2]~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111100001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CORE|DIVIDER|reg_dividend\(2),
	datac => \CORE|DIVIDER|reg_divisor\(2),
	datad => \CORE|DIVIDER|SUBTRACTOR|C[2]~0_combout\,
	combout => \CORE|DIVIDER|SUBTRACTOR|C[3]~1_combout\);

-- Location: LCCOMB_X58_Y53_N12
\CORE|DIVIDER|reg_dividend[3]~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \CORE|DIVIDER|reg_dividend[3]~0_combout\ = (\CORE|DIVIDER|div_by_zero~q\) # (\CORE|DIVIDER|reg_divisor\(3) $ (\CORE|DIVIDER|SUBTRACTOR|C[3]~1_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001111111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \CORE|DIVIDER|reg_divisor\(3),
	datac => \CORE|DIVIDER|div_by_zero~q\,
	datad => \CORE|DIVIDER|SUBTRACTOR|C[3]~1_combout\,
	combout => \CORE|DIVIDER|reg_dividend[3]~0_combout\);

-- Location: LCCOMB_X58_Y53_N2
\CORE|DIVIDER|reg_dividend[3]~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \CORE|DIVIDER|reg_dividend[3]~1_combout\ = (!\CORE|DIVIDER|done~q\ & (\CORE|DIVIDER|SUBTRACTOR|COUT~0_combout\ & !\CORE|DIVIDER|reg_dividend[3]~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \CORE|DIVIDER|done~q\,
	datac => \CORE|DIVIDER|SUBTRACTOR|COUT~0_combout\,
	datad => \CORE|DIVIDER|reg_dividend[3]~0_combout\,
	combout => \CORE|DIVIDER|reg_dividend[3]~1_combout\);

-- Location: LCCOMB_X58_Y53_N14
\CORE|DIVIDER|reg_dividend[3]~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \CORE|DIVIDER|reg_dividend[3]~2_combout\ = (\SW[9]~input_o\ & (\SW[7]~input_o\)) # (!\SW[9]~input_o\ & ((\CORE|DIVIDER|reg_dividend\(3) $ (\CORE|DIVIDER|reg_dividend[3]~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000110111011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW[9]~input_o\,
	datab => \SW[7]~input_o\,
	datac => \CORE|DIVIDER|reg_dividend\(3),
	datad => \CORE|DIVIDER|reg_dividend[3]~1_combout\,
	combout => \CORE|DIVIDER|reg_dividend[3]~2_combout\);

-- Location: FF_X58_Y53_N15
\CORE|DIVIDER|reg_dividend[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \MAX10_CLK1_50~inputclkctrl_outclk\,
	d => \CORE|DIVIDER|reg_dividend[3]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \CORE|DIVIDER|reg_dividend\(3));

-- Location: LCCOMB_X58_Y53_N20
\CORE|DIVIDER|SUBTRACTOR|COUT~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \CORE|DIVIDER|SUBTRACTOR|COUT~0_combout\ = (\CORE|DIVIDER|reg_divisor\(3) & (\CORE|DIVIDER|reg_dividend\(3) & \CORE|DIVIDER|SUBTRACTOR|C[3]~1_combout\)) # (!\CORE|DIVIDER|reg_divisor\(3) & ((\CORE|DIVIDER|reg_dividend\(3)) # 
-- (\CORE|DIVIDER|SUBTRACTOR|C[3]~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001100110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \CORE|DIVIDER|reg_divisor\(3),
	datac => \CORE|DIVIDER|reg_dividend\(3),
	datad => \CORE|DIVIDER|SUBTRACTOR|C[3]~1_combout\,
	combout => \CORE|DIVIDER|SUBTRACTOR|COUT~0_combout\);

-- Location: LCCOMB_X59_Y53_N10
\CORE|DIVIDER|done~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \CORE|DIVIDER|done~0_combout\ = (\CORE|DIVIDER|done~q\) # ((!\CORE|DIVIDER|div_by_zero~q\ & !\CORE|DIVIDER|SUBTRACTOR|COUT~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \CORE|DIVIDER|div_by_zero~q\,
	datac => \CORE|DIVIDER|done~q\,
	datad => \CORE|DIVIDER|SUBTRACTOR|COUT~0_combout\,
	combout => \CORE|DIVIDER|done~0_combout\);

-- Location: FF_X59_Y53_N11
\CORE|DIVIDER|done\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \MAX10_CLK1_50~inputclkctrl_outclk\,
	d => \CORE|DIVIDER|done~0_combout\,
	sclr => \SW[9]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \CORE|DIVIDER|done~q\);

-- Location: LCCOMB_X58_Y53_N6
\CORE|DIVIDER|reg_quotient[3]~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \CORE|DIVIDER|reg_quotient[3]~1_combout\ = (\SW[9]~input_o\) # ((!\CORE|DIVIDER|div_by_zero~q\ & (!\CORE|DIVIDER|done~q\ & \CORE|DIVIDER|SUBTRACTOR|COUT~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW[9]~input_o\,
	datab => \CORE|DIVIDER|div_by_zero~q\,
	datac => \CORE|DIVIDER|done~q\,
	datad => \CORE|DIVIDER|SUBTRACTOR|COUT~0_combout\,
	combout => \CORE|DIVIDER|reg_quotient[3]~1_combout\);

-- Location: FF_X59_Y53_N13
\CORE|DIVIDER|reg_quotient[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \MAX10_CLK1_50~inputclkctrl_outclk\,
	d => \CORE|DIVIDER|reg_quotient~0_combout\,
	ena => \CORE|DIVIDER|reg_quotient[3]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \CORE|DIVIDER|reg_quotient\(0));

-- Location: LCCOMB_X59_Y53_N18
\CORE|DIVIDER|Add0~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \CORE|DIVIDER|Add0~1_combout\ = \CORE|DIVIDER|reg_quotient\(1) $ (\CORE|DIVIDER|reg_quotient\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \CORE|DIVIDER|reg_quotient\(1),
	datad => \CORE|DIVIDER|reg_quotient\(0),
	combout => \CORE|DIVIDER|Add0~1_combout\);

-- Location: FF_X59_Y53_N19
\CORE|DIVIDER|reg_quotient[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \MAX10_CLK1_50~inputclkctrl_outclk\,
	d => \CORE|DIVIDER|Add0~1_combout\,
	sclr => \SW[9]~input_o\,
	ena => \CORE|DIVIDER|reg_quotient[3]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \CORE|DIVIDER|reg_quotient\(1));

-- Location: LCCOMB_X59_Y53_N24
\CORE|DIVIDER|Add0~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \CORE|DIVIDER|Add0~0_combout\ = \CORE|DIVIDER|reg_quotient\(2) $ (((\CORE|DIVIDER|reg_quotient\(0) & \CORE|DIVIDER|reg_quotient\(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CORE|DIVIDER|reg_quotient\(0),
	datac => \CORE|DIVIDER|reg_quotient\(2),
	datad => \CORE|DIVIDER|reg_quotient\(1),
	combout => \CORE|DIVIDER|Add0~0_combout\);

-- Location: FF_X59_Y53_N25
\CORE|DIVIDER|reg_quotient[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \MAX10_CLK1_50~inputclkctrl_outclk\,
	d => \CORE|DIVIDER|Add0~0_combout\,
	sclr => \SW[9]~input_o\,
	ena => \CORE|DIVIDER|reg_quotient[3]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \CORE|DIVIDER|reg_quotient\(2));

-- Location: LCCOMB_X59_Y53_N0
\CORE|DIVIDER|Add0~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \CORE|DIVIDER|Add0~2_combout\ = \CORE|DIVIDER|reg_quotient\(3) $ (((\CORE|DIVIDER|reg_quotient\(0) & (\CORE|DIVIDER|reg_quotient\(1) & \CORE|DIVIDER|reg_quotient\(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111100011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CORE|DIVIDER|reg_quotient\(0),
	datab => \CORE|DIVIDER|reg_quotient\(1),
	datac => \CORE|DIVIDER|reg_quotient\(3),
	datad => \CORE|DIVIDER|reg_quotient\(2),
	combout => \CORE|DIVIDER|Add0~2_combout\);

-- Location: FF_X59_Y53_N1
\CORE|DIVIDER|reg_quotient[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \MAX10_CLK1_50~inputclkctrl_outclk\,
	d => \CORE|DIVIDER|Add0~2_combout\,
	sclr => \SW[9]~input_o\,
	ena => \CORE|DIVIDER|reg_quotient[3]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \CORE|DIVIDER|reg_quotient\(3));

-- Location: LCCOMB_X56_Y53_N0
\Mux6~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux6~2_combout\ = (\CORE|DIVIDER|reg_quotient\(0) & (!\CORE|DIVIDER|reg_quotient\(2) & (\CORE|DIVIDER|reg_quotient\(1) $ (!\CORE|DIVIDER|reg_quotient\(3))))) # (!\CORE|DIVIDER|reg_quotient\(0) & (\CORE|DIVIDER|reg_quotient\(2) & 
-- (\CORE|DIVIDER|reg_quotient\(1) $ (!\CORE|DIVIDER|reg_quotient\(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100000110000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CORE|DIVIDER|reg_quotient\(0),
	datab => \CORE|DIVIDER|reg_quotient\(1),
	datac => \CORE|DIVIDER|reg_quotient\(3),
	datad => \CORE|DIVIDER|reg_quotient\(2),
	combout => \Mux6~2_combout\);

-- Location: LCCOMB_X58_Y53_N24
\Mux6~3\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux6~3_combout\ = (\Mux6~2_combout\ & !\CORE|DIVIDER|div_by_zero~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Mux6~2_combout\,
	datac => \CORE|DIVIDER|div_by_zero~q\,
	combout => \Mux6~3_combout\);

-- Location: LCCOMB_X59_Y53_N26
\Mux5~3\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux5~3_combout\ = (\CORE|DIVIDER|reg_quotient\(0) & (\CORE|DIVIDER|reg_quotient\(3) $ (!\CORE|DIVIDER|reg_quotient\(1)))) # (!\CORE|DIVIDER|reg_quotient\(0) & (!\CORE|DIVIDER|reg_quotient\(3) & \CORE|DIVIDER|reg_quotient\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001100100100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CORE|DIVIDER|reg_quotient\(0),
	datab => \CORE|DIVIDER|reg_quotient\(3),
	datad => \CORE|DIVIDER|reg_quotient\(1),
	combout => \Mux5~3_combout\);

-- Location: LCCOMB_X59_Y53_N20
\Mux5~6\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux5~6_combout\ = (\CORE|DIVIDER|div_by_zero~q\) # ((\Mux5~3_combout\ & \CORE|DIVIDER|reg_quotient\(2)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \CORE|DIVIDER|div_by_zero~q\,
	datac => \Mux5~3_combout\,
	datad => \CORE|DIVIDER|reg_quotient\(2),
	combout => \Mux5~6_combout\);

-- Location: LCCOMB_X59_Y53_N14
\Mux4~3\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux4~3_combout\ = (\CORE|DIVIDER|reg_quotient\(1) & (!\CORE|DIVIDER|reg_quotient\(2) & !\CORE|DIVIDER|reg_quotient\(3))) # (!\CORE|DIVIDER|reg_quotient\(1) & (\CORE|DIVIDER|reg_quotient\(2) & \CORE|DIVIDER|reg_quotient\(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \CORE|DIVIDER|reg_quotient\(1),
	datac => \CORE|DIVIDER|reg_quotient\(2),
	datad => \CORE|DIVIDER|reg_quotient\(3),
	combout => \Mux4~3_combout\);

-- Location: LCCOMB_X59_Y53_N16
\Mux4~6\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux4~6_combout\ = (!\CORE|DIVIDER|div_by_zero~q\ & (\Mux4~3_combout\ & !\CORE|DIVIDER|reg_quotient\(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \CORE|DIVIDER|div_by_zero~q\,
	datac => \Mux4~3_combout\,
	datad => \CORE|DIVIDER|reg_quotient\(0),
	combout => \Mux4~6_combout\);

-- Location: LCCOMB_X59_Y53_N2
\Mux3~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux3~2_combout\ = (\CORE|DIVIDER|reg_quotient\(0) & ((\CORE|DIVIDER|reg_quotient\(3) & (\CORE|DIVIDER|reg_quotient\(1) & !\CORE|DIVIDER|reg_quotient\(2))) # (!\CORE|DIVIDER|reg_quotient\(3) & (\CORE|DIVIDER|reg_quotient\(1) $ 
-- (!\CORE|DIVIDER|reg_quotient\(2)))))) # (!\CORE|DIVIDER|reg_quotient\(0) & (\CORE|DIVIDER|reg_quotient\(2) & (\CORE|DIVIDER|reg_quotient\(3) $ (!\CORE|DIVIDER|reg_quotient\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110000110000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CORE|DIVIDER|reg_quotient\(0),
	datab => \CORE|DIVIDER|reg_quotient\(3),
	datac => \CORE|DIVIDER|reg_quotient\(1),
	datad => \CORE|DIVIDER|reg_quotient\(2),
	combout => \Mux3~2_combout\);

-- Location: LCCOMB_X62_Y53_N24
\Mux3~3\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux3~3_combout\ = (\Mux3~2_combout\ & !\CORE|DIVIDER|div_by_zero~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux3~2_combout\,
	datad => \CORE|DIVIDER|div_by_zero~q\,
	combout => \Mux3~3_combout\);

-- Location: LCCOMB_X59_Y53_N28
\Mux2~4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux2~4_combout\ = \CORE|DIVIDER|reg_quotient\(3) $ (!\CORE|DIVIDER|reg_quotient\(1))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \CORE|DIVIDER|reg_quotient\(3),
	datad => \CORE|DIVIDER|reg_quotient\(1),
	combout => \Mux2~4_combout\);

-- Location: LCCOMB_X59_Y53_N6
\Mux2~9\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux2~9_combout\ = (\CORE|DIVIDER|reg_quotient\(0)) # ((\CORE|DIVIDER|div_by_zero~q\) # ((\Mux2~4_combout\ & \CORE|DIVIDER|reg_quotient\(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CORE|DIVIDER|reg_quotient\(0),
	datab => \Mux2~4_combout\,
	datac => \CORE|DIVIDER|reg_quotient\(2),
	datad => \CORE|DIVIDER|div_by_zero~q\,
	combout => \Mux2~9_combout\);

-- Location: LCCOMB_X56_Y53_N18
\Mux1~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux1~2_combout\ = (\CORE|DIVIDER|reg_quotient\(1) & ((\CORE|DIVIDER|reg_quotient\(0) & ((!\CORE|DIVIDER|reg_quotient\(2)) # (!\CORE|DIVIDER|reg_quotient\(3)))) # (!\CORE|DIVIDER|reg_quotient\(0) & (!\CORE|DIVIDER|reg_quotient\(3) & 
-- !\CORE|DIVIDER|reg_quotient\(2))))) # (!\CORE|DIVIDER|reg_quotient\(1) & ((\CORE|DIVIDER|reg_quotient\(3) & ((\CORE|DIVIDER|reg_quotient\(2)))) # (!\CORE|DIVIDER|reg_quotient\(3) & (\CORE|DIVIDER|reg_quotient\(0) & !\CORE|DIVIDER|reg_quotient\(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011100010001110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CORE|DIVIDER|reg_quotient\(0),
	datab => \CORE|DIVIDER|reg_quotient\(1),
	datac => \CORE|DIVIDER|reg_quotient\(3),
	datad => \CORE|DIVIDER|reg_quotient\(2),
	combout => \Mux1~2_combout\);

-- Location: LCCOMB_X56_Y53_N24
\Mux1~3\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux1~3_combout\ = (\Mux1~2_combout\ & !\CORE|DIVIDER|div_by_zero~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Mux1~2_combout\,
	datad => \CORE|DIVIDER|div_by_zero~q\,
	combout => \Mux1~3_combout\);

-- Location: LCCOMB_X59_Y53_N8
\Mux0~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux0~2_combout\ = (\CORE|DIVIDER|reg_quotient\(2) & (((\CORE|DIVIDER|reg_quotient\(3)) # (!\CORE|DIVIDER|reg_quotient\(1))) # (!\CORE|DIVIDER|reg_quotient\(0)))) # (!\CORE|DIVIDER|reg_quotient\(2) & ((\CORE|DIVIDER|reg_quotient\(1) $ 
-- (\CORE|DIVIDER|reg_quotient\(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001101111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CORE|DIVIDER|reg_quotient\(0),
	datab => \CORE|DIVIDER|reg_quotient\(1),
	datac => \CORE|DIVIDER|reg_quotient\(2),
	datad => \CORE|DIVIDER|reg_quotient\(3),
	combout => \Mux0~2_combout\);

-- Location: LCCOMB_X59_Y53_N30
\Mux0~3\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux0~3_combout\ = (\Mux0~2_combout\) # (\CORE|DIVIDER|div_by_zero~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Mux0~2_combout\,
	datad => \CORE|DIVIDER|div_by_zero~q\,
	combout => \Mux0~3_combout\);

-- Location: LCCOMB_X59_Y53_N22
\LessThan0~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan0~0_combout\ = (\CORE|DIVIDER|div_by_zero~q\) # ((\CORE|DIVIDER|reg_quotient\(3) & ((\CORE|DIVIDER|reg_quotient\(1)) # (\CORE|DIVIDER|reg_quotient\(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CORE|DIVIDER|reg_quotient\(1),
	datab => \CORE|DIVIDER|reg_quotient\(3),
	datac => \CORE|DIVIDER|reg_quotient\(2),
	datad => \CORE|DIVIDER|div_by_zero~q\,
	combout => \LessThan0~0_combout\);

-- Location: LCCOMB_X57_Y53_N22
\CORE|DIVIDER|Remainder[1]~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \CORE|DIVIDER|Remainder[1]~2_combout\ = (\CORE|DIVIDER|div_by_zero~q\ & ((\SW[5]~input_o\))) # (!\CORE|DIVIDER|div_by_zero~q\ & (\CORE|DIVIDER|reg_dividend\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110010011100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CORE|DIVIDER|div_by_zero~q\,
	datab => \CORE|DIVIDER|reg_dividend\(1),
	datac => \SW[5]~input_o\,
	combout => \CORE|DIVIDER|Remainder[1]~2_combout\);

-- Location: LCCOMB_X57_Y53_N10
\r_ones[3]~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \r_ones[3]~2_combout\ = (\CORE|DIVIDER|div_by_zero~q\ & (((\SW[6]~input_o\)))) # (!\CORE|DIVIDER|div_by_zero~q\ & (!\CORE|DIVIDER|reg_dividend\(2) & (\CORE|DIVIDER|reg_dividend\(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101000010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CORE|DIVIDER|div_by_zero~q\,
	datab => \CORE|DIVIDER|reg_dividend\(2),
	datac => \CORE|DIVIDER|reg_dividend\(3),
	datad => \SW[6]~input_o\,
	combout => \r_ones[3]~2_combout\);

-- Location: LCCOMB_X57_Y53_N24
\r_ones[3]~3\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \r_ones[3]~3_combout\ = (!\CORE|DIVIDER|Remainder[1]~2_combout\ & ((\CORE|DIVIDER|div_by_zero~q\ & (\SW[7]~input_o\ & !\r_ones[3]~2_combout\)) # (!\CORE|DIVIDER|div_by_zero~q\ & ((\r_ones[3]~2_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010101000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CORE|DIVIDER|Remainder[1]~2_combout\,
	datab => \SW[7]~input_o\,
	datac => \CORE|DIVIDER|div_by_zero~q\,
	datad => \r_ones[3]~2_combout\,
	combout => \r_ones[3]~3_combout\);

-- Location: LCCOMB_X57_Y53_N4
\CORE|DIVIDER|Remainder[3]~3\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \CORE|DIVIDER|Remainder[3]~3_combout\ = (\CORE|DIVIDER|div_by_zero~q\ & ((\SW[7]~input_o\))) # (!\CORE|DIVIDER|div_by_zero~q\ & (\CORE|DIVIDER|reg_dividend\(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \CORE|DIVIDER|reg_dividend\(3),
	datac => \CORE|DIVIDER|div_by_zero~q\,
	datad => \SW[7]~input_o\,
	combout => \CORE|DIVIDER|Remainder[3]~3_combout\);

-- Location: LCCOMB_X57_Y53_N12
\CORE|DIVIDER|Remainder[2]~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \CORE|DIVIDER|Remainder[2]~1_combout\ = (\CORE|DIVIDER|div_by_zero~q\ & ((\SW[6]~input_o\))) # (!\CORE|DIVIDER|div_by_zero~q\ & (\CORE|DIVIDER|reg_dividend\(2)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \CORE|DIVIDER|reg_dividend\(2),
	datac => \CORE|DIVIDER|div_by_zero~q\,
	datad => \SW[6]~input_o\,
	combout => \CORE|DIVIDER|Remainder[2]~1_combout\);

-- Location: LCCOMB_X57_Y53_N8
\r_ones[2]~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \r_ones[2]~1_combout\ = (\CORE|DIVIDER|Remainder[2]~1_combout\ & ((\CORE|DIVIDER|Remainder[1]~2_combout\) # (!\CORE|DIVIDER|Remainder[3]~3_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CORE|DIVIDER|Remainder[1]~2_combout\,
	datac => \CORE|DIVIDER|Remainder[3]~3_combout\,
	datad => \CORE|DIVIDER|Remainder[2]~1_combout\,
	combout => \r_ones[2]~1_combout\);

-- Location: LCCOMB_X57_Y53_N30
\r_ones[1]~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \r_ones[1]~0_combout\ = (\CORE|DIVIDER|Remainder[1]~2_combout\ & (!\CORE|DIVIDER|Remainder[3]~3_combout\)) # (!\CORE|DIVIDER|Remainder[1]~2_combout\ & (\CORE|DIVIDER|Remainder[3]~3_combout\ & \CORE|DIVIDER|Remainder[2]~1_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CORE|DIVIDER|Remainder[1]~2_combout\,
	datac => \CORE|DIVIDER|Remainder[3]~3_combout\,
	datad => \CORE|DIVIDER|Remainder[2]~1_combout\,
	combout => \r_ones[1]~0_combout\);

-- Location: LCCOMB_X57_Y53_N18
\CORE|DIVIDER|Remainder[0]~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \CORE|DIVIDER|Remainder[0]~0_combout\ = (\CORE|DIVIDER|div_by_zero~q\ & (\SW[4]~input_o\)) # (!\CORE|DIVIDER|div_by_zero~q\ & ((\CORE|DIVIDER|reg_dividend\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW[4]~input_o\,
	datac => \CORE|DIVIDER|div_by_zero~q\,
	datad => \CORE|DIVIDER|reg_dividend\(0),
	combout => \CORE|DIVIDER|Remainder[0]~0_combout\);

-- Location: LCCOMB_X77_Y42_N8
\Mux20~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux20~0_combout\ = (\r_ones[3]~3_combout\ & (\r_ones[2]~1_combout\ $ ((\r_ones[1]~0_combout\)))) # (!\r_ones[3]~3_combout\ & (!\r_ones[1]~0_combout\ & (\r_ones[2]~1_combout\ $ (\CORE|DIVIDER|Remainder[0]~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010100100101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \r_ones[3]~3_combout\,
	datab => \r_ones[2]~1_combout\,
	datac => \r_ones[1]~0_combout\,
	datad => \CORE|DIVIDER|Remainder[0]~0_combout\,
	combout => \Mux20~0_combout\);

-- Location: LCCOMB_X77_Y42_N30
\Mux19~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux19~0_combout\ = (\r_ones[3]~3_combout\ & (\r_ones[2]~1_combout\ $ ((\r_ones[1]~0_combout\)))) # (!\r_ones[3]~3_combout\ & (\r_ones[2]~1_combout\ & (\r_ones[1]~0_combout\ $ (\CORE|DIVIDER|Remainder[0]~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010110001101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \r_ones[3]~3_combout\,
	datab => \r_ones[2]~1_combout\,
	datac => \r_ones[1]~0_combout\,
	datad => \CORE|DIVIDER|Remainder[0]~0_combout\,
	combout => \Mux19~0_combout\);

-- Location: LCCOMB_X77_Y42_N4
\Mux18~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux18~0_combout\ = (\r_ones[3]~3_combout\ & (\r_ones[2]~1_combout\ $ ((\r_ones[1]~0_combout\)))) # (!\r_ones[3]~3_combout\ & (!\r_ones[2]~1_combout\ & (\r_ones[1]~0_combout\ & !\CORE|DIVIDER|Remainder[0]~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010100000111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \r_ones[3]~3_combout\,
	datab => \r_ones[2]~1_combout\,
	datac => \r_ones[1]~0_combout\,
	datad => \CORE|DIVIDER|Remainder[0]~0_combout\,
	combout => \Mux18~0_combout\);

-- Location: LCCOMB_X77_Y42_N14
\Mux17~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux17~0_combout\ = (\r_ones[3]~3_combout\ & (\r_ones[2]~1_combout\ $ ((\r_ones[1]~0_combout\)))) # (!\r_ones[3]~3_combout\ & ((\r_ones[2]~1_combout\ & (\r_ones[1]~0_combout\ $ (!\CORE|DIVIDER|Remainder[0]~0_combout\))) # (!\r_ones[2]~1_combout\ & 
-- (!\r_ones[1]~0_combout\ & \CORE|DIVIDER|Remainder[0]~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100100101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \r_ones[3]~3_combout\,
	datab => \r_ones[2]~1_combout\,
	datac => \r_ones[1]~0_combout\,
	datad => \CORE|DIVIDER|Remainder[0]~0_combout\,
	combout => \Mux17~0_combout\);

-- Location: LCCOMB_X77_Y42_N16
\Mux16~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux16~0_combout\ = (\CORE|DIVIDER|Remainder[0]~0_combout\) # ((\r_ones[2]~1_combout\ & ((!\r_ones[1]~0_combout\))) # (!\r_ones[2]~1_combout\ & (\r_ones[3]~3_combout\ & \r_ones[1]~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \r_ones[3]~3_combout\,
	datab => \r_ones[2]~1_combout\,
	datac => \r_ones[1]~0_combout\,
	datad => \CORE|DIVIDER|Remainder[0]~0_combout\,
	combout => \Mux16~0_combout\);

-- Location: LCCOMB_X77_Y42_N10
\Mux15~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux15~0_combout\ = (\r_ones[3]~3_combout\ & (\r_ones[2]~1_combout\ $ ((\r_ones[1]~0_combout\)))) # (!\r_ones[3]~3_combout\ & ((\r_ones[2]~1_combout\ & (\r_ones[1]~0_combout\ & \CORE|DIVIDER|Remainder[0]~0_combout\)) # (!\r_ones[2]~1_combout\ & 
-- ((\r_ones[1]~0_combout\) # (\CORE|DIVIDER|Remainder[0]~0_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111100100111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \r_ones[3]~3_combout\,
	datab => \r_ones[2]~1_combout\,
	datac => \r_ones[1]~0_combout\,
	datad => \CORE|DIVIDER|Remainder[0]~0_combout\,
	combout => \Mux15~0_combout\);

-- Location: LCCOMB_X77_Y42_N12
\Mux14~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux14~0_combout\ = (\r_ones[3]~3_combout\ & (\r_ones[2]~1_combout\ $ ((!\r_ones[1]~0_combout\)))) # (!\r_ones[3]~3_combout\ & ((\r_ones[2]~1_combout\ & ((!\CORE|DIVIDER|Remainder[0]~0_combout\) # (!\r_ones[1]~0_combout\))) # (!\r_ones[2]~1_combout\ & 
-- (\r_ones[1]~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011011010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \r_ones[3]~3_combout\,
	datab => \r_ones[2]~1_combout\,
	datac => \r_ones[1]~0_combout\,
	datad => \CORE|DIVIDER|Remainder[0]~0_combout\,
	combout => \Mux14~0_combout\);

-- Location: LCCOMB_X57_Y53_N6
\LessThan1~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan1~0_combout\ = (\CORE|DIVIDER|Remainder[3]~3_combout\ & ((\CORE|DIVIDER|Remainder[1]~2_combout\) # (\CORE|DIVIDER|Remainder[2]~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CORE|DIVIDER|Remainder[1]~2_combout\,
	datac => \CORE|DIVIDER|Remainder[3]~3_combout\,
	datad => \CORE|DIVIDER|Remainder[2]~1_combout\,
	combout => \LessThan1~0_combout\);

-- Location: LCCOMB_X56_Y53_N4
\CORE|DIVIDER|Quotient[0]~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \CORE|DIVIDER|Quotient[0]~0_combout\ = (\CORE|DIVIDER|reg_quotient\(0)) # (\CORE|DIVIDER|div_by_zero~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CORE|DIVIDER|reg_quotient\(0),
	datad => \CORE|DIVIDER|div_by_zero~q\,
	combout => \CORE|DIVIDER|Quotient[0]~0_combout\);

-- Location: LCCOMB_X56_Y53_N14
\q_ones[3]~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \q_ones[3]~0_combout\ = (!\CORE|DIVIDER|div_by_zero~q\ & !\CORE|DIVIDER|reg_quotient\(1))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \CORE|DIVIDER|div_by_zero~q\,
	datad => \CORE|DIVIDER|reg_quotient\(1),
	combout => \q_ones[3]~0_combout\);

-- Location: LCCOMB_X56_Y53_N28
\CORE|DIVIDER|Quotient[2]~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \CORE|DIVIDER|Quotient[2]~1_combout\ = (\CORE|DIVIDER|div_by_zero~q\) # (\CORE|DIVIDER|reg_quotient\(2))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \CORE|DIVIDER|div_by_zero~q\,
	datad => \CORE|DIVIDER|reg_quotient\(2),
	combout => \CORE|DIVIDER|Quotient[2]~1_combout\);

-- Location: LCCOMB_X56_Y53_N6
\CORE|DIVIDER|Quotient[3]~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \CORE|DIVIDER|Quotient[3]~2_combout\ = (\CORE|DIVIDER|reg_quotient\(3)) # (\CORE|DIVIDER|div_by_zero~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \CORE|DIVIDER|reg_quotient\(3),
	datad => \CORE|DIVIDER|div_by_zero~q\,
	combout => \CORE|DIVIDER|Quotient[3]~2_combout\);

-- Location: LCCOMB_X58_Y53_N10
\CORE|LessThan2~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \CORE|LessThan2~0_combout\ = (\SW[5]~input_o\ & (((\SW[4]~input_o\ & !\SW[0]~input_o\)) # (!\SW[1]~input_o\))) # (!\SW[5]~input_o\ & (\SW[4]~input_o\ & (!\SW[0]~input_o\ & !\SW[1]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000100010101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW[5]~input_o\,
	datab => \SW[4]~input_o\,
	datac => \SW[0]~input_o\,
	datad => \SW[1]~input_o\,
	combout => \CORE|LessThan2~0_combout\);

-- Location: LCCOMB_X58_Y53_N28
\CORE|Is_Prime~4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \CORE|Is_Prime~4_combout\ = (\CORE|LessThan2~0_combout\ & ((\SW[6]~input_o\) # (!\SW[2]~input_o\))) # (!\CORE|LessThan2~0_combout\ & (!\SW[2]~input_o\ & \SW[6]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111100001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CORE|LessThan2~0_combout\,
	datac => \SW[2]~input_o\,
	datad => \SW[6]~input_o\,
	combout => \CORE|Is_Prime~4_combout\);

-- Location: LCCOMB_X59_Y53_N4
\CORE|Is_Prime~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \CORE|Is_Prime~1_combout\ = (\CORE|DIVIDER|reg_quotient\(1)) # ((\CORE|DIVIDER|reg_quotient\(3)) # ((\CORE|DIVIDER|reg_quotient\(2)) # (\CORE|DIVIDER|div_by_zero~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CORE|DIVIDER|reg_quotient\(1),
	datab => \CORE|DIVIDER|reg_quotient\(3),
	datac => \CORE|DIVIDER|reg_quotient\(2),
	datad => \CORE|DIVIDER|div_by_zero~q\,
	combout => \CORE|Is_Prime~1_combout\);

-- Location: LCCOMB_X58_Y53_N30
\CORE|Is_Prime~5\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \CORE|Is_Prime~5_combout\ = (\CORE|Is_Prime~1_combout\ & ((\CORE|Is_Prime~4_combout\ & ((\SW[7]~input_o\) # (!\SW[3]~input_o\))) # (!\CORE|Is_Prime~4_combout\ & (!\SW[3]~input_o\ & \SW[7]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011001000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CORE|Is_Prime~4_combout\,
	datab => \SW[3]~input_o\,
	datac => \SW[7]~input_o\,
	datad => \CORE|Is_Prime~1_combout\,
	combout => \CORE|Is_Prime~5_combout\);

-- Location: LCCOMB_X57_Y53_N28
\CORE|Is_Prime~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \CORE|Is_Prime~2_combout\ = (!\CORE|DIVIDER|Remainder[1]~2_combout\ & (!\CORE|DIVIDER|Remainder[0]~0_combout\ & (!\CORE|DIVIDER|Remainder[3]~3_combout\ & !\CORE|DIVIDER|Remainder[2]~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CORE|DIVIDER|Remainder[1]~2_combout\,
	datab => \CORE|DIVIDER|Remainder[0]~0_combout\,
	datac => \CORE|DIVIDER|Remainder[3]~3_combout\,
	datad => \CORE|DIVIDER|Remainder[2]~1_combout\,
	combout => \CORE|Is_Prime~2_combout\);

-- Location: LCCOMB_X58_Y53_N0
\CORE|DIVIDER|Equal0~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \CORE|DIVIDER|Equal0~0_combout\ = (!\SW[2]~input_o\ & (!\SW[3]~input_o\ & !\SW[1]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \SW[2]~input_o\,
	datac => \SW[3]~input_o\,
	datad => \SW[1]~input_o\,
	combout => \CORE|DIVIDER|Equal0~0_combout\);

-- Location: LCCOMB_X58_Y53_N4
\CORE|Is_Prime~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \CORE|Is_Prime~0_combout\ = (!\SW[7]~input_o\ & (!\SW[6]~input_o\ & !\SW[5]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000010001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW[7]~input_o\,
	datab => \SW[6]~input_o\,
	datad => \SW[5]~input_o\,
	combout => \CORE|Is_Prime~0_combout\);

-- Location: LCCOMB_X58_Y53_N22
\CORE|Is_Prime~3\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \CORE|Is_Prime~3_combout\ = (\CORE|Is_Prime~0_combout\) # ((\CORE|Is_Prime~5_combout\ & (\CORE|Is_Prime~2_combout\ & !\CORE|DIVIDER|Equal0~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CORE|Is_Prime~5_combout\,
	datab => \CORE|Is_Prime~2_combout\,
	datac => \CORE|DIVIDER|Equal0~0_combout\,
	datad => \CORE|Is_Prime~0_combout\,
	combout => \CORE|Is_Prime~3_combout\);

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



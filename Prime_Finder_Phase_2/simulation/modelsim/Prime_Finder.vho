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

-- DATE "12/09/2025 21:53:37"

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

ENTITY 	Prime_Finder_Parallel_Group55 IS
    PORT (
	N : IN std_logic_vector(3 DOWNTO 0);
	CLK : IN std_logic;
	Load : IN std_logic;
	Is_Prime : BUFFER std_logic;
	Done : BUFFER std_logic
	);
END Prime_Finder_Parallel_Group55;

-- Design Ports Information
-- Is_Prime	=>  Location: PIN_D6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Done	=>  Location: PIN_B2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- CLK	=>  Location: PIN_M8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Load	=>  Location: PIN_C4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- N[0]	=>  Location: PIN_C5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- N[1]	=>  Location: PIN_F7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- N[2]	=>  Location: PIN_E8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- N[3]	=>  Location: PIN_D5,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF Prime_Finder_Parallel_Group55 IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_N : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_CLK : std_logic;
SIGNAL ww_Load : std_logic;
SIGNAL ww_Is_Prime : std_logic;
SIGNAL ww_Done : std_logic;
SIGNAL \~QUARTUS_CREATED_ADC1~_CHSEL_bus\ : std_logic_vector(4 DOWNTO 0);
SIGNAL \~QUARTUS_CREATED_ADC2~_CHSEL_bus\ : std_logic_vector(4 DOWNTO 0);
SIGNAL \CLK~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \~QUARTUS_CREATED_GND~I_combout\ : std_logic;
SIGNAL \~QUARTUS_CREATED_UNVM~~busy\ : std_logic;
SIGNAL \~QUARTUS_CREATED_ADC1~~eoc\ : std_logic;
SIGNAL \~QUARTUS_CREATED_ADC2~~eoc\ : std_logic;
SIGNAL \Is_Prime~output_o\ : std_logic;
SIGNAL \Done~output_o\ : std_logic;
SIGNAL \CLK~input_o\ : std_logic;
SIGNAL \CLK~inputclkctrl_outclk\ : std_logic;
SIGNAL \N[0]~input_o\ : std_logic;
SIGNAL \Load~input_o\ : std_logic;
SIGNAL \N[1]~input_o\ : std_logic;
SIGNAL \N[2]~input_o\ : std_logic;
SIGNAL \DIV_BY_5|reg_dividend[2]~3_combout\ : std_logic;
SIGNAL \DIV_BY_5|reg_dividend[2]~4_combout\ : std_logic;
SIGNAL \DIV_BY_5|SUBTRACTOR|C~0_combout\ : std_logic;
SIGNAL \DIV_BY_5|reg_dividend[0]~1_combout\ : std_logic;
SIGNAL \DIV_BY_5|reg_dividend[0]~2_combout\ : std_logic;
SIGNAL \N[3]~input_o\ : std_logic;
SIGNAL \DIV_BY_5|reg_dividend[3]~5_combout\ : std_logic;
SIGNAL \DIV_BY_5|reg_dividend[3]~6_combout\ : std_logic;
SIGNAL \DIV_BY_5|reg_dividend~0_combout\ : std_logic;
SIGNAL \DIV_BY_5|done_i~q\ : std_logic;
SIGNAL \DIV_BY_3|reg_dividend[0]~3_combout\ : std_logic;
SIGNAL \Equal4~0_combout\ : std_logic;
SIGNAL \DIV_BY_3|SUBTRACTOR|C~0_combout\ : std_logic;
SIGNAL \DIV_BY_3|reg_dividend[0]~4_combout\ : std_logic;
SIGNAL \DIV_BY_3|reg_dividend[3]~6_combout\ : std_logic;
SIGNAL \DIV_BY_3|reg_dividend[3]~7_combout\ : std_logic;
SIGNAL \DIV_BY_3|reg_dividend[2]~8_combout\ : std_logic;
SIGNAL \DIV_BY_3|reg_dividend[2]~5_combout\ : std_logic;
SIGNAL \DIV_BY_3|reg_dividend~2_combout\ : std_logic;
SIGNAL \DIV_BY_3|done_i~q\ : std_logic;
SIGNAL \DIV_BY_2|reg_dividend[1]~3_combout\ : std_logic;
SIGNAL \DIV_BY_2|reg_dividend[1]~4_combout\ : std_logic;
SIGNAL \DIV_BY_2|reg_dividend[3]~1_combout\ : std_logic;
SIGNAL \DIV_BY_2|reg_dividend[3]~2_combout\ : std_logic;
SIGNAL \DIV_BY_2|reg_dividend[2]~5_combout\ : std_logic;
SIGNAL \DIV_BY_2|reg_dividend[2]~6_combout\ : std_logic;
SIGNAL \DIV_BY_2|reg_dividend~0_combout\ : std_logic;
SIGNAL \DIV_BY_2|done_i~q\ : std_logic;
SIGNAL \all_done~0_combout\ : std_logic;
SIGNAL \N_reg[2]~feeder_combout\ : std_logic;
SIGNAL \is_prime_internal~2_combout\ : std_logic;
SIGNAL \is_prime_internal~3_combout\ : std_logic;
SIGNAL \is_prime_internal~0_combout\ : std_logic;
SIGNAL \Equal3~0_combout\ : std_logic;
SIGNAL \is_prime_internal~1_combout\ : std_logic;
SIGNAL \is_prime_internal~4_combout\ : std_logic;
SIGNAL \DIV_BY_3|reg_dividend\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \DIV_BY_5|reg_dividend\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \DIV_BY_2|reg_dividend\ : std_logic_vector(3 DOWNTO 0);
SIGNAL N_reg : std_logic_vector(3 DOWNTO 0);
SIGNAL \DIV_BY_3|SUBTRACTOR|Diff\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \DIV_BY_5|SUBTRACTOR|Diff\ : std_logic_vector(3 DOWNTO 0);

COMPONENT hard_block
    PORT (
	devoe : IN std_logic;
	devclrn : IN std_logic;
	devpor : IN std_logic);
END COMPONENT;

BEGIN

ww_N <= N;
ww_CLK <= CLK;
ww_Load <= Load;
Is_Prime <= ww_Is_Prime;
Done <= ww_Done;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\~QUARTUS_CREATED_ADC1~_CHSEL_bus\ <= (\~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\);

\~QUARTUS_CREATED_ADC2~_CHSEL_bus\ <= (\~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\);

\CLK~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \CLK~input_o\);
auto_generated_inst : hard_block
PORT MAP (
	devoe => ww_devoe,
	devclrn => ww_devclrn,
	devpor => ww_devpor);

-- Location: LCCOMB_X44_Y50_N12
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

-- Location: IOOBUF_X22_Y39_N30
\Is_Prime~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \is_prime_internal~4_combout\,
	devoe => ww_devoe,
	o => \Is_Prime~output_o\);

-- Location: IOOBUF_X22_Y39_N16
\Done~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \all_done~0_combout\,
	devoe => ww_devoe,
	o => \Done~output_o\);

-- Location: IOIBUF_X0_Y18_N15
\CLK~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_CLK,
	o => \CLK~input_o\);

-- Location: CLKCTRL_G3
\CLK~inputclkctrl\ : fiftyfivenm_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \CLK~inputclkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \CLK~inputclkctrl_outclk\);

-- Location: IOIBUF_X24_Y39_N22
\N[0]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_N(0),
	o => \N[0]~input_o\);

-- Location: IOIBUF_X24_Y39_N1
\Load~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Load,
	o => \Load~input_o\);

-- Location: LCCOMB_X26_Y36_N16
\DIV_BY_5|SUBTRACTOR|Diff[1]\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \DIV_BY_5|SUBTRACTOR|Diff\(1) = \DIV_BY_5|reg_dividend\(1) $ (!\DIV_BY_5|reg_dividend\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \DIV_BY_5|reg_dividend\(1),
	datad => \DIV_BY_5|reg_dividend\(0),
	combout => \DIV_BY_5|SUBTRACTOR|Diff\(1));

-- Location: IOIBUF_X24_Y39_N15
\N[1]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_N(1),
	o => \N[1]~input_o\);

-- Location: FF_X26_Y36_N17
\DIV_BY_5|reg_dividend[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputclkctrl_outclk\,
	d => \DIV_BY_5|SUBTRACTOR|Diff\(1),
	asdata => \N[1]~input_o\,
	sload => \Load~input_o\,
	ena => \DIV_BY_5|reg_dividend[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \DIV_BY_5|reg_dividend\(1));

-- Location: LCCOMB_X26_Y36_N12
\DIV_BY_5|SUBTRACTOR|Diff[2]\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \DIV_BY_5|SUBTRACTOR|Diff\(2) = \DIV_BY_5|reg_dividend\(2) $ (((\DIV_BY_5|reg_dividend\(0)) # (\DIV_BY_5|reg_dividend\(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111101011010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \DIV_BY_5|reg_dividend\(0),
	datac => \DIV_BY_5|reg_dividend\(2),
	datad => \DIV_BY_5|reg_dividend\(1),
	combout => \DIV_BY_5|SUBTRACTOR|Diff\(2));

-- Location: IOIBUF_X24_Y39_N8
\N[2]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_N(2),
	o => \N[2]~input_o\);

-- Location: LCCOMB_X26_Y36_N18
\DIV_BY_5|reg_dividend[2]~3\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \DIV_BY_5|reg_dividend[2]~3_combout\ = (\N[2]~input_o\ & ((\Load~input_o\) # ((\DIV_BY_5|reg_dividend\(2) & !\DIV_BY_5|reg_dividend[0]~1_combout\)))) # (!\N[2]~input_o\ & (((\DIV_BY_5|reg_dividend\(2) & !\DIV_BY_5|reg_dividend[0]~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100011111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \N[2]~input_o\,
	datab => \Load~input_o\,
	datac => \DIV_BY_5|reg_dividend\(2),
	datad => \DIV_BY_5|reg_dividend[0]~1_combout\,
	combout => \DIV_BY_5|reg_dividend[2]~3_combout\);

-- Location: LCCOMB_X26_Y36_N22
\DIV_BY_5|reg_dividend[2]~4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \DIV_BY_5|reg_dividend[2]~4_combout\ = (\DIV_BY_5|reg_dividend[2]~3_combout\) # ((!\DIV_BY_5|reg_dividend~0_combout\ & (!\Load~input_o\ & \DIV_BY_5|SUBTRACTOR|Diff\(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \DIV_BY_5|reg_dividend~0_combout\,
	datab => \Load~input_o\,
	datac => \DIV_BY_5|SUBTRACTOR|Diff\(2),
	datad => \DIV_BY_5|reg_dividend[2]~3_combout\,
	combout => \DIV_BY_5|reg_dividend[2]~4_combout\);

-- Location: FF_X26_Y36_N23
\DIV_BY_5|reg_dividend[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputclkctrl_outclk\,
	d => \DIV_BY_5|reg_dividend[2]~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \DIV_BY_5|reg_dividend\(2));

-- Location: LCCOMB_X26_Y36_N20
\DIV_BY_5|SUBTRACTOR|C~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \DIV_BY_5|SUBTRACTOR|C~0_combout\ = (\DIV_BY_5|reg_dividend\(2) & ((\DIV_BY_5|reg_dividend\(0)) # (\DIV_BY_5|reg_dividend\(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \DIV_BY_5|reg_dividend\(0),
	datac => \DIV_BY_5|reg_dividend\(2),
	datad => \DIV_BY_5|reg_dividend\(1),
	combout => \DIV_BY_5|SUBTRACTOR|C~0_combout\);

-- Location: LCCOMB_X26_Y36_N0
\DIV_BY_5|reg_dividend[0]~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \DIV_BY_5|reg_dividend[0]~1_combout\ = (\Load~input_o\) # ((!\DIV_BY_5|done_i~q\ & ((\DIV_BY_5|reg_dividend\(3)) # (\DIV_BY_5|SUBTRACTOR|C~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001111110010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \DIV_BY_5|reg_dividend\(3),
	datab => \DIV_BY_5|done_i~q\,
	datac => \Load~input_o\,
	datad => \DIV_BY_5|SUBTRACTOR|C~0_combout\,
	combout => \DIV_BY_5|reg_dividend[0]~1_combout\);

-- Location: LCCOMB_X26_Y36_N8
\DIV_BY_5|reg_dividend[0]~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \DIV_BY_5|reg_dividend[0]~2_combout\ = (\DIV_BY_5|reg_dividend[0]~1_combout\ & ((\Load~input_o\ & (\N[0]~input_o\)) # (!\Load~input_o\ & ((!\DIV_BY_5|reg_dividend\(0)))))) # (!\DIV_BY_5|reg_dividend[0]~1_combout\ & (((\DIV_BY_5|reg_dividend\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000101111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \N[0]~input_o\,
	datab => \Load~input_o\,
	datac => \DIV_BY_5|reg_dividend\(0),
	datad => \DIV_BY_5|reg_dividend[0]~1_combout\,
	combout => \DIV_BY_5|reg_dividend[0]~2_combout\);

-- Location: FF_X26_Y36_N9
\DIV_BY_5|reg_dividend[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputclkctrl_outclk\,
	d => \DIV_BY_5|reg_dividend[0]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \DIV_BY_5|reg_dividend\(0));

-- Location: LCCOMB_X26_Y36_N24
\DIV_BY_5|SUBTRACTOR|Diff[3]\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \DIV_BY_5|SUBTRACTOR|Diff\(3) = \DIV_BY_5|reg_dividend\(3) $ (((\DIV_BY_5|reg_dividend\(2) & ((\DIV_BY_5|reg_dividend\(0)) # (\DIV_BY_5|reg_dividend\(1))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001111111100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \DIV_BY_5|reg_dividend\(0),
	datab => \DIV_BY_5|reg_dividend\(1),
	datac => \DIV_BY_5|reg_dividend\(2),
	datad => \DIV_BY_5|reg_dividend\(3),
	combout => \DIV_BY_5|SUBTRACTOR|Diff\(3));

-- Location: IOIBUF_X24_Y39_N29
\N[3]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_N(3),
	o => \N[3]~input_o\);

-- Location: LCCOMB_X26_Y36_N10
\DIV_BY_5|reg_dividend[3]~5\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \DIV_BY_5|reg_dividend[3]~5_combout\ = (\Load~input_o\ & (\N[3]~input_o\)) # (!\Load~input_o\ & (((\DIV_BY_5|reg_dividend\(3) & \DIV_BY_5|done_i~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010110010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \N[3]~input_o\,
	datab => \DIV_BY_5|reg_dividend\(3),
	datac => \Load~input_o\,
	datad => \DIV_BY_5|done_i~q\,
	combout => \DIV_BY_5|reg_dividend[3]~5_combout\);

-- Location: LCCOMB_X26_Y36_N28
\DIV_BY_5|reg_dividend[3]~6\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \DIV_BY_5|reg_dividend[3]~6_combout\ = (\DIV_BY_5|reg_dividend[3]~5_combout\) # ((!\DIV_BY_5|reg_dividend~0_combout\ & (!\DIV_BY_5|SUBTRACTOR|Diff\(3) & !\Load~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \DIV_BY_5|reg_dividend~0_combout\,
	datab => \DIV_BY_5|SUBTRACTOR|Diff\(3),
	datac => \Load~input_o\,
	datad => \DIV_BY_5|reg_dividend[3]~5_combout\,
	combout => \DIV_BY_5|reg_dividend[3]~6_combout\);

-- Location: FF_X26_Y36_N29
\DIV_BY_5|reg_dividend[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputclkctrl_outclk\,
	d => \DIV_BY_5|reg_dividend[3]~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \DIV_BY_5|reg_dividend\(3));

-- Location: LCCOMB_X26_Y36_N26
\DIV_BY_5|reg_dividend~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \DIV_BY_5|reg_dividend~0_combout\ = (\DIV_BY_5|done_i~q\) # ((!\DIV_BY_5|reg_dividend\(3) & !\DIV_BY_5|SUBTRACTOR|C~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \DIV_BY_5|done_i~q\,
	datac => \DIV_BY_5|reg_dividend\(3),
	datad => \DIV_BY_5|SUBTRACTOR|C~0_combout\,
	combout => \DIV_BY_5|reg_dividend~0_combout\);

-- Location: FF_X27_Y36_N25
\DIV_BY_5|done_i\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputclkctrl_outclk\,
	asdata => \DIV_BY_5|reg_dividend~0_combout\,
	sclr => \Load~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \DIV_BY_5|done_i~q\);

-- Location: LCCOMB_X25_Y36_N8
\DIV_BY_3|reg_dividend[0]~3\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \DIV_BY_3|reg_dividend[0]~3_combout\ = (\Load~input_o\ & (\N[0]~input_o\)) # (!\Load~input_o\ & ((\DIV_BY_3|reg_dividend\(0) $ (!\DIV_BY_3|reg_dividend~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100010001011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \N[0]~input_o\,
	datab => \Load~input_o\,
	datac => \DIV_BY_3|reg_dividend\(0),
	datad => \DIV_BY_3|reg_dividend~2_combout\,
	combout => \DIV_BY_3|reg_dividend[0]~3_combout\);

-- Location: FF_X25_Y36_N9
\DIV_BY_3|reg_dividend[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputclkctrl_outclk\,
	d => \DIV_BY_3|reg_dividend[0]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \DIV_BY_3|reg_dividend\(0));

-- Location: LCCOMB_X24_Y36_N8
\DIV_BY_3|SUBTRACTOR|Diff[1]\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \DIV_BY_3|SUBTRACTOR|Diff\(1) = \DIV_BY_3|reg_dividend\(1) $ (\DIV_BY_3|reg_dividend\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \DIV_BY_3|reg_dividend\(1),
	datad => \DIV_BY_3|reg_dividend\(0),
	combout => \DIV_BY_3|SUBTRACTOR|Diff\(1));

-- Location: LCCOMB_X25_Y36_N22
\Equal4~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Equal4~0_combout\ = (!\DIV_BY_3|reg_dividend\(2) & !\DIV_BY_3|reg_dividend\(3))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \DIV_BY_3|reg_dividend\(2),
	datad => \DIV_BY_3|reg_dividend\(3),
	combout => \Equal4~0_combout\);

-- Location: LCCOMB_X25_Y36_N18
\DIV_BY_3|SUBTRACTOR|C~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \DIV_BY_3|SUBTRACTOR|C~0_combout\ = (\DIV_BY_3|reg_dividend\(0) & \DIV_BY_3|reg_dividend\(1))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \DIV_BY_3|reg_dividend\(0),
	datad => \DIV_BY_3|reg_dividend\(1),
	combout => \DIV_BY_3|SUBTRACTOR|C~0_combout\);

-- Location: LCCOMB_X25_Y36_N12
\DIV_BY_3|reg_dividend[0]~4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \DIV_BY_3|reg_dividend[0]~4_combout\ = (\Load~input_o\) # ((!\DIV_BY_3|done_i~q\ & ((\DIV_BY_3|SUBTRACTOR|C~0_combout\) # (!\Equal4~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101110101011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Load~input_o\,
	datab => \DIV_BY_3|done_i~q\,
	datac => \Equal4~0_combout\,
	datad => \DIV_BY_3|SUBTRACTOR|C~0_combout\,
	combout => \DIV_BY_3|reg_dividend[0]~4_combout\);

-- Location: FF_X24_Y36_N9
\DIV_BY_3|reg_dividend[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputclkctrl_outclk\,
	d => \DIV_BY_3|SUBTRACTOR|Diff\(1),
	asdata => \N[1]~input_o\,
	sload => \Load~input_o\,
	ena => \DIV_BY_3|reg_dividend[0]~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \DIV_BY_3|reg_dividend\(1));

-- Location: LCCOMB_X25_Y36_N26
\DIV_BY_3|reg_dividend[3]~6\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \DIV_BY_3|reg_dividend[3]~6_combout\ = (\DIV_BY_3|reg_dividend\(2)) # ((\DIV_BY_3|done_i~q\) # ((\DIV_BY_3|reg_dividend\(0) & \DIV_BY_3|reg_dividend\(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111011111010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \DIV_BY_3|reg_dividend\(2),
	datab => \DIV_BY_3|reg_dividend\(0),
	datac => \DIV_BY_3|done_i~q\,
	datad => \DIV_BY_3|reg_dividend\(1),
	combout => \DIV_BY_3|reg_dividend[3]~6_combout\);

-- Location: LCCOMB_X25_Y36_N20
\DIV_BY_3|reg_dividend[3]~7\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \DIV_BY_3|reg_dividend[3]~7_combout\ = (\Load~input_o\ & (\N[3]~input_o\)) # (!\Load~input_o\ & (((\DIV_BY_3|reg_dividend\(3) & \DIV_BY_3|reg_dividend[3]~6_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Load~input_o\,
	datab => \N[3]~input_o\,
	datac => \DIV_BY_3|reg_dividend\(3),
	datad => \DIV_BY_3|reg_dividend[3]~6_combout\,
	combout => \DIV_BY_3|reg_dividend[3]~7_combout\);

-- Location: FF_X25_Y36_N21
\DIV_BY_3|reg_dividend[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputclkctrl_outclk\,
	d => \DIV_BY_3|reg_dividend[3]~7_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \DIV_BY_3|reg_dividend\(3));

-- Location: LCCOMB_X25_Y36_N14
\DIV_BY_3|reg_dividend[2]~8\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \DIV_BY_3|reg_dividend[2]~8_combout\ = (\DIV_BY_3|reg_dividend\(2) & (((!\DIV_BY_3|done_i~q\ & !\DIV_BY_3|SUBTRACTOR|C~0_combout\)))) # (!\DIV_BY_3|reg_dividend\(2) & (((\DIV_BY_3|done_i~q\) # (\DIV_BY_3|SUBTRACTOR|C~0_combout\)) # 
-- (!\DIV_BY_3|reg_dividend\(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010101011011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \DIV_BY_3|reg_dividend\(2),
	datab => \DIV_BY_3|reg_dividend\(3),
	datac => \DIV_BY_3|done_i~q\,
	datad => \DIV_BY_3|SUBTRACTOR|C~0_combout\,
	combout => \DIV_BY_3|reg_dividend[2]~8_combout\);

-- Location: LCCOMB_X25_Y36_N30
\DIV_BY_3|reg_dividend[2]~5\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \DIV_BY_3|reg_dividend[2]~5_combout\ = (\Load~input_o\ & (\N[2]~input_o\)) # (!\Load~input_o\ & ((!\DIV_BY_3|reg_dividend[2]~8_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000110110001101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Load~input_o\,
	datab => \N[2]~input_o\,
	datac => \DIV_BY_3|reg_dividend[2]~8_combout\,
	combout => \DIV_BY_3|reg_dividend[2]~5_combout\);

-- Location: FF_X25_Y36_N31
\DIV_BY_3|reg_dividend[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputclkctrl_outclk\,
	d => \DIV_BY_3|reg_dividend[2]~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \DIV_BY_3|reg_dividend\(2));

-- Location: LCCOMB_X25_Y36_N2
\DIV_BY_3|reg_dividend~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \DIV_BY_3|reg_dividend~2_combout\ = (\DIV_BY_3|done_i~q\) # ((!\DIV_BY_3|reg_dividend\(2) & (!\DIV_BY_3|reg_dividend\(3) & !\DIV_BY_3|SUBTRACTOR|C~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \DIV_BY_3|reg_dividend\(2),
	datab => \DIV_BY_3|reg_dividend\(3),
	datac => \DIV_BY_3|done_i~q\,
	datad => \DIV_BY_3|SUBTRACTOR|C~0_combout\,
	combout => \DIV_BY_3|reg_dividend~2_combout\);

-- Location: FF_X25_Y36_N3
\DIV_BY_3|done_i\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputclkctrl_outclk\,
	d => \DIV_BY_3|reg_dividend~2_combout\,
	sclr => \Load~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \DIV_BY_3|done_i~q\);

-- Location: LCCOMB_X25_Y36_N10
\DIV_BY_2|reg_dividend[1]~3\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \DIV_BY_2|reg_dividend[1]~3_combout\ = (\Load~input_o\ & (\N[1]~input_o\)) # (!\Load~input_o\ & (((\DIV_BY_2|reg_dividend\(1) & \DIV_BY_2|done_i~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Load~input_o\,
	datab => \N[1]~input_o\,
	datac => \DIV_BY_2|reg_dividend\(1),
	datad => \DIV_BY_2|done_i~q\,
	combout => \DIV_BY_2|reg_dividend[1]~3_combout\);

-- Location: LCCOMB_X25_Y36_N6
\DIV_BY_2|reg_dividend[1]~4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \DIV_BY_2|reg_dividend[1]~4_combout\ = (\DIV_BY_2|reg_dividend[1]~3_combout\) # ((!\DIV_BY_2|reg_dividend~0_combout\ & (!\Load~input_o\ & !\DIV_BY_2|reg_dividend\(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \DIV_BY_2|reg_dividend~0_combout\,
	datab => \Load~input_o\,
	datac => \DIV_BY_2|reg_dividend\(1),
	datad => \DIV_BY_2|reg_dividend[1]~3_combout\,
	combout => \DIV_BY_2|reg_dividend[1]~4_combout\);

-- Location: FF_X25_Y36_N7
\DIV_BY_2|reg_dividend[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputclkctrl_outclk\,
	d => \DIV_BY_2|reg_dividend[1]~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \DIV_BY_2|reg_dividend\(1));

-- Location: LCCOMB_X25_Y36_N16
\DIV_BY_2|reg_dividend[3]~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \DIV_BY_2|reg_dividend[3]~1_combout\ = (!\Load~input_o\ & ((\DIV_BY_2|reg_dividend\(1)) # ((\DIV_BY_2|reg_dividend\(2)) # (\DIV_BY_2|done_i~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \DIV_BY_2|reg_dividend\(1),
	datab => \DIV_BY_2|reg_dividend\(2),
	datac => \Load~input_o\,
	datad => \DIV_BY_2|done_i~q\,
	combout => \DIV_BY_2|reg_dividend[3]~1_combout\);

-- Location: LCCOMB_X25_Y36_N0
\DIV_BY_2|reg_dividend[3]~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \DIV_BY_2|reg_dividend[3]~2_combout\ = (\Load~input_o\ & ((\N[3]~input_o\) # ((\DIV_BY_2|reg_dividend\(3) & \DIV_BY_2|reg_dividend[3]~1_combout\)))) # (!\Load~input_o\ & (((\DIV_BY_2|reg_dividend\(3) & \DIV_BY_2|reg_dividend[3]~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Load~input_o\,
	datab => \N[3]~input_o\,
	datac => \DIV_BY_2|reg_dividend\(3),
	datad => \DIV_BY_2|reg_dividend[3]~1_combout\,
	combout => \DIV_BY_2|reg_dividend[3]~2_combout\);

-- Location: FF_X25_Y36_N1
\DIV_BY_2|reg_dividend[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputclkctrl_outclk\,
	d => \DIV_BY_2|reg_dividend[3]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \DIV_BY_2|reg_dividend\(3));

-- Location: LCCOMB_X25_Y36_N24
\DIV_BY_2|reg_dividend[2]~5\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \DIV_BY_2|reg_dividend[2]~5_combout\ = (\Load~input_o\ & (\N[2]~input_o\)) # (!\Load~input_o\ & (((\DIV_BY_2|reg_dividend\(1)) # (\DIV_BY_2|done_i~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110111011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Load~input_o\,
	datab => \N[2]~input_o\,
	datac => \DIV_BY_2|reg_dividend\(1),
	datad => \DIV_BY_2|done_i~q\,
	combout => \DIV_BY_2|reg_dividend[2]~5_combout\);

-- Location: LCCOMB_X25_Y36_N4
\DIV_BY_2|reg_dividend[2]~6\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \DIV_BY_2|reg_dividend[2]~6_combout\ = (\Load~input_o\ & (((\DIV_BY_2|reg_dividend[2]~5_combout\)))) # (!\Load~input_o\ & ((\DIV_BY_2|reg_dividend\(2) & ((\DIV_BY_2|reg_dividend[2]~5_combout\))) # (!\DIV_BY_2|reg_dividend\(2) & (\DIV_BY_2|reg_dividend\(3) 
-- & !\DIV_BY_2|reg_dividend[2]~5_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \DIV_BY_2|reg_dividend\(3),
	datab => \Load~input_o\,
	datac => \DIV_BY_2|reg_dividend\(2),
	datad => \DIV_BY_2|reg_dividend[2]~5_combout\,
	combout => \DIV_BY_2|reg_dividend[2]~6_combout\);

-- Location: FF_X25_Y36_N5
\DIV_BY_2|reg_dividend[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputclkctrl_outclk\,
	d => \DIV_BY_2|reg_dividend[2]~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \DIV_BY_2|reg_dividend\(2));

-- Location: LCCOMB_X25_Y36_N28
\DIV_BY_2|reg_dividend~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \DIV_BY_2|reg_dividend~0_combout\ = (\DIV_BY_2|done_i~q\) # ((!\DIV_BY_2|reg_dividend\(1) & (!\DIV_BY_2|reg_dividend\(2) & !\DIV_BY_2|reg_dividend\(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \DIV_BY_2|reg_dividend\(1),
	datab => \DIV_BY_2|reg_dividend\(2),
	datac => \DIV_BY_2|done_i~q\,
	datad => \DIV_BY_2|reg_dividend\(3),
	combout => \DIV_BY_2|reg_dividend~0_combout\);

-- Location: FF_X25_Y36_N29
\DIV_BY_2|done_i\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputclkctrl_outclk\,
	d => \DIV_BY_2|reg_dividend~0_combout\,
	sclr => \Load~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \DIV_BY_2|done_i~q\);

-- Location: LCCOMB_X26_Y36_N30
\all_done~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \all_done~0_combout\ = (\DIV_BY_5|done_i~q\ & (\DIV_BY_3|done_i~q\ & \DIV_BY_2|done_i~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \DIV_BY_5|done_i~q\,
	datac => \DIV_BY_3|done_i~q\,
	datad => \DIV_BY_2|done_i~q\,
	combout => \all_done~0_combout\);

-- Location: LCCOMB_X24_Y36_N6
\N_reg[2]~feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \N_reg[2]~feeder_combout\ = \N[2]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \N[2]~input_o\,
	combout => \N_reg[2]~feeder_combout\);

-- Location: FF_X24_Y36_N7
\N_reg[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputclkctrl_outclk\,
	d => \N_reg[2]~feeder_combout\,
	ena => \Load~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => N_reg(2));

-- Location: FF_X23_Y36_N29
\N_reg[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputclkctrl_outclk\,
	asdata => \N[3]~input_o\,
	sload => VCC,
	ena => \Load~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => N_reg(3));

-- Location: LCCOMB_X26_Y36_N14
\is_prime_internal~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \is_prime_internal~2_combout\ = (\DIV_BY_5|reg_dividend\(0)) # ((\DIV_BY_5|reg_dividend\(3)) # ((\DIV_BY_5|reg_dividend\(2)) # (\DIV_BY_5|reg_dividend\(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \DIV_BY_5|reg_dividend\(0),
	datab => \DIV_BY_5|reg_dividend\(3),
	datac => \DIV_BY_5|reg_dividend\(2),
	datad => \DIV_BY_5|reg_dividend\(1),
	combout => \is_prime_internal~2_combout\);

-- Location: LCCOMB_X23_Y36_N28
\is_prime_internal~3\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \is_prime_internal~3_combout\ = (\is_prime_internal~2_combout\ & ((N_reg(2)) # (N_reg(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => N_reg(2),
	datac => N_reg(3),
	datad => \is_prime_internal~2_combout\,
	combout => \is_prime_internal~3_combout\);

-- Location: FF_X23_Y36_N25
\DIV_BY_2|reg_dividend[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputclkctrl_outclk\,
	asdata => \N[0]~input_o\,
	sload => VCC,
	ena => \Load~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \DIV_BY_2|reg_dividend\(0));

-- Location: FF_X23_Y36_N31
\N_reg[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputclkctrl_outclk\,
	asdata => \N[1]~input_o\,
	sload => VCC,
	ena => \Load~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => N_reg(1));

-- Location: LCCOMB_X23_Y36_N30
\is_prime_internal~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \is_prime_internal~0_combout\ = (!N_reg(3) & ((N_reg(2) & (\DIV_BY_2|reg_dividend\(0) & !N_reg(1))) # (!N_reg(2) & ((N_reg(1))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => N_reg(2),
	datab => \DIV_BY_2|reg_dividend\(0),
	datac => N_reg(1),
	datad => N_reg(3),
	combout => \is_prime_internal~0_combout\);

-- Location: LCCOMB_X23_Y36_N24
\Equal3~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Equal3~0_combout\ = (!\DIV_BY_2|reg_dividend\(3) & (!\DIV_BY_2|reg_dividend\(2) & (!\DIV_BY_2|reg_dividend\(0) & !\DIV_BY_2|reg_dividend\(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \DIV_BY_2|reg_dividend\(3),
	datab => \DIV_BY_2|reg_dividend\(2),
	datac => \DIV_BY_2|reg_dividend\(0),
	datad => \DIV_BY_2|reg_dividend\(1),
	combout => \Equal3~0_combout\);

-- Location: LCCOMB_X24_Y36_N16
\is_prime_internal~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \is_prime_internal~1_combout\ = (!\Equal3~0_combout\ & ((\DIV_BY_3|reg_dividend\(0)) # ((\DIV_BY_3|reg_dividend\(1)) # (!\Equal4~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011101111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \DIV_BY_3|reg_dividend\(0),
	datab => \DIV_BY_3|reg_dividend\(1),
	datac => \Equal4~0_combout\,
	datad => \Equal3~0_combout\,
	combout => \is_prime_internal~1_combout\);

-- Location: LCCOMB_X23_Y36_N18
\is_prime_internal~4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \is_prime_internal~4_combout\ = (\all_done~0_combout\ & ((\is_prime_internal~0_combout\) # ((\is_prime_internal~3_combout\ & \is_prime_internal~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010100010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \all_done~0_combout\,
	datab => \is_prime_internal~3_combout\,
	datac => \is_prime_internal~0_combout\,
	datad => \is_prime_internal~1_combout\,
	combout => \is_prime_internal~4_combout\);

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

ww_Is_Prime <= \Is_Prime~output_o\;

ww_Done <= \Done~output_o\;
END structure;



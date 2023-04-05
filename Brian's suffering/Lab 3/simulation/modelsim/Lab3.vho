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

-- DATE "04/04/2023 13:30:19"

-- 
-- Device: Altera 5CEBA4F23C7 Package FBGA484
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY ALTERA;
LIBRARY ALTERA_LNSIM;
LIBRARY CYCLONEV;
LIBRARY IEEE;
USE ALTERA.ALTERA_PRIMITIVES_COMPONENTS.ALL;
USE ALTERA_LNSIM.ALTERA_LNSIM_COMPONENTS.ALL;
USE CYCLONEV.CYCLONEV_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	BCD IS
    PORT (
	Clk : IN std_logic;
	Direction : IN std_logic;
	Init : IN std_logic;
	Enable : IN std_logic;
	Q_Out : OUT std_logic_vector(3 DOWNTO 0)
	);
END BCD;

-- Design Ports Information
-- Q_Out[0]	=>  Location: PIN_P19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q_Out[1]	=>  Location: PIN_P22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q_Out[2]	=>  Location: PIN_P16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q_Out[3]	=>  Location: PIN_P17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Direction	=>  Location: PIN_R17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Init	=>  Location: PIN_R16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Clk	=>  Location: PIN_M16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Enable	=>  Location: PIN_R21,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF BCD IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_Clk : std_logic;
SIGNAL ww_Direction : std_logic;
SIGNAL ww_Init : std_logic;
SIGNAL ww_Enable : std_logic;
SIGNAL ww_Q_Out : std_logic_vector(3 DOWNTO 0);
SIGNAL \~QUARTUS_CREATED_GND~I_combout\ : std_logic;
SIGNAL \Clk~input_o\ : std_logic;
SIGNAL \Clk~inputCLKENA0_outclk\ : std_logic;
SIGNAL \Init~input_o\ : std_logic;
SIGNAL \Direction~input_o\ : std_logic;
SIGNAL \counter~0_combout\ : std_logic;
SIGNAL \Enable~input_o\ : std_logic;
SIGNAL \counter[0]~1_combout\ : std_logic;
SIGNAL \counter~3_combout\ : std_logic;
SIGNAL \counter~4_combout\ : std_logic;
SIGNAL \counter~2_combout\ : std_logic;
SIGNAL counter : std_logic_vector(3 DOWNTO 0);
SIGNAL \ALT_INV_Enable~input_o\ : std_logic;
SIGNAL \ALT_INV_Init~input_o\ : std_logic;
SIGNAL \ALT_INV_Direction~input_o\ : std_logic;
SIGNAL ALT_INV_counter : std_logic_vector(3 DOWNTO 0);

BEGIN

ww_Clk <= Clk;
ww_Direction <= Direction;
ww_Init <= Init;
ww_Enable <= Enable;
Q_Out <= ww_Q_Out;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
\ALT_INV_Enable~input_o\ <= NOT \Enable~input_o\;
\ALT_INV_Init~input_o\ <= NOT \Init~input_o\;
\ALT_INV_Direction~input_o\ <= NOT \Direction~input_o\;
ALT_INV_counter(3) <= NOT counter(3);
ALT_INV_counter(2) <= NOT counter(2);
ALT_INV_counter(1) <= NOT counter(1);
ALT_INV_counter(0) <= NOT counter(0);

-- Location: IOOBUF_X54_Y17_N39
\Q_Out[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => counter(0),
	devoe => ww_devoe,
	o => ww_Q_Out(0));

-- Location: IOOBUF_X54_Y16_N56
\Q_Out[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => counter(1),
	devoe => ww_devoe,
	o => ww_Q_Out(1));

-- Location: IOOBUF_X54_Y17_N5
\Q_Out[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => counter(2),
	devoe => ww_devoe,
	o => ww_Q_Out(2));

-- Location: IOOBUF_X54_Y17_N22
\Q_Out[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => counter(3),
	devoe => ww_devoe,
	o => ww_Q_Out(3));

-- Location: IOIBUF_X54_Y18_N61
\Clk~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Clk,
	o => \Clk~input_o\);

-- Location: CLKCTRL_G10
\Clk~inputCLKENA0\ : cyclonev_clkena
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	disable_mode => "low",
	ena_register_mode => "always enabled",
	ena_register_power_up => "high",
	test_syn => "high")
-- pragma translate_on
PORT MAP (
	inclk => \Clk~input_o\,
	outclk => \Clk~inputCLKENA0_outclk\);

-- Location: IOIBUF_X54_Y16_N4
\Init~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Init,
	o => \Init~input_o\);

-- Location: IOIBUF_X54_Y16_N21
\Direction~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Direction,
	o => \Direction~input_o\);

-- Location: LABCELL_X53_Y16_N30
\counter~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \counter~0_combout\ = ( !counter(0) & ( \Direction~input_o\ & ( !\Init~input_o\ ) ) ) # ( counter(0) & ( !\Direction~input_o\ & ( \Init~input_o\ ) ) ) # ( !counter(0) & ( !\Direction~input_o\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111001100110011001111001100110011000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_Init~input_o\,
	datae => ALT_INV_counter(0),
	dataf => \ALT_INV_Direction~input_o\,
	combout => \counter~0_combout\);

-- Location: IOIBUF_X54_Y16_N38
\Enable~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Enable,
	o => \Enable~input_o\);

-- Location: LABCELL_X53_Y16_N21
\counter[0]~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \counter[0]~1_combout\ = ( \Init~input_o\ & ( \Enable~input_o\ ) ) # ( !\Init~input_o\ & ( \Enable~input_o\ ) ) # ( \Init~input_o\ & ( !\Enable~input_o\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111111111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datae => \ALT_INV_Init~input_o\,
	dataf => \ALT_INV_Enable~input_o\,
	combout => \counter[0]~1_combout\);

-- Location: FF_X53_Y16_N32
\counter[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clk~inputCLKENA0_outclk\,
	d => \counter~0_combout\,
	ena => \counter[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => counter(0));

-- Location: LABCELL_X53_Y16_N42
\counter~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \counter~3_combout\ = ( counter(2) & ( counter(1) & ( (!\Init~input_o\ & ((!\Direction~input_o\) # (!counter(0)))) ) ) ) # ( !counter(2) & ( counter(1) & ( (!\Init~input_o\ & (\Direction~input_o\ & counter(0))) ) ) ) # ( counter(2) & ( !counter(1) & ( 
-- (!\Init~input_o\ & ((counter(0)) # (\Direction~input_o\))) ) ) ) # ( !counter(2) & ( !counter(1) & ( (!\Init~input_o\ & (counter(3) & (!\Direction~input_o\ & !counter(0)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0010000000000000000010101010101000000000000010101010101010100000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_Init~input_o\,
	datab => ALT_INV_counter(3),
	datac => \ALT_INV_Direction~input_o\,
	datad => ALT_INV_counter(0),
	datae => ALT_INV_counter(2),
	dataf => ALT_INV_counter(1),
	combout => \counter~3_combout\);

-- Location: FF_X53_Y16_N44
\counter[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clk~inputCLKENA0_outclk\,
	d => \counter~3_combout\,
	ena => \counter[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => counter(2));

-- Location: LABCELL_X53_Y16_N12
\counter~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \counter~4_combout\ = ( counter(3) & ( counter(1) & ( (!\Direction~input_o\) # ((!\Init~input_o\ & ((!counter(2)) # (!counter(0))))) ) ) ) # ( !counter(3) & ( counter(1) & ( (!\Init~input_o\ & (counter(2) & (\Direction~input_o\ & counter(0)))) # 
-- (\Init~input_o\ & (((!\Direction~input_o\)))) ) ) ) # ( counter(3) & ( !counter(1) & ( (!\Init~input_o\ & ((!\Direction~input_o\ $ (!counter(0))) # (counter(2)))) # (\Init~input_o\ & (((!\Direction~input_o\)))) ) ) ) # ( !counter(3) & ( !counter(1) & ( 
-- (!\Direction~input_o\ & (((!counter(2) & !counter(0))) # (\Init~input_o\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1101000001010000011110101111001001010000010100101111101011111000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_Init~input_o\,
	datab => ALT_INV_counter(2),
	datac => \ALT_INV_Direction~input_o\,
	datad => ALT_INV_counter(0),
	datae => ALT_INV_counter(3),
	dataf => ALT_INV_counter(1),
	combout => \counter~4_combout\);

-- Location: FF_X53_Y16_N14
\counter[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clk~inputCLKENA0_outclk\,
	d => \counter~4_combout\,
	ena => \counter[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => counter(3));

-- Location: LABCELL_X53_Y16_N24
\counter~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \counter~2_combout\ = ( counter(1) & ( counter(0) & ( (!\Init~input_o\ & !\Direction~input_o\) ) ) ) # ( !counter(1) & ( counter(0) & ( (!\Init~input_o\ & (\Direction~input_o\ & ((!counter(3)) # (counter(2))))) ) ) ) # ( counter(1) & ( !counter(0) & ( 
-- (!\Init~input_o\ & \Direction~input_o\) ) ) ) # ( !counter(1) & ( !counter(0) & ( (!\Init~input_o\ & (!\Direction~input_o\ & ((counter(2)) # (counter(3))))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0010000010100000000010100000101000001000000010101010000010100000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_Init~input_o\,
	datab => ALT_INV_counter(3),
	datac => \ALT_INV_Direction~input_o\,
	datad => ALT_INV_counter(2),
	datae => ALT_INV_counter(1),
	dataf => ALT_INV_counter(0),
	combout => \counter~2_combout\);

-- Location: FF_X53_Y16_N26
\counter[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clk~inputCLKENA0_outclk\,
	d => \counter~2_combout\,
	ena => \counter[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => counter(1));

-- Location: MLABCELL_X37_Y11_N0
\~QUARTUS_CREATED_GND~I\ : cyclonev_lcell_comb
-- Equation(s):

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
;
END structure;



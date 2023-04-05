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

-- DATE "04/05/2023 22:19:52"

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

ENTITY 	up_timer IS
    PORT (
	t_Clk : IN std_logic;
	Start : IN std_logic;
	Data_In : IN std_logic_vector(9 DOWNTO 0);
	Minute : OUT std_logic_vector(6 DOWNTO 0);
	time_out : OUT std_logic;
	SecondOne : OUT std_logic_vector(6 DOWNTO 0);
	SecondTen : OUT std_logic_vector(6 DOWNTO 0)
	);
END up_timer;

-- Design Ports Information
-- Minute[0]	=>  Location: PIN_AA2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Minute[1]	=>  Location: PIN_E2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Minute[2]	=>  Location: PIN_D3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Minute[3]	=>  Location: PIN_W2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Minute[4]	=>  Location: PIN_L17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Minute[5]	=>  Location: PIN_L2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Minute[6]	=>  Location: PIN_L1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- time_out	=>  Location: PIN_C1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SecondOne[0]	=>  Location: PIN_G2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SecondOne[1]	=>  Location: PIN_U8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SecondOne[2]	=>  Location: PIN_N19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SecondOne[3]	=>  Location: PIN_K22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SecondOne[4]	=>  Location: PIN_F7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SecondOne[5]	=>  Location: PIN_P16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SecondOne[6]	=>  Location: PIN_M18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SecondTen[0]	=>  Location: PIN_P6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SecondTen[1]	=>  Location: PIN_R5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SecondTen[2]	=>  Location: PIN_R6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SecondTen[3]	=>  Location: PIN_U7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SecondTen[4]	=>  Location: PIN_T8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SecondTen[5]	=>  Location: PIN_N6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SecondTen[6]	=>  Location: PIN_W9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- t_Clk	=>  Location: PIN_M16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Data_In[3]	=>  Location: PIN_AA1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Data_In[0]	=>  Location: PIN_N1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Data_In[1]	=>  Location: PIN_C2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Data_In[2]	=>  Location: PIN_L22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Data_In[8]	=>  Location: PIN_U1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Data_In[9]	=>  Location: PIN_G1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Data_In[4]	=>  Location: PIN_Y3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Data_In[5]	=>  Location: PIN_U2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Data_In[6]	=>  Location: PIN_W8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Data_In[7]	=>  Location: PIN_M22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Start	=>  Location: PIN_N2,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF up_timer IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_t_Clk : std_logic;
SIGNAL ww_Start : std_logic;
SIGNAL ww_Data_In : std_logic_vector(9 DOWNTO 0);
SIGNAL ww_Minute : std_logic_vector(6 DOWNTO 0);
SIGNAL ww_time_out : std_logic;
SIGNAL ww_SecondOne : std_logic_vector(6 DOWNTO 0);
SIGNAL ww_SecondTen : std_logic_vector(6 DOWNTO 0);
SIGNAL \~QUARTUS_CREATED_GND~I_combout\ : std_logic;
SIGNAL \t_Clk~input_o\ : std_logic;
SIGNAL \t_Clk~inputCLKENA0_outclk\ : std_logic;
SIGNAL \Data_In[3]~input_o\ : std_logic;
SIGNAL \Second1|counter~2_combout\ : std_logic;
SIGNAL \Start~input_o\ : std_logic;
SIGNAL \Data_In[8]~input_o\ : std_logic;
SIGNAL \Data_In[4]~input_o\ : std_logic;
SIGNAL \Data_In[9]~input_o\ : std_logic;
SIGNAL \Minute1|counter~3_combout\ : std_logic;
SIGNAL \Data_In[7]~input_o\ : std_logic;
SIGNAL \Data_In[5]~input_o\ : std_logic;
SIGNAL \Second2|counter~0_combout\ : std_logic;
SIGNAL \enable1~combout\ : std_logic;
SIGNAL \Second2|counter[3]~1_combout\ : std_logic;
SIGNAL \Second2|counter~4_combout\ : std_logic;
SIGNAL \Data_In[6]~input_o\ : std_logic;
SIGNAL \process_0~2_combout\ : std_logic;
SIGNAL \Data_In[1]~input_o\ : std_logic;
SIGNAL \Data_In[2]~input_o\ : std_logic;
SIGNAL \Data_In[0]~input_o\ : std_logic;
SIGNAL \process_0~0_combout\ : std_logic;
SIGNAL \secTen_reset~0_combout\ : std_logic;
SIGNAL \secTen_reset~combout\ : std_logic;
SIGNAL \Second2|counter~3_combout\ : std_logic;
SIGNAL \Second2|counter~2_combout\ : std_logic;
SIGNAL \sec2_segment|Equal0~0_combout\ : std_logic;
SIGNAL \enable2~0_combout\ : std_logic;
SIGNAL \enable2~combout\ : std_logic;
SIGNAL \Minute1|counter[1]~1_combout\ : std_logic;
SIGNAL \process_0~1_combout\ : std_logic;
SIGNAL \timeout~0_combout\ : std_logic;
SIGNAL \u_Enable~combout\ : std_logic;
SIGNAL \Second1|counter[3]~1_combout\ : std_logic;
SIGNAL \Second1|counter~4_combout\ : std_logic;
SIGNAL \Equal5~0_combout\ : std_logic;
SIGNAL \secOne_reset~0_combout\ : std_logic;
SIGNAL \secOne_reset~combout\ : std_logic;
SIGNAL \Second1|counter~3_combout\ : std_logic;
SIGNAL \Second1|counter~0_combout\ : std_logic;
SIGNAL \sec1_segment|Equal0~0_combout\ : std_logic;
SIGNAL \Minute1|counter~2_combout\ : std_logic;
SIGNAL \Minute1|counter~4_combout\ : std_logic;
SIGNAL \min_reset~0_combout\ : std_logic;
SIGNAL \min_reset~1_combout\ : std_logic;
SIGNAL \min_reset~combout\ : std_logic;
SIGNAL \Minute1|counter~0_combout\ : std_logic;
SIGNAL \min_segment|SevenSeg_out[0]~6_combout\ : std_logic;
SIGNAL \min_segment|SevenSeg_out[1]~5_combout\ : std_logic;
SIGNAL \min_segment|SevenSeg_out[2]~4_combout\ : std_logic;
SIGNAL \min_segment|SevenSeg_out[3]~3_combout\ : std_logic;
SIGNAL \min_segment|SevenSeg_out[4]~0_combout\ : std_logic;
SIGNAL \min_segment|SevenSeg_out[5]~2_combout\ : std_logic;
SIGNAL \min_segment|SevenSeg_out~1_combout\ : std_logic;
SIGNAL \timeout~combout\ : std_logic;
SIGNAL \sec1_segment|SevenSeg_out[0]~6_combout\ : std_logic;
SIGNAL \sec1_segment|SevenSeg_out[1]~5_combout\ : std_logic;
SIGNAL \sec1_segment|SevenSeg_out[2]~4_combout\ : std_logic;
SIGNAL \sec1_segment|SevenSeg_out[3]~3_combout\ : std_logic;
SIGNAL \sec1_segment|SevenSeg_out[4]~0_combout\ : std_logic;
SIGNAL \sec1_segment|SevenSeg_out[5]~2_combout\ : std_logic;
SIGNAL \sec1_segment|SevenSeg_out~1_combout\ : std_logic;
SIGNAL \sec2_segment|SevenSeg_out[0]~6_combout\ : std_logic;
SIGNAL \sec2_segment|SevenSeg_out[1]~5_combout\ : std_logic;
SIGNAL \sec2_segment|SevenSeg_out[2]~4_combout\ : std_logic;
SIGNAL \sec2_segment|SevenSeg_out[3]~3_combout\ : std_logic;
SIGNAL \sec2_segment|SevenSeg_out[4]~0_combout\ : std_logic;
SIGNAL \sec2_segment|SevenSeg_out[5]~2_combout\ : std_logic;
SIGNAL \sec2_segment|SevenSeg_out~1_combout\ : std_logic;
SIGNAL \Minute1|counter\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \Second1|counter\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \Second2|counter\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \ALT_INV_Start~input_o\ : std_logic;
SIGNAL \ALT_INV_Data_In[7]~input_o\ : std_logic;
SIGNAL \ALT_INV_Data_In[6]~input_o\ : std_logic;
SIGNAL \ALT_INV_Data_In[5]~input_o\ : std_logic;
SIGNAL \ALT_INV_Data_In[4]~input_o\ : std_logic;
SIGNAL \ALT_INV_Data_In[9]~input_o\ : std_logic;
SIGNAL \ALT_INV_Data_In[8]~input_o\ : std_logic;
SIGNAL \ALT_INV_Data_In[2]~input_o\ : std_logic;
SIGNAL \ALT_INV_Data_In[1]~input_o\ : std_logic;
SIGNAL \ALT_INV_Data_In[0]~input_o\ : std_logic;
SIGNAL \ALT_INV_Data_In[3]~input_o\ : std_logic;
SIGNAL \ALT_INV_enable1~combout\ : std_logic;
SIGNAL \ALT_INV_secTen_reset~combout\ : std_logic;
SIGNAL \ALT_INV_u_Enable~combout\ : std_logic;
SIGNAL \ALT_INV_secOne_reset~combout\ : std_logic;
SIGNAL \ALT_INV_enable2~combout\ : std_logic;
SIGNAL \ALT_INV_min_reset~combout\ : std_logic;
SIGNAL \ALT_INV_timeout~combout\ : std_logic;
SIGNAL \min_segment|ALT_INV_SevenSeg_out[1]~5_combout\ : std_logic;
SIGNAL \sec1_segment|ALT_INV_SevenSeg_out[1]~5_combout\ : std_logic;
SIGNAL \sec2_segment|ALT_INV_SevenSeg_out[1]~5_combout\ : std_logic;
SIGNAL \ALT_INV_secTen_reset~0_combout\ : std_logic;
SIGNAL \ALT_INV_secOne_reset~0_combout\ : std_logic;
SIGNAL \ALT_INV_enable2~0_combout\ : std_logic;
SIGNAL \ALT_INV_min_reset~1_combout\ : std_logic;
SIGNAL \ALT_INV_min_reset~0_combout\ : std_logic;
SIGNAL \sec2_segment|ALT_INV_Equal0~0_combout\ : std_logic;
SIGNAL \ALT_INV_timeout~0_combout\ : std_logic;
SIGNAL \ALT_INV_process_0~2_combout\ : std_logic;
SIGNAL \ALT_INV_process_0~1_combout\ : std_logic;
SIGNAL \ALT_INV_process_0~0_combout\ : std_logic;
SIGNAL \sec1_segment|ALT_INV_Equal0~0_combout\ : std_logic;
SIGNAL \ALT_INV_Equal5~0_combout\ : std_logic;
SIGNAL \sec2_segment|ALT_INV_SevenSeg_out~1_combout\ : std_logic;
SIGNAL \Second2|ALT_INV_counter\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \sec1_segment|ALT_INV_SevenSeg_out~1_combout\ : std_logic;
SIGNAL \Second1|ALT_INV_counter\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \min_segment|ALT_INV_SevenSeg_out~1_combout\ : std_logic;
SIGNAL \Minute1|ALT_INV_counter\ : std_logic_vector(3 DOWNTO 0);

BEGIN

ww_t_Clk <= t_Clk;
ww_Start <= Start;
ww_Data_In <= Data_In;
Minute <= ww_Minute;
time_out <= ww_time_out;
SecondOne <= ww_SecondOne;
SecondTen <= ww_SecondTen;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
\ALT_INV_Start~input_o\ <= NOT \Start~input_o\;
\ALT_INV_Data_In[7]~input_o\ <= NOT \Data_In[7]~input_o\;
\ALT_INV_Data_In[6]~input_o\ <= NOT \Data_In[6]~input_o\;
\ALT_INV_Data_In[5]~input_o\ <= NOT \Data_In[5]~input_o\;
\ALT_INV_Data_In[4]~input_o\ <= NOT \Data_In[4]~input_o\;
\ALT_INV_Data_In[9]~input_o\ <= NOT \Data_In[9]~input_o\;
\ALT_INV_Data_In[8]~input_o\ <= NOT \Data_In[8]~input_o\;
\ALT_INV_Data_In[2]~input_o\ <= NOT \Data_In[2]~input_o\;
\ALT_INV_Data_In[1]~input_o\ <= NOT \Data_In[1]~input_o\;
\ALT_INV_Data_In[0]~input_o\ <= NOT \Data_In[0]~input_o\;
\ALT_INV_Data_In[3]~input_o\ <= NOT \Data_In[3]~input_o\;
\ALT_INV_enable1~combout\ <= NOT \enable1~combout\;
\ALT_INV_secTen_reset~combout\ <= NOT \secTen_reset~combout\;
\ALT_INV_u_Enable~combout\ <= NOT \u_Enable~combout\;
\ALT_INV_secOne_reset~combout\ <= NOT \secOne_reset~combout\;
\ALT_INV_enable2~combout\ <= NOT \enable2~combout\;
\ALT_INV_min_reset~combout\ <= NOT \min_reset~combout\;
\ALT_INV_timeout~combout\ <= NOT \timeout~combout\;
\min_segment|ALT_INV_SevenSeg_out[1]~5_combout\ <= NOT \min_segment|SevenSeg_out[1]~5_combout\;
\sec1_segment|ALT_INV_SevenSeg_out[1]~5_combout\ <= NOT \sec1_segment|SevenSeg_out[1]~5_combout\;
\sec2_segment|ALT_INV_SevenSeg_out[1]~5_combout\ <= NOT \sec2_segment|SevenSeg_out[1]~5_combout\;
\ALT_INV_secTen_reset~0_combout\ <= NOT \secTen_reset~0_combout\;
\ALT_INV_secOne_reset~0_combout\ <= NOT \secOne_reset~0_combout\;
\ALT_INV_enable2~0_combout\ <= NOT \enable2~0_combout\;
\ALT_INV_min_reset~1_combout\ <= NOT \min_reset~1_combout\;
\ALT_INV_min_reset~0_combout\ <= NOT \min_reset~0_combout\;
\sec2_segment|ALT_INV_Equal0~0_combout\ <= NOT \sec2_segment|Equal0~0_combout\;
\ALT_INV_timeout~0_combout\ <= NOT \timeout~0_combout\;
\ALT_INV_process_0~2_combout\ <= NOT \process_0~2_combout\;
\ALT_INV_process_0~1_combout\ <= NOT \process_0~1_combout\;
\ALT_INV_process_0~0_combout\ <= NOT \process_0~0_combout\;
\sec1_segment|ALT_INV_Equal0~0_combout\ <= NOT \sec1_segment|Equal0~0_combout\;
\ALT_INV_Equal5~0_combout\ <= NOT \Equal5~0_combout\;
\sec2_segment|ALT_INV_SevenSeg_out~1_combout\ <= NOT \sec2_segment|SevenSeg_out~1_combout\;
\Second2|ALT_INV_counter\(3) <= NOT \Second2|counter\(3);
\Second2|ALT_INV_counter\(0) <= NOT \Second2|counter\(0);
\Second2|ALT_INV_counter\(2) <= NOT \Second2|counter\(2);
\Second2|ALT_INV_counter\(1) <= NOT \Second2|counter\(1);
\sec1_segment|ALT_INV_SevenSeg_out~1_combout\ <= NOT \sec1_segment|SevenSeg_out~1_combout\;
\Second1|ALT_INV_counter\(3) <= NOT \Second1|counter\(3);
\Second1|ALT_INV_counter\(0) <= NOT \Second1|counter\(0);
\Second1|ALT_INV_counter\(2) <= NOT \Second1|counter\(2);
\Second1|ALT_INV_counter\(1) <= NOT \Second1|counter\(1);
\min_segment|ALT_INV_SevenSeg_out~1_combout\ <= NOT \min_segment|SevenSeg_out~1_combout\;
\Minute1|ALT_INV_counter\(3) <= NOT \Minute1|counter\(3);
\Minute1|ALT_INV_counter\(0) <= NOT \Minute1|counter\(0);
\Minute1|ALT_INV_counter\(2) <= NOT \Minute1|counter\(2);
\Minute1|ALT_INV_counter\(1) <= NOT \Minute1|counter\(1);

-- Location: IOOBUF_X0_Y18_N79
\Minute[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \min_segment|SevenSeg_out[0]~6_combout\,
	devoe => ww_devoe,
	o => ww_Minute(0));

-- Location: IOOBUF_X0_Y20_N22
\Minute[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \min_segment|ALT_INV_SevenSeg_out[1]~5_combout\,
	devoe => ww_devoe,
	o => ww_Minute(1));

-- Location: IOOBUF_X0_Y20_N5
\Minute[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \min_segment|SevenSeg_out[2]~4_combout\,
	devoe => ww_devoe,
	o => ww_Minute(2));

-- Location: IOOBUF_X0_Y18_N62
\Minute[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \min_segment|SevenSeg_out[3]~3_combout\,
	devoe => ww_devoe,
	o => ww_Minute(3));

-- Location: IOOBUF_X54_Y20_N22
\Minute[4]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \min_segment|SevenSeg_out[4]~0_combout\,
	devoe => ww_devoe,
	o => ww_Minute(4));

-- Location: IOOBUF_X0_Y20_N39
\Minute[5]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \min_segment|SevenSeg_out[5]~2_combout\,
	devoe => ww_devoe,
	o => ww_Minute(5));

-- Location: IOOBUF_X0_Y20_N56
\Minute[6]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \min_segment|ALT_INV_SevenSeg_out~1_combout\,
	devoe => ww_devoe,
	o => ww_Minute(6));

-- Location: IOOBUF_X0_Y21_N56
\time_out~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \timeout~combout\,
	devoe => ww_devoe,
	o => ww_time_out);

-- Location: IOOBUF_X0_Y21_N5
\SecondOne[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \sec1_segment|SevenSeg_out[0]~6_combout\,
	devoe => ww_devoe,
	o => ww_SecondOne(0));

-- Location: IOOBUF_X10_Y0_N76
\SecondOne[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \sec1_segment|ALT_INV_SevenSeg_out[1]~5_combout\,
	devoe => ww_devoe,
	o => ww_SecondOne(1));

-- Location: IOOBUF_X54_Y19_N5
\SecondOne[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \sec1_segment|SevenSeg_out[2]~4_combout\,
	devoe => ww_devoe,
	o => ww_SecondOne(2));

-- Location: IOOBUF_X54_Y21_N56
\SecondOne[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \sec1_segment|SevenSeg_out[3]~3_combout\,
	devoe => ww_devoe,
	o => ww_SecondOne(3));

-- Location: IOOBUF_X8_Y45_N76
\SecondOne[4]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \sec1_segment|SevenSeg_out[4]~0_combout\,
	devoe => ww_devoe,
	o => ww_SecondOne(4));

-- Location: IOOBUF_X54_Y17_N5
\SecondOne[5]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \sec1_segment|SevenSeg_out[5]~2_combout\,
	devoe => ww_devoe,
	o => ww_SecondOne(5));

-- Location: IOOBUF_X54_Y19_N22
\SecondOne[6]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \sec1_segment|ALT_INV_SevenSeg_out~1_combout\,
	devoe => ww_devoe,
	o => ww_SecondOne(6));

-- Location: IOOBUF_X11_Y0_N19
\SecondTen[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \sec2_segment|SevenSeg_out[0]~6_combout\,
	devoe => ww_devoe,
	o => ww_SecondTen(0));

-- Location: IOOBUF_X10_Y0_N42
\SecondTen[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \sec2_segment|ALT_INV_SevenSeg_out[1]~5_combout\,
	devoe => ww_devoe,
	o => ww_SecondTen(1));

-- Location: IOOBUF_X10_Y0_N59
\SecondTen[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \sec2_segment|SevenSeg_out[2]~4_combout\,
	devoe => ww_devoe,
	o => ww_SecondTen(2));

-- Location: IOOBUF_X10_Y0_N93
\SecondTen[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \sec2_segment|SevenSeg_out[3]~3_combout\,
	devoe => ww_devoe,
	o => ww_SecondTen(3));

-- Location: IOOBUF_X12_Y0_N2
\SecondTen[4]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \sec2_segment|SevenSeg_out[4]~0_combout\,
	devoe => ww_devoe,
	o => ww_SecondTen(4));

-- Location: IOOBUF_X11_Y0_N2
\SecondTen[5]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \sec2_segment|SevenSeg_out[5]~2_combout\,
	devoe => ww_devoe,
	o => ww_SecondTen(5));

-- Location: IOOBUF_X11_Y0_N36
\SecondTen[6]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \sec2_segment|ALT_INV_SevenSeg_out~1_combout\,
	devoe => ww_devoe,
	o => ww_SecondTen(6));

-- Location: IOIBUF_X54_Y18_N61
\t_Clk~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_t_Clk,
	o => \t_Clk~input_o\);

-- Location: CLKCTRL_G10
\t_Clk~inputCLKENA0\ : cyclonev_clkena
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	disable_mode => "low",
	ena_register_mode => "always enabled",
	ena_register_power_up => "high",
	test_syn => "high")
-- pragma translate_on
PORT MAP (
	inclk => \t_Clk~input_o\,
	outclk => \t_Clk~inputCLKENA0_outclk\);

-- Location: IOIBUF_X0_Y18_N95
\Data_In[3]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Data_In(3),
	o => \Data_In[3]~input_o\);

-- Location: LABCELL_X1_Y19_N54
\Second1|counter~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \Second1|counter~2_combout\ = ( \Second1|counter\(0) & ( (!\secOne_reset~combout\ & (!\Second1|counter\(1) $ (!\Second1|counter\(2)))) ) ) # ( !\Second1|counter\(0) & ( (!\secOne_reset~combout\ & \Second1|counter\(2)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000010101010000000001010101000001010101000000000101010100000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_secOne_reset~combout\,
	datac => \Second1|ALT_INV_counter\(1),
	datad => \Second1|ALT_INV_counter\(2),
	dataf => \Second1|ALT_INV_counter\(0),
	combout => \Second1|counter~2_combout\);

-- Location: IOIBUF_X0_Y19_N38
\Start~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Start,
	o => \Start~input_o\);

-- Location: IOIBUF_X0_Y19_N21
\Data_In[8]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Data_In(8),
	o => \Data_In[8]~input_o\);

-- Location: IOIBUF_X0_Y18_N44
\Data_In[4]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Data_In(4),
	o => \Data_In[4]~input_o\);

-- Location: IOIBUF_X0_Y21_N21
\Data_In[9]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Data_In(9),
	o => \Data_In[9]~input_o\);

-- Location: LABCELL_X1_Y19_N42
\Minute1|counter~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \Minute1|counter~3_combout\ = ( !\min_reset~combout\ & ( !\Minute1|counter\(0) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111100000000111111110000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \Minute1|ALT_INV_counter\(0),
	dataf => \ALT_INV_min_reset~combout\,
	combout => \Minute1|counter~3_combout\);

-- Location: IOIBUF_X54_Y19_N38
\Data_In[7]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Data_In(7),
	o => \Data_In[7]~input_o\);

-- Location: IOIBUF_X0_Y19_N4
\Data_In[5]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Data_In(5),
	o => \Data_In[5]~input_o\);

-- Location: LABCELL_X1_Y19_N18
\Second2|counter~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Second2|counter~0_combout\ = ( \Second2|counter\(3) & ( (!\secTen_reset~combout\ & ((!\Second2|counter\(0) & ((\Second2|counter\(1)))) # (\Second2|counter\(0) & (\Second2|counter\(2) & !\Second2|counter\(1))))) ) ) # ( !\Second2|counter\(3) & ( 
-- (!\secTen_reset~combout\ & (!\Second2|counter\(0) $ (!\Second2|counter\(1)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0100010010001000010001001000100000000100100010000000010010001000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Second2|ALT_INV_counter\(0),
	datab => \ALT_INV_secTen_reset~combout\,
	datac => \Second2|ALT_INV_counter\(2),
	datad => \Second2|ALT_INV_counter\(1),
	dataf => \Second2|ALT_INV_counter\(3),
	combout => \Second2|counter~0_combout\);

-- Location: LABCELL_X1_Y19_N0
enable1 : cyclonev_lcell_comb
-- Equation(s):
-- \enable1~combout\ = ( \sec1_segment|Equal0~0_combout\ & ( (!\Start~input_o\) # (\enable1~combout\) ) ) # ( !\sec1_segment|Equal0~0_combout\ & ( (\Start~input_o\ & \enable1~combout\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000001111000000000000111111110000111111111111000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_Start~input_o\,
	datad => \ALT_INV_enable1~combout\,
	dataf => \sec1_segment|ALT_INV_Equal0~0_combout\,
	combout => \enable1~combout\);

-- Location: LABCELL_X1_Y19_N15
\Second2|counter[3]~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \Second2|counter[3]~1_combout\ = ( \secTen_reset~combout\ ) # ( !\secTen_reset~combout\ & ( \enable1~combout\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100001111000011110000111111111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_enable1~combout\,
	dataf => \ALT_INV_secTen_reset~combout\,
	combout => \Second2|counter[3]~1_combout\);

-- Location: FF_X1_Y19_N20
\Second2|counter[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \t_Clk~inputCLKENA0_outclk\,
	d => \Second2|counter~0_combout\,
	ena => \Second2|counter[3]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Second2|counter\(1));

-- Location: LABCELL_X1_Y19_N9
\Second2|counter~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \Second2|counter~4_combout\ = ( \Second2|counter\(2) & ( (!\secTen_reset~combout\ & (!\Second2|counter\(3) $ (((!\Second2|counter\(1)) # (!\Second2|counter\(0)))))) ) ) # ( !\Second2|counter\(2) & ( (!\secTen_reset~combout\ & (\Second2|counter\(3) & 
-- ((!\Second2|counter\(0)) # (\Second2|counter\(1))))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011000100000000001100010000000100110010000000010011001000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Second2|ALT_INV_counter\(1),
	datab => \ALT_INV_secTen_reset~combout\,
	datac => \Second2|ALT_INV_counter\(0),
	datad => \Second2|ALT_INV_counter\(3),
	dataf => \Second2|ALT_INV_counter\(2),
	combout => \Second2|counter~4_combout\);

-- Location: FF_X1_Y19_N11
\Second2|counter[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \t_Clk~inputCLKENA0_outclk\,
	d => \Second2|counter~4_combout\,
	ena => \Second2|counter[3]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Second2|counter\(3));

-- Location: IOIBUF_X11_Y0_N52
\Data_In[6]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Data_In(6),
	o => \Data_In[6]~input_o\);

-- Location: LABCELL_X2_Y19_N42
\process_0~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \process_0~2_combout\ = ( \Second2|counter\(2) & ( \Second2|counter\(1) & ( (\Data_In[5]~input_o\ & (\Data_In[6]~input_o\ & (!\Data_In[7]~input_o\ $ (\Second2|counter\(3))))) ) ) ) # ( !\Second2|counter\(2) & ( \Second2|counter\(1) & ( 
-- (\Data_In[5]~input_o\ & (!\Data_In[6]~input_o\ & (!\Data_In[7]~input_o\ $ (\Second2|counter\(3))))) ) ) ) # ( \Second2|counter\(2) & ( !\Second2|counter\(1) & ( (!\Data_In[5]~input_o\ & (\Data_In[6]~input_o\ & (!\Data_In[7]~input_o\ $ 
-- (\Second2|counter\(3))))) ) ) ) # ( !\Second2|counter\(2) & ( !\Second2|counter\(1) & ( (!\Data_In[5]~input_o\ & (!\Data_In[6]~input_o\ & (!\Data_In[7]~input_o\ $ (\Second2|counter\(3))))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1000010000000000000000001000010000100001000000000000000000100001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_Data_In[7]~input_o\,
	datab => \ALT_INV_Data_In[5]~input_o\,
	datac => \Second2|ALT_INV_counter\(3),
	datad => \ALT_INV_Data_In[6]~input_o\,
	datae => \Second2|ALT_INV_counter\(2),
	dataf => \Second2|ALT_INV_counter\(1),
	combout => \process_0~2_combout\);

-- Location: IOIBUF_X0_Y21_N38
\Data_In[1]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Data_In(1),
	o => \Data_In[1]~input_o\);

-- Location: IOIBUF_X54_Y19_N55
\Data_In[2]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Data_In(2),
	o => \Data_In[2]~input_o\);

-- Location: IOIBUF_X0_Y19_N55
\Data_In[0]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Data_In(0),
	o => \Data_In[0]~input_o\);

-- Location: LABCELL_X2_Y19_N18
\process_0~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \process_0~0_combout\ = ( \Second1|counter\(2) & ( \Data_In[0]~input_o\ & ( (\Data_In[2]~input_o\ & (\Second1|counter\(0) & (!\Data_In[1]~input_o\ $ (\Second1|counter\(1))))) ) ) ) # ( !\Second1|counter\(2) & ( \Data_In[0]~input_o\ & ( 
-- (!\Data_In[2]~input_o\ & (\Second1|counter\(0) & (!\Data_In[1]~input_o\ $ (\Second1|counter\(1))))) ) ) ) # ( \Second1|counter\(2) & ( !\Data_In[0]~input_o\ & ( (\Data_In[2]~input_o\ & (!\Second1|counter\(0) & (!\Data_In[1]~input_o\ $ 
-- (\Second1|counter\(1))))) ) ) ) # ( !\Second1|counter\(2) & ( !\Data_In[0]~input_o\ & ( (!\Data_In[2]~input_o\ & (!\Second1|counter\(0) & (!\Data_In[1]~input_o\ $ (\Second1|counter\(1))))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1000000001000000001000000001000000001000000001000000001000000001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_Data_In[1]~input_o\,
	datab => \ALT_INV_Data_In[2]~input_o\,
	datac => \Second1|ALT_INV_counter\(0),
	datad => \Second1|ALT_INV_counter\(1),
	datae => \Second1|ALT_INV_counter\(2),
	dataf => \ALT_INV_Data_In[0]~input_o\,
	combout => \process_0~0_combout\);

-- Location: LABCELL_X2_Y19_N0
\secTen_reset~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \secTen_reset~0_combout\ = ( \sec2_segment|Equal0~0_combout\ & ( \process_0~1_combout\ & ( ((!\process_0~2_combout\) # ((!\process_0~0_combout\) # (\Equal5~0_combout\))) # (\sec1_segment|Equal0~0_combout\) ) ) ) # ( !\sec2_segment|Equal0~0_combout\ & ( 
-- \process_0~1_combout\ & ( (!\sec1_segment|Equal0~0_combout\ & ((!\process_0~2_combout\) # ((!\process_0~0_combout\) # (\Equal5~0_combout\)))) ) ) ) # ( \sec2_segment|Equal0~0_combout\ & ( !\process_0~1_combout\ ) ) # ( !\sec2_segment|Equal0~0_combout\ & ( 
-- !\process_0~1_combout\ & ( !\sec1_segment|Equal0~0_combout\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1010101010101010111111111111111110101000101010101111110111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \sec1_segment|ALT_INV_Equal0~0_combout\,
	datab => \ALT_INV_process_0~2_combout\,
	datac => \ALT_INV_process_0~0_combout\,
	datad => \ALT_INV_Equal5~0_combout\,
	datae => \sec2_segment|ALT_INV_Equal0~0_combout\,
	dataf => \ALT_INV_process_0~1_combout\,
	combout => \secTen_reset~0_combout\);

-- Location: LABCELL_X1_Y19_N45
secTen_reset : cyclonev_lcell_comb
-- Equation(s):
-- \secTen_reset~combout\ = ( \Start~input_o\ ) # ( !\Start~input_o\ & ( (!\secTen_reset~0_combout\ & ((\secTen_reset~combout\))) # (\secTen_reset~0_combout\ & (\sec1_segment|Equal0~0_combout\)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100110011000011110011001111111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \sec1_segment|ALT_INV_Equal0~0_combout\,
	datac => \ALT_INV_secTen_reset~combout\,
	datad => \ALT_INV_secTen_reset~0_combout\,
	dataf => \ALT_INV_Start~input_o\,
	combout => \secTen_reset~combout\);

-- Location: LABCELL_X1_Y19_N21
\Second2|counter~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \Second2|counter~3_combout\ = ( !\secTen_reset~combout\ & ( !\Second2|counter\(0) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111100000000111111110000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \Second2|ALT_INV_counter\(0),
	dataf => \ALT_INV_secTen_reset~combout\,
	combout => \Second2|counter~3_combout\);

-- Location: FF_X1_Y19_N23
\Second2|counter[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \t_Clk~inputCLKENA0_outclk\,
	d => \Second2|counter~3_combout\,
	ena => \Second2|counter[3]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Second2|counter\(0));

-- Location: LABCELL_X1_Y19_N3
\Second2|counter~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \Second2|counter~2_combout\ = ( \Second2|counter\(1) & ( (!\secTen_reset~combout\ & (!\Second2|counter\(0) $ (!\Second2|counter\(2)))) ) ) # ( !\Second2|counter\(1) & ( (!\secTen_reset~combout\ & \Second2|counter\(2)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011001100000000001100110001000100100010000100010010001000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Second2|ALT_INV_counter\(0),
	datab => \ALT_INV_secTen_reset~combout\,
	datad => \Second2|ALT_INV_counter\(2),
	dataf => \Second2|ALT_INV_counter\(1),
	combout => \Second2|counter~2_combout\);

-- Location: FF_X1_Y19_N5
\Second2|counter[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \t_Clk~inputCLKENA0_outclk\,
	d => \Second2|counter~2_combout\,
	ena => \Second2|counter[3]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Second2|counter\(2));

-- Location: LABCELL_X2_Y19_N36
\sec2_segment|Equal0~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \sec2_segment|Equal0~0_combout\ = ( !\Second2|counter\(1) & ( (\Second2|counter\(2) & (\Second2|counter\(0) & !\Second2|counter\(3))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001000000010000000100000001000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Second2|ALT_INV_counter\(2),
	datab => \Second2|ALT_INV_counter\(0),
	datac => \Second2|ALT_INV_counter\(3),
	dataf => \Second2|ALT_INV_counter\(1),
	combout => \sec2_segment|Equal0~0_combout\);

-- Location: LABCELL_X1_Y19_N39
\enable2~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \enable2~0_combout\ = ( \sec2_segment|Equal0~0_combout\ & ( !\Start~input_o\ ) ) # ( !\sec2_segment|Equal0~0_combout\ & ( (!\Start~input_o\ & !\sec1_segment|Equal0~0_combout\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111000000000000111100000000000011110000111100001111000011110000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_Start~input_o\,
	datad => \sec1_segment|ALT_INV_Equal0~0_combout\,
	dataf => \sec2_segment|ALT_INV_Equal0~0_combout\,
	combout => \enable2~0_combout\);

-- Location: LABCELL_X1_Y19_N6
enable2 : cyclonev_lcell_comb
-- Equation(s):
-- \enable2~combout\ = ( \enable2~0_combout\ & ( \sec1_segment|Equal0~0_combout\ ) ) # ( !\enable2~0_combout\ & ( \enable2~combout\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100001111000011110000111100000000111111110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_enable2~combout\,
	datad => \sec1_segment|ALT_INV_Equal0~0_combout\,
	dataf => \ALT_INV_enable2~0_combout\,
	combout => \enable2~combout\);

-- Location: LABCELL_X1_Y19_N33
\Minute1|counter[1]~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \Minute1|counter[1]~1_combout\ = ( \min_reset~combout\ ) # ( !\min_reset~combout\ & ( \enable2~combout\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100001111000011110000111111111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_enable2~combout\,
	dataf => \ALT_INV_min_reset~combout\,
	combout => \Minute1|counter[1]~1_combout\);

-- Location: FF_X1_Y19_N44
\Minute1|counter[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \t_Clk~inputCLKENA0_outclk\,
	d => \Minute1|counter~3_combout\,
	ena => \Minute1|counter[1]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Minute1|counter\(0));

-- Location: LABCELL_X2_Y19_N24
\process_0~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \process_0~1_combout\ = ( \Second2|counter\(0) & ( \Minute1|counter\(1) & ( (\Data_In[4]~input_o\ & (\Data_In[9]~input_o\ & (!\Data_In[8]~input_o\ $ (\Minute1|counter\(0))))) ) ) ) # ( !\Second2|counter\(0) & ( \Minute1|counter\(1) & ( 
-- (!\Data_In[4]~input_o\ & (\Data_In[9]~input_o\ & (!\Data_In[8]~input_o\ $ (\Minute1|counter\(0))))) ) ) ) # ( \Second2|counter\(0) & ( !\Minute1|counter\(1) & ( (\Data_In[4]~input_o\ & (!\Data_In[9]~input_o\ & (!\Data_In[8]~input_o\ $ 
-- (\Minute1|counter\(0))))) ) ) ) # ( !\Second2|counter\(0) & ( !\Minute1|counter\(1) & ( (!\Data_In[4]~input_o\ & (!\Data_In[9]~input_o\ & (!\Data_In[8]~input_o\ $ (\Minute1|counter\(0))))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1000000001000000001000000001000000001000000001000000001000000001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_Data_In[8]~input_o\,
	datab => \ALT_INV_Data_In[4]~input_o\,
	datac => \ALT_INV_Data_In[9]~input_o\,
	datad => \Minute1|ALT_INV_counter\(0),
	datae => \Second2|ALT_INV_counter\(0),
	dataf => \Minute1|ALT_INV_counter\(1),
	combout => \process_0~1_combout\);

-- Location: LABCELL_X2_Y19_N54
\timeout~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \timeout~0_combout\ = ( \process_0~2_combout\ & ( (!\process_0~1_combout\) # (((!\process_0~0_combout\) # (\sec1_segment|Equal0~0_combout\)) # (\Equal5~0_combout\)) ) ) # ( !\process_0~2_combout\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111111111111111111111111111101111111111111110111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_process_0~1_combout\,
	datab => \ALT_INV_Equal5~0_combout\,
	datac => \sec1_segment|ALT_INV_Equal0~0_combout\,
	datad => \ALT_INV_process_0~0_combout\,
	dataf => \ALT_INV_process_0~2_combout\,
	combout => \timeout~0_combout\);

-- Location: LABCELL_X2_Y19_N39
u_Enable : cyclonev_lcell_comb
-- Equation(s):
-- \u_Enable~combout\ = ( \u_Enable~combout\ & ( (\timeout~0_combout\) # (\Start~input_o\) ) ) # ( !\u_Enable~combout\ & ( \Start~input_o\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100001111000011110000111100001111111111110000111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_Start~input_o\,
	datad => \ALT_INV_timeout~0_combout\,
	dataf => \ALT_INV_u_Enable~combout\,
	combout => \u_Enable~combout\);

-- Location: LABCELL_X2_Y19_N9
\Second1|counter[3]~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \Second1|counter[3]~1_combout\ = ( \secOne_reset~combout\ ) # ( !\secOne_reset~combout\ & ( \u_Enable~combout\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100001111000011110000111111111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_u_Enable~combout\,
	dataf => \ALT_INV_secOne_reset~combout\,
	combout => \Second1|counter[3]~1_combout\);

-- Location: FF_X1_Y19_N56
\Second1|counter[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \t_Clk~inputCLKENA0_outclk\,
	d => \Second1|counter~2_combout\,
	ena => \Second1|counter[3]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Second1|counter\(2));

-- Location: LABCELL_X1_Y19_N30
\Second1|counter~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \Second1|counter~4_combout\ = ( \Second1|counter\(2) & ( (!\secOne_reset~combout\ & (!\Second1|counter\(3) $ (((!\Second1|counter\(0)) # (!\Second1|counter\(1)))))) ) ) # ( !\Second1|counter\(2) & ( (!\secOne_reset~combout\ & (\Second1|counter\(3) & 
-- ((!\Second1|counter\(0)) # (\Second1|counter\(1))))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000010001100000000001000110000000100110010000000010011001000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Second1|ALT_INV_counter\(0),
	datab => \ALT_INV_secOne_reset~combout\,
	datac => \Second1|ALT_INV_counter\(1),
	datad => \Second1|ALT_INV_counter\(3),
	dataf => \Second1|ALT_INV_counter\(2),
	combout => \Second1|counter~4_combout\);

-- Location: FF_X1_Y19_N32
\Second1|counter[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \t_Clk~inputCLKENA0_outclk\,
	d => \Second1|counter~4_combout\,
	ena => \Second1|counter[3]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Second1|counter\(3));

-- Location: LABCELL_X2_Y19_N57
\Equal5~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Equal5~0_combout\ = ( \Second1|counter\(3) & ( !\Data_In[3]~input_o\ ) ) # ( !\Second1|counter\(3) & ( \Data_In[3]~input_o\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100001111000011110000111111110000111100001111000011110000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_Data_In[3]~input_o\,
	dataf => \Second1|ALT_INV_counter\(3),
	combout => \Equal5~0_combout\);

-- Location: LABCELL_X2_Y19_N15
\secOne_reset~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \secOne_reset~0_combout\ = ( \process_0~1_combout\ & ( ((!\Equal5~0_combout\ & (\process_0~2_combout\ & \process_0~0_combout\))) # (\sec1_segment|Equal0~0_combout\) ) ) # ( !\process_0~1_combout\ & ( \sec1_segment|Equal0~0_combout\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101010101010101010101010101010111010101010101011101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \sec1_segment|ALT_INV_Equal0~0_combout\,
	datab => \ALT_INV_Equal5~0_combout\,
	datac => \ALT_INV_process_0~2_combout\,
	datad => \ALT_INV_process_0~0_combout\,
	dataf => \ALT_INV_process_0~1_combout\,
	combout => \secOne_reset~0_combout\);

-- Location: LABCELL_X2_Y19_N12
secOne_reset : cyclonev_lcell_comb
-- Equation(s):
-- \secOne_reset~combout\ = ( \secOne_reset~combout\ & ( (\Start~input_o\) # (\secOne_reset~0_combout\) ) ) # ( !\secOne_reset~combout\ & ( \Start~input_o\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011111111000000001111111100001111111111110000111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_secOne_reset~0_combout\,
	datad => \ALT_INV_Start~input_o\,
	dataf => \ALT_INV_secOne_reset~combout\,
	combout => \secOne_reset~combout\);

-- Location: LABCELL_X1_Y19_N51
\Second1|counter~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \Second1|counter~3_combout\ = (!\secOne_reset~combout\ & !\Second1|counter\(0))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1100110000000000110011000000000011001100000000001100110000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_secOne_reset~combout\,
	datad => \Second1|ALT_INV_counter\(0),
	combout => \Second1|counter~3_combout\);

-- Location: FF_X1_Y19_N53
\Second1|counter[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \t_Clk~inputCLKENA0_outclk\,
	d => \Second1|counter~3_combout\,
	ena => \Second1|counter[3]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Second1|counter\(0));

-- Location: LABCELL_X1_Y19_N48
\Second1|counter~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Second1|counter~0_combout\ = ( \Second1|counter\(3) & ( (!\secOne_reset~combout\ & ((!\Second1|counter\(0) & ((\Second1|counter\(1)))) # (\Second1|counter\(0) & (\Second1|counter\(2) & !\Second1|counter\(1))))) ) ) # ( !\Second1|counter\(3) & ( 
-- (!\secOne_reset~combout\ & (!\Second1|counter\(0) $ (!\Second1|counter\(1)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0100010010001000010001001000100000000100100010000000010010001000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Second1|ALT_INV_counter\(0),
	datab => \ALT_INV_secOne_reset~combout\,
	datac => \Second1|ALT_INV_counter\(2),
	datad => \Second1|ALT_INV_counter\(1),
	dataf => \Second1|ALT_INV_counter\(3),
	combout => \Second1|counter~0_combout\);

-- Location: FF_X1_Y19_N50
\Second1|counter[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \t_Clk~inputCLKENA0_outclk\,
	d => \Second1|counter~0_combout\,
	ena => \Second1|counter[3]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Second1|counter\(1));

-- Location: LABCELL_X1_Y19_N27
\sec1_segment|Equal0~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \sec1_segment|Equal0~0_combout\ = ( \Second1|counter\(0) & ( (!\Second1|counter\(1) & (\Second1|counter\(3) & !\Second1|counter\(2))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000001010000000000000101000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Second1|ALT_INV_counter\(1),
	datac => \Second1|ALT_INV_counter\(3),
	datad => \Second1|ALT_INV_counter\(2),
	dataf => \Second1|ALT_INV_counter\(0),
	combout => \sec1_segment|Equal0~0_combout\);

-- Location: LABCELL_X1_Y19_N24
\Minute1|counter~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \Minute1|counter~2_combout\ = ( \Minute1|counter\(0) & ( (!\min_reset~combout\ & (!\Minute1|counter\(1) $ (!\Minute1|counter\(2)))) ) ) # ( !\Minute1|counter\(0) & ( (!\min_reset~combout\ & \Minute1|counter\(2)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011001100000000001100110000001100110000000000110011000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_min_reset~combout\,
	datac => \Minute1|ALT_INV_counter\(1),
	datad => \Minute1|ALT_INV_counter\(2),
	dataf => \Minute1|ALT_INV_counter\(0),
	combout => \Minute1|counter~2_combout\);

-- Location: FF_X1_Y19_N26
\Minute1|counter[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \t_Clk~inputCLKENA0_outclk\,
	d => \Minute1|counter~2_combout\,
	ena => \Minute1|counter[1]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Minute1|counter\(2));

-- Location: LABCELL_X1_Y19_N12
\Minute1|counter~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \Minute1|counter~4_combout\ = ( \Minute1|counter\(0) & ( (!\min_reset~combout\ & ((!\Minute1|counter\(1) & (\Minute1|counter\(2) & \Minute1|counter\(3))) # (\Minute1|counter\(1) & (!\Minute1|counter\(2) $ (!\Minute1|counter\(3)))))) ) ) # ( 
-- !\Minute1|counter\(0) & ( (!\min_reset~combout\ & \Minute1|counter\(3)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011001100000000001100110000000100010010000000010001001000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Minute1|ALT_INV_counter\(1),
	datab => \ALT_INV_min_reset~combout\,
	datac => \Minute1|ALT_INV_counter\(2),
	datad => \Minute1|ALT_INV_counter\(3),
	dataf => \Minute1|ALT_INV_counter\(0),
	combout => \Minute1|counter~4_combout\);

-- Location: FF_X1_Y19_N14
\Minute1|counter[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \t_Clk~inputCLKENA0_outclk\,
	d => \Minute1|counter~4_combout\,
	ena => \Minute1|counter[1]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Minute1|counter\(3));

-- Location: LABCELL_X2_Y19_N30
\min_reset~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \min_reset~0_combout\ = ( \sec2_segment|Equal0~0_combout\ & ( \sec1_segment|Equal0~0_combout\ & ( (!\Minute1|counter\(3) & (\Minute1|counter\(0) & (\Minute1|counter\(1) & !\Minute1|counter\(2)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000001000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Minute1|ALT_INV_counter\(3),
	datab => \Minute1|ALT_INV_counter\(0),
	datac => \Minute1|ALT_INV_counter\(1),
	datad => \Minute1|ALT_INV_counter\(2),
	datae => \sec2_segment|ALT_INV_Equal0~0_combout\,
	dataf => \sec1_segment|ALT_INV_Equal0~0_combout\,
	combout => \min_reset~0_combout\);

-- Location: LABCELL_X2_Y19_N48
\min_reset~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \min_reset~1_combout\ = ( \sec1_segment|Equal0~0_combout\ & ( \min_reset~0_combout\ ) ) # ( !\sec1_segment|Equal0~0_combout\ & ( \min_reset~0_combout\ ) ) # ( !\sec1_segment|Equal0~0_combout\ & ( !\min_reset~0_combout\ & ( (!\process_0~0_combout\) # 
-- (((!\process_0~1_combout\) # (!\process_0~2_combout\)) # (\Equal5~0_combout\)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111011000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_process_0~0_combout\,
	datab => \ALT_INV_Equal5~0_combout\,
	datac => \ALT_INV_process_0~1_combout\,
	datad => \ALT_INV_process_0~2_combout\,
	datae => \sec1_segment|ALT_INV_Equal0~0_combout\,
	dataf => \ALT_INV_min_reset~0_combout\,
	combout => \min_reset~1_combout\);

-- Location: LABCELL_X1_Y19_N57
min_reset : cyclonev_lcell_comb
-- Equation(s):
-- \min_reset~combout\ = ( \Start~input_o\ ) # ( !\Start~input_o\ & ( (!\min_reset~1_combout\ & ((\min_reset~combout\))) # (\min_reset~1_combout\ & (\sec1_segment|Equal0~0_combout\)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100110011000011110011001111111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \sec1_segment|ALT_INV_Equal0~0_combout\,
	datac => \ALT_INV_min_reset~combout\,
	datad => \ALT_INV_min_reset~1_combout\,
	dataf => \ALT_INV_Start~input_o\,
	combout => \min_reset~combout\);

-- Location: LABCELL_X1_Y19_N36
\Minute1|counter~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Minute1|counter~0_combout\ = ( \Minute1|counter\(3) & ( (!\min_reset~combout\ & ((!\Minute1|counter\(0) & ((\Minute1|counter\(1)))) # (\Minute1|counter\(0) & (\Minute1|counter\(2) & !\Minute1|counter\(1))))) ) ) # ( !\Minute1|counter\(3) & ( 
-- (!\min_reset~combout\ & (!\Minute1|counter\(0) $ (!\Minute1|counter\(1)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0010001010001000001000101000100000000010100010000000001010001000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_min_reset~combout\,
	datab => \Minute1|ALT_INV_counter\(0),
	datac => \Minute1|ALT_INV_counter\(2),
	datad => \Minute1|ALT_INV_counter\(1),
	dataf => \Minute1|ALT_INV_counter\(3),
	combout => \Minute1|counter~0_combout\);

-- Location: FF_X1_Y19_N38
\Minute1|counter[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \t_Clk~inputCLKENA0_outclk\,
	d => \Minute1|counter~0_combout\,
	ena => \Minute1|counter[1]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Minute1|counter\(1));

-- Location: LABCELL_X1_Y20_N12
\min_segment|SevenSeg_out[0]~6\ : cyclonev_lcell_comb
-- Equation(s):
-- \min_segment|SevenSeg_out[0]~6_combout\ = ( \Minute1|counter\(2) & ( ((!\Minute1|counter\(1) & !\Minute1|counter\(0))) # (\Minute1|counter\(3)) ) ) # ( !\Minute1|counter\(2) & ( (!\Minute1|counter\(1) & (!\Minute1|counter\(3) & \Minute1|counter\(0))) # 
-- (\Minute1|counter\(1) & (\Minute1|counter\(3))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001100100011001000110010001100110110011101100111011001110110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Minute1|ALT_INV_counter\(1),
	datab => \Minute1|ALT_INV_counter\(3),
	datac => \Minute1|ALT_INV_counter\(0),
	dataf => \Minute1|ALT_INV_counter\(2),
	combout => \min_segment|SevenSeg_out[0]~6_combout\);

-- Location: LABCELL_X1_Y20_N9
\min_segment|SevenSeg_out[1]~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \min_segment|SevenSeg_out[1]~5_combout\ = ( \Minute1|counter\(0) & ( (!\Minute1|counter\(1) & (!\Minute1|counter\(2))) # (\Minute1|counter\(1) & ((!\Minute1|counter\(3)))) ) ) # ( !\Minute1|counter\(0) & ( (!\Minute1|counter\(2) & ((!\Minute1|counter\(3)) 
-- # (!\Minute1|counter\(1)))) # (\Minute1|counter\(2) & (!\Minute1|counter\(3) & !\Minute1|counter\(1))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111101010100000111110101010000010101010111100001010101011110000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Minute1|ALT_INV_counter\(2),
	datac => \Minute1|ALT_INV_counter\(3),
	datad => \Minute1|ALT_INV_counter\(1),
	dataf => \Minute1|ALT_INV_counter\(0),
	combout => \min_segment|SevenSeg_out[1]~5_combout\);

-- Location: LABCELL_X1_Y20_N0
\min_segment|SevenSeg_out[2]~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \min_segment|SevenSeg_out[2]~4_combout\ = ( \Minute1|counter\(2) & ( \Minute1|counter\(3) ) ) # ( !\Minute1|counter\(2) & ( (\Minute1|counter\(1) & ((!\Minute1|counter\(0)) # (\Minute1|counter\(3)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101000101010001010100010101000100110011001100110011001100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Minute1|ALT_INV_counter\(1),
	datab => \Minute1|ALT_INV_counter\(3),
	datac => \Minute1|ALT_INV_counter\(0),
	dataf => \Minute1|ALT_INV_counter\(2),
	combout => \min_segment|SevenSeg_out[2]~4_combout\);

-- Location: LABCELL_X1_Y20_N45
\min_segment|SevenSeg_out[3]~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \min_segment|SevenSeg_out[3]~3_combout\ = ( \Minute1|counter\(0) & ( (!\Minute1|counter\(2) & (!\Minute1|counter\(3) $ (\Minute1|counter\(1)))) # (\Minute1|counter\(2) & ((\Minute1|counter\(1)) # (\Minute1|counter\(3)))) ) ) # ( !\Minute1|counter\(0) & ( 
-- (!\Minute1|counter\(1) & (\Minute1|counter\(2))) # (\Minute1|counter\(1) & ((\Minute1|counter\(3)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010100001111010101010000111110100101010111111010010101011111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Minute1|ALT_INV_counter\(2),
	datac => \Minute1|ALT_INV_counter\(3),
	datad => \Minute1|ALT_INV_counter\(1),
	dataf => \Minute1|ALT_INV_counter\(0),
	combout => \min_segment|SevenSeg_out[3]~3_combout\);

-- Location: LABCELL_X1_Y20_N39
\min_segment|SevenSeg_out[4]~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \min_segment|SevenSeg_out[4]~0_combout\ = ( \Minute1|counter\(0) ) # ( !\Minute1|counter\(0) & ( (!\Minute1|counter\(1) & (\Minute1|counter\(2))) # (\Minute1|counter\(1) & ((\Minute1|counter\(3)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010100001111010101010000111111111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Minute1|ALT_INV_counter\(2),
	datac => \Minute1|ALT_INV_counter\(3),
	datad => \Minute1|ALT_INV_counter\(1),
	dataf => \Minute1|ALT_INV_counter\(0),
	combout => \min_segment|SevenSeg_out[4]~0_combout\);

-- Location: LABCELL_X1_Y20_N24
\min_segment|SevenSeg_out[5]~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \min_segment|SevenSeg_out[5]~2_combout\ = ( \Minute1|counter\(2) & ( ((\Minute1|counter\(1) & \Minute1|counter\(0))) # (\Minute1|counter\(3)) ) ) # ( !\Minute1|counter\(2) & ( ((!\Minute1|counter\(3) & \Minute1|counter\(0))) # (\Minute1|counter\(1)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101110101011101010111010101110100110111001101110011011100110111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Minute1|ALT_INV_counter\(1),
	datab => \Minute1|ALT_INV_counter\(3),
	datac => \Minute1|ALT_INV_counter\(0),
	dataf => \Minute1|ALT_INV_counter\(2),
	combout => \min_segment|SevenSeg_out[5]~2_combout\);

-- Location: LABCELL_X1_Y20_N18
\min_segment|SevenSeg_out~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \min_segment|SevenSeg_out~1_combout\ = ( \Minute1|counter\(2) & ( (!\Minute1|counter\(3) & ((!\Minute1|counter\(1)) # (!\Minute1|counter\(0)))) ) ) # ( !\Minute1|counter\(2) & ( !\Minute1|counter\(1) $ (!\Minute1|counter\(3)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0110011001100110011001100110011011001000110010001100100011001000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Minute1|ALT_INV_counter\(1),
	datab => \Minute1|ALT_INV_counter\(3),
	datac => \Minute1|ALT_INV_counter\(0),
	dataf => \Minute1|ALT_INV_counter\(2),
	combout => \min_segment|SevenSeg_out~1_combout\);

-- Location: LABCELL_X2_Y19_N6
timeout : cyclonev_lcell_comb
-- Equation(s):
-- \timeout~combout\ = ( \timeout~combout\ & ( !\Start~input_o\ ) ) # ( !\timeout~combout\ & ( (!\Start~input_o\ & !\timeout~0_combout\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1100000011000000110000001100000011001100110011001100110011001100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_Start~input_o\,
	datac => \ALT_INV_timeout~0_combout\,
	dataf => \ALT_INV_timeout~combout\,
	combout => \timeout~combout\);

-- Location: MLABCELL_X4_Y19_N36
\sec1_segment|SevenSeg_out[0]~6\ : cyclonev_lcell_comb
-- Equation(s):
-- \sec1_segment|SevenSeg_out[0]~6_combout\ = ( \Second1|counter\(0) & ( \Second1|counter\(3) & ( (\Second1|counter\(1)) # (\Second1|counter\(2)) ) ) ) # ( !\Second1|counter\(0) & ( \Second1|counter\(3) & ( (\Second1|counter\(1)) # (\Second1|counter\(2)) ) ) 
-- ) # ( \Second1|counter\(0) & ( !\Second1|counter\(3) & ( (!\Second1|counter\(2) & !\Second1|counter\(1)) ) ) ) # ( !\Second1|counter\(0) & ( !\Second1|counter\(3) & ( (\Second1|counter\(2) & !\Second1|counter\(1)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101000001010000101000001010000001011111010111110101111101011111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Second1|ALT_INV_counter\(2),
	datac => \Second1|ALT_INV_counter\(1),
	datae => \Second1|ALT_INV_counter\(0),
	dataf => \Second1|ALT_INV_counter\(3),
	combout => \sec1_segment|SevenSeg_out[0]~6_combout\);

-- Location: MLABCELL_X4_Y19_N54
\sec1_segment|SevenSeg_out[1]~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \sec1_segment|SevenSeg_out[1]~5_combout\ = ( \Second1|counter\(0) & ( \Second1|counter\(3) & ( (!\Second1|counter\(2) & !\Second1|counter\(1)) ) ) ) # ( !\Second1|counter\(0) & ( \Second1|counter\(3) & ( (!\Second1|counter\(2) & !\Second1|counter\(1)) ) ) 
-- ) # ( \Second1|counter\(0) & ( !\Second1|counter\(3) & ( (!\Second1|counter\(2)) # (\Second1|counter\(1)) ) ) ) # ( !\Second1|counter\(0) & ( !\Second1|counter\(3) & ( (!\Second1|counter\(2)) # (!\Second1|counter\(1)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111101011111010101011111010111110100000101000001010000010100000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Second1|ALT_INV_counter\(2),
	datac => \Second1|ALT_INV_counter\(1),
	datae => \Second1|ALT_INV_counter\(0),
	dataf => \Second1|ALT_INV_counter\(3),
	combout => \sec1_segment|SevenSeg_out[1]~5_combout\);

-- Location: MLABCELL_X4_Y19_N27
\sec1_segment|SevenSeg_out[2]~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \sec1_segment|SevenSeg_out[2]~4_combout\ = ( \Second1|counter\(0) & ( \Second1|counter\(3) & ( (\Second1|counter\(2)) # (\Second1|counter\(1)) ) ) ) # ( !\Second1|counter\(0) & ( \Second1|counter\(3) & ( (\Second1|counter\(2)) # (\Second1|counter\(1)) ) ) 
-- ) # ( !\Second1|counter\(0) & ( !\Second1|counter\(3) & ( (\Second1|counter\(1) & !\Second1|counter\(2)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010100000000000000000000000001010101111111110101010111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Second1|ALT_INV_counter\(1),
	datad => \Second1|ALT_INV_counter\(2),
	datae => \Second1|ALT_INV_counter\(0),
	dataf => \Second1|ALT_INV_counter\(3),
	combout => \sec1_segment|SevenSeg_out[2]~4_combout\);

-- Location: MLABCELL_X4_Y19_N30
\sec1_segment|SevenSeg_out[3]~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \sec1_segment|SevenSeg_out[3]~3_combout\ = ( \Second1|counter\(0) & ( \Second1|counter\(3) & ( (\Second1|counter\(1)) # (\Second1|counter\(2)) ) ) ) # ( !\Second1|counter\(0) & ( \Second1|counter\(3) & ( (\Second1|counter\(1)) # (\Second1|counter\(2)) ) ) 
-- ) # ( \Second1|counter\(0) & ( !\Second1|counter\(3) & ( !\Second1|counter\(2) $ (\Second1|counter\(1)) ) ) ) # ( !\Second1|counter\(0) & ( !\Second1|counter\(3) & ( (\Second1|counter\(2) & !\Second1|counter\(1)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101000001010000101001011010010101011111010111110101111101011111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Second1|ALT_INV_counter\(2),
	datac => \Second1|ALT_INV_counter\(1),
	datae => \Second1|ALT_INV_counter\(0),
	dataf => \Second1|ALT_INV_counter\(3),
	combout => \sec1_segment|SevenSeg_out[3]~3_combout\);

-- Location: MLABCELL_X4_Y19_N15
\sec1_segment|SevenSeg_out[4]~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \sec1_segment|SevenSeg_out[4]~0_combout\ = ( \Second1|counter\(0) & ( \Second1|counter\(3) ) ) # ( !\Second1|counter\(0) & ( \Second1|counter\(3) & ( (\Second1|counter\(2)) # (\Second1|counter\(1)) ) ) ) # ( \Second1|counter\(0) & ( !\Second1|counter\(3) 
-- ) ) # ( !\Second1|counter\(0) & ( !\Second1|counter\(3) & ( (!\Second1|counter\(1) & \Second1|counter\(2)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000010101010111111111111111101010101111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Second1|ALT_INV_counter\(1),
	datad => \Second1|ALT_INV_counter\(2),
	datae => \Second1|ALT_INV_counter\(0),
	dataf => \Second1|ALT_INV_counter\(3),
	combout => \sec1_segment|SevenSeg_out[4]~0_combout\);

-- Location: MLABCELL_X4_Y19_N51
\sec1_segment|SevenSeg_out[5]~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \sec1_segment|SevenSeg_out[5]~2_combout\ = ( \Second1|counter\(0) & ( \Second1|counter\(3) & ( (\Second1|counter\(2)) # (\Second1|counter\(1)) ) ) ) # ( !\Second1|counter\(0) & ( \Second1|counter\(3) & ( (\Second1|counter\(2)) # (\Second1|counter\(1)) ) ) 
-- ) # ( \Second1|counter\(0) & ( !\Second1|counter\(3) & ( (!\Second1|counter\(2)) # (\Second1|counter\(1)) ) ) ) # ( !\Second1|counter\(0) & ( !\Second1|counter\(3) & ( (\Second1|counter\(1) & !\Second1|counter\(2)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010100000000111111110101010101010101111111110101010111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Second1|ALT_INV_counter\(1),
	datad => \Second1|ALT_INV_counter\(2),
	datae => \Second1|ALT_INV_counter\(0),
	dataf => \Second1|ALT_INV_counter\(3),
	combout => \sec1_segment|SevenSeg_out[5]~2_combout\);

-- Location: MLABCELL_X4_Y19_N42
\sec1_segment|SevenSeg_out~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \sec1_segment|SevenSeg_out~1_combout\ = ( \Second1|counter\(0) & ( \Second1|counter\(3) & ( (!\Second1|counter\(2) & !\Second1|counter\(1)) ) ) ) # ( !\Second1|counter\(0) & ( \Second1|counter\(3) & ( (!\Second1|counter\(2) & !\Second1|counter\(1)) ) ) ) 
-- # ( \Second1|counter\(0) & ( !\Second1|counter\(3) & ( !\Second1|counter\(2) $ (!\Second1|counter\(1)) ) ) ) # ( !\Second1|counter\(0) & ( !\Second1|counter\(3) & ( (\Second1|counter\(1)) # (\Second1|counter\(2)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101111101011111010110100101101010100000101000001010000010100000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Second1|ALT_INV_counter\(2),
	datac => \Second1|ALT_INV_counter\(1),
	datae => \Second1|ALT_INV_counter\(0),
	dataf => \Second1|ALT_INV_counter\(3),
	combout => \sec1_segment|SevenSeg_out~1_combout\);

-- Location: LABCELL_X7_Y4_N12
\sec2_segment|SevenSeg_out[0]~6\ : cyclonev_lcell_comb
-- Equation(s):
-- \sec2_segment|SevenSeg_out[0]~6_combout\ = ( \Second2|counter\(3) & ( (\Second2|counter\(1)) # (\Second2|counter\(2)) ) ) # ( !\Second2|counter\(3) & ( (!\Second2|counter\(1) & (!\Second2|counter\(0) $ (!\Second2|counter\(2)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0110000001100000011000000110000000111111001111110011111100111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Second2|ALT_INV_counter\(0),
	datab => \Second2|ALT_INV_counter\(2),
	datac => \Second2|ALT_INV_counter\(1),
	dataf => \Second2|ALT_INV_counter\(3),
	combout => \sec2_segment|SevenSeg_out[0]~6_combout\);

-- Location: LABCELL_X7_Y4_N57
\sec2_segment|SevenSeg_out[1]~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \sec2_segment|SevenSeg_out[1]~5_combout\ = ( \Second2|counter\(3) & ( (!\Second2|counter\(1) & !\Second2|counter\(2)) ) ) # ( !\Second2|counter\(3) & ( (!\Second2|counter\(2)) # (!\Second2|counter\(1) $ (\Second2|counter\(0))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111101011110101111110101111010110100000101000001010000010100000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Second2|ALT_INV_counter\(1),
	datac => \Second2|ALT_INV_counter\(2),
	datad => \Second2|ALT_INV_counter\(0),
	dataf => \Second2|ALT_INV_counter\(3),
	combout => \sec2_segment|SevenSeg_out[1]~5_combout\);

-- Location: LABCELL_X7_Y4_N0
\sec2_segment|SevenSeg_out[2]~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \sec2_segment|SevenSeg_out[2]~4_combout\ = ( \Second2|counter\(3) & ( (\Second2|counter\(1)) # (\Second2|counter\(2)) ) ) # ( !\Second2|counter\(3) & ( (!\Second2|counter\(0) & (!\Second2|counter\(2) & \Second2|counter\(1))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000100000001000000010000000100000111111001111110011111100111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Second2|ALT_INV_counter\(0),
	datab => \Second2|ALT_INV_counter\(2),
	datac => \Second2|ALT_INV_counter\(1),
	dataf => \Second2|ALT_INV_counter\(3),
	combout => \sec2_segment|SevenSeg_out[2]~4_combout\);

-- Location: LABCELL_X7_Y4_N9
\sec2_segment|SevenSeg_out[3]~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \sec2_segment|SevenSeg_out[3]~3_combout\ = ( \Second2|counter\(3) & ( (\Second2|counter\(2)) # (\Second2|counter\(1)) ) ) # ( !\Second2|counter\(3) & ( (!\Second2|counter\(1) & (!\Second2|counter\(2) $ (!\Second2|counter\(0)))) # (\Second2|counter\(1) & 
-- (\Second2|counter\(2) & \Second2|counter\(0))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000101010100101000010101010010101011111010111110101111101011111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Second2|ALT_INV_counter\(1),
	datac => \Second2|ALT_INV_counter\(2),
	datad => \Second2|ALT_INV_counter\(0),
	dataf => \Second2|ALT_INV_counter\(3),
	combout => \sec2_segment|SevenSeg_out[3]~3_combout\);

-- Location: LABCELL_X7_Y4_N24
\sec2_segment|SevenSeg_out[4]~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \sec2_segment|SevenSeg_out[4]~0_combout\ = ( \Second2|counter\(3) & ( ((\Second2|counter\(1)) # (\Second2|counter\(2))) # (\Second2|counter\(0)) ) ) # ( !\Second2|counter\(3) & ( ((\Second2|counter\(2) & !\Second2|counter\(1))) # (\Second2|counter\(0)) ) 
-- )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0111010101110101011101010111010101111111011111110111111101111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Second2|ALT_INV_counter\(0),
	datab => \Second2|ALT_INV_counter\(2),
	datac => \Second2|ALT_INV_counter\(1),
	dataf => \Second2|ALT_INV_counter\(3),
	combout => \sec2_segment|SevenSeg_out[4]~0_combout\);

-- Location: LABCELL_X7_Y4_N48
\sec2_segment|SevenSeg_out[5]~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \sec2_segment|SevenSeg_out[5]~2_combout\ = ( \Second2|counter\(3) & ( (\Second2|counter\(1)) # (\Second2|counter\(2)) ) ) # ( !\Second2|counter\(3) & ( (!\Second2|counter\(0) & (!\Second2|counter\(2) & \Second2|counter\(1))) # (\Second2|counter\(0) & 
-- ((!\Second2|counter\(2)) # (\Second2|counter\(1)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0100110101001101010011010100110100111111001111110011111100111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Second2|ALT_INV_counter\(0),
	datab => \Second2|ALT_INV_counter\(2),
	datac => \Second2|ALT_INV_counter\(1),
	dataf => \Second2|ALT_INV_counter\(3),
	combout => \sec2_segment|SevenSeg_out[5]~2_combout\);

-- Location: LABCELL_X7_Y4_N45
\sec2_segment|SevenSeg_out~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \sec2_segment|SevenSeg_out~1_combout\ = ( \Second2|counter\(3) & ( (!\Second2|counter\(1) & !\Second2|counter\(2)) ) ) # ( !\Second2|counter\(3) & ( (!\Second2|counter\(1) & (\Second2|counter\(2))) # (\Second2|counter\(1) & ((!\Second2|counter\(2)) # 
-- (!\Second2|counter\(0)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101111101011010010111110101101010100000101000001010000010100000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Second2|ALT_INV_counter\(1),
	datac => \Second2|ALT_INV_counter\(2),
	datad => \Second2|ALT_INV_counter\(0),
	dataf => \Second2|ALT_INV_counter\(3),
	combout => \sec2_segment|SevenSeg_out~1_combout\);

-- Location: MLABCELL_X37_Y26_N3
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



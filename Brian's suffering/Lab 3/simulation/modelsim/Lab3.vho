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

-- DATE "04/06/2023 13:44:43"

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
-- Minute[0]	=>  Location: PIN_Y19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Minute[1]	=>  Location: PIN_AB17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Minute[2]	=>  Location: PIN_AA10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Minute[3]	=>  Location: PIN_Y14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Minute[4]	=>  Location: PIN_V14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Minute[5]	=>  Location: PIN_AB22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Minute[6]	=>  Location: PIN_AB21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- time_out	=>  Location: PIN_AA2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SecondOne[0]	=>  Location: PIN_U21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SecondOne[1]	=>  Location: PIN_V21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SecondOne[2]	=>  Location: PIN_W22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SecondOne[3]	=>  Location: PIN_W21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SecondOne[4]	=>  Location: PIN_Y22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SecondOne[5]	=>  Location: PIN_Y21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SecondOne[6]	=>  Location: PIN_AA22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SecondTen[0]	=>  Location: PIN_AA20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SecondTen[1]	=>  Location: PIN_AB20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SecondTen[2]	=>  Location: PIN_AA19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SecondTen[3]	=>  Location: PIN_AA18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SecondTen[4]	=>  Location: PIN_AB18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SecondTen[5]	=>  Location: PIN_AA17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SecondTen[6]	=>  Location: PIN_U22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Data_In[3]	=>  Location: PIN_T12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Data_In[0]	=>  Location: PIN_U13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Data_In[1]	=>  Location: PIN_V13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Data_In[2]	=>  Location: PIN_T13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Data_In[8]	=>  Location: PIN_AB13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Data_In[9]	=>  Location: PIN_AB12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Data_In[4]	=>  Location: PIN_AA15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Data_In[5]	=>  Location: PIN_AB15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Data_In[6]	=>  Location: PIN_AA14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Data_In[7]	=>  Location: PIN_AA13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Start	=>  Location: PIN_U7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- t_Clk	=>  Location: PIN_M9,	 I/O Standard: 2.5 V,	 Current Strength: Default


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
SIGNAL \conv_time|Add0~125_sumout\ : std_logic;
SIGNAL \conv_time|Add0~90\ : std_logic;
SIGNAL \conv_time|Add0~101_sumout\ : std_logic;
SIGNAL \conv_time|Add0~102\ : std_logic;
SIGNAL \conv_time|Add0~97_sumout\ : std_logic;
SIGNAL \conv_time|counter[29]~DUPLICATE_q\ : std_logic;
SIGNAL \conv_time|Add0~98\ : std_logic;
SIGNAL \conv_time|Add0~93_sumout\ : std_logic;
SIGNAL \conv_time|Add0~94\ : std_logic;
SIGNAL \conv_time|Add0~1_sumout\ : std_logic;
SIGNAL \conv_time|counter[31]~DUPLICATE_q\ : std_logic;
SIGNAL \conv_time|counter~0_combout\ : std_logic;
SIGNAL \conv_time|LessThan1~3_combout\ : std_logic;
SIGNAL \conv_time|counter[19]~DUPLICATE_q\ : std_logic;
SIGNAL \conv_time|LessThan1~4_combout\ : std_logic;
SIGNAL \conv_time|LessThan1~2_combout\ : std_logic;
SIGNAL \conv_time|LessThan1~5_combout\ : std_logic;
SIGNAL \conv_time|counter~1_combout\ : std_logic;
SIGNAL \conv_time|Add0~126\ : std_logic;
SIGNAL \conv_time|Add0~121_sumout\ : std_logic;
SIGNAL \conv_time|Add0~122\ : std_logic;
SIGNAL \conv_time|Add0~117_sumout\ : std_logic;
SIGNAL \conv_time|Add0~118\ : std_logic;
SIGNAL \conv_time|Add0~113_sumout\ : std_logic;
SIGNAL \conv_time|Add0~114\ : std_logic;
SIGNAL \conv_time|Add0~109_sumout\ : std_logic;
SIGNAL \conv_time|Add0~110\ : std_logic;
SIGNAL \conv_time|Add0~105_sumout\ : std_logic;
SIGNAL \conv_time|Add0~106\ : std_logic;
SIGNAL \conv_time|Add0~29_sumout\ : std_logic;
SIGNAL \conv_time|Add0~30\ : std_logic;
SIGNAL \conv_time|Add0~37_sumout\ : std_logic;
SIGNAL \conv_time|Add0~38\ : std_logic;
SIGNAL \conv_time|Add0~33_sumout\ : std_logic;
SIGNAL \conv_time|Add0~34\ : std_logic;
SIGNAL \conv_time|Add0~41_sumout\ : std_logic;
SIGNAL \conv_time|Add0~42\ : std_logic;
SIGNAL \conv_time|Add0~45_sumout\ : std_logic;
SIGNAL \conv_time|counter[10]~DUPLICATE_q\ : std_logic;
SIGNAL \conv_time|Add0~46\ : std_logic;
SIGNAL \conv_time|Add0~49_sumout\ : std_logic;
SIGNAL \conv_time|Add0~50\ : std_logic;
SIGNAL \conv_time|Add0~53_sumout\ : std_logic;
SIGNAL \conv_time|counter[12]~DUPLICATE_q\ : std_logic;
SIGNAL \conv_time|Add0~54\ : std_logic;
SIGNAL \conv_time|Add0~57_sumout\ : std_logic;
SIGNAL \conv_time|Add0~58\ : std_logic;
SIGNAL \conv_time|Add0~61_sumout\ : std_logic;
SIGNAL \conv_time|Add0~62\ : std_logic;
SIGNAL \conv_time|Add0~25_sumout\ : std_logic;
SIGNAL \conv_time|Add0~26\ : std_logic;
SIGNAL \conv_time|Add0~21_sumout\ : std_logic;
SIGNAL \conv_time|Add0~22\ : std_logic;
SIGNAL \conv_time|Add0~17_sumout\ : std_logic;
SIGNAL \conv_time|Add0~18\ : std_logic;
SIGNAL \conv_time|Add0~65_sumout\ : std_logic;
SIGNAL \conv_time|Add0~66\ : std_logic;
SIGNAL \conv_time|Add0~69_sumout\ : std_logic;
SIGNAL \conv_time|Add0~70\ : std_logic;
SIGNAL \conv_time|Add0~73_sumout\ : std_logic;
SIGNAL \conv_time|counter[20]~DUPLICATE_q\ : std_logic;
SIGNAL \conv_time|Add0~74\ : std_logic;
SIGNAL \conv_time|Add0~77_sumout\ : std_logic;
SIGNAL \conv_time|Add0~78\ : std_logic;
SIGNAL \conv_time|Add0~81_sumout\ : std_logic;
SIGNAL \conv_time|Add0~82\ : std_logic;
SIGNAL \conv_time|Add0~13_sumout\ : std_logic;
SIGNAL \conv_time|counter[23]~DUPLICATE_q\ : std_logic;
SIGNAL \conv_time|Add0~14\ : std_logic;
SIGNAL \conv_time|Add0~9_sumout\ : std_logic;
SIGNAL \conv_time|Add0~10\ : std_logic;
SIGNAL \conv_time|Add0~5_sumout\ : std_logic;
SIGNAL \conv_time|Add0~6\ : std_logic;
SIGNAL \conv_time|Add0~85_sumout\ : std_logic;
SIGNAL \conv_time|counter[26]~DUPLICATE_q\ : std_logic;
SIGNAL \conv_time|Add0~86\ : std_logic;
SIGNAL \conv_time|Add0~89_sumout\ : std_logic;
SIGNAL \conv_time|LessThan1~1_combout\ : std_logic;
SIGNAL \conv_time|LessThan0~2_combout\ : std_logic;
SIGNAL \conv_time|LessThan0~0_combout\ : std_logic;
SIGNAL \conv_time|LessThan1~0_combout\ : std_logic;
SIGNAL \conv_time|LessThan0~1_combout\ : std_logic;
SIGNAL \conv_time|out_clk~0_combout\ : std_logic;
SIGNAL \conv_time|out_clk~1_combout\ : std_logic;
SIGNAL \conv_time|out_clk~q\ : std_logic;
SIGNAL \Minute1|counter[0]~3_combout\ : std_logic;
SIGNAL \Second2|counter[0]~3_combout\ : std_logic;
SIGNAL \Data_In[6]~input_o\ : std_logic;
SIGNAL \Data_In[5]~input_o\ : std_logic;
SIGNAL \Data_In[7]~input_o\ : std_logic;
SIGNAL \Start~input_o\ : std_logic;
SIGNAL \Running~feeder_combout\ : std_logic;
SIGNAL \Running~q\ : std_logic;
SIGNAL \Data_In[3]~input_o\ : std_logic;
SIGNAL \Running~DUPLICATE_q\ : std_logic;
SIGNAL \Second1|counter[3]~0_combout\ : std_logic;
SIGNAL \Equal5~0_combout\ : std_logic;
SIGNAL \Data_In[0]~input_o\ : std_logic;
SIGNAL \Data_In[2]~input_o\ : std_logic;
SIGNAL \Data_In[1]~input_o\ : std_logic;
SIGNAL \u_Enable~0_combout\ : std_logic;
SIGNAL \Data_In[8]~input_o\ : std_logic;
SIGNAL \Minute1|counter[2]~2_combout\ : std_logic;
SIGNAL \Minute1|counter~1_combout\ : std_logic;
SIGNAL \Data_In[4]~input_o\ : std_logic;
SIGNAL \Data_In[9]~input_o\ : std_logic;
SIGNAL \u_Enable~1_combout\ : std_logic;
SIGNAL \u_Enable~4_combout\ : std_logic;
SIGNAL \Second1|counter[2]~3_combout\ : std_logic;
SIGNAL \sec1_segment|Equal0~0_combout\ : std_logic;
SIGNAL \Second2|counter~1_combout\ : std_logic;
SIGNAL \u_Enable~2_combout\ : std_logic;
SIGNAL \Second1|counter[0]~1_combout\ : std_logic;
SIGNAL \Second1|counter[1]~2_combout\ : std_logic;
SIGNAL \enable2~0_combout\ : std_logic;
SIGNAL \Second2|counter~2_combout\ : std_logic;
SIGNAL \Second2|counter~0_combout\ : std_logic;
SIGNAL \sec2_segment|Equal0~0_combout\ : std_logic;
SIGNAL \enable2~combout\ : std_logic;
SIGNAL \Minute1|counter~0_combout\ : std_logic;
SIGNAL \min_segment|SevenSeg_out[0]~6_combout\ : std_logic;
SIGNAL \min_segment|SevenSeg_out[1]~5_combout\ : std_logic;
SIGNAL \min_segment|SevenSeg_out[2]~4_combout\ : std_logic;
SIGNAL \min_segment|SevenSeg_out[3]~3_combout\ : std_logic;
SIGNAL \min_segment|SevenSeg_out[4]~0_combout\ : std_logic;
SIGNAL \min_segment|SevenSeg_out[5]~2_combout\ : std_logic;
SIGNAL \min_segment|SevenSeg_out~1_combout\ : std_logic;
SIGNAL \u_Enable~3_combout\ : std_logic;
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
SIGNAL \conv_time|counter\ : std_logic_vector(31 DOWNTO 0);
SIGNAL \Second1|counter\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \Minute1|counter\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \Second2|counter\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \ALT_INV_Running~DUPLICATE_q\ : std_logic;
SIGNAL \conv_time|ALT_INV_counter[29]~DUPLICATE_q\ : std_logic;
SIGNAL \conv_time|ALT_INV_counter[26]~DUPLICATE_q\ : std_logic;
SIGNAL \conv_time|ALT_INV_counter[20]~DUPLICATE_q\ : std_logic;
SIGNAL \conv_time|ALT_INV_counter[19]~DUPLICATE_q\ : std_logic;
SIGNAL \conv_time|ALT_INV_counter[12]~DUPLICATE_q\ : std_logic;
SIGNAL \conv_time|ALT_INV_counter[10]~DUPLICATE_q\ : std_logic;
SIGNAL \conv_time|ALT_INV_counter[23]~DUPLICATE_q\ : std_logic;
SIGNAL \conv_time|ALT_INV_counter[31]~DUPLICATE_q\ : std_logic;
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
SIGNAL \min_segment|ALT_INV_SevenSeg_out[1]~5_combout\ : std_logic;
SIGNAL \sec1_segment|ALT_INV_SevenSeg_out[1]~5_combout\ : std_logic;
SIGNAL \sec2_segment|ALT_INV_SevenSeg_out[1]~5_combout\ : std_logic;
SIGNAL \conv_time|ALT_INV_counter~0_combout\ : std_logic;
SIGNAL \conv_time|ALT_INV_LessThan1~5_combout\ : std_logic;
SIGNAL \conv_time|ALT_INV_LessThan1~4_combout\ : std_logic;
SIGNAL \conv_time|ALT_INV_LessThan1~3_combout\ : std_logic;
SIGNAL \conv_time|ALT_INV_LessThan1~2_combout\ : std_logic;
SIGNAL \conv_time|ALT_INV_LessThan1~1_combout\ : std_logic;
SIGNAL \conv_time|ALT_INV_out_clk~0_combout\ : std_logic;
SIGNAL \conv_time|ALT_INV_LessThan0~2_combout\ : std_logic;
SIGNAL \conv_time|ALT_INV_LessThan0~1_combout\ : std_logic;
SIGNAL \conv_time|ALT_INV_LessThan0~0_combout\ : std_logic;
SIGNAL \conv_time|ALT_INV_LessThan1~0_combout\ : std_logic;
SIGNAL \ALT_INV_u_Enable~4_combout\ : std_logic;
SIGNAL \sec1_segment|ALT_INV_Equal0~0_combout\ : std_logic;
SIGNAL \sec2_segment|ALT_INV_Equal0~0_combout\ : std_logic;
SIGNAL \sec2_segment|ALT_INV_SevenSeg_out~1_combout\ : std_logic;
SIGNAL \sec1_segment|ALT_INV_SevenSeg_out~1_combout\ : std_logic;
SIGNAL \ALT_INV_u_Enable~3_combout\ : std_logic;
SIGNAL \ALT_INV_u_Enable~2_combout\ : std_logic;
SIGNAL \Second2|ALT_INV_counter\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \ALT_INV_u_Enable~1_combout\ : std_logic;
SIGNAL \ALT_INV_u_Enable~0_combout\ : std_logic;
SIGNAL \Second1|ALT_INV_counter\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \ALT_INV_Equal5~0_combout\ : std_logic;
SIGNAL \ALT_INV_Running~q\ : std_logic;
SIGNAL \min_segment|ALT_INV_SevenSeg_out~1_combout\ : std_logic;
SIGNAL \Minute1|ALT_INV_counter\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \conv_time|ALT_INV_counter\ : std_logic_vector(31 DOWNTO 0);

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
\ALT_INV_Running~DUPLICATE_q\ <= NOT \Running~DUPLICATE_q\;
\conv_time|ALT_INV_counter[29]~DUPLICATE_q\ <= NOT \conv_time|counter[29]~DUPLICATE_q\;
\conv_time|ALT_INV_counter[26]~DUPLICATE_q\ <= NOT \conv_time|counter[26]~DUPLICATE_q\;
\conv_time|ALT_INV_counter[20]~DUPLICATE_q\ <= NOT \conv_time|counter[20]~DUPLICATE_q\;
\conv_time|ALT_INV_counter[19]~DUPLICATE_q\ <= NOT \conv_time|counter[19]~DUPLICATE_q\;
\conv_time|ALT_INV_counter[12]~DUPLICATE_q\ <= NOT \conv_time|counter[12]~DUPLICATE_q\;
\conv_time|ALT_INV_counter[10]~DUPLICATE_q\ <= NOT \conv_time|counter[10]~DUPLICATE_q\;
\conv_time|ALT_INV_counter[23]~DUPLICATE_q\ <= NOT \conv_time|counter[23]~DUPLICATE_q\;
\conv_time|ALT_INV_counter[31]~DUPLICATE_q\ <= NOT \conv_time|counter[31]~DUPLICATE_q\;
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
\min_segment|ALT_INV_SevenSeg_out[1]~5_combout\ <= NOT \min_segment|SevenSeg_out[1]~5_combout\;
\sec1_segment|ALT_INV_SevenSeg_out[1]~5_combout\ <= NOT \sec1_segment|SevenSeg_out[1]~5_combout\;
\sec2_segment|ALT_INV_SevenSeg_out[1]~5_combout\ <= NOT \sec2_segment|SevenSeg_out[1]~5_combout\;
\conv_time|ALT_INV_counter~0_combout\ <= NOT \conv_time|counter~0_combout\;
\conv_time|ALT_INV_LessThan1~5_combout\ <= NOT \conv_time|LessThan1~5_combout\;
\conv_time|ALT_INV_LessThan1~4_combout\ <= NOT \conv_time|LessThan1~4_combout\;
\conv_time|ALT_INV_LessThan1~3_combout\ <= NOT \conv_time|LessThan1~3_combout\;
\conv_time|ALT_INV_LessThan1~2_combout\ <= NOT \conv_time|LessThan1~2_combout\;
\conv_time|ALT_INV_LessThan1~1_combout\ <= NOT \conv_time|LessThan1~1_combout\;
\conv_time|ALT_INV_out_clk~0_combout\ <= NOT \conv_time|out_clk~0_combout\;
\conv_time|ALT_INV_LessThan0~2_combout\ <= NOT \conv_time|LessThan0~2_combout\;
\conv_time|ALT_INV_LessThan0~1_combout\ <= NOT \conv_time|LessThan0~1_combout\;
\conv_time|ALT_INV_LessThan0~0_combout\ <= NOT \conv_time|LessThan0~0_combout\;
\conv_time|ALT_INV_LessThan1~0_combout\ <= NOT \conv_time|LessThan1~0_combout\;
\ALT_INV_u_Enable~4_combout\ <= NOT \u_Enable~4_combout\;
\sec1_segment|ALT_INV_Equal0~0_combout\ <= NOT \sec1_segment|Equal0~0_combout\;
\sec2_segment|ALT_INV_Equal0~0_combout\ <= NOT \sec2_segment|Equal0~0_combout\;
\sec2_segment|ALT_INV_SevenSeg_out~1_combout\ <= NOT \sec2_segment|SevenSeg_out~1_combout\;
\sec1_segment|ALT_INV_SevenSeg_out~1_combout\ <= NOT \sec1_segment|SevenSeg_out~1_combout\;
\ALT_INV_u_Enable~3_combout\ <= NOT \u_Enable~3_combout\;
\ALT_INV_u_Enable~2_combout\ <= NOT \u_Enable~2_combout\;
\Second2|ALT_INV_counter\(3) <= NOT \Second2|counter\(3);
\Second2|ALT_INV_counter\(2) <= NOT \Second2|counter\(2);
\Second2|ALT_INV_counter\(1) <= NOT \Second2|counter\(1);
\ALT_INV_u_Enable~1_combout\ <= NOT \u_Enable~1_combout\;
\Second2|ALT_INV_counter\(0) <= NOT \Second2|counter\(0);
\ALT_INV_u_Enable~0_combout\ <= NOT \u_Enable~0_combout\;
\Second1|ALT_INV_counter\(2) <= NOT \Second1|counter\(2);
\Second1|ALT_INV_counter\(1) <= NOT \Second1|counter\(1);
\Second1|ALT_INV_counter\(0) <= NOT \Second1|counter\(0);
\ALT_INV_Equal5~0_combout\ <= NOT \Equal5~0_combout\;
\Second1|ALT_INV_counter\(3) <= NOT \Second1|counter\(3);
\ALT_INV_Running~q\ <= NOT \Running~q\;
\min_segment|ALT_INV_SevenSeg_out~1_combout\ <= NOT \min_segment|SevenSeg_out~1_combout\;
\Minute1|ALT_INV_counter\(2) <= NOT \Minute1|counter\(2);
\Minute1|ALT_INV_counter\(1) <= NOT \Minute1|counter\(1);
\Minute1|ALT_INV_counter\(3) <= NOT \Minute1|counter\(3);
\Minute1|ALT_INV_counter\(0) <= NOT \Minute1|counter\(0);
\conv_time|ALT_INV_counter\(0) <= NOT \conv_time|counter\(0);
\conv_time|ALT_INV_counter\(1) <= NOT \conv_time|counter\(1);
\conv_time|ALT_INV_counter\(2) <= NOT \conv_time|counter\(2);
\conv_time|ALT_INV_counter\(3) <= NOT \conv_time|counter\(3);
\conv_time|ALT_INV_counter\(4) <= NOT \conv_time|counter\(4);
\conv_time|ALT_INV_counter\(5) <= NOT \conv_time|counter\(5);
\conv_time|ALT_INV_counter\(28) <= NOT \conv_time|counter\(28);
\conv_time|ALT_INV_counter\(29) <= NOT \conv_time|counter\(29);
\conv_time|ALT_INV_counter\(30) <= NOT \conv_time|counter\(30);
\conv_time|ALT_INV_counter\(27) <= NOT \conv_time|counter\(27);
\conv_time|ALT_INV_counter\(26) <= NOT \conv_time|counter\(26);
\conv_time|ALT_INV_counter\(22) <= NOT \conv_time|counter\(22);
\conv_time|ALT_INV_counter\(21) <= NOT \conv_time|counter\(21);
\conv_time|ALT_INV_counter\(20) <= NOT \conv_time|counter\(20);
\conv_time|ALT_INV_counter\(19) <= NOT \conv_time|counter\(19);
\conv_time|ALT_INV_counter\(18) <= NOT \conv_time|counter\(18);
\conv_time|ALT_INV_counter\(14) <= NOT \conv_time|counter\(14);
\conv_time|ALT_INV_counter\(13) <= NOT \conv_time|counter\(13);
\conv_time|ALT_INV_counter\(12) <= NOT \conv_time|counter\(12);
\conv_time|ALT_INV_counter\(11) <= NOT \conv_time|counter\(11);
\conv_time|ALT_INV_counter\(10) <= NOT \conv_time|counter\(10);
\conv_time|ALT_INV_counter\(9) <= NOT \conv_time|counter\(9);
\conv_time|ALT_INV_counter\(7) <= NOT \conv_time|counter\(7);
\conv_time|ALT_INV_counter\(8) <= NOT \conv_time|counter\(8);
\conv_time|ALT_INV_counter\(6) <= NOT \conv_time|counter\(6);
\conv_time|ALT_INV_counter\(15) <= NOT \conv_time|counter\(15);
\conv_time|ALT_INV_counter\(16) <= NOT \conv_time|counter\(16);
\conv_time|ALT_INV_counter\(17) <= NOT \conv_time|counter\(17);
\conv_time|ALT_INV_counter\(23) <= NOT \conv_time|counter\(23);
\conv_time|ALT_INV_counter\(24) <= NOT \conv_time|counter\(24);
\conv_time|ALT_INV_counter\(25) <= NOT \conv_time|counter\(25);
\conv_time|ALT_INV_counter\(31) <= NOT \conv_time|counter\(31);

-- Location: IOOBUF_X48_Y0_N42
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

-- Location: IOOBUF_X38_Y0_N53
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

-- Location: IOOBUF_X22_Y0_N53
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

-- Location: IOOBUF_X36_Y0_N19
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

-- Location: IOOBUF_X38_Y0_N19
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

-- Location: IOOBUF_X46_Y0_N53
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

-- Location: IOOBUF_X40_Y0_N76
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

-- Location: IOOBUF_X0_Y18_N79
\time_out~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \ALT_INV_u_Enable~3_combout\,
	devoe => ww_devoe,
	o => ww_time_out);

-- Location: IOOBUF_X52_Y0_N53
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

-- Location: IOOBUF_X51_Y0_N36
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

-- Location: IOOBUF_X48_Y0_N76
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

-- Location: IOOBUF_X50_Y0_N36
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

-- Location: IOOBUF_X48_Y0_N93
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

-- Location: IOOBUF_X50_Y0_N53
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

-- Location: IOOBUF_X46_Y0_N36
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

-- Location: IOOBUF_X44_Y0_N36
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

-- Location: IOOBUF_X40_Y0_N93
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

-- Location: IOOBUF_X44_Y0_N53
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

-- Location: IOOBUF_X43_Y0_N36
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

-- Location: IOOBUF_X38_Y0_N36
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

-- Location: IOOBUF_X43_Y0_N53
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

-- Location: IOOBUF_X51_Y0_N53
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

-- Location: IOIBUF_X22_Y0_N1
\t_Clk~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_t_Clk,
	o => \t_Clk~input_o\);

-- Location: CLKCTRL_G6
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

-- Location: LABCELL_X25_Y5_N0
\conv_time|Add0~125\ : cyclonev_lcell_comb
-- Equation(s):
-- \conv_time|Add0~125_sumout\ = SUM(( \conv_time|counter\(0) ) + ( VCC ) + ( !VCC ))
-- \conv_time|Add0~126\ = CARRY(( \conv_time|counter\(0) ) + ( VCC ) + ( !VCC ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \conv_time|ALT_INV_counter\(0),
	cin => GND,
	sumout => \conv_time|Add0~125_sumout\,
	cout => \conv_time|Add0~126\);

-- Location: LABCELL_X25_Y4_N21
\conv_time|Add0~89\ : cyclonev_lcell_comb
-- Equation(s):
-- \conv_time|Add0~89_sumout\ = SUM(( \conv_time|counter\(27) ) + ( GND ) + ( \conv_time|Add0~86\ ))
-- \conv_time|Add0~90\ = CARRY(( \conv_time|counter\(27) ) + ( GND ) + ( \conv_time|Add0~86\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \conv_time|ALT_INV_counter\(27),
	cin => \conv_time|Add0~86\,
	sumout => \conv_time|Add0~89_sumout\,
	cout => \conv_time|Add0~90\);

-- Location: LABCELL_X25_Y4_N24
\conv_time|Add0~101\ : cyclonev_lcell_comb
-- Equation(s):
-- \conv_time|Add0~101_sumout\ = SUM(( \conv_time|counter\(28) ) + ( GND ) + ( \conv_time|Add0~90\ ))
-- \conv_time|Add0~102\ = CARRY(( \conv_time|counter\(28) ) + ( GND ) + ( \conv_time|Add0~90\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \conv_time|ALT_INV_counter\(28),
	cin => \conv_time|Add0~90\,
	sumout => \conv_time|Add0~101_sumout\,
	cout => \conv_time|Add0~102\);

-- Location: FF_X25_Y4_N26
\conv_time|counter[28]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \t_Clk~inputCLKENA0_outclk\,
	d => \conv_time|Add0~101_sumout\,
	sclr => \conv_time|counter~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \conv_time|counter\(28));

-- Location: LABCELL_X25_Y4_N27
\conv_time|Add0~97\ : cyclonev_lcell_comb
-- Equation(s):
-- \conv_time|Add0~97_sumout\ = SUM(( \conv_time|counter[29]~DUPLICATE_q\ ) + ( GND ) + ( \conv_time|Add0~102\ ))
-- \conv_time|Add0~98\ = CARRY(( \conv_time|counter[29]~DUPLICATE_q\ ) + ( GND ) + ( \conv_time|Add0~102\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \conv_time|ALT_INV_counter[29]~DUPLICATE_q\,
	cin => \conv_time|Add0~102\,
	sumout => \conv_time|Add0~97_sumout\,
	cout => \conv_time|Add0~98\);

-- Location: FF_X25_Y4_N28
\conv_time|counter[29]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \t_Clk~inputCLKENA0_outclk\,
	d => \conv_time|Add0~97_sumout\,
	sclr => \conv_time|counter~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \conv_time|counter[29]~DUPLICATE_q\);

-- Location: LABCELL_X25_Y4_N30
\conv_time|Add0~93\ : cyclonev_lcell_comb
-- Equation(s):
-- \conv_time|Add0~93_sumout\ = SUM(( \conv_time|counter\(30) ) + ( GND ) + ( \conv_time|Add0~98\ ))
-- \conv_time|Add0~94\ = CARRY(( \conv_time|counter\(30) ) + ( GND ) + ( \conv_time|Add0~98\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000011001100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \conv_time|ALT_INV_counter\(30),
	cin => \conv_time|Add0~98\,
	sumout => \conv_time|Add0~93_sumout\,
	cout => \conv_time|Add0~94\);

-- Location: FF_X25_Y4_N32
\conv_time|counter[30]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \t_Clk~inputCLKENA0_outclk\,
	d => \conv_time|Add0~93_sumout\,
	sclr => \conv_time|counter~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \conv_time|counter\(30));

-- Location: LABCELL_X25_Y4_N33
\conv_time|Add0~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \conv_time|Add0~1_sumout\ = SUM(( \conv_time|counter[31]~DUPLICATE_q\ ) + ( GND ) + ( \conv_time|Add0~94\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000101010101010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \conv_time|ALT_INV_counter[31]~DUPLICATE_q\,
	cin => \conv_time|Add0~94\,
	sumout => \conv_time|Add0~1_sumout\);

-- Location: FF_X25_Y4_N35
\conv_time|counter[31]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \t_Clk~inputCLKENA0_outclk\,
	d => \conv_time|Add0~1_sumout\,
	sclr => \conv_time|counter~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \conv_time|counter[31]~DUPLICATE_q\);

-- Location: FF_X25_Y4_N29
\conv_time|counter[29]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \t_Clk~inputCLKENA0_outclk\,
	d => \conv_time|Add0~97_sumout\,
	sclr => \conv_time|counter~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \conv_time|counter\(29));

-- Location: LABCELL_X25_Y4_N39
\conv_time|counter~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \conv_time|counter~0_combout\ = ( !\conv_time|counter\(28) & ( (!\conv_time|counter\(30) & !\conv_time|counter\(29)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111000000000000111100000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \conv_time|ALT_INV_counter\(30),
	datad => \conv_time|ALT_INV_counter\(29),
	dataf => \conv_time|ALT_INV_counter\(28),
	combout => \conv_time|counter~0_combout\);

-- Location: FF_X25_Y5_N37
\conv_time|counter[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \t_Clk~inputCLKENA0_outclk\,
	d => \conv_time|Add0~53_sumout\,
	sclr => \conv_time|counter~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \conv_time|counter\(12));

-- Location: LABCELL_X25_Y4_N54
\conv_time|LessThan1~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \conv_time|LessThan1~3_combout\ = ( \conv_time|counter\(14) & ( (\conv_time|counter\(13) & (\conv_time|counter\(15) & \conv_time|counter\(12))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000001010000000000000101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \conv_time|ALT_INV_counter\(13),
	datac => \conv_time|ALT_INV_counter\(15),
	datad => \conv_time|ALT_INV_counter\(12),
	dataf => \conv_time|ALT_INV_counter\(14),
	combout => \conv_time|LessThan1~3_combout\);

-- Location: FF_X25_Y5_N58
\conv_time|counter[19]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \t_Clk~inputCLKENA0_outclk\,
	d => \conv_time|Add0~69_sumout\,
	sclr => \conv_time|counter~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \conv_time|counter[19]~DUPLICATE_q\);

-- Location: LABCELL_X25_Y4_N36
\conv_time|LessThan1~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \conv_time|LessThan1~4_combout\ = ( \conv_time|counter[19]~DUPLICATE_q\ & ( (\conv_time|counter\(21) & (\conv_time|counter[23]~DUPLICATE_q\ & (\conv_time|counter\(22) & \conv_time|counter[20]~DUPLICATE_q\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000010000000000000001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \conv_time|ALT_INV_counter\(21),
	datab => \conv_time|ALT_INV_counter[23]~DUPLICATE_q\,
	datac => \conv_time|ALT_INV_counter\(22),
	datad => \conv_time|ALT_INV_counter[20]~DUPLICATE_q\,
	dataf => \conv_time|ALT_INV_counter[19]~DUPLICATE_q\,
	combout => \conv_time|LessThan1~4_combout\);

-- Location: FF_X25_Y5_N32
\conv_time|counter[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \t_Clk~inputCLKENA0_outclk\,
	d => \conv_time|Add0~45_sumout\,
	sclr => \conv_time|counter~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \conv_time|counter\(10));

-- Location: LABCELL_X24_Y5_N33
\conv_time|LessThan1~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \conv_time|LessThan1~2_combout\ = ( !\conv_time|counter\(9) & ( !\conv_time|counter\(11) & ( (!\conv_time|counter\(7) & (!\conv_time|counter\(8) & !\conv_time|counter\(10))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1010000000000000000000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \conv_time|ALT_INV_counter\(7),
	datac => \conv_time|ALT_INV_counter\(8),
	datad => \conv_time|ALT_INV_counter\(10),
	datae => \conv_time|ALT_INV_counter\(9),
	dataf => \conv_time|ALT_INV_counter\(11),
	combout => \conv_time|LessThan1~2_combout\);

-- Location: LABCELL_X25_Y4_N48
\conv_time|LessThan1~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \conv_time|LessThan1~5_combout\ = ( \conv_time|LessThan1~2_combout\ & ( \conv_time|counter\(17) & ( (!\conv_time|LessThan1~4_combout\) # ((!\conv_time|counter\(16) & !\conv_time|counter\(18))) ) ) ) # ( !\conv_time|LessThan1~2_combout\ & ( 
-- \conv_time|counter\(17) & ( (!\conv_time|LessThan1~4_combout\) # ((!\conv_time|LessThan1~3_combout\ & (!\conv_time|counter\(16) & !\conv_time|counter\(18)))) ) ) ) # ( \conv_time|LessThan1~2_combout\ & ( !\conv_time|counter\(17) & ( 
-- (!\conv_time|LessThan1~4_combout\) # (!\conv_time|counter\(18)) ) ) ) # ( !\conv_time|LessThan1~2_combout\ & ( !\conv_time|counter\(17) & ( (!\conv_time|LessThan1~4_combout\) # (!\conv_time|counter\(18)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111110000111111111111000011111000111100001111110011110000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \conv_time|ALT_INV_LessThan1~3_combout\,
	datab => \conv_time|ALT_INV_counter\(16),
	datac => \conv_time|ALT_INV_LessThan1~4_combout\,
	datad => \conv_time|ALT_INV_counter\(18),
	datae => \conv_time|ALT_INV_LessThan1~2_combout\,
	dataf => \conv_time|ALT_INV_counter\(17),
	combout => \conv_time|LessThan1~5_combout\);

-- Location: LABCELL_X25_Y4_N42
\conv_time|counter~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \conv_time|counter~1_combout\ = ( \conv_time|LessThan1~1_combout\ & ( \conv_time|LessThan1~5_combout\ & ( (!\conv_time|counter[31]~DUPLICATE_q\ & ((!\conv_time|counter~0_combout\) # ((\conv_time|counter\(25) & \conv_time|counter\(24))))) ) ) ) # ( 
-- !\conv_time|LessThan1~1_combout\ & ( \conv_time|LessThan1~5_combout\ & ( !\conv_time|counter[31]~DUPLICATE_q\ ) ) ) # ( \conv_time|LessThan1~1_combout\ & ( !\conv_time|LessThan1~5_combout\ & ( (!\conv_time|counter[31]~DUPLICATE_q\ & 
-- ((!\conv_time|counter~0_combout\) # (\conv_time|counter\(25)))) ) ) ) # ( !\conv_time|LessThan1~1_combout\ & ( !\conv_time|LessThan1~5_combout\ & ( !\conv_time|counter[31]~DUPLICATE_q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111000011110000111100000101000011110000111100001111000000010000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \conv_time|ALT_INV_counter\(25),
	datab => \conv_time|ALT_INV_counter\(24),
	datac => \conv_time|ALT_INV_counter[31]~DUPLICATE_q\,
	datad => \conv_time|ALT_INV_counter~0_combout\,
	datae => \conv_time|ALT_INV_LessThan1~1_combout\,
	dataf => \conv_time|ALT_INV_LessThan1~5_combout\,
	combout => \conv_time|counter~1_combout\);

-- Location: FF_X25_Y5_N2
\conv_time|counter[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \t_Clk~inputCLKENA0_outclk\,
	d => \conv_time|Add0~125_sumout\,
	sclr => \conv_time|counter~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \conv_time|counter\(0));

-- Location: LABCELL_X25_Y5_N3
\conv_time|Add0~121\ : cyclonev_lcell_comb
-- Equation(s):
-- \conv_time|Add0~121_sumout\ = SUM(( \conv_time|counter\(1) ) + ( GND ) + ( \conv_time|Add0~126\ ))
-- \conv_time|Add0~122\ = CARRY(( \conv_time|counter\(1) ) + ( GND ) + ( \conv_time|Add0~126\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \conv_time|ALT_INV_counter\(1),
	cin => \conv_time|Add0~126\,
	sumout => \conv_time|Add0~121_sumout\,
	cout => \conv_time|Add0~122\);

-- Location: FF_X25_Y5_N5
\conv_time|counter[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \t_Clk~inputCLKENA0_outclk\,
	d => \conv_time|Add0~121_sumout\,
	sclr => \conv_time|counter~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \conv_time|counter\(1));

-- Location: LABCELL_X25_Y5_N6
\conv_time|Add0~117\ : cyclonev_lcell_comb
-- Equation(s):
-- \conv_time|Add0~117_sumout\ = SUM(( \conv_time|counter\(2) ) + ( GND ) + ( \conv_time|Add0~122\ ))
-- \conv_time|Add0~118\ = CARRY(( \conv_time|counter\(2) ) + ( GND ) + ( \conv_time|Add0~122\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \conv_time|ALT_INV_counter\(2),
	cin => \conv_time|Add0~122\,
	sumout => \conv_time|Add0~117_sumout\,
	cout => \conv_time|Add0~118\);

-- Location: FF_X25_Y5_N7
\conv_time|counter[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \t_Clk~inputCLKENA0_outclk\,
	d => \conv_time|Add0~117_sumout\,
	sclr => \conv_time|counter~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \conv_time|counter\(2));

-- Location: LABCELL_X25_Y5_N9
\conv_time|Add0~113\ : cyclonev_lcell_comb
-- Equation(s):
-- \conv_time|Add0~113_sumout\ = SUM(( \conv_time|counter\(3) ) + ( GND ) + ( \conv_time|Add0~118\ ))
-- \conv_time|Add0~114\ = CARRY(( \conv_time|counter\(3) ) + ( GND ) + ( \conv_time|Add0~118\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \conv_time|ALT_INV_counter\(3),
	cin => \conv_time|Add0~118\,
	sumout => \conv_time|Add0~113_sumout\,
	cout => \conv_time|Add0~114\);

-- Location: FF_X25_Y5_N11
\conv_time|counter[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \t_Clk~inputCLKENA0_outclk\,
	d => \conv_time|Add0~113_sumout\,
	sclr => \conv_time|counter~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \conv_time|counter\(3));

-- Location: LABCELL_X25_Y5_N12
\conv_time|Add0~109\ : cyclonev_lcell_comb
-- Equation(s):
-- \conv_time|Add0~109_sumout\ = SUM(( \conv_time|counter\(4) ) + ( GND ) + ( \conv_time|Add0~114\ ))
-- \conv_time|Add0~110\ = CARRY(( \conv_time|counter\(4) ) + ( GND ) + ( \conv_time|Add0~114\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000011001100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \conv_time|ALT_INV_counter\(4),
	cin => \conv_time|Add0~114\,
	sumout => \conv_time|Add0~109_sumout\,
	cout => \conv_time|Add0~110\);

-- Location: FF_X25_Y5_N14
\conv_time|counter[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \t_Clk~inputCLKENA0_outclk\,
	d => \conv_time|Add0~109_sumout\,
	sclr => \conv_time|counter~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \conv_time|counter\(4));

-- Location: LABCELL_X25_Y5_N15
\conv_time|Add0~105\ : cyclonev_lcell_comb
-- Equation(s):
-- \conv_time|Add0~105_sumout\ = SUM(( \conv_time|counter\(5) ) + ( GND ) + ( \conv_time|Add0~110\ ))
-- \conv_time|Add0~106\ = CARRY(( \conv_time|counter\(5) ) + ( GND ) + ( \conv_time|Add0~110\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \conv_time|ALT_INV_counter\(5),
	cin => \conv_time|Add0~110\,
	sumout => \conv_time|Add0~105_sumout\,
	cout => \conv_time|Add0~106\);

-- Location: FF_X25_Y5_N17
\conv_time|counter[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \t_Clk~inputCLKENA0_outclk\,
	d => \conv_time|Add0~105_sumout\,
	sclr => \conv_time|counter~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \conv_time|counter\(5));

-- Location: LABCELL_X25_Y5_N18
\conv_time|Add0~29\ : cyclonev_lcell_comb
-- Equation(s):
-- \conv_time|Add0~29_sumout\ = SUM(( \conv_time|counter\(6) ) + ( GND ) + ( \conv_time|Add0~106\ ))
-- \conv_time|Add0~30\ = CARRY(( \conv_time|counter\(6) ) + ( GND ) + ( \conv_time|Add0~106\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \conv_time|ALT_INV_counter\(6),
	cin => \conv_time|Add0~106\,
	sumout => \conv_time|Add0~29_sumout\,
	cout => \conv_time|Add0~30\);

-- Location: FF_X25_Y5_N20
\conv_time|counter[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \t_Clk~inputCLKENA0_outclk\,
	d => \conv_time|Add0~29_sumout\,
	sclr => \conv_time|counter~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \conv_time|counter\(6));

-- Location: LABCELL_X25_Y5_N21
\conv_time|Add0~37\ : cyclonev_lcell_comb
-- Equation(s):
-- \conv_time|Add0~37_sumout\ = SUM(( \conv_time|counter\(7) ) + ( GND ) + ( \conv_time|Add0~30\ ))
-- \conv_time|Add0~38\ = CARRY(( \conv_time|counter\(7) ) + ( GND ) + ( \conv_time|Add0~30\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \conv_time|ALT_INV_counter\(7),
	cin => \conv_time|Add0~30\,
	sumout => \conv_time|Add0~37_sumout\,
	cout => \conv_time|Add0~38\);

-- Location: FF_X25_Y5_N23
\conv_time|counter[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \t_Clk~inputCLKENA0_outclk\,
	d => \conv_time|Add0~37_sumout\,
	sclr => \conv_time|counter~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \conv_time|counter\(7));

-- Location: LABCELL_X25_Y5_N24
\conv_time|Add0~33\ : cyclonev_lcell_comb
-- Equation(s):
-- \conv_time|Add0~33_sumout\ = SUM(( \conv_time|counter\(8) ) + ( GND ) + ( \conv_time|Add0~38\ ))
-- \conv_time|Add0~34\ = CARRY(( \conv_time|counter\(8) ) + ( GND ) + ( \conv_time|Add0~38\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \conv_time|ALT_INV_counter\(8),
	cin => \conv_time|Add0~38\,
	sumout => \conv_time|Add0~33_sumout\,
	cout => \conv_time|Add0~34\);

-- Location: FF_X25_Y5_N26
\conv_time|counter[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \t_Clk~inputCLKENA0_outclk\,
	d => \conv_time|Add0~33_sumout\,
	sclr => \conv_time|counter~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \conv_time|counter\(8));

-- Location: LABCELL_X25_Y5_N27
\conv_time|Add0~41\ : cyclonev_lcell_comb
-- Equation(s):
-- \conv_time|Add0~41_sumout\ = SUM(( \conv_time|counter\(9) ) + ( GND ) + ( \conv_time|Add0~34\ ))
-- \conv_time|Add0~42\ = CARRY(( \conv_time|counter\(9) ) + ( GND ) + ( \conv_time|Add0~34\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \conv_time|ALT_INV_counter\(9),
	cin => \conv_time|Add0~34\,
	sumout => \conv_time|Add0~41_sumout\,
	cout => \conv_time|Add0~42\);

-- Location: FF_X25_Y5_N29
\conv_time|counter[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \t_Clk~inputCLKENA0_outclk\,
	d => \conv_time|Add0~41_sumout\,
	sclr => \conv_time|counter~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \conv_time|counter\(9));

-- Location: LABCELL_X25_Y5_N30
\conv_time|Add0~45\ : cyclonev_lcell_comb
-- Equation(s):
-- \conv_time|Add0~45_sumout\ = SUM(( \conv_time|counter[10]~DUPLICATE_q\ ) + ( GND ) + ( \conv_time|Add0~42\ ))
-- \conv_time|Add0~46\ = CARRY(( \conv_time|counter[10]~DUPLICATE_q\ ) + ( GND ) + ( \conv_time|Add0~42\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \conv_time|ALT_INV_counter[10]~DUPLICATE_q\,
	cin => \conv_time|Add0~42\,
	sumout => \conv_time|Add0~45_sumout\,
	cout => \conv_time|Add0~46\);

-- Location: FF_X25_Y5_N31
\conv_time|counter[10]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \t_Clk~inputCLKENA0_outclk\,
	d => \conv_time|Add0~45_sumout\,
	sclr => \conv_time|counter~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \conv_time|counter[10]~DUPLICATE_q\);

-- Location: LABCELL_X25_Y5_N33
\conv_time|Add0~49\ : cyclonev_lcell_comb
-- Equation(s):
-- \conv_time|Add0~49_sumout\ = SUM(( \conv_time|counter\(11) ) + ( GND ) + ( \conv_time|Add0~46\ ))
-- \conv_time|Add0~50\ = CARRY(( \conv_time|counter\(11) ) + ( GND ) + ( \conv_time|Add0~46\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000101010101010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \conv_time|ALT_INV_counter\(11),
	cin => \conv_time|Add0~46\,
	sumout => \conv_time|Add0~49_sumout\,
	cout => \conv_time|Add0~50\);

-- Location: FF_X25_Y5_N35
\conv_time|counter[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \t_Clk~inputCLKENA0_outclk\,
	d => \conv_time|Add0~49_sumout\,
	sclr => \conv_time|counter~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \conv_time|counter\(11));

-- Location: LABCELL_X25_Y5_N36
\conv_time|Add0~53\ : cyclonev_lcell_comb
-- Equation(s):
-- \conv_time|Add0~53_sumout\ = SUM(( \conv_time|counter[12]~DUPLICATE_q\ ) + ( GND ) + ( \conv_time|Add0~50\ ))
-- \conv_time|Add0~54\ = CARRY(( \conv_time|counter[12]~DUPLICATE_q\ ) + ( GND ) + ( \conv_time|Add0~50\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \conv_time|ALT_INV_counter[12]~DUPLICATE_q\,
	cin => \conv_time|Add0~50\,
	sumout => \conv_time|Add0~53_sumout\,
	cout => \conv_time|Add0~54\);

-- Location: FF_X25_Y5_N38
\conv_time|counter[12]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \t_Clk~inputCLKENA0_outclk\,
	d => \conv_time|Add0~53_sumout\,
	sclr => \conv_time|counter~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \conv_time|counter[12]~DUPLICATE_q\);

-- Location: LABCELL_X25_Y5_N39
\conv_time|Add0~57\ : cyclonev_lcell_comb
-- Equation(s):
-- \conv_time|Add0~57_sumout\ = SUM(( \conv_time|counter\(13) ) + ( GND ) + ( \conv_time|Add0~54\ ))
-- \conv_time|Add0~58\ = CARRY(( \conv_time|counter\(13) ) + ( GND ) + ( \conv_time|Add0~54\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \conv_time|ALT_INV_counter\(13),
	cin => \conv_time|Add0~54\,
	sumout => \conv_time|Add0~57_sumout\,
	cout => \conv_time|Add0~58\);

-- Location: FF_X25_Y5_N41
\conv_time|counter[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \t_Clk~inputCLKENA0_outclk\,
	d => \conv_time|Add0~57_sumout\,
	sclr => \conv_time|counter~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \conv_time|counter\(13));

-- Location: LABCELL_X25_Y5_N42
\conv_time|Add0~61\ : cyclonev_lcell_comb
-- Equation(s):
-- \conv_time|Add0~61_sumout\ = SUM(( \conv_time|counter\(14) ) + ( GND ) + ( \conv_time|Add0~58\ ))
-- \conv_time|Add0~62\ = CARRY(( \conv_time|counter\(14) ) + ( GND ) + ( \conv_time|Add0~58\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \conv_time|ALT_INV_counter\(14),
	cin => \conv_time|Add0~58\,
	sumout => \conv_time|Add0~61_sumout\,
	cout => \conv_time|Add0~62\);

-- Location: FF_X25_Y5_N43
\conv_time|counter[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \t_Clk~inputCLKENA0_outclk\,
	d => \conv_time|Add0~61_sumout\,
	sclr => \conv_time|counter~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \conv_time|counter\(14));

-- Location: LABCELL_X25_Y5_N45
\conv_time|Add0~25\ : cyclonev_lcell_comb
-- Equation(s):
-- \conv_time|Add0~25_sumout\ = SUM(( \conv_time|counter\(15) ) + ( GND ) + ( \conv_time|Add0~62\ ))
-- \conv_time|Add0~26\ = CARRY(( \conv_time|counter\(15) ) + ( GND ) + ( \conv_time|Add0~62\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \conv_time|ALT_INV_counter\(15),
	cin => \conv_time|Add0~62\,
	sumout => \conv_time|Add0~25_sumout\,
	cout => \conv_time|Add0~26\);

-- Location: FF_X25_Y5_N47
\conv_time|counter[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \t_Clk~inputCLKENA0_outclk\,
	d => \conv_time|Add0~25_sumout\,
	sclr => \conv_time|counter~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \conv_time|counter\(15));

-- Location: LABCELL_X25_Y5_N48
\conv_time|Add0~21\ : cyclonev_lcell_comb
-- Equation(s):
-- \conv_time|Add0~21_sumout\ = SUM(( \conv_time|counter\(16) ) + ( GND ) + ( \conv_time|Add0~26\ ))
-- \conv_time|Add0~22\ = CARRY(( \conv_time|counter\(16) ) + ( GND ) + ( \conv_time|Add0~26\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \conv_time|ALT_INV_counter\(16),
	cin => \conv_time|Add0~26\,
	sumout => \conv_time|Add0~21_sumout\,
	cout => \conv_time|Add0~22\);

-- Location: FF_X25_Y5_N50
\conv_time|counter[16]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \t_Clk~inputCLKENA0_outclk\,
	d => \conv_time|Add0~21_sumout\,
	sclr => \conv_time|counter~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \conv_time|counter\(16));

-- Location: LABCELL_X25_Y5_N51
\conv_time|Add0~17\ : cyclonev_lcell_comb
-- Equation(s):
-- \conv_time|Add0~17_sumout\ = SUM(( \conv_time|counter\(17) ) + ( GND ) + ( \conv_time|Add0~22\ ))
-- \conv_time|Add0~18\ = CARRY(( \conv_time|counter\(17) ) + ( GND ) + ( \conv_time|Add0~22\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \conv_time|ALT_INV_counter\(17),
	cin => \conv_time|Add0~22\,
	sumout => \conv_time|Add0~17_sumout\,
	cout => \conv_time|Add0~18\);

-- Location: FF_X25_Y4_N52
\conv_time|counter[17]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \t_Clk~inputCLKENA0_outclk\,
	asdata => \conv_time|Add0~17_sumout\,
	sclr => \conv_time|counter~1_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \conv_time|counter\(17));

-- Location: LABCELL_X25_Y5_N54
\conv_time|Add0~65\ : cyclonev_lcell_comb
-- Equation(s):
-- \conv_time|Add0~65_sumout\ = SUM(( \conv_time|counter\(18) ) + ( GND ) + ( \conv_time|Add0~18\ ))
-- \conv_time|Add0~66\ = CARRY(( \conv_time|counter\(18) ) + ( GND ) + ( \conv_time|Add0~18\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \conv_time|ALT_INV_counter\(18),
	cin => \conv_time|Add0~18\,
	sumout => \conv_time|Add0~65_sumout\,
	cout => \conv_time|Add0~66\);

-- Location: FF_X25_Y5_N56
\conv_time|counter[18]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \t_Clk~inputCLKENA0_outclk\,
	d => \conv_time|Add0~65_sumout\,
	sclr => \conv_time|counter~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \conv_time|counter\(18));

-- Location: LABCELL_X25_Y5_N57
\conv_time|Add0~69\ : cyclonev_lcell_comb
-- Equation(s):
-- \conv_time|Add0~69_sumout\ = SUM(( \conv_time|counter\(19) ) + ( GND ) + ( \conv_time|Add0~66\ ))
-- \conv_time|Add0~70\ = CARRY(( \conv_time|counter\(19) ) + ( GND ) + ( \conv_time|Add0~66\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \conv_time|ALT_INV_counter\(19),
	cin => \conv_time|Add0~66\,
	sumout => \conv_time|Add0~69_sumout\,
	cout => \conv_time|Add0~70\);

-- Location: FF_X25_Y5_N59
\conv_time|counter[19]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \t_Clk~inputCLKENA0_outclk\,
	d => \conv_time|Add0~69_sumout\,
	sclr => \conv_time|counter~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \conv_time|counter\(19));

-- Location: LABCELL_X25_Y4_N0
\conv_time|Add0~73\ : cyclonev_lcell_comb
-- Equation(s):
-- \conv_time|Add0~73_sumout\ = SUM(( \conv_time|counter[20]~DUPLICATE_q\ ) + ( GND ) + ( \conv_time|Add0~70\ ))
-- \conv_time|Add0~74\ = CARRY(( \conv_time|counter[20]~DUPLICATE_q\ ) + ( GND ) + ( \conv_time|Add0~70\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \conv_time|ALT_INV_counter[20]~DUPLICATE_q\,
	cin => \conv_time|Add0~70\,
	sumout => \conv_time|Add0~73_sumout\,
	cout => \conv_time|Add0~74\);

-- Location: FF_X25_Y4_N2
\conv_time|counter[20]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \t_Clk~inputCLKENA0_outclk\,
	d => \conv_time|Add0~73_sumout\,
	sclr => \conv_time|counter~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \conv_time|counter[20]~DUPLICATE_q\);

-- Location: LABCELL_X25_Y4_N3
\conv_time|Add0~77\ : cyclonev_lcell_comb
-- Equation(s):
-- \conv_time|Add0~77_sumout\ = SUM(( \conv_time|counter\(21) ) + ( GND ) + ( \conv_time|Add0~74\ ))
-- \conv_time|Add0~78\ = CARRY(( \conv_time|counter\(21) ) + ( GND ) + ( \conv_time|Add0~74\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \conv_time|ALT_INV_counter\(21),
	cin => \conv_time|Add0~74\,
	sumout => \conv_time|Add0~77_sumout\,
	cout => \conv_time|Add0~78\);

-- Location: FF_X25_Y4_N5
\conv_time|counter[21]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \t_Clk~inputCLKENA0_outclk\,
	d => \conv_time|Add0~77_sumout\,
	sclr => \conv_time|counter~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \conv_time|counter\(21));

-- Location: LABCELL_X25_Y4_N6
\conv_time|Add0~81\ : cyclonev_lcell_comb
-- Equation(s):
-- \conv_time|Add0~81_sumout\ = SUM(( \conv_time|counter\(22) ) + ( GND ) + ( \conv_time|Add0~78\ ))
-- \conv_time|Add0~82\ = CARRY(( \conv_time|counter\(22) ) + ( GND ) + ( \conv_time|Add0~78\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000011001100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \conv_time|ALT_INV_counter\(22),
	cin => \conv_time|Add0~78\,
	sumout => \conv_time|Add0~81_sumout\,
	cout => \conv_time|Add0~82\);

-- Location: FF_X25_Y4_N8
\conv_time|counter[22]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \t_Clk~inputCLKENA0_outclk\,
	d => \conv_time|Add0~81_sumout\,
	sclr => \conv_time|counter~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \conv_time|counter\(22));

-- Location: LABCELL_X25_Y4_N9
\conv_time|Add0~13\ : cyclonev_lcell_comb
-- Equation(s):
-- \conv_time|Add0~13_sumout\ = SUM(( \conv_time|counter[23]~DUPLICATE_q\ ) + ( GND ) + ( \conv_time|Add0~82\ ))
-- \conv_time|Add0~14\ = CARRY(( \conv_time|counter[23]~DUPLICATE_q\ ) + ( GND ) + ( \conv_time|Add0~82\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \conv_time|ALT_INV_counter[23]~DUPLICATE_q\,
	cin => \conv_time|Add0~82\,
	sumout => \conv_time|Add0~13_sumout\,
	cout => \conv_time|Add0~14\);

-- Location: FF_X25_Y4_N11
\conv_time|counter[23]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \t_Clk~inputCLKENA0_outclk\,
	d => \conv_time|Add0~13_sumout\,
	sclr => \conv_time|counter~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \conv_time|counter[23]~DUPLICATE_q\);

-- Location: LABCELL_X25_Y4_N12
\conv_time|Add0~9\ : cyclonev_lcell_comb
-- Equation(s):
-- \conv_time|Add0~9_sumout\ = SUM(( \conv_time|counter\(24) ) + ( GND ) + ( \conv_time|Add0~14\ ))
-- \conv_time|Add0~10\ = CARRY(( \conv_time|counter\(24) ) + ( GND ) + ( \conv_time|Add0~14\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000011001100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \conv_time|ALT_INV_counter\(24),
	cin => \conv_time|Add0~14\,
	sumout => \conv_time|Add0~9_sumout\,
	cout => \conv_time|Add0~10\);

-- Location: FF_X25_Y4_N14
\conv_time|counter[24]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \t_Clk~inputCLKENA0_outclk\,
	d => \conv_time|Add0~9_sumout\,
	sclr => \conv_time|counter~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \conv_time|counter\(24));

-- Location: LABCELL_X25_Y4_N15
\conv_time|Add0~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \conv_time|Add0~5_sumout\ = SUM(( \conv_time|counter\(25) ) + ( GND ) + ( \conv_time|Add0~10\ ))
-- \conv_time|Add0~6\ = CARRY(( \conv_time|counter\(25) ) + ( GND ) + ( \conv_time|Add0~10\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \conv_time|ALT_INV_counter\(25),
	cin => \conv_time|Add0~10\,
	sumout => \conv_time|Add0~5_sumout\,
	cout => \conv_time|Add0~6\);

-- Location: FF_X25_Y4_N17
\conv_time|counter[25]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \t_Clk~inputCLKENA0_outclk\,
	d => \conv_time|Add0~5_sumout\,
	sclr => \conv_time|counter~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \conv_time|counter\(25));

-- Location: LABCELL_X25_Y4_N18
\conv_time|Add0~85\ : cyclonev_lcell_comb
-- Equation(s):
-- \conv_time|Add0~85_sumout\ = SUM(( \conv_time|counter[26]~DUPLICATE_q\ ) + ( GND ) + ( \conv_time|Add0~6\ ))
-- \conv_time|Add0~86\ = CARRY(( \conv_time|counter[26]~DUPLICATE_q\ ) + ( GND ) + ( \conv_time|Add0~6\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \conv_time|ALT_INV_counter[26]~DUPLICATE_q\,
	cin => \conv_time|Add0~6\,
	sumout => \conv_time|Add0~85_sumout\,
	cout => \conv_time|Add0~86\);

-- Location: FF_X25_Y4_N20
\conv_time|counter[26]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \t_Clk~inputCLKENA0_outclk\,
	d => \conv_time|Add0~85_sumout\,
	sclr => \conv_time|counter~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \conv_time|counter[26]~DUPLICATE_q\);

-- Location: FF_X25_Y4_N23
\conv_time|counter[27]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \t_Clk~inputCLKENA0_outclk\,
	d => \conv_time|Add0~89_sumout\,
	sclr => \conv_time|counter~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \conv_time|counter\(27));

-- Location: FF_X25_Y4_N19
\conv_time|counter[26]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \t_Clk~inputCLKENA0_outclk\,
	d => \conv_time|Add0~85_sumout\,
	sclr => \conv_time|counter~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \conv_time|counter\(26));

-- Location: LABCELL_X25_Y4_N57
\conv_time|LessThan1~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \conv_time|LessThan1~1_combout\ = ( !\conv_time|counter\(26) & ( !\conv_time|counter\(27) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111100000000111111110000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \conv_time|ALT_INV_counter\(27),
	dataf => \conv_time|ALT_INV_counter\(26),
	combout => \conv_time|LessThan1~1_combout\);

-- Location: FF_X25_Y4_N34
\conv_time|counter[31]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \t_Clk~inputCLKENA0_outclk\,
	d => \conv_time|Add0~1_sumout\,
	sclr => \conv_time|counter~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \conv_time|counter\(31));

-- Location: FF_X25_Y4_N10
\conv_time|counter[23]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \t_Clk~inputCLKENA0_outclk\,
	d => \conv_time|Add0~13_sumout\,
	sclr => \conv_time|counter~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \conv_time|counter\(23));

-- Location: FF_X25_Y4_N1
\conv_time|counter[20]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \t_Clk~inputCLKENA0_outclk\,
	d => \conv_time|Add0~73_sumout\,
	sclr => \conv_time|counter~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \conv_time|counter\(20));

-- Location: LABCELL_X24_Y5_N54
\conv_time|LessThan0~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \conv_time|LessThan0~2_combout\ = ( \conv_time|counter\(18) & ( \conv_time|counter[19]~DUPLICATE_q\ & ( (\conv_time|counter\(21) & (\conv_time|counter\(20) & \conv_time|counter\(22))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000100000001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \conv_time|ALT_INV_counter\(21),
	datab => \conv_time|ALT_INV_counter\(20),
	datac => \conv_time|ALT_INV_counter\(22),
	datae => \conv_time|ALT_INV_counter\(18),
	dataf => \conv_time|ALT_INV_counter[19]~DUPLICATE_q\,
	combout => \conv_time|LessThan0~2_combout\);

-- Location: LABCELL_X24_Y5_N51
\conv_time|LessThan0~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \conv_time|LessThan0~0_combout\ = ( \conv_time|counter\(14) & ( \conv_time|counter\(12) & ( (\conv_time|counter\(13) & \conv_time|counter\(11)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000001010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \conv_time|ALT_INV_counter\(13),
	datad => \conv_time|ALT_INV_counter\(11),
	datae => \conv_time|ALT_INV_counter\(14),
	dataf => \conv_time|ALT_INV_counter\(12),
	combout => \conv_time|LessThan0~0_combout\);

-- Location: LABCELL_X24_Y5_N18
\conv_time|LessThan1~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \conv_time|LessThan1~0_combout\ = ( !\conv_time|counter\(9) & ( !\conv_time|counter\(8) & ( (!\conv_time|counter\(7) & !\conv_time|counter\(10)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1010000010100000000000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \conv_time|ALT_INV_counter\(7),
	datac => \conv_time|ALT_INV_counter\(10),
	datae => \conv_time|ALT_INV_counter\(9),
	dataf => \conv_time|ALT_INV_counter\(8),
	combout => \conv_time|LessThan1~0_combout\);

-- Location: LABCELL_X24_Y5_N42
\conv_time|LessThan0~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \conv_time|LessThan0~1_combout\ = ( \conv_time|counter\(16) & ( \conv_time|counter\(15) ) ) # ( \conv_time|counter\(16) & ( !\conv_time|counter\(15) & ( (\conv_time|LessThan0~0_combout\ & ((!\conv_time|LessThan1~0_combout\) # (\conv_time|counter\(6)))) ) 
-- ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000010100000101010100000000000000001111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \conv_time|ALT_INV_LessThan0~0_combout\,
	datac => \conv_time|ALT_INV_LessThan1~0_combout\,
	datad => \conv_time|ALT_INV_counter\(6),
	datae => \conv_time|ALT_INV_counter\(16),
	dataf => \conv_time|ALT_INV_counter\(15),
	combout => \conv_time|LessThan0~1_combout\);

-- Location: LABCELL_X24_Y5_N36
\conv_time|out_clk~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \conv_time|out_clk~0_combout\ = ( \conv_time|LessThan0~2_combout\ & ( \conv_time|LessThan0~1_combout\ & ( !\conv_time|counter\(24) ) ) ) # ( !\conv_time|LessThan0~2_combout\ & ( \conv_time|LessThan0~1_combout\ & ( (!\conv_time|counter\(24)) # 
-- (!\conv_time|counter\(23)) ) ) ) # ( \conv_time|LessThan0~2_combout\ & ( !\conv_time|LessThan0~1_combout\ & ( (!\conv_time|counter\(24)) # ((!\conv_time|counter\(17) & !\conv_time|counter\(23))) ) ) ) # ( !\conv_time|LessThan0~2_combout\ & ( 
-- !\conv_time|LessThan0~1_combout\ & ( (!\conv_time|counter\(24)) # (!\conv_time|counter\(23)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111101011111010111010101110101011111010111110101010101010101010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \conv_time|ALT_INV_counter\(24),
	datab => \conv_time|ALT_INV_counter\(17),
	datac => \conv_time|ALT_INV_counter\(23),
	datae => \conv_time|ALT_INV_LessThan0~2_combout\,
	dataf => \conv_time|ALT_INV_LessThan0~1_combout\,
	combout => \conv_time|out_clk~0_combout\);

-- Location: LABCELL_X24_Y5_N6
\conv_time|out_clk~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \conv_time|out_clk~1_combout\ = ( !\conv_time|counter\(25) & ( (!\conv_time|LessThan1~1_combout\) # ((((!\conv_time|counter~0_combout\)) # (\conv_time|out_clk~0_combout\)) # (\conv_time|counter\(31))) ) ) # ( \conv_time|counter\(25) & ( 
-- (!\conv_time|LessThan1~1_combout\) # ((((!\conv_time|LessThan1~5_combout\) # (!\conv_time|counter~0_combout\)) # (\conv_time|counter\(24))) # (\conv_time|counter\(31))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "on",
	lut_mask => "1111111111111111111111111111111110111111101111111111111110111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \conv_time|ALT_INV_LessThan1~1_combout\,
	datab => \conv_time|ALT_INV_counter\(31),
	datac => \conv_time|ALT_INV_counter\(24),
	datad => \conv_time|ALT_INV_LessThan1~5_combout\,
	datae => \conv_time|ALT_INV_counter\(25),
	dataf => \conv_time|ALT_INV_counter~0_combout\,
	datag => \conv_time|ALT_INV_out_clk~0_combout\,
	combout => \conv_time|out_clk~1_combout\);

-- Location: FF_X24_Y5_N8
\conv_time|out_clk\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \t_Clk~input_o\,
	d => \conv_time|out_clk~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \conv_time|out_clk~q\);

-- Location: LABCELL_X41_Y3_N6
\Minute1|counter[0]~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \Minute1|counter[0]~3_combout\ = !\Minute1|counter\(0)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111000011110000111100001111000011110000111100001111000011110000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \Minute1|ALT_INV_counter\(0),
	combout => \Minute1|counter[0]~3_combout\);

-- Location: LABCELL_X41_Y3_N3
\Second2|counter[0]~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \Second2|counter[0]~3_combout\ = ( !\Second2|counter\(0) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111111111111111111100000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \Second2|ALT_INV_counter\(0),
	combout => \Second2|counter[0]~3_combout\);

-- Location: IOIBUF_X34_Y0_N52
\Data_In[6]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Data_In(6),
	o => \Data_In[6]~input_o\);

-- Location: IOIBUF_X36_Y0_N52
\Data_In[5]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Data_In(5),
	o => \Data_In[5]~input_o\);

-- Location: IOIBUF_X34_Y0_N35
\Data_In[7]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Data_In(7),
	o => \Data_In[7]~input_o\);

-- Location: IOIBUF_X10_Y0_N92
\Start~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Start,
	o => \Start~input_o\);

-- Location: LABCELL_X40_Y3_N15
\Running~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \Running~feeder_combout\ = VCC

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111111111111111111111111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	combout => \Running~feeder_combout\);

-- Location: FF_X40_Y3_N16
Running : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Start~input_o\,
	d => \Running~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Running~q\);

-- Location: IOIBUF_X34_Y0_N18
\Data_In[3]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Data_In(3),
	o => \Data_In[3]~input_o\);

-- Location: FF_X40_Y3_N17
\Running~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Start~input_o\,
	d => \Running~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Running~DUPLICATE_q\);

-- Location: LABCELL_X40_Y3_N54
\Second1|counter[3]~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Second1|counter[3]~0_combout\ = ( \Second1|counter\(0) & ( \u_Enable~4_combout\ & ( \Second1|counter\(3) ) ) ) # ( !\Second1|counter\(0) & ( \u_Enable~4_combout\ & ( \Second1|counter\(3) ) ) ) # ( \Second1|counter\(0) & ( !\u_Enable~4_combout\ & ( 
-- (!\Second1|counter\(1) & (\Second1|counter\(3) & ((!\Running~DUPLICATE_q\) # (\Second1|counter\(2))))) # (\Second1|counter\(1) & (!\Second1|counter\(3) $ (((!\Second1|counter\(2)) # (!\Running~DUPLICATE_q\))))) ) ) ) # ( !\Second1|counter\(0) & ( 
-- !\u_Enable~4_combout\ & ( \Second1|counter\(3) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100001111000011110001011000001111000011110000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Second1|ALT_INV_counter\(1),
	datab => \Second1|ALT_INV_counter\(2),
	datac => \Second1|ALT_INV_counter\(3),
	datad => \ALT_INV_Running~DUPLICATE_q\,
	datae => \Second1|ALT_INV_counter\(0),
	dataf => \ALT_INV_u_Enable~4_combout\,
	combout => \Second1|counter[3]~0_combout\);

-- Location: FF_X40_Y3_N20
\Second1|counter[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \conv_time|out_clk~q\,
	asdata => \Second1|counter[3]~0_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Second1|counter\(3));

-- Location: LABCELL_X40_Y3_N24
\Equal5~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Equal5~0_combout\ = !\Data_In[3]~input_o\ $ (!\Second1|counter\(3))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011110000111100001111000011110000111100001111000011110000111100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_Data_In[3]~input_o\,
	datac => \Second1|ALT_INV_counter\(3),
	combout => \Equal5~0_combout\);

-- Location: IOIBUF_X33_Y0_N41
\Data_In[0]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Data_In(0),
	o => \Data_In[0]~input_o\);

-- Location: IOIBUF_X34_Y0_N1
\Data_In[2]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Data_In(2),
	o => \Data_In[2]~input_o\);

-- Location: IOIBUF_X33_Y0_N58
\Data_In[1]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Data_In(1),
	o => \Data_In[1]~input_o\);

-- Location: LABCELL_X40_Y3_N21
\u_Enable~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_Enable~0_combout\ = ( \Data_In[1]~input_o\ & ( \Second1|counter\(1) & ( (!\Data_In[0]~input_o\ & (!\Second1|counter\(0) & (!\Second1|counter\(2) $ (\Data_In[2]~input_o\)))) # (\Data_In[0]~input_o\ & (\Second1|counter\(0) & (!\Second1|counter\(2) $ 
-- (\Data_In[2]~input_o\)))) ) ) ) # ( !\Data_In[1]~input_o\ & ( !\Second1|counter\(1) & ( (!\Data_In[0]~input_o\ & (!\Second1|counter\(0) & (!\Second1|counter\(2) $ (\Data_In[2]~input_o\)))) # (\Data_In[0]~input_o\ & (\Second1|counter\(0) & 
-- (!\Second1|counter\(2) $ (\Data_In[2]~input_o\)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1000010000100001000000000000000000000000000000001000010000100001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_Data_In[0]~input_o\,
	datab => \Second1|ALT_INV_counter\(2),
	datac => \Second1|ALT_INV_counter\(0),
	datad => \ALT_INV_Data_In[2]~input_o\,
	datae => \ALT_INV_Data_In[1]~input_o\,
	dataf => \Second1|ALT_INV_counter\(1),
	combout => \u_Enable~0_combout\);

-- Location: IOIBUF_X33_Y0_N92
\Data_In[8]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Data_In(8),
	o => \Data_In[8]~input_o\);

-- Location: LABCELL_X41_Y3_N21
\Minute1|counter[2]~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \Minute1|counter[2]~2_combout\ = ( \sec2_segment|Equal0~0_combout\ & ( \Running~q\ & ( !\Minute1|counter\(2) $ (((!\Minute1|counter\(0)) # ((!\Minute1|counter\(1)) # (!\sec1_segment|Equal0~0_combout\)))) ) ) ) # ( !\sec2_segment|Equal0~0_combout\ & ( 
-- \Running~q\ & ( \Minute1|counter\(2) ) ) ) # ( \sec2_segment|Equal0~0_combout\ & ( !\Running~q\ & ( \Minute1|counter\(2) ) ) ) # ( !\sec2_segment|Equal0~0_combout\ & ( !\Running~q\ & ( \Minute1|counter\(2) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011111111000000001111111100000000111111110000000111111110",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Minute1|ALT_INV_counter\(0),
	datab => \Minute1|ALT_INV_counter\(1),
	datac => \sec1_segment|ALT_INV_Equal0~0_combout\,
	datad => \Minute1|ALT_INV_counter\(2),
	datae => \sec2_segment|ALT_INV_Equal0~0_combout\,
	dataf => \ALT_INV_Running~q\,
	combout => \Minute1|counter[2]~2_combout\);

-- Location: FF_X41_Y3_N20
\Minute1|counter[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \conv_time|out_clk~q\,
	asdata => \Minute1|counter[2]~2_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Minute1|counter\(2));

-- Location: LABCELL_X41_Y3_N54
\Minute1|counter~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \Minute1|counter~1_combout\ = ( \Minute1|counter\(2) & ( !\Minute1|counter\(1) $ (!\Minute1|counter\(0)) ) ) # ( !\Minute1|counter\(2) & ( (!\Minute1|counter\(1) & (!\Minute1|counter\(3) & \Minute1|counter\(0))) # (\Minute1|counter\(1) & 
-- ((!\Minute1|counter\(0)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001111000000001100111100000000110011110011000011001111001100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \Minute1|ALT_INV_counter\(1),
	datac => \Minute1|ALT_INV_counter\(3),
	datad => \Minute1|ALT_INV_counter\(0),
	dataf => \Minute1|ALT_INV_counter\(2),
	combout => \Minute1|counter~1_combout\);

-- Location: FF_X41_Y3_N44
\Minute1|counter[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \conv_time|out_clk~q\,
	asdata => \Minute1|counter~1_combout\,
	sload => VCC,
	ena => \enable2~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Minute1|counter\(1));

-- Location: IOIBUF_X36_Y0_N35
\Data_In[4]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Data_In(4),
	o => \Data_In[4]~input_o\);

-- Location: IOIBUF_X33_Y0_N75
\Data_In[9]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Data_In(9),
	o => \Data_In[9]~input_o\);

-- Location: LABCELL_X41_Y3_N30
\u_Enable~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_Enable~1_combout\ = ( \Data_In[9]~input_o\ & ( \Second2|counter\(0) & ( (\Minute1|counter\(1) & (\Data_In[4]~input_o\ & (!\Data_In[8]~input_o\ $ (\Minute1|counter\(0))))) ) ) ) # ( !\Data_In[9]~input_o\ & ( \Second2|counter\(0) & ( 
-- (!\Minute1|counter\(1) & (\Data_In[4]~input_o\ & (!\Data_In[8]~input_o\ $ (\Minute1|counter\(0))))) ) ) ) # ( \Data_In[9]~input_o\ & ( !\Second2|counter\(0) & ( (\Minute1|counter\(1) & (!\Data_In[4]~input_o\ & (!\Data_In[8]~input_o\ $ 
-- (\Minute1|counter\(0))))) ) ) ) # ( !\Data_In[9]~input_o\ & ( !\Second2|counter\(0) & ( (!\Minute1|counter\(1) & (!\Data_In[4]~input_o\ & (!\Data_In[8]~input_o\ $ (\Minute1|counter\(0))))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1000010000000000001000010000000000000000100001000000000000100001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_Data_In[8]~input_o\,
	datab => \Minute1|ALT_INV_counter\(1),
	datac => \Minute1|ALT_INV_counter\(0),
	datad => \ALT_INV_Data_In[4]~input_o\,
	datae => \ALT_INV_Data_In[9]~input_o\,
	dataf => \Second2|ALT_INV_counter\(0),
	combout => \u_Enable~1_combout\);

-- Location: LABCELL_X40_Y3_N30
\u_Enable~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_Enable~4_combout\ = ( \u_Enable~1_combout\ & ( (!\Equal5~0_combout\ & (\u_Enable~0_combout\ & \u_Enable~2_combout\)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000011000000000000001100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_Equal5~0_combout\,
	datac => \ALT_INV_u_Enable~0_combout\,
	datad => \ALT_INV_u_Enable~2_combout\,
	dataf => \ALT_INV_u_Enable~1_combout\,
	combout => \u_Enable~4_combout\);

-- Location: LABCELL_X40_Y3_N0
\Second1|counter[2]~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \Second1|counter[2]~3_combout\ = ( \u_Enable~4_combout\ & ( \Second1|counter\(2) ) ) # ( !\u_Enable~4_combout\ & ( !\Second1|counter\(2) $ (((!\Second1|counter\(1)) # ((!\Second1|counter\(0)) # (!\Running~q\)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100011110000011110001111000001111000011110000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Second1|ALT_INV_counter\(1),
	datab => \Second1|ALT_INV_counter\(0),
	datac => \Second1|ALT_INV_counter\(2),
	datad => \ALT_INV_Running~q\,
	dataf => \ALT_INV_u_Enable~4_combout\,
	combout => \Second1|counter[2]~3_combout\);

-- Location: FF_X40_Y3_N41
\Second1|counter[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \conv_time|out_clk~q\,
	asdata => \Second1|counter[2]~3_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Second1|counter\(2));

-- Location: LABCELL_X40_Y3_N33
\sec1_segment|Equal0~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \sec1_segment|Equal0~0_combout\ = ( \Second1|counter\(3) & ( (!\Second1|counter\(2) & (\Second1|counter\(0) & !\Second1|counter\(1))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000001010000000000000101000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Second1|ALT_INV_counter\(2),
	datac => \Second1|ALT_INV_counter\(0),
	datad => \Second1|ALT_INV_counter\(1),
	dataf => \Second1|ALT_INV_counter\(3),
	combout => \sec1_segment|Equal0~0_combout\);

-- Location: LABCELL_X40_Y3_N51
\Second2|counter~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \Second2|counter~1_combout\ = ( \Second2|counter\(3) & ( \Running~DUPLICATE_q\ & ( !\Second2|counter\(2) $ (((!\Second2|counter\(0)) # (!\Second2|counter\(1)))) ) ) ) # ( !\Second2|counter\(3) & ( \Running~DUPLICATE_q\ & ( (!\Second2|counter\(0) & 
-- (((\Second2|counter\(2))))) # (\Second2|counter\(0) & ((!\Second2|counter\(2) & ((\Second2|counter\(1)))) # (\Second2|counter\(2) & (!\sec1_segment|Equal0~0_combout\ & !\Second2|counter\(1))))) ) ) ) # ( \Second2|counter\(3) & ( !\Running~DUPLICATE_q\ & ( 
-- !\Second2|counter\(2) $ (((!\Second2|counter\(0)) # (!\Second2|counter\(1)))) ) ) ) # ( !\Second2|counter\(3) & ( !\Running~DUPLICATE_q\ & ( !\Second2|counter\(2) $ (((!\Second2|counter\(0)) # (!\Second2|counter\(1)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100111100000011110011110000001110001111000000111100111100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \sec1_segment|ALT_INV_Equal0~0_combout\,
	datab => \Second2|ALT_INV_counter\(0),
	datac => \Second2|ALT_INV_counter\(2),
	datad => \Second2|ALT_INV_counter\(1),
	datae => \Second2|ALT_INV_counter\(3),
	dataf => \ALT_INV_Running~DUPLICATE_q\,
	combout => \Second2|counter~1_combout\);

-- Location: FF_X40_Y3_N8
\Second2|counter[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \conv_time|out_clk~q\,
	asdata => \Second2|counter~1_combout\,
	sload => VCC,
	ena => \enable2~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Second2|counter\(2));

-- Location: LABCELL_X40_Y3_N36
\u_Enable~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_Enable~2_combout\ = ( \Data_In[7]~input_o\ & ( \Second2|counter\(2) & ( (\Second2|counter\(3) & (\Data_In[6]~input_o\ & (!\Second2|counter\(1) $ (\Data_In[5]~input_o\)))) ) ) ) # ( !\Data_In[7]~input_o\ & ( \Second2|counter\(2) & ( 
-- (!\Second2|counter\(3) & (\Data_In[6]~input_o\ & (!\Second2|counter\(1) $ (\Data_In[5]~input_o\)))) ) ) ) # ( \Data_In[7]~input_o\ & ( !\Second2|counter\(2) & ( (\Second2|counter\(3) & (!\Data_In[6]~input_o\ & (!\Second2|counter\(1) $ 
-- (\Data_In[5]~input_o\)))) ) ) ) # ( !\Data_In[7]~input_o\ & ( !\Second2|counter\(2) & ( (!\Second2|counter\(3) & (!\Data_In[6]~input_o\ & (!\Second2|counter\(1) $ (\Data_In[5]~input_o\)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1000000000001000010000000000010000100000000000100001000000000001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Second2|ALT_INV_counter\(3),
	datab => \ALT_INV_Data_In[6]~input_o\,
	datac => \Second2|ALT_INV_counter\(1),
	datad => \ALT_INV_Data_In[5]~input_o\,
	datae => \ALT_INV_Data_In[7]~input_o\,
	dataf => \Second2|ALT_INV_counter\(2),
	combout => \u_Enable~2_combout\);

-- Location: LABCELL_X40_Y3_N9
\Second1|counter[0]~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \Second1|counter[0]~1_combout\ = ( \u_Enable~0_combout\ & ( \Equal5~0_combout\ & ( !\Second1|counter\(0) $ (!\Running~DUPLICATE_q\) ) ) ) # ( !\u_Enable~0_combout\ & ( \Equal5~0_combout\ & ( !\Second1|counter\(0) $ (!\Running~DUPLICATE_q\) ) ) ) # ( 
-- \u_Enable~0_combout\ & ( !\Equal5~0_combout\ & ( !\Second1|counter\(0) $ (((!\Running~DUPLICATE_q\) # ((\u_Enable~2_combout\ & \u_Enable~1_combout\)))) ) ) ) # ( !\u_Enable~0_combout\ & ( !\Equal5~0_combout\ & ( !\Second1|counter\(0) $ 
-- (!\Running~DUPLICATE_q\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011110000111100001111000011100100111100001111000011110000111100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_u_Enable~2_combout\,
	datab => \Second1|ALT_INV_counter\(0),
	datac => \ALT_INV_Running~DUPLICATE_q\,
	datad => \ALT_INV_u_Enable~1_combout\,
	datae => \ALT_INV_u_Enable~0_combout\,
	dataf => \ALT_INV_Equal5~0_combout\,
	combout => \Second1|counter[0]~1_combout\);

-- Location: FF_X40_Y3_N44
\Second1|counter[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \conv_time|out_clk~q\,
	asdata => \Second1|counter[0]~1_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Second1|counter\(0));

-- Location: LABCELL_X40_Y3_N3
\Second1|counter[1]~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \Second1|counter[1]~2_combout\ = ( \u_Enable~4_combout\ & ( \Second1|counter\(1) ) ) # ( !\u_Enable~4_combout\ & ( (!\Running~DUPLICATE_q\ & (\Second1|counter\(1))) # (\Running~DUPLICATE_q\ & (!\sec1_segment|Equal0~0_combout\ & (!\Second1|counter\(1) $ 
-- (!\Second1|counter\(0))))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101011001010000010101100101000001010101010101010101010101010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Second1|ALT_INV_counter\(1),
	datab => \Second1|ALT_INV_counter\(0),
	datac => \ALT_INV_Running~DUPLICATE_q\,
	datad => \sec1_segment|ALT_INV_Equal0~0_combout\,
	dataf => \ALT_INV_u_Enable~4_combout\,
	combout => \Second1|counter[1]~2_combout\);

-- Location: FF_X40_Y3_N26
\Second1|counter[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \conv_time|out_clk~q\,
	asdata => \Second1|counter[1]~2_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Second1|counter\(1));

-- Location: LABCELL_X40_Y3_N12
\enable2~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \enable2~0_combout\ = ( \Running~DUPLICATE_q\ & ( (!\Second1|counter\(1) & (!\Second1|counter\(2) & (\Second1|counter\(3) & \Second1|counter\(0)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000010000000000000001000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Second1|ALT_INV_counter\(1),
	datab => \Second1|ALT_INV_counter\(2),
	datac => \Second1|ALT_INV_counter\(3),
	datad => \Second1|ALT_INV_counter\(0),
	dataf => \ALT_INV_Running~DUPLICATE_q\,
	combout => \enable2~0_combout\);

-- Location: FF_X40_Y3_N59
\Second2|counter[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \conv_time|out_clk~q\,
	asdata => \Second2|counter[0]~3_combout\,
	sload => VCC,
	ena => \enable2~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Second2|counter\(0));

-- Location: LABCELL_X41_Y3_N36
\Second2|counter~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \Second2|counter~2_combout\ = (!\Second2|counter\(3) & (\Second2|counter\(0) & (\Second2|counter\(2) & \Second2|counter\(1)))) # (\Second2|counter\(3) & ((!\Second2|counter\(0)) # (!\Second2|counter\(2) $ (!\Second2|counter\(1)))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0100010101010110010001010101011001000101010101100100010101010110",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Second2|ALT_INV_counter\(3),
	datab => \Second2|ALT_INV_counter\(0),
	datac => \Second2|ALT_INV_counter\(2),
	datad => \Second2|ALT_INV_counter\(1),
	combout => \Second2|counter~2_combout\);

-- Location: FF_X40_Y3_N53
\Second2|counter[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \conv_time|out_clk~q\,
	asdata => \Second2|counter~2_combout\,
	sload => VCC,
	ena => \enable2~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Second2|counter\(3));

-- Location: LABCELL_X40_Y3_N45
\Second2|counter~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Second2|counter~0_combout\ = ( \sec1_segment|Equal0~0_combout\ & ( \Second2|counter\(2) & ( (!\Second2|counter\(0) & (((\Second2|counter\(1))))) # (\Second2|counter\(0) & (!\Second2|counter\(1) & ((!\Running~DUPLICATE_q\) # (\Second2|counter\(3))))) ) ) 
-- ) # ( !\sec1_segment|Equal0~0_combout\ & ( \Second2|counter\(2) & ( !\Second2|counter\(0) $ (!\Second2|counter\(1)) ) ) ) # ( \sec1_segment|Equal0~0_combout\ & ( !\Second2|counter\(2) & ( (!\Second2|counter\(0) & ((\Second2|counter\(1)))) # 
-- (\Second2|counter\(0) & (!\Second2|counter\(3) & !\Second2|counter\(1))) ) ) ) # ( !\sec1_segment|Equal0~0_combout\ & ( !\Second2|counter\(2) & ( (!\Second2|counter\(0) & ((\Second2|counter\(1)))) # (\Second2|counter\(0) & (!\Second2|counter\(3) & 
-- !\Second2|counter\(1))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0010001011001100001000101100110000110011110011000011000111001100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Second2|ALT_INV_counter\(3),
	datab => \Second2|ALT_INV_counter\(0),
	datac => \ALT_INV_Running~DUPLICATE_q\,
	datad => \Second2|ALT_INV_counter\(1),
	datae => \sec1_segment|ALT_INV_Equal0~0_combout\,
	dataf => \Second2|ALT_INV_counter\(2),
	combout => \Second2|counter~0_combout\);

-- Location: FF_X40_Y3_N50
\Second2|counter[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \conv_time|out_clk~q\,
	asdata => \Second2|counter~0_combout\,
	sload => VCC,
	ena => \enable2~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Second2|counter\(1));

-- Location: LABCELL_X40_Y3_N27
\sec2_segment|Equal0~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \sec2_segment|Equal0~0_combout\ = ( \Second2|counter\(2) & ( (!\Second2|counter\(1) & (!\Second2|counter\(3) & \Second2|counter\(0))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000101000000000000010100000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Second2|ALT_INV_counter\(1),
	datac => \Second2|ALT_INV_counter\(3),
	datad => \Second2|ALT_INV_counter\(0),
	dataf => \Second2|ALT_INV_counter\(2),
	combout => \sec2_segment|Equal0~0_combout\);

-- Location: LABCELL_X41_Y3_N24
enable2 : cyclonev_lcell_comb
-- Equation(s):
-- \enable2~combout\ = ( \Running~q\ & ( (\sec2_segment|Equal0~0_combout\ & \sec1_segment|Equal0~0_combout\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000011110000000000001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \sec2_segment|ALT_INV_Equal0~0_combout\,
	datad => \sec1_segment|ALT_INV_Equal0~0_combout\,
	dataf => \ALT_INV_Running~q\,
	combout => \enable2~combout\);

-- Location: FF_X41_Y3_N56
\Minute1|counter[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \conv_time|out_clk~q\,
	asdata => \Minute1|counter[0]~3_combout\,
	sload => VCC,
	ena => \enable2~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Minute1|counter\(0));

-- Location: LABCELL_X41_Y3_N42
\Minute1|counter~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Minute1|counter~0_combout\ = ( \Minute1|counter\(2) & ( !\Minute1|counter\(3) $ (((!\Minute1|counter\(0)) # (!\Minute1|counter\(1)))) ) ) # ( !\Minute1|counter\(2) & ( (\Minute1|counter\(3) & ((!\Minute1|counter\(0)) # (\Minute1|counter\(1)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101000001010101010100000101010101010101010110100101010101011010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Minute1|ALT_INV_counter\(3),
	datac => \Minute1|ALT_INV_counter\(0),
	datad => \Minute1|ALT_INV_counter\(1),
	dataf => \Minute1|ALT_INV_counter\(2),
	combout => \Minute1|counter~0_combout\);

-- Location: FF_X41_Y3_N26
\Minute1|counter[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \conv_time|out_clk~q\,
	asdata => \Minute1|counter~0_combout\,
	sload => VCC,
	ena => \enable2~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Minute1|counter\(3));

-- Location: LABCELL_X41_Y3_N57
\min_segment|SevenSeg_out[0]~6\ : cyclonev_lcell_comb
-- Equation(s):
-- \min_segment|SevenSeg_out[0]~6_combout\ = (!\Minute1|counter\(1) & (!\Minute1|counter\(2) $ (((!\Minute1|counter\(0)) # (\Minute1|counter\(3)))))) # (\Minute1|counter\(1) & (\Minute1|counter\(3)))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001110110010101000111011001010100011101100101010001110110010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Minute1|ALT_INV_counter\(3),
	datab => \Minute1|ALT_INV_counter\(1),
	datac => \Minute1|ALT_INV_counter\(2),
	datad => \Minute1|ALT_INV_counter\(0),
	combout => \min_segment|SevenSeg_out[0]~6_combout\);

-- Location: LABCELL_X41_Y3_N48
\min_segment|SevenSeg_out[1]~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \min_segment|SevenSeg_out[1]~5_combout\ = ( \Minute1|counter\(1) & ( (!\Minute1|counter\(3) & ((!\Minute1|counter\(2)) # (\Minute1|counter\(0)))) ) ) # ( !\Minute1|counter\(1) & ( (!\Minute1|counter\(2)) # ((!\Minute1|counter\(3) & !\Minute1|counter\(0))) 
-- ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111110011001100111111001100110011000000111100001100000011110000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \Minute1|ALT_INV_counter\(2),
	datac => \Minute1|ALT_INV_counter\(3),
	datad => \Minute1|ALT_INV_counter\(0),
	dataf => \Minute1|ALT_INV_counter\(1),
	combout => \min_segment|SevenSeg_out[1]~5_combout\);

-- Location: LABCELL_X41_Y3_N15
\min_segment|SevenSeg_out[2]~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \min_segment|SevenSeg_out[2]~4_combout\ = ( \Minute1|counter\(1) & ( ((!\Minute1|counter\(2) & !\Minute1|counter\(0))) # (\Minute1|counter\(3)) ) ) # ( !\Minute1|counter\(1) & ( (\Minute1|counter\(2) & \Minute1|counter\(3)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000001100000011000000110000001111001111000011111100111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \Minute1|ALT_INV_counter\(2),
	datac => \Minute1|ALT_INV_counter\(3),
	datad => \Minute1|ALT_INV_counter\(0),
	dataf => \Minute1|ALT_INV_counter\(1),
	combout => \min_segment|SevenSeg_out[2]~4_combout\);

-- Location: LABCELL_X41_Y3_N12
\min_segment|SevenSeg_out[3]~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \min_segment|SevenSeg_out[3]~3_combout\ = ( \Minute1|counter\(2) & ( (!\Minute1|counter\(1) $ (\Minute1|counter\(0))) # (\Minute1|counter\(3)) ) ) # ( !\Minute1|counter\(2) & ( (!\Minute1|counter\(3) & (!\Minute1|counter\(1) & \Minute1|counter\(0))) # 
-- (\Minute1|counter\(3) & (\Minute1|counter\(1))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000010110100101000001011010010111110101010111111111010101011111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Minute1|ALT_INV_counter\(3),
	datac => \Minute1|ALT_INV_counter\(1),
	datad => \Minute1|ALT_INV_counter\(0),
	dataf => \Minute1|ALT_INV_counter\(2),
	combout => \min_segment|SevenSeg_out[3]~3_combout\);

-- Location: LABCELL_X41_Y3_N27
\min_segment|SevenSeg_out[4]~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \min_segment|SevenSeg_out[4]~0_combout\ = ((!\Minute1|counter\(1) & ((\Minute1|counter\(2)))) # (\Minute1|counter\(1) & (\Minute1|counter\(3)))) # (\Minute1|counter\(0))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001101111111111000110111111111100011011111111110001101111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Minute1|ALT_INV_counter\(1),
	datab => \Minute1|ALT_INV_counter\(3),
	datac => \Minute1|ALT_INV_counter\(2),
	datad => \Minute1|ALT_INV_counter\(0),
	combout => \min_segment|SevenSeg_out[4]~0_combout\);

-- Location: LABCELL_X41_Y3_N45
\min_segment|SevenSeg_out[5]~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \min_segment|SevenSeg_out[5]~2_combout\ = ( \Minute1|counter\(1) & ( ((!\Minute1|counter\(2)) # (\Minute1|counter\(0))) # (\Minute1|counter\(3)) ) ) # ( !\Minute1|counter\(1) & ( (!\Minute1|counter\(3) & (!\Minute1|counter\(2) & \Minute1|counter\(0))) # 
-- (\Minute1|counter\(3) & (\Minute1|counter\(2))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001000110011001000100011001100111011101111111111101110111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Minute1|ALT_INV_counter\(3),
	datab => \Minute1|ALT_INV_counter\(2),
	datad => \Minute1|ALT_INV_counter\(0),
	dataf => \Minute1|ALT_INV_counter\(1),
	combout => \min_segment|SevenSeg_out[5]~2_combout\);

-- Location: LABCELL_X41_Y3_N51
\min_segment|SevenSeg_out~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \min_segment|SevenSeg_out~1_combout\ = ( \Minute1|counter\(3) & ( (!\Minute1|counter\(1) & !\Minute1|counter\(2)) ) ) # ( !\Minute1|counter\(3) & ( (!\Minute1|counter\(1) & (\Minute1|counter\(2))) # (\Minute1|counter\(1) & ((!\Minute1|counter\(2)) # 
-- (!\Minute1|counter\(0)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0111011101100110011101110110011010001000100010001000100010001000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Minute1|ALT_INV_counter\(1),
	datab => \Minute1|ALT_INV_counter\(2),
	datad => \Minute1|ALT_INV_counter\(0),
	dataf => \Minute1|ALT_INV_counter\(3),
	combout => \min_segment|SevenSeg_out~1_combout\);

-- Location: LABCELL_X41_Y3_N9
\u_Enable~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \u_Enable~3_combout\ = ( \Running~q\ & ( (!\u_Enable~0_combout\) # ((!\u_Enable~1_combout\) # ((!\u_Enable~2_combout\) # (\Equal5~0_combout\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111011111111111111101111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_u_Enable~0_combout\,
	datab => \ALT_INV_u_Enable~1_combout\,
	datac => \ALT_INV_Equal5~0_combout\,
	datad => \ALT_INV_u_Enable~2_combout\,
	dataf => \ALT_INV_Running~q\,
	combout => \u_Enable~3_combout\);

-- Location: MLABCELL_X42_Y3_N48
\sec1_segment|SevenSeg_out[0]~6\ : cyclonev_lcell_comb
-- Equation(s):
-- \sec1_segment|SevenSeg_out[0]~6_combout\ = ( \Second1|counter\(1) & ( \Second1|counter\(3) ) ) # ( !\Second1|counter\(1) & ( !\Second1|counter\(2) $ (((!\Second1|counter\(0)) # (\Second1|counter\(3)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011110000001111001111000000111100000000111111110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \Second1|ALT_INV_counter\(0),
	datac => \Second1|ALT_INV_counter\(2),
	datad => \Second1|ALT_INV_counter\(3),
	dataf => \Second1|ALT_INV_counter\(1),
	combout => \sec1_segment|SevenSeg_out[0]~6_combout\);

-- Location: MLABCELL_X42_Y3_N57
\sec1_segment|SevenSeg_out[1]~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \sec1_segment|SevenSeg_out[1]~5_combout\ = ( \Second1|counter\(1) & ( (!\Second1|counter\(3) & ((!\Second1|counter\(2)) # (\Second1|counter\(0)))) ) ) # ( !\Second1|counter\(1) & ( (!\Second1|counter\(2)) # ((!\Second1|counter\(0) & 
-- !\Second1|counter\(3))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111101010101010111110101010101010101111000000001010111100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Second1|ALT_INV_counter\(2),
	datac => \Second1|ALT_INV_counter\(0),
	datad => \Second1|ALT_INV_counter\(3),
	dataf => \Second1|ALT_INV_counter\(1),
	combout => \sec1_segment|SevenSeg_out[1]~5_combout\);

-- Location: MLABCELL_X42_Y3_N54
\sec1_segment|SevenSeg_out[2]~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \sec1_segment|SevenSeg_out[2]~4_combout\ = ( \Second1|counter\(1) & ( ((!\Second1|counter\(2) & !\Second1|counter\(0))) # (\Second1|counter\(3)) ) ) # ( !\Second1|counter\(1) & ( (\Second1|counter\(2) & \Second1|counter\(3)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000010100000101000001010000010110001111100011111000111110001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Second1|ALT_INV_counter\(2),
	datab => \Second1|ALT_INV_counter\(0),
	datac => \Second1|ALT_INV_counter\(3),
	dataf => \Second1|ALT_INV_counter\(1),
	combout => \sec1_segment|SevenSeg_out[2]~4_combout\);

-- Location: MLABCELL_X42_Y3_N39
\sec1_segment|SevenSeg_out[3]~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \sec1_segment|SevenSeg_out[3]~3_combout\ = ( \Second1|counter\(3) & ( \Second1|counter\(2) ) ) # ( !\Second1|counter\(3) & ( \Second1|counter\(2) & ( !\Second1|counter\(1) $ (\Second1|counter\(0)) ) ) ) # ( \Second1|counter\(3) & ( !\Second1|counter\(2) & 
-- ( \Second1|counter\(1) ) ) ) # ( !\Second1|counter\(3) & ( !\Second1|counter\(2) & ( (!\Second1|counter\(1) & \Second1|counter\(0)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000101000001010010101010101010110100101101001011111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Second1|ALT_INV_counter\(1),
	datac => \Second1|ALT_INV_counter\(0),
	datae => \Second1|ALT_INV_counter\(3),
	dataf => \Second1|ALT_INV_counter\(2),
	combout => \sec1_segment|SevenSeg_out[3]~3_combout\);

-- Location: MLABCELL_X42_Y3_N24
\sec1_segment|SevenSeg_out[4]~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \sec1_segment|SevenSeg_out[4]~0_combout\ = ( \Second1|counter\(3) & ( \Second1|counter\(2) ) ) # ( !\Second1|counter\(3) & ( \Second1|counter\(2) & ( (!\Second1|counter\(1)) # (\Second1|counter\(0)) ) ) ) # ( \Second1|counter\(3) & ( !\Second1|counter\(2) 
-- & ( (\Second1|counter\(1)) # (\Second1|counter\(0)) ) ) ) # ( !\Second1|counter\(3) & ( !\Second1|counter\(2) & ( \Second1|counter\(0) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001100110011001111110011111111110011111100111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \Second1|ALT_INV_counter\(0),
	datac => \Second1|ALT_INV_counter\(1),
	datae => \Second1|ALT_INV_counter\(3),
	dataf => \Second1|ALT_INV_counter\(2),
	combout => \sec1_segment|SevenSeg_out[4]~0_combout\);

-- Location: MLABCELL_X42_Y3_N18
\sec1_segment|SevenSeg_out[5]~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \sec1_segment|SevenSeg_out[5]~2_combout\ = ( \Second1|counter\(3) & ( \Second1|counter\(2) ) ) # ( !\Second1|counter\(3) & ( \Second1|counter\(2) & ( (\Second1|counter\(0) & \Second1|counter\(1)) ) ) ) # ( \Second1|counter\(3) & ( !\Second1|counter\(2) & 
-- ( \Second1|counter\(1) ) ) ) # ( !\Second1|counter\(3) & ( !\Second1|counter\(2) & ( (\Second1|counter\(1)) # (\Second1|counter\(0)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011111100111111000011110000111100000011000000111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \Second1|ALT_INV_counter\(0),
	datac => \Second1|ALT_INV_counter\(1),
	datae => \Second1|ALT_INV_counter\(3),
	dataf => \Second1|ALT_INV_counter\(2),
	combout => \sec1_segment|SevenSeg_out[5]~2_combout\);

-- Location: MLABCELL_X42_Y3_N33
\sec1_segment|SevenSeg_out~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \sec1_segment|SevenSeg_out~1_combout\ = ( !\Second1|counter\(3) & ( \Second1|counter\(2) & ( (!\Second1|counter\(1)) # (!\Second1|counter\(0)) ) ) ) # ( \Second1|counter\(3) & ( !\Second1|counter\(2) & ( !\Second1|counter\(1) ) ) ) # ( 
-- !\Second1|counter\(3) & ( !\Second1|counter\(2) & ( \Second1|counter\(1) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101101010101010101011111010111110100000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Second1|ALT_INV_counter\(1),
	datac => \Second1|ALT_INV_counter\(0),
	datae => \Second1|ALT_INV_counter\(3),
	dataf => \Second1|ALT_INV_counter\(2),
	combout => \sec1_segment|SevenSeg_out~1_combout\);

-- Location: MLABCELL_X42_Y3_N3
\sec2_segment|SevenSeg_out[0]~6\ : cyclonev_lcell_comb
-- Equation(s):
-- \sec2_segment|SevenSeg_out[0]~6_combout\ = ( \Second2|counter\(1) & ( \Second2|counter\(3) ) ) # ( !\Second2|counter\(1) & ( \Second2|counter\(3) & ( \Second2|counter\(2) ) ) ) # ( !\Second2|counter\(1) & ( !\Second2|counter\(3) & ( !\Second2|counter\(0) 
-- $ (!\Second2|counter\(2)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010110101010000000000000000000000000111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Second2|ALT_INV_counter\(0),
	datad => \Second2|ALT_INV_counter\(2),
	datae => \Second2|ALT_INV_counter\(1),
	dataf => \Second2|ALT_INV_counter\(3),
	combout => \sec2_segment|SevenSeg_out[0]~6_combout\);

-- Location: LABCELL_X41_Y3_N39
\sec2_segment|SevenSeg_out[1]~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \sec2_segment|SevenSeg_out[1]~5_combout\ = (!\Second2|counter\(3) & ((!\Second2|counter\(2)) # (!\Second2|counter\(0) $ (\Second2|counter\(1))))) # (\Second2|counter\(3) & (((!\Second2|counter\(1) & !\Second2|counter\(2)))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111101010000010111110101000001011111010100000101111101010000010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Second2|ALT_INV_counter\(3),
	datab => \Second2|ALT_INV_counter\(0),
	datac => \Second2|ALT_INV_counter\(1),
	datad => \Second2|ALT_INV_counter\(2),
	combout => \sec2_segment|SevenSeg_out[1]~5_combout\);

-- Location: MLABCELL_X42_Y3_N45
\sec2_segment|SevenSeg_out[2]~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \sec2_segment|SevenSeg_out[2]~4_combout\ = ( \Second2|counter\(1) & ( \Second2|counter\(3) ) ) # ( !\Second2|counter\(1) & ( \Second2|counter\(3) & ( \Second2|counter\(2) ) ) ) # ( \Second2|counter\(1) & ( !\Second2|counter\(3) & ( (!\Second2|counter\(0) 
-- & !\Second2|counter\(2)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000101010100000000000000000111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Second2|ALT_INV_counter\(0),
	datad => \Second2|ALT_INV_counter\(2),
	datae => \Second2|ALT_INV_counter\(1),
	dataf => \Second2|ALT_INV_counter\(3),
	combout => \sec2_segment|SevenSeg_out[2]~4_combout\);

-- Location: MLABCELL_X42_Y3_N51
\sec2_segment|SevenSeg_out[3]~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \sec2_segment|SevenSeg_out[3]~3_combout\ = ( \Second2|counter\(2) & ( (!\Second2|counter\(0) $ (\Second2|counter\(1))) # (\Second2|counter\(3)) ) ) # ( !\Second2|counter\(2) & ( (!\Second2|counter\(3) & (\Second2|counter\(0) & !\Second2|counter\(1))) # 
-- (\Second2|counter\(3) & ((\Second2|counter\(1)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101000000001111010100000000111110101111010111111010111101011111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Second2|ALT_INV_counter\(0),
	datac => \Second2|ALT_INV_counter\(3),
	datad => \Second2|ALT_INV_counter\(1),
	dataf => \Second2|ALT_INV_counter\(2),
	combout => \sec2_segment|SevenSeg_out[3]~3_combout\);

-- Location: LABCELL_X41_Y3_N0
\sec2_segment|SevenSeg_out[4]~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \sec2_segment|SevenSeg_out[4]~0_combout\ = ( \Second2|counter\(1) & ( (\Second2|counter\(3)) # (\Second2|counter\(0)) ) ) # ( !\Second2|counter\(1) & ( (\Second2|counter\(2)) # (\Second2|counter\(0)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001111111111001100111111111100111111001111110011111100111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \Second2|ALT_INV_counter\(0),
	datac => \Second2|ALT_INV_counter\(3),
	datad => \Second2|ALT_INV_counter\(2),
	dataf => \Second2|ALT_INV_counter\(1),
	combout => \sec2_segment|SevenSeg_out[4]~0_combout\);

-- Location: MLABCELL_X42_Y3_N6
\sec2_segment|SevenSeg_out[5]~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \sec2_segment|SevenSeg_out[5]~2_combout\ = ( \Second2|counter\(1) & ( \Second2|counter\(2) & ( (\Second2|counter\(0)) # (\Second2|counter\(3)) ) ) ) # ( !\Second2|counter\(1) & ( \Second2|counter\(2) & ( \Second2|counter\(3) ) ) ) # ( \Second2|counter\(1) 
-- & ( !\Second2|counter\(2) ) ) # ( !\Second2|counter\(1) & ( !\Second2|counter\(2) & ( (!\Second2|counter\(3) & \Second2|counter\(0)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000110000001100111111111111111100110011001100110011111100111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \Second2|ALT_INV_counter\(3),
	datac => \Second2|ALT_INV_counter\(0),
	datae => \Second2|ALT_INV_counter\(1),
	dataf => \Second2|ALT_INV_counter\(2),
	combout => \sec2_segment|SevenSeg_out[5]~2_combout\);

-- Location: MLABCELL_X42_Y3_N12
\sec2_segment|SevenSeg_out~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \sec2_segment|SevenSeg_out~1_combout\ = ( !\Second2|counter\(1) & ( \Second2|counter\(3) & ( !\Second2|counter\(2) ) ) ) # ( \Second2|counter\(1) & ( !\Second2|counter\(3) & ( (!\Second2|counter\(2)) # (!\Second2|counter\(0)) ) ) ) # ( 
-- !\Second2|counter\(1) & ( !\Second2|counter\(3) & ( \Second2|counter\(2) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101111110101111101010101010101010100000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Second2|ALT_INV_counter\(2),
	datac => \Second2|ALT_INV_counter\(0),
	datae => \Second2|ALT_INV_counter\(1),
	dataf => \Second2|ALT_INV_counter\(3),
	combout => \sec2_segment|SevenSeg_out~1_combout\);

-- Location: LABCELL_X52_Y43_N3
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



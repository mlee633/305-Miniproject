LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.all;
USE  IEEE.STD_LOGIC_ARITH.all;
USE  IEEE.STD_LOGIC_SIGNED.all;
entity pipe is
    port (
        clk,vert_sync, pb1,pb2   : in std_logic;
        pixel_row,pixel_column : in std_logic_vector(9 DOWNTO 0);
        red,green,blue : out std_logic
    );
end entity;

architecture behaviour of pipe is
    signal pipe1_on : std_logic;
    signal size,pipe_y_pos, pipeSize1, gapSize, pipeWidth : std_logic_vector(9 DOWNTO 0);
	 signal gap_x_pos : std_logic_vector(9 downto 0) := CONV_STD_LOGIC_VECTOR(639,10);
	 Signal gap_y_pos : std_logic_vector(9 downto 0) := CONV_STD_LOGIC_VECTOR(239,10);
    --signal pipe_x_pos : std_logic_vector(10 DOWNTO 0);
begin
    --pipeSize2 <= CONV_STD_LOGIC_VECTOR(140, 10);
    pipeWidth <= CONV_STD_LOGIC_VECTOR(24, 10);

    gapSize <= CONV_STD_LOGIC_VECTOR(120,10);
    --gap_y_pos <= CONV_STD_LOGIC_VECTOR(239,10);
	 --gap_x_pos <= CONV_STD_LOGIC_VECTOR(250,10);
    --pipe2_y_pos <= CONV_STD_LOGIC_VECTOR(300,10);
    pipe1_on <= '1' when ((gap_x_pos - pipeWidth <= pixel_column) and (pixel_column <= gap_x_pos + pipeWidth) and ((gap_y_pos + gapSize <= pixel_row) or (pixel_row<= gap_y_pos-gapSize))) else '0';
	 red <= '0';
    green <= pipe1_on;
    blue <= (not pipe1_on);
	 
MOVE_PIPE: process (vert_sync)
	variable pipe_x_motion: std_logic_vector(9 downto 0);
begin
	
    if (rising_edge(vert_sync)) then
        if (('0' & gap_x_pos > CONV_STD_LOGIC_VECTOR(1,10))) then
            pipe_x_motion := -CONV_STD_LOGIC_VECTOR(2,10);
			elsif (gap_x_pos = CONV_STD_LOGIC_VECTOR(0,10)) then
				pipe_x_motion := CONV_STD_LOGIC_VECTOR(639,10);
        end if;
        gap_x_pos <= gap_x_pos + pipe_x_motion;
    end if;
end process;
end architecture behaviour;
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.all;
--use IEEE.std_logic_arith.all;
USE  IEEE.STD_LOGIC_UNSIGNED.all;
--use ieee.std_logic_signed.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

entity pipe is
    port (
        clk,vert_sync,enable : in std_logic;
        pixel_row,pixel_column : in std_logic_vector(9 DOWNTO 0);
        pipeWidth_out,gapSize_out, gap_x_pos_out ,gap_y_pos_out: out std_logic_vector(9 downto 0);
        red,green,blue, pipe_test : out std_logic
    );
end entity;

architecture behaviour of pipe is
component LFSR is
        port (
            clk ,reset  : in std_logic;

            outLFSR: out integer
            
        );
    end component;
    signal pipe1_on : std_logic;
    signal size,pipe_y_pos, pipeSize1, gapSize : std_logic_vector(9 DOWNTO 0);
	signal gap_x_pos : std_logic_vector(9 downto 0) ;--:= std_logic_vector(to_unsigned(639,10));
	Signal gap_y_pos : std_logic_vector(9 downto 0) ;--:= std_logic_vector(to_unsigned(239,10));
	signal pipeWidth: std_logic_vector(9 downto 0) :=  std_logic_vector(to_unsigned(48, 10));
    signal tempHeight: integer;
    signal reset: std_logic;
    
    --signal pipe_x_pos : std_logic_vector(10 DOWNTO 0);
begin
    --pipeSize2 <= to_unsigned(140, 10);
    randomHeight: LFSR port map (Clk   => clk, Reset => reset, outLFSR => tempHeight);
    gapSize <= std_logic_vector(to_unsigned(55,10));
    --gap_y_pos <= to_unsigned(239,10);
	 --gap_x_pos <= to_unsigned(250,10);
    --pipe2_y_pos <= to_unsigned(300,10);
    pipe1_on <= '1' when ((pixel_column > gap_x_pos - pipeWidth) and 
								  (pixel_column < gap_x_pos) and 
								 ((gap_y_pos + gapSize <= pixel_row) or (pixel_row<= gap_y_pos-gapSize)))
						  else '0';
	 pipe_test <= pipe1_on;
	 red <= '0';
    blue <= (not pipe1_on);
	 green <= pipe1_on;
	 
MOVE_PIPE: process (vert_sync)
variable v_height : integer;
begin

    if (rising_edge(vert_sync)) then
		 if enable = '1' then
        if (gap_x_pos < std_logic_vector(to_unsigned(1,10))) then
            gap_x_pos <= std_logic_vector(to_unsigned(687,10));
			pipeWidth <= std_logic_vector(to_unsigned(48,10));
			
			v_height := (375 * (tempHeight)); --+ 44;
			v_height := (v_height/255) + 50;
            gap_y_pos <= std_logic_vector(to_unsigned(v_height,10));
		  elsif (gap_x_pos - pipeWidth <= std_logic_vector(to_unsigned(1,10))) then
				pipeWidth <= pipeWidth - std_logic_vector(to_unsigned(1,10));
				gap_x_pos <= gap_x_pos - std_logic_vector(to_unsigned(1,10));
        else
            gap_x_pos <= gap_x_pos - std_logic_vector(to_unsigned(1,10));
        end if;
		 else
			gap_x_pos <= std_logic_vector(to_unsigned(0,10));
			gap_y_pos <= std_logic_vector(to_unsigned(0,10));
		 end if;
		  
    end if;
end process;
pipeWidth_out <= pipeWidth;
gap_x_pos_out <= gap_x_pos;
gap_y_pos_out <= gap_y_pos;
gapSize_out <= pipeWidth;
end architecture behaviour;
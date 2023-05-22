LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.all;
USE  IEEE.STD_LOGIC_ARITH.all;
USE  IEEE.STD_LOGIC_SIGNED.all;


ENTITY ball IS
	PORT
		(vert_sync, left_click, enable: IN std_logic;
		  pixel_row, pixel_column	: IN std_logic_vector(9 DOWNTO 0);
		  ball_x_pos, ball_y_pos   : OUT std_logic_vector(9 downto 0);
		  ball_on,red, green, blue 			: OUT std_logic);		
END ball;

architecture behavior of ball is

SIGNAL b_on					: std_logic;
SIGNAL size					: std_logic_vector(9 DOWNTO 0);
signal y_pos : std_logic_vector(9 downto 0):=CONV_STD_LOGIC_VECTOR(350,10);
SIGNAL x_pos	: std_logic_vector(9 DOWNTO 0);
SIGNAL prev_clicked : std_logic;
BEGIN           

size <= CONV_STD_LOGIC_VECTOR(12,10);
-- ball_x_pos and ball_y_pos show the (x,y) for the centre of ball
x_pos <= CONV_STD_LOGIC_VECTOR(590,10);

b_on <= '1' when ((pixel_column - x_pos) * (pixel_column - x_pos) + (pixel_row - y_pos) * (pixel_row - y_pos) <= size * size) else '0';


-- Colours for pixel data on video signal
-- Keeping background white and square in red
Red <=  '1';
-- Turn off Green and Blue when displaying square
Green <= not b_on;
Blue <=  not b_on;
ball_y_pos <= y_pos;
ball_x_pos <= x_pos;

	process(vert_sync)
	variable ball_y_motion : std_logic_vector(9 downto 0);
	begin
	if rising_edge(vert_sync) and enable = '1' then
	
		prev_clicked <= left_click;
		if ((left_click /= '0') and (prev_clicked = '0') ) then
			ball_y_motion := -CONV_STD_LOGIC_VECTOR(10,10);
			if (ball_y_motion <= -CONV_STD_LOGIC_VECTOR(3,10)) then
			
				ball_y_motion := ball_y_motion + CONV_STD_LOGIC_VECTOR(1,10);
			else
				ball_y_motion := ball_y_motion;
			end if;
		else
			if (ball_y_motion <= CONV_STD_LOGIC_VECTOR(10,10)) then
				ball_y_motion :=  ball_y_motion + CONV_STD_LOGIC_VECTOR(1,10);
			else
				ball_y_motion := ball_y_motion; --stay at max speed
			end if;
						
		end if;
		y_pos <= y_pos + ball_y_motion;	
		ball_y_move <= ball_y_motion;
	end if;
	end process;
	
END behavior;


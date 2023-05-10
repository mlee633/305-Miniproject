LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.all;
USE  IEEE.STD_LOGIC_ARITH.all;
USE  IEEE.STD_LOGIC_SIGNED.all;


ENTITY bouncy_ball IS
	PORT
		( pb1, pb2, clk, vert_sync	: IN std_logic;
		leftclick: in std_logic;
          pixel_row, pixel_column	: IN std_logic_vector(9 DOWNTO 0);
		  red, green, blue 			: OUT std_logic);		
END bouncy_ball;

architecture behavior of bouncy_ball is

SIGNAL ball_on, pipe1_on, pipe2_on				: std_logic;
SIGNAL size, pipeSize1,gapSize, pipeSize2,gap_x_pos, gap_y_pos, pipeWidth,pipe_x_pos,pipe1_y_pos,pipe2_y_pos 					: std_logic_vector(9 DOWNTO 0);  
SIGNAL ball_y_pos				: std_logic_vector(9 DOWNTO 0) := CONV_STD_LOGIC_VECTOR(200, 10);
SiGNAL ball_x_pos				: std_logic_vector(9 DOWNTO 0);
SIGNAL prev_clicked        : std_logic := '0';
SIGNAL started					: std_logic := '0';
SIGNAL finished				: std_logic := '1';
BEGIN           
--size = ball size. 
size <= CONV_STD_LOGIC_VECTOR(12,10);
pipeSize1 <= CONV_STD_LOGIC_VECTOR(90, 10);
--pipeSize2 <= CONV_STD_LOGIC_VECTOR(140, 10);
pipeWidth <= CONV_STD_LOGIC_VECTOR(24, 10);

gapSize <= CONV_STD_LOGIC_VECTOR(120,10);
-- ball_x_pos and ball_y_pos show the (x,y) for the centre of ball
ball_x_pos <= CONV_STD_LOGIC_VECTOR(200,10);

gap_y_pos <= CONV_STD_LOGIC_VECTOR(239,10);
gap_x_pos <= CONV_STD_LOGIC_VECTOR(250,10);
pipe1_y_pos <= CONV_STD_LOGIC_VECTOR(90,10);
--pipe2_y_pos <= CONV_STD_LOGIC_VECTOR(300,10);
pipe_x_pos <= CONV_STD_LOGIC_VECTOR(500,10);


-- pipe1_on <= '1' when (('0' & gap_x_pos <= '0' & pixel_column + pipeWidth) and 
-- 							('0' & pixel_column<= '0' & gap_x_pos + pipeWidth) and 
-- 							('0' & gap_y_pos + gapSize <= pixel_row ) and 
-- 							('0' & pixel_row + gapSize <= gap_y_pos )) else '0' ;
pipe1_on <= '1' when ((gap_x_pos - pipeWidth <= pixel_column) and (pixel_column <= gap_x_pos + pipeWidth) and ((gap_y_pos + gapSize <= pixel_row) or (pixel_row<= gap_y_pos-gapSize))) else '0';
--pipe2_on <= '1' when (('0' & pipe_x_pos <= '0' & pixel_column + pipeWidth) and ('0' & pixel_column<= '0' & pipe_x_pos + pipeWidth) and ('0' & pipe2_y_pos <= pixel_row + pipesize2) and ('0' & pixel_row <= pipe2_y_pos + pipesize2)) else '0' ;
-- <=.....this a store or less than equal.  
ball_on <= '1' when ((pixel_column - ball_x_pos) * (pixel_column - ball_x_pos) + (pixel_row - ball_y_pos) * (pixel_row - ball_y_pos) <= size * size) else '0';


-- Colours for pixel data on video signal
-- Changing the background and ball colour by pushbuttons
Red <=  ball_on; --won't work for some reason
--Green <= pipe1_on or pipe2_on;]
Green <= pipe1_on;
Blue <=  (not ball_on) and (not pipe1_on) and (not pipe2_on);

--Aight don't do Key0. Somehow now resets whole board -__-
CLICK: process(pb2)
variable numOfpush : integer := 0;
begin
	if rising_edge(pb2) then
		started <= '1';
		numOfpush := numOfpush + 1;
		if (numOfPush = 2) then
			started <= '0';
			numOfPush := 0;
		end if;
	end if;
end process CLICK;

--leftclick, ball_y_motion,ball_y_pos,
BOUNCE_BALL: process(vert_sync)
	variable ball_y_motion: std_logic_vector(9 downto 0) := CONV_STD_LOGIC_VECTOR(0, 10);
begin
		if (rising_edge(vert_sync)) then
		--When button has been  pressed
			if (started = '1')then
				--start at current value of speed. from beginning should be 0.....hopefully
				ball_y_motion := ball_y_motion;
				--Stuck on the bottom. Change the parameter for conversion to a 10 bit std logic vector to find sweet spot of the bottom of the moving object. 
				if (ball_y_pos >= CONV_STD_LOGIC_VECTOR(450,10) + size) or (ball_y_pos <= CONV_STD_LOGIC_VECTOR(10,10) - size) then
				--stays at current position
					ball_y_motion := CONV_STD_LOGIC_VECTOR(0, 10); --resets to 0 speed
				else
					prev_clicked <= leftclick;
					if ((leftclick /= '0') and (prev_clicked = '0') ) then
						--Set intial up speed to be 10
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
					
					ball_y_pos <= ball_y_pos + ball_y_motion;				
				end if;
			else
				--reset to starting position
				ball_y_pos <= CONV_STD_LOGIC_VECTOR(200,10);
			end if;
		end if;
		
end process BOUNCE_BALL;


END behavior;


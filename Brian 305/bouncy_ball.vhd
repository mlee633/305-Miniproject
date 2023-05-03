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

SIGNAL ball_on					: std_logic;
SIGNAL size 					: std_logic_vector(9 DOWNTO 0);  
SIGNAL ball_y_pos				: std_logic_vector(9 DOWNTO 0) := CONV_STD_LOGIC_VECTOR(200, 10);
SiGNAL ball_x_pos				: std_logic_vector(10 DOWNTO 0);
Signal detect					: std_logic := '0'; --the button to start the game. 

BEGIN           

size <= CONV_STD_LOGIC_VECTOR(12,10);
-- ball_x_pos and ball_y_pos show the (x,y) for the centre of ball
ball_x_pos <= CONV_STD_LOGIC_VECTOR(200,11);

ball_on <= '1' when ((pixel_column - ball_x_pos) * (pixel_column - ball_x_pos) + (pixel_row - ball_y_pos) * (pixel_row - ball_y_pos) <= size * size) else '0';


-- Colours for pixel data on video signal
-- Changing the background and ball colour by pushbuttons
Red <=  pb1;
Green <= (not pb2) and (not ball_on);
Blue <=  not ball_on;

--leftclick, ball_y_motion,ball_y_pos,
BOUNCE_BALL: process (vert_sync)
	
begin

	if (rising_edge(pb1)) then	
		detect <= '1';		
--				if (detect = '0') then
--					ball_y_pos <= ball_y_pos + ball_y_motion;	
--				else 
--					ball_y_pos <= ball_y_pos;
--				end if;
--						
--				if (ball_y_pos >= CONV_STD_LOGIC_VECTOR(439,10) + size) then
--					ball_y_pos <= CONV_STD_LOGIC_VECTOR(200,10);
--					ball_y_motion := CONV_STD_LOGIC_VECTOR(0,10);-- Sets ball to not move if it touches boundary ball_y_motion;
--				else
--					if (leftclick /= '0') then
--						ball_y_motion := - CONV_STD_LOGIC_VECTOR(5,10);
--					elsif (ball_y_motion <= CONV_STD_LOGIC_VECTOR(6,10)) then
--						ball_y_motion :=  CONV_STD_LOGIC_VECTOR(0,10) + CONV_STD_LOGIC_VECTOR(1,10);
--					else
--					ball_y_motion := ball_y_motion;
--					end if;
--					
--					--ball_y_pos <= ball_y_pos + ball_y_motion;				
--				end if;
	end if;
	
end process BOUNCE_BALL;


	
main : process(detect)
variable ball_y_motion: std_logic_vector(9 downto 0) := CONV_STD_LOGIC_VECTOR(0, 10);
begin
	if (ball_y_pos >= CONV_STD_LOGIC_VECTOR(439,10) + size) then
		ball_y_pos <= CONV_STD_LOGIC_VECTOR(200,10);
		ball_y_motion := CONV_STD_LOGIC_VECTOR(0,10);-- Sets ball to not move if it touches boundary ball_y_motion;
	else
		if (leftclick /= '0') then
			ball_y_motion := - CONV_STD_LOGIC_VECTOR(5,10);
		elsif (ball_y_motion <= CONV_STD_LOGIC_VECTOR(6,10)) then
			ball_y_motion :=  CONV_STD_LOGIC_VECTOR(0,10) + CONV_STD_LOGIC_VECTOR(1,10);
		else
			ball_y_motion := ball_y_motion;
		end if;
					
					--ball_y_pos <= ball_y_pos + ball_y_motion;				
	end if;
end process main;

END behavior;


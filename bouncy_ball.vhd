LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.all;
USE  IEEE.STD_LOGIC_ARITH.all;
USE  IEEE.STD_LOGIC_SIGNED.all;


ENTITY bouncy_ball IS
	PORT
		( pb1, pb2, clk, vert_sync	: IN std_logic;
		leftclick: in std_logic;
          pixel_row, pixel_column	: IN std_logic_vector(9 DOWNTO 0);
		  oneSeg_out : out std_logic_vector(6 downto 0);
		  tenSeg_out : out std_logic_vector(6 downto 0);
		  red, green, blue,collide 			: OUT std_logic);		
END bouncy_ball;

architecture behavior of bouncy_ball is

SIGNAL rom_mux_output, ball_on, pipe_on, pipe_red, pipe_blue, pipe_green,green1, t_Clk,reset,enable1,enable2,dead,t_collide		: std_logic;
SIGNAL size, pipeSize1,gapSize, pipeSize2,gap_x_pos, gap_y_pos, pipeWidth,pipe_x_pos 					: std_logic_vector(9 DOWNTO 0);  
SIGNAL ball_y_pos				: std_logic_vector(9 DOWNTO 0) := CONV_STD_LOGIC_VECTOR(200, 10);
SiGNAL ball_x_pos			: std_logic_vector(9 DOWNTO 0);
SIGNAL prev_clicked        : std_logic := '0';
SIGNAL started					: std_logic := '0';
SIGNAL finished				: std_logic := '1';
SIGNAL ones,tens				: std_logic_vector(3 downto 0);
signal oneSeg,tenSeg			: std_logic_vector(6 downto 0);
SIGNAL character_address	: std_logic_vector(5 downto 0);
-- component collision is
-- 	port (vert_sync, ball_on, pipe_on,started : in std_logic;
-- 		collide : out std_logic);
-- 	end component;
component pipe is
	port (
        clk,vert_sync,enable   : in std_logic;
        pixel_row,pixel_column : in std_logic_vector(9 DOWNTO 0);
		  pipeWidth_out,gapSize_out,gap_x_pos_out,gap_y_pos_out : out std_logic_vector(9 downto 0);
        red,green,blue, pipe_test : out std_logic
    );
end component;
component text_setter is
    PORT
    (
        character_address       :    OUT STD_LOGIC_VECTOR (5 DOWNTO 0);
        pixel_row, pixel_col    :    IN STD_LOGIC_VECTOR (9 DOWNTO 4);
        clock                   :    IN STD_LOGIC
    );
end component;
component char_rom IS
	PORT
	(
		character_address	:	IN STD_LOGIC_VECTOR (5 DOWNTO 0);
		font_row, font_col	:	IN STD_LOGIC_VECTOR (2 DOWNTO 0);
		clock				: 	IN STD_LOGIC ;
		rom_mux_output		:	OUT STD_LOGIC
	);
END component;
  component BCD is
    port(Clk, Direction, Init, Enable: in std_logic;
        Q_Out: out std_logic_vector(3 downto 0));
  end component BCD;
 
  component BCD_to_7Seg is
     port (BCD_digit : in std_logic_vector(3 downto 0);
           SevenSeg_out : out std_logic_vector(6 downto 0));
  end component BCD_to_7Seg;
BEGIN 


	 
textSetter : text_setter port map(
		      character_address	=> character_address,
		pixel_row => pixel_row(9 downto 4), pixel_col => pixel_column(9 downto 4),
		clock	=> clk

);
charRom: char_rom port map(
      character_address	=> character_address,
		font_row => pixel_row(3 downto 1), font_col => pixel_column(3 downto 1),
		clock	=> clk,
		rom_mux_output => rom_mux_output
    );

--collision_detect: collision port map (vert_sync => vert_sync, ball_on => ball_on, pipe_on => pipe_on,started => started,collide => t_collide);
pipeone: pipe port map (clk => clk, vert_sync => vert_sync,enable => (not dead) and started, pixel_row => pixel_row, 
								pixel_column => pixel_column,pipeWidth_out => pipeWidth,gapSize_out => gapSize, gap_x_pos_out => gap_x_pos,gap_y_pos_out => gap_y_pos ,red => pipe_red, green => pipe_green, blue => pipe_blue, pipe_test => pipe_on);           

onesBCD: BCD port map (Clk => t_clk, Direction => '1', Init => reset, Enable => enable1, Q_out => ones); 
tensBCD: BCD port map (Clk => t_clk, Direction => '1', Init => reset, Enable => enable2, Q_out => tens);
one_segment: BCD_to_7Seg port map (BCD_digit => ones, SevenSeg_out => oneSeg);
ten_segment: BCD_to_7Seg port map (BCD_digit => tens, SevenSeg_out => tenSeg);
--size = ball size. 
size <= CONV_STD_LOGIC_VECTOR(12,10);

-- ball_x_pos and ball_y_pos show the (x,y) for the centre of ball
ball_x_pos <= CONV_STD_LOGIC_VECTOR(200,10);


  
ball_on <= '1' when ((pixel_column - ball_x_pos) * (pixel_column - ball_x_pos) + (pixel_row - ball_y_pos) * (pixel_row - ball_y_pos) <= size * size) else '0';

-- Colours for pixel data on video signal
-- Changing the background and ball colour by pushbuttons
Red <=  (ball_on) or (pipe_red) or (rom_mux_output); 

Green1 <= pipe_green or (rom_mux_output);
green <= green1;
Blue <=  ((not ball_on) and (pipe_blue)) or (rom_mux_output);

--Aight don't do Key0. Somehow now resets whole board -__-
CLICK: process(pb2)
variable numOfpush : integer := 0;
begin
	
	if rising_edge(pb2) then
		numOfpush := numOfpush + 1;
		if (numOfPush = 2) then
			started <= '0';
			numOfPush := 0;
			reset <= '1';
		else
			started <= '1';
			reset <='0';
		end if;
	end if;
end process CLICK;

--leftclick, ball_y_motion,ball_y_pos,
BOUNCE_BALL: process(vert_sync)
	variable ball_y_motion: std_logic_vector(9 downto 0) := CONV_STD_LOGIC_VECTOR(0, 10);
	variable lives: integer := 0;
	
begin
		
		if (rising_edge(vert_sync)) then
		--When button has been  pressed
			if (started = '1') then
			--start at current value of speed. from beginning should be 0.....hopefully
				ball_y_motion := ball_y_motion;
				
				--Stuck on the bottom. Change the parameter for conversion to a 10 bit std logic vector to find sweet spot of the bottom of the moving object. 
				if (dead = '1') or (ball_y_pos >= 450 + size) or (ball_y_pos <= 10 - size) or (((gap_x_pos - pipeWidth <= ball_x_pos) and (ball_x_pos<= gap_x_pos + pipeWidth) and not (( gap_y_pos - gapSize<=ball_y_pos) and (ball_y_pos <=gap_y_pos + gapSize)))) then
				--stays at current position
				--=================add the mode stuff under here==========================
					--dead <= '1';
					if (lives < 1) then
						dead <= '1';
						ball_y_motion := CONV_STD_LOGIC_VECTOR(0, 10); --resets to 0 speed
						enable1 <= '0';
						lives := lives + 1;
					else 
						dead <= '0';
						ball_y_motion := ball_y_motion;
					end if;
					--ball_y_motion := CONV_STD_LOGIC_VECTOR(0, 10); --resets to 0 speed
					
				else
					--not dead state-
					dead <= '0';
					if (ones = "1001" and enable1 = '1') then
							enable2 <= '1';
					else
							enable2 <= '0';
					end if;
					prev_clicked <= leftclick;
					if ((leftclick /= '0') and (prev_clicked = '0') ) then
						--Set intial up speed to be 10
						enable1 <= '1';
						ball_y_motion := -CONV_STD_LOGIC_VECTOR(10,10);
						if (ball_y_motion <= -CONV_STD_LOGIC_VECTOR(3,10)) then
							
							ball_y_motion := ball_y_motion + CONV_STD_LOGIC_VECTOR(1,10);
						else
							ball_y_motion := ball_y_motion;
						end if;
					else
						enable1 <= '1';
						if (ball_y_motion <= CONV_STD_LOGIC_VECTOR(10,10)) then
							ball_y_motion :=  ball_y_motion + CONV_STD_LOGIC_VECTOR(1,10);
						else
							ball_y_motion := ball_y_motion; --stay at max speed
						end if;
						
					end if;
					
					ball_y_pos <= ball_y_pos + ball_y_motion;	
					if (ball_x_pos = gap_x_pos) then
						t_clk <= '1';
					else
						t_clk <= '0';
					end if;
				end if;
			
			else
			--Game not started
				dead <= '0';
				--reset to starting position
				ball_y_pos <= CONV_STD_LOGIC_VECTOR(200,10);
				t_Clk <= '1';
				lives := 0;
			end if;
		end if;
		
end process BOUNCE_BALL;
-- else '0' when started = '1';
--t_collide <= '1' when ((ball_on = '1') and (pipe_on = '1')) else '0';
collide <= t_collide;
oneSeg_out <= oneSeg;
tenSeg_out <= tenSeg;

END behavior;


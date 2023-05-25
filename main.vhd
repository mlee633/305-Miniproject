LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.all;
USE  IEEE.STD_LOGIC_ARITH.all;
USE  IEEE.STD_LOGIC_SIGNED.all;


entity main is
    port(pb2, Clk,vert_sync, left_click: in std_logic;
        pixel_column,pixel_row : in std_logic_vector(9 downto 0);
        gameMode : in std_logic;
        oneSeg_out : out std_logic_vector(6 downto 0);
		tenSeg_out : out std_logic_vector(6 downto 0);
        red, green, blue, collided: out std_logic);
end entity;

architecture rtl of main is
    
	 --=====================collision================================
	 component collision is
port (vert_sync, ball_on, pipe_on, enable  : in std_logic;
		ball_y_pos, size, gap_x_pos, pipeWidth, ball_x_pos, gap_y_pos, gapSize : in std_logic_vector(9 downto 0);
    collide : out std_logic);
end component;

    --===============Pipe movement and display===================================
    component pipe is
        port (
            clk,vert_sync,enable   : in std_logic;
            pixel_row,pixel_column : in std_logic_vector(9 DOWNTO 0);
              pipeWidth_out,gapSize_out,gap_x_pos_out,gap_y_pos_out : out std_logic_vector(9 downto 0);
            red,green,blue, pipe_test : out std_logic;
				pipeSpeed : in integer
        );
    end component;

    --=====================Data values required for displaying letters=================
    component text_setter is
        PORT
        (
            character_address       :    OUT STD_LOGIC_VECTOR (5 DOWNTO 0);
            pixel_row, pixel_col    :    IN STD_LOGIC_VECTOR (9 DOWNTO 4);
				lives : in integer;
            clock                   :    IN STD_LOGIC
        );
    end component;

    --======================A component required for letter display=================
    component char_rom IS
        PORT
        (
            character_address	:	IN STD_LOGIC_VECTOR (5 DOWNTO 0);
            font_row, font_col	:	IN STD_LOGIC_VECTOR (2 DOWNTO 0);
            clock				: 	IN STD_LOGIC ;
            rom_mux_output		:	OUT STD_LOGIC
        );
    END component;
    --==========================BCD counter==================================
    component BCD is
        port(Clk, Direction, Init, Enable: in std_logic;
            Q_Out: out std_logic_vector(3 downto 0));
    end component BCD;
     
    --====================7 Segment display stuff============
    component BCD_to_7Seg is
         port (BCD_digit : in std_logic_vector(3 downto 0);
               SevenSeg_out : out std_logic_vector(6 downto 0));
    end component BCD_to_7Seg;

    --====================Ball display and movement====================
    component ball is 
        port (vert_sync, left_click, enable,reset: IN std_logic;
            pixel_row, pixel_column	: IN std_logic_vector(9 DOWNTO 0);
            ball_x_pos, ball_y_pos, ball_size  : OUT std_logic_vector(9 downto 0);
            ball_on,red, green, blue 			: OUT std_logic);
    end component ball;
	 
	 --=================================signal declaration
    SIGNAL ones,tens				: std_logic_vector(3 downto 0);
    signal oneSeg,tenSeg			: std_logic_vector(6 downto 0);
    SIGNAL character_address	: std_logic_vector(5 downto 0);
    SIGNAL enable : std_logic := '0';
	 signal lives : integer := 2;
	 SIGNAL pipeSpeed : integer := 1;
    SIGNAL pipeWidth, gapSize, gap_y_pos, gap_x_pos, ball_y_pos, ball_x_pos, ball_y_move, size : std_logic_vector(9 downto  0);
    SIGNAL prevHit,prevCollide,pipeEnable, rom_mux_output, ball_on, pipe_on, pipe_red, pipe_blue, pipe_green,green1, t_Clk,reset, ball_enable, enable1,ball_reset,enable2,t_collide, ball_red, ball_green, ball_blue	: std_logic;
	 signal dead : std_logic := '0';
    begin
	
	--=====================================Port map of all components============================================
    collision_detect: collision port map (vert_sync => vert_sync, ball_on => ball_on, pipe_on => pipe_on,
                                        enable => enable ,ball_y_pos => ball_y_pos, size => size ,collide => t_collide,
													 gap_x_pos => gap_x_pos, pipeWidth => pipeWidth, ball_x_pos => ball_x_pos, gap_y_pos => gap_y_pos, gapSize => gapSize);

    textSetter : text_setter port map(character_address	=> character_address,
                                    pixel_row => pixel_row(9 downto 4), 
                                    pixel_col => pixel_column(9 downto 4), lives => lives,
                                    clock => clk);
    pipeone: pipe port map (clk => clk, vert_sync => vert_sync,enable => pipeEnable and enable, pixel_row => pixel_row, 
                            pixel_column => pixel_column,pipeWidth_out => pipeWidth,gapSize_out => gapSize, gap_x_pos_out => gap_x_pos,
                            gap_y_pos_out => gap_y_pos ,red => pipe_red, green => pipe_green, blue => pipe_blue, pipe_test => pipe_on, pipeSpeed => pipeSpeed);           
    

    onesBCD: BCD port map (Clk => t_clk, Direction => '1', Init => reset, Enable => enable1, Q_out => ones); 

    tensBCD: BCD port map (Clk => t_clk, Direction => '1', Init => reset, Enable => enable2, Q_out => tens);

    one_segment: BCD_to_7Seg port map (BCD_digit => ones, SevenSeg_out => oneSeg);

    ten_segment: BCD_to_7Seg port map (BCD_digit => tens, SevenSeg_out => tenSeg);

    charRom: char_rom port map(character_address => character_address, font_row => pixel_row(3 downto 1), 
                                font_col => pixel_column(3 downto 1), clock	=> clk,
                                rom_mux_output => rom_mux_output);

    avatar: ball port map(vert_sync => vert_sync, left_click => left_click, enable => ball_enable, reset => ball_reset,
                        pixel_row => pixel_row, pixel_column => pixel_column,
                        ball_x_pos => ball_x_pos, ball_y_pos => ball_y_pos, ball_size => size,
                        ball_on => ball_on ,red => ball_red, green => ball_green, blue => ball_blue);
    --Running of game
	 
	Red <=  (ball_red) or (rom_mux_output); 

	Green <= pipe_green or (rom_mux_output);

	Blue <=  ((not ball_on) and pipe_blue) or rom_mux_output;
	collided <= t_collide;
	 
    CLICK: process(pb2)
    --Counting number of button clicks
    variable numOfpush: integer := 0;
    begin
        if rising_edge(pb2) then
            numOfPush := numOfPush + 1;
            if (numOfPush = 2) then
                --Enable starts the game. 
                enable <= '0';
                numOfPush := 0;
                reset <= '1';
            else
                enable <= '1';
                reset <= '0';
            end if;
        end if;
    end process CLICK;

    process(vert_sync)
	 variable pointCount : integer := 0;

    begin
        if rising_edge(vert_sync) then
		  
            if (enable = '1') then
					prevCollide <= t_collide;
               if (t_collide = '1') then
							if prevCollide = '0' then
								lives <= lives - 1;
								pipeEnable <= '0';
								if (lives <= 1) then
									dead <= '1';
									ball_enable <= '0';
									--ball_reset <= '1';
								
								end if;
							end if;
                
                else
					 pipeEnable <= '1';
   
					 ball_enable<= '1';
					 ball_reset <= '0';
					 
					 --======================Point adding========================
					 enable1 <= '1';
                     dead <= '0';
						 if (ones = "1001" and enable1 = '1') then
							enable2 <= '1';
							pipeSpeed <= pipeSpeed + 1;
						 else
							enable2 <= '0';
						 end if;
					    if (ball_x_pos  <= gap_x_pos + (pipeSpeed - 1)) and (ball_x_pos >= gap_x_pos - (pipeSpeed - 1)) then
							t_clk <= '1';
                            pointCount := pointCount + 1;
                            if pointCount = 10 then
                                pipeSpeed <= 2;
                            elsif pointCount = 20 then
                                pipeSpeed<= 3;
                            elsif pointCount = 30 then
                                pipeSpeed <= 4;
                            end if;
							
						 else
							t_clk <= '0';
							
						 end if;
				end if; 
			else
				-- Game not started, when button is pressed again after starting, 
				ball_reset <= '1';
				ball_enable <= '0';
				t_clk <= '1';
				pipespeed <= 1;
                pointCount := 0;
                if gameMode = '1' then 
				    lives <= 3;
                else 
                    lives <= 0;
                end if;
				dead <= '0';
			end if;
        end if;
    end process;
    oneSeg_out <= oneSeg;
    tenSeg_out <= tenSeg;

end architecture rtl;
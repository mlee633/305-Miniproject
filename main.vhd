LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.all;
USE  IEEE.STD_LOGIC_ARITH.all;
USE  IEEE.STD_LOGIC_SIGNED.all;

entity main is
    port(pb2, Clk,vert_sync, left_click: in std_logic;
        pixel_column,pixel_row : in std_logic_vector(9 downto 0);
        oneSeg_out : out std_logic_vector(6 downto 0);
		tenSeg_out : out std_logic_vector(6 downto 0);
        red, green, blue : out std_logic);
end entity;

architecture rtl of main is
    component collision is
        port (vert_sync, ball_on, pipe_on,started : in std_logic;
            ball_y_pos : in std_logic_vector(9 downto 0);
        collide : out std_logic);
    end component;
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

    component ball is 
        port (vert_sync, left_click, enable: IN std_logic;
            pixel_row, pixel_column	: IN std_logic_vector(9 DOWNTO 0);
            ball_x_pos, ball_y_pos  : OUT std_logic_vector(9 downto 0);
            ball_on,red, green, blue 			: OUT std_logic);
    end component ball;

    SIGNAL ones,tens				: std_logic_vector(3 downto 0);
    signal oneSeg,tenSeg			: std_logic_vector(6 downto 0);
    SIGNAL character_address	: std_logic_vector(5 downto 0);
    SIGNAL enable : std_logic := '0';
    SIGNAL pipeWidth,gapSize,gap_y_pos,gap_x_pos, ball_y_pos, ball_x_pos, ball_y_move : std_logic_vector(9 downto  0);
    SIGNAL rom_mux_output, ball_on, pipe_on, pipe_red, pipe_blue, pipe_green,green1, t_Clk,reset,enable1,enable2,dead,t_collide, ball_red, ball_green, ball_blue	: std_logic;
    begin

    collision_detect: collision port map (vert_sync => vert_sync, ball_on => ball_on, pipe_on => pipe_on,
                                        started => enable ,ball_y_pos => ball_y_pos,collide => t_collide);

    textSetter : text_setter port map(character_address	=> character_address,
                                    pixel_row => pixel_row(9 downto 4), 
                                    pixel_col => pixel_column(9 downto 4),
                                    clock => clk);
    pipeone: pipe port map (clk => clk, vert_sync => vert_sync,enable => (not dead) and enable, pixel_row => pixel_row, 
                            pixel_column => pixel_column,pipeWidth_out => pipeWidth,gapSize_out => gapSize, gap_x_pos_out => gap_x_pos,
                            gap_y_pos_out => gap_y_pos ,red => pipe_red, green => pipe_green, blue => pipe_blue, pipe_test => pipe_on);           

    onesBCD: BCD port map (Clk => t_clk, Direction => '1', Init => reset, Enable => enable1, Q_out => ones); 

    tensBCD: BCD port map (Clk => t_clk, Direction => '1', Init => reset, Enable => enable2, Q_out => tens);

    one_segment: BCD_to_7Seg port map (BCD_digit => ones, SevenSeg_out => oneSeg);

    ten_segment: BCD_to_7Seg port map (BCD_digit => tens, SevenSeg_out => tenSeg);

    charRom: char_rom port map(character_address => character_address, font_row => pixel_row(3 downto 1), 
                                font_col => pixel_column(3 downto 1), clock	=> clk,
                                rom_mux_output => rom_mux_output);

    avatar: ball port map(vert_sync => vert_sync, left_click => left_click, enable => enable,
                        pixel_row => pixel_row, pixel_column => pixel_column,
                        ball_x_pos => ball_x_pos, ball_y_pos => ball_y_pos,
                        ball_on => ball_on ,red => ball_red, green => ball_green, blue => ball_blue);
    --Running of game
    CLICK: process(pb2)
    --Counting number of button clicks
    variable numOfpush : integer := 0;

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
    variable lives : integer := 4;
    begin
        if rising_edge(vert_sync) then
            if (enable = '1') then
                if (t_collide = '1') then
                    lives := lives - 1;
                    if (lives = 0) then
                        enable <= '0';
                    end if;
                end if;
            else
                enable <= '1';
                if (ones = "1001" and enable1 = '1') then
                    enable2 <= '1';
                else
                    enable2 <= '0';
                end if;
                if ball_y_pos = gap_x_pos then
                    t_clk <= '1';
                else 
                    t_clk <= '0';
                end if;
            end if;
        end if;
    end process;
    oneSeg_out <= oneSeg;
    tenSeg_out <= tenSeg;

end architecture rtl;
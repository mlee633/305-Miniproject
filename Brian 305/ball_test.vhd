library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity ball_test is port(
    Clk: in std_logic;
    PushButton1, PushButton2: in std_logic;
	 
    mouseData : INOUT std_logic;
	 clk_Mouse: INOUT std_logic;
    red_out, green_out, blue_out, horiz_sync_out, vert_sync_out	: OUT	STD_LOGIC
    );
end entity;

architecture behave of ball_test is
    component bouncy_ball is
        port 
            ( pb1, pb2, clk, vert_sync,leftclick	: in std_logic;
              pixel_row, pixel_column	: in std_logic_vector(9 downto 0);
              red, green, blue 			: out std_logic);		
    end component;

    component VGA_SYNC IS
	PORT(	clock_25Mhz, red, green, blue		: IN	STD_LOGIC;
			red_out, green_out, blue_out, horiz_sync_out, vert_sync_out	: OUT	STD_LOGIC;
			pixel_row, pixel_column: OUT STD_LOGIC_VECTOR(9 DOWNTO 0));
    END component;

    component MOUSE is
        port(clock_25Mhz, reset 		: IN std_logic;
            mouse_data					: INOUT std_logic;
            mouse_clk 					: INOUT std_logic;
            left_button, right_button	: OUT std_logic;
            mouse_cursor_row 			: OUT std_logic_vector(9 DOWNTO 0); 
            mouse_cursor_column 		: OUT std_logic_vector(9 DOWNTO 0)); 
    end component;

    signal VertSync, Red, Green, Blue: std_logic;
    signal PixRow, PixCol,mouse_row,mouse_column: std_logic_vector(9 downto 0);
	 signal left_click,right_click: std_logic;
    signal Clock25MHz: std_logic;
    signal resetSig: std_logic;
begin

    PRESCALE_CLK: process(Clk) is 
    begin
        if rising_edge(Clk) then 
            Clock25MHz <= not Clock25MHz;
        end if;
    end process;
    mainMouse: MOUSE port map(
        clock_25Mhz => Clock25Mhz,
        reset => resetSig,
        mouse_data => mouseData,
        mouse_clk => Clk_Mouse,
        left_button => left_click,
        right_button => right_click,
        mouse_cursor_row => mouse_row,
        mouse_cursor_column => mouse_column
    );
    BALL: bouncy_ball port map(Clk => Clk,
                               pb1 => PushButton1,
                               pb2 => PushButton2,
                               --Vert_sync => VertSync,
                               Vert_sync => VertSync,
										 leftclick => left_click,
                               pixel_column => PixCol,
                               pixel_row => PixRow,
                               red => Red,
                               green => Green,
                               blue => Blue);

    VGA: vga_sync port map(clock_25Mhz => Clock25MHz,
                           red => Red,
                           green => Green,
                           blue => Blue,
                           pixel_row => PixRow,
                           pixel_column => PixCol,
                           red_out => red_out,
                           green_out => green_out,
                           blue_out => blue_out,
                           horiz_sync_out => horiz_sync_out,
                           vert_sync_out => VertSync);

    vert_sync_out <= VertSync;
    

end architecture;
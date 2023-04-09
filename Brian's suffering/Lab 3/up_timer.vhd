library IEEE;
use IEEE.std_logic_1164.all;
 
entity up_timer is 
  port(t_Clk, Start: in std_logic;
      Data_In: in std_logic_vector(9 downto 0);
      Minute: out std_logic_vector(6 downto 0);
      time_out: out std_logic;
      SecondOne: out std_logic_vector(6 downto 0);
      SecondTen: out std_logic_vector(6 downto 0));
end entity up_timer;
 
architecture behaviour of up_timer is
  signal u_Enable, enable1, enable2: std_logic := '0';
  signal secOne_reset, secTen_reset, min_reset: std_logic := '0';
  signal secTen: std_logic_vector(3 downto 0);
  signal secOne: std_logic_vector(3 downto 0);
  signal min: std_logic_vector(3 downto 0);
  signal secTen_seg, secOne_seg, min_seg: std_logic_vector(6 downto 0);
  signal convert_time: std_logic;
  signal Running: std_logic := '0';
  
  component BCD is
    port(Clk, Direction, Init, Enable: in std_logic;
        Q_Out: out std_logic_vector(3 downto 0));
  end component BCD;
 
  component BCD_to_7Seg is
     port (BCD_digit : in std_logic_vector(3 downto 0);
           SevenSeg_out : out std_logic_vector(6 downto 0));
  end component BCD_to_7Seg;

  component timer_convert is
    port(in_clk: in std_logic;
        out_clk: out std_logic);
  end component timer_convert;
  
  begin
    Second1: BCD 
      port map (Clk => convert_time, Direction => '1', Init => secOne_reset, Enable => u_Enable, Q_out => secOne); 
    Second2: BCD
      port map (Clk => convert_time, Direction => '1', Init => secTen_reset, Enable => enable1, Q_out => secTen);
    Minute1: BCD
      port map (Clk => convert_time, Direction => '1', Init => min_reset, Enable => enable2, Q_out => min);
    
    sec1_segment: BCD_to_7Seg
      port map (BCD_digit => secOne, SevenSeg_out => secOne_seg);
    sec2_segment: BCD_to_7Seg
      port map (BCD_digit => secTen, SevenSeg_out => secTen_seg);
    min_segment : BCD_to_7Seg
      port map (BCD_digit => min, SevenSeg_out => min_seg);
        
    conv_time: timer_convert
      port map (in_clk => t_clk, out_clk => convert_time);
 
  process(convert_time)
    begin
		if rising_edge(Start) then
			Running <= '1';
      end if;
  end process;
  
  enable1 <= '1' when (secOne = "1001" and Running = '1') else '0';
  enable2 <= '1' when (secTen = "0101" and secOne = "1001" and Running = '1') else '0';
  secTen_reset <= enable2;
  
  u_Enable <= '0' when (Data_In(9 downto 8) = min(1 downto 0)) and (Data_In(7 downto 4) = secTen) and (Data_In(3 downto 0) = secOne) else
				  '0' when Running = '0' else '1';
  time_out <= not u_Enable;
  
  Minute <= min_seg;
  SecondOne <= secOne_seg;
  SecondTen <= secTen_seg;
  
end architecture;

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
  signal timeout: std_logic := '0';
  component BCD is
    port(Clk, Direction, Init, Enable: in std_logic;
        Q_Out: out std_logic_vector(3 downto 0));
  end component BCD;
 
  component BCD_to_7Seg is
     port (BCD_digit : in std_logic_vector(3 downto 0);
           SevenSeg_out : out std_logic_vector(6 downto 0));
  end component BCD_to_7Seg;

  begin
    Second1: BCD 
      port map (Clk => t_clk, Direction => '1', Init => secOne_reset, Enable => u_Enable, Q_out => secOne); 
    Second2: BCD
      port map (Clk => t_clk, Direction => '1', Init => secTen_reset, Enable => enable1, Q_out => secTen);
    Minute1: BCD
      port map (Clk => t_clk, Direction => '1', Init => min_reset, Enable => enable2, Q_out => min);
    
    sec1_segment: BCD_to_7Seg
      port map (BCD_digit => secOne, SevenSeg_out => secOne_seg);
    sec2_segment: BCD_to_7Seg
      port map (BCD_digit => secTen, SevenSeg_out => secTen_seg);
    min_segment : BCD_to_7Seg
      port map (BCD_digit => min, SevenSeg_out => min_seg);
 
  process(t_clk)
    begin
      if (Start = '1') then
        
        secOne_reset <= '1';
        secTen_reset <= '1';
        min_reset <= '1';
        u_Enable <= '1';
        timeout <= '0';
      
      elsif secOne = "1001" then
        enable1 <= '1';
        if secTen = "0101" then
          enable2 <= '1';
          secTen_reset <= '1';
          if min = "0011" then
            min_reset <= '1';
          end if;
        end if;
      elsif (Data_In(9 downto 8) = min(1 downto 0)) and (Data_In(7 downto 4) = secTen) and (Data_In(3 downto 0) = secOne)  then
        u_Enable <= '0';
        enable1 <= '0';
        enable2 <= '0';
        timeout <= '1';
      else
        enable1 <= '0';
        enable2 <= '0';
        secOne_reset <= '0';
        secTen_reset <= '0';
        min_reset <= '0';
      end if;
        

  end process;
  time_out <= timeout;
  Minute <= min_seg;
  SecondOne <= secOne_seg;
  SecondTen <= secTen_seg;
  
end architecture;

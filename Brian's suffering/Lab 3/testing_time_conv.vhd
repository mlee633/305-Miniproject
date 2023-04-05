library IEEE;
use IEEE.std_logic_1164.all;

entity testing_time_conv is
end entity testing_time_conv;

architecture test of testing_time_conv is
  signal t_clk: std_logic;
  signal t_clk_conv: std_logic;
  
  component timer_convert is
    port(in_clk: in std_logic;
        out_clk: out std_logic);
  end component timer_convert;
  
  begin
    C1: timer_convert
      port map (in_clk => t_clk, out_clk => t_clk_conv);
        
  
  --Setting up 50Mhz timer--
     
  clk_gen: process
    begin 
      t_clk <= '1';
      wait for 10 ns;
      t_clk <= '0';
      wait for 10 ns;
  end process clk_gen;
end architecture test;
      

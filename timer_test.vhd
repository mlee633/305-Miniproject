library ieee;
use ieee.std_logic_1164.all;
entity timer_test is
end entity timer_test;

architecture test of timer_test is
       
  component timer is
     port(t_Clk, Start: in std_logic;
      Date_In: in std_logic_vector(9 downto 0);
      Minute: out std_logic_vector(6 downto 0);
      Seconds: out std_logic_vector(13 downto 0);
      time_out: out std_logic);
  end component timer;
  signal clk: std_logic;
  signal start: std_logic;
  signal setStop: std_logic_vector(9 downto 0);
  signal minOut: std_logic_vector(6 downto 0);
  signal secOut: std_logic_vector(13 downto 0);
  signal isEqual: std_logic;
  begin
    
  timer1: timer 
    port map(t_Clk => clk, Start => start, Date_In => setStop, Minute => minOut, Seconds => secOut, time_out => isEqual);
        
  init: process
    begin
      start <= '1';
      setStop <= "0100110111";
      wait;
    end process init;
  --Setting up 50Mhz timer--
    
  clk_gen: process
    begin 
      clk <= '1';
      wait for 10 ns;
      clk <= '0';
      wait for 10 ns;
  end process clk_gen;
end architecture test;
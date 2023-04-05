library ieee;
use ieee.std_logic_1164.all;
entity test_timer is
end entity test_timer;

architecture test of test_timer is
       
  component up_timer is
     port(t_Clk, Start: in std_logic;
      Data_In: in std_logic_vector(9 downto 0);
      Minute: out std_logic_vector(6 downto 0);
      time_out: out std_logic;
      SecondOne: out std_logic_vector(6 downto 0);
      SecondTen: out std_logic_vector(6 downto 0));
  end component up_timer;
  signal clk: std_logic;
  signal start: std_logic;
  signal setStop: std_logic_vector(9 downto 0);
  signal minOut: std_logic_vector(6 downto 0);
  signal secOne: std_logic_vector(6 downto 0);
  signal secTen: std_logic_vector(6 downto 0);
  signal isEqual: std_logic;
  begin
    
  timer1: up_timer 
    port map(t_Clk => clk, Start => start, Data_In => setStop, Minute => minOut, time_out => isEqual, SecondOne => secOne, SecondTen => secTen);
        
  init: process
    begin
      setStop <= "0100110111";
      start <= '1', '0' after 50 ns;
      wait;
    end process init;
  --Setting up 50Mhz timer--
    
  clk_gen: process
    begin 
      clk <= '0';
      wait for 10 ns;
      clk <= '1';
      wait for 10 ns;
    end process clk_gen;

end architecture;
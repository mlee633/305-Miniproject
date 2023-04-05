-- Test for up counter
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity test_up_counter is

end entity test_up_counter;

architecture behave of test_up_counter is 
    component up_counter is port(clk: in std_logic;
                         reset: in std_logic;
                         enable: in std_logic;
                         counter: out std_logic_vector(7 downto 0));
    end component;
    signal t_Clk, t_Reset,t_Enable: std_logic;
    signal t_Q: std_logic_vector(7 downto 0);
begin
      DUT: up_counter port map (clk => t_Clk, reset => t_Reset, enable => t_Enable, counter => t_Q);
      initial: process
      begin
          t_Enable <= '1', '0' after 790 ns, '1' after 870 ns;
          t_Reset <= '0', '1' after 583 ns, '0' after 595 ns,  '1' after 800 ns , '0' after 860 ns;
          wait;
     end process;
      clock: process
      begin
         
          t_Clk <= '0';
          wait for 5 ns;
          t_Clk <= '1';
          wait for 5 ns;
      end process;
end architecture behave; 

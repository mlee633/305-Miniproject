-- Test for BCD counter
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity test_bcd_counter is port(clk, reset: in bit; count: out integer);
end entity test_bcd_counter;

architecture behave of test_bcd_counter is 
    component bcd_counter is port(Clk: in std_logic;
                         Init: in std_logic;
                         Enable: in std_logic;
                         Direction: in std_logic;
                         Q: out std_logic_vector(3 downto 0));
    end component;
    signal t_Clk, t_Init,t_Enable, t_Direction: std_logic;
    signal t_Q: std_logic_vector(3 downto 0);
begin
      DUT: bcd_counter port map (Clk => t_Clk, Init => t_Init, Enable => t_Enable, Direction => t_Direction, Q => t_Q);
      initial: process
      begin
          t_Enable <= '1', '0' after 790 ns, '1' after 870 ns;
          t_Init <= '0', '1' after 450 ns, '0' after 600 ns, '1' after 910 ns;
          t_Direction <= '0', 
                    '1' after 200 ns,
                    '0' after 250 ns,
                    '1' after 270 ns,
                    '0' after 300 ns,
                    '1' after 370 ns,
                    '0' after 380 ns,
                    '1' after 400 ns;
          wait;
     end process;
      clock: process
      begin
         
          t_Clk <= '1';
          wait for 5 ns;
          t_Clk <= '0';
          wait for 5 ns;
      end process;
end architecture behave;


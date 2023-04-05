library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity up_counter is port(clk, reset, enable: in std_logic; 
                          counter: out std_logic_vector(7 downto 0));
end entity up_counter;

architecture behave of up_counter is 
    component bcd_counter is port(Clk: in std_logic;
                         Init: in std_logic;
                         Enable: in std_logic;
                         Direction: in std_logic;
                         Q: out std_logic_vector(3 downto 0));
    end component;
  signal tens_Clk: std_logic;
  signal t_Enable: std_logic;
  signal t_Direction: std_logic;
    signal ones_Q: std_logic_vector(3 downto 0); 
signal tens_Q: std_logic_vector(7 downto 4);
begin
  t_Direction <= '1';
  ONES: bcd_counter port map (Clk => clk, Init => reset, Enable => enable, Direction => t_Direction, Q => ones_Q);
  TENS: bcd_counter port map (Clk => clk, Init => reset, Enable => t_Enable, Direction => t_Direction, Q => tens_Q);
  
  process(Clk)
    begin
      if (enable = '1') and (ones_Q = "1001") then
        t_Enable <= '1';
      else
        t_Enable <= '0';
      end if;
  end process;
-- concatenation  to combine the tens and ones
counter <= tens_Q & ones_Q; 
end architecture behave;

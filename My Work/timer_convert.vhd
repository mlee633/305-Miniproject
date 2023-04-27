library IEEE;
use IEEE.std_logic_1164.all;

entity timer_convert is
  port(in_clk: in std_logic;
        out_clk: out std_logic);
end timer_convert;

architecture behaviour of timer_convert is
  signal counter: integer := 0;
  begin  

  CLK_gen: process(in_clk)
    --variable count : integer:= 0;
    --50Mhz = 20ns
    --1hz = 1s. Therefore alternates 1 and 0 every 0.5s
    --Each 20ns represent 1 count. therefore in 0.5s, there is 25 x 10^6 counts....bruh
    
    begin
    if (in_clk'event  and in_clk = '1') then
      if counter < 25000000 then
        counter <= counter + 1;
        out_clk <= '1';
      elsif counter < 50000000 then
        counter <= counter + 1;
        out_clk <= '0';
      else
        counter <= 0;
        out_clk <= '1';
      end if;
    end if;
  end process CLK_gen;
end architecture;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;


entity bcd_counter is
  port(Clk, Init, Enable,Direction: in std_logic;
        
        Q: out std_logic_vector(3 downto 0) := "0000");
end entity bcd_counter;

architecture behave of bcd_counter is
 signal counter: unsigned(3 downto 0) := (others => '0');
begin
  process(Clk) is
    begin
      if (rising_edge(Clk)) then
        if (Init = '1') then
          if(Direction = '1') then
            counter <= "0000";
          else
            counter <= "1001";
          end if;
      
        elsif (Enable = '1') then
          if(Direction = '1') then
            if (counter = "1001") then
              counter <= "0000";
            else
              counter <= counter +1;
            end if;
          else
            if (counter = "0000") then
              counter <= "1001";
            else
              counter <= counter -1;
            end if;
          end if;
        
        end if;
      end if;
    end process;
  Q <= std_logic_vector(counter);
end architecture behave;


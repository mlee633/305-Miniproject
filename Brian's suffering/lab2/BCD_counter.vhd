library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use IEEE.numeric_std.all;

entity BCD_counter is
  port(Clk, Direction, Init, Enable: in std_logic;
        Q_Out: out std_logic_vector(3 downto 0));
end entity BCD_counter;

architecture behaviour of BCD_counter is
  signal counter: integer := 0;
  begin
    
    process(Clk) 
      --variable counter: integer := 0; 
    begin
      if (rising_edge(Clk)) then
        if Init = '1' then --Original was using cases. All cases was changed to If statements
          if (Direction = '1') then
            counter <= 0;
          else
            counter <= 9;
          end if;  
                                           
        elsif (Enable = '1') then
          if (Direction = '1') then
            --counter <= (counter + 1) mod 10;
            if (counter = 9) then
              counter <= 0;
            else
              counter <= counter + 1;
            end if;
          else
            if counter = 0 then
              counter <= 9;
            else
               counter <= counter - 1;
            end if;
          end if;        
        end if;
        --Q_out <= std_logic_vector(to_unsigned(counter, Q_out'length)); 
      end if;
    end process;
    Q_out <= std_logic_vector(to_unsigned(counter, Q_out'length));
end architecture; 
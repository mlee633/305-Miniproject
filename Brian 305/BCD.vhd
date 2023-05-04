library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use IEEE.numeric_std.all;
entity BCD is
  port(Clk, Direction, Init, Enable: in std_logic;
        Q_Out: out std_logic_vector(3 downto 0));
end entity BCD;

architecture behaviour of BCD is
  signal counter: std_logic_vector(3 downto 0);--integer := 0;
  begin
    
     --Originally hae counter set as integer. 
     
    process(Clk) 
      --variable counter: integer := 0; 
    begin
      if (clk'event and clk = '1') then
        if Init = '1' then --Original was using cases. All cases was changed to If statements
          if (Direction = '1') then
            counter <= "0000";--0;
          else
            counter <= "1001";--9;
          end if;  
                                           
        elsif (Enable = '1') then
          if (Direction = '1') then
            --counter <= (counter + 1) mod 10;
            if (counter = "1001") then
              counter <= "0000";
            else
              counter <= counter + 1;
            end if;
          else
            if counter = "0000" then
              counter <= "1001";
            else
               counter <= counter - 1;
            end if;
          end if;        
        end if;
        --Q_out <= std_logic_vector(to_unsigned(counter, Q_out'length)); 
      end if;
    end process;
    Q_out <= counter; --std_logic_vector(to_unsigned(counter, Q_out'length));
end architecture;
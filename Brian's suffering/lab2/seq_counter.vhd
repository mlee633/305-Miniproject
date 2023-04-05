library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use IEEE.numeric_std.all; --Required for integer to unsigned binary conversion--
entity Seq_counter is
  
  port(Clk, Enable, Reset: in std_logic;
        Mode: in std_logic_vector(1 downto 0);
        Q: out std_logic_vector(4 downto 0));
end entity Seq_counter;

architecture behaviour of Seq_counter is
  --Setting up array for mode 10
  type countArray is array (6 downto 0) of integer; --Since the array is set as 6 downto 0, the indexing is also affect to be where at 6 is the first element.--
  signal mode10: countArray := (5, 2, 13, 30, 25, 16, 18); 
  signal currentMode: std_logic_vector(1 downto 0); 
  begin
    P1:process(Clk, Reset) is
    --This variable stuff is only setted like below once. Will not reset again, if process is executed again
    variable temp: integer := 6;
    variable counter: integer := 0;    
      begin
        --Asynchronous Reset--
        if (Reset = '1') then 
          case Mode is 
            when "00" => counter:= 0;
            when "01" => counter:= 15; 
            when "10" =>
            --temp := 6;
            counter := mode10(6);
            when "11" => counter:= 13;  
            when others => counter := 0;
          end case;
        elsif (Clk'event and Clk = '1') then
          currentMode <= Mode; 
          --a little loop hole. When enable is set to 0, BUT mode is changed, reset never happens.--
            if (Enable = '0') and (currentMode /= Mode) then --Sync with clock--
              case Mode is 
                  when "00" => counter:= 0;
                  when "01" => counter:= 15; 
                  when "10" => counter := mode10(6);
                  when "11" => counter:= 13;  
                  when others => counter := 0; --Done this as there was apparently 70+ more cases that i haven't checked with case statement--
                end case; 
            elsif (Enable = '1') then
              if (currentMode /= Mode) then --Checking whether the moment mode changes while reset is 0, Q still resets only with Enable set to 1. 
                case Mode is 
                  when "00" => counter:= 0;
                  when "01" => counter:= 15; 
                  when "10" => counter := mode10(6);
                  when "11" => counter:= 13;  
                  when others => counter := 0; --Done this as there was apparently 70+ more cases that i haven't checked with case statement--
                end case;              
              else 
            --set q to appropiate values. If reach end of sequence, will reset to beginning--
            --maybe need to add another if statement about checking the current and new mode
                case Mode is 
                  when "00" => counter:= counter + 2;  
                    if counter > 24 then
                      counter := 0;
                    end if;             
                  when "01" => counter:= counter - 1; 
                    if counter < 0 then
                      counter := 15;
                    end if;
                  when "10" => 
                    temp:= temp - 1;
                    if temp = -1 then
                      temp := 6;
                    end if;
                    counter := mode10(temp);
                  when "11" => counter:= 13;    
                  when others => counter := 0;                        
                end case;
              end if;
            end if;
        end if;
        Q <= std_logic_vector(to_unsigned(counter, Q'length)); --Converts integer to unsigned binary
    end process P1;

end architecture behaviour; 
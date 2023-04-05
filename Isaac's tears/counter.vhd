entity counter is 
         port (Clk, Reset : in bit; 
               Q : out integer); 
end entity counter; 
architecture behaviour of counter is 
begin 
       process (Clk)   
            variable v_Q: integer; -- the spelling of integer was wrong
       begin 
           if (Clk'event and Clk = '1') then  --needs a quote cause of bit / cant compare bits and integer as different types
              if (Reset = '1') then -- single = ':' using it only for assigning variables
                 v_Q := 11;     
              elsif (v_Q /= 31) then 
                 v_Q := v_Q + 2;  -- dosent need a quote as its an integer instead of a bit 
              else 
                 v_Q := 0; 
              end if; 
              Q <= v_Q; -- signal assignments use <= 
           end if; 
        end process; 
end architecture behaviour;
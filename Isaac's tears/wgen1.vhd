entity wgen1 is 
    port (X : in bit_vector (2 downto 0);
        A, B, C, Z : out bit);
end entity wgen1;

architecture behaviour of wgen1 is 
      signal A1, B1, C1 : bit; 
begin
  
   wave_gen: process
   begin
        A1 <= '1', '0' after 2ns, '1' after 3ns, '0' after 4ns;
        B1 <= '0', '1' after 1ns, '0' after 2ns, '1' after 3ns, '0' after 4ns;    
        C1 <= '1', '0' after 1ns, '1' after 2ns, '0' after 3ns, '1' after 4ns;
        wait for 5ns;
   end process wave_gen;
   
   process (X, A1, B1, C1)
   begin 
              A <= A1;
              B <= B1;
              C <= C1;
              case X is 
                    when "000" => Z <= A1 and B1;
                    when "001" => Z <= B1 or C1;
                    when "010" => Z <= (A1 or C1) and C1;
                    when "011" => Z <= (A1 xor B1) or C1;
                    when "100" => Z <= A1;
                    when "101" => Z <= B1;
                    when "110" => Z <= C1;
                    when "111" => Z <= '1';
                      
              end case;        
   end process;
end architecture behaviour;


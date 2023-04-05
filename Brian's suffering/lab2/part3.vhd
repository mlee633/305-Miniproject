library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use IEEE.numeric_std.all;

entity up_counter is
  port(u_Clk, u_Enable, u_Reset: in std_logic;
        Counter_Out: out std_logic_vector(7 downto 0));
end entity up_counter;

architecture Structure of up_counter is
  signal s2: std_logic;
  signal Q_out1 :std_logic_vector(3 downto 0);
  signal Q_out2 : std_logic_vector(7 downto 4); 
  component BCD_counter is
    port(Clk, Direction, Init, Enable: in std_logic;
          Q_out: out std_logic_vector(3 downto 0));
  end component;
  begin
    C1: BCD_counter
        port map (Clk => u_Clk, Direction => '1', Init => u_Reset, Enable => u_Enable, Q_out => Q_out1);
          
    C2: BCD_counter
        port map (Clk => u_Clk, Direction => '1', Init => u_Reset, Enable => s2, Q_out => Q_out2);   
          
    process(u_clk, u_Enable)
      begin   
            --Try doing a falling edge u_enable detection when Q_out1 is 9 to try and make the stupid bcd counter to hold?  
            --FIXED by adding a detection for a event at u_Enable, so the code underneath will be executed again
      if (Q_out1 = "1001") and (u_Enable = '1') then --and (u_Enable = '1')
            s2 <= '1'; --when Q_out1 is at 9, it will set then Qout_2 to be enabled, therefore allowing it to increment by next cycle
                         --but this is still happening when the main Enable (which Qout_2 relies on) is set to 0
        else
            s2 <= '0';
        end if;        
    end process;
    Counter_Out <= Q_out2 & Q_out1;  
end architecture Structure;

    
--test the rest of the counter's function. --
--Also try and see whether we can reduce the reset time for the 10's digit from 2 clock cycles to 1 clock cycle--

--Also double clicking on the output bit on the way somehow shows u the actual diagram of component 0_0--
          -- 44 BCD that is 01000100 which is 64 + 4 = 68.   


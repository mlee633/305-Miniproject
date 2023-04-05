library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
 
entity seq_counter is
	port(Clk, Enable, Reset: in std_logic;
		Mode: in std_logic_vector(1 downto 0);
		Q: out std_logic_vector(4 downto 0));
end entity seq_counter;
 
architecture behaviour of seq_counter is
 
	type modeThree is array (0 to 6) of std_logic_vector(4 downto 0);
	constant modeArray : modeThree := ("00101","00010","01101","11110","11001","10000","10010");
 
begin
 
	process (Clk,Reset) is
		variable counter: unsigned(4 downto 0) := (others => '0');
		variable mCount: integer := 0;
		variable storemode : std_logic_vector(1 downto 0) := "00";
	begin
		if(Reset = '1') then
			case Mode is
				when "00" => counter := "00000";
				when "01" => counter := "01111";
				when "10" => counter := "00111" ; mCount := 0;
				when "11" => counter := "01101";
				when others => counter := "00000";
			end case;
 
		elsif rising_edge(Clk) then
				if (Enable = '1') then
					if(storemode /= Mode) then
						case Mode is
							when "00" => counter := "00000";
							when "01" => counter := to_unsigned(15, counter'length);
							when "10" => counter := to_unsigned(5, counter'length); mCount := 0;
							when "11" => counter := "01101";
							when others => counter := "00000";
						end case;
						storemode := Mode;
					else
						case Mode is
							when "00" => 
								if counter = 24 then
									counter := "00000";
								else
									counter := counter + 2;
								end if;
 
							when "01" => 
								if (counter = 0) then
									counter := "01111";
								else
									counter := counter - 1;
								end if;
							when "10" =>	
								if (mCount = modeArray'length-1) then
									mCount := 0;
									counter := unsigned(modeArray(mCount));
								else
									mCount := mCount +1;
									counter := unsigned(modeArray(mCount));
								end if;
							when "11" => counter:= "01101";
							when others => counter := "00000";
						end case;
 
					end if;
				end if;
 
		end if;
		Q <= std_logic_vector(counter);
	end process;
end architecture behaviour;
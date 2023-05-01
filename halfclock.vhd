LIBRARY IEEE;
USE  IEEE.STD_LOGIC_1164.all;
USE  IEEE.STD_LOGIC_ARITH.all;
USE  IEEE.STD_LOGIC_UNSIGNED.all;
entity halfclock is
	port(Clk: in std_logic;
			clkOut: out std_logic);
end entity;

architecture behave of halfclock is
signal v_Clk: std_logic;
begin

    PRESCALE_CLK: process(Clk) is 
    begin
        if rising_edge(Clk) then 
            v_Clk <= not v_Clk;
        end if;
    end process;
	clkOut<= v_Clk;
end architecture;

-- library ieee;
-- use ieee.std_logic_1164.all;
-- use ieee.numeric_std.all;
-- use ieee.math_real.all;

-- entity LFSR is 
-- 	port ( clk: in std_logic;
-- 				data_in: in std_logic_vector(9 downto 0);
-- 			Q, Qz: out std_logic);
-- end entity LFSR;

-- architecture b1 of LFSR is
-- 	Signal currentState, nextState: std_logic_vector(9 downto 0);
-- 	Signal feedback: std_logic;
-- begin
	
-- 	StateReg: process(clk, Reset) 
-- 	begin
		
		
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

entity FSM is
    port (
        clk,dead,start   : in std_logic;
        reset : in std_logic
        
        
    );
end entity FSM;

architecture rtl of FSM is
    type fsm_states is (Initial, Running, DeadState);
        signal currentState, nextState: fsm_states;
begin

    process (Clk)
    begin
        if rising_edge(clk) then
            if reset = '1' then
                currentState <= Initial;
            else
                currentState <= nextState;
            end if;
        end if;
    end process;

    next_State: process(currentState,reset,dead,start)
begin
end process;
end architecture;
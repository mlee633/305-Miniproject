library IEEE;
use IEEE.std_logic_1164.all;

entity testung is
    port (
        X : in std_logic;
        A, B,C : out std_logic
    );

end entity;

architecture rtl of testung is
    signal A1,B1,C1 : std_logic;
begin

    -- process
    -- begin
    --     A1 <= '0', '1' after 2 ns, '0' after 4 ns, '1' after 6 ns;
    --     B1 <= '1', '0' after 2 ns, '1' after 6 ns, '0' after 8 ns;

    --     wait for 10 ns;
    -- end process;
    -- A <= A1;
    -- B<= B1;

    -- C <= A1 or B1 when X = '1' else '0';
    process(current_state, input)
        variable next_state : std_logic;
    begin
        case (current_state) is
            when S0 =>
            if (input = '1') then
                next_state := S1;
            else
                next_state := S0;
            end if;
            when S1 =>
            if (input = '1') then
                next_state := S2;
            else
                next_state := S0;
            end if;
            when S2 =>
            if (input = '1') then
                next_state := S2;
            else
                next_state := S3;
            end if;
            when S3 =>
            if (input = '1') then
                next_state := S1;
            else
                next_state := S4;
            end if;
            when S4 =>
            if (input = '1') then
                next_state := S1;
            else
                next_state := S5;
            end if;
            when S5 =>
            if (input = '1') then
                next_state := S6;
            else
                next_state := S0;
            end if;
            when S6 =>
            if (input = '1') then
                next_state := S2;
            else
                next_state := S7;
            end if;
            when S7 =>
            output <= '1';
            if (input = '1') then
                next_state := S1;
            else
                next_state := S0;
            end if;
            when (others => next_state := S0) ;
        end case;
    end process;
end architecture;
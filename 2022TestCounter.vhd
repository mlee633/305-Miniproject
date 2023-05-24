library ieee;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;
entity 2022TestCounter is
    port (clk, enable, reset, mode : in std_logic;
        Q: out std_logic_vector(4 downto 0));
end entity;
architecture rtl of 2022TestCounter is

begin
process (clk)
    variable prev_mode: std_logic;
    variable v_Q: std_logic_vector(4 downto 0);

begin
    if (rising_edge(clk) and enable = '1') then
        if (reset = '1') then
            if (Mode = '0') then
                v_Q := '0';
            else
                v_Q := "11";
            end if;
        elsif (prev_mode /= mode) then
            if (mode = '0') then
                v_Q := '0';
            else
                v_Q := "11";
            end if;
        else
            if (mode = '0') then
                if (v_Q = 20) then
                    v_Q := '0';
                else
                    v_Q := v_Q + 1;
                end if;
            else
                if (v_Q = 25) then
                    v_Q:="11";
                else
                    v_Q := v_Q + 2;
                end if;
            end if;
        end if;
    end if;
Q <= v_Q;
prev_mode := mode;
end process;
    

end architecture;
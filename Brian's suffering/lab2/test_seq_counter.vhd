library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity test_seq_counter is port(clk, reset: in bit; count: out integer);
end entity test_seq_counter;

architecture behave of test_seq_counter is 
    component seq_counter is port(Clk: in std_logic;
                         Enable: in std_logic;
                         Reset: in std_logic;
                         Mode: in std_logic_vector(1 downto 0);
                         Q: out std_logic_vector(4 downto 0));
    end component;

    signal t_Clk, t_Enable, t_Reset: std_logic;
    signal t_Mode: std_logic_vector(1 downto 0);
    signal t_Q: std_logic_vector(4 downto 0);
begin

    DUT: seq_counter port map (Clk => t_Clk, Enable => t_Enable, Reset => t_Reset, Mode => t_Mode, Q => t_Q);

    init: process
    begin
        t_Enable <= '1', '0' after 50 ns,'1' after 80 ns, -- mode 0
    '0' after 320 ns, '1' after 380 ns, -- mode 1
    '0' after 650 ns, '1' after 700 ns, -- mode 2
    '0' after 930 ns, '1' after 970 ns; -- mode 3

    t_Reset <= '0', '1' after 123 ns, '0' after 124 ns, -- mode 0
    '1' after 453 ns, '0' after 454 ns, -- mode 1
    '1' after 626 ns, '0' after 627 ns, -- mode 2
    '1' after 913 ns, '0' after 914 ns; -- mode 3
        t_Mode <= "00", 
                  "01" after 310 ns,
                  "10" after 610 ns,
                  "11" after 900 ns;
        wait;
    end process;

    clock: process
    begin
        wait for 5 ns;
        t_Clk <= '1';
        wait for 5 ns;
        t_Clk <= '0';
    end process;

end behave;

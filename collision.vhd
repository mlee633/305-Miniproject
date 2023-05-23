library ieee;
use ieee.std_logic_1164.all;
USE  IEEE.STD_LOGIC_ARITH.all;
USE  IEEE.STD_LOGIC_SIGNED.all;
entity collision is
port (vert_sync, ball_on, pipe_on, enable  : in std_logic;
		ball_y_pos, size, gap_x_pos, pipeWidth, ball_x_pos, gap_y_pos, gapSize : in std_logic_vector(9 downto 0);
    collide : out std_logic);
end entity;

architecture rtl of collision is
signal collision, collided,reset : std_logic := '0';
begin
    process(vert_sync)
    begin
        if rising_edge(vert_sync) then
            --If the ball touches any pipe or the ceiling or bottom of screen, then will freeze. Can only move after pressing the reset button pb2. 
            if (ball_y_pos >= 450 + size) or (ball_y_pos <= 10-size) or  (((gap_x_pos - pipeWidth <= ball_x_pos) and (ball_x_pos<= gap_x_pos + pipeWidth) and not (( gap_y_pos - gapSize<=ball_y_pos) and (ball_y_pos <=gap_y_pos + gapSize)))) then
                collision <= '1';
            elsif enable = '1' then
                collision <= '0';
            else 
                collision <= '0';
            end if;
        end if;
    end process;
    --Setting a permanent state/signal which will be raised indefinitely if collision signal is detected. 
    Check: process(collision) 
    begin
        if rising_edge(collision) then
            collide <= '1';
        else
            collide <= '0';
        end if;
    end process Check; 

end architecture;
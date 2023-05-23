library ieee;
use ieee.std_logic_1164.all;
USE  IEEE.STD_LOGIC_ARITH.all;
USE  IEEE.STD_LOGIC_SIGNED.all;
entity collision is
port (vert_sync, ball_on, pipe_on, started  : in std_logic;
		ball_y_pos, size : in std_logic_vector(9 downto 0);
    collide : out std_logic);
end entity;

architecture rtl of collision is
signal collision, collided,reset : std_logic := '0';
begin
    collision <= '1' when (((ball_on = '1') and (pipe_on = '1')) or ((ball_y_pos >= 450 + size) or (ball_y_pos <= 10 - size)))and collided = '0' else '0' when reset = '1' else '1' when collided = '1' else '0';
    collided <= '1' when collision = '1' else '0';
    collide <= collision;
    process (vert_sync)
    begin
	 if rising_edge(vert_sync) and started = '1' then
        if collided = '1' then
            reset <= '1';
        else
            reset <= '0';
        end if;
    
       end if;

    end process;
    

end architecture;
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.all;
USE  IEEE.STD_LOGIC_ARITH.all;
USE  IEEE.STD_LOGIC_SIGNED.all;
entity pipe is
    port (
        clk,vert_sync, pb1,pb2   : in std_logic;
        pixel_row,pixel_column : in std_logic_vector(9 DOWNTO 0);
        red,green,blue : out std_logic
    );
end entity;

architecture behaviour of pipe is
    signal pipe_on : std_logic;
    signal size,pipe_y_pos,pipe_x_motion: std_logic_vector(9 DOWNTO 0);
    signal pipe_x_pos : std_logic_vector(10 DOWNTO 0);
begin
    size <= CONV_STD_LOGIC_VECTOR(8,10);
    pipe_y_pos <= CONV_STD_LOGIC_VECTOR(350,10);
    pipe_on <= '1' when ( ('0' & pipe_x_pos <= '0' & pixel_column + size) and ('0' & pixel_column<= '0' & pipe_x_pos + size) and ('0' & pipe_y_pos <= pixel_row + size) and ('0' & pixel_row <= pipe_y_pos + size)) else
        '0';
    red <= (not pb1) and (not pipe_on);
    green <= pipe_on;
    blue <= (not pb1) and (not pipe_on);
MOVE_PIPE: process (vert_sync)
begin
    if (rising_edge(vert_sync)) then
        if (('0' & pipe_x_pos >= CONV_STD_LOGIC_VECTOR(639,10) - size)) then
            pipe_x_motion <= -CONV_STD_LOGIC_VECTOR(2,10);
        elsif (pipe_x_pos <= size) then
            pipe_x_motion <= CONV_STD_LOGIC_VECTOR(2,10);
        end if;
        pipe_x_pos <= pipe_x_pos + pipe_x_motion;
    end if;
end process;
end architecture behaviour;
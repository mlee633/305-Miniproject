LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.all;
USE IEEE.STD_LOGIC_ARITH.all;
USE IEEE.STD_LOGIC_UNSIGNED.all;
LIBRARY altera_mf;
USE altera_mf.all;

entity text_setter is
    PORT
    (
        character_address     :    OUT STD_LOGIC_VECTOR (5 DOWNTO 0);
        pixel_row, pixel_col    :    IN STD_LOGIC_VECTOR (9 DOWNTO 4);
        lives : in integer;
        clock                               :     IN STD_LOGIC 
    );
end text_setter;

architecture behave of text_setter is

begin
	 
    process (clock) 
    begin
        --
        if(pixel_row= "00010") then
            if (pixel_col ="00010") then
                character_address <= "000110"; --F
            elsif (pixel_col ="00011") then
                character_address <= "001100"; --L
            elsif (pixel_col ="00100") then
                character_address <= "000001"; --A
            elsif (pixel_col ="00101") then
                character_address <= "010000"; --P
            elsif (pixel_col ="00111") then
                character_address <= "010000"; --P
            elsif (pixel_col ="01000") then
                character_address <= "000001"; --A
            else character_address <= "100000";
            end if;


        elsif (pixel_row="00100") then
            if (pixel_col = "00010") then
                character_address <= "001100"; -- L
            elsif (pixel_col = "00011") then
                character_address <= "001001"; -- I
            elsif (pixel_col = "00100") then
                character_address <= "010110"; -- V
            elsif (pixel_col = "00101") then
                character_address <= "000101"; -- E
            elsif (pixel_col = "00110") then
                character_address <= "010011"; -- S
            elsif (pixel_col = "00111") then
                character_address <= "101101"; -- 
            elsif (pixel_col = "01000") then

                character_address <= "110000" + CONV_STD_LOGIC_VECTOR(lives,5); --Displaying number of lives
            else
                character_address <= "100000";
            end if;
        else 
            character_address <= "100000";
        end if;
    end process;

end architecture;
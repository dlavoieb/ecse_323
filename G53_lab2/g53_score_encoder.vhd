--
library ieee;
use ieee.std_logic_1164.all;

entity g53_score_encoder is
port (score_code : out std_logic_vector(3 downto 0); 
		num_exact_matches : in std_logic_vector(2 downto 0);
		num_color_matches : in std_logic_vector(2 downto 0));
end g53_score_encoder;

architecture implementation of g53_score_encoder is
signal combined : std_logic_vector(5 downto 0);
begin
	process (num_color_matches, num_exact_matches)
	begin
		case (num_exact_matches & num_color_matches) is
			when "100000" => score_code <= "1110";
			when "011000" => score_code <= "1101";
			when "010000" => score_code <= "1100";
			when "010001" => score_code <= "1011";
			when "010010" => score_code <= "1010";
			when "001000" => score_code <= "1001";
			when "001001" => score_code <= "0111";
			when "001010" => score_code <= "0110";
			when "001011" => score_code <= "0101";
			when "000000" => score_code <= "0100";
			when "000001" => score_code <= "0011";
			when "000010" => score_code <= "0010";
			when "000011" => score_code <= "0001";
			when "000100" => score_code <= "0000";
			when others => score_code <= "UUUU";
		end case;
	end process;
end implementation;
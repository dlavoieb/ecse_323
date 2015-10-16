--
library ieee;
use ieee.std_logic_1164.all;

entity g53_mastermind_score is
port ( P1, P2, P3, P4    : in std_logic_vector(2 downto 0); 
       G1, G2, G3, G4    : in std_logic_vector(2 downto 0); 
		 exact_match_score : out std_logic_vector(2 downto 0); 
		 color_match_score : out std_logic_vector(2 downto 0); 
		 score_code : out std_logic_vector(3 downto 0)); 
end g53_mastermind_score;

architecture implementation of g53_mastermind_score is 
component g53_color_matches 
port (P1, P2, P3, P4,
		G1, G2, G3, G4  : in std_logic_vector (2 downto 0);
		num_exact_matches,
		num_color_matches : out std_logic_vector(2 downto 0));
end component;

component g53_score_encoder
port (score_code : out std_logic_vector(3 downto 0); 
		num_exact_matches : in std_logic_vector(2 downto 0);
		num_color_matches : in std_logic_vector(2 downto 0));
end component;

signal internal_exact_match_score, internal_color_match_score : std_logic_vector (2 downto 0);

begin
col_match: g53_color_matches 
	port map (
		P1=>P1, P2=>P2, P3=>P3, P4=>P4, G1=>G1, G2=>G2, G3=>G3, G4=>G4, 
		num_exact_matches=>internal_exact_match_score, num_color_matches=> internal_color_match_score);
		
encoder: g53_score_encoder
	port map(
		num_exact_matches=>internal_exact_match_score, num_color_matches=>internal_color_match_score,
		score_code=>score_code);
		
exact_match_score <= internal_exact_match_score;
color_match_score <= internal_color_match_score;
end implementation;
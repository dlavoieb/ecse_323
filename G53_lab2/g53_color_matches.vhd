library ieee;
use ieee.std_logic_1164.all;
library lpm;
use lpm.lpm_components.all;

entity g53_color_matches is 
port (P1, P2, P3, P4,
		G1, G2, G3, G4  : in std_logic_vector (2 downto 0);
		num_exact_matches,
		num_color_matches : out std_logic_vector(2 downto 0));
end g53_color_matches;

architecture implementation of g53_color_matches is 

component g53_minimum3
port (N,M	: in std_logic_vector (2 downto 0);
		min	: out std_logic_vector (2 downto 0));
end component;

component g53_nCols

port(	P4, P3, P2, P1 : in std_logic_vector (2 downto 0);
		N6, N5, N4, N3, N2, N1 : out std_logic_vector (2 downto 0));
end component;

component g53_num_matches 
	port( P1, P2, P3, P4 : in std_logic_vector(2 downto 0);
			G1, G2, G3, G4 : in std_logic_vector(2 downto 0);
			N : out std_logic_vector(2 downto 0));
end component;

signal np1, ng1, min1 : std_logic_vector (2 downto 0);
signal np2, ng2, min2 : std_logic_vector (2 downto 0);
signal np3, ng3, min3 : std_logic_vector (2 downto 0);
signal np4, ng4, min4 : std_logic_vector (2 downto 0);
signal np5, ng5, min5 : std_logic_vector (2 downto 0);
signal np6, ng6, min6 : std_logic_vector (2 downto 0);
signal partial_sum1, partial_sum2, partial_sum3, partial_sum4, full_sum : std_logic_vector(2 downto 0);
signal temp_num_exact_matches : std_logic_vector(2 downto 0);

begin
-- get num exact matches
exact : g53_num_matches port map(P1=>P1, P2=>P2, P3=>P3, P4=>P4, G1=>G1, G2=>G2, G3=>G3, G4=>G4, N=>temp_num_exact_matches);

-- produce the nps
np_gate : g53_nCols port map(P4=>P4, P3=>P3, P2=>P2, P1=>P1, N6=>np6, N5=>np5, N4=>np4, N3=>np3, N2=>np2, N1=>np1);

-- produce the ngs
ng_gate : g53_nCols port map(P4=>G4, P3=>G3, P2=>G2, P1=>G1, N6=>ng6, N5=>ng5, N4=>ng4, N3=>ng3, N2=>ng2, N1=>ng1);

-- get terms of the sum
min_gate1 : g53_minimum3 port map(N=>np1, M=>ng1, min=>min1);
min_gate2 : g53_minimum3 port map(N=>np2, M=>ng2, min=>min2);
min_gate3 : g53_minimum3 port map(N=>np3, M=>ng3, min=>min3);
min_gate4 : g53_minimum3 port map(N=>np4, M=>ng4, min=>min4);
min_gate5 : g53_minimum3 port map(N=>np5, M=>ng5, min=>min5);
min_gate6 : g53_minimum3 port map(N=>np6, M=>ng6, min=>min6);

-- perform the sum
sum1 : lpm_add_sub generic map(LPM_WIDTH=>3) port map(dataa=>min1, 		   datab=>min2, result=>partial_sum1);
sum2 : lpm_add_sub generic map(LPM_WIDTH=>3) port map(dataa=>partial_sum1, datab=>min3, result=>partial_sum2);
sum3 : lpm_add_sub generic map(LPM_WIDTH=>3) port map(dataa=>partial_sum2, datab=>min4, result=>partial_sum3);
sum4 : lpm_add_sub generic map(LPM_WIDTH=>3) port map(dataa=>partial_sum3, datab=>min5, result=>partial_sum4);
sum5 : lpm_add_sub generic map(LPM_WIDTH=>3) port map(dataa=>partial_sum4, datab=>min6, result=>full_sum);

-- subtract ne
sub1 : lpm_add_sub generic map(LPM_WIDTH=>3) port map(add_sub=>'0', dataa=>full_sum, datab=>temp_num_exact_matches, result=>num_color_matches);

num_exact_matches<=temp_num_exact_matches;

end implementation;

-- g53_num_matches

library ieee;
use ieee.std_logic_1164.all;

entity g53_num_matches is
	port( P1, P2, P3, P4 : in std_logic_vector(2 downto 0);
			G1, G2, G3, G4 : in std_logic_vector(2 downto 0);
			N : out std_logic_vector(2 downto 0)
	);
end g53_num_matches;

architecture implementation of g53_num_matches is

component g53_num1s
port(
		X: in std_logic_vector (3 downto 0);
		num1s : out std_logic_vector (2 downto 0)
	);
end component;

component G53_comp6
	PORT
	(
		A :  IN  STD_LOGIC_VECTOR(5 DOWNTO 0);
		B :  IN  STD_LOGIC_VECTOR(5 DOWNTO 0);
		AeqB :  OUT  STD_LOGIC
	);
end component;

signal comp : std_logic_vector (3 downto 0);
signal large_p1, large_p2, large_p3, large_p4 : std_logic_vector(5 downto 0);
signal large_g1, large_g2, large_g3, large_g4 : std_logic_vector(5 downto 0);
begin

large_p1 <= "000"&P1;
large_p2 <= "000"&P2;
large_p3 <= "000"&P3;
large_p4 <= "000"&P4;

large_g1 <= "000"&G1;
large_g2 <= "000"&G2;
large_g3 <= "000"&G3;
large_g4 <= "000"&G4;

-- comparator
C1 : g53_comp6 port map (A=>large_p1, B=>large_g1, AeqB=>comp(0));
C2 : g53_comp6 port map (A=>large_p2, B=>large_g2, AeqB=>comp(1));
C3 : g53_comp6 port map (A=>large_p3, B=>large_g3, AeqB=>comp(2));
C4 : g53_comp6 port map (A=>large_p4, B=>large_g4, AeqB=>comp(3));

-- count the number of matches
num_matches : g53_num1s port map (X => comp, num1s => N);

end implementation;
library lpm;
use lpm.lpm_components.all;
library ieee;
use ieee.std_logic_1164.all;

entity g53_minimum3 is

port (N,M	: in std_logic_vector (2 downto 0);
		min	: out std_logic_vector (2 downto 0));
end g53_minimum3;


architecture implementation of g53_minimum3 is 

component g53_gt3 
port (A,B : in std_logic_vector(2 downto 0);
		AgtB: out std_logic);
end component;

component G53_comp6
	PORT
	(A,B :  IN  STD_LOGIC_VECTOR(5 DOWNTO 0);
		AeqB :  OUT  STD_LOGIC);
end component;

signal NltM, NeqM, NgtM : std_logic;
signal largeN, largeM : std_logic_vector (5 downto 0);
begin 
largeM <= "000"&M;
largeN <= "000"&N;

eg : G53_comp6 port map (A=>largeN, B=>largeM, AeqB=>NeqM);
gt : G53_gt3 port map (A=>N, B=>M, AgtB=>NgtM);

NltM <= not (NeqM or NgtM);

with NltM select
	min <=  N when '1',
			M when '0',
			"000" when others;

end implementation;
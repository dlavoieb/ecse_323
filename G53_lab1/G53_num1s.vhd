-- Group 53 number of ones counter
-- David Lavoie-Boutin
-- Junyoung Shin

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;

entity g53_num1s is
	port(
		X: in std_logic_vector (3 downto 0);
		num1s : out std_logic_vector (2 downto 0)
	);
end g53_num1s;

architecture g53_num1s_impl of g53_num1s is

signal sum0 : std_logic;
signal sum1 : std_logic;
signal sum2 : std_logic;

begin

num1s(0) <= (not X(3) and not X(2) and not X(1) and X(0)) or
				(X(3) and not X(2) and not X(1) and not X(0)) or
				(not X(3) and X(2) and not X(1) and not X(0)) or
				(not X(3) and not X(2) and X(1) and not X(0)) or
				
				(not X(3) and  X(2) and  X(1) and  X(0)) or
				( X(3) and  X(2) and not X(1) and  X(0)) or
				( X(3) and  X(2) and  X(1) and not X(0)) or
				( X(3) and not X(2) and  X(1) and  X(0));

num1s(1) <= (X(2) and not X(1) and X(0)) or
				(X(3) and not X(2) and  X(0)) or
				(X(3) and not X(2) and X(1)) or
				(X(3) and X(2) and not X(0)) or
				(not X(3) and X(2) and X(1)) or
				(not X(3) and X(1) and X(0));
				
num1s(2) <= (X(3) and X(2) and X(1) and X(0));

end g53_num1s_impl;


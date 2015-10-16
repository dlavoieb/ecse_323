library ieee;
use ieee.std_logic_1164.all;
LIBRARY lpm;
use lpm.lpm_components.all;


entity g53_nCols is
port(	P4, P3, P2, P1 : in std_logic_vector (2 downto 0);
		eq_out : out std_logic_vector (7 downto 0);
		N6, N5, N4, N3, N2, N1 : out std_logic_vector (2 downto 0));
end g53_nCols;

architecture implementation of g53_nCols is

component g53_num1s
port(
		X: in std_logic_vector (3 downto 0);
		num1s : out std_logic_vector (2 downto 0)
	);
end component;

signal eq1 : std_logic_vector (7 downto 0);
signal eq2 : std_logic_vector (7 downto 0);
signal eq3 : std_logic_vector (7 downto 0);
signal eq4 : std_logic_vector (7 downto 0);

signal color_A : std_logic_vector (3 downto 0);
signal color_B : std_logic_vector (3 downto 0);
signal color_C : std_logic_vector (3 downto 0);
signal color_D : std_logic_vector (3 downto 0);
signal color_E : std_logic_vector (3 downto 0);
signal color_F : std_logic_vector (3 downto 0);

begin
decode1 : lpm_decode 
	generic map(LPM_WIDTH=>3, LPM_DECODES=> 8)
	port map(data=>P1, eq=>eq1);
	
decode2 : lpm_decode 
	generic map(LPM_WIDTH=>3, LPM_DECODES=> 8)
	port map(data=>P2, eq=>eq2);
	
decode3 : lpm_decode 
	generic map(LPM_WIDTH=>3, LPM_DECODES=> 8)
	port map(data=>P3, eq=>eq3);
	
decode4 : lpm_decode 
	generic map(LPM_WIDTH=>3, LPM_DECODES=> 8)
	port map(data=>P4, eq=>eq4);

color_A<= eq1(0) & eq2(0) & eq3(0) & eq4(0);
color_B<= eq1(1) & eq2(1) & eq3(1) & eq4(1);
color_C<= eq1(2) & eq2(2) & eq3(2) & eq4(2);
color_D<= eq1(3) & eq2(3) & eq3(3) & eq4(3);
color_E<= eq1(4) & eq2(4) & eq3(4) & eq4(4);
color_F<= eq1(5) & eq2(5) & eq3(5) & eq4(5);

col1: g53_num1s port map (X=>color_A ,num1s=>N1);
col2: g53_num1s port map (X=>color_B ,num1s=>N2);
col3: g53_num1s port map (X=>color_C ,num1s=>N3);
col4: g53_num1s port map (X=>color_D ,num1s=>N4);
col5: g53_num1s port map (X=>color_E ,num1s=>N5);
col6: g53_num1s port map (X=>color_F ,num1s=>N6);
eq_out<=eq1;

end implementation;
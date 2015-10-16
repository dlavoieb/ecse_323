LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                
USE ieee.numeric_std.all; --added to the template   

ENTITY g53_score_encoder_vhd_tst IS
END g53_score_encoder_vhd_tst;
ARCHITECTURE g53_score_encoder_arch OF g53_score_encoder_vhd_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL num_color_matches : STD_LOGIC_VECTOR(2 DOWNTO 0);
SIGNAL num_exact_matches : STD_LOGIC_VECTOR(2 DOWNTO 0);
SIGNAL score_code : STD_LOGIC_VECTOR(3 DOWNTO 0);
COMPONENT g53_score_encoder
	PORT (
	num_color_matches : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
	num_exact_matches : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
	score_code : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
	);
END COMPONENT;
BEGIN
	i1 : g53_score_encoder
	PORT MAP (
-- list connections between master ports and signals
	num_color_matches => num_color_matches,
	num_exact_matches => num_exact_matches,
	score_code => score_code
	);                                           
always : PROCESS                                     
BEGIN                                                         
	for i in 0 to 7 loop
		num_color_matches<=std_logic_vector(to_unsigned(i,3));
		for j in 0 to 7 loop
			num_exact_matches<=std_logic_vector(to_unsigned(j,3));
			wait for 5 ns;
		end loop;
	end loop;
WAIT;                                                        
END PROCESS always;                                          
END g53_score_encoder_arch;

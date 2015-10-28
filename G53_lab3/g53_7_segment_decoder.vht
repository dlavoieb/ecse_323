LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;   
USE ieee.numeric_std.all; --added to the template                                   

ENTITY g53_7_segment_decoder_vhd_tst IS
END g53_7_segment_decoder_vhd_tst;
ARCHITECTURE g53_7_segment_decoder_arch OF g53_7_segment_decoder_vhd_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL code : STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL RippleBlank_In : STD_LOGIC;
SIGNAL RippleBlank_Out : STD_LOGIC;
SIGNAL segments : STD_LOGIC_VECTOR(6 DOWNTO 0);
COMPONENT g53_7_segment_decoder
	PORT (
	code : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
	RippleBlank_In : IN STD_LOGIC;
	RippleBlank_Out : OUT STD_LOGIC;
	segments : OUT STD_LOGIC_VECTOR(6 DOWNTO 0)
	);
END COMPONENT;
BEGIN
	i1 : g53_7_segment_decoder
	PORT MAP (
-- list connections between master ports and signals
	code => code,
	RippleBlank_In => RippleBlank_In,
	RippleBlank_Out => RippleBlank_Out,
	segments => segments
	);	
always : PROCESS                                              
BEGIN      
	RippleBlank_In <= '0';                                                   
	code_case : for i in 0 to 15 loop
		code <= std_logic_vector(to_unsigned(i,4));
		wait for 10 ns;
	end loop ; -- code_case

	RippleBlank_In <= '1';                                                   
	code_2 : for i in 0 to 15 loop
		code <= std_logic_vector(to_unsigned(i,4));
		wait for 10 ns;
	end loop ; -- code_2

WAIT;                                                        
END PROCESS always;                                          
END g53_7_segment_decoder_arch;

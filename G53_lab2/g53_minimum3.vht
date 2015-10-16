LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                
USE ieee.numeric_std.all; --added to the template         

ENTITY g53_minimum3_vhd_tst IS
END g53_minimum3_vhd_tst;
ARCHITECTURE g53_minimum3_arch OF g53_minimum3_vhd_tst IS
                                              
SIGNAL M : STD_LOGIC_VECTOR(2 DOWNTO 0);
SIGNAL min : STD_LOGIC_VECTOR(2 DOWNTO 0);
SIGNAL N : STD_LOGIC_VECTOR(2 DOWNTO 0);

COMPONENT g53_minimum3
	PORT (
	M : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
	min : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
	N : IN STD_LOGIC_VECTOR(2 DOWNTO 0)	
	);
END COMPONENT;
BEGIN
	i1 : g53_minimum3
	PORT MAP (
-- list connections between master ports and signals
	M => M,
	min => min,
	N => N
	);

PROCESS             
                 
BEGIN                                                         
for i in 0 to 7 loop
	N <= std_logic_vector(to_unsigned(i,3));
	for j in 0 to 7 loop
		M <= std_logic_vector(to_unsigned(j,3));
		wait for 10 ns;
	end loop;
end loop;   
  
WAIT;                                                        
END PROCESS;
                                       
END g53_minimum3_arch;

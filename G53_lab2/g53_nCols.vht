LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                
USE ieee.numeric_std.all; --added to the template  

ENTITY g53_nCols_vhd_tst IS
END g53_nCols_vhd_tst;
ARCHITECTURE g53_nCols_arch OF g53_nCols_vhd_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL N1 : STD_LOGIC_VECTOR(2 DOWNTO 0);
SIGNAL N2 : STD_LOGIC_VECTOR(2 DOWNTO 0);
SIGNAL N3 : STD_LOGIC_VECTOR(2 DOWNTO 0);
SIGNAL N4 : STD_LOGIC_VECTOR(2 DOWNTO 0);
SIGNAL N5 : STD_LOGIC_VECTOR(2 DOWNTO 0);
SIGNAL N6 : STD_LOGIC_VECTOR(2 DOWNTO 0);
SIGNAL P1 : STD_LOGIC_VECTOR(2 DOWNTO 0);
SIGNAL P2 : STD_LOGIC_VECTOR(2 DOWNTO 0);
SIGNAL P3 : STD_LOGIC_VECTOR(2 DOWNTO 0);
SIGNAL P4 : STD_LOGIC_VECTOR(2 DOWNTO 0);
COMPONENT g53_nCols
	PORT (
	N1 : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
	N2 : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
	N3 : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
	N4 : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
	N5 : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
	N6 : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
	P1 : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
	P2 : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
	P3 : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
	P4 : IN STD_LOGIC_VECTOR(2 DOWNTO 0)
	);
END COMPONENT;
BEGIN
	i1 : g53_nCols
	PORT MAP (
-- list connections between master ports and signals
	N1 => N1,
	N2 => N2,
	N3 => N3,
	N4 => N4,
	N5 => N5,
	N6 => N6,
	P1 => P1,
	P2 => P2,
	P3 => P3,
	P4 => P4
	);
	                                       

run: process
begin
	P1<="000";  
	P2<="000";  
	P3<="000";  
	P4<="000";                                 
WAIT for 10 ns;                                              
	P1<="000";  
	P2<="100";  
	P3<="011";  
	P4<="011";                                 
WAIT for 10 ns;                                              
	P1<="000";  
	P2<="010";  
	P3<="001";  
	P4<="010";                                 
WAIT for 10 ns;                                              
WAIT;
end process run;

END g53_nCols_arch;

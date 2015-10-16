LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY g53_mastermind_score_vhd_tst IS
END g53_mastermind_score_vhd_tst;
ARCHITECTURE g53_mastermind_score_arch OF g53_mastermind_score_vhd_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL color_match_score : STD_LOGIC_VECTOR(2 DOWNTO 0);
SIGNAL exact_match_score : STD_LOGIC_VECTOR(2 DOWNTO 0);
SIGNAL G1 : STD_LOGIC_VECTOR(2 DOWNTO 0);
SIGNAL G2 : STD_LOGIC_VECTOR(2 DOWNTO 0);
SIGNAL G3 : STD_LOGIC_VECTOR(2 DOWNTO 0);
SIGNAL G4 : STD_LOGIC_VECTOR(2 DOWNTO 0);
SIGNAL P1 : STD_LOGIC_VECTOR(2 DOWNTO 0);
SIGNAL P2 : STD_LOGIC_VECTOR(2 DOWNTO 0);
SIGNAL P3 : STD_LOGIC_VECTOR(2 DOWNTO 0);
SIGNAL P4 : STD_LOGIC_VECTOR(2 DOWNTO 0);
SIGNAL score_code : STD_LOGIC_VECTOR(3 DOWNTO 0);
COMPONENT g53_mastermind_score
	PORT (
	color_match_score : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
	exact_match_score : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
	G1 : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
	G2 : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
	G3 : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
	G4 : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
	P1 : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
	P2 : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
	P3 : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
	P4 : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
	score_code : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
	);
END COMPONENT;
BEGIN
	i1 : g53_mastermind_score
	PORT MAP (
-- list connections between master ports and signals
	color_match_score => color_match_score,
	exact_match_score => exact_match_score,
	G1 => G1,
	G2 => G2,
	G3 => G3,
	G4 => G4,
	P1 => P1,
	P2 => P2,
	P3 => P3,
	P4 => P4,
	score_code => score_code
	);

always : PROCESS                                              
BEGIN                                                         
P1<= "000";
P2<= "001";
P3<= "010";
P4<= "011";
                                                         
G1<= "000";
G2<= "001";
G3<= "010";
G4<= "011";

wait for 10 ns;

                                               
P1<= "000";
P2<= "000";
P3<= "001";
P4<= "001";
                                                         
G1<= "000";
G2<= "001";
G3<= "010";
G4<= "011";

wait for 10 ns;

                                               
P1<= "010";
P2<= "011";
P3<= "010";
P4<= "011";
                                                         
G1<= "011";
G2<= "010";
G3<= "011";
G4<= "010";

wait for 10 ns;

                                            
P1<= "000";
P2<= "001";
P3<= "010";
P4<= "100";
                                                         
G1<= "100";
G2<= "101";
G3<= "101";
G4<= "101";

wait for 10 ns;

                                               
P1<= "100";
P2<= "101";
P3<= "000";
P4<= "001";
                                                         
G1<= "010";
G2<= "011";
G3<= "010";
G4<= "011";

wait for 10 ns;

                                               
P1<= "000";
P2<= "000";
P3<= "001";
P4<= "001";
                                                         
G1<= "010";
G2<= "011";
G3<= "010";
G4<= "011";

wait for 10 ns;
                                               
P1<= "000";
P2<= "001";
P3<= "100";
P4<= "101";
                                                         
G1<= "000";
G2<= "011";
G3<= "100";
G4<= "101";

wait for 10 ns;

                                               
P1<= "000";
P2<= "001";
P3<= "001";
P4<= "010";
                                                         
G1<= "000";
G2<= "010";
G3<= "001";
G4<= "100";

wait for 10 ns;

WAIT;                                                        
END PROCESS always;                                          
END g53_mastermind_score_arch;

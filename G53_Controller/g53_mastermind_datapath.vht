LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY g53_mastermind_datapath_vhd_tst IS
END g53_mastermind_datapath_vhd_tst;
ARCHITECTURE g53_mastermind_datapath_arch OF g53_mastermind_datapath_vhd_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL AD_LD : STD_LOGIC;
SIGNAL AD_SEL : STD_LOGIC;
SIGNAL CLK : STD_LOGIC := '0';
SIGNAL EXT_PATTERN : STD_LOGIC_VECTOR(11 DOWNTO 0);
SIGNAL GR_LD : STD_LOGIC;
SIGNAL GR_SEL : STD_LOGIC;
SIGNAL P_SEL : STD_LOGIC;
SIGNAL SC_CMP : STD_LOGIC;
SIGNAL SR_LD : STD_LOGIC;
SIGNAL SR_SEL : STD_LOGIC;
SIGNAL TC_EN : STD_LOGIC;
SIGNAL TC_LAST : STD_LOGIC;
SIGNAL TC_RST : STD_LOGIC;
SIGNAL TM_EN : STD_LOGIC;
SIGNAL TM_IN : STD_LOGIC;
SIGNAL TM_OUT : STD_LOGIC;
COMPONENT g53_mastermind_datapath
	PORT (
	AD_LD : IN STD_LOGIC;
	AD_SEL : IN STD_LOGIC;
	CLK : IN STD_LOGIC;
	EXT_PATTERN : IN STD_LOGIC_VECTOR(11 DOWNTO 0);
	GR_LD : IN STD_LOGIC;
	GR_SEL : IN STD_LOGIC;
	P_SEL : IN STD_LOGIC;
	SC_CMP : OUT STD_LOGIC;
	SR_LD : IN STD_LOGIC;
	SR_SEL : IN STD_LOGIC;
	TC_EN : IN STD_LOGIC;
	TC_LAST : OUT STD_LOGIC;
	TC_RST : IN STD_LOGIC;
	TM_EN : IN STD_LOGIC;
	TM_IN : IN STD_LOGIC;
	TM_OUT : OUT STD_LOGIC
	);
END COMPONENT;
BEGIN
	i1 : g53_mastermind_datapath
	PORT MAP (
-- list connections between master ports and signals
	AD_LD => AD_LD,
	AD_SEL => AD_SEL,
	CLK => CLK,
	EXT_PATTERN => EXT_PATTERN,
	GR_LD => GR_LD,
	GR_SEL => GR_SEL,
	P_SEL => P_SEL,
	SC_CMP => SC_CMP,
	SR_LD => SR_LD,
	SR_SEL => SR_SEL,
	TC_EN => TC_EN,
	TC_LAST => TC_LAST,
	TC_RST => TC_RST,
	TM_EN => TM_EN,
	TM_IN => TM_IN,
	TM_OUT => TM_OUT
	);

    CLK <= not CLK after 10 ns;
init : PROCESS                                               
-- variable declarations                                     
BEGIN                                                        

        -- compare external pattern to guess (0011) and check score against (4,0)
        TC_EN <= '1';
        TC_RST <= '1';
        AD_SEL <= '0';
        GR_SEL <= '1';
        P_SEL <= '0';
        GR_LD <= '1';
        SR_LD <= '1';
        SR_SEL <= '0';
        -- first if external pattern is (0011)
        EXT_PATTERN <= "000000001001";
        wait for 40 ns;
        -- next try with different external pattern
        EXT_PATTERN <= "000000001011";
        wait for 30 ns;
        GR_LD <= '0';
        SR_LD <= '0';
        TC_RST <= '0';
        P_SEL <= '1';
        SR_SEL <= '1';
WAIT;                                                       
END PROCESS init;                                           
                                
END g53_mastermind_datapath_arch;

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY g53_mastermind_controller_vhd_tst IS
END g53_mastermind_controller_vhd_tst;

ARCHITECTURE arch OF g53_mastermind_controller_vhd_tst IS
    -- constants                                                 
    -- signals                                                   
    SIGNAL AD_SEL : STD_LOGIC;
    SIGNAL AR_LD : STD_LOGIC;
    SIGNAL clk : STD_LOGIC := '0';
    SIGNAL GR_LD : STD_LOGIC;
    SIGNAL GR_SEL : STD_LOGIC;
    SIGNAL P_SEL : STD_LOGIC;
    SIGNAL READY : STD_LOGIC;
    SIGNAL SC_CMP : STD_LOGIC;
    SIGNAL SOLVED : STD_LOGIC;
    SIGNAL SR_LD : STD_LOGIC;
    SIGNAL SR_SEL : STD_LOGIC;
    SIGNAL START : STD_LOGIC;
    SIGNAL TC_EN : STD_LOGIC;
    SIGNAL TC_LAST : STD_LOGIC;
    SIGNAL TC_RST : STD_LOGIC;
    SIGNAL TM_EN : STD_LOGIC;
    SIGNAL TM_IN : STD_LOGIC;
    SIGNAL TM_OUT : STD_LOGIC;
    SIGNAL next_state : STD_LOGIC_VECTOR(3 DOWNTO 0);
    COMPONENT g53_mastermind_controller
        PORT (
        AD_SEL : OUT STD_LOGIC;
        AR_LD : OUT STD_LOGIC;
        clk : IN STD_LOGIC;
        GR_LD : OUT STD_LOGIC;
        GR_SEL : OUT STD_LOGIC;
        P_SEL : OUT STD_LOGIC;
        READY : IN STD_LOGIC;
        SC_CMP : IN STD_LOGIC;
        SOLVED : OUT STD_LOGIC;
        SR_LD : OUT STD_LOGIC;
        SR_SEL : OUT STD_LOGIC;
        START : IN STD_LOGIC;
        TC_EN : OUT STD_LOGIC;
        TC_LAST : IN STD_LOGIC;
        TC_RST : OUT STD_LOGIC;
        TM_EN : OUT STD_LOGIC;
        TM_IN : OUT STD_LOGIC;
        TM_OUT : IN STD_LOGIC;
        debug : OUT std_logic_vector(3 downto 0)
        );
    END COMPONENT;
BEGIN
    i1 : g53_mastermind_controller 
    PORT MAP ( AD_SEL => AD_SEL, AR_LD => AR_LD, clk => clk, GR_LD => GR_LD, 
        GR_SEL => GR_SEL, P_SEL => P_SEL, READY => READY, SC_CMP => SC_CMP, 
        SOLVED => SOLVED, SR_LD => SR_LD, SR_SEL => SR_SEL, START => START,
        TC_EN => TC_EN, TC_LAST => TC_LAST, TC_RST => TC_RST, TM_EN => TM_EN,
        TM_IN => TM_IN, TM_OUT => TM_OUT, debug => next_state );

    clk <= not clk after 10 ns;
    test_fsm : process
    begin

        READY <= '0';
        SC_CMP <= '0';
        START <= '0';
        TC_LAST <= '0';
        TM_OUT <= '0';

        wait for 40 ns;
        TC_LAST <= '1';
        wait for 30 ns;
        READY <= '1';
        wait for 30 ns;
        SC_CMP <= '1';
        wait for 30 ns;
        START <= '1';



        WAIT;
    end process ; -- test_fsm                               
END arch;

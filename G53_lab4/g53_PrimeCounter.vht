LIBRARY ieee;     
USE ieee.std_logic_1164.all;                                

ENTITY g53_PrimeCounter_vhd_tst IS
END g53_PrimeCounter_vhd_tst;

ARCHITECTURE g53_PrimeCounter_arch OF g53_PrimeCounter_vhd_tst IS
    SIGNAL CLK : STD_LOGIC := '0';
    SIGNAL cnt : STD_LOGIC_VECTOR(7 DOWNTO 0);
    SIGNAL mode : STD_LOGIC_VECTOR(1 DOWNTO 0);
    SIGNAL TC_EN : STD_LOGIC;
    COMPONENT g53_PrimeCounter
        PORT (
        CLK : IN STD_LOGIC;
        cnt : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
        mode : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
        TC_EN : IN STD_LOGIC
        );
    END COMPONENT;
BEGIN
    i1 : g53_PrimeCounter 
    PORT MAP ( CLK => CLK, cnt => cnt, mode => mode, TC_EN => TC_EN);
    
    init : PROCESS     
    BEGIN 
            -- code that executes only once                      
            TC_EN <= '1';
            mode <= "00";
            wait for 520 ns;
            mode <= "01";
            wait for 210 ns;
            mode <= "10";
    WAIT;
    END PROCESS init; 

    CLK <= not CLK after 10 ns;

END g53_PrimeCounter_arch;

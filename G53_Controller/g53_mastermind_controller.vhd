library ieee;
use ieee.std_logic_1164.all;
library altera;
use altera.altera_primitives_components.all;

entity g53_mastermind_controller is
  port (
    clk : in std_logic;
    READY, START, SC_CMP, TC_LAST, TM_OUT : in std_logic;
    GR_SEL, GR_LD, P_SEL, SR_LD, 
    SR_SEL, TM_IN, TM_EN ,TC_EN, 
    TC_RST, AD_SEL, AR_LD, SOLVED : out std_logic
  ) ;
end entity ; -- g53_mastermind_controller


architecture arch of g53_mastermind_controller is

    type States is (init, clear, guess, guess_wait, cmp40, slvd, slv_wait, 
        read_location, cmp_reg, wr0, wr1);
    signal state : States;

    signal gr_sel_int : std_logic;

begin
    gr_sel_ff : DFF port map (d => gr_sel_int, clk => clk, q => gr_sel_int, clrn => '0', prn => '0');

    fsm : process( CLK )
    begin
        if rising_edge(CLK) then
            case( state ) is
            
                when init =>
                    if TC_LAST = '0' then
                        state <= clear;

                    elsif TC_LAST = '1' then
                        state <= init;
                    end if ;
                    GR_LD <= '0';
                    SR_LD <= '0';
                    TM_IN <= '1';
                    TM_EN  <= '1';
                    TC_EN <= '1';
                    TC_RST <= '1';
                    AD_SEL <= '0';
                    AR_LD <= '0';
                    SOLVED  <= '0';

                when clear =>
                    if TC_LAST = '0' then
                        state <= clear;
                        TM_IN <= '1';
                        TM_EN  <= '1';
                        TC_EN <= '1';
                        TC_RST <= '0';
                        AD_SEL <= '0';
                        AR_LD <= '0';
                        SOLVED  <= '0';
                        
                    elsif TC_LAST = '1' then
                        state <= guess;
                        GR_SEL <= '1';
                        GR_LD <= '1';
                        P_SEL <= '0';
                        SR_LD <= '1';
                        SR_SEL <= '1';
                        TM_IN <= '0';
                        TM_EN  <= '0';
                        TC_EN <= '1';
                        TC_RST <= '1';
                        AD_SEL <= '1';
                        AR_LD <= '0';
                        SOLVED  <= '0';
                    end if ;

                when guess =>
                    if READY = '0' then
                        state <= guess_wait;
                    elsif READY = '1' then
                        state <= guess;
                    end if ;
                    --GR_SEL <= ''; -- <-- this one needs figuring out
                    GR_LD <= '1';
                    P_SEL <= '0';
                    SR_LD <= '1';
                    SR_SEL <= '1';
                    TM_IN <= '0';
                    TM_EN  <= '0';
                    TC_EN <= '1';
                    TC_RST <= '1';
                    AD_SEL <= '1';
                    AR_LD <= '0';
                    SOLVED  <= '0';

                when guess_wait =>
                    if READY = '0' then
                        state <= guess_wait;
                        SR_LD <= '1';
                    elsif READY = '1' then
                        state <= cmp40;
                        SR_LD <= '0';
                    end if ;
                    GR_LD <= '0';
                    P_SEL <= '0';
                    SR_SEL <= '1';
                    TM_IN <= '0';
                    TM_EN  <= '0';
                    TC_EN <= '0';
                    TC_RST <= '0';
                    AD_SEL <= '0';
                    AR_LD <= '0';
                    SOLVED  <= '0';

                when cmp40 =>
                    if SC_CMP = '0' then
                        state <= read_location;
                        GR_LD <= '0';
                        SR_LD <= '0';
                        TM_IN <= '0';
                        TM_EN  <= '0';
                        TC_EN <= '0';
                        TC_RST <= '0';
                        AD_SEL <= '0';
                        AR_LD <= '1';
                        SOLVED  <= '0';
                    elsif SC_CMP = '1' then
                        state <= slvd;
                        SOLVED <= '1';
                    end if ;

                when read_location =>
                    if TM_OUT = '0' then
                        state <= read_location;
                        GR_LD <= '0';
                        SR_LD <= '0';
                        TM_IN <= '1';
                        TM_EN  <= '1';
                        TC_EN <= '0';
                        TC_RST <= '0';
                        AD_SEL <= '0';
                        --AR_LD <= '';  -- <-- this one needs figuring out
                        SOLVED  <= '0';
                    elsif TM_OUT = '1' then
                        state <= cmp_reg;
                        GR_LD <= '0';
                        P_SEL <= '1';
                        SR_LD <= '0';
                        SR_SEL <= '0';
                        TM_EN  <= '0';
                        TC_EN <= '0';
                        TC_RST <= '0';
                        AD_SEL <= '0';
                        --AR_LD <= '';
                        SOLVED  <= '0';
                    end if ;

                when cmp_reg =>
                    if SC_CMP = '0' then
                        state <= wr0;
                        TM_IN <= '0';
                    elsif SC_CMP = '1' then
                        state <= wr1;
                        TM_IN <= '1';
                    end if ;
                    GR_LD <= '0';
                    SR_LD <= '0';
                    TM_EN  <= '1';
                    TC_EN <= '0';
                    TC_RST <= '0';
                    AD_SEL <= '0';
                    --AR_LD <= '';
                    SOLVED  <= '0';

                when wr0 =>
                    if TC_LAST = '0' then
                        state <= read_location;
                        GR_LD <= '0';
                        SR_LD <= '0';
                        TM_EN  <= '0';
                        TC_EN <= '1';
                        TC_RST <= '0';
                        AD_SEL <= '0';
                        --AR_LD <= '';
                        SOLVED  <= '0';
                    elsif TC_LAST = '1' then
                        state <= guess;
                        GR_SEL <= '0';
                        GR_LD <= '1';
                        P_SEL <= '0';
                        SR_LD <= '1';
                        SR_SEL <= '1';
                        TM_IN <= '0';
                        TM_EN  <= '0';
                        TC_EN <= '1';
                        TC_RST <= '1';
                        AD_SEL <= '1';
                        --AR_LD <= '';
                        SOLVED  <= '0';
                    end if ;

                when wr1 =>
                    if TC_LAST = '0' then
                        state <= read_location;
                        GR_LD <= '0';
                        SR_LD <= '0';
                        TM_EN  <= '0';
                        TC_EN <= '1';
                        TC_RST <= '0';
                        AD_SEL <= '0';
                        AR_LD <= '0';
                        SOLVED  <= '0';
                    elsif TC_LAST = '1' then
                        state <= guess;
                        GR_SEL <= '0';
                        GR_LD <= '1';
                        P_SEL <= '0';
                        SR_LD <= '1';
                        SR_SEL <= '1';
                        TM_IN <= '0';
                        TM_EN  <= '0';
                        TC_EN <= '1';
                        TC_RST <= '1';
                        AD_SEL <= '1';
                        AR_LD <= '0';
                        SOLVED  <= '0';
                    end if ;

                when slvd =>
                    if START = '0' then
                        state <= slv_wait;
                    elsif START = '1' then
                        state <= slvd;
                        GR_SEL <= '0';
                    end if ;
                    SOLVED <= '1';

                when slv_wait =>
                    if START = '0' then
                        state <= slv_wait;
                        SOLVED <= '1';
                    elsif START = '1' then
                        state <= init;
                        GR_LD <= '0';
                        SR_LD <= '0';
                        TM_IN <= '1';
                        TM_EN  <= '1';
                        TC_EN <= '1';
                        TC_RST <= '1';
                        AR_LD <= '0';
                        SOLVED  <= '0';
                    end if ;

                when others =>
                    state <= init;
            end case ;
        end if ;
    end process ; -- fsm
end architecture ; -- arch
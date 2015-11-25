library ieee;
use ieee.std_logic_1164.all;
library altera;
use altera.altera_primitives_components.all:

entity g53_mastermind_controller is
  port (
    clk : in std_logic;
    READY, START, SC_CMP, TC_LAST, TM_OUT : in std_logic;
    GR_SEL, GR_LD, P_SEL, SR_LD, 
    SR_SEL, TM_IN, TM_EN ,TC_EN, 
    TC_RST, AD_SEL, AR_LD, SOLVED : in std_logic
  ) ;
end entity ; -- g53_mastermind_controller


architecture arch of g53_mastermind_controller is

    type States is (init, clear, guess, guess_wait, cmp40, solved, slv_wait, 
        read_location, cmp_reg, wr0, wr1);
    signal state : States;

    signal gr_sel_int : std_logic;

begin
    gr_sel_ff : DFF port map (d => gr_sel_int, clk => clk, q => gr_sel_int);

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
                
                when clear =>
                    if TC_LAST = '0' then
                        state <= clear;
                    elsif TC_LAST = '1' then
                        state <= guess;
                        GR_SEL <= '1';
                    end if ;

                when guess =>
                    if READY = '0' then
                        state <= guess_wait;
                    elsif READY = '1' then
                        state <= guess;
                    end if ;

                when guess_wait =>
                    if READY = '0' then
                        state <= guess_wait;
                    elsif READY = '1' then
                        state <= cmp40;
                    end if ;

                when cmp40 =>
                    if SC_CMP = '0' then
                        state <= read_location;
                    elsif SC_CMP = '1' then
                        state <= solved;
                    end if ;

                when read_location =>
                    if TM_OUT = '0' then
                        state <= read_location;
                    elsif TM_OUT = '1' then
                        state <= cmp_reg;
                    end if ;

                when cmp_reg =>
                    if SC_CMP = '0' then
                        state <= wr0;
                    elsif SC_CMP = '1' then
                        state <= wr1;
                    end if ;

                when wr0 =>
                    if TC_LAST = '0' then
                        state <= read_location;
                    elsif TC_LAST = '1' then
                        state <= guess;
                    end if ;

                when wr1 =>
                    if TC_LAST = '0' then
                        state <= read_location;
                    elsif TC_LAST = '1' then
                        state <= guess;
                        GR_SEL <= '0';
                    end if ;

                when solved =>
                    if START = '0' then
                        state <= slv_wait;
                    elsif START = '1' then
                        state <= solved;
                        GR_SEL <= '0';
                    end if ;

                when slv_wait =>
                    if START = '0' then
                        state <= slv_wait;
                    elsif START = '1' then
                        state <= init;
                    end if ;

                when others =>
                    state <= init;
            end case ;
        end if ;
    end process ; -- fsm

    transition_table : process( state )
    begin
        
    end process ; -- transition_table



end architecture ; -- arch
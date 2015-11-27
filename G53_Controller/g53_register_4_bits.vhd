library ieee;
use ieee.std_logic_1164.all;

entity g53_register_4_bits is
  port (
    clock : in std_logic;
    score_in : in std_logic_vector(3 downto 0) ;
    score_out : out std_logic_vector(3 downto 0) ;
    load : in std_logic
  ) ;
end entity ; -- g53_register_12_bits

architecture arch of g53_register_4_bits is
    
    signal score_internal : std_logic_vector(3 downto 0) ;

begin

    clk : process( clock )
    begin
        if rising_edge(clock) then
            if load = '1' then
                score_internal <= score_in;
            end if ;
        end if ;
    end process ; -- clk

    score_out <= score_internal;
end architecture ; -- arch
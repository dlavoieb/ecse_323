library ieee;
use ieee.std_logic_1164.all;

entity g53_register_12_bits is
  port (
    clock : in std_logic;
    address_in : in std_logic_vector(11 downto 0) ;
    address_out : out std_logic_vector(11 downto 0) ;
    load : in std_logic
  ) ;
end entity ; -- g53_register_12_bits

architecture arch of g53_register_12_bits is
    
    signal address_internal : std_logic_vector(11 downto 0) ;

begin

    clk : process( clock )
    begin
        if rising_edge(clock) then
            if load = '1' then
                address_internal <= address_in;
            end if ;
        end if ;
    end process ; -- clk

    address_out <= address_internal;
end architecture ; -- arch
library ieee;
use ieee.std_logic_1164.all;

entity g53_address_multiplexer is
  port (
    address0 : in std_logic_vector(11 downto 0) ;
    address1 : in std_logic_vector(11 downto 0) ;
    address_out : out std_logic_vector(11 downto 0) ;
    sel : in std_logic
  ) ;
end entity ; -- g53_address_multiplexer

architecture arch of g53_address_multiplexer is
begin
    with sel select 
    address_out <= address0 when '0',
                   address1 when '1';



end architecture ; -- arch
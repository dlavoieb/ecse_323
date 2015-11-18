library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity g53_divide10 is
  port (
    numerator : in std_logic_vector(7 downto 0) ;
    quotient : out std_logic_vector(3 downto 0) ;   
    remainder : out std_logic_vector(3 downto 0)    
  ) ;
end entity ; -- g53_divide10

architecture arch of g53_divide10 is

    signal num_unsigned : unsigned (7 downto 0);
    signal quo_unsigned : unsigned (7 downto 0);
    signal rem_unsigned : unsigned (7 downto 0);

begin

    num_unsigned <= unsigned(numerator);
    quo_unsigned <= num_unsigned / 10;
    rem_unsigned <= num_unsigned mod 10;

    quotient <= std_logic_vector(quo_unsigned(3 downto 0));
    remainder <= std_logic_vector(rem_unsigned(3 downto 0));

end architecture ; -- arch

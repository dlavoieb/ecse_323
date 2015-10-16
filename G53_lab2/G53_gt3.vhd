library ieee;
use ieee.std_logic_1164.all;

entity g53_gt3 is
port (A,B : in std_logic_vector(2 downto 0);
		AgtB: out std_logic);
end g53_gt3;

architecture implementation of g53_gt3 is 

signal i : std_logic_vector (2 downto 0);
begin

i(0) <= a(0) xnor b(0);
i(1) <= a(1) xnor b(1);
i(2) <= a(2) xnor b(2);

AgtB <= (a(2) and not b(2)) or (i(2)and a(1) and not b(1)) or (i(1) and i(2) and a(0) and not b(0));

end implementation;
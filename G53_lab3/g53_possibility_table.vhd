library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity g53_possibility_table is
  port (
    TC_EN : in std_logic; -- table counter enable
    TC_RST : in std_logic; -- table counter reset
    TM_IN : in std_logic; -- table memory input data
    TM_EN : in std_logic; -- table memory write enable
    CLK : in std_logic;
    TC_LAST : out std_logic; -- last count flag
    TM_ADDR : out std_logic_vector(11 downto 0);
    TM_OUT : out std_logic); -- table memory output
  );
end entity ; -- g53_possibility_table

architecture impl of g53_possibility_table is

  signal table : unsigned(4196 downto 0) ;
  signal TC1, TC2, TC3, TC4 : unsigned(2 downto 0) ;

begin

table_counter : process( CLK, TC_RST, TC_EN )
begin
  if (Clock'event and Clock='1' and TC_EN = '1') then
    if (TC_RST = '1') then
      TC1 <= (others => '0');
      TC2 <= (others => '0');
      TC3 <= (others => '0');
      TC4 <= (others => '0');
    elsif (TC_RST = '0') then
      TC1 <= (TC1+1) mod 6;
      if (TC1 = 0) then
        TC2 <= (TC2 + 1) mod 6;
        if (TC2 = 0) then
          TC3 <= (TC3 + 1) mod 6;
          if (TC3 = 0) then
            TC4 <= TC4 + 1;
          end if ;
        end if ;
      end if ;

      -- TC += 1

    end if ;


  end if ; -- clock edge
end process ; -- table_counter

end architecture ; -- impl

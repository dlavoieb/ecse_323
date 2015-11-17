library ieee;
use ieee.std_logic_1164.all;

entity g53_7_segment_decoder is 
port (code          : in std_logic_vector(3 downto 0);
    RippleBlank_In  : in std_logic;
    RippleBlank_Out : out std_logic;
    segments        : out std_logic_vector(6 downto 0));
end g53_7_segment_decoder;

architecture implementation of g53_7_segment_decoder is
    component G53_comp6
    port (A, B :  in  std_logic_vector(5 DOWNTO 0);
        AeqB :  out  std_logic);
    end component;

    signal internal_segment : std_logic_vector(6 downto 0) ; 
    signal code_is_zero : std_logic;
    signal large_code : std_logic_vector(5 downto 0) ;
     signal temp_ripple : std_logic_vector (1 downto 0);

begin
    with code select
        internal_segment <=
            "1000000" when "0000", -- 0
            "1111001" when "0001", -- 1
            "0100100" when "0010", -- 2 
            "0110000" when "0011", -- 3 
            "0011001" when "0100", -- 4 
            "0010010" when "0101", -- 5 
            "0000010" when "0110", -- 6 
            "1111000" when "0111", -- 7 
            "0000000" when "1000", -- 8 
            "0011000" when "1001", -- 9 
            "0100111" when "1010", -- 10 -- white 
            "1100011" when "1011", -- 11 -- green
            "1110001" when "1100", -- 12 -- yellow
            "0101011" when "1101", -- 13 -- black
            "0101111" when "1110", -- 14 -- red 
            "0000011" when "1111", -- 15 -- blue
            "1111111" when others; -- all off when not recognized

    large_code <= "00" & code;
    comp_code : G53_comp6 port map (A=>large_code, B=>"000000", AeqB=>code_is_zero);
    RippleBlank_Out <= RippleBlank_In and code_is_zero;

    temp_ripple <= RippleBlank_In & code_is_zero;
    with temp_ripple select
        segments <=
            "1111111" when "11",
            internal_segment when others;

end architecture ; -- implementation


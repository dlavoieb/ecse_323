library ieee;
use ieee.std_logic_1164.all;

entity g53_led_panel is
port (  code1, code2, code3, code4 : in std_logic_vector(3 downto 0) ;
        RippleBlank_In : in std_logic;
        segment1, segment2, segment3, segment4 : out std_logic_vector(6 downto 0)
    );
end g53_led_panel;

architecture impl of g53_led_panel is
    component g53_7_segment_decoder 
        port (code          : in std_logic_vector(3 downto 0);
            RippleBlank_In  : in std_logic;
            RippleBlank_Out : out std_logic;
            segments        : out std_logic_vector(6 downto 0));
    end component;

    signal rb_0, rb_1 : std_logic;

begin

led1 : g53_7_segment_decoder port map (code=>"0000", 	RippleBlank_In=>'0', 												segments=>segment1);
led2 : g53_7_segment_decoder port map (code=>"0000", 	RippleBlank_In=>rb_1,  												segments=>segment2);
led3 : g53_7_segment_decoder port map (code=>code3, 	RippleBlank_In=>rb_0,  				RippleBlank_Out=> rb_1, segments=>segment3);
led4 : g53_7_segment_decoder port map (code=>"0000", 	RippleBlank_In=>RippleBlank_In, 	RippleBlank_Out=> rb_0, segments=>segment4);

end architecture ; -- impl
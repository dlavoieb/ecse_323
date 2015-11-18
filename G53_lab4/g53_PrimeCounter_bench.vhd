LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY g53_PrimeCounter_bench_vhd IS 
	PORT
	(
		TC_EN :  IN  STD_LOGIC;
		CLK :  IN  STD_LOGIC;
		mode :  IN  STD_LOGIC_VECTOR(1 DOWNTO 0);
		led1 :  OUT  STD_LOGIC_VECTOR(6 DOWNTO 0);
		led2 :  OUT  STD_LOGIC_VECTOR(6 DOWNTO 0)
	);
END g53_PrimeCounter_bench_vhd;

ARCHITECTURE bdf_type OF g53_PrimeCounter_bench_vhd IS 

COMPONENT divide_0
	PORT(numer : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		 denom : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		 quotient : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
		 remain : OUT STD_LOGIC_VECTOR(3 DOWNTO 0));
END COMPONENT;

COMPONENT g53_7_segment_decoder
	PORT(RippleBlank_In : IN STD_LOGIC;
		 code : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		 RippleBlank_Out : OUT STD_LOGIC;
		 segments : OUT STD_LOGIC_VECTOR(6 DOWNTO 0)
	);
END COMPONENT;

COMPONENT counter
	PORT(clock : IN STD_LOGIC;
		 q : OUT STD_LOGIC_VECTOR(23 DOWNTO 0)
	);
END COMPONENT;

COMPONENT g53_primecounter
	PORT(CLK : IN STD_LOGIC;
		 TC_EN : IN STD_LOGIC;
		 mode : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
		 cnt : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
	);
END COMPONENT;

SIGNAL	q :  STD_LOGIC_VECTOR(23 DOWNTO 0);
SIGNAL	quotient :  STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_0 :  STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_1 :  STD_LOGIC_VECTOR(7 DOWNTO 0);
signal	denominator: STD_LOGIC_VECTOR(3 downto 0);

BEGIN 

denominator <= "1010";

b2v_inst : g53_7_segment_decoder
PORT MAP(code => quotient(3 DOWNTO 0),
		 RippleBlank_In => '1',
		 segments => led2);


b2v_inst1 : g53_7_segment_decoder
PORT MAP(code => SYNTHESIZED_WIRE_0,
		 RippleBlank_In => '0',
		 segments => led1);


b2v_inst10 : counter
PORT MAP(clock => CLK,
		 q => q);


b2v_inst2 : g53_primecounter
PORT MAP(CLK => q(23),
		 TC_EN => TC_EN,
		 mode => mode,
		 cnt => SYNTHESIZED_WIRE_1);


b2v_inst4 : divide_0
PORT MAP(numer => SYNTHESIZED_WIRE_1,
		 denom => denominator,
		 quotient => quotient,
		 remain => SYNTHESIZED_WIRE_0);


END bdf_type;
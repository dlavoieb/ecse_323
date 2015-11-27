-- Copyright (C) 1991-2013 Altera Corporation
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, Altera MegaCore Function License 
-- Agreement, or other applicable license agreement, including, 
-- without limitation, that your use is for the sole purpose of 
-- programming logic devices manufactured by Altera and sold by 
-- Altera or its authorized distributors.  Please refer to the 
-- applicable agreement for further details.

-- PROGRAM		"Quartus II 64-Bit"
-- VERSION		"Version 13.0.1 Build 232 06/12/2013 Service Pack 1 SJ Web Edition"
-- CREATED		"Fri Nov 27 17:26:16 2015"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY g53_mastermind_datapath IS 
	PORT
	(
		GR_LD :  IN  STD_LOGIC;
		AD_SEL :  IN  STD_LOGIC;
		AD_LD :  IN  STD_LOGIC;
		SR_LD :  IN  STD_LOGIC;
		SR_SEL :  IN  STD_LOGIC;
		P_SEL :  IN  STD_LOGIC;
		GR_SEL :  IN  STD_LOGIC;
		CLK :  IN  STD_LOGIC;
		TC_EN :  IN  STD_LOGIC;
		TC_RST :  IN  STD_LOGIC;
		TM_IN :  IN  STD_LOGIC;
		TM_EN :  IN  STD_LOGIC;
		EXT_PATTERN :  IN  STD_LOGIC_VECTOR(11 DOWNTO 0);
		SC_CMP :  OUT  STD_LOGIC;
		TC_LAST :  OUT  STD_LOGIC;
		TM_OUT :  OUT  STD_LOGIC;
		COLOR :  OUT  STD_LOGIC_VECTOR(2 DOWNTO 0);
		EXACT :  OUT  STD_LOGIC_VECTOR(2 DOWNTO 0);
		GUESS :  OUT  STD_LOGIC_VECTOR(11 DOWNTO 0);
		SCORE_CODE :  OUT  STD_LOGIC_VECTOR(3 DOWNTO 0);
		TM_ADDR_OUT :  OUT  STD_LOGIC_VECTOR(11 DOWNTO 0)
	);
END g53_mastermind_datapath;

ARCHITECTURE bdf_type OF g53_mastermind_datapath IS 

COMPONENT g53_address_multiplexer
	PORT(sel : IN STD_LOGIC;
		 address0 : IN STD_LOGIC_VECTOR(11 DOWNTO 0);
		 address1 : IN STD_LOGIC_VECTOR(11 DOWNTO 0);
		 address_out : OUT STD_LOGIC_VECTOR(11 DOWNTO 0)
	);
END COMPONENT;

COMPONENT g53_possibility_table
	PORT(TC_EN : IN STD_LOGIC;
		 TC_RST : IN STD_LOGIC;
		 TM_IN : IN STD_LOGIC;
		 TM_EN : IN STD_LOGIC;
		 CLK : IN STD_LOGIC;
		 TC_LAST : OUT STD_LOGIC;
		 TM_OUT : OUT STD_LOGIC;
		 TM_ADDR : OUT STD_LOGIC_VECTOR(11 DOWNTO 0)
	);
END COMPONENT;

COMPONENT lpm_mux_4bit
	PORT(sel : IN STD_LOGIC;
		 data0x : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		 data1x : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		 result : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
	);
END COMPONENT;

COMPONENT g53_register_12_bits
	PORT(clock : IN STD_LOGIC;
		 load : IN STD_LOGIC;
		 address_in : IN STD_LOGIC_VECTOR(11 DOWNTO 0);
		 address_out : OUT STD_LOGIC_VECTOR(11 DOWNTO 0)
	);
END COMPONENT;

COMPONENT g53_comp4
	PORT(A : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		 B : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		 AeqB : OUT STD_LOGIC
	);
END COMPONENT;

COMPONENT const_0011
	PORT(		 result : OUT STD_LOGIC_VECTOR(11 DOWNTO 0)
	);
END COMPONENT;

COMPONENT g53_mastermind_score
	PORT(G1 : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
		 G2 : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
		 G3 : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
		 G4 : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
		 P1 : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
		 P2 : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
		 P3 : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
		 P4 : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
		 color_match_score : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
		 exact_match_score : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
		 score_code : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
	);
END COMPONENT;

COMPONENT const_40
	PORT(		 result : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
	);
END COMPONENT;

COMPONENT g53_register_4_bits
	PORT(clock : IN STD_LOGIC;
		 load : IN STD_LOGIC;
		 score_in : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		 score_out : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
	);
END COMPONENT;

SIGNAL	guess_ALTERA_SYNTHESIZED :  STD_LOGIC_VECTOR(11 DOWNTO 0);
SIGNAL	hidden :  STD_LOGIC_VECTOR(11 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_12 :  STD_LOGIC_VECTOR(11 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_1 :  STD_LOGIC_VECTOR(11 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_13 :  STD_LOGIC_VECTOR(11 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_3 :  STD_LOGIC_VECTOR(11 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_4 :  STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_14 :  STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_7 :  STD_LOGIC_VECTOR(11 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_8 :  STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_9 :  STD_LOGIC_VECTOR(3 DOWNTO 0);


BEGIN 
SCORE_CODE <= SYNTHESIZED_WIRE_14;



b2v_address_selector : g53_address_multiplexer
PORT MAP(sel => AD_SEL,
		 address0 => SYNTHESIZED_WIRE_12,
		 address1 => SYNTHESIZED_WIRE_1,
		 address_out => SYNTHESIZED_WIRE_13);


b2v_guess_selecgtor : g53_address_multiplexer
PORT MAP(sel => GR_SEL,
		 address0 => SYNTHESIZED_WIRE_13,
		 address1 => SYNTHESIZED_WIRE_3,
		 address_out => SYNTHESIZED_WIRE_7);


b2v_inst : g53_possibility_table
PORT MAP(TC_EN => TC_EN,
		 TC_RST => TC_RST,
		 TM_IN => TM_IN,
		 TM_EN => TM_EN,
		 CLK => CLK,
		 TC_LAST => TC_LAST,
		 TM_OUT => TM_OUT,
		 TM_ADDR => SYNTHESIZED_WIRE_12);


b2v_inst2 : lpm_mux_4bit
PORT MAP(sel => SR_SEL,
		 data0x => SYNTHESIZED_WIRE_4,
		 data1x => SYNTHESIZED_WIRE_14,
		 result => SYNTHESIZED_WIRE_9);


b2v_inst3 : g53_register_12_bits
PORT MAP(clock => CLK,
		 load => AD_LD,
		 address_in => SYNTHESIZED_WIRE_12,
		 address_out => SYNTHESIZED_WIRE_1);


b2v_inst4 : g53_register_12_bits
PORT MAP(clock => CLK,
		 load => GR_LD,
		 address_in => SYNTHESIZED_WIRE_7,
		 address_out => guess_ALTERA_SYNTHESIZED);


b2v_inst5 : g53_comp4
PORT MAP(A => SYNTHESIZED_WIRE_8,
		 B => SYNTHESIZED_WIRE_9,
		 AeqB => SC_CMP);


b2v_inst6 : const_0011
PORT MAP(		 result => SYNTHESIZED_WIRE_3);


b2v_inst7 : g53_mastermind_score
PORT MAP(G1 => guess_ALTERA_SYNTHESIZED(2 DOWNTO 0),
		 G2 => guess_ALTERA_SYNTHESIZED(5 DOWNTO 3),
		 G3 => guess_ALTERA_SYNTHESIZED(8 DOWNTO 6),
		 G4 => guess_ALTERA_SYNTHESIZED(11 DOWNTO 9),
		 P1 => hidden(2 DOWNTO 0),
		 P2 => hidden(5 DOWNTO 3),
		 P3 => hidden(8 DOWNTO 6),
		 P4 => hidden(11 DOWNTO 9),
		 color_match_score => COLOR,
		 exact_match_score => EXACT,
		 score_code => SYNTHESIZED_WIRE_14);


b2v_inst8 : const_40
PORT MAP(		 result => SYNTHESIZED_WIRE_4);


b2v_inst9 : g53_register_4_bits
PORT MAP(clock => CLK,
		 load => SR_LD,
		 score_in => SYNTHESIZED_WIRE_14,
		 score_out => SYNTHESIZED_WIRE_8);


b2v_pattern_selector : g53_address_multiplexer
PORT MAP(sel => P_SEL,
		 address0 => EXT_PATTERN,
		 address1 => SYNTHESIZED_WIRE_13,
		 address_out => hidden);

GUESS <= guess_ALTERA_SYNTHESIZED;
TM_ADDR_OUT <= hidden;

END bdf_type;
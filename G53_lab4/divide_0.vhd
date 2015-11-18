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
-- CREATED		"Wed Nov 18 10:00:32 2015"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY altera;
USE altera.maxplus2.all; 

LIBRARY work;

ENTITY divide_0 IS 
PORT 
( 
	numer	:	IN	 STD_LOGIC_VECTOR(7 DOWNTO 0);
	quotient	:	OUT	 STD_LOGIC_VECTOR(7 DOWNTO 0);
	remain	:	OUT	 STD_LOGIC_VECTOR(3 DOWNTO 0)
); 
END divide_0;

ARCHITECTURE bdf_type OF divide_0 IS 
BEGIN 

-- instantiate macrofunction 

b2v_inst4 : divide
PORT MAP(numer => numer,
		 quotient => quotient,
		 remain => remain);

END bdf_type; 
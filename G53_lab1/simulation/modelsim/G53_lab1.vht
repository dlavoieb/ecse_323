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

-- ***************************************************************************
-- This file contains a Vhdl test bench template that is freely editable to   
-- suit user's needs .Comments are provided in each section to help the user  
-- fill out necessary details.                                                
-- ***************************************************************************
-- Generated on "09/23/2015 14:04:00"
                                                            
-- Vhdl Test Bench template for design  :  G53_lab1
-- 
-- Simulation tool : ModelSim-Altera (VHDL)
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                
USE ieee.numeric_std.all; --added to the template

ENTITY G53_lab1_vhd_tst IS
END G53_lab1_vhd_tst;
ARCHITECTURE G53_lab1_arch OF G53_lab1_vhd_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL A : STD_LOGIC_VECTOR(5 DOWNTO 0);
SIGNAL AeqB : STD_LOGIC;
SIGNAL B : STD_LOGIC_VECTOR(5 DOWNTO 0);
COMPONENT G53_lab1
	PORT (
	A : IN STD_LOGIC_VECTOR(5 DOWNTO 0);
	AeqB : OUT STD_LOGIC;
	B : IN STD_LOGIC_VECTOR(5 DOWNTO 0)
	);
END COMPONENT;
BEGIN
	i1 : G53_lab1
	PORT MAP (
-- list connections between master ports and signals
	A => A,
	AeqB => AeqB,
	B => B
	);              

generate_test: PROCESS
BEGIN

	FOR i IN 0 to 63 LOOP
		A <= std_logic_vector(to_unsigned(i,6));
		FOR j IN 0 to 63 LOOP	
			B <= std_logic_vector(to_unsigned(j,6));
			WAIT FOR 10 ns;
		END LOOP;
	END LOOP;
	WAIT;
	
END PROCESS generate_test;
	
END G53_lab1_arch;

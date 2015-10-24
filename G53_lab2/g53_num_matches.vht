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
-- Generated on "10/07/2015 14:27:05"
                                                            
-- Vhdl Test Bench template for design  :  g53_num_matches
-- 
-- Simulation tool : ModelSim-Altera (VHDL)
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY g53_num_matches_vhd_tst IS
END g53_num_matches_vhd_tst;
ARCHITECTURE g53_num_matches_arch OF g53_num_matches_vhd_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL G1 : STD_LOGIC_VECTOR(2 DOWNTO 0);
SIGNAL G2 : STD_LOGIC_VECTOR(2 DOWNTO 0);
SIGNAL G3 : STD_LOGIC_VECTOR(2 DOWNTO 0);
SIGNAL G4 : STD_LOGIC_VECTOR(2 DOWNTO 0);
SIGNAL N : STD_LOGIC_VECTOR(2 DOWNTO 0);
SIGNAL P1 : STD_LOGIC_VECTOR(2 DOWNTO 0);
SIGNAL P2 : STD_LOGIC_VECTOR(2 DOWNTO 0);
SIGNAL P3 : STD_LOGIC_VECTOR(2 DOWNTO 0);
SIGNAL P4 : STD_LOGIC_VECTOR(2 DOWNTO 0);
COMPONENT g53_num_matches
	PORT (
	G1 : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
	G2 : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
	G3 : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
	G4 : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
	N : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
	P1 : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
	P2 : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
	P3 : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
	P4 : IN STD_LOGIC_VECTOR(2 DOWNTO 0)
	);
END COMPONENT;
BEGIN
	i1 : g53_num_matches
	PORT MAP (
-- list connections between master ports and signals
	G1 => G1,
	G2 => G2,
	G3 => G3,
	G4 => G4,
	N => N,
	P1 => P1,
	P2 => P2,
	P3 => P3,
	P4 => P4
	);

always : PROCESS                                              
BEGIN                                                         
-- all the same so n should be "100"
G1 <= "010";
P1 <= "010";                                                  
G2 <= "011";
P2 <= "011";                                                  
G3 <= "110";
P3 <= "110";                                                  
G4 <= "000";
P4 <= "000";

wait for 10 ns;

-- n should be "011"
G1 <= "010";
P1 <= "010";                                                  
G2 <= "011";
P2 <= "011";                                                  
G3 <= "000";
P3 <= "000";
-- one different                                                  
G4 <= "000";
P4 <= "100";

wait for 10 ns;

-- n should be "010"
G1 <= "011";
P1 <= "010";                                                  
G2 <= "110";
P2 <= "110";                                                  
G3 <= "011";
P3 <= "011";                                                  
G4 <= "000";
P4 <= "010";

wait for 10 ns;
-- n should be "001"
G1 <= "010";
P1 <= "010";                                                  
G2 <= "000";
P2 <= "010";                                                  
G3 <= "000";
P3 <= "010";                                                  
G4 <= "000";
P4 <= "010";

wait for 10 ns;
-- n should be "000"
G1 <= "011";
P1 <= "010";                                                  
G2 <= "011";
P2 <= "010";                                                  
G3 <= "011";
P3 <= "010";                                                  
G4 <= "011";
P4 <= "010";

wait for 10 ns;

G1 <= "111";
P1 <= "111";                                                  
G2 <= "010";
P2 <= "011";                                                  
G3 <= "000";
P3 <= "000";                                                  
G4 <= "000";
P4 <= "111";

wait for 10 ns;

G1 <= "000";
P1 <= "000";                                                  
G2 <= "010";
P2 <= "010";                                                  
G3 <= "000";
P3 <= "000";                                                  
G4 <= "010";
P4 <= "010";

wait for 10 ns;

G1 <= "110";
P1 <= "110";                                                  
G2 <= "000";
P2 <= "010";                                                  
G3 <= "01U";
P3 <= "010";                                                  
G4 <= "01X";
P4 <= "010";

WAIT;                                                        
END PROCESS always;                                          

END g53_num_matches_arch;

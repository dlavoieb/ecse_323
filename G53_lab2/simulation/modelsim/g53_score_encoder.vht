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
-- Generated on "10/16/2015 18:36:23"
                                                            
-- Vhdl Test Bench template for design  :  g53_score_encoder
-- 
-- Simulation tool : ModelSim-Altera (VHDL)
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY g53_score_encoder_vhd_tst IS
END g53_score_encoder_vhd_tst;
ARCHITECTURE g53_score_encoder_arch OF g53_score_encoder_vhd_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL num_color_matches : STD_LOGIC_VECTOR(2 DOWNTO 0);
SIGNAL num_exact_matches : STD_LOGIC_VECTOR(2 DOWNTO 0);
SIGNAL score_code : STD_LOGIC_VECTOR(3 DOWNTO 0);
COMPONENT g53_score_encoder
	PORT (
	num_color_matches : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
	num_exact_matches : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
	score_code : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
	);
END COMPONENT;
BEGIN
	i1 : g53_score_encoder
	PORT MAP (
-- list connections between master ports and signals
	num_color_matches => num_color_matches,
	num_exact_matches => num_exact_matches,
	score_code => score_code
	);
init : PROCESS                                               
-- variable declarations                                     
BEGIN                                                        
        -- code that executes only once                      
WAIT;                                                       
END PROCESS init;                                           
always : PROCESS                                              
-- optional sensitivity list                                  
-- (        )                                                 
-- variable declarations                                      
BEGIN                                                         
        -- code executes for every event on sensitivity list  
WAIT;                                                        
END PROCESS always;                                          
END g53_score_encoder_arch;

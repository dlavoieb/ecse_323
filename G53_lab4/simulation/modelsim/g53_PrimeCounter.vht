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
-- Generated on "11/17/2015 11:10:30"
                                                            
-- Vhdl Test Bench template for design  :  g53_PrimeCounter
-- 
-- Simulation tool : ModelSim-Altera (VHDL)
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY g53_PrimeCounter_vhd_tst IS
END g53_PrimeCounter_vhd_tst;
ARCHITECTURE g53_PrimeCounter_arch OF g53_PrimeCounter_vhd_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL CLK : STD_LOGIC;
SIGNAL cnt : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL mode : STD_LOGIC_VECTOR(1 DOWNTO 0);
SIGNAL TC_EN : STD_LOGIC;
COMPONENT g53_PrimeCounter
	PORT (
	CLK : IN STD_LOGIC;
	cnt : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
	mode : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
	TC_EN : IN STD_LOGIC
	);
END COMPONENT;
BEGIN
	i1 : g53_PrimeCounter
	PORT MAP (
-- list connections between master ports and signals
	CLK => CLK,
	cnt => cnt,
	mode => mode,
	TC_EN => TC_EN
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
END g53_PrimeCounter_arch;

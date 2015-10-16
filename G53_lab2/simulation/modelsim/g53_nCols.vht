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
-- Generated on "10/14/2015 15:23:08"
                                                            
-- Vhdl Test Bench template for design  :  g53_nCols
-- 
-- Simulation tool : ModelSim-Altera (VHDL)
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY g53_nCols_vhd_tst IS
END g53_nCols_vhd_tst;
ARCHITECTURE g53_nCols_arch OF g53_nCols_vhd_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL eq_out : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL N1 : STD_LOGIC_VECTOR(2 DOWNTO 0);
SIGNAL N2 : STD_LOGIC_VECTOR(2 DOWNTO 0);
SIGNAL N3 : STD_LOGIC_VECTOR(2 DOWNTO 0);
SIGNAL N4 : STD_LOGIC_VECTOR(2 DOWNTO 0);
SIGNAL N5 : STD_LOGIC_VECTOR(2 DOWNTO 0);
SIGNAL N6 : STD_LOGIC_VECTOR(2 DOWNTO 0);
SIGNAL P1 : STD_LOGIC_VECTOR(2 DOWNTO 0);
SIGNAL P2 : STD_LOGIC_VECTOR(2 DOWNTO 0);
SIGNAL P3 : STD_LOGIC_VECTOR(2 DOWNTO 0);
SIGNAL P4 : STD_LOGIC_VECTOR(2 DOWNTO 0);
COMPONENT g53_nCols
	PORT (
	eq_out : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
	N1 : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
	N2 : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
	N3 : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
	N4 : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
	N5 : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
	N6 : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
	P1 : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
	P2 : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
	P3 : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
	P4 : IN STD_LOGIC_VECTOR(2 DOWNTO 0)
	);
END COMPONENT;
BEGIN
	i1 : g53_nCols
	PORT MAP (
-- list connections between master ports and signals
	eq_out => eq_out,
	N1 => N1,
	N2 => N2,
	N3 => N3,
	N4 => N4,
	N5 => N5,
	N6 => N6,
	P1 => P1,
	P2 => P2,
	P3 => P3,
	P4 => P4
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
END g53_nCols_arch;

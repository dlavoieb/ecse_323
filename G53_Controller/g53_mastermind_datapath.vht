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
-- Generated on "11/27/2015 15:56:30"
                                                            
-- Vhdl Test Bench template for design  :  g53_mastermind_datapath
-- 
-- Simulation tool : ModelSim-Altera (VHDL)
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY g53_mastermind_datapath_vhd_tst IS
END g53_mastermind_datapath_vhd_tst;
ARCHITECTURE g53_mastermind_datapath_arch OF g53_mastermind_datapath_vhd_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL AD_LD : STD_LOGIC;
SIGNAL AD_SEL : STD_LOGIC;
SIGNAL CLK : STD_LOGIC;
SIGNAL EXT_PATTERN : STD_LOGIC_VECTOR(11 DOWNTO 0);
SIGNAL GR_LD : STD_LOGIC;
SIGNAL GR_SEL : STD_LOGIC;
SIGNAL P_SEL : STD_LOGIC;
SIGNAL SC_CMP : STD_LOGIC;
SIGNAL SR_LD : STD_LOGIC;
SIGNAL SR_SEL : STD_LOGIC;
SIGNAL TC_EN : STD_LOGIC;
SIGNAL TC_LAST : STD_LOGIC;
SIGNAL TC_RST : STD_LOGIC;
SIGNAL TM_EN : STD_LOGIC;
SIGNAL TM_IN : STD_LOGIC;
SIGNAL TM_OUT : STD_LOGIC;
COMPONENT g53_mastermind_datapath
	PORT (
	AD_LD : IN STD_LOGIC;
	AD_SEL : IN STD_LOGIC;
	CLK : IN STD_LOGIC;
	EXT_PATTERN : IN STD_LOGIC_VECTOR(11 DOWNTO 0);
	GR_LD : IN STD_LOGIC;
	GR_SEL : IN STD_LOGIC;
	P_SEL : IN STD_LOGIC;
	SC_CMP : OUT STD_LOGIC;
	SR_LD : IN STD_LOGIC;
	SR_SEL : IN STD_LOGIC;
	TC_EN : IN STD_LOGIC;
	TC_LAST : OUT STD_LOGIC;
	TC_RST : IN STD_LOGIC;
	TM_EN : IN STD_LOGIC;
	TM_IN : IN STD_LOGIC;
	TM_OUT : OUT STD_LOGIC
	);
END COMPONENT;
BEGIN
	i1 : g53_mastermind_datapath
	PORT MAP (
-- list connections between master ports and signals
	AD_LD => AD_LD,
	AD_SEL => AD_SEL,
	CLK => CLK,
	EXT_PATTERN => EXT_PATTERN,
	GR_LD => GR_LD,
	GR_SEL => GR_SEL,
	P_SEL => P_SEL,
	SC_CMP => SC_CMP,
	SR_LD => SR_LD,
	SR_SEL => SR_SEL,
	TC_EN => TC_EN,
	TC_LAST => TC_LAST,
	TC_RST => TC_RST,
	TM_EN => TM_EN,
	TM_IN => TM_IN,
	TM_OUT => TM_OUT
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
END g53_mastermind_datapath_arch;

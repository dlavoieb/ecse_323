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
-- Generated on "10/30/2015 22:48:38"
                                                            
-- Vhdl Test Bench template for design  :  g53_possibility_table
-- 
-- Simulation tool : ModelSim-Altera (VHDL)
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY g53_possibility_table_vhd_tst IS
END g53_possibility_table_vhd_tst;
ARCHITECTURE g53_possibility_table_arch OF g53_possibility_table_vhd_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL CLK : STD_LOGIC := '0';
SIGNAL TC_EN : STD_LOGIC;
SIGNAL TC_LAST : STD_LOGIC;
SIGNAL TC_RST : STD_LOGIC;
SIGNAL TM_ADDR : STD_LOGIC_VECTOR(11 DOWNTO 0);
SIGNAL TM_EN : STD_LOGIC;
SIGNAL TM_IN : STD_LOGIC;
SIGNAL TM_OUT : STD_LOGIC;
COMPONENT g53_possibility_table
    PORT (
    CLK : IN STD_LOGIC ;
    TC_EN : IN STD_LOGIC;
    TC_LAST : OUT STD_LOGIC;
    TC_RST : IN STD_LOGIC;
    TM_ADDR : OUT STD_LOGIC_VECTOR(11 DOWNTO 0);
    TM_EN : IN STD_LOGIC;
    TM_IN : IN STD_LOGIC;
    TM_OUT : OUT STD_LOGIC
    );
END COMPONENT;
BEGIN
    i1 : g53_possibility_table
    PORT MAP (
-- list connections between master ports and signals
    CLK => CLK,
    TC_EN => TC_EN,
    TC_LAST => TC_LAST,
    TC_RST => TC_RST,
    TM_ADDR => TM_ADDR,
    TM_EN => TM_EN,
    TM_IN => TM_IN,
    TM_OUT => TM_OUT
    );
    
CLK <= not CLK after 20  ns; 
init : process
begin

    TC_EN <= '1';
    TC_RST <= '1';
    TM_EN <= '1';
    TM_IN <= '1';
    wait for 40 ns;
    TC_RST <= '0';
    wait for 200 ns; 
    TC_EN <= '0';
    wait for 200 ns;

    TC_EN <= '1';
    TC_RST <= '1';
    TM_EN <= '1';
    TM_IN <= '1';
    wait for 40 ns;
    TC_RST <= '0';
    wait for 52000 ns;
    
    TC_RST <= '1';
    TM_EN <= '0';
    wait for 40 ns;
    TC_RST <= '0';
    wait for 52000 ns;
     
     TC_RST <= '1';
    TM_EN <= '1';
    TM_IN <= '0';
    wait for 40 ns;
    TC_RST <= '0';
    wait for 52000 ns;
    
    TC_RST <= '1';
    TM_EN <= '0';
    wait for 40 ns;
    TC_RST <= '0';
     
WAIT;
end process ; -- init

END g53_possibility_table_arch;

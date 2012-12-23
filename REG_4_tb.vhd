--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   13:44:38 12/02/2012
-- Design Name:   
-- Module Name:   C:/Xilinx/13.3/ISE_DS/examplework/VLSI_Final_Project/REG_4_tb.vhd
-- Project Name:  VLSI_Final_Project
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: REG_4
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY REG_4_tb IS
END REG_4_tb;
 
ARCHITECTURE behavior OF REG_4_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT REG_4
    PORT(
         q : out  std_logic_vector(3 downto 0);
         d : IN  std_logic_vector(3 downto 0);
         clk : IN  std_logic;
         clear : IN  std_logic
        );
    END COMPONENT;
    

   --Inputs
   
   signal d : std_logic_vector(3 downto 0) := (others => '0');
   signal clk : std_logic := '0';
   signal clear : std_logic := '0';
	
	--outputs
	signal q : std_logic_vector(3 downto 0);
   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: REG_4 PORT MAP (
          q => q,
          d => d,
          clk => clk,
          clear => clear
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		d <= "0000";
      wait for clk_period*4;
		d <= "1111";
		wait for clk_period*4;
		d <= "1010";
		clear <= '1';
		wait for clk_period*4;
		clear <= '0';
      -- insert stimulus here 

      wait;
   end process;

END;

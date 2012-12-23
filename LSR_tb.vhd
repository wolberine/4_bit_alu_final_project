--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   19:07:01 11/19/2012
-- Design Name:   
-- Module Name:   C:/Xilinx/13.3/ISE_DS/examplework/VLSI_Final_Project/LSR_tb.vhd
-- Project Name:  VLSI_Final_Project
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: LSR
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
 
 
ENTITY LSR_tb IS
END LSR_tb;
 
ARCHITECTURE behavior OF LSR_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT LSR
    PORT(
         a : IN  std_logic_vector(3 downto 0);
         shift : IN  std_logic_vector(2 downto 0);
         lsr_out : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal a : std_logic_vector(3 downto 0) := (others => '0');
   signal shift : std_logic_vector(2 downto 0) := (others => '0');

 	--Outputs
   signal lsr_out : std_logic_vector(3 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: LSR PORT MAP (
          a => a,
          shift => shift,
          lsr_out => lsr_out
        );


 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

		a <= "1110";
		shift <= "001";
      -- insert stimulus here 

		wait for 100 ns;	

		a <= "1111";
		shift <= "010";
      -- insert stimulus here 
		
		wait for 100 ns;	

		a <= "1111";
		shift <= "011";
      -- insert stimulus here 
		
		wait for 100 ns;	

		a <= "1111";
		shift <= "100";
      -- insert stimulus here 
		
		wait for 100 ns;	

		a <= "1111";
		shift <= "111";
      -- insert stimulus here 

      wait;
   end process;

END;

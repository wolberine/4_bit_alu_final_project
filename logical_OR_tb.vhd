--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   08:34:04 11/23/2012
-- Design Name:   
-- Module Name:   C:/Xilinx/13.3/ISE_DS/examplework/VLSI_Final_Project/logical_OR_tb.vhd
-- Project Name:  VLSI_Final_Project
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: logical_OR
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
 

 
ENTITY logical_OR_tb IS
END logical_OR_tb;
 
ARCHITECTURE behavior OF logical_OR_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT logical_OR
    PORT(
         a : IN  std_logic_vector(3 downto 0);
         b : IN  std_logic_vector(3 downto 0);
         or_out : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal a : std_logic_vector(3 downto 0) := (others => '0');
   signal b : std_logic_vector(3 downto 0) := (others => '0');
  
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
	
	--Outputs
	signal or_out : std_logic_vector(3 downto 0);

BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: logical_OR PORT MAP (
          a => a,
          b => b,
          or_out => or_out
        );



   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

		a <= "0000";
		b <= "1010";
		
		wait for 100 ns;	

		a <= "1010";
		b <= "0000";
		
		wait for 100 ns;	

		a <= "1011";
		b <= "1010";
		

      -- insert stimulus here 

      wait;
   end process;

END;

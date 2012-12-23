--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   19:35:07 11/26/2012
-- Design Name:   
-- Module Name:   C:/Xilinx/13.3/ISE_DS/examplework/VLSI_Final_Project/prebus_tb.vhd
-- Project Name:  VLSI_Final_Project
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: prebus
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
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY prebus_tb IS
END prebus_tb;
 
ARCHITECTURE behavior OF prebus_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT prebus
    PORT(
         my_in : IN  std_logic_vector(3 downto 0);
         sel : IN  std_logic;
         my_out : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal my_in : std_logic_vector(3 downto 0) := (others => '0');
   signal sel : std_logic := '0';
  -- appropriate port name 
 
	--outputs
	signal my_out : std_logic_vector(3 downto 0) := (others => '0');
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: prebus PORT MAP (
          my_in => my_in,
          sel => sel,
          my_out => my_out
        );



   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

		my_in <= "1111";
		sel <= '1';
      -- insert stimulus here 
		
		wait for 100 ns;	

		my_in <= "1001";
		sel <= '0';
      -- insert stimulus here 

      wait;
   end process;

END;

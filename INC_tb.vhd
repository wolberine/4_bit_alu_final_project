--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   19:28:23 11/27/2012
-- Design Name:   
-- Module Name:   C:/Documents and Settings/increment_514/INC_tb.vhd
-- Project Name:  increment_514
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: INC
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
 

 
ENTITY INC_tb IS
END INC_tb;
 
ARCHITECTURE behavior OF INC_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT INC
    PORT(
         a : IN  std_logic_vector(3 downto 0);
         cin : IN  std_logic;
         inc_out : OUT  std_logic_vector(3 downto 0);
         cout : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal a : std_logic_vector(3 downto 0) := (others => '0');
   signal cin : std_logic := '0';

 	--Outputs
   signal inc_out : std_logic_vector(3 downto 0);
   signal cout : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: INC PORT MAP (
          a => a,
          cin => cin,
          inc_out => inc_out,
          cout => cout
        );

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

		-- insert stimulus here 
		
		a(0) <= '0';
		a(1) <= '1';
		a(2) <= '1';
		a(3) <= '1';
		cin <='1';
		
		wait;
   end process;

END;

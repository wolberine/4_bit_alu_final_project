--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   17:34:34 11/19/2012
-- Design Name:   
-- Module Name:   C:/Xilinx/13.3/ISE_DS/examplework/VLSI_Final_Project/ADD_tb.vhd
-- Project Name:  VLSI_Final_Project
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: ADD
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
 

 
ENTITY ADD_tb IS
END ADD_tb;
 
ARCHITECTURE behavior OF ADD_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ADD
    PORT(
         a : IN  std_logic_vector(3 downto 0);
         b : IN  std_logic_vector(3 downto 0);
         cin : IN  std_logic;
         sum : OUT  std_logic_vector(3 downto 0);
         cout : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal a : std_logic_vector(3 downto 0) := (others => '0');
   signal b : std_logic_vector(3 downto 0) := (others => '0');
   signal cin : std_logic := '0';

 	--Outputs
   signal sum : std_logic_vector(3 downto 0);
   signal cout : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ADD PORT MAP (
          a => a,
          b => b,
          cin => cin,
          sum => sum,
          cout => cout
        );


   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      -- insert stimulus here 
		cin <='0';
		a(0) <= '1';
		a(1) <= '1';
		a(2) <= '1';
		a(3) <= '1';

		b(0) <= '0';
		b(1) <= '0';
		b(2) <= '0';
		b(3) <= '0';
		
		      wait for 100 ns;	

      -- insert stimulus here 
		cin <='0';
		
		a(0) <= '0';
		a(1) <= '0';
		a(2) <= '0';
		a(3) <= '1';

		b(0) <= '0';
		b(1) <= '0';
		b(2) <= '0';
		b(3) <= '1';

		wait for 100 ns;	

      -- insert stimulus here 
		cin <='0';
		
		a(0) <= '1';
		a(1) <= '0';
		a(2) <= '0';
		a(3) <= '1';

		b(0) <= '1';
		b(1) <= '0';
		b(2) <= '0';
		b(3) <= '1';
		
				wait for 100 ns;	

      -- insert stimulus here 
		cin <='0';
		
		a(0) <= '0';
		a(1) <= '1';
		a(2) <= '0';
		a(3) <= '0';

		b(0) <= '0';
		b(1) <= '1';
		b(2) <= '0';
		b(3) <= '0';
		

      wait;
   
		
		
   end process;

END;

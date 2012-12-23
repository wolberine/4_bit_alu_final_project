--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   17:50:13 11/19/2012
-- Design Name:   
-- Module Name:   C:/Xilinx/13.3/ISE_DS/examplework/VLSI_Final_Project/SUB_tb.vhd
-- Project Name:  VLSI_Final_Project
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: SUB
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
 

ENTITY SUB_tb IS
END SUB_tb;
 
ARCHITECTURE behavior OF SUB_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT SUB
    PORT(
         a : IN  std_logic_vector(3 downto 0);
         b : IN  std_logic_vector(3 downto 0);
         cin : IN  std_logic;
         sub_sum : OUT  std_logic_vector(3 downto 0);
         cout : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal a : std_logic_vector(3 downto 0) := (others => '0');
   signal b : std_logic_vector(3 downto 0) := (others => '0');
   signal cin : std_logic := '0';

 	--Outputs
   signal sub_sum : std_logic_vector(3 downto 0);
   signal cout : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: SUB PORT MAP (
          a => a,
          b => b,
          cin => cin,
          sub_sum => sub_sum,
          cout => cout
        );


 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		cin <= '1';
		a <= "0010";
		b <= "0001";
		
		wait for 100 ns;	
		cin <= '1';
		a <= "0100";
		b <= "0010";
		
		wait for 100 ns;	
		cin <= '1';
		a <= "0110";
		b <= "0011";
		
		wait for 100 ns;	--7
		cin <= '1';
		a <= "0111";
		b <= "0001";
		
		wait for 100 ns;	--0
		cin <= '1';
		a <= "0000";
		b <= "0001";
		
		wait for 100 ns;	-- -8
		cin <= '1';
		a <= "1000";
		b <= "0001";


		wait for 100 ns;	-- (-6)-(-1)=(-5) -checked to be correct 12/16/12 DJW
		cin <= '1';
		a <= "1010";
		b <= "1111";
      -- insert stimulus here 
		
		wait for 100 ns;	-- (-6)-(1)=(-7) -checked to be correct 12/16/12 DJW		
		cin <= '1';
		a <= "1010";
		b <= "0001";
      -- insert stimulus here 

      wait;
   end process;

END;

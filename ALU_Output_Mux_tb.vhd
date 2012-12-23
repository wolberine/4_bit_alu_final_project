--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   19:05:23 11/26/2012
-- Design Name:   
-- Module Name:   C:/Xilinx/13.3/ISE_DS/examplework/VLSI_Final_Project/ALU_Output_Mux_tb.vhd
-- Project Name:  VLSI_Final_Project
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: ALU_Output_Mux
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
 
 
ENTITY ALU_Output_Mux_tb IS
END ALU_Output_Mux_tb;
 
ARCHITECTURE behavior OF ALU_Output_Mux_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ALU_Output_Mux
    PORT(
         ADD : IN  std_logic_vector(3 downto 0);
         SUB : IN  std_logic_vector(3 downto 0);
         LSL : IN  std_logic_vector(3 downto 0);
         LSR : IN  std_logic_vector(3 downto 0);
         AND_GATE : IN  std_logic_vector(3 downto 0);
         OR_GATE : IN  std_logic_vector(3 downto 0);
			INC : IN  std_logic_vector(3 downto 0);
			DEC : IN  std_logic_vector(3 downto 0);
         SEL : IN  std_logic_vector(3 downto 0);
         ALU_OUTPUT : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal ADD : std_logic_vector(3 downto 0) := (others => '0');
   signal SUB : std_logic_vector(3 downto 0) := (others => '0');
   signal LSL : std_logic_vector(3 downto 0) := (others => '0');
   signal LSR : std_logic_vector(3 downto 0) := (others => '0');
   signal AND_GATE : std_logic_vector(3 downto 0) := (others => '0');
   signal OR_GATE : std_logic_vector(3 downto 0) := (others => '0');
	signal INC : std_logic_vector(3 downto 0) := (others => '0');
	signal DEC : std_logic_vector(3 downto 0) := (others => '0');
   signal SEL : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal ALU_OUTPUT : std_logic_vector(3 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 

 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ALU_Output_Mux PORT MAP (
          ADD => ADD,
          SUB => SUB,
          LSL => LSL,
          LSR => LSR,
          AND_GATE => AND_GATE,
          OR_GATE => OR_GATE,
			 INC => INC,
			 DEC => DEC,
          SEL => SEL,
          ALU_OUTPUT => ALU_OUTPUT
        );


 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

		ADD <= "1010";
		SUB <= "0001";
		LSL <= "0100";
		LSR <= "1000";
		AND_GATE <= "0100";
		OR_GATE <= "0001";
		INC <= "1111";
		DEC <="0000";
		
		SEL <= "0000"; --simulate ADD

      -- insert stimulus here 
      -- hold reset state for 100 ns.
      wait for 100 ns;	

		ADD <= "0001";
		SUB <= "1001";
		LSL <= "0010";
		LSR <= "0100";
		AND_GATE <= "0010";
		OR_GATE <= "0100";
		INC <= "1111";
		DEC <="0000";
		
		SEL <= "0001"; --test SUB

      -- insert stimulus here 
		      -- hold reset state for 100 ns.
      wait for 100 ns;	

		ADD <= "0010";
		SUB <= "0010";
		LSL <= "0110";
		LSR <= "0010";
		AND_GATE <= "0010";
		OR_GATE <= "0100";
		INC <= "1111";
		DEC <="0000";
		
		SEL <= "0010"; --test LSL

      -- insert stimulus here 
		      -- hold reset state for 100 ns.
      wait for 100 ns;	

		ADD <= "0100";
		SUB <= "0100";
		LSL <= "0010";
		LSR <= "0101";
		AND_GATE <= "0100";
		OR_GATE <= "0010";
		INC <= "1111";
		DEC <="0000";
		
		SEL <= "0011"; --test LSR

      -- insert stimulus here 
		      -- hold reset state for 100 ns.
      wait for 100 ns;	

		ADD <= "1000";
		SUB <= "0010";
		LSL <= "0010";
		LSR <= "0010";
		AND_GATE <= "1100";
		OR_GATE <= "0010";
		INC <= "1111";
		DEC <="0000";
		
		SEL <= "0100"; --test AND

      -- insert stimulus here 
		      -- hold reset state for 100 ns.
      wait for 100 ns;	

		ADD <= "0001";
		SUB <= "0010";
		LSL <= "0010";
		LSR <= "0010";
		AND_GATE <= "0100";
		OR_GATE <= "0011";
		INC <= "1111";
		DEC <="0000";
		
		SEL <= "0101"; --test OR

      -- insert stimulus here 
				      -- hold reset state for 100 ns.
      wait for 100 ns;	

		ADD <= "0001";
		SUB <= "0010";
		LSL <= "0010";
		LSR <= "0010";
		AND_GATE <= "0100";
		OR_GATE <= "0011";
		INC <= "1111";
		DEC <="0000";
		
		SEL <= "0110"; --test INC
				      -- hold reset state for 100 ns.
      wait for 100 ns;	

		ADD <= "0001";
		SUB <= "0010";
		LSL <= "0010";
		LSR <= "0010";
		AND_GATE <= "0100";
		OR_GATE <= "0011";
		INC <= "1111";
		DEC <="0000";
		
		SEL <= "0111"; --test DEC
      wait;
   end process;

END;

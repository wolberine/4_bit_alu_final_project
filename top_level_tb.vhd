--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   14:38:21 12/02/2012
-- Design Name:   
-- Module Name:   C:/Xilinx/13.3/ISE_DS/examplework/VLSI_Final_Project/top_level_tb.vhd
-- Project Name:  VLSI_Final_Project
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: top_level
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
 
 
ENTITY top_level_tb IS
END top_level_tb;
 
ARCHITECTURE behavior OF top_level_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT top_level
    PORT(
         a : IN  std_logic_vector(3 downto 0);
         b : IN  std_logic_vector(3 downto 0);
         clk : IN  std_logic;
         output : OUT  std_logic_vector(3 downto 0);
         opcode : IN  std_logic_vector(3 downto 0);
         clear : IN  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal a : std_logic_vector(3 downto 0) := (others => '0');
   signal b : std_logic_vector(3 downto 0) := (others => '0');
   signal clk : std_logic := '0';
   signal opcode : std_logic_vector(3 downto 0) := (others => '0');
   signal clear : std_logic := '0';

 	--Outputs
   signal output : std_logic_vector(3 downto 0);

   -- Clock period definitions
   constant clk_period : time := 15 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: top_level PORT MAP (
          a => a,
          b => b,
          clk => clk,
          output => output,
          opcode => opcode,
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

      wait for clk_period*4;
		a <= "0010"; --2
		b <= "1010"; --10
		opcode <= "0000"; --ADD, answer shouldbe 12 (1100) (verified 12/2/2012 by DW)
		
		wait for clk_period*4;
		a <= "0101";--5
		b <= "0110";--minus 6
		opcode <= "0001"; --SUB, answer should be -1 (1111) (verified 12/2/2012 by DW)
		
		wait for clk_period*4;
		a <= "1010";
		b <= "0010";
		opcode <= "0010"; --LSL, answer should be 1000 (verified 12/4/2012 by DW)
		
		wait for clk_period*4;
		a <= "0101";
		b <= "0010"; --shift by 2
		opcode <= "0011"; --LSR --answer should be 0001 (verified 12/2/2012 by DW)
		
		wait for clk_period*4;
		a <= "0010"; --
		b <= "1010"; --
		opcode <= "0100"; --AND, answer shouldbe 0010 (verified 12/2/2012 by DW)
		
		wait for clk_period*4;
		a <= "0101";
		b <= "1010";
		opcode <= "0101"; --OR answer should be 1111 (verified 12/2/2012 by DW)
		
		wait for clk_period*4;
		a <= "1010";
		b <= "1010";
		opcode <= "0110"; --INC, answer should be 1011 (verified 12/2/2012 by DW)

		wait for clk_period*4;
		a <= "0101";
		b <= "1010"; --unused
		opcode <= "0111"; --DEC answer should be 0100 (verified 12/2/2012 by DW)
		
		wait for clk_period*4;
		clear <= '1'; --output should be 0000 (verified 12/4/2012 by DW)

      -- insert stimulus here 

      wait;
   end process;

END;

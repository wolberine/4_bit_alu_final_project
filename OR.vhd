----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    08:30:40 11/23/2012 
-- Design Name: 
-- Module Name:    OR - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity logical_OR is
    Port ( a : in  STD_LOGIC_VECTOR (3 downto 0);
           b : in  STD_LOGIC_VECTOR (3 downto 0);
           or_out : out  STD_LOGIC_VECTOR (3 downto 0));
end logical_OR;

architecture Behavioral of logical_OR is

	signal s0: std_logic_vector(3 downto 0) :="0000" ;

begin
	s0 <= a nor b; 
	or_out <= not s0;
end Behavioral;



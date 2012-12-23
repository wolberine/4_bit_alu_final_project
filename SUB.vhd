----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:43:00 11/19/2012 
-- Design Name: 
-- Module Name:    SUB - Behavioral 
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



entity SUB is
    Port ( a : in  STD_LOGIC_VECTOR (3 downto 0);
           b : in  STD_LOGIC_VECTOR (3 downto 0);
           cin : in  STD_LOGIC;
           sub_sum : out  STD_LOGIC_VECTOR (3 downto 0);
           cout : out  STD_LOGIC);
end SUB;

architecture Behavioral of SUB is
--Note: Pull up CIN for SUB.  Algorithm is as follows: A-B is A + (-B) + 1 where the 1 is CIN for 2's complement subtraction

	component ADD
		port(a, b :in std_logic_vector; cin :in std_logic; sum :out std_logic_vector; cout :out std_logic);
	end component;
	
	signal s1: std_logic_vector (3 downto 0):= "0000";
	
begin
	s1 <= NOT b;
	sub: ADD port map (a, s1, cin, sub_sum, cout);
	


end Behavioral;


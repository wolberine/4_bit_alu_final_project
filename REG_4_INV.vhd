----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:51:41 12/04/2012 
-- Design Name: 
-- Module Name:    REG_4_INV - Behavioral 
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


entity REG_4_INV is
    Port ( q : out  STD_LOGIC_VECTOR (3 downto 0);
           d : in  STD_LOGIC_VECTOR (3 downto 0);
           clk : in  STD_LOGIC;
           clear : in  STD_LOGIC);
end REG_4_INV;

architecture Behavioral of REG_4_INV is

begin
	process(clk,d,clear)
	begin
		if (clear='1') then
		q <="0000";
		elsif (clk'event and clk='0') then
			q <=d;
		End if;
End process;


end Behavioral;


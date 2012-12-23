----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:56:37 11/23/2012 
-- Design Name: 
-- Module Name:    DEC - Behavioral 
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



entity DEC is
    Port ( a : in  STD_LOGIC_VECTOR (3 downto 0);
           cin : in  STD_LOGIC;
           dec_out : out  STD_LOGIC_VECTOR (3 downto 0);
			  cout : out STD_LOGIC);
end DEC;

architecture Behavioral of DEC is

	component DEC_2_bit
		port(a0, a1, cin:in std_logic; dec_out0, dec_out1,cout:out std_logic);
	end component;

	signal s0: std_logic :='0';
	
begin

	dec0: DEC_2_bit port map (a(0),a(1), cin, dec_out(0), dec_out(1), s0);
	dec1: DEC_2_bit port map (a(2),a(3), s0, dec_out(2), dec_out(3), cout);


end Behavioral;


--------------------------2-bit dec begin------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity DEC_2_bit is
    Port ( a0,a1 : in  STD_LOGIC;
           cin : in  STD_LOGIC;
           dec_out0, dec_out1 : out  STD_LOGIC;
			  cout : out  STD_LOGIC);
end DEC_2_bit;

architecture Behavioral of DEC_2_bit is

	component DEC_1_bit
		port(a0, cin:in std_logic; dec_out,cout:out std_logic);
	end component;

	signal s0: std_logic :='0';
begin
	
	dec0: DEC_1_bit port map (a0, cin, dec_out0,s0);
	dec1: DEC_1_bit port map (a1, s0, dec_out1,cout);

end Behavioral;

--------------------------2-bit dec end------------------------------------
--------------------------1-bit dec begin------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity DEC_1_bit is
    Port ( a0 : in  STD_LOGIC;
           cin : in  STD_LOGIC;
           dec_out, cout : out  STD_LOGIC);
end DEC_1_bit;

architecture Behavioral of DEC_1_bit is

signal s0: std_logic :='0';

begin
	
	
	dec_out <= not(a0) xor cin;
	s0 <= not(a0) nand cin;
	cout <= not(a0) nand s0;

end Behavioral;

--------------------------1-bit dec end------------------------------------


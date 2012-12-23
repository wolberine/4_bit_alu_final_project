----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:00:00 11/27/2012 
-- Design Name: 
-- Module Name:    INC - Behavioral 
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


entity INC is
    Port ( a : in  STD_LOGIC_VECTOR (3 downto 0);
           cin : in  STD_LOGIC;
           inc_out : out  STD_LOGIC_VECTOR (3 downto 0);
           cout : out  STD_LOGIC);
end INC;

architecture Behavioral of INC is

	component INC_2_bit
		port(a0, a1, cin:in std_logic; inc_out0, inc_out1,cout:out std_logic);
	end component;

	signal s0: std_logic :='0';

begin

	inc0: INC_2_bit port map (a(0),a(1), cin, inc_out(0), inc_out(1), s0);
	inc1: INC_2_bit port map (a(2),a(3), s0, inc_out(2), inc_out(3), cout);


end Behavioral;

--------------------------2-bit inc begin------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity INC_2_bit is
    Port ( a0,a1 : in  STD_LOGIC;
           cin : in  STD_LOGIC;
           inc_out0, inc_out1 : out  STD_LOGIC;
			  cout : out  STD_LOGIC);
end INC_2_bit;

architecture Behavioral of INC_2_bit is

	component INC_1_bit
		port(a0, cin:in std_logic; inc_out,cout:out std_logic);
	end component;

	signal s0: std_logic :='0';

begin
	
	inc0: INC_1_bit port map (a0, cin, inc_out0,s0);
	inc1: INC_1_bit port map (a1, s0, inc_out1,cout);

end Behavioral;

--------------------------2-bit inc end------------------------------------

--------------------------1-bit inc begin------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity INC_1_bit is
    Port ( a0 : in  STD_LOGIC;
           cin : in  STD_LOGIC;
           inc_out, cout : out  STD_LOGIC);
end INC_1_bit;

architecture Behavioral of INC_1_bit is

signal s0: std_logic :='0';

begin
	
	
	inc_out <= a0 xor cin;
	cout <= a0 and cin;

end Behavioral;

--------------------------1-bit inc end------------------------------------

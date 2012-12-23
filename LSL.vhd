----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:03:11 11/29/2012 
-- Design Name: 
-- Module Name:    LSL - Behavioral 
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



entity LSL is
    Port ( a : in  STD_LOGIC_VECTOR (3 downto 0);
           shift : in  STD_LOGIC_VECTOR (2 downto 0); --bitmap the shift levels (4-bit, 2-bit, 1-bit)
			  lsl_out : out std_logic_vector (3 downto 0));
end LSL;

architecture Behavioral of LSL is

	component mux
		port(a, b, sel :in std_logic; mux_out :out std_logic);
	end component;

	signal s0,s1,s2,s3: std_logic := '0';
	signal s4,s5,s6,s7: std_logic := '0';
	
	begin
	
	--4-bit shift
	mux0: mux port map (a(0),'0',shift(2),s0);
	mux1: mux port map (a(1),'0',shift(2),s1);
	mux2: mux port map (a(2),'0',shift(2),s2);
	mux3: mux port map (a(3),'0',shift(2),s3);
	
	--2-bit shift
	mux4: mux port map (s0,'0',shift(1),s4);
	mux5: mux port map (s1,'0',shift(1),s5);
	mux6: mux port map (s2,s0,shift(1),s6);
	mux7: mux port map (s3,s1,shift(1),s7);
	
	--1-bit shift
	mux8: mux port map (s4,'0',shift(0),lsl_out(0));
	mux9: mux port map (s5,s4,shift(0),lsl_out(1));
	mux10: mux port map (s6,s5,shift(0),lsl_out(2));
	mux11: mux port map (s7,s6,shift(0),lsl_out(3));
	


end Behavioral;


-------------------ALU_OUTPUT_MUX BEGIN--------------------------------------------------------------------------
----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:18:30 11/26/2012 
-- Design Name: 
-- Module Name:    ALU_Output_Mux - Behavioral 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ALU_Output_Mux is
    Port ( ADD : in  STD_LOGIC_VECTOR (3 downto 0);
           SUB : in  STD_LOGIC_VECTOR (3 downto 0);
           LSL : in  STD_LOGIC_VECTOR (3 downto 0);
           LSR : in  STD_LOGIC_VECTOR (3 downto 0);
           AND_GATE : in  STD_LOGIC_VECTOR (3 downto 0);
           OR_GATE : in  STD_LOGIC_VECTOR (3 downto 0);
           SEL : in  STD_LOGIC_VECTOR (3 downto 0);
           ALU_OUTPUT : out  STD_LOGIC_VECTOR (3 downto 0));
end ALU_Output_Mux;

architecture Behavioral of ALU_Output_Mux is

begin

	
	
end Behavioral;

-------------------ALU_OUTPUT_MUX END--------------------------------------------------------------------------
-------------------TRI-STATE FROM "http://www.altera.com/support/examples/vhdl/v_prebus.html" BEGIN------------
LIBRARY IEEE;
    USE ieee.std_logic_1164.ALL;

ENTITY prebus IS
    PORT(
        my_in  : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
        sel    : IN STD_LOGIC;
        my_out : OUT STD_LOGIC_VECTOR(3 DOWNTO 0));
END prebus;

ARCHITECTURE maxpld OF prebus IS
BEGIN
    my_out <= "ZZZZZZZZ"
    WHEN (sel = '1')
    ELSE my_in;
END maxpld;

-------------------TRI-STATE FROM "http://www.altera.com/support/examples/vhdl/v_prebus.html" END------------
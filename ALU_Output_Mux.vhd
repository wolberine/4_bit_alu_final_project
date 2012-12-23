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

entity ALU_Output_Mux is
    Port ( ADD : in  STD_LOGIC_VECTOR (3 downto 0);
           SUB : in  STD_LOGIC_VECTOR (3 downto 0);
           LSL : in  STD_LOGIC_VECTOR (3 downto 0);
           LSR : in  STD_LOGIC_VECTOR (3 downto 0);
           AND_GATE : in  STD_LOGIC_VECTOR (3 downto 0);
           OR_GATE : in  STD_LOGIC_VECTOR (3 downto 0);
			  INC : in  STD_LOGIC_VECTOR (3 downto 0);
			  DEC : in STD_LOGIC_VECTOR (3 downto 0);
           SEL : in  STD_LOGIC_VECTOR (3 downto 0);
           ALU_OUTPUT : out  STD_LOGIC_VECTOR (3 downto 0));
end ALU_Output_Mux;

architecture Behavioral of ALU_Output_Mux is

    COMPONENT prebus
    PORT(
         my_in : IN  std_logic_vector(3 downto 0);
         sel : IN  std_logic;
         my_out : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
	 
	 COMPONENT logical_AND4
    PORT(
         a, b, c, d : IN  std_logic;
         and_out : OUT  std_logic
        );
    END COMPONENT;
	 
	 signal add_sel, sub_sel, lsl_sel, lsr_sel, and_sel, or_sel, inc_sel, dec_sel: std_logic :='0'; --tri-state buffer select line
    --signal add_out, sub_out, lsl_out, lsr_out, and_out, or_out, inc_out, dec_out: std_logic_vector(3 downto 0) :="0000"; --tri-state buffer output line
    signal INV_SEL : std_logic_vector (3 downto 0) := "0000"; --inversion of select signal
	
	 
	begin
	
	inversion: process (sel)
		begin
			INV_SEL <= not SEL;
		end process inversion;
	
	--decoder
	and_0: logical_AND4 port map (INV_SEL(0), INV_SEL(1), INV_SEL(2), INV_SEL(3), add_sel); --decodes "ADD" opcode "0000"
	and_1: logical_AND4 port map (SEL(0), INV_SEL(1), INV_SEL(2), INV_SEL(3), sub_sel); --decodes "SUB" opcode "0001"
	and_2: logical_AND4 port map (INV_SEL(0), SEL(1), INV_SEL(2), INV_SEL(3), lsl_sel); --decodes "LSL" opcode "0010"
	and_3: logical_AND4 port map (SEL(0), SEL(1), INV_SEL(2), INV_SEL(3), lsr_sel); --decodes "LSR" opcode "0011"
	and_4: logical_AND4 port map (INV_SEL(0), INV_SEL(1), SEL(2), INV_SEL(3), and_sel); --decodes "AND" opcode "0100"
	and_5: logical_AND4 port map (SEL(0), INV_SEL(1), SEL(2), INV_SEL(3), or_sel); --decodes "OR" opcode "0101"
	and_6: logical_AND4 port map (INV_SEL(0), SEL(1), SEL(2), INV_SEL(3), inc_sel); --decodes "INC" opcode "0110"
	and_7: logical_AND4 port map (SEL(0), SEL(1), SEL(2), INV_SEL(3), dec_sel); --decodes "DEC" opcode "0111"
	
	--tri_state
	
	tri_0: prebus port map(ADD, add_sel, ALU_OUTPUT); --ADD tri-state
	tri_1: prebus port map(SUB, sub_sel, ALU_OUTPUT); --SUB tri-state
	tri_2: prebus port map(LSL, lsl_sel, ALU_OUTPUT); --LSL tri-state
	tri_3: prebus port map(LSR, lsr_sel, ALU_OUTPUT); --LSR tri-state
	tri_4: prebus port map(AND_GATE, and_sel, ALU_OUTPUT); --AND tri-state
	tri_5: prebus port map(OR_GATE, or_sel, ALU_OUTPUT); --ORR tri-state
	tri_6: prebus port map(INC, inc_sel, ALU_OUTPUT); --INC tri-state
	tri_7: prebus port map(DEC, dec_sel, ALU_OUTPUT); --DEC tri-state

	
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
	 my_out <= my_in
    WHEN (sel = '1')
    ELSE "ZZZZ";
END maxpld;

-------------------TRI-STATE FROM "http://www.altera.com/support/examples/vhdl/v_prebus.html" END------------

-------------------logical_AND BEGIN------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity logical_AND4 is
    Port ( a, b, c, d : in  STD_LOGIC;
           and_out : out  STD_LOGIC);
end logical_AND4;

architecture Behavioral of logical_AND4 is

	signal s0: std_logic:='0' ;

begin
	s0 <= not(a and b and c and d); --implement as close to NAND as possible
	and_out <= not s0;

end Behavioral;

-------------------logical_AND END------------

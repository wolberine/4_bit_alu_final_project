----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:56:26 12/02/2012 
-- Design Name: 
-- Module Name:    top_level - Behavioral 
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

entity top_level is
    Port ( a : in  STD_LOGIC_VECTOR (3 downto 0);
           b : in  STD_LOGIC_VECTOR (3 downto 0);
           clk : in  STD_LOGIC;
           output : out  STD_LOGIC_VECTOR (3 downto 0);
           opcode : in  STD_LOGIC_VECTOR (3 downto 0);
           clear : in  STD_LOGIC);
end top_level;

architecture Behavioral of top_level is

--------------------------begin arithmetic and logic functions-----------------	
	component LSR is
    Port ( a : in  STD_LOGIC_VECTOR (3 downto 0);
           shift : in  STD_LOGIC_VECTOR (2 downto 0); --bitmap the shift levels (4-bit, 2-bit, 1-bit)
			  lsr_out : out std_logic_vector (3 downto 0));
	end component;
	
	component SUB is
    Port ( a : in  STD_LOGIC_VECTOR (3 downto 0);
           b : in  STD_LOGIC_VECTOR (3 downto 0);
           cin : in  STD_LOGIC;
           sub_sum : out  STD_LOGIC_VECTOR (3 downto 0);
           cout : out  STD_LOGIC);
	end component;
	
	component logical_OR is
    Port ( a : in  STD_LOGIC_VECTOR (3 downto 0);
           b : in  STD_LOGIC_VECTOR (3 downto 0);
           or_out : out  STD_LOGIC_VECTOR (3 downto 0));
	end component;
	
	component DEC is
    Port ( a : in  STD_LOGIC_VECTOR (3 downto 0);
           cin : in  STD_LOGIC;
           dec_out : out  STD_LOGIC_VECTOR (3 downto 0);
			  cout : out STD_LOGIC);
	end component;
	
	component ADD is
		Port ( a : in  STD_LOGIC_VECTOR (3 downto 0);
           b : in  STD_LOGIC_VECTOR (3 downto 0);
           cin : in  STD_LOGIC;
			  sum : out STD_LOGIC_VECTOR (3 downto 0);
			  cout : out STD_LOGIC);
	end component;
	
	component andgate is
    Port ( a : in  STD_LOGIC_VECTOR (3 downto 0);
           b : in  STD_LOGIC_VECTOR (3 downto 0);
           y : out  STD_LOGIC_VECTOR (3 downto 0)
			);
	end component;
	
	component LSL is
		 Port ( a : in  STD_LOGIC_VECTOR (3 downto 0);
				  shift : in  STD_LOGIC_VECTOR (2 downto 0); --bitmap the shift levels (4-bit, 2-bit, 1-bit)
				  lsl_out : out std_logic_vector (3 downto 0));
	end component;
	
	component INC is
    Port ( a : in  STD_LOGIC_VECTOR (3 downto 0);
           cin : in  STD_LOGIC;
           inc_out : out  STD_LOGIC_VECTOR (3 downto 0);
           cout : out  STD_LOGIC);
	end component;

-------------------end 's arithmetic and logic functions---------------
-------------------begin mux and reg functions-------------------------	
	component ALU_Output_Mux is
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
	end component;
	
	component REG_4 is
    Port ( q : out  STD_LOGIC_VECTOR (3 downto 0);
           d : in  STD_LOGIC_VECTOR (3 downto 0);
           clk : in  STD_LOGIC;
			clear : in  STD_LOGIC);
	end component;
	
	component REG_4_INV is
    Port ( q : out  STD_LOGIC_VECTOR (3 downto 0);
           d : in  STD_LOGIC_VECTOR (3 downto 0);
           clk : in  STD_LOGIC;
           clear : in  STD_LOGIC);
	end component;
-------------------end mux and reg functions---------------------------	
-------------------begin signal defintions--------------------------------
signal add_out, sub_out, lsl_out, lsr_out, and_out, or_out, inc_out, dec_out: std_logic_vector(3 downto 0) :="0000";
signal a_signal, b_signal, opcode_signal,mux_output_signal: std_logic_vector(3 downto 0) :="0000";
signal sub_cout, dec_cout, add_cout, inc_cout: std_logic :='0';

begin

-----begin input reg port maps-----------------------------
	a_reg: REG_4 port map (a_signal, a, clk, clear);
	b_reg: REG_4 port map (b_signal, b, clk, clear);
	opcode_reg: REG_4_INV port map (opcode_signal, opcode, clk, clear);
	
-----end input reg port maps-------------------------------

-----begin logic and arithmetic port maps------------------
	lsr0: LSR port map (a, b(2 downto 0), lsr_out);
	sub0: SUB port map (a, b, '1', sub_out, sub_cout);
	or0: 	logical_OR port map(a,b, or_out);
	dec0: DEC port map (a, '0', dec_out, dec_cout);
	add0: ADD port map (a, b, '0', add_out, add_cout);
	and0: ANDGATE port map(a, b, and_out);
	lsl0: LSL port map (a, b(2 downto 0), lsl_out);
	inc0: INC port map (a, '1', inc_out, inc_cout); --cin for INC has to be pulled high
-----end logic and arithmetic port maps--------------------

----begin mux port map----------------------------
	mux0: Alu_Output_Mux port map (add_out, sub_out, lsl_out, lsr_out, and_out, or_out, inc_out, dec_out, opcode, mux_output_signal);
----end mux port map------------------------------

-----begin output reg port maps-----------------------------
	mux_reg: REG_4_INV port map (output, mux_output_signal, clk, clear);
-----end output reg port maps-------------------------------
	
	

end Behavioral;


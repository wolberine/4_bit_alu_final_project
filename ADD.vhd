-----------------------ONE BIT ADDER BEGIN--------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity one_bit_adder is
    Port ( a0 : in  STD_LOGIC;
           b0 : in  STD_LOGIC;
           cin : in  STD_LOGIC;
           sum0 : out  STD_LOGIC;
           cout : out  STD_LOGIC);
end one_bit_adder;


architecture Behavioral of one_bit_adder is

signal s0: std_logic :='0' ;
begin
	s0 <= a0 xor b0; 
	sum0 <= s0 xor cin;
	cout <= ((a0 nand b0) nand (s0 nand cin));
end Behavioral;
-----------------------ONE BIT ADDER END----------------------------------
-----------------------TWO BIT ADDER BEGIN--------------------------------

Library IEEE;
use IEEE.std_logic_1164.ALL;

entity two_bit_adder is
    Port ( a0, b0, a1, b1 : in  STD_LOGIC;
           cin: in  STD_LOGIC;
           sum0, sum1 : out  STD_LOGIC;
           cout : out  STD_LOGIC);
end two_bit_adder;


architecture two_bit_adder_arch of two_bit_adder is

	component one_bit_adder
		port(a0, b0, cin:in std_logic; cout,sum0:out std_logic);
	end component;
	
	signal s1: std_logic :='0';
	
	begin
	add1: one_bit_adder port map (a0, b0, cin, s1, sum0);
	add2: one_bit_adder port map (a1, b1, s1, cout, sum1);
	
end two_bit_adder_arch;
-----------------------TWO BIT ADDER END--------------------------------
-----------------------FOUR BIT ADDER BEGIN-----------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ADD is
    Port ( a : in  STD_LOGIC_VECTOR (3 downto 0);
           b : in  STD_LOGIC_VECTOR (3 downto 0);
           cin : in  STD_LOGIC;
			  sum : out STD_LOGIC_VECTOR (3 downto 0);
			  cout : out STD_LOGIC);
end ADD;


architecture Behavioral of ADD is

	component two_bit_adder
		port(a0, b0, a1, b1, cin:in std_logic; sum0,sum1,cout:out std_logic);
	end component;
	
	signal s1: std_logic :='0';
	
	begin
		add1: two_bit_adder port map (a(0), b(0), a(1), b(1), cin, sum(0), sum(1), s1);
		add2: two_bit_adder port map (a(2), b(2), a(3), b(3), s1, sum(2), sum(3), cout);
		
end Behavioral;
-----------------------FOUR BIT ADDER BEGIN-----------------------------

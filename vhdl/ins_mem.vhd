library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.lib.all;

entity ins_mem is
	port (DIN : in std_logic_vector(15 downto 0);
			DOUT : out std_logic_vector(15 downto 0)
			);
end ins_mem;

architecture Logic of ins_mem is
	type input is array (32 downto 0) of std_logic_vector(15 downto 0);
	signal inputstruct : input;
begin
	inputstruct(0) <= "1011111010000000";  -- lw r2, 0x100
	inputstruct(1) <= "1011111011000010";  -- lw r3, 0x102
	inputstruct(2) <= "0000010011001010";  -- add r1, r2, r3
	inputstruct(3) <= "1111111001000100";  -- sw r1, 0x104
	inputstruct(4) <= "1011111001000100";  -- print r1
	inputstruct(5) <= "0000010011100110";	-- sub r4, r2, r3
	inputstruct(6) <= "0100001100000001";  -- beq r1, r4, 8
	inputstruct(7) <= "0000001100001110";  -- sub r1, r1, r4
	inputstruct(8) <= "1111111001000110";  -- sw r1, 0x106
	
	DOUT <= inputstruct(to_integer(unsigned(DIN)));
end Logic;
library ieee;
use ieee.std_logic_1164.all;
use work.lib.all;

entity pcjmp is
port(	PC_ADD	: in std_logic_vector(15 downto 0);
		JMP_ADD  : in std_logic_vector(11 downto 0);
		OUT_ADD 	: out std_logic_vector(15 downto 0));
end pcjmp;

architecture Logic of pcjmp is
begin
	OUT_ADD <= PC_ADD(15 downto 13) & JMP_ADD & '0';
end Logic;


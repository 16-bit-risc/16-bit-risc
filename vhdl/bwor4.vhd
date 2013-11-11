library ieee;
use ieee.std_logic_1164.all;
use work.lib.all;

entity bwor4 is
	port(	A, B : in std_logic_vector(3 downto 0);
			D : out std_logic_vector(3 downto 0)
			);
end bwor4;

architecture logic of bwor4 is
begin
	D <= A OR B;
end logic;
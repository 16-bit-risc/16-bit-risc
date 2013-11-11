-- BWAND4.vhdl

library ieee;
use ieee.std_logic_1164.all;
use work.lib.all;

entity bwand4 is
	port(	X, Y : in std_logic_vector(3 downto 0);
			D : out std_logic_vector(3 downto 0)
			);
end bwand4;

architecture logic of bwand4 is
begin
	D <= X AND Y;
end logic;
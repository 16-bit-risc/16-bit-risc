-- DCD3x8
-- 3-to-8 decoder

library ieee;
use ieee.std_logic_1164.all;
use work.lib.all;

entity dcd3x8 is
	port(en : in std_logic_vector(2 downto 0);
		 de : out std_logic_vector(7 downto 0)
		 );
end dcd3x8;

architecture logic of dcd3x8 is
begin
	with en select de <= "00000001" when "000",
						 "00000010" when "001",
						 "00000100" when "010",
						 "00001000" when "011",
						 "00010000" when "100",
						 "00100000" when "101",
						 "01000000" when "110",
						 "10000000" when others;
end logic;
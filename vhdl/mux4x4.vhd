library ieee;
use ieee.std_logic_1164.all;
use work.lib.all;

entity mux4x4 is
	port(s : in std_logic_vector(1 downto 0);
		 d0, d1, d2, d3: in std_logic_vector(3 downto 0);
		 output: out std_logic_vector(3 downto 0)
		);
end mux4x4;

architecture logic of mux4x4 is
begin
	with s select output <= d0 when "00",
							d1 when "01",
							d2 when "10",
							d3 when "11";
end logic;
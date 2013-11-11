library ieee;
use ieee.std_logic_1164.all;
use work.lib.all;

entity pinv4 is
	port(	A : in std_logic_vector(3 downto 0);
			EN : in std_logic;
			D : out std_logic_vector(3 downto 0)
			);
end pinv4;

architecture logic of pinv4 is
	begin
		process(EN)
		begin
			if EN = '1' then
				D <= NOT A;
			else
				D <= A;	
			end if;
		end process;
	end logic;
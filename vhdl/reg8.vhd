-- REG8
-- 8 bit register file

library ieee;
use ieee.std_logic_1164.all;
use work.lib.all;

entity reg8 is
	port(D: in std_logic_vector(7 downto 0);
		 EN: in std_logic;
		 CLK: in std_logic;
		 Q: out std_logic_vector(7 downto 0)
		 );
end reg8;

architecture logic of reg8 is
begin
	process(CLK, EN)
	begin
		if (CLK'event and CLK = '1') and EN = '1' then
			Q <= D;
		end if;
	end process;
end logic;
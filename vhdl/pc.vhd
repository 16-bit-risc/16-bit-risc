-- PC

library ieee;
use ieee.std_logic_1164.all;
use work.lib.all;

entity pc is
	port(	CLK, EN, RST : in std_logic;
			INPUT : in std_logic_vector(15 downto 0);
			OUTPUT : out std_logic_vector(15 downto 0)
			);
end pc;

architecture logic of pc is
begin
	process(CLK, EN, RST)
	begin
		if (CLK'event and CLK = '1') and EN = '1' then
			OUTPUT <= INPUT;
		end if;
		if (CLK'event and CLK = '1') and RST = '1' then
			 OUTPUT <= "0000000000000000";	
		end if;
	end process;
end logic;
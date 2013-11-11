library ieee;
use ieee.std_logic_1164.all;
use work.lib.all;

entity inctwo is
	port (DIN : in std_logic_vector(15 downto 0);
			DOUT : out std_logic_vector(15 downto 0));
end inctwo;

architecture Logic of inctwo is
begin
	ADD_COMP : add16 port map(DIN,"0000000000000010",DOUT);
end Logic;
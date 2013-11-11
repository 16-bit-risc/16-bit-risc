library ieee;
use ieee.std_logic_1164.all;
use work.lib.all;

entity shlone is
	port (DIN : in std_logic_vector(15 downto 0);
			DOUT : out std_logic_vector(15 downto 0));
end shlone;

architecture Logic of shlone is

begin

DOUT<=DIN(14 downto 0)&'0';

end Logic;
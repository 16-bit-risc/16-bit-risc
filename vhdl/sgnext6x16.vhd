library ieee;
use ieee.std_logic_1164.all;
use work.lib.all;

entity sgnext6x16 is
	port (DIN : in std_logic_vector(5 downto 0);
			DOUT : out std_logic_vector(15 downto 0));
end sgnext6x16;

architecture Logic of sgnext6x16 is

begin

DOUT<=DIN(5)&DIN(5)&DIN(5)&DIN(5)&DIN(5)&DIN(5)&DIN(5)&DIN(5)&DIN(5)&DIN(5)&DIN;
end Logic;
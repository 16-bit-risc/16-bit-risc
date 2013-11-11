library ieee;
use ieee.std_logic_1164.all;
use work.lib.all;

entity mux2x16 is
port(S : in std_logic;
	  X,Y : in std_logic_vector(15 downto 0);
	  O : out std_logic_vector(15 downto 0));
end mux2x16;

architecture Logic of mux2x16 is
begin
with S select O <= X when '0',
                   Y when '1',
                   "XXXXXXXXXXXXXXXX" when others;

end Logic;
library ieee;
use ieee.std_logic_1164.all;
use work.lib.all;

entity add16 is
	port (X,Y : in std_logic_vector(15 downto 0);
			Z : out std_logic_vector(15 downto 0));
end add16;

architecture Logic of add16 is
signal C : std_logic_vector(4 downto 0);
begin
C(0)<='0';
adx : for i in 0 to 3 generate
	 ADD_COMP : add4 port map(X((i*4)+3 downto i*4),Y((i*4)+3 downto i*4),C(i),Z((i*4)+3 downto i*4),C(i+1));
end generate adx;

end Logic;
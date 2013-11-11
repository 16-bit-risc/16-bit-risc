library ieee;
use ieee.std_logic_1164.all;
use IEEE.Numeric_Std.all;
use work.lib.all;

entity dat_mem is
	port (DIN, ADD : in std_logic_vector(15 downto 0);
			WE, RE, CLK : in std_logic;
			DOUT : out std_logic_vector(15 downto 0)
			);
end dat_mem;

architecture Logic of dat_mem is

	type memT is array (512 downto 0) of std_logic_vector(15 downto 0);
	signal mem : memT := (256 => x"0100", 258 => x"0102", others => x"0000");
	signal read_address : std_logic_vector(15 downto 0);

begin	
	process(CLK)
	begin
		if rising_edge(CLK) then 
			if WE = '1' then
				mem(to_integer(unsigned(ADD))) <= DIN;
			end if;
			read_address <= ADD;
		end if;
	end process;
	
	process(RE)
	begin
		if RE = '1' then
			DOUT <= mem(to_integer(unsigned(read_address)));
		else
			DOUT <= "ZZZZZZZZZZZZZZZZ";
		end if;
	end process;
end Logic;
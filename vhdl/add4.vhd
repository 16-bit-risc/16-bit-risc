-- ADD4

library ieee;
use ieee.std_logic_1164.all;
use work.lib.all;

entity add4 is
	port(	A, B : in std_logic_vector(3 downto 0);
			CIN : in std_logic;
			D : out std_logic_vector(3 downto 0);
			COUT : out std_logic
			);
end add4;

architecture logic of add4 is

signal sum : std_logic_vector(3 downto 0);
signal cG : std_logic_vector(3 downto 0);
signal cP : std_logic_vector(3 downto 0);
signal cI : std_logic_vector(3 downto 1);

begin
	sum <= A xor B;
	cG <= A and B;
	cP <= A or B;
	process(cG, cP, cI)
	begin
		cI(1) <= cG(0) or (cP(0) and CIN);
		for i in 1 to 2 LOOP
				cI(i+1) <= cG(i) or (cP(i) and cI(i));
				end loop;
		COUT <= cG(3) or (cP(3) and cI(3));
	end process;
	
	D(0) <= sum(0) xor CIN;
	D(3 downto 1) <= sum(3 downto 1) xor cI(3 downto 1);
end logic;
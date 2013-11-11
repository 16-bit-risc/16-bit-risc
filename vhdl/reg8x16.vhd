-- REG8x16
-- 8x16 registry file

library ieee;
use ieee.std_logic_1164.all;
use work.lib.all;

entity reg8x16 is
	port(ADD_R1 : in std_logic_vector(2 downto 0);
		 ADD_R2 : in std_logic_vector(2 downto 0);
		 ADD_W	: in std_logic_vector(2 downto 0);
		 WE, CLK : in std_logic;
		 DIN	: in std_logic_vector(15 downto 0);
		 DOUT1	: out std_logic_vector(15 downto 0);
		 DOUT2	: out std_logic_vector(15 downto 0)
		 );
end reg8x16;

architecture logic of reg8x16 is
signal o0, o1, o2, o3, o4, o5, o6, o7 : std_logic_vector(15 downto 0);
signal ena : std_logic_vector(7 downto 0);

signal tmp00, tmp01, tmp02,tmp03, tmp10, tmp11, tmp12, tmp13 : std_logic_vector(7 downto 0);

begin
	R00: REG8 port map("00000000", ena(0) and WE, CLK, o0(7 downto 0)); --reg0
	R01: REG8 port map("00000000", ena(0) and WE, CLK, o0(15 downto 8));
	R10: REG8 port map(DIN(7 downto 0), ena(1) and WE, CLK, o1(7 downto 0)); --reg1
	R11: REG8 port map(DIN(15 downto 8), ena(1) and WE, CLK, o1(15 downto 8));
	R20: REG8 port map(DIN(7 downto 0), ena(2) and WE, CLK, o2(7 downto 0)); --reg2
	R21: REG8 port map(DIN(15 downto 8), ena(2) and WE, CLK, o2(15 downto 8));
	R30: REG8 port map(DIN(7 downto 0), ena(3) and WE, CLK, o3(7 downto 0)); --reg3
	R31: REG8 port map(DIN(15 downto 8), ena(3) and WE, CLK, o3(15 downto 8));
	R40: REG8 port map(DIN(7 downto 0), ena(4) and WE, CLK, o4(7 downto 0)); --reg4
	R41: REG8 port map(DIN(15 downto 8), ena(4) and WE, CLK, o4(15 downto 8));
	R50: REG8 port map(DIN(7 downto 0), ena(5) and WE, CLK, o5(7 downto 0)); --reg5
	R51: REG8 port map(DIN(15 downto 8), ena(5) and WE, CLK, o5(15 downto 8));
	R60: REG8 port map(DIN(7 downto 0), ena(6) and WE, CLK, o6(7 downto 0)); --reg6
	R61: REG8 port map(DIN(15 downto 8), ena(6) and WE, CLK, o6(15 downto 8));
	R70: REG8 port map(DIN(7 downto 0), ena(7) and WE, CLK, o7(7 downto 0)); --reg7
	R71: REG8 port map(DIN(15 downto 8), ena(7) and WE, CLK, o7(15 downto 8));
	
	M000: MUX4x4 port map (ADD_R1(1 downto 0), o0(3 downto 0), o1(3 downto 0), o2(3 downto 0), o3(3 downto 0), tmp00(3 downto 0));
	M001: MUX4x4 port map (ADD_R1(1 downto 0), o4(3 downto 0), o5(3 downto 0), o6(3 downto 0), o7(3 downto 0), tmp00(7 downto 4));
	M002: MUX4x4 port map ('0'&ADD_R1(2), tmp00(3 downto 0), tmp00(7 downto 4), "0000", "0000", DOUT1(3 downto 0));
	
	M003: MUX4x4 port map (ADD_R1(1 downto 0), o0(7 downto 4), o1(7 downto 4), o2(7 downto 4), o3(7 downto 4), tmp01(3 downto 0));
	M004: MUX4x4 port map (ADD_R1(1 downto 0), o4(7 downto 4), o5(7 downto 4), o6(7 downto 4), o7(7 downto 4), tmp01(7 downto 4));
	M005: MUX4x4 port map ('0'&ADD_R1(2), tmp01(3 downto 0), tmp01(7 downto 4), "0000", "0000", DOUT1(7 downto 4));
	
	M006: MUX4x4 port map (ADD_R1(1 downto 0), o0(11 downto 8), o1(11 downto 8), o2(11 downto 8), o3(11 downto 8), tmp02(3 downto 0));
	M007: MUX4x4 port map (ADD_R1(1 downto 0), o4(11 downto 8), o5(11 downto 8), o6(11 downto 8), o7(11 downto 8), tmp02(7 downto 4));
	M008: MUX4x4 port map ('0'&ADD_R1(2), tmp02(3 downto 0), tmp02(7 downto 4), "0000", "0000", DOUT1(11 downto 8));
	
	M009: MUX4x4 port map (ADD_R1(1 downto 0), o0(15 downto 12), o1(15 downto 12), o2(15 downto 12), o3(15 downto 12), tmp03(3 downto 0));
	M010: MUX4x4 port map (ADD_R1(1 downto 0), o4(15 downto 12), o5(15 downto 12), o6(15 downto 12), o7(15 downto 12), tmp03(7 downto 4));
	M011: MUX4x4 port map ('0'&ADD_R1(2), tmp03(3 downto 0), tmp03(7 downto 4), "0000", "0000", DOUT1(15 downto 12));
	
	M100: MUX4x4 port map (ADD_R2(1 downto 0), o0(3 downto 0), o1(3 downto 0), o2(3 downto 0), o3(3 downto 0), tmp10(3 downto 0));
	M101: MUX4x4 port map (ADD_R2(1 downto 0), o4(3 downto 0), o5(3 downto 0), o6(3 downto 0), o7(3 downto 0), tmp10(7 downto 4));
	M102: MUX4x4 port map ('0'&ADD_R2(2), tmp10(3 downto 0), tmp10(7 downto 4), "0000", "0000", DOUT2(3 downto 0));
	
	M103: MUX4x4 port map (ADD_R2(1 downto 0), o0(7 downto 4), o1(7 downto 4), o2(7 downto 4), o3(7 downto 4), tmp11(3 downto 0));
	M104: MUX4x4 port map (ADD_R2(1 downto 0), o4(7 downto 4), o5(7 downto 4), o6(7 downto 4), o7(7 downto 4), tmp11(7 downto 4));
	M105: MUX4x4 port map ('0'&ADD_R2(2), tmp11(3 downto 0), tmp11(7 downto 4), "0000", "0000", DOUT2(7 downto 4));
	
	M106: MUX4x4 port map (ADD_R2(1 downto 0), o0(11 downto 8), o1(11 downto 8), o2(11 downto 8), o3(11 downto 8), tmp12(3 downto 0));
	M107: MUX4x4 port map (ADD_R2(1 downto 0), o4(11 downto 8), o5(11 downto 8), o6(11 downto 8), o7(11 downto 8), tmp12(7 downto 4));
	M108: MUX4x4 port map ('0'&ADD_R2(2), tmp12(3 downto 0), tmp12(7 downto 4), "0000", "0000", DOUT2(11 downto 8));
	
	M109: MUX4x4 port map (ADD_R2(1 downto 0), o0(15 downto 12), o1(15 downto 12), o2(15 downto 12), o3(15 downto 12), tmp13(3 downto 0));
	M110: MUX4x4 port map (ADD_R2(1 downto 0), o4(15 downto 12), o5(15 downto 12), o6(15 downto 12), o7(15 downto 12), tmp13(7 downto 4));
	M111: MUX4x4 port map ('0'&ADD_R2(2), tmp13(3 downto 0), tmp13(7 downto 4), "0000", "0000", DOUT2(15 downto 12));
	
	DE : DCD3x8 port map (ADD_W, ena);
	
end logic;
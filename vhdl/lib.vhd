library ieee;
use ieee.std_logic_1164.all;

package lib is
	component add4
		port(	A, B : in std_logic_vector(3 downto 0);
				CIN : in std_logic;
				D : out std_logic_vector(3 downto 0);
				COUT : out std_logic
				);
	end component;
	component add16 is
		port(	X,Y : in std_logic_vector(15 downto 0);
				Z : out std_logic_vector(15 downto 0)
				);
	end component;
	component REG8x16 is
		port(	ADD_R1 : in std_logic_vector(2 downto 0);
				ADD_R2 : in std_logic_vector(2 downto 0);
				ADD_W	: in std_logic_vector(2 downto 0);
				WE, CLK : in std_logic;
				DIN	: in std_logic_vector(15 downto 0);
				DOUT1	: out std_logic_vector(15 downto 0);
				DOUT2	: out std_logic_vector(15 downto 0)
				);
	end component;
	component REG8 is
		port(	D: in std_logic_vector(7 downto 0);
				EN: in std_logic;
				CLK: in std_logic;
				Q: out std_logic_vector(7 downto 0)
				);
	end component;
	component DCD3x8 is
		port(	en : in std_logic_vector(2 downto 0);
				de : out std_logic_vector(7 downto 0)
				);
	end component;
	component PINV4 is
		port(	A : in std_logic_vector(3 downto 0);
				EN : in std_logic;
				D : out std_logic_vector(3 downto 0)
				);
	end component;
	component MUX4x4 is
		port(	s : in std_logic_vector(1 downto 0);
				d0, d1, d2, d3: in std_logic_vector(3 downto 0);
				output: out std_logic_vector(3 downto 0)
				);
	end component;
	component BWAND4 is
		port(	X, Y : in std_logic_vector(3 downto 0);
				D : out std_logic_vector(3 downto 0)
				);
	end component;
	component BWOR4 is
		port(	A, B : in std_logic_vector(3 downto 0);
				D : out std_logic_vector(3 downto 0)
				);
	end component;
	component ALU16 is
		port(	A, B : in std_logic_vector(15 downto 0);
				SEL : in std_logic_vector(2 downto 0);
				F : out std_logic_vector(15 downto 0);
				COUT, OVERFLOW, ZERO : out std_logic
				);
	end component;
	component ALU4 is
		port(	A, B : in std_logic_vector(3 downto 0);
				LESS, CIN : in std_logic;
				SEL : in std_logic_vector(2 downto 0);
				F : out std_logic_vector(3 downto 0);
				COUT, OVERFLOW, SET, ZERO : out std_logic
				);
	end component;
	component shlone is
		port (DIN : in std_logic_vector(15 downto 0);
				DOUT : out std_logic_vector(15 downto 0));
	end component;
	component sgnext6x16 is
		port(	DIN : in std_logic_vector(5 downto 0);
				DOUT : out std_logic_vector(15 downto 0));
	end component;
	component mux3x16 is
		port(	S : in std_logic_vector(1 downto 0);
				X,Y,Z : in std_logic_vector(15 downto 0);
				O : out std_logic_vector(15 downto 0)
				);
	end component;
	component pc is
		port(	CLK, EN, RST : in std_logic;
				INPUT : in std_logic_vector(15 downto 0);
				OUTPUT : out std_logic_vector(15 downto 0)
				);
	end component;
	
	component inctwo is
		port(	DIN : in std_logic_vector(15 downto 0);
				DOUT : out std_logic_vector(15 downto 0));
	end component;
	component ins_mem is
		port(	DIN : in std_logic_vector(15 downto 0);
				DOUT : out std_logic_vector(15 downto 0)
				);
	end component;
	component dat_mem is
		port(	DIN, ADD : in std_logic_vector(15 downto 0);
				WE, RE, CLK : in std_logic;
				DOUT : out std_logic_vector(15 downto 0)
				);
	end component;
	component pcjmp is
		port(	PC_ADD	: in std_logic_vector(15 downto 0);
				JMP_ADD  : in std_logic_vector(11 downto 0);
				OUT_ADD 	: out std_logic_vector(15 downto 0));
	end component;
	component mux2x16 is
		port(	S : in std_logic_vector(0 downto 0);
				X,Y : in std_logic_vector(15 downto 0);
				O : out std_logic_vector(15 downto 0)
				);
	end component;
	component mux2x3 is
		port(	S : in std_logic_vector(0 downto 0);
				X,Y : in std_logic_vector(2 downto 0);
				O : out std_logic_vector(2 downto 0));
	end component;
	component control is
		port(	op : in std_logic_vector(3 downto 0);
				funct : in std_logic_vector(2 downto 0);
				RegDst, Branch, MemRead, MemtoReg, MemWrite, ALUSrc, RegWrite : out std_logic;
				ALUOp : out std_logic_vector(2 downto 0)
				);
	end component;
	component fts IS
		PORT( hexin :IN STD_LOGIC_VECTOR(0 TO 3);
				dispout :OUT STD_LOGIC_VECTOR(0 TO 6));
	end component;
end lib;
library ieee;
use ieee.std_logic_1164.all;
use work.lib.all;

entity control is
	port(	op : in std_logic_vector(3 downto 0);
			funct : in std_logic_vector(2 downto 0);
			RegDst, Jump, Branch, MemRead, MemtoReg, MemWrite, ALUSrc, RegWrite : out std_logic;
			ALUOp : out std_logic_vector(2 downto 0)
			);
end control;

architecture logic of control is
begin
	process(op, funct)
	begin
	if op = "0000" then
		RegDst <= '1';
		case funct is
			when "010" => 	Jump <= '0';
								Branch <= '0';
								MemRead <= '0';
								MemtoReg <= '1';
								ALUOp <= "010";  --add
								MemWrite <= '0';
								ALUSrc <= '0';
								RegWrite <= '1';
			when "110" => 	Jump <= '0';
								Branch <= '0';
								MemRead <= '0';
								MemtoReg <= '1';
								ALUOp <= "110";  --sub
								MemWrite <= '0';
								ALUSrc <= '0';
								RegWrite <= '1';
			when "000" => 	Jump <= '0';
								Branch <= '0';
								MemRead <= '0';
								MemtoReg <= '1';
								ALUOp <= "000";  --and
								MemWrite <= '0';
								ALUSrc <= '0';
								RegWrite <= '1';
			when "001" => 	Jump <= '0';
								Branch <= '0';
								MemRead <= '0';
								MemtoReg <= '1';
								ALUOp <= "001";  --or
								MemWrite <= '0';
								ALUSrc <= '0';
								RegWrite <= '1';
			when "111" => 	Jump <= '0';
								Branch <= '0';
								MemRead <= '0';
								MemtoReg <= '1';
								ALUOp <= "111";  --slt
								MemWrite <= '0';
								ALUSrc <= '0';
								RegWrite <= '1';
			when others => RegDst <= 'X';
								Jump <= 'X';
								Branch <= 'X';
								MemRead <= 'X';
								MemtoReg <= 'X';
								ALUOp <= "XXX";  --others
								MemWrite <= 'X';
								ALUSrc <= 'X';
								RegWrite <= 'X';
		end case;
	else
		case op is
			when "1011" => RegDst <= '1';
								Jump <= '0';
								Branch <= '0';
								MemRead <= '1';
								MemtoReg <= '0';
								ALUOp <= "010";  --lw
								MemWrite <= '0';
								ALUSrc <= '1';
								RegWrite <= '1';
			when "1111" => RegDst <= '0';
								Jump <= '0';
								Branch <= '0';
								MemRead <= '0';
								MemtoReg <= '0';
								ALUOp <= "010";  --sw
								MemWrite <= '1';
								ALUSrc <= '1';
								RegWrite <= '0';
			when "0100" => RegDst <= '0';
								Jump <= '0';
								Branch <= '1';
								MemRead <= '0';
								MemtoReg <= '0';
								ALUOp <= "110";  --beq
								MemWrite <= '0';
								ALUSrc <= '0';
								RegWrite <= '0';
			when "0010" => RegDst <= '0';
								Jump <= '1';
								Branch <= '0';
								MemRead <= '0';
								MemtoReg <= '0';
								ALUOp <= "000";  --j
								MemWrite <= '0';
								ALUSrc <= '0';
								RegWrite <= '0';
			when others => RegDst <= 'X';
								Jump <= 'X';
								Branch <= 'X';
								MemRead <= 'X';
								MemtoReg <= 'X';
								ALUOp <= "XXX";  --others
								MemWrite <= 'X';
								ALUSrc <= 'X';
								RegWrite <= 'X';
		end case;
	end if;
	end process;
end logic;
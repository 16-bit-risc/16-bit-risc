LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE work.lib.all;

ENTITY fts IS
	PORT( hexin :IN STD_LOGIC_VECTOR(0 TO 3);
			dispout :OUT STD_LOGIC_VECTOR(0 TO 6));
END fts;

ARCHITECTURE Structure OF fts IS
BEGIN
	PROCESS(hexin)
	BEGIN
		IF hexin = "0000" THEN --0
			dispout <= "0000001";
		END IF;
		IF hexin = "0001" THEN --1
			dispout <= "1001111";
		END IF;
		IF hexin = "0010" THEN --2
			dispout <= "0010010";
		END IF;
		IF hexin = "0011" THEN --3
			dispout <= "0000110";
		END IF;
		IF hexin = "0100" THEN --4
			dispout <= "1001100";
		END IF;
		IF hexin = "0101" THEN --5
			dispout <= "0100100";
		END IF;
		IF hexin = "0110" THEN --6
			dispout <= "0100000";
		END IF;
		IF hexin = "0111" THEN --7
			dispout <= "0001111";
		END IF;
		IF hexin = "1000" THEN --8
			dispout <= "0000000";
		END IF;
		IF hexin = "1001" THEN --9
			dispout <= "0001100";
		END IF;
		IF hexin = "1010" THEN --A
			dispout <= "0001000";
		END IF;
		IF hexin = "1011" THEN --B
			dispout <= "1100000";
		END IF;
		IF hexin = "1100" THEN --C
			dispout <= "0110001";
		END IF;
		IF hexin = "1101" THEN --D
			dispout <= "1000010";
		END IF;
		IF hexin = "1110" THEN --E
			dispout <= "0110000";
		END IF;
		IF hexin = "1111" THEN --F
			dispout <= "0111000";
		END IF;
	END PROCESS;
END Structure;
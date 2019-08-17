library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;

entity dencoder is
	port(entrada_colum: in  std_logic_vector(3 downto 0);
			entrada_fila: in std_logic_vector(3 downto 0);
			Output: out std_logic_vector(3 downto 0));
end dencoder;

ARCHITECTURE conf OF dencoder IS
	BEGIN
		Output<="0001" when entrada_colum & entrada_fila<="10001000" else--1
				  "0010" when entrada_colum & entrada_fila<="10000100" else--2
				  "0011" when entrada_colum & entrada_fila<="10000010" else--3
				  "0100" when entrada_colum & entrada_fila<="01001000" else--4
				  "0101" when entrada_colum & entrada_fila<="01000100" else--5
				  "0110" when entrada_colum & entrada_fila<="01000010" else--6
				  "0111" when entrada_colum & entrada_fila<="00101000" else--7
				  "1000" when entrada_colum & entrada_fila<="00100100" else--8
				  "1001" when entrada_colum & entrada_fila<="00100010" else--9
				  "0000" when entrada_colum & entrada_fila<="00010100" else--0
				  "1111";--A
END conf;
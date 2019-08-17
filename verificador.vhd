library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;

entity verificador is
	port( A0,B0,C0,D0,A1,B1,C1,D1: in  std_logic_vector(3 downto 0);
			validados: out std_logic_vector(3 downto 0));
end verificador;
architecture Behavioral of verificador is
	begin
	
	validados(0)<='1' when A0 = A1 else '0';
	validados(1)<='1' when B0 = B1 else '0';
	validados(2)<='1' when C0 = C1 else '0';
	validados(3)<='1' when D0 = D1 else '0';

end Behavioral;
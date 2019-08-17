library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;

entity comparador is
	port( A0,A1: in  std_logic_vector(5 downto 0);
			validado: out std_logic);
end comparador;
architecture Behavioral of comparador is
	begin
	
	validado<='1' when A0 = A1 else '0';

end Behavioral;
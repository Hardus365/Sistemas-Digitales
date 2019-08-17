library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity num9 is
port(salida: out std_logic_vector(3 downto 0));
end num9;

architecture solve of num9 is
begin
salida<="1001";
end solve;
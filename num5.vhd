library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity num5 is
port(salida: out std_logic_vector(3 downto 0));
end num5;

architecture solve of num5 is
begin
salida<="0101";
end solve;
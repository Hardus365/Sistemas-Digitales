library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity num7 is
port(salida: out std_logic_vector(3 downto 0));
end num7;

architecture solve of num7 is
begin
salida<="0111";
end solve;
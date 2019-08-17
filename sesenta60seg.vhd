library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity sesenta60seg is
port(salida: out std_logic_vector(5 downto 0));
end sesenta60seg;

architecture solve of sesenta60seg is
begin
salida<="111100";
end solve;
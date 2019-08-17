library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity treinta30seg is
port(salida: out std_logic_vector(5 downto 0));
end treinta30seg;

architecture solve of treinta30seg is
begin
salida<="011110";
end solve;
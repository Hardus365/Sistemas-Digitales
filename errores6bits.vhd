library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity errores6bits is
port(salida: out std_logic_vector(5 downto 0));
end errores6bits;

architecture solve of errores6bits is
begin
salida<="000011";
end solve;
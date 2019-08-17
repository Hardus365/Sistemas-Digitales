-- multiplica por "n" un valor de frecuencia de entrada. salida=entrada*n
library ieee;
use ieee.std_logic_1164.all;

entity m_frec is
generic (n: integer:=10); --Define numero N multiplicador
port (	entrada: in std_logic;
clk_27Mhz:in std_logic;
salida: out std_logic);
end m_frec;

architecture rtl of m_frec is 
signal cuenta,cuenta2,div,M: integer:=0;
signal f_in,f_sal:std_logic;
begin
process (clk_27Mhz)
begin
if (clk_27Mhz'event and clk_27Mhz = '1') then
f_in <= entrada;
end if;
end process;
process (f_in,clk_27Mhz)
begin
if (f_in = '1') then
cuenta <= 0;
elsif (clk_27Mhz'event and clk_27Mhz = '0') then
cuenta <= cuenta + 1;
end if;
end process;
process (f_in)
begin
if (f_in'event and f_in = '1') then
M <= cuenta;
end if;
end process;
div <= (M-1)/N;
process (clk_27Mhz)
begin
if (Clk_27Mhz'event and Clk_27Mhz = '1') then
if (cuenta2 = div) then
cuenta2 <= 0;
f_sal <= not f_sal;
else cuenta2 <= cuenta2 + 1;
end if;
end if;
end process;
salida <= f_sal;
end rtl; 
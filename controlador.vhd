library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity controlador is
	Port ( clock, RESET, start, or_teclado, valido, sensor, flanco, temp, error: in STD_LOGIC;
		enD1, enD2, enD3, enD4, enR5, enError, enTiempo, ST, alarma, puerta, Rerror, Rtiempo: out STD_LOGIC;
		state: out std_logic_vector(3 downto 0));
end controlador;
architecture solucion of controlador is 
type estado is (Ta, Tb, Tc, Td, Te, Tf, Tg, Th, Ti, Tj, Tk, Tl, Tm, Tn, Tp, Tq); 
signal y : estado;
begin 
process (clock, RESET)
	begin 
	if RESET = '1' then y<= Ta;
	elsif clock' event and clock = '1' then 
	case y is 
		when Ta => if start='1' then y<= Tb; else y<= Ta; end if;
		when Tb => if start='0' then y<= Tc; else y<= Tb; end if;
		when Tc => if or_teclado= '1' then y<= Td; else y<= Tc; end if;
		when Td => if or_teclado= '0' then y<= Te; else y<= Td; end if;
		when Te => if or_teclado= '1' then y<= Tf; else y<= Te; end if;
		when Tf => if or_teclado= '0' then y<= Tg; else y<= Tf; end if;
		when Tg => if or_teclado= '1' then y<= Th; else y<= Tg; end if;
		when Th => if or_teclado= '0' then y<= Ti; else y<= Th; end if;
		when Ti => if or_teclado= '1' then y<= Tj; else y<= Ti; end if;
		when Tj => if or_teclado= '0' then y<= Tk; else y<= Tj; end if;
		when Tk => if valido= '1' then y<= Tm; else y<= Tl; end if;
		when Tl => if error= '0' then y<= Tc; else y<= Tn; end if;
		when Tm => if sensor= '0' then y<= Tc; 
						elsif (sensor='1' and flanco='0' and temp= '1') then y<= Tp; end if;
		when Tn => if (flanco= '0' and temp= '1') then y<= Tc; else y<= Tn; end if;
		when Tp => y<= Tq;
		when Tq => if (flanco= '0' and temp= '1') then y<= Tc; else y<= Tq; end if;
	end case;
	end if;
end process;
process (y)
	begin
	enD1<='0'; enD2<='0'; enD3<='0'; enD4<='0'; enR5<='0'; enError<='0';
	enTiempo<='0'; ST<='0'; alarma<='0'; puerta<='0'; Rerror<='0'; Rtiempo<='0';
	case y is 
		when Ta => state<="0000";
		when Tb => state<="0001";
		when Tc => state<="0010";if or_teclado= '1' then enD1<='1';end if;
		when Td => state<="0011";
		when Te => state<="0100";if or_teclado= '1' then enD2<='1'; end if;
		when Tf => state<="0101";
		when Tg => state<="0110";if or_teclado= '1' then enD3<='1'; end if;
		when Th => state<="0111";
		when Ti => state<="1000";if or_teclado= '1' then enD4<='1'; end if;
		when Tj => state<="1001";
		when Tk => state<="1010";if valido= '1' then Rerror<='1';Rtiempo<='1'; puerta<='1'; enR5<='1'; 
				else enError<='1'; end if;
		when Tl => state<="1011";if error= '1' then ST<='1'; enR5<='1'; Rtiempo<='1'; end if;
		when Tm => state<="1100";puerta<='1';if (sensor= '1' and flanco<='1') then enTiempo<='1';end if;
		when Tn => state<="1101";alarma<='1';if flanco<='1' then enTiempo<='1';end if;Rerror<='1';
		when Tp => state<="1110";Rtiempo<='1'; ST<='1'; enR5<='1';
		when Tq => state<="1111";alarma<='1';if flanco<='1' then enTiempo<='1';end if;
	end case;
end process;
end solucion;
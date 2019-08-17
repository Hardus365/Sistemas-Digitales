Library IEEE;
USE IEEE.Std_logic_1164.all;

entity DFlipFlop is 
   port(
      Q : out std_logic;    
      Clk :in std_logic;   
      D :in  std_logic    
   );
end DFlipFlop;
architecture Behavioral of DFlipFlop is  
begin  
 process(Clk)
 begin 
    if(clk' event and Clk='1') then
   Q <= D; 
    end if;       
 end process;  
end Behavioral;
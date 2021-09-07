library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity compuertaorh is
	port(num :in std_logic_vector(4 downto 0);
			salida: out std_logic);
	
	end compuertaorh;
	
architecture compuertaorh of compuertaorh is
	begin 
		salida<=num(4) or num(3) or num(2) or num(1) or num(0);
	end compuertaorh;
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity Sumador4 is
port(A, B: in std_logic_vector(3 downto 0);
		R: out std_logic_vector(3 downto 0));
end Sumador4;

architecture arq of Sumador4 is
signal temp: std_logic_vector(3 downto 0);
begin
temp<=A+B;
R<=temp;
end arq;
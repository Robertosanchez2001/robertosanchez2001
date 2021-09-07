library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity Sumador5bits is
port(A, B: in std_logic_vector(4 downto 0);
		R: out std_logic_vector(4 downto 0));
end Sumador5bits;

architecture arq of Sumador5bits is
signal temp: std_logic_vector(4 downto 0);
begin
temp<=A+B;
R<=temp;
end arq;
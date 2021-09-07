library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity contadorup4bits is

port (clock, reset, Ld, En: in std_logic;
		Ent: in std_logic_vector(3 downto 0);
		Q: out std_logic_vector(3 downto 0));
end contadorup4bits;

architecture desarrollo of contadorup4bits is
signal temp: std_logic_vector(3 downto 0);
begin
process(En)
	begin
	if reset='1' then temp<="0000";
	elsif (clock'event and clock='1') then
		if (Ld='1' and En='1') then temp<=Ent;
			elsif En='1' then
				if temp="1111" then temp<="0000";
				else temp<=temp+1;
				end if;
		end if;
	end  if;
end process;
Q<=temp;
end desarrollo;
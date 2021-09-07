library ieee;
use ieee.std_logic_1164.all;

entity sostenimientohoras is
port (clock, reset, En: in std_logic;
		Ent: in std_logic_vector(4 downto 0);
		Q: out std_logic_vector(4 downto 0));
end sostenimientohoras;

architecture desarrollo of sostenimientohoras is
signal temp: std_logic_vector(4 downto 0);
begin
process(En)
	begin
	if reset='1' then temp<="00000";
	elsif (clock'event and clock='1') then
		if En='1' then temp<=Ent;
			else temp<=temp;
		end if;
	end  if;
end process;
Q<=temp;
end desarrollo;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity msscontrolador is
	Port ( clk, reset, start, fotocelda, igualh, igualm, switch2, switch3,or_hreal,or_mreal,or_hriego,or_mriego : in STD_LOGIC;
		en_reghreal, en_regmreal, en_reghriego, en_regmriego, en_hreal, en_mreal, en_regtiempo, EV1, EV2, EV3, EV4: out STD_LOGIC);
end msscontrolador;

Architecture sol of msscontrolador is
type estado is (Ta,Tb,Tc,Td,Te,Tf,Tg,Th,Ti,Tj,Tk,Tl);
signal y: estado;

Begin
	
	
	process (clk, reset)
	begin
		if reset ='0' then y <= Ta;
		elsif (clk'event and clk='1') then
			case y is
				when Ta=> if start='1' then y<=Tb; else y<=Ta; end if;
				when Tb=> if or_hreal='1' then y<=Tc; else y<=Tb; end if;
				when Tc=> if or_mreal='1' then y<=Td; else y<=Tc; end if;
				when Td=> if or_hriego='1' then y<=Te; else y<=Td; end if;
				when Te=> if or_mriego='1' then y<=Tf; else y<=Te; end if;
				when Tf=> if igualm='1' then y<=Tg; else y<=Tf; end if;
				when Tg=> if igualh='1' then y<=Th; else y<=Tg; end if;
				when Th=> if fotocelda='1' then y<=Ti; else y<=Th; end if;
				when Ti=> if switch2='1' then y<=Tk; else y<=Tj; end if;
				when Tj=> if switch3='1' then y<=Tl; else y<=Tl; end if;
				when Tk=> if switch3='1' then y<=Tl; else y<=Tl; end if;
				when Tl=> if start='1' then y<=Tf; else y<=Ta; end if;
			
			end case;
		end if;
	end process;
	process (y)
	begin
		en_reghreal<='0';en_regmreal<='0'; en_reghriego<='0'; en_regmriego<='0'; en_hreal<='0'; en_mreal<='0'; en_regtiempo<='0'; EV1<='0'; EV2<='0'; EV3<='0'; EV4<='0';
		
		case y is
			when Ta=>  
			when Tb=> 
			when Tc=> 
			when Td=> 
			when Te=> 
			when Tf=> en_reghreal<='1';en_regmreal<='1'; en_reghriego<='1'; en_regmriego<='1'; en_hreal<='1'; en_mreal<='1';
			when Tg=> 
			when Th=> en_regtiempo<='1';
			when Ti=> 
			when Tj=> if switch3='1' then EV4<='1'; elsif switch3='0' then EV3<='1'; end if;
			when Tk=> if switch3='1' then EV2<='1'; elsif switch3='0' then EV1<='1'; end if;
			when Tl=> 
			
		end case;
	end process;
end sol;

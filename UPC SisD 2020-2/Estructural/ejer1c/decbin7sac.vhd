library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

entity decbin7sac is
	port(	e:	in std_logic_vector(3 downto 0);
			sa, sb, sc, sd, se, sf, sg:	out std_logic);
end decbin7sac;

architecture flujo of decbin7sac is
signal salida: std_logic_vector(6 downto 0);
begin
			with e select
				salida <= "0111111" when "0000",
							 "0000110" when "0001",
							 "1011011" when "0010",
							 "1001111" when "0011",
							 "1100110" when "0100",
							 "1101101" when "0101",
							 "1111101" when "0110",
							 "0000111" when "0111",
							 "1111111" when "1000",
							 "1100111" when "1001",
							 "1110111" when "1010",
							 "1111100" when "1011",
							 "1011000" when "1100",
							 "1011110" when "1101",
							 "1111011" when "1110",
							 "1110001" when "1111",
							 "ZZZZZZZ" when others;
			sa <= not salida(0);
			sb <= not salida(1);
			sc <= not salida(2);
			sd <= not salida(3);
			se <= not salida(4);
			sf <= not salida(5);
			sg <= not salida(6);
end flujo;			
		
				
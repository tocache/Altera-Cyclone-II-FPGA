library IEEE;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity decbin7scc is
	port(	E:	in	std_logic_vector(3 downto 0);
			Sa, Sb, Sc, Sd, Se, Sf, Sg:	out std_logic);
end decbin7scc;

architecture combinacion of decbin7scc is
signal interno:	std_logic_vector(6 downto 0); --señal interna para agrupar los segmentos
begin
		with E select			--descripción selectiva para el decodificador
			interno <=  "0111111" when "0000",
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
							"0111001" when "1100",
							"1011110" when "1101",
							"1111001" when "1110",
							"1110001" when "1111",
							"ZZZZZZZ" when others;
		Sa <= interno(0);		--conexiones a las señales externas con la señal interna
		Sb <= interno(1);
		Sc <= interno(2);
		Sd <= interno(3);
		Se <= interno(4);
		Sf <= interno(5);
		Sg <= interno(6);
		
end combinacion;							
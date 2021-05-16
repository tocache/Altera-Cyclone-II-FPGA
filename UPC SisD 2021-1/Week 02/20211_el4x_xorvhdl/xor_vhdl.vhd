--Este es un comentario
--Codificado por Kalun
--Este programa en VHDL modela una compuerta XOR
--en diferentes estilos descriptivos

--Primera seccion: declaracion de las librerias
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

--Segunda seccion: declaracion de la entidad
entity xor_vhdl is
	port(	IN_A, IN_B:	in std_logic;
			OUT_C:		out std_logic);
end xor_vhdl;
			
--Tercera seccion: declaracion de la arquitectura
--architecture funcionamiento of xor_vhdl is
--begin
--		--Estilo: Asignacion directa
--		--Aclaracion: el simbolo <= corresponde a asignacion de senial
--		OUT_C <= IN_A xor IN_B;
--end funcionamiento;

----Estilo de descripcion selectiva
--architecture funcionamiento of xor_vhdl is
--signal s_interna: std_logic_vector(1 downto 0);
--begin
--	s_interna <= IN_A & IN_B;
--	with s_interna select
--		OUT_C <= '0' when "00",
--					'1' when "01",
--					'1' when "10",
--					'0' when "11",
--					'Z' when others;
--end funcionamiento;					

--Estilo de descripcion condicional
architecture funcionamiento of xor_vhdl is
signal s_interna: std_logic_vector(1 downto 0);
begin
		s_interna <= IN_A & IN_B;
		OUT_C <= '0' when s_interna = "00" else
					'1' when s_interna = "01" else
					'1' when s_interna = "10" else
					'0';
end funcionamiento;					
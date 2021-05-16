--Este es un comentario
--Codificado por Kalun Lau
--Compuerta NAND modelada en diferentes estilos de descripcion

--Primera seccion: declaracion de las librerias
library IEEE;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

--Segunda seccion: declaracion de la entidad
entity nand_vhdl is
	port(	IN_A, IN_B:	in std_logic;
			OUT_C:		out std_logic);
end nand_vhdl;

--Tercera seccion: declaracion de la arquitectura
--Utilizando estilo de asignacion directa
architecture working of nand_vhdl is
begin
		OUT_C <= IN_A nand IN_B;
end working;
		
--Utilizando estilo de asignacion selectiva
architecture working of nand_vhdl is
signal previo:	std_logic_vector(1 downto 0);
begin
		previo <= IN_A & IN_B;
		with previo select
			OUT_C <= '1' when "00",
						'1' when "01",
						'1' when "10",
						'0' when "11",
						'Z' when others;
end working;		
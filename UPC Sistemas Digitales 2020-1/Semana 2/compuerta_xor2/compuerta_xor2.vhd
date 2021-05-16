--Declaración de librerias IEEE --
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

--Declaración de la entidad--
entity compuerta_xor2 is
	port(EA, EB	:	in std_logic;
		  SC		:	out std_logic);
end compuerta_xor2;

--Declaración de la arquitectura--
architecture constructo of compuerta_xor2 is
begin
			SC <= EA xor EB;
end constructo;			
			
--architecture constructo2 of compuerta_xor2 is
--signal conexion:	std_logic_vector(1 downto 0);
--begin
--		conexion <= EA&EB;
--		with conexion select
--				SC <= '1' when "01",
--						'1' when "10",
--						'0' when "00",
--						'0' when "11",
--						'Z' when others;
--end constructo2;
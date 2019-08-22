--Declaración de las librerías IEEE
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

--declaración de la entidad
entity multiplexormon is
port( A, B, C, D:	in std_logic;
		S:				in std_logic_vector(1 downto 0);
		X:				out std_logic);
end multiplexormon;

--declaración de la arquitectura
architecture charmander of multiplexormon is
begin
		with S select
			x <= 	A when "00",
					B when "01",
					C when "10",
					D when "11",
					'Z' when others;
end charmander;					

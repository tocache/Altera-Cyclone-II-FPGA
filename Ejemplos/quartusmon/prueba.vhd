library IEEE;
use IEEE.std_logic_1164.all;

entity prueba is
port(	INA:	in std_logic;
		OUTC:	out std_logic);
end prueba;

architecture flujo of prueba is
begin
			OUTC <= INA;
end flujo;			
library IEEE;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity contbin4b is
	port(	reloj, n_rst:	in std_logic;
			salida:	out std_logic_vector(3 downto 0));
end contbin4b;

architecture secuencia of contbin4b is
signal cuenta: std_logic_vector(3 downto 0);
begin
	salida <= cuenta;
	process(reloj, n_rst)
	begin
		if n_rst = '0' then
			cuenta <= (others => '0');
		else
			if rising_edge(reloj) then
				cuenta <= cuenta + 1;
			end if;
		end if;
	end process;
end secuencia;
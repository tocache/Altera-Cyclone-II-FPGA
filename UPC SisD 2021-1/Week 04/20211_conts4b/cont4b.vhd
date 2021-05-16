library IEEE;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity cont4b is
	port(	in_clk, n_rst:	std_logic;
			q:	out std_logic_vector(3 downto 0));
end cont4b;

architecture secuencia of cont4b is
signal cuenta:	std_logic_vector(3 downto 0);
begin
	process(in_clk,n_rst)
	begin
		if n_rst = '0' then
			cuenta <= (others => '0');
		else
			if rising_edge(in_clk) then
				cuenta <= cuenta + 1;
			end if;
		end if;
	end process;
	q <= cuenta;
end secuencia;
		
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

entity cont4b is
	port(	clk, rst:	in std_logic;
			q:				out std_logic_vector(3 downto 0));
end cont4b;

architecture flujo of cont4b is
signal interno:	std_logic_vector(3 downto 0);
begin
		process(clk, rst)
		begin
			if rst = '1' then
				interno <= (others => '0');
			else
				if rising_edge(clk) then
					interno <= interno + 1;
					if interno = 10 then
						interno <= others = '0';
					end if;
				end if;
			end if;
		end process;
end flujo;		
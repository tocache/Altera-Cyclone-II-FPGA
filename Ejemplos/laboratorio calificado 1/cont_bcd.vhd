library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

entity cont_bcd is
	port(		in_clk	:	in std_logic;
				outbcd	:	out std_logic_vector(3 downto 0));
end cont_bcd;

architecture principal of cont_bcd is
signal interno : std_logic_vector(3 downto 0);
begin
	process(in_clk)
	begin
		if rising_edge(in_clk) then
			interno <= interno + 1;
			if interno = 9 then
				interno <= (others => '0');
			end if;
		end if;
	end process;
	outbcd <= interno;
end principal;
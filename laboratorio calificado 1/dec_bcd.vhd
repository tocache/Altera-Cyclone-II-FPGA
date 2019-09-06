library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

entity dec_bcd is
	port(		in_bcd	:	in std_logic_vector(3 downto 0);
				out7s		:	out std_logic_vector(6 downto 0));
end dec_bcd;

architecture principal of dec_bcd is
begin
	with in_bcd select
				  --gfedcba--
		out7s <= "0111111" when "0000",
					"0000110" when "0001",
					"1011011" when "0010",
					"1001111" when "0011",
					"1100110" when "0100",
					"1101101" when "0101",
					"1111101" when "0110",
					"0000111" when "0111",
					"1111111" when "1000",
					"1100111" when "1001",
					"ZZZZZZZ" when others;
end principal;
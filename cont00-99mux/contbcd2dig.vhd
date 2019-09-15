library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

entity contbcd2dig is
	port(	clk, rst:	in std_logic;
			qd, qu:		out std_logic_vector(3 downto 0));
end contbcd2dig;

architecture flujo of contbcd2dig is
signal inter_d, inter_u:	std_logic_vector(3 downto 0);
begin
		process(clk, rst)
		begin
			if rst = '1' then
				inter_d <= (others => '0');
				inter_u <= (others => '0');
			else
				if rising_edge(clk) then
					if inter_u = 9 then
						inter_u <= (others =>'0');
						if inter_d = 9 then
							inter_d <= (others =>'0');
						else
							inter_d <= inter_d + 1;
						end if;
					else
						inter_u <= inter_u + 1;
					end if;
				end if;
			end if;
		end process;
		qd <= inter_d;
		qu <= inter_u;
end flujo;		
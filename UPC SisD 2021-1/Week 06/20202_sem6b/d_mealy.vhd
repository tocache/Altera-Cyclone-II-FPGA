library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

entity d_mealy is
port ( clk, D: in std_logic;
           Q: out std_logic);
end d_mealy;

architecture flujo of d_mealy is

TYPE estados is (T1, T2, T3, T4, T5, T6);
SIGNAL es_p: estados;

begin
	process (clk)
	begin
		if rising_edge(clk) then
			case es_p is
				when T1 =>
					if D = '0' then
						es_p <= T1;
					else
						es_p <= T2;
					end if;
				when T2 =>
					if D = '0' then
						es_p <= T3;
					else
						es_p <= T2;
					end if;
				when T3 =>
					if D = '0' then
						es_p <= T1;
					else
						es_p <= T4;
					end if;
				when T4 =>
					if D = '0' then
						es_p <= T3;
					else
						es_p <= T5;
					end if;
				when T5 =>
					if D = '0' then
						es_p <= T6;
					else
						es_p <= T2;
					end if;
				when T6 =>
					if D = '0' then
						es_p <= T1;
					else
						es_p <= T4;
					end if;
				when others =>
					es_p <= T1;
			end case;
		end if;
	end process;
	process(D)
	begin
		if es_p = T6 then
			Q <= not D;
		else
			Q <= '0';
		end if;
	end process;
end flujo;
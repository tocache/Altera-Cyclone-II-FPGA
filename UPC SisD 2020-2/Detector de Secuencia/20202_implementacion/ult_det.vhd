library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

entity ult_det is
port ( clk, D: in std_logic;
           Q: out std_logic);
end ult_det;

architecture flujo of ult_det is

TYPE estados is (J0, J1, J2, J3, J4, J5);
SIGNAL es_p: estados;

begin
	process (clk)
	begin
		if rising_edge(clk) then
			case es_p is
				when J0 =>
					if D = '0' then
						es_p <= J0;
					else
						es_p <= J1;
					end if;
				when J1 =>
					if D = '0' then
						es_p <= J2;
					else
						es_p <= J1;
					end if;
				when J2 =>
					if D = '0' then
						es_p <= J0;
					else
						es_p <= J3;
					end if;
				when J3 =>
					if D = '0' then
						es_p <= J4;
					else
						es_p <= J1;
					end if;
				when J4 =>
					if D = '0' then
						es_p <= J0;
					else
						es_p <= J5;
					end if;
				when J5 =>
					if D = '0' then
						es_p <= J4;
					else
						es_p <= J1;
					end if;
				when others =>
					es_p <= J0;
			end case;
		end if;
	end process;
	
	process(es_p, D)
	begin
		if es_p = J5 then
			Q <= D;
		else
			Q <= '0';
		end if;
	end process;
end flujo;
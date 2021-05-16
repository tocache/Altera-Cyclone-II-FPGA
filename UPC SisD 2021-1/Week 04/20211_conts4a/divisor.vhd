library IEEE;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity divisor is
	port(	hi_freq:	in std_logic;
			lo_freq: out std_logic);
end divisor;

architecture secuencia of divisor is
signal cuenta:	std_logic_vector(26 downto 0);
signal pre_salida:	std_logic;
begin			
	process(hi_freq)
	begin
		if rising_edge(hi_freq) then
			cuenta <= cuenta + 1;
			if cuenta = 25000000 then
				cuenta <= (others => '0');
				pre_salida <= not pre_salida;
			end if;
		end if;
	end process;
	lo_freq <= pre_salida;
end secuencia;		
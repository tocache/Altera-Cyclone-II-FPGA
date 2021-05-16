library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

entity div_freq is
	port( inclk		:	in std_logic;
			outclk	:	out std_logic);
end div_freq;

architecture flujo of div_freq is
signal internaso: std_logic_vector(25 downto 0);
signal salidasa: std_logic;
begin
	process(inclk)
	begin
		if rising_edge(inclk) then
			internaso <= internaso + 1;
			if internaso = 25000000 then
				internaso <= (others => '0');
				salidasa <= not salidasa;
			end if;
		end if;
	end process;
	outclk <= salidasa;
end flujo;
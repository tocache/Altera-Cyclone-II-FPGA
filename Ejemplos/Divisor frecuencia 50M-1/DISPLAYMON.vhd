library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

entity DISPLAYMON is
	port( INCLK		:	in std_logic;
			OUTCLK	:	out std_logic);
end DISPLAYMON;

architecture flujaso of DISPLAYMON is
signal internaso: std_logic_vector(25 downto 0);
signal salidasa: std_logic;
begin
	process(INCLK)
	begin
		if rising_edge(INCLK) then
			internaso <= internaso + 1;
			if internaso = 50000000 then
				internaso <= (others => '0');
				salidasa <= not salidasa;
			end if;
		end if;
	end process;
	OUTCLK <= salidasa;
end flujaso;	
			
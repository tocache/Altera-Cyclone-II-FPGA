library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

entity lb1 is
	port(		inclk	:	in std_logic;
				unhz	:	out std_logic;
				salidabcd	:	out std_logic_vector(3 downto 0);
				salida7s		:	out std_logic_vector(6 downto 0));
end lb1;

architecture principal of lb1 is
component clk_div
	port(		inclk	:	in std_logic;
				outclk	:	out std_logic);
end component;

component cont_bcd
	port(		in_clk	:	in std_logic;
				outbcd	:	out std_logic_vector(3 downto 0));
end component;

component dec_bcd
	port(		in_bcd	:	in std_logic_vector(3 downto 0);
				out7s		:	out std_logic_vector(6 downto 0));
end component;

signal entreclkdivycontbcd : std_logic;
signal entreconbcdydecbcd : std_logic_vector(3 downto 0);

begin
	u1: clk_div PORT MAP (inclk, entreclkdivycontbcd);
	u2: cont_bcd PORT MAP (entreclkdivycontbcd, entreconbcdydecbcd);
	u3: dec_bcd PORT MAP (entreconbcdydecbcd, salida7s);
	unhz <= entreclkdivycontbcd;
	salidabcd <= entreconbcdydecbcd;

end principal;
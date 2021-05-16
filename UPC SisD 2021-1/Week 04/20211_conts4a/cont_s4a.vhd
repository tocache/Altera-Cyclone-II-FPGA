library IEEE;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity cont_s4a is
	port(	cristal50M, n_rst:	in std_logic;
			Sa, Sb, Sc, Sd, Se, Sf, Sg:	out std_logic);
end cont_s4a;

architecture estructura of cont_s4a is
signal interno1:	std_logic;
signal interno2:	std_logic_vector(3 downto 0);

component decbin7scc is
	port(	E:	in	std_logic_vector(3 downto 0);
			Sa, Sb, Sc, Sd, Se, Sf, Sg:	out std_logic);
end component;

component contbin4b is
	port(	reloj, n_rst:	in std_logic;
			salida:	out std_logic_vector(3 downto 0));
end component;

component divisor is
	port(	hi_freq:	in std_logic;
			lo_freq: out std_logic);
end component;

begin
		u1:	decbin7scc PORT MAP (interno2, Sa, Sb, Sc, Sd, Se, Sf, Sg);
		u2:	contbin4b PORT MAP (interno1, n_rst, interno2);
		u3:	divisor PORT MAP(cristal50M, interno1);
end estructura;		
library IEEE;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity cont_s4b is
	port (xtal_50M, n_rst:	in std_logic;
			Sa, Sb, Sc, Sd, Se, Sf, Sg: out std_logic);
end cont_s4b;

architecture estructura of cont_s4b is
signal INT1:	std_logic;
signal INT2:	std_logic_vector(3 downto 0);

component divisor is
	port(	entrada:	in std_logic;
			salida:	out std_logic);
end component;

component cont4b is
	port(	in_clk, n_rst:	std_logic;
			q:	out std_logic_vector(3 downto 0));
end component;

component decbin7scc is
	port(	E:	in std_logic_vector(3 downto 0);
			Sa, Sb, Sc, Sd, Se, Sf, Sg:	out std_logic);
end component;

begin
	u1:	divisor PORT MAP (xtal_50M, INT1);
	u2:	cont4b PORT MAP (INT1, n_rst, INT2);
	u3:	decbin7scc PORT MAP (INT2, Sa, Sb, Sc, Sd, Se, Sf, Sg);
	
end estructura;	
	
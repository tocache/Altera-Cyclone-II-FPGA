library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

entity cont_00_99_mux is
	port(	clk, rst:	in std_logic;
			qd, qu:		out std_logic_vector(3 downto 0));
end cont_00_99_mux;

architecture flujo of cont_00_99_mux is

component contbcd2dig
	port(	clk, rst:	in std_logic;
			qd, qu:		out std_logic_vector(3 downto 0));
end component;

begin
	u1:	contbcd2dig PORT MAP (clk, rst, qd, qu);
end flujo;	
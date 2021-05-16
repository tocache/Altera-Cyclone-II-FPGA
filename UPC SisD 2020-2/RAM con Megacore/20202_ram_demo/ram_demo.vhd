LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;
USE ieee.std_logic_unsigned.all;

entity ram_demo is
	port (
			direcciones	: IN STD_LOGIC_VECTOR (7 DOWNTO 0);
			clock			: IN STD_LOGIC  := '1';
			dato_in		: IN STD_LOGIC_VECTOR (7 DOWNTO 0);
			wr_en			: IN STD_LOGIC ;
			dato_out		: OUT STD_LOGIC_VECTOR (7 DOWNTO 0)
	);

architecture flujo of ram_demo is

component ram_chip
	PORT
	(
		address		: IN STD_LOGIC_VECTOR (7 DOWNTO 0);
		clock		: IN STD_LOGIC  := '1';
		data		: IN STD_LOGIC_VECTOR (7 DOWNTO 0);
		wren		: IN STD_LOGIC ;
		q		: OUT STD_LOGIC_VECTOR (7 DOWNTO 0)
	);
end component;

begin
	u1: ram_chip PORT MAP (direcciones, clock, dato_in, wr_en, dato_out);
	
end flujo;	


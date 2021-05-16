library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

entity implementacion is
	port( clk_50, boton		:	in std_logic;
			led_det, led_clk, buzz	:	out std_logic);
end implementacion;

architecture estructura of implementacion is
signal int1, int2, int3: std_logic;

component clk_div
	port( inclk		:	in std_logic;
			outclk	:	out std_logic);
end component;

component ult_det
port ( clk, D: in std_logic;
           Q: out std_logic);
end component;

begin
	u1: clk_div PORT MAP (clk_50, int1);
	u2: ult_det PORT MAP (int1, int2, int3);
	int2 <= not boton;
	led_det <= not int3;
	led_clk <= not int1;
	buzz <= '1';

end estructura;

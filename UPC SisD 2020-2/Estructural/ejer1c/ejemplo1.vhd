library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

entity ejemplo1 is
	port	(inclk, rst: in std_logic;
				buzz, sa, sb, sc, sd, se, sf, sg, sdp: out std_logic;
				hab: out std_logic_vector(7 downto 0));
end ejemplo1;

architecture flujomon of ejemplo1 is

component div_freq
	port( inclk		:	in std_logic;
			outclk	:	out std_logic);
end component;

component cont4b
	port(	inclk, rst:	in std_logic;
			q:		out std_logic_vector(3 downto 0));
end component;

component decbin7sac
	port(	e:	in std_logic_vector(3 downto 0);
			sa, sb, sc, sd, se, sf, sg:	out std_logic);
end component;

signal int1: std_logic;
signal int2: std_logic_vector(3 downto 0);

begin
	u1: div_freq PORT MAP(inclk, int1);
	u2: cont4b PORT MAP (int1, rst, int2);
	u3: decbin7sac PORT MAP (int2, sa, sb, sc, sd, se, sf, sg);
	buzz <= '1';
	sdp <= '1';
	hab <= "11111110";
end flujomon;	
	
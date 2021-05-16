library IEEE;
use IEEE.std_logic_1164.all;

entity sem11_niosii_d is
	port(	reloj:	in std_logic;
			foquitos: out std_logic_vector(7 downto 0);
			display_rs: out std_logic;
			display_rw: out std_logic;
			display_e: out std_logic;
			display_data: inout std_logic_vector(7 downto 0);
			buzzer: out std_logic;
			disp7s_en:	out std_logic_vector(7 downto 0);
			botones: in std_logic_vector(7 downto 0)
			);
end sem11_niosii_d;

architecture flujo of sem11_niosii_d is

signal intermedia: std_logic_vector(7 downto 0);
signal intermedia2: std_logic_vector(7 downto 0);

    component nios_upc is
        port (
            clk_clk      : in    std_logic                    := 'X';             -- clk
            leds_export  : out   std_logic_vector(7 downto 0);                    -- export
            lcd1602_RS   : out   std_logic;                                       -- RS
            lcd1602_RW   : out   std_logic;                                       -- RW
            lcd1602_data : inout std_logic_vector(7 downto 0) := (others => 'X'); -- data
            lcd1602_E    : out   std_logic;                                       -- E
				botones_export : in    std_logic_vector(7 downto 0) := (others => 'X')  -- export
        );
    end component nios_upc;


begin	 
    u0 : component nios_upc
        port map (
            clk_clk     => reloj,     --  clk.clk
            leds_export => intermedia,  -- leds.export
				lcd1602_RS   => display_rs,   -- lcd1602.RS
            lcd1602_RW   => display_rw,   --        .RW
            lcd1602_data => display_data, --        .data
            lcd1602_E    => display_e,    --        .E
				botones_export => intermedia2  -- botones.export
        );
	buzzer <= '1';							--Apagamos el molestoso buzzer
	foquitos <= not intermedia;
	intermedia2 <= not botones;
	disp7s_en <= (others => '1');		--Apagamos los displays de siete segmentos
end flujo;	
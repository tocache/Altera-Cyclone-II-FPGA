library IEEE;
use IEEE.std_logic_1164.all;

entity tesla_core is
	port(reloj: in std_logic;
			salidas: out std_logic_vector(7 downto 0));
end tesla_core;

architecture estructural of tesla_core is

    component nios_ii_upc is
        port (
            clk_clk                          : in  std_logic                    := 'X'; -- clk
            pio_0_external_connection_export : out std_logic_vector(7 downto 0)         -- export
        );
    end component nios_ii_upc;

begin	 
	 
    u0 : component nios_ii_upc
        port map (
            clk_clk                          => reloj,                          --                       clk.clk
            pio_0_external_connection_export => salidas  -- pio_0_external_connection.export
        );

end estructural;			
library verilog;
use verilog.vl_types.all;
entity el_ultimo is
    port(
        clk             : in     vl_logic;
        D               : in     vl_logic;
        Q               : out    vl_logic
    );
end el_ultimo;

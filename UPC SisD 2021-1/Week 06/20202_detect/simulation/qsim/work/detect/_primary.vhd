library verilog;
use verilog.vl_types.all;
entity detect is
    port(
        clk             : in     vl_logic;
        D               : in     vl_logic;
        rst             : in     vl_logic;
        Q               : out    vl_logic
    );
end detect;

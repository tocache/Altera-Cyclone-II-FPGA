library verilog;
use verilog.vl_types.all;
entity compuerta_xor2 is
    port(
        EA              : in     vl_logic;
        EB              : in     vl_logic;
        SC              : out    vl_logic
    );
end compuerta_xor2;

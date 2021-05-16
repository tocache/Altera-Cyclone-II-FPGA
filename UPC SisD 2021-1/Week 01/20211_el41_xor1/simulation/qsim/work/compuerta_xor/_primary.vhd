library verilog;
use verilog.vl_types.all;
entity compuerta_xor is
    port(
        OUT_C           : out    vl_logic;
        IN_A            : in     vl_logic;
        IN_B            : in     vl_logic
    );
end compuerta_xor;

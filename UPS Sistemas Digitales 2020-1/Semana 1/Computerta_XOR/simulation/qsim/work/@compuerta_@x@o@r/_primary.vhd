library verilog;
use verilog.vl_types.all;
entity Compuerta_XOR is
    port(
        OUTC            : out    vl_logic;
        INA             : in     vl_logic;
        INB             : in     vl_logic
    );
end Compuerta_XOR;

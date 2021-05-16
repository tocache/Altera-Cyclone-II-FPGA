library verilog;
use verilog.vl_types.all;
entity Compuerta_NAND is
    port(
        OUTC            : out    vl_logic;
        INB             : in     vl_logic;
        INA             : in     vl_logic
    );
end Compuerta_NAND;

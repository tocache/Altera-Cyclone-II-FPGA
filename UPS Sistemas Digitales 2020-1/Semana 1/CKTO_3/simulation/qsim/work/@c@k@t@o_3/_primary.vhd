library verilog;
use verilog.vl_types.all;
entity CKTO_3 is
    port(
        OUTD            : out    vl_logic;
        INC             : in     vl_logic;
        INA             : in     vl_logic;
        INB             : in     vl_logic
    );
end CKTO_3;

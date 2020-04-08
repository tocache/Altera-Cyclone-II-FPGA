library verilog;
use verilog.vl_types.all;
entity CKTO_4 is
    port(
        OD              : out    vl_logic;
        IA              : in     vl_logic;
        IB              : in     vl_logic;
        IC              : in     vl_logic
    );
end CKTO_4;

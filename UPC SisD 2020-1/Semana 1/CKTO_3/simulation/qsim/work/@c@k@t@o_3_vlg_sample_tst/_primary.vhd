library verilog;
use verilog.vl_types.all;
entity CKTO_3_vlg_sample_tst is
    port(
        INA             : in     vl_logic;
        INB             : in     vl_logic;
        INC             : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end CKTO_3_vlg_sample_tst;

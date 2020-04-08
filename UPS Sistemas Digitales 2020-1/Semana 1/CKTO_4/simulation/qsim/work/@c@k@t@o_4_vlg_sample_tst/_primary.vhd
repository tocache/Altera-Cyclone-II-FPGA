library verilog;
use verilog.vl_types.all;
entity CKTO_4_vlg_sample_tst is
    port(
        IA              : in     vl_logic;
        IB              : in     vl_logic;
        IC              : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end CKTO_4_vlg_sample_tst;

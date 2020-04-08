library verilog;
use verilog.vl_types.all;
entity compuerta_xor2_vlg_sample_tst is
    port(
        EA              : in     vl_logic;
        EB              : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end compuerta_xor2_vlg_sample_tst;

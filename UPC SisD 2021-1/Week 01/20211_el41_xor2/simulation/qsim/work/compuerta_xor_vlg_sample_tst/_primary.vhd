library verilog;
use verilog.vl_types.all;
entity compuerta_xor_vlg_sample_tst is
    port(
        IN_A            : in     vl_logic;
        IN_B            : in     vl_logic;
        IN_C            : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end compuerta_xor_vlg_sample_tst;

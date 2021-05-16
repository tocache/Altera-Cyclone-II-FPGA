library verilog;
use verilog.vl_types.all;
entity el_ultimo_vlg_sample_tst is
    port(
        clk             : in     vl_logic;
        D               : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end el_ultimo_vlg_sample_tst;

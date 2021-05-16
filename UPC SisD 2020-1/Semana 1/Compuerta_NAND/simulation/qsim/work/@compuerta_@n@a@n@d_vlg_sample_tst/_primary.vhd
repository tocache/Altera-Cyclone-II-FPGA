library verilog;
use verilog.vl_types.all;
entity Compuerta_NAND_vlg_sample_tst is
    port(
        INA             : in     vl_logic;
        INB             : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end Compuerta_NAND_vlg_sample_tst;

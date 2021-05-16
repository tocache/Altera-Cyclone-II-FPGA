library verilog;
use verilog.vl_types.all;
entity xor_vhdl is
    port(
        IN_A            : in     vl_logic;
        IN_B            : in     vl_logic;
        OUT_C           : out    vl_logic
    );
end xor_vhdl;

onerror {quit -f}
vlib work
vlog -work work xor_vhdl.vo
vlog -work work xor_vhdl.vt
vsim -novopt -c -t 1ps -L cycloneii_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.xor_vhdl_vlg_vec_tst
vcd file -direction xor_vhdl.msim.vcd
vcd add -internal xor_vhdl_vlg_vec_tst/*
vcd add -internal xor_vhdl_vlg_vec_tst/i1/*
add wave /*
run -all

onerror {quit -f}
vlib work
vlog -work work compuerta_xor.vo
vlog -work work compuerta_xor.vt
vsim -novopt -c -t 1ps -L cycloneii_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.compuerta_xor_vlg_vec_tst
vcd file -direction compuerta_xor.msim.vcd
vcd add -internal compuerta_xor_vlg_vec_tst/*
vcd add -internal compuerta_xor_vlg_vec_tst/i1/*
add wave /*
run -all

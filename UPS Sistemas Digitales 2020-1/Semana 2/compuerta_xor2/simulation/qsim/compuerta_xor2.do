onerror {quit -f}
vlib work
vlog -work work compuerta_xor2.vo
vlog -work work compuerta_xor2.vt
vsim -novopt -c -t 1ps -L cycloneii_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.compuerta_xor2_vlg_vec_tst
vcd file -direction compuerta_xor2.msim.vcd
vcd add -internal compuerta_xor2_vlg_vec_tst/*
vcd add -internal compuerta_xor2_vlg_vec_tst/i1/*
add wave /*
run -all

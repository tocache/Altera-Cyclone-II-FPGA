onerror {quit -f}
vlib work
vlog -work work Compuerta_XOR.vo
vlog -work work Compuerta_XOR.vt
vsim -novopt -c -t 1ps -L cycloneii_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.Compuerta_XOR_vlg_vec_tst
vcd file -direction Compuerta_XOR.msim.vcd
vcd add -internal Compuerta_XOR_vlg_vec_tst/*
vcd add -internal Compuerta_XOR_vlg_vec_tst/i1/*
add wave /*
run -all

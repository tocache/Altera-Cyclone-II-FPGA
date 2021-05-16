onerror {quit -f}
vlib work
vlog -work work detect.vo
vlog -work work detect.vt
vsim -novopt -c -t 1ps -L cycloneii_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.detect_vlg_vec_tst
vcd file -direction detect.msim.vcd
vcd add -internal detect_vlg_vec_tst/*
vcd add -internal detect_vlg_vec_tst/i1/*
add wave /*
run -all

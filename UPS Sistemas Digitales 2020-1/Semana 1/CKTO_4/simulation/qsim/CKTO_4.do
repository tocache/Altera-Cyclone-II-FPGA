onerror {quit -f}
vlib work
vlog -work work CKTO_4.vo
vlog -work work CKTO_4.vt
vsim -novopt -c -t 1ps -L cycloneii_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.CKTO_4_vlg_vec_tst
vcd file -direction CKTO_4.msim.vcd
vcd add -internal CKTO_4_vlg_vec_tst/*
vcd add -internal CKTO_4_vlg_vec_tst/i1/*
add wave /*
run -all

onerror {quit -f}
vlib work
vlog -work work el_ultimo.vo
vlog -work work el_ultimo.vt
vsim -novopt -c -t 1ps -L cycloneii_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.el_ultimo_vlg_vec_tst
vcd file -direction el_ultimo.msim.vcd
vcd add -internal el_ultimo_vlg_vec_tst/*
vcd add -internal el_ultimo_vlg_vec_tst/i1/*
add wave /*
run -all

onerror {quit -f}
vlib work
vlog -work work 20211_el42_or1.vo
vlog -work work 20211_el42_or1.vt
vsim -novopt -c -t 1ps -L cycloneii_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.20211_el42_or1_vlg_vec_tst
vcd file -direction 20211_el42_or1.msim.vcd
vcd add -internal 20211_el42_or1_vlg_vec_tst/*
vcd add -internal 20211_el42_or1_vlg_vec_tst/i1/*
add wave /*
run -all

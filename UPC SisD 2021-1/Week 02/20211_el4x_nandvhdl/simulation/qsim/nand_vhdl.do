onerror {quit -f}
vlib work
vlog -work work nand_vhdl.vo
vlog -work work nand_vhdl.vt
vsim -novopt -c -t 1ps -L cycloneii_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.nand_vhdl_vlg_vec_tst
vcd file -direction nand_vhdl.msim.vcd
vcd add -internal nand_vhdl_vlg_vec_tst/*
vcd add -internal nand_vhdl_vlg_vec_tst/i1/*
add wave /*
run -all

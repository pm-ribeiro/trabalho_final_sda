onerror {quit -f}
vlib work
vlog -work work final_project.vo
vlog -work work final_project.vt
vsim -novopt -c -t 1ps -L cycloneive_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.final_project_vlg_vec_tst
vcd file -direction final_project.msim.vcd
vcd add -internal final_project_vlg_vec_tst/*
vcd add -internal final_project_vlg_vec_tst/i1/*
add wave /*
run -all

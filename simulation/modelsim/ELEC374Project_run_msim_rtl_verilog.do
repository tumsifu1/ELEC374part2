transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

<<<<<<< HEAD
vlog -vlog01compat -work work +incdir+C:/Users/Admin/Documents/ELEC374part2 {C:/Users/Admin/Documents/ELEC374part2/div_32bit.v}

vlog -vlog01compat -work work +incdir+C:/Users/Admin/Documents/ELEC374part2 {C:/Users/Admin/Documents/ELEC374part2/div_32bit_tb.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneiii_ver -L rtl_work -L work -voptargs="+acc"  div_32bit_tb
=======
vlog -vlog01compat -work work +incdir+C:/code/374pt2/ELEC374part2/ELEC374part2 {C:/code/374pt2/ELEC374part2/ELEC374part2/z_register.v}
vlog -vlog01compat -work work +incdir+C:/code/374pt2/ELEC374part2/ELEC374part2 {C:/code/374pt2/ELEC374part2/ELEC374part2/Register.v}
vlog -vlog01compat -work work +incdir+C:/code/374pt2/ELEC374part2/ELEC374part2 {C:/code/374pt2/ELEC374part2/ELEC374part2/PC.v}
vlog -vlog01compat -work work +incdir+C:/code/374pt2/ELEC374part2/ELEC374part2 {C:/code/374pt2/ELEC374part2/ELEC374part2/mul_32bit.v}
vlog -vlog01compat -work work +incdir+C:/code/374pt2/ELEC374part2/ELEC374part2 {C:/code/374pt2/ELEC374part2/ELEC374part2/multiplexer32to1.v}
vlog -vlog01compat -work work +incdir+C:/code/374pt2/ELEC374part2/ELEC374part2 {C:/code/374pt2/ELEC374part2/ELEC374part2/multiplexer.v}
vlog -vlog01compat -work work +incdir+C:/code/374pt2/ELEC374part2/ELEC374part2 {C:/code/374pt2/ELEC374part2/ELEC374part2/MDR.v}
vlog -vlog01compat -work work +incdir+C:/code/374pt2/ELEC374part2/ELEC374part2 {C:/code/374pt2/ELEC374part2/ELEC374part2/encoder.v}
vlog -vlog01compat -work work +incdir+C:/code/374pt2/ELEC374part2/ELEC374part2 {C:/code/374pt2/ELEC374part2/ELEC374part2/div_32bit.v}
vlog -vlog01compat -work work +incdir+C:/code/374pt2/ELEC374part2/ELEC374part2 {C:/code/374pt2/ELEC374part2/ELEC374part2/datapath.v}
vlog -vlog01compat -work work +incdir+C:/code/374pt2/ELEC374part2/ELEC374part2 {C:/code/374pt2/ELEC374part2/ELEC374part2/bidirectional_bus.v}
vlog -vlog01compat -work work +incdir+C:/code/374pt2/ELEC374part2/ELEC374part2 {C:/code/374pt2/ELEC374part2/ELEC374part2/ALU.v}
vlog -vlog01compat -work work +incdir+C:/code/374pt2/ELEC374part2/ELEC374part2 {C:/code/374pt2/ELEC374part2/ELEC374part2/add_32.v}
vlog -vlog01compat -work work +incdir+C:/code/374pt2/ELEC374part2/ELEC374part2 {C:/code/374pt2/ELEC374part2/ELEC374part2/sub_32bit.v}

vlog -vlog01compat -work work +incdir+C:/code/374pt2/ELEC374part2/ELEC374part2 {C:/code/374pt2/ELEC374part2/ELEC374part2/AND_ALUtb.v}

<<<<<<< HEAD
vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneiii_ver -L rtl_work -L work -voptargs="+acc"  AND_ALUtb
=======
vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneiii_ver -L rtl_work -L work -voptargs="+acc"  DIV_ALUtb
>>>>>>> 6889b348620290086cf5e8c8e14ea4fa5f240fa6
>>>>>>> f34d9d903ab02d260e3d8c543bbfa0b3c3c7b589

add wave *
view structure
view signals
run 600 ns

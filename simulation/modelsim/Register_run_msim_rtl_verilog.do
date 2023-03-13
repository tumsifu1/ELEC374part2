transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/code/374pt2/ELEC374part2/ELEC374part2 {C:/code/374pt2/ELEC374part2/ELEC374part2/z_register.v}
vlog -vlog01compat -work work +incdir+C:/code/374pt2/ELEC374part2/ELEC374part2 {C:/code/374pt2/ELEC374part2/ELEC374part2/sub_32bit.v}
vlog -vlog01compat -work work +incdir+C:/code/374pt2/ELEC374part2/ELEC374part2 {C:/code/374pt2/ELEC374part2/ELEC374part2/Register.v}
vlog -vlog01compat -work work +incdir+C:/code/374pt2/ELEC374part2/ELEC374part2 {C:/code/374pt2/ELEC374part2/ELEC374part2/negate.v}
vlog -vlog01compat -work work +incdir+C:/code/374pt2/ELEC374part2/ELEC374part2 {C:/code/374pt2/ELEC374part2/ELEC374part2/multiplexer32to1.v}
vlog -vlog01compat -work work +incdir+C:/code/374pt2/ELEC374part2/ELEC374part2 {C:/code/374pt2/ELEC374part2/ELEC374part2/multiplexer.v}
vlog -vlog01compat -work work +incdir+C:/code/374pt2/ELEC374part2/ELEC374part2 {C:/code/374pt2/ELEC374part2/ELEC374part2/mul_32bit.v}
vlog -vlog01compat -work work +incdir+C:/code/374pt2/ELEC374part2/ELEC374part2 {C:/code/374pt2/ELEC374part2/ELEC374part2/MDR.v}
vlog -vlog01compat -work work +incdir+C:/code/374pt2/ELEC374part2/ELEC374part2 {C:/code/374pt2/ELEC374part2/ELEC374part2/encoder.v}
vlog -vlog01compat -work work +incdir+C:/code/374pt2/ELEC374part2/ELEC374part2 {C:/code/374pt2/ELEC374part2/ELEC374part2/div_32bit.v}
vlog -vlog01compat -work work +incdir+C:/code/374pt2/ELEC374part2/ELEC374part2 {C:/code/374pt2/ELEC374part2/ELEC374part2/datapath.v}
vlog -vlog01compat -work work +incdir+C:/code/374pt2/ELEC374part2/ELEC374part2 {C:/code/374pt2/ELEC374part2/ELEC374part2/bidirectional_bus.v}
vlog -vlog01compat -work work +incdir+C:/code/374pt2/ELEC374part2/ELEC374part2 {C:/code/374pt2/ELEC374part2/ELEC374part2/ALU.v}
vlog -vlog01compat -work work +incdir+C:/code/374pt2/ELEC374part2/ELEC374part2 {C:/code/374pt2/ELEC374part2/ELEC374part2/add_32.v}
vlog -vlog01compat -work work +incdir+C:/code/374pt2/ELEC374part2/ELEC374part2 {C:/code/374pt2/ELEC374part2/ELEC374part2/pc.v}
vlog -vlog01compat -work work +incdir+C:/code/374pt2/ELEC374part2/ELEC374part2 {C:/code/374pt2/ELEC374part2/ELEC374part2/not_32bit.v}

vlog -vlog01compat -work work +incdir+C:/code/374pt2/ELEC374part2/ELEC374part2 {C:/code/374pt2/ELEC374part2/ELEC374part2/NEGATE_ALUtb.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneiv_hssi_ver -L cycloneiv_pcie_hip_ver -L cycloneiv_ver -L rtl_work -L work -voptargs="+acc"  NEGATE_ALUtb.v

add wave *
view structure
view signals
run 1000 ns

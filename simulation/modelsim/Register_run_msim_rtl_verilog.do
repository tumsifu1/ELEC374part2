transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
vlog -vlog01compat -work work +incdir+C:/Users/Admin/Documents/ELEC374part2 {C:/Users/Admin/Documents/ELEC374part2/Register.v}
vlog -vlog01compat -work work +incdir+C:/Users/Admin/Documents/ELEC374part2 {C:/Users/Admin/Documents/ELEC374part2/multiplexer.v}
vlog -vlog01compat -work work +incdir+C:/Users/Admin/Documents/ELEC374part2 {C:/Users/Admin/Documents/ELEC374part2/MDR.v}
=======
=======
>>>>>>> 90c4481dba0fa4a91b8519f555f80354ee5343bf
=======
>>>>>>> 90c4481dba0fa4a91b8519f555f80354ee5343bf
vlog -vlog01compat -work work +incdir+C:/Users/19058/Documents/Code/ELEC374Part2/ELEC374part2/ELEC374part2 {C:/Users/19058/Documents/Code/ELEC374Part2/ELEC374part2/ELEC374part2/z_register.v}
vlog -vlog01compat -work work +incdir+C:/Users/19058/Documents/Code/ELEC374Part2/ELEC374part2/ELEC374part2 {C:/Users/19058/Documents/Code/ELEC374Part2/ELEC374part2/ELEC374part2/sub_32bit.v}
vlog -vlog01compat -work work +incdir+C:/Users/19058/Documents/Code/ELEC374Part2/ELEC374part2/ELEC374part2 {C:/Users/19058/Documents/Code/ELEC374Part2/ELEC374part2/ELEC374part2/PC.v}
vlog -vlog01compat -work work +incdir+C:/Users/19058/Documents/Code/ELEC374Part2/ELEC374part2/ELEC374part2 {C:/Users/19058/Documents/Code/ELEC374Part2/ELEC374part2/ELEC374part2/not_32bit.v}
vlog -vlog01compat -work work +incdir+C:/Users/19058/Documents/Code/ELEC374Part2/ELEC374part2/ELEC374part2 {C:/Users/19058/Documents/Code/ELEC374Part2/ELEC374part2/ELEC374part2/negate.v}
vlog -vlog01compat -work work +incdir+C:/Users/19058/Documents/Code/ELEC374Part2/ELEC374part2/ELEC374part2 {C:/Users/19058/Documents/Code/ELEC374Part2/ELEC374part2/ELEC374part2/mul_32bit.v}
vlog -vlog01compat -work work +incdir+C:/Users/19058/Documents/Code/ELEC374Part2/ELEC374part2/ELEC374part2 {C:/Users/19058/Documents/Code/ELEC374Part2/ELEC374part2/ELEC374part2/multiplexer32to1.v}
vlog -vlog01compat -work work +incdir+C:/Users/19058/Documents/Code/ELEC374Part2/ELEC374part2/ELEC374part2 {C:/Users/19058/Documents/Code/ELEC374Part2/ELEC374part2/ELEC374part2/multiplexer.v}
vlog -vlog01compat -work work +incdir+C:/Users/19058/Documents/Code/ELEC374Part2/ELEC374part2/ELEC374part2 {C:/Users/19058/Documents/Code/ELEC374Part2/ELEC374part2/ELEC374part2/MDR.v}
vlog -vlog01compat -work work +incdir+C:/Users/19058/Documents/Code/ELEC374Part2/ELEC374part2/ELEC374part2 {C:/Users/19058/Documents/Code/ELEC374Part2/ELEC374part2/ELEC374part2/encoder.v}
vlog -vlog01compat -work work +incdir+C:/Users/19058/Documents/Code/ELEC374Part2/ELEC374part2/ELEC374part2 {C:/Users/19058/Documents/Code/ELEC374Part2/ELEC374part2/ELEC374part2/div_32bit.v}
vlog -vlog01compat -work work +incdir+C:/Users/19058/Documents/Code/ELEC374Part2/ELEC374part2/ELEC374part2 {C:/Users/19058/Documents/Code/ELEC374Part2/ELEC374part2/ELEC374part2/datapath.v}
vlog -vlog01compat -work work +incdir+C:/Users/19058/Documents/Code/ELEC374Part2/ELEC374part2/ELEC374part2 {C:/Users/19058/Documents/Code/ELEC374Part2/ELEC374part2/ELEC374part2/bidirectional_bus.v}
vlog -vlog01compat -work work +incdir+C:/Users/19058/Documents/Code/ELEC374Part2/ELEC374part2/ELEC374part2 {C:/Users/19058/Documents/Code/ELEC374Part2/ELEC374part2/ELEC374part2/ALU.v}
vlog -vlog01compat -work work +incdir+C:/Users/19058/Documents/Code/ELEC374Part2/ELEC374part2/ELEC374part2 {C:/Users/19058/Documents/Code/ELEC374Part2/ELEC374part2/ELEC374part2/add_32.v}
vlog -vlog01compat -work work +incdir+C:/Users/19058/Documents/Code/ELEC374Part2/ELEC374part2/ELEC374part2 {C:/Users/19058/Documents/Code/ELEC374Part2/ELEC374part2/ELEC374part2/Register.v}
<<<<<<< HEAD
<<<<<<< HEAD
>>>>>>> 90c4481dba0fa4a91b8519f555f80354ee5343bf
=======
>>>>>>> 90c4481dba0fa4a91b8519f555f80354ee5343bf
=======
>>>>>>> 90c4481dba0fa4a91b8519f555f80354ee5343bf

vlog -vlog01compat -work work +incdir+C:/Users/19058/Documents/Code/ELEC374Part2/ELEC374part2/ELEC374part2 {C:/Users/19058/Documents/Code/ELEC374Part2/ELEC374part2/ELEC374part2/DIV_ALUtb.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneiii_ver -L rtl_work -L work -voptargs="+acc"  DIV_ALUtb

add wave *
view structure
view signals
run 500 ns

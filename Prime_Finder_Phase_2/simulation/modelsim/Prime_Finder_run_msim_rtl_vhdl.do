transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {D:/intelFPGA_lite/18.1/project/Prime_Finder/Prime_Finder_Parallel_Group55.vhd}
vcom -93 -work work {D:/intelFPGA_lite/18.1/project/Prime_Finder/RipSub_4bit_Group55.vhd}
vcom -93 -work work {D:/intelFPGA_lite/18.1/project/Prime_Finder/LongDivision_4bit_Group55.vhd}

vcom -93 -work work {D:/intelFPGA_lite/18.1/project/Prime_Finder/Extend_16bit_tb_Group55.vhd}

vsim -t 1ps -L altera -L lpm -L sgate -L altera_mf -L altera_lnsim -L fiftyfivenm -L rtl_work -L work -voptargs="+acc"  Extend_16bit_tb_Group55

add wave *
view structure
view signals
run 2000 ns

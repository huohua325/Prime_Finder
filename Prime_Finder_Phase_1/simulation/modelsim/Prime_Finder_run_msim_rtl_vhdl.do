transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {D:/intelFPGA_lite/18.1/project/PrimeFinder/Prime_Finder_Phase_1/RipSub_4bit_Group55.vhd}
vcom -93 -work work {D:/intelFPGA_lite/18.1/project/PrimeFinder/Prime_Finder_Phase_1/LongDivision_4bit_Group55.vhd}
vcom -93 -work work {D:/intelFPGA_lite/18.1/project/PrimeFinder/Prime_Finder_Phase_1/Prime_Finder_Group55.vhd}
vcom -93 -work work {D:/intelFPGA_lite/18.1/project/PrimeFinder/Prime_Finder_Phase_1/Prime_Finder_Top_Group55.vhd}

vcom -93 -work work {D:/intelFPGA_lite/18.1/project/PrimeFinder/Prime_Finder_Phase_1/Multiplier_4bit_tb_Group55.vhd}

vsim -t 1ps -L altera -L lpm -L sgate -L altera_mf -L altera_lnsim -L fiftyfivenm -L rtl_work -L work -voptargs="+acc"  Multiplier_4bit_tb

add wave *
view structure
view signals
run 800 ns

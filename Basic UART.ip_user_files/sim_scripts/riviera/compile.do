transcript off
onbreak {quit -force}
onerror {quit -force}
transcript on

vlib work
vlib riviera/xpm
vlib riviera/xil_defaultlib

vmap xpm riviera/xpm
vmap xil_defaultlib riviera/xil_defaultlib

vlog -work xpm  -incr "+incdir+F:/Xilinx/2025.1/Vivado/data/rsb/busdef" -l xpm -l xil_defaultlib \
"F:/Xilinx/2025.1/Vivado/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \

vcom -work xpm -93  -incr \
"F:/Xilinx/2025.1/Vivado/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work xil_defaultlib  -incr -v2k5 "+incdir+F:/Xilinx/2025.1/Vivado/data/rsb/busdef" -l xpm -l xil_defaultlib \
"../../../Basic UART.srcs/sources_1/new/Baud_Gen.v" \
"../../../Basic UART.srcs/sources_1/new/Baud_Gen_RX.v" \
"../../../Basic UART.srcs/sources_1/new/RX_UART.v" \
"../../../Basic UART.srcs/sources_1/new/TOP.v" \
"../../../Basic UART.srcs/sources_1/new/UART.v" \
"../../../Basic UART.srcs/sim_1/new/tb.v" \

vlog -work xil_defaultlib \
"glbl.v"


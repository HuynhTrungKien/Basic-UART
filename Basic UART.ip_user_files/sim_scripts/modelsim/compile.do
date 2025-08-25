vlib modelsim_lib/work
vlib modelsim_lib/msim

vlib modelsim_lib/msim/xpm
vlib modelsim_lib/msim/xil_defaultlib

vmap xpm modelsim_lib/msim/xpm
vmap xil_defaultlib modelsim_lib/msim/xil_defaultlib

vlog -work xpm  -incr -mfcu  -sv "+incdir+F:/Xilinx/2025.1/Vivado/data/rsb/busdef" \
"F:/Xilinx/2025.1/Vivado/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \

vcom -work xpm  -93  \
"F:/Xilinx/2025.1/Vivado/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work xil_defaultlib  -incr -mfcu  "+incdir+F:/Xilinx/2025.1/Vivado/data/rsb/busdef" \
"../../../Basic UART.srcs/sources_1/new/Baud_Gen.v" \
"../../../Basic UART.srcs/sources_1/new/Baud_Gen_RX.v" \
"../../../Basic UART.srcs/sources_1/new/RX_UART.v" \
"../../../Basic UART.srcs/sources_1/new/TOP.v" \
"../../../Basic UART.srcs/sources_1/new/UART.v" \
"../../../Basic UART.srcs/sim_1/new/tb.v" \

vlog -work xil_defaultlib \
"glbl.v"


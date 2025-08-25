`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/22/2025 03:12:07 PM
// Design Name: 
// Module Name: TOP
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module TOP( input clk, rst, start_pulse, input [1:0] divisor,input [7:0] data_in, output tmit_data, tmit_done
,d_ready,output [7:0] data_out
, input [1:0] select, output [1:0] led
 );
wire clk_out1, clk_out2;
wire baud_clk1, baud_clk2;
wire [1:0] mux_sel;
clk_wiz_0 ic0 (.clk_in1(clk),.reset(rst),.clk_out1(clk_out1),.clk_out2(clk_out2));

Baud_Gen_TX ic1 (.clk_sys(clk_out1),.rst(rst),.divisor(divisor),.baud_clk(baud_clk1));

Baud_Gen_RX ic5 (.clk_sys(clk_out2),.rst(rst),.divisor(divisor),.baud_clk(baud_clk2));

TX_UART ic2 (.rst(rst),.baud_clk(baud_clk1),.data_in(data_in),.start_pulse(start_pulse),.tmit_done(tmit_done),.mux_sel(mux_sel),.tmit_data(tmit_data),.select(select),.led(led));

ila_0 ic4 (
	.clk(clk_out1), // input wire clk
	.probe0(tmit_data), // input wire [0:0]  probe0  
	.probe1(start_pulse1) // input wire [0:0]  probe1
);

RX_UART ic3 (.rst(rst),.baud_clk(baud_clk2),.s_din(tmit_data),.data_out(data_out),.d_ready(d_ready));
endmodule

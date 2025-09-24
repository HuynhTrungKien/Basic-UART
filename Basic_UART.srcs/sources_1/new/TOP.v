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


module TOP( input clk, rst, start_pulse, s_din, input [7:0] data_in, output tmit_data, tmit_done
,d_ready,output [7:0] data_out, input [1:0] parity_type, output parity_flag
 );
wire [8:0] shift_reg; 
wire [2:0] current_stage; 
wire clk_out1, clk_out2,parity_bit, check_bit;
wire baud_clk;
wire [1:0] mux_sel;
wire [3:0] idx;

Baud_Gen ic1 (.clk_sys(clk),.rst(rst),.baud_clk(baud_clk));

TX_UART ic2 (.rst(rst),.baud_clk(baud_clk),.data_in(data_in),.start_pulse(start_pulse),.tmit_done(tmit_done)
,.mux_sel(mux_sel),.tmit_data(tmit_data),.parity_bit(parity_bit),.parity_type(parity_type),.current_stage(current_stage),.shift_reg(shift_reg),.idx(idx));

RX_UART ic3 (.rst(rst),.baud_clk(baud_clk),.s_din(s_din),.data_out(data_out),.d_ready(d_ready),.parity_bit(check_bit),.parity_type(parity_type));

Parity ic6 (.rst(rst),.parity_type(parity_type),.data_in(data_in),.parity_bit(parity_bit));

Parity_Check ic7 (.rst(rst),.parity_type(parity_type),.parity_bit(check_bit),.raw_data(data_out),.parity_flag(parity_flag));

endmodule

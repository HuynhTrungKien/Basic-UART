`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/22/2025 10:20:51 AM
// Design Name: 
// Module Name: tb
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


module tb(    );
reg clk_sys;
reg rst,start_pulse;
reg [1:0] divisor;
reg [7:0] data_in;
reg [1:0] select;
wire [1:0] led;
wire d_ready;
wire [7:0] data_out;
wire tmit_data,tmit_done;
TOP uut (.clk(clk_sys),.rst(rst),.start_pulse(start_pulse),.data_in(data_in),.tmit_data(tmit_data),.tmit_done(tmit_done),.divisor(divisor)
,.d_ready(d_ready),.data_out(data_out),.select(select),. led(led)
);
initial
begin
clk_sys =0;
forever #20 clk_sys =~ clk_sys;
end
initial
begin
    data_in = 8'b0111_0101;
//    select = 2'b10;
    divisor = 2'b01;
    rst = 1;
    start_pulse = 0;
    #25
    rst = 1;
    #25
    rst = 0;
    start_pulse = 1;
    #2500
    start_pulse = 0;
    #3000
    start_pulse = 1;
    #2500
    start_pulse = 0;
//    #2000000
//    start_pulse = 1;
//    #8800000
//    data_in = 8'b0111_1101;
//    #35000000
//    start_pulse = 1;
//    #300000
//    start_pulse = 0;
//rst =1;
//# 1500
//rst =0;
//#5
//s_din = 1;
//#100
//s_din = 0;
//#100000
//s_din = 1;
end    
endmodule

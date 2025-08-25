`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/25/2025 08:21:33 PM
// Design Name: 
// Module Name: Baud_Gen_RX
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


module Baud_Gen_RX(input clk_sys, rst, input [1:0] divisor, output reg baud_clk);
//Baud-rate generator
wire [7:0] baud_reg;
reg [7:0]counter = 0;
parameter baud = 115200;
parameter clk = 200_000_000;
assign baud_reg = clk /(baud*16*divisor);
always@(posedge clk_sys or posedge rst) // EBAZ4205
begin 
    if(rst)
        begin
            baud_clk <= 0;
            counter <= 0;
        end
    else begin
        if(counter == baud_reg - 1)
        begin
            baud_clk <= 1;
            counter <= 0;
        end
        else begin
            counter <= counter +1;
            baud_clk <= 0;
            end
        end
end
endmodule


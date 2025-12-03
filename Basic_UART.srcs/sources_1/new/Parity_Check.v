`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/31/2025 04:56:36 PM
// Design Name: 
// Module Name: Parity_Check
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


module Parity_Check(
    input wire         rst,       
    input wire         parity_bit,
    input wire  [1:0]  parity_type, 
    input wire  [7:0]  raw_data, 
    output reg parity_flag
);

reg error_parity;
    localparam [1:0] ODD        = 2'b01,
           EVEN       = 2'b10;
always @(*) 
begin
  case (parity_type)
    ODD:     error_parity = (^raw_data)? 1'b0 : 1'b1;
    EVEN:    error_parity = (^raw_data)? 1'b1 : 1'b0;
    default: error_parity = 1'b1;
  endcase
end
always @(*) begin
  if(rst)
  parity_flag = 0;
  else
  parity_flag  = (error_parity ^ parity_bit);
end
endmodule

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/31/2025 04:36:37 PM
// Design Name: 
// Module Name: Parity
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


module Parity(
  input wire         rst, 
  input wire  [7:0]  data_in, 
  input wire  [1:0]  parity_type, 

  output reg         parity_bit 
);

  localparam [1:0] ODD        = 2'b01,
           EVEN       = 2'b10;

always @(*)
begin
  if (rst) parity_bit = 1'b1;
  else
  begin
    case (parity_type)
    ODD:     parity_bit = (^data_in)? 1'b0 : 1'b1;
    EVEN:    parity_bit = (^data_in)? 1'b1 : 1'b0; 
    default: parity_bit = 1'b1;
    endcase
  end
end
endmodule

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/22/2025 10:07:13 AM
// Design Name: 
// Module Name: UART
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


module TX_UART( input rst, input baud_clk, input [7:0] data_in,input start_pulse, output tmit_data,output reg tmit_done, output wire [3:0] idx,
 output reg [1:0] mux_sel,/* output [1:0] led,*/ input parity_bit, input [1:0] parity_type, output reg [2:0] current_stage, output wire [8:0] shift_reg
);
//Transmitter module
reg [2:0] next_stage;
reg [3:0] bit_order;

reg [4:0] counter = 0;
reg [2:0] jmp =0;
reg tmit_data_reg=0;
//reg [3:0] idx;
localparam TX_IDLE = 3'b001;
localparam TX_START = 3'b010;
localparam TX_WAIT = 3'b011;
localparam TX_SHIFT = 3'b100;
localparam TX_STOP = 3'b101;
assign tmit_data = (mux_sel == 2'b01) ? 0 : (mux_sel == 2'b10) ? tmit_data_reg : (mux_sel == 2'b11) ? 1 : 1'b1;
assign shift_reg = (rst) ? 0 : (parity_type==2'b10) ? {parity_bit,data_in} : (parity_type==2'b01) ? {parity_bit,data_in} : data_in;
assign idx = ((parity_type == 2'b10) || (parity_type == 2'b01)) ? 9 : 8;
always@(*)
begin
    next_stage = current_stage;
    case(current_stage)
        TX_IDLE: begin
            if(start_pulse == 1)
                next_stage = TX_START;
        end
        TX_START: begin
            if(jmp == 1)
                next_stage = TX_WAIT;
        end
        TX_WAIT: begin

            if(jmp == 3)
            begin
                if(bit_order == idx)
                begin
                    next_stage = TX_STOP;
                end
                else
                next_stage = TX_SHIFT;
            end
        end
        TX_SHIFT: begin
              if(jmp == 2)
                next_stage = TX_WAIT;
        end
        TX_STOP: begin
            if(jmp == 4)
//                if(start_pulse == 1)
//                next_stage = TX_WAIT;
//                else
                next_stage = TX_IDLE;
        end
        default: next_stage = TX_IDLE;
        endcase
end
always@(posedge baud_clk or posedge rst)
begin
    if(rst == 1)
    begin
        current_stage <= TX_IDLE;
        counter <= 0;
        bit_order <= 0;
//        shift_reg <= 0;
        mux_sel <= 2'b11;
        tmit_done <= 0;
    end
    else begin
        current_stage <= next_stage;
        tmit_done <= 0;
        case(next_stage)
            TX_IDLE: begin
                mux_sel <= 2'b11;
            end
            TX_START: begin
                mux_sel <= 2'b01; // bit 0/ bit start
                jmp <= 1;
            end
            TX_WAIT: begin
                if(counter == 14)
                begin
                counter <= 0;
                jmp <= 3;
                end
                else
                counter <= counter + 1;
            end
            TX_SHIFT: begin
                mux_sel <= 2'b10; // shift_reg
                tmit_data_reg <= shift_reg[bit_order];
                bit_order <= bit_order + 1;
                counter <= 0;
                jmp <= 2;
            end
            TX_STOP: begin
                mux_sel <= 2'b11; // bit 1 / bit stop
                if(counter == 15)
                begin
                counter <= 0;
                tmit_done <= 1;
                bit_order <= 0;
                jmp <= 4;
                end
                else
                counter <= counter + 1;
            end
          endcase
          end
end
endmodule

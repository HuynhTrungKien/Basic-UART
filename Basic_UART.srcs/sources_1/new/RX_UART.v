`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/22/2025 05:45:44 PM
// Design Name: Huynh Trung Kien
// Module Name: RX_UART
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


module RX_UART(input rst, input baud_clk, output reg [7:0] data_out, input s_din, output reg d_ready, input [1:0] parity_type, output parity_bit    );
reg [2:0] current_stage, next_stage;
reg [7:0]counter = 0;
reg sampling = 0;
reg [8:0] shift_reg = 0;
reg [3:0] bit_order,jmp = 0;
reg [3:0] idx;
localparam RX_IDLE = 3'b001;
localparam RX_MID = 3'b010;
localparam RX_WAIT = 3'b011;
localparam RX_SAM = 3'b100;
localparam RX_END = 3'b101;
assign parity_bit = (d_ready) ? shift_reg[8] : parity_bit;
always@(*)
begin
    next_stage = current_stage;
    case(current_stage)
        RX_IDLE: begin
            if(jmp == 1)
            begin
            next_stage = RX_MID;
            if(parity_type == 2'b01 || parity_type == 2'b10)
            idx = 9;
            else idx = 8;
            end
        end
        RX_MID: begin
            if(jmp == 2)
            next_stage =  RX_WAIT;
            else if (jmp == 0)
            next_stage = RX_IDLE;
        end
        RX_WAIT: begin
            if(jmp == 3)
            begin
                if(bit_order == idx)
                next_stage = RX_END;
                else
                next_stage = RX_SAM;
            end
        end
        RX_SAM: begin
            if(jmp == 2)
            next_stage = RX_WAIT;
        end
        RX_END: begin
            if(jmp == 0)
            next_stage = RX_IDLE;
        end   
    endcase        
end

always@(posedge baud_clk or posedge rst)   
begin
    if(rst) begin
        current_stage <= RX_IDLE;
        counter <= 0;
        jmp <= 0;
        d_ready <= 0;
        bit_order <= 0;
    end
    else begin
        current_stage <= next_stage;
        case(next_stage)
            RX_IDLE: begin
                d_ready <= 0;
                if(s_din == 0)
                        jmp <= 1; // RX_MID
            end
            RX_MID: begin
                if(counter == 7)
                begin
                    if(s_din == 0) begin
                        jmp <= 2; // RX_WAIT
                        counter <= 0;
                    end
                    else begin
                    jmp <= 0; //RX_IDLE
                    counter <= 0;
                    end
                end
                else counter <= counter + 1; 
            end 
            RX_WAIT: begin
                if(counter == 14) begin
                    jmp <= 3; // RX_SAM
                    counter <= 0;
                end
                else begin counter <= counter + 1; sampling <= 0; end
            end
            RX_SAM: begin
                shift_reg[bit_order] <= s_din;
                sampling <= 1;
                bit_order <= bit_order + 1;
                jmp <= 2; // RX_WAIT
            end
            RX_END: begin
                if(counter == 7)
                begin
                    jmp <= 0; // RX_IDLE
                    counter <= 0;
                    d_ready <= 1;
                    bit_order <= 0;
                end
                else counter <= counter + 1;
            end
         endcase
    end
    
end                 


always @(posedge baud_clk or posedge rst) begin
  if (rst)
    data_out <= 8'h00;
  else if (d_ready) 
    data_out <= shift_reg[7:0];
end

endmodule

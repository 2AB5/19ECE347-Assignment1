`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Amrita School of engineering, 19ECE347 - Assignment 1B
// Engineer: Abinav
// 
// Create Date: 12.09.2023 10:08:30
// Design Name: 2 BIT UP DWN COUNTER
// Module Name: OneHotEncUpDwn2Bit
// Project Name: 
// Target Devices: Zybo Z7-10 (xc7z010clg400-1)
// Tool Versions: Vivado 2020
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////
module clk_divider (
    input wire clk_125MHz,  
    output reg clk_1Hz     
);

reg [26:0] counter; // 27 bits for dividing 125MHz to 1Hz

always @(posedge clk_125MHz) begin
    if (counter == 27'd62499999) begin // 125e6 cycles = 1Hz
        counter <= 0;
        clk_1Hz <= ~clk_1Hz; 
    end else begin
        counter <= counter + 1;
    end
end

endmodule

module OneHotEncUpDwn2Bit(
    input clk,
    input reset,
    input count,
    output [3:0] y
    );
    wire cl1;
    reg [3:0]y_out;
    reg [1:0] current_state;
    reg [1:0] next_state;
    
    parameter CNT0 = 2'b00;
    parameter CNT1 = 2'b01;
    parameter CNT2 = 2'b11;
    parameter CNT3 = 2'b10;
    
    always @ (posedge cl1)
    begin
    if (count==1'b1)
    begin if (reset==1'b1)
        current_state<=CNT0;
    else
        current_state<=next_state; end
else
    begin  if (reset==1'b1)
        current_state<=CNT3;
    else
        current_state<=next_state;
end
  
end

always @(current_state)
begin

if (count==1'b1)
    case (current_state)
          CNT0:begin next_state<=CNT1;
                y_out<=4'b0001;end    
          CNT1: begin next_state<=CNT2;
                y_out<=4'b0010;end
          CNT2: begin next_state<=CNT3;
                y_out<=4'b0100;end
          CNT3: begin next_state<=CNT0;
                y_out<=4'b1000;end
    endcase
else
    case (current_state)
          CNT0: begin next_state<=CNT3;
                y_out<=4'b0001;end
          CNT1: begin next_state<=CNT0;
                y_out<=4'b0010;end
          CNT2: begin next_state<=CNT1;
                y_out<=4'b0100;end
          CNT3: begin next_state<=CNT2;
                y_out<=4'b1000;end
    endcase
             
end
assign y=y_out;
clk_divider cl(
.clk_125MHz(clk),
.clk_1Hz(cl1)
);
Endmodule


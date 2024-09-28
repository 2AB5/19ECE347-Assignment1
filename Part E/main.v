/* Module -  OneHotEncUpDwn2Bit.v
 19ECE347 - ELECTRONIC SYSTEM LEVEL DESIGN AND VERIFICATION ~ ASSIGNMENT 1 PART 1A
 Roll no - CB.EN.U4ECE20101
 Change history: 07/09/23 - V1.0 - Initial working version created (owner: Abinav Balachandar - CB.EN.U4ECE20101)
*/
/*
 Description:
 This is a 2-bit updown counter implemented using FSM and one "hot" encoding. 
    reset: A signal that resets the counter to 0.
    clk: A clock signal that increments the counter on the rising edge.
    count: The current value of the counter.
Returns:
    The next value of the counter.
*/
module OneHotEncUpDwn2Bit (
input clk,
input reset,
input count,
output [3:0]y
);

reg [3:0]y_out;
reg [1:0] current_state;
reg [1:0] next_state;
wire cl1;

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
clk_divider cl(
.clk_125MHz(clk),
.clk_1Hz(cl1)

);
assign y=y_out;
endmodule









// Clk divider 
module clk_divider (
    input wire clk_125MHz,  // 125MHz input clock
    output reg clk_1Hz     // 1Hz output clock
);

reg [26:0] counter; // 27 bits for dividing 125MHz to 1Hz

always @(posedge clk_125MHz) begin
    if (counter == 27'd62499999) begin // 125e6 cycles = 1Hz
        counter <= 0;
        clk_1Hz <= ~clk_1Hz; // Toggle the output every 125e6 cycles
    end else begin
        counter <= counter + 1;
    end
end

endmodule

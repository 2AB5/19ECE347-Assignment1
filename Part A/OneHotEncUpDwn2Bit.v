/* Module -  OneHotEncUpDwn2Bit.v
 19ECE347 - ELECTRONIC SYSTEM LEVEL DESIGN AND VERIFICATION ~ ASSIGNMENT 1 PART 1A
 Roll no - CB.EN.U4ECE20101
 Change history: 07/09/23 - V1.0 - Initial working version created (owner: Abinav Balachandar - CB.EN.U4ECE20101)
*/
/*
 Descrpition:
 This is a 2 bit updown counter implemented using FSM and one sss "hot" encoding. 
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

parameter CNT0 = 2'b00;
parameter CNT1 = 2'b01;
parameter CNT2 = 2'b11;
parameter CNT3 = 2'b10;

always @ (posedge clk)
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
endmodule

/*
 Module - Dec2x4.v
 19ECE347 - ELECTRONIC SYSTEM LEVEL DESIGN AND VERIFICATION ~ ASSIGNMENT 1 PART 1A
 Roll no - CB.EN.U4ECE20101
 Change history: 05/09/23 - V1.0 - Initial working version created (owner: Abinav Balachandar - CB.EN.U4ECE20101)
*/
/*
 Descrpition:
 This is a 2x4 Decoder => 2 inputs, 4 outputs. 
 This is a 2x4 decoder with two input lines, A and B, and four output lines, Y0, Y1, Y2, and Y3.
 The system takes the input A and B and outputs one of the four output lines based on the combination of A and B.
*/

module Dec2x4 (
 input wire [1:0]A,
 output [3:0]Y 
);
reg [3:0]Yo; // Special internal signal for Y

always @(A)
begin
 if(A==0)
  Yo = 4'b0001;
 else if (A==1)
  Yo = 4'b0010;
 else if (A==2)
  Yo = 4'b0100;
 else 
  Yo = 4'b1000;
end

assign Y=Yo;

endmodule


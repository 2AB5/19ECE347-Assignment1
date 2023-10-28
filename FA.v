/*
 Module - FA.v
 19ECE347 - ELECTRONIC SYSTEM LEVEL DESIGN AND VERIFICATION ~ ASSIGNMENT 1 PART 1A
 Roll no - CB.EN.U4ECE20101
 Change history: 05/09/23 - V1.0 - Initial working version created (owner: Abinav Balachandar - CB.EN.U4ECE20101)
*/
/*
 Descrpition:
 This is a Full adder => 3 inputs, 2 outputs. 
 input lines are A,B,C and output is Sum and Carry
*/

module FA(
 input [2:0]A,
 output Sum,
 output Carry
);

reg So;
reg Co;

always @(A)
begin
  if(A==0)
   So = 1'b0;
   Co = 1'b0;
  if(A==1 || A==2 || A==4)
   So = 1'b1;
   Co = 1'b0;
  if(A==3 || A==5 || A==6)
   So = 1'b0;
   Co = 1'b1;
  if (A==7)
   So = 1'b1;
   Co = 1'b1;
end

assign Sum = So;
assign Carry = Co;

endmodule 

/*
 Module - Even2Parity.v
 19ECE347 - ELECTRONIC SYSTEM LEVEL DESIGN AND VERIFICATION ~ ASSIGNMENT 1 PART 1A
 Roll no - CB.EN.U4ECE20101
 Change history: 05/09/23 - V1.0 - Initial working version created (owner: Abinav Balachandar - CB.EN.U4ECE20101)
*/
/*
 Descrpition:
 This is a even parity generator wherein we have X input lines and one output line.
 Here, X = 2 since we have designed it for 2 bits. 
*/

module Even2Parity(
 input a,
 input b,
 output y
);

reg yo; 

always @(a or b)
begin
 if(a==0&&b==0 || a==1&&b==1)
  yo = 1;
else 
  yo = 0;
end

assign y = yo;

endmodule
 

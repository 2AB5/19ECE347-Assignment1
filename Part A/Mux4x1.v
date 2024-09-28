/*
 Module - Mux4x1.v
 19ECE347 - ELECTRONIC SYSTEM LEVEL DESIGN AND VERIFICATION ~ ASSIGNMENT 1 PART 1A
 Roll no - CB.EN.U4ECE20101
 Change history: 05/09/23 - V1.0 - Initial working version created (owner: Abinav Balachandar - CB.EN.U4ECE20101)
*/
/*
 Descrpition:
 This is a 4x1 Multiplexer => 4 inputs, 1 outputs and 2 Selectlines 
 The inputs are defined as a,b,c,d. The system selects one of the four input data and outputs it to Y based on the select lines.
*/


module Mux4x1 (
 input a,
 input b,
 input c,
 input d,
 input S0,
 input S1,
 output Y
);


//Signal definitions 

reg Yo; // This is a special internal signal for output port Y

//Main Module description
always @(a or b or c or d or S0 or S1)
begin
   if(S0==0&&S1==0)
       Yo = a;
   else if(S0==0&&S1==1)
       Yo = b;
   else if(S0==1&&S1==0)
       Yo = c;
   else 
       Yo = d;
end 

assign Y = Yo; // We assign Y to its placeholder internal signal !

endmodule 

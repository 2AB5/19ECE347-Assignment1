#PartA - Hardware design using FPGA

Paste the synthesizable behavioural Verilog code for the following. The code should follow standard coding guidelines as provided in the sample file. 
• 4x1 Multiplexer • 2x4 Decoder • Even Partiy Generator • Full adder

For a 2 bit up-down counter 
• Draw the State diagram of the same and encode the states using o Binary encoding o One-hot encoding
• Paste the synthesizable code of the 2-bit up-down counter, designed using one-hot encoding 
• Synthesize the counter in FPGA and paste the following o The RTL view output from Vivado o Device utilization o Power report o Timing report (with a given clock constraint)


### 1.1	4x1 Multiplexer 

/*
 Module - Mux4x1.v
 19ECE347 - ELECTRONIC SYSTEM LEVEL DESIGN AND VERIFICATION ~ ASSIGNMENT 1 PART 1A
 Roll no - CB.EN.U4ECE20101
 Change history: 05/09/23 - V1.0 - Initial working version created (owner: Abinav Balachandar - CB.EN.U4ECE20101)
*/
/*
 Description:
 This is a 4x1 Multiplexer => 4 inputs, 1 output and 2 Select lines 
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

### 1.2	2x4 Decoder

/*
 Module - Dec2x4.v
 19ECE347 - ELECTRONIC SYSTEM LEVEL DESIGN AND VERIFICATION ~ ASSIGNMENT 1 PART 1A
 Roll no - CB.EN.U4ECE20101
 Change history: 05/09/23 - V1.0 - Initial working version created (owner: Abinav Balachandar - CB.EN.U4ECE20101)
*/
/*
 Description:
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

assign Y=Yo; // We assign Y to its placeholder internal signal

endmodule

### 1.3	Even parity Generator 
/*
 Module - Even2Parity.v
 19ECE347 - ELECTRONIC SYSTEM LEVEL DESIGN AND VERIFICATION ~ ASSIGNMENT 1 PART 1A
 Roll no - CB.EN.U4ECE20101
 Change history: 05/09/23 - V1.0 - Initial working version created (owner: Abinav Balachandar -  CB.EN.U4ECE20101)
*/
/*
 Description:
 This is an even parity generator wherein we have X input lines and one output line.
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

assign y = yo; // We assign y to its placeholder internal signal

endmodule

### 1.4	Full adder
/*
 Module - FA.v
 19ECE347 - ELECTRONIC SYSTEM LEVEL DESIGN AND VERIFICATION ~ ASSIGNMENT 1 PART 1A
 Roll no - CB.EN.U4ECE20101
 Change history: 05/09/23 - V1.0 - Initial working version created (owner: Abinav Balachandar - CB.EN.U4ECE20101)
*/
/*
 Description:
 This is a Full adder => 3 inputs, 2 outputs. 
 input lines are A,B,C, and output is Sum and Carry
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





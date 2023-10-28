# 19ECE347-Assignments


## Part A-Hardware Design using FPGA
1.	Paste the synthesizable behavioural Verilog code for the following. The code should follow standard coding guidelines as provided in the sample file. 
•	4x1 Multiplexer
•	2x4 Decoder
•	Even Partiy Generator
•	Full adder
2.	For a 2 bit up-down counter
•	Draw the State diagram of the same and encode the states using
o	Binary encoding
o	One-hot encoding
•	Paste the synthesizable code of the 2-bit up-down counter, designed using one-hot encoding
•	Synthesize the counter in FPGA and paste the following
o	The RTL  view output from Vivado
o	Device utilization
o	Power report
o	Timing report  (with a given clock constraint)


## Part B-Hardware implementation using FPGA 
1.	Implement the design on Basys3/ Zybo board and take a video of the inputs being switched and output seven segment/LEDs representing the counter bits blinking according to the set clock frequency.


## Part C- Design using FPGA with a hardware-software approach
1.	Synthesize the up-down counter on an FPGA and simulate using test vectors generated from the ARM processor. 
a.	Initial set of test vectors should be generated using python
b.	Those vectors should be given as input to the design
c.	The output should be verified
d.	Repeat the process, but using input vectors from a file and writing the output to a file and checking the validity using a golden file(expected output file).

## Part D- Hardware Design using FPGA with a hardware-software approach (Digilent Discovery kit)
1.	Synthesize the up-down counter on an FPGA and simulate using test vectors generated from the ARM processor. The output bits need to be monitored on screen using Digilent Discovery Kit to verify the functionality

## PART E- ASIC Synthesis using Synopys
1.	Synthesize the counter as an ASIC using Synopsys tool using a clock constraint and  paste the following
o	Synthesized output
o	Power report
o	Timing report  (with a given clock constraint)

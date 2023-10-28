/*
 Module - UpDwn2bit.v
 19ECE347 - ELECTRONIC SYSTEM LEVEL DESIGN AND VERIFICATION ~ ASSIGNMENT 1 PART 1A
 Roll no - CB.EN.U4ECE20101
 Change history: 07/09/23 - V1.0 - Initial working version created (owner: Abinav Balachandar - CB.EN.U4ECE20101)
*/
/*
 Descrpition:
 This is a 2 bit updown counter implemented using FSM and one sss "hot" encoding. 
    reset: A signal that resets the counter to 0.
    enable: A signal that enables the counter to count.
    clk: A clock signal that increments the counter on the rising edge.
    count: The current value of the counter.
Returns:
    The next value of the counter.
*/

`timescale 1ns / 1ps
module UpDwn2bit(
    reset,
    enable,
    clk,
    count
    );
	 
	input clk;
	input reset;
	input enable;
	output count;
	
	wire clk;
	wire reset;
	wire enable;
	reg [1:0] count;
	
	parameter [1:0] max = 3;
	parameter [1:0] UP  = 2'b00,
	                DOWN = 2'b01,
	                RESET = 2'b11,
	                IDLE = 2'b10;
	
	reg [1:0] state, next, saved_state;
	
	always @(posedge clk)
		if(reset)
			state = RESET;
		else
			state = next;
	
	always @(negedge clk)
		if(state == RESET) begin
			count <= 0;
			next <= UP;
		end else if (enable)
			case (state)
				UP:
					if(count == max) begin
						next <= DOWN;
						count <= count - 1;
					end else
						count <= count + 1;
				DOWN:
					if(count == 0) begin
						next <= UP;
						count <= count + 1;
					end else
						count <= count - 1;
				IDLE:
					next <= saved_state;
			endcase
		else
			next <= IDLE;
					
endmodule 

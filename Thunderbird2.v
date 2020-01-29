`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:21:48 09/26/2019 
// Design Name: 
// Module Name:    Thunderbird2 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module Thunderbird2(L, R, Rs, Clk, LA, LB, LC, RA, RB, RC);

	input L, R, Rs, Clk;
	output reg LA, LB, LC, RA, RB, RC;

	
	parameter OFF = 0, ON1 = 1, ON2 = 2, ON3 = 3, ON4 = 4, ON5 = 5, ON6 = 6;
	
	reg[2:0] State, StateNext;
	
	//Combinational Logic
	always @(State, L, R) begin
		case(State)
			OFF: begin
				LA <= 0; LB <= 0; LC <= 0; RA <= 0; RB <= 0; RC <= 0;
				if (L <= 0 && R <= 0)
					StateNext <= OFF;
				else if (L <= 0 && R <= 1)
					StateNext <= ON4;
				else if (L <= 1 && R <= 0)
					StateNext <= ON1;
				else 
					StateNext <= OFF;
			end
			ON1: begin
				LA <= 1; LB <= 0; LC <= 0; RA <= 0; RB <= 0; RC <= 0;
				StateNext <= ON2;
			end
			ON2: begin
				LA <= 1; LB <= 1; LC <= 0; RA <= 0; RB <= 0; RC <= 0;
				StateNext <= ON3;
			end
			ON3: begin
				LA <= 1; LB <= 1; LC <= 1; RA <= 0; RB <= 0; RC <= 0;
				StateNext <= OFF;
			end
			ON4: begin
				LA <= 0; LB <= 0; LC <= 0; RA <= 1; RB <= 0; RC <= 0;
				StateNext <= ON5;
			end
			ON5: begin
				LA <= 0; LB <= 0; LC <= 0; RA <= 1; RB <= 1; RC <= 0;
				StateNext <= ON6;
			end
			ON6: begin
				LA <= 0; LB <= 0; LC <= 0; RA <= 1; RB <= 1; RC <= 1;
				StateNext <= OFF;
			end
			default: begin
				LA <= 0; LB <= 0; LC <= 0; RA <= 0; RB <= 0; RC <= 0;
				StateNext <= OFF;
			end
		endcase
	end 	
	
	//State Register
	always @(posedge Clk) begin
		if (Rs == 1)
			State <= OFF;
		else
			State <= StateNext;
	end

endmodule
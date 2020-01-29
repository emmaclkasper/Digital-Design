`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:55:24 10/03/2019 
// Design Name: 
// Module Name:    TopThunderbird 
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
module TopThunderbird(L, R, Rs, Clk, DivRst, LA, LB, LC, RA, RB, RC);

	input L, R, Rs, Clk, DivRst; 
	output LA, LB, LC, RA, RB, RC;
	wire ClkOut;

	ClkDiv RealClk(Clk, DivRst, ClkOut);
	Thunderbird2 Thunder(L, R, Rs, ClkOut, LA, LB, LC, RA, RB, RC);

endmodule

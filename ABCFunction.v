`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:55:25 09/05/2019 
// Design Name: 
// Module Name:    ABCFunction 
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
module ABCFunction(A, B, C, Y);

	input A, B, C;
	output Y;
	reg Y;
	
	always @* begin
		Y <= (~A&~B&~C) | (A&~B&~C) | (A&~B&C);
		end

endmodule

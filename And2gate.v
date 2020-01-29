`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:37:19 08/22/2019 
// Design Name: 
// Module Name:    And2gate 
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
module And2gate(A,B,F);
	input A,B;
	output F;
	reg F;
	
	always @(A,B)
	begin
		F<=A&B;
		end

endmodule

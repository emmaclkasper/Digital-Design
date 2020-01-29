`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Courtney Trust and Emma Kasper
// 
// Create Date:    13:03:14 10/17/2019 
// Design Name: 
// Module Name:    Mux2by1 
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
module Mux2by1(I1, I0, S0, DVal);

	input [3:0] I1, I0;
	input S0;
	output reg [3:0] DVal;
	
	always @* begin
		if (S0 == 0)
			DVal <= I0; //display ones digit
		else if (S0 == 1)
			DVal <= I1; //display tens digit
	end

endmodule

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:03:53 10/03/2019 
// Design Name: 
// Module Name:    ClkDiv_tb 
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
module ClkDiv_tb();

	reg Clk_s, DivRst_s;
	wire ClkOut_s;
	
	ClkDiv CompToTest(Clk_s, DivRst_s, ClkOut_s);

	always begin
		Clk_s <= 0;
		#10;
		Clk_s <= 1;
		#10;
	end

	initial begin
		DivRst_s <= 1;
		@(posedge Clk_s);
		#5 DivRst_s <= 0;
		@(posedge Clk_s);
	end

endmodule

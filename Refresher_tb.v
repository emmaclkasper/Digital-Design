`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:08:52 10/17/2019 
// Design Name: 
// Module Name:    Refresher_tb 
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
module Refresher_tb();

	reg Clk_s, Rst_s;
	wire Refresh_s;
	
	Refresher ComptoTest(Clk_s, Rst_s, Refresh_s);
	
	//Clock Procedure
	always begin
		Clk_s <= 0;
		#10;
		Clk_s <= 1;
		#10;
	end
	
	
	//Vector Procedure
	initial begin
		Rst_s <= 1;
	#15 Rst_s <= 0;

	end

endmodule

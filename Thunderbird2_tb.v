`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:44:32 09/26/2019 
// Design Name: 
// Module Name:    Thunderbird2_tb 
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
module Thunderbird2_tb();

	reg L_s, R_s, Rs_s, Clk_s;
	wire LA_s, LB_s, LC_s, RA_s, RB_s, RC_s;
	
	Thunderbird2 CompToTest(L_s, R_s, Rs_s, Clk_s, LA_s, LB_s, LC_s, RA_s, RB_s, RC_s);


	//Clock Procedure
	always begin
		Clk_s <= 0;
		#10;
		Clk_s <= 1;
		#10;
	end
	
	//Vector Procedure
	initial begin
		Rs_s <= 1;
		L_s <= 0;
		R_s <= 0;
		@(posedge Clk_s);
		#5 Rs_s <= 0;
		L_s <= 0;
		R_s <= 0;
		@(posedge Clk_s);
		#5 Rs_s <= 0;
		L_s <= 1;
		R_s <= 0;
		@(posedge Clk_s);
		@(posedge Clk_s);
		@(posedge Clk_s);
		@(posedge Clk_s);
		#5 Rs_s <= 0;
		L_s <= 0;
		R_s <= 1;
		@(posedge Clk_s);
		@(posedge Clk_s);
		@(posedge Clk_s);
		@(posedge Clk_s);
		#5 Rs_s <= 0;
		L_s <= 1;
		R_s <= 1;
		@(posedge Clk_s);
		#5 Rs_s <=1;
		L_s <= 1;
		R_s <= 0;
		@(posedge Clk_s);
		#5 Rs_s <=1;
		L_s <= 0;
		R_s <= 1;
		@(posedge Clk_s);
		#5 Rs_s <=1;
		L_s <= 1;
		R_s <= 1;
		@(posedge Clk_s);
		#5 Rs_s <= 0;
		L_s <= 1;
		R_s <= 0;
		@(posedge Clk_s);
		#5 Rs_s <= 1;
		L_s <= 1;
		R_s <= 0;
		@(posedge Clk_s);
		
	end
	
endmodule

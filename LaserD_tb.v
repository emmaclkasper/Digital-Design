`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:23:40 10/24/2019 
// Design Name: 
// Module Name:    LaserD_tb 
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
module LaserD_tb();

	reg B_s, S_s, Rst_s, Clk_s;
	wire [15:0]D_s;
	wire L_s;
	
	LaserD RealLaser(B_s, S_s, Rst_s, Clk_s, L_s, D_s);
	
	always begin
		Clk_s <= 0;
		#10;
		Clk_s <= 1;
		#10;
	end
	
	always @(posedge Clk_s) begin
		Rst_s <= 1;
		@(posedge Clk_s);
		@(posedge Clk_s);
		#5 Rst_s <= 0;
		B_s <= 1;
		@(posedge Clk_s);
		@(posedge Clk_s);
		@(posedge Clk_s);
		@(posedge Clk_s);
		@(posedge Clk_s);
		@(posedge Clk_s);
		@(posedge Clk_s);
		@(posedge Clk_s);
		S_s <= 1;
		@(posedge Clk_s);
		@(posedge Clk_s);
		@(posedge Clk_s);
	
		
	end
	

endmodule

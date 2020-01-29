`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:41:27 10/17/2019 
// Design Name: 
// Module Name:    BCDDispDriver_tb 
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
module BCDDispDriver_tb();

	reg Clk_s, Rst_s;
	reg [3:0] Tens_s, Ones_s;
	wire A_s, B_s, C_s, D_s, E_s, F_s, G_s, SegSel_s;
	
	BCDDispDriver CompToTest(Clk_s, Rst_s, Tens_s, Ones_s, A_s, B_s, C_s, D_s, E_s, F_s, G_s, SegSel_s);
	
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
		Tens_s <= 4'b0001;
		Ones_s <= 4'b0001;
		@(posedge Clk_s);
		@(posedge Clk_s);
		#5 Rst_s <= 0;
		Tens_s <= 4'b0001;
		Ones_s <= 4'b0001;
		@(posedge Clk_s);
		@(posedge Clk_s);
		#5 Rst_s <= 0;
		Tens_s <= 4'b0001;
		Ones_s <= 4'b0100;
		@(posedge Clk_s);
		@(posedge Clk_s);
		#5 Rst_s <= 0;
		Tens_s <= 4'b0000;
		Ones_s <= 4'b1000;
		@(posedge Clk_s);
		@(posedge Clk_s);
	end
	

endmodule

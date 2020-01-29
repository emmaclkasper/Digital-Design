`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:26:16 10/10/2019 
// Design Name: 
// Module Name:    UDCounter_tb 
// Project Name: 
// Target Devices: 
// Tool veRstions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module UDCounter_tb();

	reg Clk_s, Rst_s, E_s, U_s;
	wire [3:0]Cnt_s;
	
	UDCounter ComptoTest(Clk_s, Rst_s, E_s, U_s, Cnt_s);
	
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
		E_s <= 0;
		U_s <= 0;
		@(posedge Clk_s);
		#5 Rst_s <= 1;
		E_s <= 1;
		U_s <= 0;
		@(posedge Clk_s);
		#5 Rst_s <= 1;
		E_s <= 0;
		U_s <= 1;
		@(posedge Clk_s);
		#5 Rst_s <= 0;
		E_s <= 1;
		U_s <= 1;
		@(posedge Clk_s);
		@(posedge Clk_s);
		@(posedge Clk_s);
		@(posedge Clk_s);
		@(posedge Clk_s);
		@(posedge Clk_s);
		@(posedge Clk_s);
		@(posedge Clk_s);
		@(posedge Clk_s);
		@(posedge Clk_s);
		@(posedge Clk_s);
		@(posedge Clk_s);
		@(posedge Clk_s);
		@(posedge Clk_s);
		@(posedge Clk_s);
		@(posedge Clk_s);
		@(posedge Clk_s);
		@(posedge Clk_s);
		@(posedge Clk_s);
		@(posedge Clk_s);
		@(posedge Clk_s);
		#5 Rst_s <= 0;
		E_s <= 1;
		U_s <= 0;
		@(posedge Clk_s);
		@(posedge Clk_s);
		@(posedge Clk_s);
		@(posedge Clk_s);
		@(posedge Clk_s);
		@(posedge Clk_s);
		@(posedge Clk_s);
		@(posedge Clk_s);
		@(posedge Clk_s);
		@(posedge Clk_s);
		@(posedge Clk_s);
		@(posedge Clk_s);
		@(posedge Clk_s);
		@(posedge Clk_s);
		@(posedge Clk_s);
		@(posedge Clk_s);
		@(posedge Clk_s);
		#5 Rst_s <= 0;
		E_s <= 0;
		U_s <= 0;
		@(posedge Clk_s);
		#5 Rst_s <= 0;
		E_s <= 0;
		U_s <= 1;
		@(posedge Clk_s);
		#5 Rst_s <= 0;
		E_s <= 1;
		U_s <= 0;
		@(posedge Clk_s);
		#5 Rst_s <= 1;
		E_s <= 1;
		U_s <= 0;
		@(posedge Clk_s);
		@(posedge Clk_s);
		
	end

endmodule

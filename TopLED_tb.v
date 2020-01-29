`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:32:40 10/10/2019 
// Design Name: 
// Module Name:    TopLED_tb 
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
module TopLED_tb();

	reg Clk_s, DivRst_s, Rst_s, E_s, U_s;
	wire SegSel_s, CA_s, CB_s, CC_s, CD_s, CE_s, CF_s, CG_s;
	
	TopLED TopLEDTest(Clk_s, DivRst_s, Rst_s, E_s, U_s, SegSel_s, CA_s, CB_s, CC_s, CD_s, CE_s, CF_s, CG_s);

	//Clock Procedure
	always begin
		Clk_s <= 0;
		#10;
		Clk_s <= 1;
		#10;
	end
	
	//Vector Procedure
	initial begin
		DivRst_s <= 1;
		Rst_s <= 0;
		@(posedge Clk_s);
		@(posedge Clk_s);
		@(posedge Clk_s);
		@(posedge Clk_s);
		#5 DivRst_s <= 0;
		Rst_s <= 1;
		@(posedge Clk_s);
		@(posedge Clk_s);
		@(posedge Clk_s);
		@(posedge Clk_s);
		#5 DivRst_s <= 0;
		Rst_s <= 0;
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
		#5 DivRst_s <= 0;
		Rst_s <= 0;
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
		@(posedge Clk_s);
		@(posedge Clk_s);
		@(posedge Clk_s);
		#5 DivRst_s <= 0;
		Rst_s <= 0;
		E_s <= 0;
		U_s <= 0;
		@(posedge Clk_s);
		@(posedge Clk_s);
		@(posedge Clk_s);
		@(posedge Clk_s);
		@(posedge Clk_s);
		#5 DivRst_s <= 0;
		Rst_s <= 0;
		E_s <= 0;
		U_s <= 1;
		@(posedge Clk_s);
		@(posedge Clk_s);
		@(posedge Clk_s);
		@(posedge Clk_s);
		@(posedge Clk_s);
		#5 DivRst_s <= 0;
		Rst_s <= 0;
		E_s <= 1;
		U_s <= 0;
		@(posedge Clk_s);
		@(posedge Clk_s);
		@(posedge Clk_s);
		@(posedge Clk_s);
		@(posedge Clk_s);
		@(posedge Clk_s);
		#5 DivRst_s <= 0;
		Rst_s <= 1;
		E_s <= 1;
		U_s <= 0;
		@(posedge Clk_s);
		@(posedge Clk_s);
		@(posedge Clk_s);
		@(posedge Clk_s);
		@(posedge Clk_s);
		@(posedge Clk_s);
		#5 DivRst_s <= 1;
		Rst_s <= 0;
		E_s <= 1;
		U_s <= 0;
		@(posedge Clk_s);
		@(posedge Clk_s);
		@(posedge Clk_s);
		@(posedge Clk_s);
		@(posedge Clk_s);
		@(posedge Clk_s);
		

		
	end

endmodule

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:32:20 10/10/2019 
// Design Name: 
// Module Name:    TopLED 
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
module TopLED(Clk, DivRst, Rst, E, U, SegSel, CA, CB, CC, CD, CE, CF, CG);

	input Clk, DivRst, Rst, E, U;
	output SegSel, CA, CB, CC, CD, CE, CF, CG;
	wire [3:0]Cnt; 
	wire ClkOut;
	
	ClkDiv RealClk(Clk, DivRst, ClkOut);
	UDCounter TopCounter(ClkOut, Rst, E, U, Cnt);
	SevenLED Top7LED(Cnt[3], Cnt[2], Cnt[1], Cnt[0], SegSel, CA, CB, CC, CD, CE, CF, CG);

endmodule

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:35:18 10/03/2019 
// Design Name: 
// Module Name:    ClkDiv 
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
module ClkDiv(Clk, DivRst, ClkOut);

	input Clk, DivRst;
	output reg ClkOut;
	
	parameter BoardClk = 50000000;//50000000 Hz board clock
	parameter Clk_out = 1; //1 Hz
	parameter MaxCount = BoardClk/(Clk_out); //max counter size 50000000 cycles
	
	reg [25:0] Counter = 0; //26-bit counter
	
	always @(posedge Clk)
	begin
	
		if(DivRst == 1)
			ClkOut <=0;
		else if (Counter == MaxCount-1) 
			begin
				Counter <= 0;
				ClkOut <= ~ClkOut;
			end
		else
			begin
			Counter <= Counter + 1'd1;
			end	
	end
endmodule
















`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:26:01 10/10/2019 
// Design Name: 
// Module Name:    UDCounter 
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
module UDCounter(Clk, Rst, E, U, Cnt);

	input Clk, Rst, E, U;
	output reg [3:0] Cnt;


	always @(posedge Clk) begin
		if(Rst == 1)
			Cnt <= 4'b0000;
		else if (Rst == 0 && E == 1 && U == 1)
			if (Cnt == 15)
			begin
				Cnt <= 4'b0000;
			end
			else
			begin
				Cnt <= Cnt + 4'b0001;
			end
		else if (Rst == 0 && E == 1 && U == 0)
			if (Cnt == 0)
			begin
				Cnt <= 4'b1111;
			end
			else
			begin
				Cnt <= Cnt - 4'b0001;
			end
		else if (Rst == 0 && E == 0)
			Cnt <= Cnt;
		else
			Cnt <= 4'b0000;
	end

	


endmodule

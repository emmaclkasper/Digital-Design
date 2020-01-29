`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:09:23 10/17/2019 
// Design Name: 
// Module Name:    Mux2by1_tb 
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
module Mux2by1_tb();

	reg [3:0] I1_s, I0_s;
	reg S0_s;
	wire [3:0] DVal_s;
	
	Mux2by1 ComptoTest(I1_s, I0_s, S0_s, DVal_s);
	
	//Vector Procedure
	initial begin
	
		S0_s <= 0; I1_s <= 4'b0001; I0_s <= 4'b0000; 
		#10 I1_s <= 4'b0001; I0_s<= 4'b0000; S0_s <= 1;
	
	end


endmodule

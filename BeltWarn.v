`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:26:09 09/05/2019 
// Design Name: 
// Module Name:    BeltWarn 
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
module BeltWarn(K, P, S, W);

	input K, P, S;
	output W;
	reg W;
	
	always @(K,P,S)begin
		W <= K & P & ~S;
		end


endmodule

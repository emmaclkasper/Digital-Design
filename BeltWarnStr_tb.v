`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:48:42 09/05/2019 
// Design Name: 
// Module Name:    BeltWarnStr_tb 
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
module BeltWarnStr_tb();

	reg K_s, P_s, S_s;
	wire W_s;
	
	BeltWarnStr CompToTest(K_s, P_s, S_s, W_s);
	
	initial begin
		K_s <= 0; P_s <= 0; S_s <= 0;
		#10 K_s <= 0; P_s <= 1; S_s <= 0;
		#10 K_s <= 1; P_s <= 1; S_s <= 0;
		#10 K_s <= 1; P_s <= 1; S_s <= 1;
		end
		

endmodule

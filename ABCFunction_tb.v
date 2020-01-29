`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:58:50 09/05/2019 
// Design Name: 
// Module Name:    ABCFunction_tb 
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
module ABCFunction_tb();

	reg A_s, B_s, C_s;
	wire Y_s;
	
	ABCFunction CompToTest(A_s, B_s, C_s, Y_s);
	
	initial begin
	A_s <= 0; B_s <=0; C_s <= 0;
	#10 A_s <= 0; B_s <= 0; C_s <= 1;
	#10 A_s <= 0; B_s <= 1; C_s <= 0;
	#10 A_s <= 0; B_s <= 1; C_s <= 1;
	#10 A_s <= 1; B_s <= 0; C_s <= 0;
	#10 A_s <= 1; B_s <= 0; C_s <= 1;
	#10 A_s <= 1; B_s <= 1; C_s <= 0;
	#10 A_s <= 1; B_s <= 1; C_s <= 1;
	end

endmodule

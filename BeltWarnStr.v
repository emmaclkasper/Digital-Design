`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:45:33 09/05/2019 
// Design Name: 
// Module Name:    BeltWarnStr 
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
module BeltWarnStr(K, P, S, W);
	input K, P, S;
	output W;
	
	wire N1, N2;
	
	and And_1(N1, K, P);
	not Inv_1(N2, S);
	and And_2(W, N1, N2);

endmodule

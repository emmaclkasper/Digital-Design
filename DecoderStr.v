`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:35:14 09/05/2019 
// Design Name: 
// Module Name:    DecoderStr 
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
module DecoderStr(I1, I0, D3, D2, D1, D0);

input I1, I0;
output D3, D2, D1, D0;

wire N1, N2, N3, N4;

not Inv_1(N1, I1);
not Inv_2(N2, I0);
and And_1(D0, N1, N2);

not Inv_3(N3, I1);
and And_2(D1, N3, I0);

not Inv_4(N4, I0);
and And_3(D2, N4, I1);

and And_4(D3, I1, I0);

endmodule

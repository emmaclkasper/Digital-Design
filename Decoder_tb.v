`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:24:41 09/05/2019 
// Design Name: 
// Module Name:    Decoder_tb 
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
module Decoder_tb();

reg I1_s, I0_s;
wire D3_s, D2_s, D1_s, D0_s;

Decoder CompToTest(I1_s, I0_s, D3_s, D2_s, D1_s, D0_s);

initial begin

I1_s <= 0; I0_s <= 0;
#10 I1_s <= 0; I0_s <= 1;
#10 I1_s <= 1; I0_s <= 0;
#10 I1_s <= 1; I0_s <= 1;

end


endmodule

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:47:29 08/22/2019 
// Design Name: 
// Module Name:    And2gate_tb 
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
module And2gate_tb();
reg A_t, B_t;
wire F_t;

And2gate And2gate_1(A_t,B_t,F_t);

initial begin
//case 0
A_t<=0; B_t<=0;
#1 $display("F_t=%b",F_t);

//case1
A_t<=0;B_t<=1;
#1 $display("F_t=%b",F_t);

//case2
A_t<=1;B_t<=0;
#1 $display("F_t=%b",F_t);

//case3
A_t<=1;B_t<=1;
#1 $display("F_t=%b",F_t);

end

endmodule

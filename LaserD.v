`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:23:24 10/24/2019 
// Design Name: 
// Module Name:    LaserD 
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
module LaserD(B, S, Rst, Clk, L, D);

	input B, S, Rst, Clk;
	output reg L;
	output reg [15:0]D;
	
	parameter S_OFF = 0, S_W1 = 1, S_ON1 = 2, S_W2 = 3, S_CALC = 4; 
	
	reg [15:0] Dctr; //round trip distance because Dreg = Dctr / 2
	reg [15:0] Dreg; //real distance
	reg [2:0] State;

	
	always @(posedge Clk) begin
		if(Rst == 1)
			begin
				State <= S_OFF;
				Dctr <= 0;
				Dreg <= 0;
				D <= 0;
			end
		else
			begin
				case (State)
					S_OFF:
					begin
						L <= 0;
						D <= 0;
						Dreg <= 0;
						State <= S_W1;
					end
					
					S_W1:
					begin
							L <= 0;
							D <= 0;
							Dreg <= 0;
							Dctr <= 0;
							if(B == 1)
								State <= S_ON1;
							else
								State <= S_W1;
					end
					
					S_ON1:
					begin
							L <= 1;
							Dreg <= 0;
							Dctr <= 0;
							State <= S_W2;
					end
					
					S_W2:
					begin
							L <= 0;
							Dreg <= 0;
							if(S == 1)
								State <= S_CALC;
							else
							begin
								State <= S_W2;
								Dctr = Dctr + 16'b0000000000000001;
							end
					end
					
					S_CALC:
					begin
							L <= 0;
							Dreg = Dctr / 2;
							D <= Dreg;
							State <= S_W1;
					end
					
				endcase
			end
			
	end


endmodule

/*
 * Design: CSEE4270 - Skeleton module for Refresher generating 
 *                    16ms square signal with 50% duty cycle
 * Author: Courtney Trust and Emma Kasper
 * 
 *
 * 
 *
 */

`timescale 1ns / 1ps
module Refresher(Clk, Rst, Refresh);

   input Clk, Rst;
   output reg Refresh;

	parameter BoardClk = 50000000; //50000000 Hz board clock 
	parameter Clk_out = 62.5; //62.5 Hz = 16 ms
	parameter MaxCount = 3; //BoardClk/(2*Clk_out); //max counter size 8000000 cycles
	
	reg [2:0] Counter = 0; //23-bit counter
	
	always @(posedge Clk)
	begin
	
		if(Rst == 1)
		begin
			Refresh <= 0;
			Counter <= 0;
		end
		else if (Counter == MaxCount-1) 
			begin
				Counter <= 0;
				Refresh <= ~Refresh;
			end
		else
			begin
			Counter <= Counter + 1'b1;
			end	
	end

endmodule

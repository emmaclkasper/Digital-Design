/*
 * Design: CSEE4270 - Skeleton Module for Multiplexed BCD Display Driver
 * Author: Courtney Trust and Emma Kasper
 * 
 *
 * 
 *
 */

`timescale 1ns / 1ns
module BCDDispDriver(Clk, Rst, Tens, Ones, A, B, C, D, E, F, G, SegSel);

   input Clk, Rst;
   input [3:0] Tens, Ones;
   output A, B, C, D, E, F, G;
   output SegSel;
	wire [3:0] DVal;
	wire SegSel;
	
	Refresher RealRefresher(Clk, Rst, SegSel);
	Mux2by1 RealMux(Tens, Ones, SegSel, DVal);
	SevenLED RealLED(DVal[3], DVal[2], DVal[1], DVal[0], A, B, C, D, E, F, G);

endmodule

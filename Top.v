`timescale 1ns / 1ns
module Top(Clk, Rst, DivRst, Start, LED, LCD_Data, LCD_E, LCD_RS, LCD_RW); 

	input Clk, Rst, DivRst;
	input Start;
	output [7:0] LED;
   output [11:8] LCD_Data;
   output LCD_E, LCD_RS, LCD_RW;

   wire ClkMS, ClkLCD;
   wire [12:0] RandomValue;
   wire [9:0] ReactionTime;
	wire Cheat, Slow, Wait, LCDUpdate, LCDAck;
	
	ClkDiv ClkDiv_0 (Clk, DivRst, ClkMS);
	LCDClkDiv LCDClkDiv_0 (Clk, DivRst, ClkLCD);
	ReactionTimer ReactionTimer_0 (ClkMS, Rst, Start, LED, ReactionTime, Cheat, Slow, Wait, RandomValue, LCDUpdate, LCDAck);
	RandomGen RandomGen_0 (ClkMS, Rst, RandomValue);
	LCDDisplay LCDDisplay_0 (ClkLCD, Rst, Cheat, Slow, Wait, ReactionTime, LCDUpdate, LCDAck, LCD_Data, LCD_E, LCD_RS, LCD_RW);

endmodule

`timescale 1ns / 1ns
module LCDDisplay(Clk, Rst, Cheat, Slow, Wait, ReactionTime, LCDUpdate, LCDAck, LCD_Data, LCD_E, LCD_RS, LCD_RW);

   input Clk, Rst;

	// ReactionTimer-LCD Interface
	input Cheat, Slow, Wait;
   input [9:0] ReactionTime;
	input LCDUpdate;
   output reg LCDAck;

	// LCD Interface
   output [11:8] LCD_Data;
   output LCD_E, LCD_RS, LCD_RW;
   
   parameter InitString =     "Reaction Timer  ";
   parameter CheatString =    "No Cheating!    ";
   parameter SlowString =     "Too Slow!       ";
   parameter WaitString =     "Wait for LEDs...";
   parameter ReactionString = "0.000 s         ";

   parameter S_Init = 0, 
	          S_Wait = 1, 
				 S_Reaction = 2, 
				 S_LCDAck = 3,
	          S_Cheat = 4,
				 S_Slow = 5,
				 S_WaitString = 6;
	
   reg [8*16:1] Display;
	wire [15:0] BCD;
   reg [3:0] State;
	reg GO;
	
   LcdInterface LcdInterface_0 (Rst, Clk, GO, Display, LCD_Data, LCD_E, LCD_RS, LCD_RW);
	Bin2BCD Bin2BCD_0 (ReactionTime, BCD);
	
   always @(posedge Clk) begin
      if( Rst == 1 ) begin
         State <= S_Init;
			LCDAck <= 0;
			GO <= 0;
		   Display <= InitString;
      end
      else begin
			LCDAck <= 0;
         case( State )
            S_Init: begin
				   Display <= InitString;
					GO <= 1;
					State <= S_Wait;
            end

            S_Wait: begin
					GO <= 0;
					if (Cheat == 1 && LCDUpdate == 1) begin
                  State <= S_Cheat;
					end
					else if (Slow == 1 && LCDUpdate == 1) begin
                  State <= S_Slow;
					end
					else if (Wait == 1 && LCDUpdate == 1) begin
                  State <= S_WaitString;
					end
					else if (LCDUpdate == 1) begin
                  State <= S_Reaction;
					end
					else begin
					   State <= S_Wait;
					end
            end
				
            S_Cheat: begin
					GO <= 1;
				   Display <= CheatString;
               State <= S_LCDAck;
            end

            S_Slow: begin
					GO <= 1;
				   Display <= SlowString;
               State <= S_LCDAck;
            end

            S_WaitString: begin
					GO <= 1;
				   Display <= WaitString;
               State <= S_LCDAck;
            end

            S_Reaction: begin
					GO <= 1;
				   Display <= ReactionString;
               Display[112:105] <= 8'h30 + BCD[11:8];
               Display[104:97]  <= 8'h30 + BCD[7:4];
               Display[96:89]   <= 8'h30 + BCD[3:0];
               State <= S_LCDAck;
            end

            S_LCDAck: begin
				   LCDAck <= 1;
				   if (LCDUpdate == 1) begin
                  State <= S_LCDAck;
					end
					else begin
					   State <= S_Wait;
					end
            end

         endcase
      end
   end
endmodule











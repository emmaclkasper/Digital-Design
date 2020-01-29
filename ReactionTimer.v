`timescale 1ns / 1ns

module ReactionTimer(Clk, Rst, Start, LED, ReactionTime, Cheat, Slow, Wait, RandomValue, LCDUpdate, LCDAck);

   input Start, LCDAck, Clk, Rst;
	input [13:0] RandomValue; //9 bits
   output reg [8:0] ReactionTime; //9 bits 500 ms cut off zone
	output reg [7:0] LED;
   output reg Cheat, Slow, Wait;
	output reg LCDUpdate;
	
	parameter OFF = 0, ON1 = 1, W = 2, EXTRA = 3, EXTRA1 = 4, Led = 5, CHEAT = 6, W4 = 7, DISPLAY = 8, SLOW = 9, RT = 10;
	
	reg[3:0] State;
	reg[8:0] Count;
	reg[13:0] RValueKeep; //keeps your random value
	reg[13:0] WaitCounter; //see if you wait counter == RValueKeep value
	reg[8:0] ReactionKeep; //holds value to be transferred to reaction time
	
	always @(posedge Clk) begin
		RValueKeep <= RandomValue;
		if(Rst == 1)
		begin
			Cheat <= 0;
			Slow <= 0;
			Wait <= 0;
			LCDUpdate <= 0;
			WaitCounter = 0;
			ReactionKeep <= 0;
			Count = 0;
			LED <= 8'b00000000;
			State <= ON1;
		end
		else begin
			case (State)
			
				OFF: begin
					Count = 0;
					ReactionKeep <= 0;
					Wait <= 0;
					State <= ON1;
				end
				ON1: begin
					Count = 0;
					if (Start == 1)
					begin
						State <= W;
					end
					else
					begin
						State <= ON1;
						LED <= 8'b00000000;
					end
				end
				W: begin
					Wait <= 1;
					LCDUpdate <= 1;
					if (LCDAck == 1)
					begin
						LCDUpdate <= 0;
						if (Rst == 1)
							State <= ON1;
						else
						begin
							if(WaitCounter >= RValueKeep)
							begin
								Wait <= 0;
								LCDUpdate <= 1;
								if(LCDAck == 1)
								begin
									LCDUpdate <= 0;
									State <= Led;
								end	
							end
							else if (WaitCounter < RValueKeep)
							begin
								WaitCounter = WaitCounter + 1;
								State <= W;
							end
							else if (RValueKeep == 0)
							begin
								RValueKeep <= RandomValue;
								State <= W;
							end
							else if (Start == 1)
								State <= CHEAT;
						end
					end
				end

				Led: begin
					Wait <= 0;
					if(LCDAck == 1)
						begin
							LCDUpdate <= 0;
							State <= Led;
						end
					if (Rst == 1)
						State <= ON1;
					else if (Start == 1)
						State <= CHEAT;
					else
					begin
						LED <= 8'b11111111;
						State <= EXTRA;
					end
				end
				EXTRA: begin
					if(Start == 0)
						State <= W4;
					else
						State <= EXTRA;
				end
				
				W4: begin
					if (Start == 1 && Count <= 100)
						State <= CHEAT;
					else
					begin
						if (Start == 0)
						begin
							Count = Count + 1;
							State <= W4;
						end
						else if (Rst == 1)
							State <= ON1;
						else if(Start == 1)
							State <= EXTRA1;
						else
							State <= W4;
					end
				end
				
				EXTRA1: begin
					if(Start == 0)
						State <= DISPLAY;
					else
						State <= EXTRA1;
				end
				
				DISPLAY: begin
					if (Rst == 1)
						State <= ON1;
					else if (Count < 500) 
						State <= RT;
					else 			
						State <= SLOW;

				end
				RT: begin
						ReactionKeep <= Count;
						ReactionTime <= ReactionKeep;
						LCDUpdate <= 1;
						if (LCDAck == 1)
						begin
							State <= ON1;
							LCDUpdate <= 0;
						end
						else 
							State <= RT;
				end
				SLOW: begin
						Slow <= 1;
						LCDUpdate <= 1;
						if (LCDAck == 1)
						begin
							Slow <= 0;
							LCDUpdate <= 0;
							State <= ON1;
						end
						else 
							State <= SLOW;
				end
				CHEAT: begin
						Cheat <= 1;
						LCDUpdate <= 1;
						if (LCDAck == 1)
						begin
							Cheat <= 0;
							LCDUpdate <= 0;
							State <= ON1;
						end
						else 
							State <= CHEAT;
				end
			
			endcase
			
		end
		
	end
 
  endmodule

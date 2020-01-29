`timescale 1ns / 1ns

module RandomGen(Clk, Rst, RandomValue);

   input Clk, Rst;
   output reg [13:0] RandomValue; 
   
	reg[13:0] MaxNum;
	reg[13:0] Counter; 
	
	
   always @(posedge Clk) 
   begin
	
		if(Rst == 1)
		begin
			Counter = 1000;
			MaxNum = 3000;
		end
		else begin
			if ((Counter == MaxNum-1) || (Counter == MaxNum)) 
				begin
					Counter = 1000;
					RandomValue = 3000;
				end
			else 
				begin
					Counter = Counter + 100;
					RandomValue = Counter;
				end
		end
	end
 
   
endmodule

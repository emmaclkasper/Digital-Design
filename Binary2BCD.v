/*
 * Design: CSEE4270 - Skeleton Module for Binary to BCD Converter
 * Author: Courtney Trust and Emma Kasper
 * 
 *
 * 
 *
 */

`timescale 1ns / 1ns
module Binary2BCD(Cnt, Tens, Ones);

   input [3:0] Cnt;
   output reg [3:0] Tens, Ones;
	
	always @* begin
		if(Cnt == 4'b0000)
		begin
			Tens <= 4'b0000;
			Ones <= 4'b0000;
		end
		else if (Cnt == 4'b0001)
		begin
			Tens <= 4'b0000;
			Ones <= 4'b0001;
		end
		else if (Cnt == 4'b0010)
		begin
			Tens <= 4'b0000;
			Ones <= 4'b0010;
		end
		else if (Cnt == 4'b0011)
		begin
			Tens <= 4'b0000;
			Ones <= 4'b0011;
		end
		else if (Cnt == 4'b0100)
		begin
			Tens <= 4'b0000;
			Ones <= 4'b0100;
		end
		else if (Cnt == 4'b0101)
		begin
			Tens <= 4'b0000;
			Ones <= 4'b0101;
		end
		else if (Cnt == 4'b0110)
		begin
			Tens <= 4'b0000;
			Ones <= 4'b0110;
		end
		else if (Cnt == 4'b0111)
		begin
			Tens <= 4'b0000;
			Ones <= 4'b0111;
		end
		else if (Cnt == 4'b1000)
		begin
			Tens <= 4'b0000;
			Ones <= 4'b1000;
		end
		else if (Cnt == 4'b1001)
		begin
			Tens <= 4'b0000;
			Ones <= 4'b1001;
		end	
		else if (Cnt == 4'b1010)
		begin
			Tens <= 4'b0001;
			Ones <= 4'b0000;
		end
		else if (Cnt == 4'b1011)
		begin
			Tens <= 4'b0001;
			Ones <= 4'b0001;
		end
		else if (Cnt == 4'b1100)
		begin
			Tens <= 4'b0001;
			Ones <= 4'b0010;
		end
		else if (Cnt == 4'b1101)
		begin
			Tens <= 4'b0001;
			Ones <= 4'b0011;
		end
		else if (Cnt == 4'b1110)
		begin
			Tens <= 4'b0001;
			Ones <= 4'b0100;
		end
		else if (Cnt == 4'b1111)
		begin
			Tens <= 4'b0001;
			Ones <= 4'b0101;
		end
		else
		begin
			Tens <= 4'b0000;
			Ones <= 4'b0000;
		end	
			
	end

endmodule

/*
 * LCD Controller
 *
 */

`timescale 1ns/1ns
module LCDCntrl(Rst, Clk, Go, Display, DataValue, Command, Clear, Write, Busy, Ready);
   input Rst, Clk;
   input Go, Busy, Ready;
   input [8*16:1] Display;
	
   output reg [7:0] DataValue;
   output reg Command, Clear, Write;
   
	reg [4:0] CharsDisplayed;
	
   // states
   parameter S_Init0 = 0,
             S_Init1 = 1,
             S_PosInit = 2,
             S_PosWait = 3,
             S_PosAck = 4,
             S_PosDone = 5,
             S_StrInit = 6,
             S_StrWait = 7,
             S_StrAck = 8,
             S_StrIter = 9,
             S_Wait = 14;

   // constants
   parameter C8_0 = 0;
	
   reg [3:0] State;
	reg [8*16:1] DisplayInt;
	
   always @ (posedge Clk) begin
      if( Rst == 1 ) begin
         DataValue <= 0;
         Clear <= 0;
         Command <= 0;
         Write <= 0;
         DisplayInt <= 0;
         CharsDisplayed <= 0;
         State <= S_Init0;
      end
      else begin
         // assign default output values
         DataValue <= 0;
         Clear <= 0;
         Command <= 0;
         Write <= 0;

         case( State )
            S_Init0: begin
               DisplayInt <= 0;
               CharsDisplayed <= 0;
               if( Busy == 0 ) State <= S_Init0;
               else State <= S_Init1;
            end

            S_Init1: begin
               if( Busy == 1 ) State <= S_Init1;
               else State <= S_PosInit;
            end

            S_PosInit: begin
               // Set DDRAM Address (1000 0000)
               DataValue <= 8'b10000000;
               Command <= 1;
               Write <= 1;
               DisplayInt <= Display;
               State <= S_PosWait;
            end

            S_PosWait: begin
               DataValue <= 8'b10000000;
               Command <= 1;
               Write <= 1;
               if( Busy == 0 ) State <= S_PosWait;
               else State <= S_PosAck;
            end

            S_PosAck: begin
               DataValue <= 8'b10000000;
               Command <= 1;
               Write <= 1;
               if( Busy == 1 ) State <= S_PosAck;
               else State <= S_PosDone;
            end

            S_PosDone: begin
               Write <= 0;
               if( Ready == 0 ) begin
  					   CharsDisplayed <= 0;
                  State <= S_PosDone;
					end	
               else begin
                  State <= S_StrInit;
					end
            end

				// Write String to LCD
            S_StrInit: begin
		         DataValue <= DisplayInt[8*16:8*15+1];
               Command <= 0;
               Write <= 1;
               State <= S_StrWait;
            end
				
            S_StrWait: begin
               DataValue <= DisplayInt[8*16:8*15+1];
               Command <= 0;
               Write <= 1;
               if( Busy == 0 ) State <= S_StrWait;
               else State <= S_StrAck;
            end

            S_StrAck: begin
               DataValue <= DisplayInt[8*16:8*15+1];
               Command <= 0;
               Write <= 1;
               if( Busy == 1 ) State <= S_StrAck;
               else State <= S_StrIter;
            end

            S_StrIter: begin
               Write <= 0;
               if( Ready == 0 ) State <= S_StrIter;
               else begin
					   if( CharsDisplayed == 15 ) begin
						   State <= S_Wait;
						end
						else begin
						   CharsDisplayed <= CharsDisplayed + 1;
							DisplayInt <= DisplayInt << 8;
							State <= S_StrInit;
						end
					end
            end

            S_Wait: begin
				   if( Go == 1 ) State <= S_PosInit;
					else State <= S_Wait;
				end
        endcase
      end
   end
endmodule

/*
 * LCD Driver - Sends commands to LCD using 4-bit interface
 *
 */

`timescale 1ns/1ns
module LCDDriver(Rst, Clk, DataValue, Command, Clear, Write, Busy, Ready, LCD_Data, LCD_E, LCD_RS, LCD_RW);

   // user interface
   input Rst, Clk;
   input [7:0] DataValue;
   input Command, Clear, Write;
   output Busy, Ready;
   reg Busy, Ready;

   // LCD interface
   output reg [11:8] LCD_Data;
   output reg LCD_E, LCD_RS, LCD_RW;

   // states
   parameter INIT_S0    = 0;
   parameter INIT_S1    = 1;
   parameter INIT_S1e   = 41;
   parameter INIT_S2    = 2;
   parameter INIT_S3    = 3;
   parameter INIT_S4    = 4;
   parameter INIT_S5    = 5;
   parameter INIT_S6    = 6;
   parameter INIT_S7    = 7;
   parameter INIT_S7e   = 42;
   parameter INIT_S8    = 8;
   parameter INIT_S9    = 9;
   parameter INIT_S10   = 10;
   parameter INIT_S11   = 11;
   parameter INIT_S12   = 12;
   parameter INIT_S13   = 13;
   parameter INIT_S14   = 14;
   parameter INIT_S15   = 15;
   parameter INIT_S16   = 16;
   parameter INIT_S17   = 17;
   parameter INIT_S18   = 18;
   parameter INIT_S19   = 19;
   parameter INIT_S20   = 20;
   parameter INIT_S21   = 21;
   parameter INIT_S22   = 22;
   parameter INIT_S23   = 23;
   parameter INIT_S24   = 24;

   parameter WAIT       = 25;

   parameter Clear_S0   = 26;
   parameter Clear_S1   = 27;
   parameter Clear_S2   = 28;
   parameter Clear_S3   = 29;
   parameter Clear_S4   = 30;
	
   parameter WR_CMD_S0  = 31;
   parameter WR_CMD_S1  = 32;
   parameter WR_CMD_S2  = 33;
   parameter WR_CMD_S3  = 34;
   parameter WR_CMD_S4  = 35;

   parameter WR_DATA_S0 = 36;
   parameter WR_DATA_S1 = 37;
   parameter WR_DATA_S2 = 38;
   parameter WR_DATA_S3 = 39;
   parameter WR_DATA_S4 = 40;

   // constants
   parameter C9_0   = 9'b000000000;
   parameter C9_2   = 9'b000000010;
   parameter C9_3   = 9'b000000011;
   parameter C9_42  = 9'b000101010;
   parameter C9_103 = 9'b001100111;
   parameter C9_200 = 9'b011001000;
   parameter C9_375 = 9'b101110111;

   // variables
   reg [5:0] State;
   reg [8:0] Counter;

   always @ (posedge Clk) begin
      if( Rst == 1 ) begin
         Counter <= 0;
         State <= INIT_S0;

         Busy <= 0;
         Ready <= 0;
         LCD_E <= 0;
         LCD_RS <= 0;
         LCD_RW <= 0;
         LCD_Data <= 4'b0000;

      end
      else begin
         // assign default output values
         Busy <= 0;
         LCD_E <= 0;
         LCD_RS <= 0;
         LCD_RW <= 0;
         LCD_Data <= 4'b0000;
         Ready <= 0;
			
         case( State )
            INIT_S0: begin
               Busy <= 1;
               State <= INIT_S1;
            end

            INIT_S1: begin
               Counter <= C9_0;
               Busy <= 1;
               LCD_Data <= 4'b0011;
               State <= INIT_S1e;
            end

            INIT_S1e: begin
               Counter <= C9_0;
               Busy <= 1;
               LCD_Data <= 4'b0011;
               LCD_E <= 1;
               State <= INIT_S2;
            end

            INIT_S2: begin
               Busy <= 1;
               LCD_Data <= 4'b0011;
               LCD_E <= 0;
	            State <= INIT_S3;
            end

            INIT_S3: begin
               Counter <= C9_0;
               Busy <= 1;
               LCD_Data <= 4'b0011;
               LCD_E <= 1;
               State <= INIT_S4;
            end

            INIT_S4: begin
               Busy <= 1;
               LCD_E <= 0;
               LCD_Data <= 4'b0011;
               State <= INIT_S5;
            end

            INIT_S5: begin
               Busy <= 1;
               Counter <= C9_0;
               LCD_Data <= 4'b0011;
               LCD_E <= 1;
               State <= INIT_S6;
            end

            INIT_S6: begin
               Busy <= 1;
               LCD_Data <= 4'b0011;
               LCD_E <= 0;
               State <= INIT_S7;
            end

            INIT_S7: begin
               Counter <= C9_0;
               Busy <= 1;
               LCD_Data <= 4'b0010;
               State <= INIT_S7e;
            end

            INIT_S7e: begin
               Counter <= C9_0;
               Busy <= 1;
               LCD_Data <= 4'b0010;
               LCD_E <= 1;
               State <= INIT_S8;
            end

            INIT_S8: begin
               Busy <= 1;
               LCD_Data <= 4'b0010;
               LCD_E <= 0;
               State <= INIT_S9;
            end

            // INIT_S9 to INIT_S12 Issues Function Set Command
            INIT_S9: begin
               Counter <= C9_0;
               Busy <= 1;
               LCD_Data <= 4'b0010;
               LCD_E <= 1;
               State <= INIT_S10;
            end

            INIT_S10: begin
               Busy <= 1;
               LCD_E <= 0;
               State <= INIT_S11;
            end

            INIT_S11: begin
               Busy <= 1;
               LCD_Data <= 4'b1000;
               LCD_E <= 1;
               State <= INIT_S12;
            end

            INIT_S12: begin
               Busy <= 1;
               LCD_E <= 0;
               State <= INIT_S13;
            end

            // INIT_S13 to INIT_S16 Issues Entry Mode Set Command
            INIT_S13: begin
               Busy <= 1;
               LCD_Data <= 4'b0000;
               LCD_E <= 1;
               State <= INIT_S14;
            end

            INIT_S14: begin
               Busy <= 1;
               LCD_E <= 0;
               State <= INIT_S15;
            end

            INIT_S15: begin
               Busy <= 1;
               LCD_Data <= 4'b0110;
               LCD_E <= 1;
               State <= INIT_S16;
            end

            INIT_S16: begin
               Busy <= 1;
               LCD_E <= 0;
               State <= INIT_S17;
            end

            // INIT_S17 to INIT_S20 Issues Display On/Off Command
            INIT_S17: begin
               Busy <= 1;
               LCD_Data <= 4'b0000;
               LCD_E <= 1;
               State <= INIT_S18;
            end

            INIT_S18: begin
               Busy <= 1;
               LCD_E <= 0;
               State <= INIT_S19;
            end

            INIT_S19: begin
               Busy <= 1;
               LCD_Data <= 4'b1100;
               LCD_E <= 1;
               State <= INIT_S20;
            end

            INIT_S20: begin
               Busy <= 1;
               LCD_E <= 0;
               State <= INIT_S21;
            end

            // INIT_S21 to INIT_S24 Issues Clear Display Command
            INIT_S21: begin
               Busy <= 1;
               LCD_Data <= 4'b0000;
               LCD_E <= 1;
               State <= INIT_S22;
            end

            INIT_S22: begin
               Busy <= 1;
               LCD_E <= 0;
               State <= INIT_S23;
            end

            INIT_S23: begin
               Counter <= C9_0;
               Busy <= 1;
               LCD_Data <= 4'b0001;
               LCD_E <= 1;
               State <= INIT_S24;
            end

            INIT_S24: begin
               Busy <= 1;
               LCD_E <= 0;
               if( Counter == C9_42 ) begin
                  State <= WAIT;
               end
               else begin
                  Counter <= Counter + 1;
                  State <= INIT_S24;
               end
            end

            WAIT: begin
               Busy <= 0;
               Ready <= 1;
               if( Clear == 1 ) begin
                  State <= Clear_S0;
               end
               else if( Command == 1 && Write == 1) begin
                  State <= WR_CMD_S0;
               end
               else if( Command == 0 && Write == 1) begin
                  State <= WR_DATA_S0;
               end
               else begin
                  State <= WAIT;
               end
            end

            // Clear_S0 to S3 Issues Clear Display Command
            Clear_S0: begin
               Busy <= 1;
               LCD_Data <= 4'b0000;
               LCD_E <= 1;
               State <= Clear_S1;
            end

            Clear_S1: begin
               Busy <= 1;
               LCD_E <= 0;
               State <= Clear_S2;
            end

            Clear_S2: begin
               Counter <= C9_0;
               Busy <= 1;
               LCD_Data <= 4'b0001;
               LCD_E <= 1;
               State <= Clear_S3;
            end

            Clear_S3: begin
               Busy <= 1;
               LCD_E <= 0;
               if( Counter == C9_42 ) begin
                  State <= Clear_S4;
               end
               else begin
                  Counter <= Counter + 1;
                  State <= Clear_S3;
               end
            end

            Clear_S4: begin
               Busy <= 0;
               if( Clear == 1 ) begin
                  State <= Clear_S4;
               end
               else begin
                  State <= WAIT;
               end
            end
				
            // WR_CMD_S0 to WR_CMD_S3 Issues Command in DataValue
            WR_CMD_S0: begin
               Busy <= 1;
               LCD_Data <= DataValue[7:4];
               LCD_RS <= 0;
               LCD_RW <= 0;
               LCD_E <= 1;
               State <= WR_CMD_S1;
            end

            WR_CMD_S1: begin
               Busy <= 1;
               LCD_E <= 0;
               State <= WR_CMD_S2;
            end

            WR_CMD_S2: begin
               Busy <= 1;
               LCD_Data <= DataValue[3:0];
               LCD_RS <= 0;
               LCD_RW <= 0;
               LCD_E <= 1;
               State <= WR_CMD_S3;
            end

            WR_CMD_S3: begin
               Busy <= 1;
               LCD_E <= 0;
               State <= WR_CMD_S4;
            end

            WR_CMD_S4: begin
               Busy <= 0;
               if( Write == 1 ) begin
                  State <= WR_CMD_S4;
               end
               else begin
                  State <= WAIT;
               end					
            end

            // WR_DATA_S0 to WR_DATA_S3 Issues Write Data for DataValue
            WR_DATA_S0: begin
               Busy <= 1;
               LCD_Data <= DataValue[7:4];
               LCD_RS <= 1;
               LCD_RW <= 0;
               LCD_E <= 1;
               State <= WR_DATA_S1;
            end

            WR_DATA_S1: begin
               Busy <= 1;
               LCD_RS <= 1;
               LCD_E <= 0;
               State <= WR_DATA_S2;
            end

            WR_DATA_S2: begin
               Busy <= 1;
               LCD_Data <= DataValue[3:0];
               LCD_RS <= 1;
               LCD_RW <= 0;
               LCD_E <= 1;
               State <= WR_DATA_S3;
            end

            WR_DATA_S3: begin
               Busy <= 1;
               LCD_RS <= 1;
               LCD_E <= 0;
               State <= WR_DATA_S4;
            end

            WR_DATA_S4: begin
               Busy <= 0;
               if( Write == 1 ) begin
                  State <= WR_DATA_S4;
               end
               else begin
                  State <= WAIT;
               end					
            end
         endcase
      end
   end
endmodule


/*
 * Top Level LCD Disaply Interface
 *
 */

`timescale 1ns / 1ns
module LcdInterface(Rst, Clk, Go, Display, LCD_Data, LCD_E, LCD_RS, LCD_RW);

   input Clk, Rst;
	input Go;
   input [8*16:1] Display;
   output [11:8] LCD_Data;
   output LCD_E, LCD_RS, LCD_RW;
   
   wire LCD_Clk;
   wire [7:0] DataValue;
   wire Command, Clear, Write, Busy, Ready;

   LCDCntrl LCDCntrl_0 (Rst, Clk, Go, Display, DataValue, Command, Clear, Write, Busy, Ready);
   LCDDriver LCDDriver_0 (Rst, Clk, DataValue, Command, Clear, Write, Busy, Ready, LCD_Data, LCD_E, LCD_RS, LCD_RW);

endmodule











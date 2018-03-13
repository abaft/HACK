`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:21:20 03/13/2018 
// Design Name: 
// Module Name:    BCD 
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
//Sourced from http://www.eng.utah.edu/~nmcdonal/Tutorials/BCDTutorial/BCDConversion.html
//////////////////////////////////////////////////////////////////////////////////
module BCD(
    input [15:0] binary,
	 output reg [3:0] TenThousands,
    output reg [3:0] Thousands,
    output reg [3:0] Hundreds,
    output reg [3:0] Tens,
    output reg [3:0] Ones
    );
	 
	 integer i;
	 reg [15:0] parcedBinary;
	 always @(binary)
	 begin
	 // Handels 2s compliment
	     if (binary[15] == 1)
		  begin
		      parcedBinary = ~binary;
				parcedBinary = parcedBinary + 1;
		  end else
		  begin
		      parcedBinary = binary;
	     end
	     TenThousands = 4'b0;
	     Thousands = 4'b0;
	     Hundreds = 4'b0;
	     Tens = 4'b0;
	     Ones = 4'b0;
		  for (i=15; i>=0; i=i-1)
		  begin
		      if(TenThousands >= 5)
				  TenThousands = TenThousands + 3;
		      if(Thousands >= 5)
				  Thousands = Thousands + 3;
		      if(Hundreds >= 5)
				  Hundreds = Hundreds + 3;				  
		      if(Tens >= 5)
				  Tens = Tens + 3;
				if(Ones >= 5)
				  Ones = Ones + 3;
				  
				TenThousands = TenThousands << 1;  
				TenThousands[0] = Thousands[3];
				Thousands = Thousands << 1;  
				Thousands[0] = Hundreds[3];  
				Hundreds = Hundreds << 1;  
				Hundreds[0] = Tens[3];
				Tens = Tens << 1;  
				Tens[0] = Ones[3];  
				Ones = Ones << 1;
				Ones[0] = parcedBinary[i];
		  end
	 end


endmodule

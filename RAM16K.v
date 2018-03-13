`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:54:18 03/08/2018 
// Design Name: 
// Module Name:    RAM16K
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
module RAM16K(
    input [0:15] data,
    input load,
    input [0:12] address,
    input clk,
    output [0:15] out
    );
	 
    reg [0:15] Data [0:8191];
    reg [0:15] Out;
	 initial begin
	 /*   Add 50 conditional jump
	 	Data[0]  <= 16'b1110101000010000;
	 	Data[1]  <= 16'b0000000000110010;
	   Data[2]  <= 16'b1110000000000111;
	   Data[50] <= 16'b1100000010010011;
	   Data[51] <= 16'b0000000000000000;
	   Data[52] <= 16'b1110000000000111;
		
		*/
Data[0]  <= 16'b0000000000000001;
Data[1]  <= 16'b1110101010001000;
Data[2]  <= 16'b0000000000000000;
Data[3]  <= 16'b1110111111011000;
Data[4]  <= 16'b0000000000000001;
Data[5]  <= 16'b1111000010010000;
Data[6]  <= 16'b0000000000000000;
Data[7]  <= 16'b1110001010000100;
Data[8]  <= 16'b1100001010000000;
Data[9]  <= 16'b0000000000000010;
Data[10] <= 16'b1110001010001000;
Data[11] <= 16'b0000000000000000;
Data[12] <= 16'b1111100010010000;
Data[13] <= 16'b0000000000000001;
Data[14] <= 16'b1110001010001000;
Data[15] <= 16'b0000000000000010;
Data[16] <= 16'b1111100010010000;
Data[17] <= 16'b0000000000000000;
Data[18] <= 16'b1110001010001000;
Data[19] <= 16'b0000000000000100;
Data[20] <= 16'b1110000000000111;

	 end

    always @(posedge clk)
     begin
      if (load)
        begin
          Data[address] <= data;
        end
          Out <= Data[address];
     end

    assign out = Out;
endmodule

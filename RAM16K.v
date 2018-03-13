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
	 	Data[0] <= 16'b0000000000000011;
	   Data[1] <= 16'b1110000000000000;
	   Data[2] <= 16'b1110101000010000;
	   Data[3] <= 16'b1110000010010000;
	   Data[4] <= 16'b1110101000000111;
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

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:54:18 03/08/2018 
// Design Name: 
// Module Name:    RAM64
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
module RAM64(
    input [0:15] data,
    input load,
    input [0:5] address,
    input clk,
    output [0:15] out
    );
	 
    reg [0:15] Data [0:63];
    reg [0:15] Out;

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

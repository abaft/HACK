`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:49:17 03/08/2018 
// Design Name: 
// Module Name:    Register 
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
module Register(
    input [0:15] data,
    input load,
    input clk,
    output [0:15] out
    );
	 
	 generate
	   genvar i;
		for (i=0; i<16; i=i+1)
		  begin
		    Bit(data[i], load, clk, out[i]);
		  end
    endgenerate


endmodule

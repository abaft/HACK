`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:05:51 03/08/2018 
// Design Name: 
// Module Name:    PC 
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
module PC(
    input [0:15] in,
    input load,
    input rst,
    input inc,
    input clk,
    output [0:15] out
    );
	 
	 wire [0:15] c0;
	 wire [0:15] c1;
	 wire [0:15] c2;
	 wire [0:15] regIn;
	 
	 Inc16(out, c2);
	 
	 Mux16(c0 ,in, load, c1);
	 Mux16(c1, 16'b0, rst, regIn);
	 Mux16(out, c2, inc, c0);
	 
	 Register(.data(regIn), .clk(clk), .load(1), .out(out));
	 
endmodule

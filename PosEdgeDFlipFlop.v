`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:29:35 03/08/2018 
// Design Name: 
// Module Name:    PosEdgeDFlipFlop 
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
module PosEdgeDFlipFlop(
    input data,
    input clk,
    output q,
    output nq
    );
	 
	 wire c0,c1,c2;
	 
	 DFlipFlop(data, ~clk, c0, );
	 DFlipFlop(c0, clk, q, qn);

endmodule

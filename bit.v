`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:07:33 03/08/2018 
// Design Name: 
// Module Name:    bit 
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
module Bit(
    input in,
    input load,
    input clk,
    output out
    );
	 
	 wire Out, c0;
	 
	 mux(Out, in, load, c0);
	 PosEdgeDFlipFlop(.data(c0), .clk(clk), .nq(), .q(out));
	 assign Out = out;


endmodule

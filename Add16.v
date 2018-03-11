`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:41:23 02/25/2018 
// Design Name: 
// Module Name:    Add16 
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
module Add16(
    input [15:0] x,
    input [15:0] y,
    output [15:0] Sum,
    output Carry
    );
	 wire C[15:0];
	 
	 FullAdder (x[0], y[0], 0, C[0], Sum[0]);
	 FullAdder (x[1], y[1], C[0], C[1], Sum[1]);
	 FullAdder (x[2], y[2], C[1], C[2], Sum[2]);
	 FullAdder (x[3], y[3], C[2], C[3], Sum[3]);
	 FullAdder (x[4], y[4], C[3], C[4], Sum[4]);
	 FullAdder (x[5], y[5], C[4], C[5], Sum[5]);
	 FullAdder (x[6], y[6], C[5], C[6], Sum[6]);
	 FullAdder (x[7], y[7], C[6], C[7], Sum[7]);
	 FullAdder (x[8], y[8], C[7], C[8], Sum[8]);
	 FullAdder (x[9], y[9], C[8], C[9], Sum[9]);
	 FullAdder (x[10], y[10], C[9], C[10], Sum[10]);
	 FullAdder (x[11], y[11], C[10], C[11], Sum[11]);
	 FullAdder (x[12], y[12], C[11], C[12], Sum[12]);
	 FullAdder (x[13], y[13], C[12], C[13], Sum[13]);
	 FullAdder (x[14], y[14], C[13], C[14], Sum[14]);
	 FullAdder (x[15], y[15], C[14], C[15], Sum[15]);
	 
	 assign Carry = C[15];
endmodule

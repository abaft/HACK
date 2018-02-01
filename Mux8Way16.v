`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:07:05 02/01/2018 
// Design Name: 
// Module Name:    Mux8Way16 
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
module Mux8Way16(
    input [15:0] s,
    input [15:0] t,
    input [15:0] u,
    input [15:0] v,
    input [15:0] w,
    input [15:0] x,
    input [15:0] y,
    input [15:0] z,
    input [2:0] sel,
    output [15:0] out
    );
	 
	 wire [15:0] c0;
	 wire [15:0] c1;
	 
	 Mux4Way16 MX0 (s, t, u, v, sel[1:0], c1);
	 Mux4Way16 MX1 (w, x, y, z, sel[1:0], c2);
	 
	 Mux16 MX2 (c0, c1, sel[2], out);

endmodule

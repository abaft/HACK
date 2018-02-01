`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:38:52 02/01/2018 
// Design Name: 
// Module Name:    Mux4Way16 
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
module Mux4Way16(
    input [15:0] w,
	 input [15:0] x,
    input [15:0] y,
    input [15:0] z,
    input [1:0] sel,
    output [15:0] out
    );
	 
	 wire [15:0] c0;
	 wire [15:0] c1;
	 
	 Mux16 MX0 (w, x, sel[0], c0);
	 Mux16 MX1 (y, z, sel[0], c1);
	 Mux16 MX1 (c0, c1, sel[1], out);


endmodule

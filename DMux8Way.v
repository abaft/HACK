`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:02:17 02/01/2018 
// Design Name: 
// Module Name:    DMux8Way 
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
module DMux8Way(
    input in,
    input [2:0] sel,
    output s,
    output t,
    output u,
    output v,
    output w,
    output x,
    output y,
    output z
    );
	 
	 wire c0, c1;
	 
	 DMux MX0 (in, sel[2], c0, c1);

	 DMux4Way DMX0 (c0, sel[1:0], s, t, u, v);
	 DMux4Way DMX1 (c1, sel[1:0], w, x, y, z);
	 
	  


endmodule

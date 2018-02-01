`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:19:30 02/01/2018 
// Design Name: 
// Module Name:    DMux4Way 
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
module DMux4Way(
    input in,
    input [1:0] sel,
    output w,
    output x,
    output y,
    output z
    );
	 
	 wire c0, c1;
	 
	 DMux DM0 (in, sel[0], c0, c1);
	 
	 DMux DM1 (c0, sel[1], w, y);
	 DMux DM2 (c1, sel[1], x, z);

	 


endmodule

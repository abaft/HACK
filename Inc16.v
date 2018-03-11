`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:01:04 03/08/2018 
// Design Name: 
// Module Name:    Inc16 
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
module Inc16(
    input [0:15] x,
    output [0:15] out
    );
	 
	 Add16(x, {16{1}}, out);


endmodule

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:02:57 01/31/2018 
// Design Name: 
// Module Name:    Dmux 
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
module Dmux(
    input in,
    input sel,
    output x,
    output y
    );
	 
	 wire c0, c1, c2, c3;
	 
	 notGate NT0 (sel, c0);
	 
	 andGate AN0 (in, sel, c1);
	 andGate AN1 (in, c0, c2);
	 
	 assign {x, y} = {c2, c1};
	 

endmodule

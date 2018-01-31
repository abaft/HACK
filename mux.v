`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:43:03 01/31/2018 
// Design Name: 
// Module Name:    mux 
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
module mux(
    input a,
    input b,
    input s,
    output out
    );
	 
	 wire c0, c1, c2;
	 
	 notGate NT0 (s, c0);
	 
	 andGate AN0 (a, c0, c1);
	 andGate AN1 (b, s, c2);
	 
	 orGate OR1 (c1, c2, out);
	 

endmodule

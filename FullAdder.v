`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:37:46 02/25/2018 
// Design Name: 
// Module Name:    FullAdder 
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
module FullAdder(
    input x,
    input y,
    input Cin,
    output Cout,
    output Sum
    );
	 wire c0, c1, c2;
	 
	 xorGate (x, y, c0);
	 xorGate (c0, Cin, Sum);
    andGate (x, y, c1);
	 andGate (Cin, c0, c2);
	 orGate  (c1, c2, Cout);


endmodule

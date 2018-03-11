`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:02:36 03/08/2018 
// Design Name: 
// Module Name:    DFlipFlop 
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
module DFlipFlop(
    input data,
    input clk,
    output q,
    output nq
    );
	 
	 wire c0,c1,c2,c3,Q,nQ;
	 notGate(data, c0);
	 nandGate(data , clk, c1);
	 nandGate(c0, clk, c2);
	 nandGate(c1, nQ, q);
	 nandGate(c2, Q, nq);
	 assign Q = q;
	 assign nQ = nq;
	 assign nQ = nq;


endmodule

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:06:12 03/08/2018 
// Design Name: 
// Module Name:    ALU 
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
module ALU(
    input [0:15] x,
    input [0:15] y,
    input [0:5] control,  // [5] zx, [4] nx, [3] zy, [2] ny, [1] f, [0]no
    output [0:15] out,  
    output zr,
    output ng
    );
	 
	 wire [0:15] Xz;
	 wire [0:15] Yz;
	 andGate AN1 (x, ~{16{control[5]}}, Xz);
	 andGate(y, ~{16{control[3]}}, Yz);
	 
	 wire [0:15] Xneg;
	 wire [0:15] Yneg;
	 
	 notGate(Xz, Xneg);
	 notGate(Yz, Yneg);
	 
	 wire [0:15] Xout;
	 wire [0:15] Yout;
	 
	 Mux16(Xz, Xneg, control[4], Xout);
	 Mux16(Yz, Yneg, control[2], Yout);
	 
	 wire [0:15] XplusY;
	 
	 Add16(Xout, Yout, XplusY);
	 
	 wire [0:15] XandY;
	 
	 And16(Xout, Yout, XandY);
	 
	 wire [0:15] almostOut;
	 
	 Mux16(XandY, XplusY, control[1], almostOut);
	 
	 wire [0:15] negOut;
	 
	 notGate(almostOut, negOut);	 
	 
	 Mux16(almostOut, negOut, control[0], out);
	 

endmodule

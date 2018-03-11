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
    input [15:0] x,
    input [15:0] y,
    input [5:0] control,  // [5] zx, [4] nx, [3] zy, [2] ny, [1] f, [0]no
    output [15:0] out,  
    output zr,
    output ng
    );
	 
	 wire [15:0] Xz;
	 wire [15:0] Yz;
	 And16(x, ~{16{control[5]}}, Xz);
	 And16(y, ~{16{control[3]}}, Yz);
	 
	 wire [0:15] Xneg;
	 wire [0:15] Yneg;
	 
	 Not16(Xz, Xneg);
	 Not16(Yz, Yneg);
	 
	 wire [15:0] Xout;
	 wire [15:0] Yout;
	 
	 Mux16(Xz, Xneg, control[4], Xout);
	 Mux16(Yz, Yneg, control[2], Yout);
	 
	 wire [15:0] XplusY;
	 
	 Add16(Xout, Yout, XplusY);
	 
	 wire [15:0] XandY;
	 
	 And16(Xout, Yout, XandY);
	 
	 wire [15:0] almostOut;
	 
	 Mux16(XandY, XplusY, control[1], almostOut);
	 
	 wire [15:0] negOut;
	 
	 Not16(almostOut, negOut);	 
	 
	 Mux16(almostOut, negOut, control[0], out);
	 
	 assign ng = out[15];
	 Or16Way(out, notzr);
	 notGate(notzr, zr);
	 

endmodule

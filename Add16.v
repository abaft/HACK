`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:41:23 02/25/2018 
// Design Name: 
// Module Name:    Add16 
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
module Add16(
    input [15:0] x,
    input [15:0] y,
    output [15:0] Sum,
    output Carry
    );
	 wire C[15:0];
	 
	 FullAdder (x[0], y[0], 0, C[0], Sum[0]);
	 generate
      genvar i;
      for (i=1; i < 16; i=i+1)
	    begin
        FullAdder (x[i], y[i], C[i-1], C[i], Sum[i]);
       end
	 endgenerate
	 
	 assign Carry = C[15];
endmodule

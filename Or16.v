`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:47:57 01/31/2018 
// Design Name: 
// Module Name:    Or16 
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
module Or16(
    input [15:0] x,
    input [15:0] y,
    output [15:0] out
    );

    //Time efficency in Verilog, identical to cut and paste in binary
    generate
      genvar i;
      for (i=0; i < 16; i=i+1)
	    begin
        orGate OR (x[i], y[i], out[i]);
       end
	 endgenerate
	 
endmodule

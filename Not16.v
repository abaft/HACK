//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:53:40 01/31/2018 
// Design Name: 
// Module Name:    Not16 
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
module Not16(
    input [15:0] x,
    output [15:0] out
    );

    //Time efficency in Verilog, identical to cut and paste in binary
    generate
      genvar i;
      for (i=0; i < 16; i=i+1)
	    begin
        notGate OR (x[i], out[i]);
       end
	 endgenerate
	 
endmodule

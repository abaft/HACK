//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:01:54 01/31/2018 
// Design Name: 
// Module Name:    Or16Way 
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
 module Or16Way(
    input [15:0] x,
    output out
    );
	 
	 wire [3:0]c;
	 wire c0, c1;
	 
	 // Inneficient VeriLog I know... but oh well
    Or8Way(x[15:8], c0);
	 Or8Way(x[7:0], c1);
	
	 orGate OG6 (c0, c1, out);

endmodule

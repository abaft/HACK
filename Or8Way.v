//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:01:54 01/31/2018 
// Design Name: 
// Module Name:    Or8Way 
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
module Or8Way(
    input [7:0] x,
    output out
    );
	 
	 wire [3:0]c;
	 wire c0, c1;
	 
	 // Inneficient VeriLog I know... but oh well
    orGate OG0 (x[0], x[1], c[0]);
    orGate OG1 (x[2], x[3], c[1]);
    orGate OG2 (x[4], x[5], c[2]);
    orGate OG3 (x[6], x[7], c[3]);
	 
	 orGate OG4 (c[0], c[1], c0);
	 orGate OG5 (c[2], c[3], c1);
	
	 orGate OG6 (c0, c1, out);

endmodule

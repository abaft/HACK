//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:17:17 01/31/2018 
// Design Name: 
// Module Name:    nandGate 
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
module nandGate(
    input x,
    input y,
    output out
    );
	 
	 assign out = ~(x & y);

endmodule

//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:39:36 01/31/2018 
// Design Name: 
// Module Name:    andGate 
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
module andGate(
    input a,
    input b,
    output out
    );
	 wire c0;
	 
	 nandGate NA0 (a, b, c0);
	 notGate NT0 (c0, out);
	 
endmodule

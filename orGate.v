//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:57:05 01/31/2018 
// Design Name: 
// Module Name:    orGate 
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
module orGate(
    input a,
    input b,
    output out
    );
	 
	 wire c0, c1;
	 
	 notGate NT0 (a, c0);
	 notGate NT1 (b, c1);
	 
	 nandGate NA0 (c0, c1, out);

endmodule

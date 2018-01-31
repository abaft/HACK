//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:57:05 01/31/2018 
// Design Name: 
// Module Name:    xorGate 
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
module xorGate(
    input a,
    input b,
    output out
    );
	 
	 wire c0, c1, c2, c3;
    
	 notGate NT0 (b, c0);
	 notGate NT1 (a, c1);
	 
    andGate GA0 (a, c0, c2);
	 andGate GA1 (c1, b, c3);
	 orGate GA2 (c2, c3, out);

endmodule

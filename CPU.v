`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:33:29 03/09/2018 
// Design Name: 
// Module Name:    CPU 
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
/*

Address Instruction:
0          0000000000000 LSB (There doesn't have to be a RAM mapping fo all memory)
Indicator  Addresss
^^
Will load A register with a value from RAM

Instruction Instruction
1         11            0     000000 0  0  0      0     0  0 LSB
Indicator Expandability readM ALU    dA dD writeM JmpLT EQ GT
Will exicute an operation using the ALU and writing to RAM
*/

module CPU(
    input [15:0] instruction,
    input [15:0] inM,
    input rst,
    output [15:0] outM,
    output writeM,
    output [14:0] addressM, // 
    output [14:0] pc,
	 output [15:0] DOut,
    input clk
	 //output CtoAReg
    );
	 
	 wire CtoMuxAReg, CtoAReg, CtoDReg, CtoALU;
	 wire [15:0] MuxAReg;
	 wire [15:0] AM;
	 wire [15:0] D;
	 wire [15:0] A;
	 wire CtoPC, CtoMuxALU, Cinst;
	 wire jmpGT, jmpLT, jmpEQ, zr, ng;
	 
	 wire CtoAReg0, CtoAReg1;
	 orGate(CtoAReg0, CtoAReg1, CtoAReg);
	 // Decode
	 notGate(instruction[15], CtoMuxAReg);
	 notGate(instruction[15], CtoAReg0);
	 wire c0;
	 andGate(instruction[15], instruction[14], c0);
	 andGate(c0, instruction[13], Cinst);
	 
	 // Selects between memory or A register
	 andGate(Cinst, instruction[12], CtoMuxALU);
	 // Loads A with ALU out
	 andGate(Cinst, instruction[5], CtoAReg1);
	 // Loads D with ALU out
	 andGate(Cinst, instruction[4], CtoDReg);
	 // Loads Memory with ALU out
	 andGate(Cinst, instruction[3], writeM);
	 // Jumps the program counter to A if codition met
	 andGate(Cinst, instruction[2], jmpLT);
	 andGate(Cinst, instruction[1], jmpEQ);
	 andGate(Cinst, instruction[0], jmpGT);
	 
	 // JumpEQ: When ALU outputs zero
	 wire CtoPC0, CtoPC1, CtoPC2;
	 andGate(jmpEQ, zr, CtoPC0);
	 // JumpGT: When ALU greaterthan zero
	 wire notNg;
	 notGate(ng, notNg);
	 andGate(notNg, jmpGT, CtoPC1);
	 //JumpLT: When ALU less than zero
	 andGate(ng, jmpLT, CtoPC2);
	 wire Ctp01;
	 orGate(CtoPC0, CtoPC1, Ctp01);
	 orGate(Ctp01, CtoPC2, CtoPC);
	 // Loads the ALU with the ALU instructions, for an A instruction this shouldn't matter
	 ALU(.x(D), .y(AM), .control(instruction[11:6]), .out(outM), .zr(zr), .ng(ng));
	 
	 // Registers and Counters
	 Register(.data(MuxAReg), .out(addressM), .clk(clk), .load(CtoAReg));
	 Register(.data(outM), .out(D), .clk(clk), .load(CtoDReg));
	 PC(.in(addressM), .load(CtoPC), .rst(rst), .clk(~clk), .inc(1), .out(pc));
	 
	 // Muxs
	 Mux16(outM, instruction, CtoMuxAReg, MuxAReg);
	 Mux16(addressM, inM, CtoMuxALU, AM);

    assign DOut = D;
endmodule

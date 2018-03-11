`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:54:18 03/08/2018 
// Design Name: 
// Module Name:    RAM8 
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
module RAM8(
    input [0:15] data,
    input load,
    input [0:2] address,
    input clk,
    output [0:15] out
    );
	 
	 /*
	 
	 Eh, in NAND logic, with the components I have thus far created the code would look a little like this:
	 For the larger RAM modules it would be the same, juts rather than generating registers you would generate
	 RAM8/64/512/4K. and you would use DMux8Way and Mux8Way16 to deal with the addressing in each
	 
	 wire [0:15] Out [0:7];
	 wire [0:8] DMuxOut;
	 
	 NOTE, the ram got too complex to properly load onto my FPGA
	 , will be using verilog features/Spartan-6 RAM modules here on out.
	 DMux8Way(load, address, DMuxOut[0], DMuxOut[2], DMuxOut[3], DMuxOut[4], DMuxOut[5], DMuxOut[6], DMuxOut[7]);
	 generate
	   genvar i;
		for(i = 0; i < 8; i=i+1)
		begin
		  Register(.data(data), .load(DMuxOut[i]), .out(Out[i]));
      end
    endgenerate
	 
	 (* KEEP_HIERARCHY = "YES" *)Mux8Way16(Out[0], Out[1], Out[2], Out[3], Out[4], Out[5], Out[6], Out[7], address, out);
*/

    // Using magic verilog syntax so compiler knows how to optimise
    // This technically, when synthisised, triggers in xilinx software
    // the use of the Block Ram in the FPGA to be used
	 // It uses the RAMB16BWER primitive, but I wrote the code in verilog rather than use this
	 // for the sake coursework marking.
	 // Doing this with slice registers would be imposible as I only have 11,440 of them.
    // As such, my ram is implemented the verilog way:
	 
    reg [0:15] Data [0:7];
    reg [0:15] Out;

    always @(posedge clk)
     begin
      if (load)
        begin
          Data[address] <= data;
        end
          Out <= Data[address];
     end

    assign out = Out;
endmodule

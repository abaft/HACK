`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:35:29 03/13/2018 
// Design Name: 
// Module Name:    seg7 
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
module seg7(
     input [3:0] bcd,
     output reg [6:0] seg
    );
	 
    always @(bcd)
    begin
        case (bcd) //case statement
            0 : seg = 7'b0111111;
            1 : seg = 7'b0001001;
            2 : seg = 7'b1011110;
            3 : seg = 7'b1011011;
            4 : seg = 7'b1101001;
            5 : seg = 7'b1110011;
            6 : seg = 7'b1110111;
            7 : seg = 7'b0011001;
            8 : seg = 7'b1111111;
            9 : seg = 7'b1111001;
            default : seg = 7'b1000000; 
        endcase
    end
    
endmodule
`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:13:13 03/09/2018 
// Design Name: 
// Module Name:    HACK 
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
module HACK(
    input [14:0] ROMAddressLineCtl,
	 input [15:0] ROMDataLine,
	 input ROMLoad,
	 input rst,
	 input clk,
	 output [14:0] PCout,
	 output [15:0] RAMOut
    );

reg [14:0] ROMAddressLine;
wire [15:0] ROMOut;
wire [14:0] PC;
wire [15:0] RAMDataLine;
wire [14:0] RAMAddressLine;
wire RAMLoad;
wire [15:0] RAMOut;

RAM16K ROM (.data(ROMDataLine), .clk(clk), .address(ROMAddressLine), .out(ROMOut), .load(ROMLoad));
RAM16K RAM (.data(RAMDataLine), .clk(clk), .address(RAMAddressLine), .out(RAMOut), .load(RAMLoad));

CPU HACK (.clk(clk), .rst(ROMLoad), .inM(RAMOut), .outM(RAMDataLine), .writeM(RAMLoad),
 .instruction(ROMOut), .pc(PC), .addressM(RAMAddressLine));
 
always @(negedge clk)
begin
  if (~ROMLoad)
  begin
  ROMAddressLine <= PC;
  end
  else
  begin
    ROMAddressLine <= ROMAddressLineCtl;
  end
end

assign PCOut = ROMAddressLine;
endmodule

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:11:12 02/01/2018 
// Design Name: 
// Module Name:    freqDivide 
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
module freqDivide #(parameter POW = 24, parameter SHIFT = 0) (
    input clk,
    input rst,
    output out_clk
    );
	 reg [POW - 1:0] counter;
	 
	 initial begin
  			counter <= #POW'd0 + SHIFT;
	 end

    always @(posedge clk)
       begin
      if (~rst) begin
  			counter <= #POW'd0 + SHIFT;
      end else begin
	      counter <= counter + 1;
      end
	 end
	
    assign out_clk = counter[POW-1];
    

endmodule

module mojo_top(
    // 50MHz clock input
    input clk,
    // Input from reset button (active low)
    input rst_n,
    // cclk input from AVR, high when AVR is ready
    input cclk,
    // Outputs to the 8 onboard LEDs
    output[7:0]led,
    // AVR SPI connections
    output spi_miso,
    input spi_ss,
    input spi_mosi,
    input spi_sck,
    // AVR ADC channel select
    output [3:0] spi_channel,
    // Serial connections
    input avr_tx, // AVR Tx => FPGA Rx
    output avr_rx, // AVR Rx => FPGA Tx
    input avr_rx_busy, // AVR Rx buffer full
    input [3:0] sw1,
	 input [3:0] sw2
	 );

wire rst = ~rst_n; // make reset active high

reg [7:0] LEDCTRL;

// these signals should be high-z when not used
assign spi_miso = 1'bz;
assign avr_rx = 1'bz;
assign spi_channel = 4'bzzzz;

assign led = LEDCTRL;

wire [7:0] AND;
wire [7:0] OR;
wire [7:0] NOT;
wire [7:0] XOR;
wire [7:0] MUX;
wire [7:0] DMUX;
wire [7:0] AND16;
wire [7:0] OR16;
wire [7:0] NOT16;
wire [7:0] MUX16;
wire [7:0] OR8WAY;
wire [7:0] MUX4WAY16;
wire [7:0] MUX8WAY16;
wire [7:0] DMUX4WAY;
wire [7:0] DMUX8WAY;

// AND GATE
andGate(sw2[0], sw2[1], AND);
// OR GATE
orGate(sw2[0], sw2[1], OR);
// NOT GATE
notGate(sw2[0], NOT);
// XOR GATE
xorGate(sw2[0], sw2[1], XOR);
// MUX GATE
mux(sw2[0], sw2[1], sw2[2], MUX);
// DMUX GATE
DMux(sw2[0], sw2[1], DMUX[0], DMUX[7:1]);
// AND16 GATE
And16({14'b0 ,sw2[1:0]}, {14'b0 ,sw2[3:2]}, AND16);
// OR16 GATE
Or16({14'b0 ,sw2[1:0]}, {14'b0 ,sw2[3:2]}, OR16);
// NOT16 GATE
Not16({'b111111111111 ,sw2[0], sw2[1], sw2[2], sw2[3]}, NOT16);
// MUX16 GATE (use RST button as switch)
Mux16({14'b0 ,sw2[1:0]}, {14'b0 ,sw2[3:2]}, rst, MUX16);
// Or8Way GATE
Or8Way({12'b0 ,sw2[0], sw2[1], sw2[2], sw2[3]}, OR8WAY);
// MUX4WAY
DMux4Way(sw2[0], sw2[2:1], DMUX4WAY[0],DMUX4WAY[1],DMUX4WAY[2],DMUX4WAY[3]);
// MUX8WAY
DMux8Way(sw2[0], sw2[3:1], DMUX8WAY[0],DMUX8WAY[1],DMUX8WAY[2],DMUX8WAY[3],DMUX8WAY[4],DMUX8WAY[5],DMUX8WAY[6],DMUX8WAY[7]);

always @(posedge clk) begin
  case(sw1)
    4'b0000: LEDCTRL <= AND;
	 4'b0001: LEDCTRL <= OR;
	 4'b0010: LEDCTRL <= NOT;
	 4'b0011: LEDCTRL <= XOR;
	 4'b0100: LEDCTRL <= MUX;
	 4'b0101: LEDCTRL <= DMUX;
	 4'b0110: LEDCTRL <= AND16;
	 4'b0111: LEDCTRL <= OR16;
	 4'b1000: LEDCTRL <= NOT16;
	 4'b1001: LEDCTRL <= MUX16;
	 4'b1010: LEDCTRL <= OR8WAY;
	 4'b1011: LEDCTRL <= 8'b10101011;
	 4'b1100: LEDCTRL <= 8'b10101100;
	 4'b1101: LEDCTRL <= DMUX4WAY;
	 4'b1110: LEDCTRL <= DMUX8WAY;
	 4'b1111: LEDCTRL <= 8'b10101111;
  endcase
end

//assign led = test_OUT[7:0];
endmodule
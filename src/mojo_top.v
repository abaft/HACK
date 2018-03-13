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
    output [6:0] Ones,
	 output [6:0] Tens,
	 output [6:0] Hundreds,
	 output [6:0] Thousends,
	 output [6:0] TenThousends,
	 output negIndicator,
	 input ROMLoad
	 );

wire rst = ~rst_n; // make reset active high

// these signals should be high-z when not used
assign spi_miso = 1'bz;
assign avr_rx = 1'bz;
assign spi_channel = 4'bzzzz;

//assign led = LEDCTRL;
wire slowClock;

assign led[7] = slowClock;
reg [15:0] PC;

freqDivide #(.POW(20)) (clk, 1, slowClock);

wire [15:0] DOut;

// HackComputer

HACK(
    .ROMAddressLineCtl(),
	 .ROMDataLine(),
	 .ROMLoad(ROMLoad),
	 .rst(rst),
	 .clk(slowClock),
	 .PCout(led[6:0]),
	 .DOut(DOut)
    );
	 
wire [3:0] bcd [4:0];
BCD(
    .binary(DOut), 
    .TenThousands(bcd[4]), 
    .Thousands(bcd[3]), 
    .Hundreds(bcd[2]), 
    .Tens(bcd[1]), 
    .Ones(bcd[0])
    );
	 
seg7  (
    .bcd(bcd[0]), 
    .seg(Ones)
    );
seg7  (
    .bcd(bcd[1]), 
    .seg(Tens)
    );
seg7  (
    .bcd(bcd[2]), 
    .seg(Hundreds)
    );
seg7  (
    .bcd(bcd[3]), 
    .seg(Thousends)
    );
seg7  (
    .bcd(bcd[4]), 
    .seg(TenThousends)
    );

//assign led[6:3] = DOut;
assign negIndicator = DOut[15];
endmodule
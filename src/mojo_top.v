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
    input avr_rx_busy // AVR Rx buffer full
    );

wire rst = ~rst_n; // make reset active high

reg [7:0] test_a;
reg [7:0] test_b;
reg [15:0] counter;

initial begin
 test_a = 'b00000010;
 test_b = 'b00000000;
end

wire [7:0] test_OUT;


// these signals should be high-z when not used
assign spi_miso = 1'bz;
assign avr_rx = 1'bz;
assign spi_channel = 4'bzzzz;

//assign led[4:1] = 4'b0;
//assign led[6] = 1;

//assign led[7] = rst;

//xorGate GA (led[7], led[6], led[5]);

generate
genvar i;
for (i=0; i < 8; i = i+1) begin
freqDivide #(.POW(21 + i), .SHIFT(2**(25) * i)) DV0 (clk, rst_n, led[i]);
end
endgenerate


//assign led = test_OUT[7:0];
endmodule
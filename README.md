This works, See the constraints file to know where to plug in the data loading switches if you actually want to flash this onto an FPGA.
It is a real pain to program, however is possible.

OK At the moment, hard coded into the ROM is the following program:

```
Data[0]  <= 16'b0000000000000001; # Sets A to 1
Data[1]  <= 16'b1110101010001000; # Sets RAM @1 to 0
Data[2]  <= 16'b0000000000000000; # Sets A to 0
Data[3]  <= 16'b1110111111011000; # Sets RAM @0 to 1
Data[4]  <= 16'b0000000000000001; # Sets A to 1
Data[5]  <= 16'b1111000010010000; # Sets D to D + M
Data[6]  <= 16'b0000000000000000; # Sets A to 0
Data[7]  <= 16'b1110001010000100; # Jumps to @0 in ROM if D < 0
Data[8]  <= 16'b1100001010000000; # Sets the OUTPUT register to D
Data[9]  <= 16'b0000000000000010; # Sets A to 2
Data[10] <= 16'b1110001010001000; # Sets RAM @2 to D
Data[11] <= 16'b0000000000000000; # Sets A to 0
Data[12] <= 16'b1111100010010000; # Sets D to RAM @0
Data[13] <= 16'b0000000000000001; # Sets A to 1
Data[14] <= 16'b1110001010001000; # Sets RAM @1 to D
Data[15] <= 16'b0000000000000010; # Sets A to 2
Data[16] <= 16'b1111100010010000; # Sets D to RAM @2
Data[17] <= 16'b0000000000000000; # Sets A to 0
Data[18] <= 16'b1110001010001000; # Sets RAM @0 to D
Data[19] <= 16'b0000000000000100; # Sets A to 4
Data[20] <= 16'b1110000000000111; # Jumps to @4 in ROM
```

This computes the fibonachi sequence to the maximum recordable by a 2s compliment 16 bit number and displays them sequentially on the output. It will repeate infinatly

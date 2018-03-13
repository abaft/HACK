This works, See the constraints file to know where to plug in the data loading switches if you actually want to flash this onto an FPGA.
It is a real pain to program, however is possible.

OK At the moment, hard coded into the ROM is the following program:

```
0: 16'b0000000000000011 # Sets A to 3
1: 16'b1110000000000000 # Do Nothing
2: 16'b1110101000010000 # Set D to 0
3: 16'b1110000010010000 # Adds A to D and sets result to D
4: 16'b1110101000000111 # Jumps to instruction 3
```

The D register is output on the LEDs, thus this preloaded program cycles through the 3 times table

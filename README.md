# comp1212 Coursework 1

## HowTo

The coursework was written with the Mojo v3, the binary file in the release of this project is a bitstream to program the SC6SLX9 FPGA chip from XilinX.

To set up the 'demo':

Pins 5-8 off the FPGA go to 4 switches, these switches control the mode (pin 8 is the most significant bit).

Next pins 9-12 off the FPGA go to 4 more switches, these are to act as inputs to the mode, the following table refers to the document specifying input variables for each bit (e.g. x,y,X,X means switch on pin 9 is x and switch on pin 10 is y and the other switches do nothing.)

The LEDs on the Mojo v3 board act as outputs and are specified similarly.

Switch Setting|Switch input|Mode|LED output
:------------:|:----------:|:--:|:--------:
0000|x,y,X,X|`AND`|X,X,X,X,X,X,X,out
0001|x,y,X,X|`OR`|X,X,X,X,X,X,X,out
0010|x,X,X,X|`NOT`|X,X,X,X,X,X,X,out
0011|x,y,X,X|`XOR`|X,X,X,X,X,X,X,out
0100|x,y,sel,X|`MUX`|X,X,X,X,X,X,X,out
0101|in,sel,X,X|`DMUX`|X,X,X,X,X,X,y,x
0110|x[0],x[1],y[0],y[1]|`AND16`|X,X,X,X,X,X,out[1],out[0]
0111|x[0],x[1],y[0],y[1]|`OR16`|X,X,X,X,X,X,out[1],out[0]
1000|x[0],x[1],x[2],x[3]|`NOT16`|X,X,X,X,out[3],out[2],out[1],out[0]
1001|x[0],x[1],y[0],y[1]|`MUX16`|X,X,X,X,X,X,out[1],out[0]
1010|x[0],x[1],x[2],x[3]|`OR8WAY`|X,X,X,X,out[3],out[2],out[1],out[0]
1011|X,X,X,X|`NONE`|X,X,X,X,X,X,X,X
1100|X,X,X,X|`NONE`|X,X,X,X,X,X,X,X
1101|in,sel[0],sel[1],X|`DMUX4WAY`|X,X,X,X,out[3],out[2],out[1],out[0]
1110|in,sel[0],sel[1],sel[2]|`DMUX8WAY`|out[7],out[6],out[5],out[4],out[3],out[2],out[1],out[0]
1111|X,X,X,X|`NONE`|X,X,X,X,X,X,X,X



# comp1212 Coursework 1

## HowTo

The coursework was written with the Mojo v3, the binary file in the root of this project is a bitstream to program the SC6SLX9 FPGA chip from XilinX.

To set up the 'demo':

Pins 5-8 off the FPGA go to 4 switches, these switches control the mode (pin 8 is the most significant bit).

Swich Setting|Mode
:-----------:|:--:
0000|`AND`
0001|`OR`
0010|`NOT`
0011|`XOR`
0100|`MUX`
0101|`DMUX`
0110|`AND16`
0111|`OR16`
1000|`NOT16`
1001|`MUX16`
1010|`OR8WAY`
1011|`NONE`
1100|`NONE`
1101|`DMUX4WAY`
1110|`DMUX8WAY`
1111|`NONE`

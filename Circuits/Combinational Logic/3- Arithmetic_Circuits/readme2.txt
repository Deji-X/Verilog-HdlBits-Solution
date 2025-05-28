Explanation of the 3-bit ripple-carry adder using a generate-for loop to instantiate three full adders (FA).
fa---------> Full Adder submodule.
Implements A 1-bit full adder using {cout, sum} = a+b+cin.
Riple-Carry Adder Logic;
The adder works by chaining three 1-bit full adders, where the "cout" of each stage becoms the cin of the
next.

Generate-For Loop; automates the instantiaition:
For i=0 LSB, the cin comes from the input port.
For i=1 and i-2, the cin is the cout of the previous stage (cout [i-1]).

Bit 0 (LSB):
Inputs : a[]

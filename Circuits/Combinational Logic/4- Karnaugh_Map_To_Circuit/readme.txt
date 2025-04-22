Verilog code for Karnaugh Maps..
Understanding DO NOT CARE KARNAUGH MAPS.


The electronics class of Lightning State College has been asked to build the lamp logic for a stationary bicycle exhibit at the local science museum. As a rider increases his pedaling speed, lamps will light on a bar graph display.

No lamps will light for no motion. As speed increases, the lower lamp, L1 lights, then L1 and L2, then, L1, L2, and L3, until all lamps light at the highest speed. Once all the lamps illuminate, no further increase in speed will have any effect on the display.

A small DC generator coupled to the bicycle tire outputs a voltage proportional to speed. It drives a tachometer board which limits the voltage at the high end of speed where all lamps light. No further increase in speed can increase the voltage beyond this level.

This is crucial because the downstream A to D (Analog to Digital) converter puts out a 3-bit code, ABC, 23 or 8-codes, but we only have five lamps. A is the most significant bit, C the least significant bit.

The lamp logic needs to respond to the six codes out of the A to D. For ABC=000, no motion, no lamps light. For the five codes (001 to 101) lamps L1, L1&L2, L1&L2&L3, up to all lamps will light, as speed, voltage, and the A to D code (ABC) increases.

We do not care about the response to input codes (110, 111) because these codes will never come out of the A to D due to the limiting in the tachometer block. We need to design five logic circuits to drive the five lamps.

Since, none of the lamps light for ABC=000 out of the A to D, enter a 0 in all K-maps for cell ABC=000. Since we don’t care about the never to be encountered codes (110, 111), enter asterisks into those two cells in all five K-maps.

Lamp L5 will only light for code ABC=101. Enter a 1 in that cell and five 0s into the remaining empty cells of L5 K-map.

L4 will light initially for code ABC=100, and will remain illuminated for any code greater, ABC=101, because all lamps below L5 will light when L5 lights. Enter 1s into cells 100 and 101 of the L4 map so that it will light for those codes. Four 0‘s fill the remaining L4 cells

L3 will initially light for code ABC=011. It will also light whenever L5 and L4 illuminate. Enter three 1s into cells 011, 100, 101 for L3 map. Fill three 0s into the remaining L3 cells.

L2 lights for ABC=010 and codes greater. Fill 1s into cells 010, 011, 100, 101, and two 0s in the remaining cells.

The only time L1 is not lighted is for no motion. There is already a 0 in cell ABC=000. All the other five cells receive 1s.

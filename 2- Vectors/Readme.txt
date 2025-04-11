Solution on the vector segment of vhdl bits....


*For 2- Vector1*
Implicit nets are always one-bit wires and causes bugs if you had intended to use a vector. 
Disabling creation of implicit nets can be done using the `default_nettype none directive.

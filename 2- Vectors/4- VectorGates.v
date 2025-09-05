module top_module(
  input  [2:0] a, b,                // Since a and b have the same number of bits, created them simulateanously.
  output [2:0] out_or_bitwise,      // Bitwise OR = |
  output out_or_logical,            // Logical OR = ||
  output [5:0] out_not,             // Bitwise NOT = ~
);
  assign out_or_bitwise = a | b;
  assign out_or_logical = a || b;
  assign out_not[5:3] = ~b;
  assign out_not[2:0] = ~a;

  /*
  concatenation here is how it works here;
  assign out_not = [ ~b, ~a];
  since the output is 6 bits and the inputs are 3 btis...so the compiler automatically,
  divides them, same goes for any other set of bits unless there is an overflow and 
  designated input to the output so you assign them specifically.
  */
endmodule

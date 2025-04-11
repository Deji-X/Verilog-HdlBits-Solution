module top_module(
  input  [2:0] a, b,
  output [2:0] out_or_bitwise, // Bitwise OR = |
  output out_or_logical, // Logical OR = ||
  output [5:0] out_not, // Bitwise NOT = ~
);
  

module top_module(
  input sel,
  input [7:0] a,
  input [7:0] b,
  output [7:0] out
);

  // assign out = ({8{~sel}} & a) | ({8{sel}} & b);
  // this is a solution I found online...mine is below and is easier to understand.
  // the above uses concantenation.

  assign out = sel ? a : b;

endmodule

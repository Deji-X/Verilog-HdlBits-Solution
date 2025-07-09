// Exams/ece241 2014 q1c

module top_module(
  input [7:0] a,
  input [7:0] b,
  output [7:0] s,
  output overflow
);

  assign s = a + b;
  assign overflow = [7];


endmodule

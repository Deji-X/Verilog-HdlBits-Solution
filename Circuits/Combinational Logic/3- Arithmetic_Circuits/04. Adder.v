// Exams/m2014 q4j

module top_module(
  input [3:0] x,
  input [3:0] y,
  output [4:0] sum
);

  FullAdder FA0 (x[0], y[0], sum[0]);
  FullAdder FA1 (x[1], y[1], sum[1]);
  FullAdder FA2 (x[2], y[2], sum[2]);
  FullAdder FA3 (x[3], y[3], sum[3]);

endmodule

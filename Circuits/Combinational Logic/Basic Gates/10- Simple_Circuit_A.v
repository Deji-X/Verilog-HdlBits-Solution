module top_module(
  input x,
  input y,
  output z,
);

  wire one_xor;

  assign one_xor = (x ^ y);
  assign z = one_xor & x;

endmodule

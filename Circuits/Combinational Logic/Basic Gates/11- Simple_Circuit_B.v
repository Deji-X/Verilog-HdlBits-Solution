module top_module(
  input  x,
  input  y,
  output z,
);

  //Circuit B is an XNOR Gate...

  assign z = ~(x ^ y);

endmodule

module top_module(
  input in1,
  input in2,
  input in3,
  output out
);

  wire i_xor;

  assign i_xor = ~(in1 ^ in2);
  assign out = i_xor ^ in3;

endmodule

module top_module(
  input a,
  input b,
  output out);
  assign out = ~(a ^ b);
  //(^) bitwise function for XNOR
endmodule

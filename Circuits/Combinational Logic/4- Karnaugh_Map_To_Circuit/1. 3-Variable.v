module top_module(
  input a,
  input b,
  input c,
  output out
);

  /* we get a or ~a&b or ~a&c
  Step 1: With the absorption theorem we get a or b or ~a&c 
  Step 2: With the absorption theorem again but for the first and third set(s) of
  variables we get a or b or c 
  */

  assign out = a | b | c;

endmodule

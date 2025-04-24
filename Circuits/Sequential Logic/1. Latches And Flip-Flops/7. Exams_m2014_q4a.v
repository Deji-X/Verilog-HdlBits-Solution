module top_module(
  input d,
  input ena,
  output q
);

  //D Latch. Latch differs from a Flip-flop.

  always @(*)
    if(ena) q<=d;

endmodule

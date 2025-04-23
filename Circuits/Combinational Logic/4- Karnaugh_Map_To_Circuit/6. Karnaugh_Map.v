module top_module(
  input [4:1] x,
  output f
);

  /*
  Apparently, there is no arrangement according to MSB, which was a let down, the wire
  is joined by name x[1]=x1, x[2]=x2 and so on...
  */
  assign f = (~x[1]&x[3]) | (x[3]&x[4]) | (x[2]&x[4]);

endmodule

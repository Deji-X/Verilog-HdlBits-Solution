module top_module(
  input [7:0] in,
  output[7:0] out,
);
  /*assign out[7:0] = in[0:7]; does not work because Verilog does not allow vector bit ordering to be flipped.
The concatenation operator may save a bit of coding, allowing for 1 assign statement instead of 8.*/

  assign out = {in[0], in[1], in[2], in[3], in[4], in[5], in[6], in[7]};
  /* Without the concatenation operator it will look like.....
  assign out[7] = in[0];
  assign out[6] = in[1];
  assign out[5] = in[2];
  assign out[4] = in[3];
  assign out[3] = in[4];
  assign out[2] = in[5];
  assign out[1] = in[6];
  assign out[0] = in[7];
  As explained this extremely cumbersome, hence we concatenate*/
endmodule

module top_module(
  input [7:0] in,
  output [31:0] out,
);
  
  
  assign out = { {24 {in[7]}} , in};
  /* concatenation of 24 copies of the sign bit (i.e., replicate bit[7] 24 times) followed by the 8-bit number itself.
     So the first bit says concatenate 24 copies of the 8 or MSB of the in, then the second just describes the 8-bit number
  */

endmodule

  

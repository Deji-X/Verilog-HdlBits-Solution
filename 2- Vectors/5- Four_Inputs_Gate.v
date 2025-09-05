module top_module(
  input [3:0] in,
  output out_and,
  output out_or,
  output out_xor
);
  assign out_and = in[3] & in[2] & in[1] & in[0];
  assign out_or = in[3] | in[2] | in[1] | in[0];
  assign out_xor = in[3] ^ in[2] ^ in[1] ^ in[0];
  
  
  /* another format;
  assign out_and = &in;
  assign out_or = |in;
  assign out_xor = ^in;
  */

  /*
  So this is another solution with concatenation, this comes at 05/09/2025
  months after my inital code...
  assign out_and = &{in[3], in[2], in[1], in[0]};
  assign out_or  = |{in[3], in[2], in[1], in[0]};
  assign out_xor = ^{in[3], in[2], in[1], in[0]};
  */
endmodule

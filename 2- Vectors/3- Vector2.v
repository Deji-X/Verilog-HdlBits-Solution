module top_module(
  input [31:0] in,
  output[31:0] out
);
  assign out[31:24] = in[7:0];
  assign out[23:16] = in[15:8];
  assign out[15:8] = in[23:16];
  assign out[7:0] = in[31:24];
// Again, order of assignment does not matter
  // Assign does not create the wires but a relationship between wires.
  // Hence, whichsoever you assign first bares no effect.
endmodule

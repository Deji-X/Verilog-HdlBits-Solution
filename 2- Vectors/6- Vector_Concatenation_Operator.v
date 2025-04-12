module top_module(
  input [4:0] a, b, c, d, e, f,
  output[7:0] w, x, y, z);
  
  wire [31:0] creg; //raise an error when work with reg. Reason unknown???
  assign creg = {a[4:0], b[4:0], c[4:0], d[4:0], e[4:0], f[4:0], 2'b11};
  assign w = creg[31:24];
  assign x = creg[23:16];
  assign y = creg[15:8];
  assign z = creg[7:0];

endmodule

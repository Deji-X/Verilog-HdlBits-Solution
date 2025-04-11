// Use of assign statement to drive each of the output wires

module top_module(
  input p1a, p1b, p1c, p1d, p1e, p1f,
  output p1y,
  input p2a, p2b, p2c, p2d,
  output p2y,
)
  assign p2y = (p2a & p2b) | (p2c & p2d);
  assign p1y = (p1a & p1c & p1b) | (p1f & p1e & p1d);
endmodule

// Use of declaration for 4 wires used as intermediate signals

module top_module(
  input p1a, p1b, p1c, p1d, p1e, p1f,
  output p1y,
  input p2a, p2b, p2c, p2d,
  output p2y,
)

  wire a_b;
  wire c_d;
  wire a_b_c;
  wire d_e_f;

  assign a_b = p2a & p2b;
  assign c_d = p2c & p2d;
  assign a_b_c = p1a & p1b & p1c;
  assign d_e_f = p1d & p1e & p1f;
  assign p2y = a_b | c_d;
  assign p1y = a_b_c | d_e_f;

endmodule

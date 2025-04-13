module top_module(
  input a,
  input b,
  output out);

  /*By Position
  mod_a instance_1 (a, b, out); */
  
  mod_a instance_2 (
    .out(out),
    .in1(a),
    .in2(b) );
  
endmodule

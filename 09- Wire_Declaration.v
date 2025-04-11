`default_nettype none
module top_module(
  //As circuits become more complex, you will need wires to connect internal components together.
  //When you need to use a wire, you should declare it in the body of the module, somewhere before it is first used.
  input a,
  input b,
  input c,
  input d,
  output out,
  output out_n
);
  wire a_b;    // Declare a wire "a and b"
  wire c_d;    // Declare a wire "c and d"
  wire ab_cd;  // Declare a wire "ab or cd"

  assign a_b = a & b;
  assign c_d = c & d;
  assign ab_cd = a_b | c_d;
  assign out = ab_cd;
  assign out_n = ~ ab_cd;
endmodule  

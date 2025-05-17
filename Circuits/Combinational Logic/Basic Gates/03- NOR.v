module top_module(
  input in1,
  input in2,
  output out
);

  wire xor1;

  assign xor1 = in1 | in2;
  assign out = ~xor1;

  

endmodule

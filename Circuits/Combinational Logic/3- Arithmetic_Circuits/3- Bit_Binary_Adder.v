module top_module(
  input [2:0] a. b.
  input cin,
  output [2:0] cout,
  output [2:0] sum
);

  FullAdder FA1 = (a[0], b[0], c[0], cout[0], sum[0]);
  FullAdder FA2 = (a[1], b[1], c[1], cout[1], sum[1]);
  FullAdder FA3 = (a[2], b[2], c[2], cout[2], sum[2]);

endmodule

  module FullAdder(
    input a, b, cin
    output cout, sum
  );
    
    assign cout = (a & b) | (a & cin) | (b & cin);
    assign sum = a ^ b ^ cin ; 

  endmodule

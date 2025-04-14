module top_module(
  input [31:0] a,
  input [31:0] b,
  input sub,
  output [31:0] sum
);
  
  wire [15:0] bsub;
  wire [15:0] cout1;
  wire [15:0] cout2;
  
  assign bsub = b ^ sub;
  
  add16 add1(a[15:0], sub[15:0], sub, sum[15:0], cout1);
  add16 add1(a[31:16], sub[31:16], cout1, sum[31:16], cout2);

endmodule

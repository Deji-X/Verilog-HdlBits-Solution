// Bcdadd4

module top_module(
  input [15:0] a,
  input [15:0] b,
  output cout,
  output [15:0] sum
);
  wire [15:0] cout;

  bcd_fadd bcd0 (a[3:0], b[3:0], 0, cout[3:0] , sum[3:0]);
  bcd_fadd bcd1 (a[7:4], b[7:4], cout[3:0], cout[7:4] , sum[7:4]);
  bcd_fadd bcd2 (a[11:8], b[11:8], cout[7:4], cout[11:8] , sum[11:8]);
  bcd_fadd bcd3 (a[15:12], b[15:12], cout[11:8], cout[15:12] , sum[15:12]);

endmodule

module bcd_fadd(
  input [3:0] a,
  input [3:0] b,
  input cin,
  output cout,
  output [3:0] sum
);

  assign sum = (a ^ b ^ cin);
  assign cout = (a&b) | (a&cin) | (b&cin);

  

endmodule

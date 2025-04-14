module top_module (
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);//
  
  wire cout1;
  wire cout2;

    
  add16 add_1(a[15:0], b[15:0], 0, sum[15:0], cout1);
  add16 add_2(a[31:16], b[31:16], cout1, sum[31:16], cout2);
endmodule

module add1 ( input a, input b, input cin,   output sum, output cout );

  assign sum = a ^ b ^ cin;
  // The sum formula of a full adder is a xor b xor cin
  
  assign cout = (a & b) | (a & cin) | (b & cin);
  // The cout formula of a full adder.

endmodule

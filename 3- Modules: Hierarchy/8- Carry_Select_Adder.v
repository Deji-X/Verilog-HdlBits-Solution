module top_module(
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);

  wire cout1;
  wire cout2;
  wire cout3;
  wire [31:16] sum2;
  wire [31:16] sum3;

  add16 add_1 ( a[15:0], b[15:0], 0, sum[15:0], cout1);
  add16 add_2 ( b[31:16], b[31:16], 0, sum2, cout2);
  add16 add_3 ( c[31:16], b[31:16], 1, sum3, cout3);

  always @ (*) begin
    case(cout1)
            0 : sum = sum2 ;
            1 : sum = sum3 ;
        endcase
  end

endmodule
    


  
endmodule

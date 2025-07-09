module top_module(
  input [399:0] a, b,
  input cin,
  input cout,
  output [399:0] sum
);

  wire [99:0] couts;

  genvar i;
  generate
    for (i=0; i<100; i++) begin:bdc_addr_instance
      if(i)
        bcd_fadd_insta (a[(4*i+3):(4*i)], b[(4*i+3):(4*i)], couts[i-1], couts[i], sum[(4*i+3):(4*i)]);

      else bcd_fadd_insta (a[3:0], b[3:0], cin, couts[0], sum[3:0]);
    end
  endgenerate

  assign cout = couts[99];

endmodule

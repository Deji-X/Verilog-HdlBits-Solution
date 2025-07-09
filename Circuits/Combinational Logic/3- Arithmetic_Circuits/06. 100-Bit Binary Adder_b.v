//A secondary solution.

module top_module(
  input [99:0] a, b,
  input cin,
  output cout,
  output [99:0] sum
);

  wire [98:0] Wcout;

  genvar i;
  Full_Adder FA1 (a[0], b[0], 0, Wcout[0], sum[0]);
  Full_Adder FA2 (a[99], b[99], Wcout[98], cout, sum[99]);

  generate
    for (i=1; i<99; i++) begin:Full_Adder_FA
      Full_Adder FA (a[i], b[i], Wcout[i-1], Wcout[i], sum[i]);
    end
  endgenerate

endmodule

module Full_Adder(
  input a,
  input b,
  input cin,
  output cout,
  output sum
);
  assign {cout,sum} = a + b + cin;

endmodule

module top_module(
  input x,
  input clk,
  output z
);

  wire D1, Q1;
  wire D2, Q2;
  wire D3, Q3;

  assign D1 = (x ^ Q1);
  assign D2 = (x & ~Q2);
  assign D3 = (x | ~Q3);

  assign z = ~(Q1 | Q2 | Q3);

  always @ (posedge clk) begin 
    Q1 <= D1;
    Q2 <= D2;
    Q3 <= D3;
  end

endmodule

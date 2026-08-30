// Counter 1000

module top_module(
  input clk,
  input reset,
  output OneHertz,
  output [2:0] c_enable
);

  wire [3:0] w1, w2, w3;

  bcdcount counter0 (clk, reset, c_enable[0]);
  bcdcount counter1 (clk, reset, c_enable[1]);
  bcdcount counter2 (clk, reset, c_enable[2]);

endmodule

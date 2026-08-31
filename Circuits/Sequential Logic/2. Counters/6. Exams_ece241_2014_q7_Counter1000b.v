// Counter 1000

module top_module(
  input clk,
  input reset,
  output OneHertz,
  output [2:0] c_enable
);

  wire [3:0] W1, W2, W3;

  assign c_enable[0] = 1'b1;
  assign c_enable[1] = c_enable[0] && (W1 == 4'd9);
  assign c_enable[2] = c_enable[1] && (W2 == 4'd9);

  assign OneHertz = 1'b1 && (W1 == 4'd9) && (W2 == 4'd9) && (W3 == 4'd9);
  // assign OneHertz = c_enable[2] && (W3 == 4'd9); 

  bcdcount counter0 (clk, reset, c_enable[0], W1);
  bcdcount counter1 (clk, reset, c_enable[1], W2);
  bcdcount counter2 (clk, reset, c_enable[2], W3);

endmodule

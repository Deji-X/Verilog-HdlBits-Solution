module top_module(
  input clk,
  input d;
  output reg q
);

  /*Use a clocked always block
  Copy d to q at every positive edge of clk
  Clocked always blocks should use non-blocking assignments
  */

  always @ (posedge clk) begin
    q <= d;
  end
  
endmodule

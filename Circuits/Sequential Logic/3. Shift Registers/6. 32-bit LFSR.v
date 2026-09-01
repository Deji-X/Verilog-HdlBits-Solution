module top_module(
  input clk,
  input reset,
  output [31:0] q
);
  always @(posedge clk) begin
    if (reset) begin
      q <= q[31:1];
    end
    else begin
      if (q[0]) begin
        q <= {} 

endmodule

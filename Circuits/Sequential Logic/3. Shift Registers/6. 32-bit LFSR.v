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
        q <= {q[0], q[31:1]} ^  32'h10000000001000000000000000000011;
      end
      else begin
        q <= {q[0], q[31:1]};
      end
    end
  end

endmodule

module top_module(
  input clk,
  input reset,
  output [31:0] q
);
  always @(posedge clk) begin
    if (reset) begin
      q <= 32'h1;
    end
    else begin
      if (q[0]) begin
          q <= {q[0] ^ 1'b1, q[31:1]} ^ 32'h80200003;
      end
      else begin
          q <= {q[0], q[31:1]};
      end
    end
  end
  /*
  always @(posedge clk) begin
    if (reset) begin
        q <= 32'h1;
    end
    else begin
        if (q[0]) begin
            q <= {1'b0, q[31:1]} ^ 32'h80200003;
        end
        else begin
            q <= {1'b0, q[31:1]};
        end
    end
end*/

endmodule

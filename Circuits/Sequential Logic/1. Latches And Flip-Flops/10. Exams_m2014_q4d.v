module top_module(
  input clk,
  input in,
  output out
);

  wire D;
  wire Q;

  assign Q = out;
  assign D = (in ^ Q);
  /*
  I created a wire for Q to make the implementation straight forward.
  Look at the wire as a Q' of Q, but did not name the wire to Q.
  */

  always @ (posedge clk) begin
    out <= D;
  end

endmodule

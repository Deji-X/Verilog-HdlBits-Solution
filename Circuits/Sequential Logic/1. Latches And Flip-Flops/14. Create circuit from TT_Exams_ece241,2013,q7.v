module top_module(
  input clk,
  input j,
  input k,
  output Q
);

  always @ (posedge clk) begin
    Q <= ((j&~Q) | (~k&Q));
    //This is a simplified, version of the formula:
    //The formula is ((j&~Q&c) | (~k|~c)&Q); clk==c
    //But clk is posedge, hence c=1 and ~c=0, hence the initial formula.
  end

endmodule

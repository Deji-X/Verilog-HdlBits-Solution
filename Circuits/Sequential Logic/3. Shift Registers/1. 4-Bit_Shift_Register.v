module top_module(
  input clk,
  input areset, // async-high reset to zero
  input load,
  input ena,
  input [3:0] data,
  output reg [3:0] q
);

  always @(posedge clk or posedge areset) begin
    if(areset)
      q <= 0;
    else if(load)
      q <= data;
    else if (ena)
      q <= q[3:1];
  end
    /*else
      q <= ena ? q>>1 : q;
  end
  */

endmodule

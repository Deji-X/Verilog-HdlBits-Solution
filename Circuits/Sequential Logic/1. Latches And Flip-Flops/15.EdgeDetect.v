module top_module(
  input clk,
  input [7:0] in,
  input [7:0] pedge
);
  reg [7:0] not_pedge;

  always @ (posedge clk) begin
    not_pedge <= in;
    pedge <= in & ~not_pedge;
  end

endmodule

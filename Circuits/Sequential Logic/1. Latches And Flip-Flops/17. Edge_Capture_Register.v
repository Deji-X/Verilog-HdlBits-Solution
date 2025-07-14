module top_module(
  input clk,
  input [31:0] in,
  output [31:0] out
);

  reg [31:0] SR;
  always @ (posedge clk) begin
    SR  <= in;
    out <= reset ? 0 : ((~in&SR) | out);
  end

  

endmodule

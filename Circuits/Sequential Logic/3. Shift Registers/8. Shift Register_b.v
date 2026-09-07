module top_module(
  input [3:0] SW,
  input [3:0] KEY,
  output [3:0] LEDR
);
  MUXDFF inst3(
    .R(SW[3]),
    .clk(KEY[0]),
    .E(KEY[1]),
    .L(KEY[2]),
    .w(KEY[3]),
    .Q(LEDR[3])
  );

  MUXDFF inst2(
    .R(SW[2]),
    .clk(KEY[0]),
    .E(KEY[1]),
    .L(KEY[2]),
    .w(LEDR[3]),
    .Q(LEDR[2])
  );

  MUXDFF inst1(
    .R(SW[1]),
    .clk(KEY[0]),
    .E(KEY[1]),
    .L(KEY[2]),
    .w(LEDR[2]),
    .Q(LEDR[1])
  );

  MUXDFF inst0(
    .R(SW[0]),
    .clk(KEY[0]),
    .E(KEY[1]),
    .L(KEY[2]),
    .w(LEDR[1]),
    .Q(LEDR[0])
  );

  always @(posedge clk) begin
        case ({E, L})
            2'b00: Q <= Q;
            2'b01: Q <= R;
            2'b10: Q <= w;
            2'b11: Q <= R;
        endcase
    end

endmodule

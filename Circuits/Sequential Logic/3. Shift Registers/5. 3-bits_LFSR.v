//Mt2015 lfsr

module top_module(
  input [2:0] SW, // R
  input [1:0] KEY, // L and clk
  output [2:0] LEDR // Q
);
  reg Q0, Q1, Q2;
  reg r0, r1, r2;
  reg D0, D1, D2;
  wire MUX2, L, Clock;

  assign MUX2 = (Q2 ^ Q1);
  assign {r2, r1, r0} = SW[2:0];
  assign {L, Clock} = KEY[1:0];
  assign {LEDR[2], LEDR[1], LEDR[0]} = {Q2, Q1, Q0}; 

  assign D0 = (L==0) ? Q2:r0;
  assign D1 = (L==0) ? Q0:r1;
  assign D2 = (L==0) ? MUX2:r2;

  always @(posedge Clock) begin
    case (L)
        1'b0: begin
            Q0 <= Q2;
            Q1 <= Q0;
            Q2 <= Q1 ^ Q2;
        end

        1'b1: begin
            Q0 <= r0;
            Q1 <= r1;
            Q2 <= r2;
        end
    endcase
  end

  /*
  always @(posedge Clock) begin
        Q0 <= D0;
        Q1 <= D1;
        Q2 <= D2;
    end
  */

endmodule

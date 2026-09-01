//Exams/m2014 q4k
module top_module(
  input clk,
  input resetn,  // Synchronous reset
  input in,
  output out
);
  wire Q0, Q1, Q2, Q3;
  wire D0, D1, D2, D3;

    reg q0, q1, q2;

    always @(posedge clk) begin
        if (reset)
            q0 <= 1'b0;
        else
            q0 <= ~q0;
    end

    always @(posedge q0) begin
        if (reset)
            q1 <= 1'b0;
        else
            q1 <= ~q1;
    end

    always @(posedge q1) begin
        if (reset)
            q2 <= 1'b0;
        else
            q2 <= ~q2;
    end

    assign q = {q2, q1, q0};

endmodule

endmodule

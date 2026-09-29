// Note the Verilog-1995 modyle declaration syntax here:
module top_module(clk, reset, in, out);
  input clk;
  input reset;
  input in;
  output out;
  reg out;

  parameter A=0, B=1;

  reg present_state, next_state;

  always @ (posedge clk) begin
    if (reset) begin
      present_state = B;
      out = 1'b1;
      
      end else begin
        case (present_state)
          A: next_state = in ? A : B;
          B: next_state = in ? B : A;
          endcase

        // State flip-flops
        present_state = next_state;

        case (present_state)
          A: out = 1'b0;
          B: out = 1'b1;
        endcase
      end
  end

endmodule

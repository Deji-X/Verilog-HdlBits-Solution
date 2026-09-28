module top_module(
    input clk,
    input in,
    input reset,
    output out); //
    
    parameter A=0, B=1, C=2, D=3;
    reg [3:0] state, next_state;
    
    // State transition logic
    assign next_state[A] = (~in & (state[A] | state[C]));
    assign next_state[B] = (in & (state[A] | state[B] | state[D]));
    assign next_state[C] = (~in & (state[B] | state[D]));
    assign next_state[D] = (in & (state[C]));

  

    // State flip-flops with synchronous reset
    always @(posedge clk) begin
        if (reset)
            state <= 4'b0001;
        else
            state <= next_state;
    end

    // Output logic
    assign out = state[D];

endmodule

/*
    PART 2 of my solution. Using CASES
    
  parameter A=0, B=1, C=2, D=3;
  reg [1:0] state, next_state;

  always@(*) begin
    case (state)
        A: next_state = in ? B : A;
        B: next_state = in ? B : C;
        C: next_state = in ? D : A;
        D: next_state = in ? B : C;
    endcase
  end


  always@(posedge clk) begin
      if (reset)
          state = A;
      else
          state = next_state;
       end

       assign out = (state == D);
  */

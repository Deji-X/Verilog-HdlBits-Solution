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

  // Q inouts
  assign Q0 = q0;
  assign Q1 = q1;
  assign Q2 = q2;
  assign Q3 = q3;
  
  // D inputs
  assign D0 = in;
  assign D1 = QO;
  assign D2 = Q1;
  assign D3 = Q2;

  // Four D flip-flops
  always @(posedge clk) begin
    if (!resetn) begin
      q0 <= 1'b0;
      q1 <= 1'b0;
      q2 <= 1'b0;
      q3 <= 1'b0;
    end
    else begin
      q0 <= D1;
      q1 <= D2;
      q2 <= D3;
      q3 <= D3;
    end
  end

  assign out = Q3;

endmodule
  
/*
HDLBITS SOLUTION, I WILL SUGGEST THIS, MINE WAS FROM MY UNDERSTANDING PER-BLOCK THEIRS IS MORE BEHAVIOURAL
reg [3:0] sr;
	
	// Create a shift register named sr. It shifts in "in".
	always @(posedge clk) begin
		if (~resetn)		// Synchronous active-low reset
			sr <= 0;
		else 
			sr <= {sr[2:0], in};
	end
	
	assign out = sr[3];		// Output the final bit (sr[3])*/

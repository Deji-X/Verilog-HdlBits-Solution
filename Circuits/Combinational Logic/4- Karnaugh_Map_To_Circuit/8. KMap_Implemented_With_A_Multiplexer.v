module top_module(
  input c,
  input d
  output [3:0] mux_in
);
  /*solving the kmap gives;
  a'b'c + a'b'd + ab'd' + abcd
  a and b are select variables
  */

  // After splitting the truth table into four columns,
	// the rest of this question involves implementing logic functions
	// using only multiplexers (no other gates).
	// I will use the conditional operator for each 2-to-1 mux: (s ? a : b)

  assign mux_in[0] = c ? 1 : d;          // 1 mux:   c|d
	assign mux_in[1] = 0;                  // No muxes:  0
	assign mux_in[2] = d ? 0 : 1;          // 1 mux:    ~d
	assign mux_in[3] = c ? d : 0;          // 1 mux:   c&d
endmodule

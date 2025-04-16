/*A priority encoder is a combinational circuit that,
when given an input bit vector,
outputs the position of the first 1 bit in the vector.
For example,
a 8-bit priority encoder given the input 8'b10010000 would output 3'd4,
because bit[4] is first bit that is high.
Build a 4-bit priority encoder.
For this problem, if none of the input bits are high (i.e., input is zero), output zero.
Note that a 4-bit number has 16 possible combinations.
*/
// synthesis verilog_input_version verilog_2001
module top_module(
  input      [3:0] in,
  output reg [1:0] pos
);

  always @(*) begin			// Combinational always block
		case (in)
			4'h0: pos = 2'h0;	// I like hexadecimal because it saves typing.
			4'h1: pos = 2'h0;
			4'h2: pos = 2'h1;
			4'h3: pos = 2'h0;
			4'h4: pos = 2'h2;
			4'h5: pos = 2'h0;
			4'h6: pos = 2'h1;
			4'h7: pos = 2'h0;
			4'h8: pos = 2'h3;
			4'h9: pos = 2'h0;
			4'ha: pos = 2'h1;
			4'hb: pos = 2'h0;
			4'hc: pos = 2'h2;
			4'hd: pos = 2'h0;
			4'he: pos = 2'h1;
			4'hf: pos = 2'h0;
			default: pos = 2'b0;	// Default case is not strictly necessary because all 16 combinations are covered.
		endcase
	end

  /*
   always @(*) begin
        if (in[0]==1'b1)
            pos = 0;
        else if (in[1]==1'b1)
            pos = 1;
        else if (in[2]==1'b1)
            pos = 2;
        else if (in[3]==1'b1)
            pos = 3;
        else
            pos = 0;
    end*/
    //a shorter version if you like, runs well no errors
  

endmodule

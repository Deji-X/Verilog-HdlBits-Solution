// Exams/m2014 q4j

module top_module(
  input [3:0] x,
  input [3:0] y,
  output [4:0] sum
);
	wire [3:0] cout;

	FA FA1 (x[0], y[0], 0, cout[0], sum[0]);
	FA FA2 (x[1], y[1], cout[0], cout[1]. sum[1]);
	FA FA3 (x[2], y[2], cout[1], cout[2], sum[2]);
	FA FA4 (x[3], y[3], cout[2], sum[4], sum[3]);

endmodule

module FA(
	input x,
	input y,
	input cin,
	output cout,
	output sum
);
	assign {cout,sum} = (x+y+cin);

endmodule
	
/*
  //There is another Solution including the genvar function...I WILL GET THE CODE AS SOON AS POSSIBLE

	// This circuit is a 4-bit ripple-carry adder with carry-out.
	assign sum = x+y;	// Verilog addition automatically produces the carry-out bit.

	// Verilog quirk: Even though the value of (x+y) includes the carry-out, (x+y) is still considered to be a 4-bit number (The max width of the two operands).
	// This is correct:
	// assign sum = (x+y);
	// But this is incorrect:
	// assign sum = {x+y};	// Concatenation operator: This discards the carry-out

	wire cout [3:0];
	genvar i;
	generate
		for (i=0; i<4; i++) begin:fa
			if(i!=0) fa inst(x[i], y[i], cout[i-1], sum[i], cout[i]);

			else fa inst(x[0], y[0], 0, sum[0], cout[0]);
		end
	endgenerate

	assign sum[4] = cout[3];
endmodule

module fa(input x,
	  input y,
	  input cin,
	  output sum,
	  output cout);

	assign sum = (x^y^z);
	assign cout = [x&y] | [x&cin] | [y&cin];
	// assign {cout, sum} = x+y+cin;
*/
endmodule



module top_module(
  input  x,
  input  y,
  output z,
);
wire z1;
wire z2;
wire z3;
wire z4;
	
  A ia1 (x, y, z1);
  B ib1 (x, y, z2);
  A ia2 (x, y, z3);
  B ib2 (x, y, z4);
	
  assign z = (z1 | z2) ^ (z3 & z4);

	// Or you could simplify the circuit including the sub-modules:
	// assign z = x|~y;
	
endmodule

module A (
	input x,
	input y,
	output z);

	assign z = (x^y) & x;
	
endmodule

module B (
	input x,
	input y,
	output z);

	assign z = ~(x^y);

endmodule
  

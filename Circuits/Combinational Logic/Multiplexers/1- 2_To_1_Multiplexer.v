module top_module(
  input a, b, sel,
  output out
);

  assign out = (sel==0) ? a : b;
  /*
  assign out = (sel & b) | (~sel & a);	// Mux expressed as AND and OR
  */
  // Quite smart if you ask me.
  
endmodule

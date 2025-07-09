// Adder100

module top_module(
  input [99:0] a, b,
  input cin,
  output cout,
  output [99:0] sum
);
  //This a 100 bit number, I am not going to write a function for 100 bits each,
  //hence, genvar i...generate.
  //wait, I just solved {04.Adder_b.v} and Hint says to look at the solution, see:

  assign {cout,sum} = a + b + cin; //Booyahhhh it works.

  

endmodule

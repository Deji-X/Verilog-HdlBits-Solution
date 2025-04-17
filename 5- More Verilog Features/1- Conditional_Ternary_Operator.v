module top_module (
    input [7:0] a, b, c, d,
    output [7:0] min);

  //(condition ? if_true : if_false)
  //This can be used to choose one of two values based on condition (a mux!) on one line,
  //without using an if-then inside a combinational always block.

endmodule

//Fsm3onehot

module top_module(
  input in,
  input [3:0] state,
  output [3:0] next_state,
  output out
);

  parameter A=0, B=1, C=2, D=3;

  //this is just brilliant, reminded me to be humble and go back to the basics..

  assign next_state[A] = ~in & (state[A] | state[C]);
  assign next_state[B] = in & (state[A] | state[B] | state[D]);
  assign next_state[C] = ~in & (state[B] | state[D]);
  assign next_state[D] = in & state[C];

  assign out = state[D];


endmodule

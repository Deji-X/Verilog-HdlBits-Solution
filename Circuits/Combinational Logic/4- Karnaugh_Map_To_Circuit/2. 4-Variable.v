module top_module(
  input a,
  input b,
  input c,
  input d,
  output out
);

  /* All my reduction techniques and equations are in my personal note, you can email
  for it (henry6769wisdom@gmail.com) used a hybrid of MCCLUSKEY algorithm and equation
  in something I call Wisdom's correctional proof, do check the main readme, I might
  have completed the fullnote and left a drive link....*/

  assign out = (~a&~d) | (~b&~c) | (~a&b&c) | (a&c&d); //SOP
  //assign out = (~a|~b|c|d) & (~a|b|~c|d) & (a|~b|c|~d) & (a|b|~c|~d) & (a|b|~c|d) & (a|b|c|~d);

endmodule

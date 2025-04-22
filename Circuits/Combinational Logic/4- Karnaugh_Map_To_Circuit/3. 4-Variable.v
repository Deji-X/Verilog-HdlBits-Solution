module top_module(
  input a,
  input b,
  input c,
  input d,
  output out
);
// For Do not care situations, only rule, do not have cells filled with DNC
// conditions as the odd of all happening at the same time is extremely rare...

  assign out = (a | (~b&c)); //SOP
  /* assign out = ~a&b | ~a&~c; POS
  */

endmodule
  

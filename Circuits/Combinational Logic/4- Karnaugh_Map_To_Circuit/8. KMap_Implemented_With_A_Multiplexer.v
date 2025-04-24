module top_module(
  input c,
  input d
  output [3:0] mux_in
);
  /*solving the kmap gives;
  a'b'c + a'b'd + ab'd' + abcd
  a and b are select variables
  */

  assign mux_in[0] = c ? 1 : d;
  assign mux_in[1] = 0;
  assign mux_in[2] = d ? 0 : 1;
  assign mux_in[3] = c ? d : 0
endmodule

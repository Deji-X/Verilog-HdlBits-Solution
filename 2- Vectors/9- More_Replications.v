module top_module(
  input a, b, c, d, e,
  output [24:0] out);

  assign out = ~{{{5{a}}, {5{b}}, {5{c}}, {5{d}}, {5{e}} ^ {5{a,b,c,d,e}}};
  /*The output is XNOR of two vectors created by 
  concatenating and replicating the five inputs. */

endmodule

/* The suggested solution, added it because it is quite unique add makes use of wires
wire [24:0] top, bottom;
assign top = {{5{a}}, {5{b}}, {5{c}}, {5{d}}, {5{e}} };
assign bottom = {5{a,b,c,d,e}};
assign out = ~top ^ bottom;
beautiful, right?... I think this is the professional way to go, unless under a timer
*/

module top_module (
    input [7:0] a, b, c, d,
    output [7:0] min);

  //(condition ? if_true : if_false)
  //This can be used to choose one of two values based on condition (a mux!) on one line,
  //without using an if-then inside a combinational always block.
  /*Examples:

(0 ? 3 : 5)     // This is 5 because the condition is false.
(sel ? b : a)   // A 2-to-1 multiplexer between a and b selected by sel.

always @(posedge clk)         // A T-flip-flop.
  q <= toggle ? ~q : q;

always @(*)                   // State transition logic for a one-input FSM
  case (state)
    A: next = w ? B : A;
    B: next = w ? A : B;
  endcase

assign out = ena ? q : 1'bz;  // A tri-state buffer

((sel[1:0] == 2'h0) ? a :     // A 3-to-1 mux
 (sel[1:0] == 2'h1) ? b :
                      c )
*/
    wire [7:0] unsigned0;
    wire [7:0] unsigned1;
    
    //condition ? if_true : if_false
    assign int1 = (a<b)? a:b; 
    assign int2 = (unsigned0<c)? unsigned0:c;
    assign min  = (unsigned1<d)? unsigned1:d;
    



    
endmodule

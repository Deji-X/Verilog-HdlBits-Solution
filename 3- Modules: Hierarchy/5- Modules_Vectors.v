module top_module(
  input clk,
  input [1:0] sel,
  input [7:0] d,
  output [7:0] q
);

  wire [7:0] three, two, one;
  
  my_dff8 ff1(.clk(clk), .d(d), .q(one));
  my_dff8 ff2(.clk(clk), .d(one), .q(two));
  my_dff8 ff3(.clk(clk), .d(two), .q(three));

  always @ (sel or in) begin
        case(sel)
            0 : q = d ;
            1 : q = one;
            2 : q = two;
            3 : q = three;
        endcase
        
        /*if(sel==2'b00)
            q=d;
        else if( sel == 2'b01)
      		q = con1;
        else if( sel == 2'b10)
      		q = con2;
        else if( sel == 2'b11)
      		q = con3;
 		*/
 	end

endmodule
